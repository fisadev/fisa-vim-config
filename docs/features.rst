Most important features include:

* **Plugins managed using Vim-plug**! You can easily install or remove plugins, and they are installed into ``.vim/plugged/``. More info `here <https://github.com/junegunn/vim-plug>`_

* **Smart autocompletion as you type**, sometimes using python instrospection (completion of module names, instance methods and attributes) and sometimes text-based (used words) (from version 4.0, it's even more intelligent! (if you enable rope)). And with neocomplcache, it even can autocomplete with typos, thanks to the fuzzy completion settings.

* **Fuzzy file, code and command finder** (like Textmante or Sublime Text 2):

  * ``,e`` = open file (like the original :e) but with recursive and fuzzy file name matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with ``Ctrl-t``!
  * ``,g`` = fuzzy symbol finder (classes, methods, variables, functions, ...) on the current file. Example: if you type "usr" it will find the User class definition on the current file. ``,G`` does the same but on all opened files.
  * ``,c`` = fuzzy command finder (internal vim commands, or custom commands). Example: if you type "diff" it will find ``:GitDiff``, ``:diffthis``, and many other similar commands.
  * ``,f`` = fuzzy text finder on all the opened files. Example: if you type "ctm=6" it will find the line containing "current_time = 16".
  * ``,m`` = fuzzy finder of most recently used files.
  * ``,we``, ``,wg``, ``,wc``, ``,wf`` and ``,wm`` = same as ``,e``, ``,g``, ``,c``, ``,f`` and ``,wm`` but initiate the search with the word under the cursor (also the upper case version of ``,G``, ``,wG``). Is useful to think about the ``,wg`` as a "fuzzy go to definition" (if the definition is in the same file, or ``,wG`` if the definition is on any of the opened files).
  * ``,pe`` = same as ``,e`` but initiates the search with the path under the cursor.


* **Ropevim for really neat python goodies!**:

  * **Go to definition** with ``,d``, or open the definition on a new tab with ``,D``.
  * **Find occurrences** with ``,o``.
  * and many other things, learn more about them with ``:help ropevim.txt`` (or visiting `this site <https://bitbucket.org/agr/ropevim>`_).
  * **Note:** to use ropevim you must enable rope on the ``.vimrc`` (search the line containing ``let g:pymode_rope = 0``). When enabled, I recommend you to launch vim from your project root for the first time, so the ``.ropeproject`` will be created there. Then you can also add new python paths on the created ``.ropeproject/config.py`` for better autocompletion and go-to-definition.
 

* **Classes/module browser** that lists classes, functions, methods, and such of the current file, and navigates to them when ENTER is pressed. Toggle it with ``F4``.

* **Pending tasks browser** pressing ``F2``. This reads the current file searching for comments that start with "TODO", "FIXME", and such, and shows them on a list that allows navigation similar to the class browser.

* **Error checking of code** using Syntastic (it will detect unused variables or imports, syntax errors, and such), for several languages, highlighting the errors and warnings in the code. You can open an errors list with ``\e``. In python, the error checking includes **pep8** validation, and **pylint**.

* **Grep code recursively** and navigate the results:

  * ``,r`` uses the ack command (a kind of grep optimized for code search), lists the found matches, and allows you to open them with ENTER.
  * ``,wr`` does the same, but searching the word under the cursor.

* Some settings for better **tabs and spaces handling**.

* **Better file browser**, toggle it with ``F3``, or open it with your current file selected using ``,t``.

* **Results count** while searching text.

* **Search and read python documentation** with the ``:Pydoc`` command. Example: ``:Pydoc collections`` (also works over the current word with vim's default help keybinding: ``Shift-K``).

* **Comment and uncomment code** with ``\ci``.

* **Easy tab navigation**:

  * ``tt`` = new tab and leaves the cursor waiting to specify the file path to open (leave blank to open an empty tab).
  * ``tn`` or ``Ctrl-Shift-Right`` = next tab.
  * ``tp`` or ``Ctrl-Shift-Left`` = previous tab.
  * ``tm`` = move current tab to a specific position (or to the end if no position number is specified).
  * ``tl`` = show a list of current tabs with their inner windows on a side pane. You can navigate them!
  * ``ts`` = duplicate current tab.

  The mappings starting with the ``t`` letter work only on command mode, but the mappings with ``Ctrl-Shift`` work on both, command and insert mode.

* **Easy window navigation** using ``Alt-arrows`` keys.

* Some vim goodies enabled by default:

  * **incremental search** (moves to the first result while you are typing).
  * **highlighted search results**.
  * **line numbers**.
  * keep **cursor 3 lines away from screen border while scrolling**.
  * **shell-like autocompletion of commands and paths** (autocomplete the common part and show matching options).
  * **syntax highlighting on** by default.

* **Python interpreter inside vim**, or any other console. They are opened as a buffer using the command ``:ConqueTerm``. Examples: ``:ConqueTerm python``, ``:ConqueTerm bash``.

* **Save current file as sudo** using ``:w!!``.

* **Navigate html/xml tags** the same way that you navigate (), {} and []: using ``%``.

* **Beautiful status line allways visible**, with colors, breadcrumbs and useful information about file type, encoding and position. When working with python files, it also displays the current python function or class where the cursor is.

* **Automatically removes trailing spaces** when saving python files.

* **Smart autoclosing of (, [, and {**

* **Beautiful color schemes for on vim with 256 colors (fisa colorscheme) and gvim (wombat colorscheme)**.

* **Use of 256 colors** when possible.

* **2 spaces indentation for html and javascript** (can disable it removing two lines from the ``.vimrc``).

* **Thousands of code snippets for many languages** with SnipMate. Example, in python you can write ``cl`` and press ``tab`` (while in inser mode), and it will insert the boilerplate code of a common python class (then use ``tab`` to navigate the snippet fields).

* **Zen coding** for html: generate lots of html code writing simple and short expressions.
  Example:

  1. write ``#books>ul>li.book*5>a``
  2. press ``Ctrl-y ,``
  3. it will generate:

     ::

      <div id="books">
          <ul>
              <li class="book">
                  <a href=""></a>
              </li>
              <li class="book">
                  <a href=""></a>
              </li>
              <li class="book">
                  <a href=""></a>
              </li>
              <li class="book">
                  <a href=""></a>
              </li>
              <li class="book">
                  <a href=""></a>
              </li>
          </ul>
      </div>

  Learn more on the plugin `site <https://github.com/mattn/zencoding-vim/>`_.

* **Git and other vcs integration**, with commands such as: ``:GitStatus``, ``:GitDiff``, ``:GitBlame``, ``:GitLog``, ``:GitCommit``, or simply ``:Git`` with your own command. Key mappings and syntax highlighting for git displays. Displays icons on the side of each line based on the result of a diff of the current file (example: if you added a line and still didn't commit the file, that line will have a green ``+`` on its side). And finally, when on a changed file you can **jump through changes** using ``\sn`` and ``\sp``.

* **Better python indentation**.

* Really neat **surround actions** using the surround.vim plugin. Learn how to use it `here <https://github.com/tpope/vim-surround>`_.

* **Indentation defined text objects** for the editing language, named ``i``. For example, you can change an entire indented code block with ``cii``, or the indented block and its header line with ``cai`` (also yank, delete, ...).

* **Indentation based movements**, move to the header of your current python block with ``[-``, to the end of the block with ``]-``, and more (short reference `here <https://github.com/jeetsukumaran/vim-indentwise>`_).

* **Python class and method/function text objects** for the editing language, named ``C`` and ``M``. For example, you can change an entire function content with ``ciM``, or delete a class including its header with ``daC``.

* **Run the curren python file** and display the output on a split with ``\r``.

* **Insert and remove ipdb breakpoints** with ``\b``.

* **Copy history navigation** using the YankRing plugin, which allows you to cicle the vim clipboard with ``Ctrl-p`` and ``Ctrl-n``, and many other features (described `here <http://www.vim.org/scripts/script.php?script_id=1234>`_).

* **Insert ipdb breakpoints** with ``\b``.

* **Automatically sort python imports** using ``:Isort``.

* **Persistent undos** modify file, exit vim, reopen file, and you can undo changes done on the previous session.

* **Better paths** for temporary swap files, backups, and persistent undos (all of them stored under ``~/.vim/dirs``).

* **Drag visual blocks** (blocks selected on ``Ctrl-v`` and ``Shift-v`` visual modes) with ``Shift-Alt-arrows``, or even **duplicate** them with ``D``.

* **Simple window chooser**: press ``-`` and you will see big green letters for each window. Just press the letter of the window you want to activate.

* **Paint css color** values with the actual color.

* **Format Python code** using yapf (``:YapfFullFormat`` formats the whole file, and has other commands as well, explained `here <https://github.com/pignacio/vim-yapf-format>`_. **Works only if you have a vim compiled with python 2, not python 3**).


