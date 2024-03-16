Changelog
---------

**Versions 9.1 to 11.1** where NeoVim exclusive versions. Before that there are Vim exclusive versions, 
and from **12.1** onwards, this config works both with Vim and NeoVim :)

* 12.2.1

  * Fix transparent background for some modern terminal apps like Alacritty

* 12.2.0

  * Lots of performance gains by replacing the colorizer plugin (the one that paints CSS colors with their actual color)

* 12.1.0

  * Fix: use the correct python interpreter when in NeoVim
  * Ability to set a transparent background (to use the terminal app background color), by setting transparent_background = 1

* 12.0.1

  * Fix for change in deoplete config format.

* 12.0.0  THE BIG UNIFICATION

  * Many of the changes are from the merge of the NeoVim config into the Vim config, so not new if you were using the NeoVim config. 
    If you were using the Vim version, I recommend you look down until version 9.1 to see more details. 
    But here are the main changes.
  * Replaced CtrlP with Fzf.vim for all the fuzzy finding features.
  * Replaced Vim-git with Fugitive for the git integration.
  * Deoplete is the new aotucompletion engine. Faster, because it's async.
  * Replaced Syntastic with NeoMake, also faster because of asynciness.
  * Removed some plugins and configs that had very little use (you can add them if you use them!):
      * Tabman (vertical tab manager).
      * SnipMate (code snippets).
      * Dragvisuals (visually move blocks of code).
      * YAPF (Python code formatter).
      * Tab length exceptions on some file types.
  * Changed tab movement shortcuts: now just use Alt+horizontal arrows to move between tabs.
  * Removed window movement mappings, which had a lot of conflicts with different terminals and environments.
  * Use NerdFonts for the fancy symbols, no more need for manual font patching.
  * Added vim-polyglot plugin (better language packs).
  * The emmet-vim plugin is back (fancy html generation).
  * Code checks assume python3 by default (you can comment the settings after "Check code as python3 by default").
  * Added optional nice file icons using Devicons.
  * Load custom configs at the end of the file, if present.
  * Mapping to add python breakpoints with ipdb (but easily configurable to something else).
  * Fancy symbols control with a setting!

* 11.1

  * Disable annoying inline error messages from neomake (the ones appearing next to the code lines)

* 11.0

  * Mapping to add python breakpoints with ipdb (but easily configurable to something else).
  * Added optional nice file icons.
  * Load custom configs at the end of the file, if present.
  * Fancy symbols tutorial now points to Nerd Fonts, far easier.
  * Installation now recommends using an appimage release.
  * Changelog inverted, easier to read :D
  * Docker image should now be available.

* 10.0

  * Finally out of beta!
  * Code checks assume python3 by default (you can comment the settings after "Check code as python3 by default").
  * Fixed issues with using other shells that aren't bash.
  * Nicer vertical line separator.

* Beta 9.5

  * Added vim-polyglot plugin.
  * The emmet-vim plugin is back.
  * Changed the location of the YankRing.vim plugin's history file.
  * Updated Plug paths pointing to vim-scripts (old way of just the plugin name is deprecated).

* Beta 9.4

  * Remove legacy CtrlP code.
  * Fixed a problem of yankring and system clipboard non-text data.

* Beta 9.3

  * Small website and readme fixes.

* Beta 9.2

  * Small doc, links and website fixes.

* Beta 9.1

  * First public beta of the NeoVim config!

* Version 8.3.1

  * Updated Plug paths pointing to vim-scripts (old way of just the plugin name is deprecated).

* Version 8.3

  * Removed python-mode, added jedi-vim which works far better

* Version 8.2

  * Added custom configs by folder plugin

* Version 8.1

  * Added indentation based movements plugin

* Version 8.0

  * New plugin manager! Vim-plug, which **requires a clean installation**
  * CtrlP replaced with newer version (different repository)
  * Added the Ack plugin, with replaced mappings from the old greppers to this new plugin (**new requirement: ack-grep**)
  * Removed the old unused and problematic Vim-debug plugin
  * Added Yapf formatter plugin (**new python requirement: yapf**)
  * Config version added to .vimrc
  * New project homepage! (code in gh-pages branch), installation instructions simplified, gif with main features, the rest removed from home
  * Repo and docs new organization: docs in specific folder, readme points to webpage, and webpage points to specific bits of docs

* Version 7.1.4

  * Web file formats (html, js) use 4 spaces for tabs, not 2 (too many complaints, better to go with the standard)
  * Added 'nodemodules' to the dirs to ignore on autocompletion
  * Able to use 256 colors if under neovim
  * Updated airline repo address, and added the airline themes plugin (PR by @orges)

* Version 7.1.3

  * Fixed typo (PR #75)

* Version 7.1.2

  * Fixed typo (PR #74)
  * Removed duplicated line (PR #70)

* Version 7.1.1

  * Disable preview window by default, to avoid flicker

* Version 7.1

  * Added plugin to paint css color definitions with the actual color

* Version 7.0

  * Added window chooser plugin
  * Replaced git-gutter with vim-signify
  * Replaced pyflakes with syntastic
  * Code polishing (sections, comments)

* Version 6.5

  * Added dragvisuals plugin and mappings/settings
  * Persistent undos
  * Mapping to open NERDTree positioned on the current file
  * Moved temporary files to internal vim folders

* Version 6.4

  * Restored isort pip dependency, due to changes in vim-isort (**new python package dependency: isort**)

* Version 6.3

  * Fixed python linter mappings (python-mode changed commands)

* Version 6.2

  * Fixed goto definition mappings (python-mode changed commands)

* Version 6.1

  * Updated docs for font patching
  * Updated setting name of python-mode

* Version 6.0

  * Back to python-mode, the (rope powered) completion is better than jedi-vim
  * Removed a bunch of plugins that are replaced by python-mode
  * SnipMate plugin mapping back to the default (``tab``)
  * Replaced AutoComplPop with NeoComplCache, for better and fuzzy completion
  * Removed isort python dependency, because the latest vim-isort includes it

* Version 5.3

  * Fixed problem with SnipMate and AutocomplPop, changing the mapping for SnipMate

* Version 5.2

  * Added python imports sorter (**new python package dependency: isort**)

* Version 5.1

  * Replaced vim-powerline with vim-airline
  * New font patching method
  * Added screenshots to the repo
  * Updated docs and screenshots

* Version 5.0.4

  * Add mapping for ipdb breakpoints insert
  * Removed default mappings of vim-debug
  * Removed python-mode from the references (no longer used)

* Version 5.0.3

  * Fix fuzzy symbol finder map, changed jedi-vim go to assignment map
  * Syntax highlighting on by default

* Version 5.0.2

  * Fix trailing whitespaces cleaner regex

* Version 5.0.1

  * Fix tabs behaviour of go to definition

* Version 5.0

  * Replaced python-mode with jedi-vim plus some old removed plugins (pydoc, flake8, indentpython)
  * Hidden YankRing history file
  * Removed old legacy completion configs
  * Fixed problems between jedi-vim and GitGutter
  * Fixed problems between jedi-vim and SnipMate (to do this, had to change the SnipMate mapping)
  * Fixed problems between jedi-vim and AutocomplPop

* Version 4.5.2

  * ZenMode repo was moved, updated it

* Version 4.5.1

  * Fixed 2 space tabs on html and javascript

* Version 4.5

  * Added fuzzy command finder

* Version 4.4.4

  * Just updated the link to the CPMono font on the README

* Version 4.4.3

  * SnipMate snippets repo was moved, updated it

* Version 4.4.2

  * Updating references to plugin sources
  * Small comment and quotes changes

* Version 4.4.1

  * Small doc fixes

* Version 4.4

  * New mappings for duplicating tabs, and go to definition in new tab
  * Added relative numbering plugin, but disabled by default
  * Better update instructions
  * Added snipmate and snippets repos
  * Added support for screen-256 on 256 colors theme selection
  * Added plugin to display git diff icons of current file on the side of each line

* Version 4.3

  * Removed SearchComplete plugin, because it breaks search history navigation

* Version 4.2

  * Rope disabled by default

* Version 4.1

  * "Completition" is wrong, the correct word is "completion" :)

* Version 4.0

  * added python-mode! this:
    * replaces the old better python indentation
    * adds smarter autocompletition
    * adds smarter go to definition and find occurrences
    * adds python motion and operators for the editing language
    * replaces the old better python highlighting
    * adds ipdb breakpoints utility
    * adds refactor utilities
    * replaces the old python documentation finder
    * replaces the old offline pep8 and lint checkers
  * The ``tabm`` mapping allows specifying the tab number
  * Ignore .pyc and .pyo files on NERDTree
  * Pep8 checker now runs with ``\8`` instead of ``,8`` (the ``,`` mappings will be only for navigation and searching)
  * Fixed autoinstalation source link
  * Added font name below the screenshots
  * Added vim itself as dependency on the instalation tutorial

* Version 3.8

  * Added indentation defined text object plugin
  * Added search autocompletition plugin
  * Added yank history plugin

* Version 3.7.1

  * Fix ESC behaviour on popups when autoclose is enabled

* Version 3.7

  * New autoclosing plugin, that doesn't breaks undo history
  * Better python indentation

* Version 3.6

  * Reverted leader usage, to mantain compatibility with many plugins

* Version 3.5

  * Added surround.vim plugin
  * File ignores for fuzzy file finder
  * Mapping for MRU fuzzy finder with current word
  * Usage of leader instead of harcoded mapping prefixes

* Version 3.4

  * Shortcut for most recently used fuzzy finder
  * Fixed vim-debug problems with vundle
  * Fixed mapping incompatibilities
  * Minor documentation changes

* Version 3.3

  * RecurGrepFast runs silently (doesn't need the extra ENTER)
  * Window navigation with Alt-arrows
  * Tabs navigation with Ctrl-Shift-arrows
  * New ConqueTerm, now working

* Version 3.2

  * Mapping to recursively grep current word
  * Redesigned greps and fuzzy finder mappings for better consistency
  * Updating instructions
  * Minor internal code changes

* Version 3.1

  * Keep cursor 3 lines away from screen border while scrolling
  * Shell-like autocompletition of commands and paths
  * Django templates use 2 spaces indentation too

* Version 3.0

  * Plugins managed with Vundle, and Vundle autoinstallation! -> entire project is now only the .vimrc file, all plugins are autoinstalled
  * Use of 256 colors when possible
  * Beautiful status line (Powerline), with optional fancy symbols
  * No more python class or function on the status line (breaks powerline, future plans to fix it)
  * Fisa colorscheme for 256 colors console vim
  * Cleaned unused colorschemes
  * No more separated .gvimrc
  * Fuzzy file finder can be started with file under cursor
  * Removed better python indentation and syntax coloring, because of problems with vundle, but there are plans to fix it

* Version 2.9

  * Added tabman for tab list pane

* Version 2.8

  * Added zen coding for html
  * Added git integration

* Version 2.7

  * Added gitignore (on the git repo, not related to vim)
  * Added fuzzy go to definition
  * Changelog is now on a separate file

* Version 2.6

  * Doc on ReST
  * Html and javascript files have 2 spaces indentation by default
  * New pep8 checker, which displays pyflakes errors too (**new python package dependency: flake8**)

* Version 2.5

  * Added autoclosing for (, [ and {

* Version 2.4

  * Migrated to GitHub!
  * Added README.md

* Version 2.3

  * Replaced fuzzyfinder with ctrlp (faster, more options)
  * Pep8 validator (**new python package dependency: pep8**)
  * No more quickfix list overrides problem between pyflakes checker and pep8

* Version 2.2

  * Tagbar replaces Taglist (better looking class browser)
  * Show current class/method on status line (python helper)
  * Find text and navigate results on the current folder recursively with ",r" or ",R"
  * Deleted some unnecesary files

* Version 2.1

  * Removed ugly extra column of Taglist.
  * All translated to English! (code, wiki, commits from now on)
  * Fuzzy finder now used for files, symbols and code.
  * Fuzzy finder keyboard shortcuts changed and standarized (now all of them start with ",").

* Version 2.0

  * Plugins managed using Pathogen!
  * Updated some of the plugins.
  * NERDCommenter changed their keyboard shortcuts to "\ci".

* Version 1.7

  * Fuzzy finder only for files.

* Version 1.6

  * HTML/XML tags navigation with %.
  * Debugger plugin installed on the configuration, removing one step of the installation.

* Version 1.5

  * Save current file as sudo.
  * Long lines highlighting off by default.
  * Status bar allways visible.

* Version 1.4

  * Search results counter.
  * Code commenter.

* Version 1.3

  * highlighting of search results.

* Version 1.2

  * Automatic remove of trailing spaces when saving python files.

* Version 1.1

  * Python code checking with Pyflakes.
  * Python bad things highlighting (long lines, trailing spaces, tabs at line start).
