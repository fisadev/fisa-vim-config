" File: pythonhelper.vim
" Author: Michal Vitecek <fuf-at-mageo-dot-cz>
" Version: 0.83
" Last Modified: Jan 4, 2010
"
" Overview
" --------
" Vim script to help moving around in larger Python source files. It displays
" current class, method or function the cursor is placed in on the status
" line for every python file. It's more clever than Yegappan Lakshmanan's
" taglist.vim because it takes into account indetation and comments to
" determine what tag the cursor is placed in.
"
" Requirements
" ------------
" This script needs only VIM compiled with Python interpreter. It doesn't rely
" on exuberant ctags utility. You can determine whether your VIM has Python
" support by issuing command :ver and looking for +python in the list of
" features.
"
" Installation
" ------------
" 1. Make sure your Vim has python feature on (+python). If not, you will need
"    to recompile it with --with-pythoninterp option to the configure script
" 2. Copy script pythonhelper.vim to the $HOME/.vim/plugin directory
" 3. Run Vim and open any python file.
" 
python << EOS

# import of required modules {{{
import re
import sys
import time
import traceback
import vim
# }}}


# global dictionaries of tags and their line numbers, keys are buffer numbers {{{
TAGS            = {}
TAGLINENUMBERS  = {}
BUFFERTICKS     = {}
# }}}


# class PythonTag() {{{
class PythonTag(object):
    # DOC {{{
    """A simple storage class representing a python tag.
    """
    # }}}


    # STATIC VARIABLES {{{
    
    # possible tag types {{{
    TT_CLASS                    = 0
    TT_METHOD                   = 1
    TT_FUNCTION                 = 2
    # }}}

    # tag type names {{{
    TAG_TYPE_NAME               = {
        TT_CLASS                : "class",
        TT_METHOD               : "method",
        TT_FUNCTION             : "function",
    }
    # }}}

    # }}}


    # METHODS {{{
    
    def __init__(self, type, name, fullName, lineNumber, indentLevel):
        # DOC {{{
        """Initializes instances of PythonTag().

        Parameters
            
            type -- tag type

            name -- short tag name

            fullName -- full tag name (in dotted notation)

            lineNumber -- line number on which the tag starts

            indentLevel -- indentation level of the tag
        """
        # }}}

        # CODE {{{
        # remember the settings {{{
        self.type               = type
        self.name               = name
        self.fullName           = fullName
        self.lineNumber         = lineNumber
        self.indentLevel        = indentLevel
        # }}}
        # }}}


    def __str__(self):
        # DOC {{{
        """Returns a string representation of the tag.
        """
        # }}}

        # CODE {{{
        return "%s (%s) [%s, %u, %u]" % (self.name, PythonTag.TAG_TYPE_NAME[self.type],
                                         self.fullName, self.lineNumber, self.indentLevel,)
        # }}}


    __repr__ = __str__


    # }}}
# }}}
        

# class SimplePythonTagsParser() {{{ 
class SimplePythonTagsParser(object):
    # DOC {{{
    """Provides a simple python tag parser.
    """
    # }}}


    # STATIC VARIABLES {{{

    # how many chars a single tab represents (visually)
    TABSIZE                     = 8
    # regexp used to extract indentation and strip comments
    COMMENTS_INDENT_RE          = re.compile('([ \t]*)([^\n#]*).*')
    # regexp used to extract a class name
    CLASS_RE                    = re.compile('class[ \t]+([^(:]+).*')
    # regexp used to extract a method or function name
    METHOD_RE                   = re.compile('def[ \t]+([^(]+).*')

    # }}}


    # METHODS {{{
    
    def __init__(self, source):
        # DOC {{{
        """Initializes instances of SimplePythonTagsParser().

        Parameters

            source -- source for which the tags will be generated. It must
                provide callable method readline (i.e. as file objects do).
        """
        # }}}

        # CODE {{{
        # make sure source has readline() method {{{
        if ((hasattr(source, 'readline') == 0) or
            (callable(source.readline) == 0)):
            raise AttributeError("Source must have callable readline method.")
        # }}}
                
        # remember what the source is
        self.source = source
        # }}}

    
    def getTags(self):
        # DOC {{{
        """Determines all the tags for the buffer. Returns a tuple in format
        (tagLineNumbers, tags,).
        """
        # }}}

        # CODE {{{
        # initialize the resulting list of the tag line numbers and the tag information {{{
        tagLineNumbers  = []
        tags            = {}
        # }}}

        # initalize local auxiliary variables {{{
        tagsStack       = []
        lineNumber      = 0
        # }}}
        
        # go through all the lines in the source and localize all python tags in it {{{
        while 1:
            # get next line
            line = self.source.readline()

            # finish if this is the end of the source {{{
            if (line == ''):
                break
            # }}}

            # increase the line number
            lineNumber += 1

            # extract the line indentation characters and its content {{{
            lineMatch           = self.COMMENTS_INDENT_RE.match(line)
            lineContent         = lineMatch.group(2)
            # }}}

            # handle the class tag {{{
            # match for the class tag
            tagMatch = self.CLASS_RE.match(lineContent)

            # if the class tag has been found, store some information on it {{{
            if (tagMatch):
                currentTag = self.getPythonTag(tagsStack, lineNumber, lineMatch.group(1),
                                               tagMatch.group(1), self.tagClassTypeDecidingMethod)
                tagLineNumbers.append(lineNumber)
                tags[lineNumber] = currentTag
            # }}}
            # }}}
            # handle the function/method/none tag {{{
            else:
                # match for the method/function tag
                tagMatch = self.METHOD_RE.match(lineContent)

                # if the method/function tag has been found, store some information on it {{{
                if (tagMatch):
                    currentTag = self.getPythonTag(tagsStack, lineNumber, lineMatch.group(1),
                                                   tagMatch.group(1), self.tagFunctionTypeDecidingMethod)
                    tagLineNumbers.append(lineNumber)
                    tags[lineNumber] = currentTag
                # }}}
            # }}}
        # }}}

        # return the tags data for the source
        return (tagLineNumbers, tags,)
        # }}}


    def getParentTag(self, tagsStack):
        # DOC {{{
        """Returns the parent/enclosing tag (instance of PythonTag()) from the
        specified tag list. If no such parent tag exists, returns None.

        Parameters

            tagsStack -- list (stack) of currently open PythonTag() instances
        """
        # }}}

        # CODE {{{
        # determine the parent tag {{{
        if (len(tagsStack)):
            parentTag = tagsStack[-1]
        else:
            parentTag = None
        # }}}
         
        # return the tag
        return parentTag
        # }}}


    def computeIndentationLevel(indentChars):
        # DOC {{{
        """Computes the indentation level from the specified string.

        Parameters

            indentChars -- white space before any other character on line
        """
        # }}}

        # CODE {{{
        # initialize the indentation level
        indentLevel = 0

        # compute the indentation level (expand tabs) {{{
        for char in indentChars:
            if (char == '\t'):
                indentLevel += SimplePythonTagsParser.TABSIZE
            else:
                indentLevel += 1
        # }}}

        # return the computed indentation level
        return indentLevel
        # }}}
    computeIndentationLevel = staticmethod(computeIndentationLevel)


    def getPythonTag(self, tagsStack, lineNumber, indentChars, tagName, tagTypeDecidingMethod):
        # DOC {{{
        """Returns instance of PythonTag() based on the specified data.

        Parameters

            tagsStack -- list (stack) of tags currently active. Note: Modified
                in this method!

            lineNumber -- current line number

            indentChars -- characters making up the indentation level of the
                current tag

            tagName -- short name of the current tag

            tagTypeDecidingMethod -- reference to method that is called to
                determine the type of the current tag
        """
        # }}}

        # CODE {{{
        # compute the indentation level
        indentLevel = self.computeIndentationLevel(indentChars)
        # get the parent tag
        parentTag = self.getParentTag(tagsStack)

        # handle an enclosed tag {{{
        while (parentTag):
            # if the indent level of the parent tag is greater than of the current tag, use parent tag of the parent tag {{{
            if (parentTag.indentLevel >= indentLevel):
                del tagsStack[-1]
            # }}}
            # otherwise we have all information on the current tag and can return it {{{
            else:
                # create the tag
                tag = PythonTag(tagTypeDecidingMethod(parentTag.type), tagName, "%s.%s" % (parentTag.fullName, tagName,), lineNumber, indentLevel)

                # break the loop
                break
            # }}}

            # use parent tag of the parent tag
            parentTag = self.getParentTag(tagsStack)
        # }}}
        # handle a top-indent level tag {{{
        else:
            # create the tag
            tag = PythonTag(tagTypeDecidingMethod(None), tagName, tagName, lineNumber, indentLevel)
        # }}}

        # add the tag to the list of tags
        tagsStack.append(tag)

        # return the tag
        return tag
        # }}}


    def tagClassTypeDecidingMethod(self, parentTagType):
        # DOC {{{
        """Returns tag type of the current tag based on its previous tag (super
        tag) for classes.

        Parameters

            parentTagType -- type of the enclosing/parent tag
        """
        # }}}

        # CODE {{{
        # is always class no matter what
        return PythonTag.TT_CLASS
        # }}}


    def tagFunctionTypeDecidingMethod(self, parentTagType):
        # DOC {{{
        """Returns tag type of the current tag based on its previous tag (super
        tag) for functions/methods.

        Parameters
        
            parentTagType -- type of the enclosing/parent tag
        """
        # }}}

        # CODE {{{
        if (parentTagType == PythonTag.TT_CLASS):
            return PythonTag.TT_METHOD
        else:
            return PythonTag.TT_FUNCTION
        # }}}


    # }}}
# }}}


# class VimReadlineBuffer() {{{
class VimReadlineBuffer(object):
    # DOC {{{
    """A simple wrapper class around vim's buffer that provides readline
    method.
    """
    # }}}


    # METHODS {{{

    def __init__(self, vimBuffer):
        # DOC {{{
        """Initializes instances of VimReadlineBuffer().

        Parameters

            vimBuffer -- VIM's buffer
        """
        # }}}

        # CODE {{{
        # remember the settings
        self.vimBuffer          = vimBuffer

        # initialize instance attributes {{{
        self.currentLine        = -1
        self.bufferLines        = len(vimBuffer)
        # }}}
        # }}}


    def readline(self):
        # DOC {{{
        """Returns next line from the buffer. If all the buffer has been read,
        returns empty string.
        """
        # }}}

        # CODE {{{
        # increase the current line counter
        self.currentLine += 1

        # notify end of file if we reached beyond the last line {{{
        if (self.currentLine == self.bufferLines):
            return ''
        # }}}

        # return the line with an added newline (vim stores the lines without it)
        return "%s\n" % (self.vimBuffer[self.currentLine],)
        # }}}

    
    # }}}
# }}}


def getNearestLineIndex(row, tagLineNumbers):
    # DOC {{{
    """Returns the index of line in 'tagLineNumbers' list that is nearest to the
    specified cursor row.

    Parameters

	row -- current cursor row

	tagLineNumbers -- list of tags' line numbers (ie. their position)
    """
    # }}}

    # CODE {{{
    # initialize local auxiliary variables {{{
    nearestLineNumber   = -1
    nearestLineIndex    = -1
    # }}}

    # go through all tag line numbers and find the one nearest to the specified row {{{
    for lineIndex, lineNumber in enumerate(tagLineNumbers):
	# if the current line is nearer the current cursor position, take it {{{
	if (nearestLineNumber < lineNumber <= row):
	    nearestLineNumber   = lineNumber
            nearestLineIndex    = lineIndex
	# }}}

	# if we've got past the current cursor position, let's end the search {{{
	if (lineNumber >= row):
	    break
	# }}}
    # }}}

    # return index of the line with the nearest tag
    return nearestLineIndex
    # }}}


def getTags(bufferNumber, changedTick):
    # DOC {{{
    """Reads the tags for the specified buffer number. Returns a tuple
    (taglinenumber[buffer], tags[buffer],).

    Parameters

	bufferNumber -- number of the current buffer

	changedTick -- ever increasing number used to tell if the buffer has
	    been modified since the last time
    """
    # }}}

    # CODE {{{
    # define global variables
    global TAGLINENUMBERS, TAGS, BUFFERTICKS

    # return immediately if there's no need to update the tags {{{
    if (BUFFERTICKS.get(bufferNumber, None) == changedTick):
	return (TAGLINENUMBERS[bufferNumber], TAGS[bufferNumber],)
    # }}}

    # get the tags {{{
    simpleTagsParser = SimplePythonTagsParser(VimReadlineBuffer(vim.current.buffer))
    tagLineNumbers, tags = simpleTagsParser.getTags()
    # }}}

    # update the global variables {{{
    TAGS[bufferNumber]                  = tags
    TAGLINENUMBERS[bufferNumber]        = tagLineNumbers
    BUFFERTICKS[bufferNumber]           = changedTick
    # }}}

    # return the tuple (tagLineNumbers, tags,)
    return (tagLineNumbers, tags,)
    # }}}


def findTag(bufferNumber, changedTick):
    # DOC {{{
    """Tries to find the best tag for the current cursor position.

    Parameters

	bufferNumber -- number of the current buffer

	changedTick -- ever increasing number used to tell if the buffer has
	    been modified since the last time
    """
    # }}}

    # CODE {{{
    # try to find the best tag {{{
    try:
	# get the tags data for the current buffer
	tagLineNumbers, tags = getTags(bufferNumber, changedTick)

	# link to vim's internal data {{{
	currentBuffer = vim.current.buffer
	currentWindow = vim.current.window
	row, col = currentWindow.cursor
	# }}}

	# get the index of the nearest line
	nearestLineIndex = getNearestLineIndex(row, tagLineNumbers)

	# if any line was found, try to find if the tag is appropriate {{{
	# (ie. the cursor can be below the last tag but on a code that has nothing
	# to do with the tag, because it's indented differently, in such case no
	# appropriate tag has been found.)
        while (nearestLineIndex > -1):
            # get the line number of the nearest tag
            nearestLineNumber = tagLineNumbers[nearestLineIndex]

            # walk through all the lines in range (nearestTagLine, cursorRow) {{{
            for lineNumber in xrange(nearestLineNumber + 1, row):
                # get the current line
                line = currentBuffer[lineNumber]

                # count the indentation of the line, if it's lower than the tag's, the tag is invalid {{{
                if (len(line)):
                    # initialize local auxiliary variables {{{
                    lineStart   = 0
                    i           = 0
                    # }}}

                    # compute the indentation of the line {{{
                    while ((i < len(line)) and (line[i].isspace())):
                        # move the start of the line code {{{
                        if (line[i] == '\t'):
                            lineStart += SimplePythonTagsParser.TABSIZE
                        else:
                            lineStart += 1
                        # }}}

                        # go to the next character on the line
                        i += 1
                    # }}}

                    # if the line contains only spaces, skip it {{{
                    if (i == len(line)):
                        continue
                    # }}}
                    # if the next character is a '#' (python comment), skip the line {{{
                    if (line[i] == '#'):
                        continue
                    # }}}

                    # if the line's indentation starts before or at the nearest tag's one, the tag is invalid {{{
                    if (lineStart <= tags[nearestLineNumber].indentLevel):
                        nearestLineIndex -= 1
                        break
                    # }}}
                # }}}
            # }}}
            # the tag is appropriate, so use it {{{
            else:
                break
	    # }}}
        # }}}
        # no appropriate tag has been found {{{
	else:
	    nearestLineNumber = -1
	# }}}
	 
	# describe the cursor position (what tag the cursor is on) {{{
        # reset the description
	tagDescription = ""

        # if an appropriate tag has been found, set the description accordingly {{{
	if (nearestLineNumber > -1):
	    tagInfo = tags[nearestLineNumber]
	    tagDescription = "[in %s (%s)]" % (tagInfo.fullName, PythonTag.TAG_TYPE_NAME[tagInfo.type],)
	# }}}
	# }}}

	# update the variable for the status line so it get updated with the new description
	vim.command("let w:PHStatusLine=\"%s\"" % (tagDescription,))
    # }}}

    # handle possible exceptions {{{
    except Exception:
        # bury into the traceback {{{
	ec, ei, tb = sys.exc_info()
	while (tb != None):
	    if (tb.tb_next == None):
		break
	    tb = tb.tb_next
        # }}}

        # spit out the error {{{
	print "ERROR: %s %s %s:%u" % (ec.__name__, ei, tb.tb_frame.f_code.co_filename, tb.tb_lineno,)
	time.sleep(0.5)
        # }}}
    # }}}
    # }}}


def deleteTags(bufferNumber):
    # DOC {{{
    """Removes tags data for the specified buffer number.

    Parameters

        bufferNumber -- number of the buffer
    """
    # }}}

    # CODE {{{
    # define global variables
    global TAGS, TAGLINENUMBERS, BUFFERTICKS
    
    # try to delete the tags for the buffer {{{
    try:
        del TAGS[bufferNumber]
        del TAGLINENUMBERS[bufferNumber]
        del BUFFERTICKS[bufferNumber]
    except:
        pass
    # }}}
    # }}}


EOS

" VIM functions {{{

function! PHCursorHold()
    " only python is supported {{{
    if (!exists('b:current_syntax') || (b:current_syntax != 'python'))
	let w:PHStatusLine = ''
	return
    endif
    " }}}
    
    " call python function findTag() with the current buffer number and changed ticks
    execute 'python findTag(' . expand("<abuf>") . ', ' . b:changedtick . ')'
endfunction


function! PHBufferDelete()
    " set PHStatusLine for this window to empty string
    let w:PHStatusLine = ""
    
    " call python function deleteTags() with the cur
    execute 'python deleteTags(' . expand("<abuf>") . ')'
endfunction


function! TagInStatusLine()
    " return value of w:PHStatusLine in case it's set
    if (exists("w:PHStatusLine"))
        return w:PHStatusLine
    " otherwise just return empty string
    else
        return ""
    endif
endfunction


function! PHPreviousClassMethod()
    call search('^[ \t]*\(class\|def\)\>', 'bw')
endfunction


function! PHNextClassMethod()
    call search('^[ \t]*\(class\|def\)\>', 'w')
endfunction


function! PHPreviousClass()
    call search('^[ \t]*class\>', 'bw')
endfunction


function! PHNextClass()
    call search('^[ \t]*class\>', 'w')
endfunction


function! PHPreviousMethod()
    call search('^[ \t]*def\>', 'bw')
endfunction


function! PHNextMethod()
    call search('^[ \t]*def\>', 'w')
endfunction

" }}}


" event binding, vim customizing {{{

" autocommands binding
autocmd CursorHold * call PHCursorHold()
autocmd CursorHoldI * call PHCursorHold()
autocmd BufDelete * silent call PHBufferDelete()

" time that determines after how long time of no activity the CursorHold event
" is fired up
set updatetime=1000

" color of the current tag in the status line (bold cyan on black)
highlight User1 gui=bold guifg=cyan guibg=black
" color of the modified flag in the status line (bold black on red)
highlight User2 gui=bold guifg=black guibg=red
" the status line will be displayed for every window
set laststatus=2
" set the status line to display some useful information
set stl=%-f%r\ %2*%m%*\ \ \ \ %1*%{TagInStatusLine()}%*%=[%l:%c]\ \ \ \ [buf\ %n]

" }}}

" vim:foldmethod=marker
