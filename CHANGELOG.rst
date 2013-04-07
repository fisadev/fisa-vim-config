Changelog
---------

* Version 1.1

  * Python code checking with Pyflakes.
  * Python bad things highlighting (long lines, trailing spaces, tabs at line start).

* Version 1.2

  * Automatic remove of trailing spaces when saving python files.

* Version 1.3

  * highlighting of search results.

* Version 1.4

  * Search results counter.
  * Code commenter.

* Version 1.5

  * Save current file as sudo.
  * Long lines highlighting off by default.
  * Status bar allways visible.

* Version 1.6

  * HTML/XML tags navigation with %.
  * Debugger plugin installed on the configuration, removing one step of the installation.

* Version 1.7

  * Fuzzy finder only for files.

* Version 2.0

  * Plugins managed using Pathogen!
  * Updated some of the plugins.
  * NERDCommenter changed their keyboard shortcuts to "\ci".

* Version 2.1

  * Removed ugly extra column of Taglist.
  * All translated to English! (code, wiki, commits from now on)
  * Fuzzy finder now used for files, symbols and code.
  * Fuzzy finder keyboard shortcuts changed and standarized (now all of them start with ",").

* Version 2.2

  * Tagbar replaces Taglist (better looking class browser)
  * Show current class/method on status line (python helper)
  * Find text and navigate results on the current folder recursively with ",r" or ",R"
  * Deleted some unnecesary files

* Version 2.3

  * Replaced fuzzyfinder with ctrlp (faster, more options)
  * Pep8 validator (**new python package dependency: pep8**)
  * No more quickfix list overrides problem between pyflakes checker and pep8

* Version 2.4

  * Migrated to GitHub!
  * Added README.md

* Version 2.5

  * Added autoclosing for (, [ and {

* Version 2.6

  * Doc on ReST
  * Html and javascript files have 2 spaces indentation by default
  * New pep8 checker, which displays pyflakes errors too (**new python package dependency: flake8**)

* Version 2.7

  * Added gitignore (on the git repo, not related to vim)
  * Added fuzzy go to definition
  * Changelog is now on a separate file

* Version 2.8

  * Added zen coding for html
  * Added git integration

* Version 2.9

  * Added tabman for tab list pane

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

* Version 3.1

  * Keep cursor 3 lines away from screen border while scrolling
  * Shell-like autocompletition of commands and paths
  * Django templates use 2 spaces indentation too

* Version 3.2

  * Mapping to recursively grep current word
  * Redesigned greps and fuzzy finder mappings for better consistency
  * Updating instructions
  * Minor internal code changes

* Version 3.3

  * RecurGrepFast runs silently (doesn't need the extra ENTER)
  * Window navigation with Alt-arrows
  * Tabs navigation with Ctrl-Shift-arrows
  * New ConqueTerm, now working

* Version 3.4

  * Shortcut for most recently used fuzzy finder
  * Fixed vim-debug problems with vundle
  * Fixed mapping incompatibilities
  * Minor documentation changes

* Version 3.5

  * Added surround.vim plugin
  * File ignores for fuzzy file finder
  * Mapping for MRU fuzzy finder with current word
  * Usage of leader instead of harcoded mapping prefixes

* Version 3.6

  * Reverted leader usage, to mantain compatibility with many plugins

* Version 3.7

  * New autoclosing plugin, that doesn't breaks undo history
  * Better python indentation

* Version 3.7.1

  * Fix ESC behaviour on popups when autoclose is enabled

* Version 3.8

  * Added indentation defined text object plugin
  * Added search autocompletition plugin
  * Added yank history plugin

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

* Version 4.1

  * "Completition" is wrong, the correct word is "completion" :)

* Version 4.2

  * Rope disabled by default

* Version 4.3

  * Removed SearchComplete plugin, because it breaks search history navigation

* Version 4.4

  * New mappings for duplicating tabs, and go to definition in new tab
  * Added relative numbering plugin, but disabled by default
  * Better update instructions
  * Added snipmate and snippets repos
  * Added support for screen-256 on 256 colors theme selection
  * Added plugin to display git diff icons of current file on the side of each line

* Version 4.4.1

  * Small doc fixes

* Version 4.4.2

  * Updating references to plugin sources
  * Small comment and quotes changes

* Version 4.4.3

  * SnipMate snippets repo was moved, updated it

