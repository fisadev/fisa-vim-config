fisa-vim-config
===============

my vim configuration (lot of python, autocompletition, fuzzy finder, debugger, ...)

What is this?
-------------

**(updating from a previous version? check the install section for updated dependencies, and remember to look at the CHANGELOG)**

My personal `Vim <http://www.vim.org/>`_ configuration, built according to my personal preferences, without any justification to think it's the best possible vim configuration. If you like it, great! :)
It's mainly oriented to python software development, but many of its features are useful for other languages and editing tasks.

Feel free to distribute it (it's GPL licensed), and I'm not responsible for any good or bad consecuences of using it (I don't know how a vim configuration can harm you, but you should never underestimate the power of vim :p).

You can report any issue on the `Issues <https://github.com/fisadev/fisa-vim-config/issues>`_ section. And if you need/want to contact me, my gmail account is "fisadev".

(Juan Pedro Fisanotti)

`Download <https://github.com/fisadev/fisa-vim-config/downloads>`_

Features or it didn't happen!
-----------------------------

magic-powered autocompletition

.. image:: http://i.imgur.com/0WhdV.png

class browser

.. image:: http://i.imgur.com/jRIba.png

detecting your nasty errors

.. image:: http://i.imgur.com/TvLq3.png

fuzzy code finder (next step: mind reader)

.. image:: http://i.imgur.com/SvZ60.png


Most important features include:

* **Plugins managed using Pathogen**! If you want to disable a plugin, simply remove its folder from ``.vim/bundle/``.

* **Smart autocompletition as you type**, sometimes using python instrospection (completition of module names, instance methods and attributes) and sometimes text-based (used words).

* **Fuzzy file and code finder** (like Textmante or Sublime Text 2):

  * ``,e`` = open file (like the original :e) but with recursive and fuzzy file name matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with Ctrl+t!
  * ``,g`` = fuzzy symbol finder (classes, methods, variables, functions, ...) on the current file. Example: if you type "usr" it will find the User class definition on the current file.
  * ``,f`` = fuzzy text finder on the opened files. Example: if you type "ctm=6" it will find the line containing "current_time = 16".
  * ``,d`` = same as ``,g`` (symbol finder) but initiates the search with the word under the cursor (sort of "go to definition").

* **Classes/module browser** that lists classes, functions, methods, and such of the current file, and navigates to them when ENTER is pressed. Toggle it with ``F4``.

* **Pending tasks browser** pressing ``F2``. This reads the current file searching for comments that start with "TODO", "FIXME", and such, and shows them on a list that allows navigation similar to the class browser.

* **Error checking of python code** using Pyflakes (it will detect unused variables or imports, syntax errors, and such).

* Run **PEP8 validator** on the current python file with ``,8``, which also displays python errors found with Pyflakes.

* A really nice **python and php debugger**. `Here <http://www.youtube.com/watch?v=kairdgZCD1U&feature=player_embedded>`_ is a small tutorial about it, and I added some keyboard shortcuts to easy its usage (they should be used only once the debugger started!):

  * ``F5`` = step over
  * ``F6`` = step into
  * ``F7`` = step out
  * ``F8`` = execute until cursor position is reached
  * ``F9`` = toggle breakpoint
  * ``F10`` = evaluate expressions on the expressions window (watch)
  * ``F11`` = go down on the stack
  * ``F12`` = go up on the stack

  You should watch the `video tutorial <http://www.youtube.com/watch?v=kairdgZCD1U&feature=player_embedded>`_, I can't explain all its usage here.

  FAQ: Why there isn't a keyboard shortcut to start the debugger?

  Because there where no more "Fx" keys free, and starting the debugger is something you do only once on every debugging session, compared to the multiple times you will use the other functions on that session. Disagree? Change it! Edit the ``.vimrc`` file, is really simple and well documented :).  (The command **to start the debugger on the current file** is ``:Dbg .``)

* Show **current python class/method** on the status line.

* **Grep text recursively** and navigate the results:

  * ``,r`` uses the system grep, faster, but needs to press an extra ENTER to return to vim. 
  * ``,R`` uses vimgrep, which is slower but doesn't need the extra ENTER

* **Better python syntax coloring**.

* **Better python indentation**.

* Some settings for better **tabs and spaces handling**.

* **Better file browser**, toggle it with ``F3``.

* **Results count** while searching text.

* **Search and read python documentation** with the ``:Pydoc`` command. Example: ``:Pydoc collections``.

* **Comment and uncomment code** with ``\ci``.

* **Easy tab navigation** on command mode:

  * ``tt`` = new tab and leaves the cursor waiting to specify the file path to open (leave blank to open an empty tab).
  * ``tn`` = next tab.
  * ``tp`` = previous tab.
  * ``tm`` = move current tab to the end.
  * ``tl`` = show a list of current tabs with their inner windows on a side pane. You can navigate them!

* Some vim goodies enabled by default: **incremental search** (moves to the first result while you are typing), **highlighted search results**, and **line numbers**.

* **Python interpreter inside vim**, or any other console. They are opened as a buffer using the command ``:ConqueTerm``. Examples: ``:ConqueTerm python``, ``:ConqueTerm bash``.

* **Save current file as sudo** using ``:w!!``.

* **Navigate html/xml tags** the same way that you navigate (), {} and []: using ``%``.

* **Status bar allways visible**.

* **Automatically removes trailing spaces** when saving python files.

* **Smart autoclosing of (, [ and {**

* Highlights **long (80+) lines**, **trailing spaces** and **lines starting with tabs** on python files. 
  From version 1.5 the long lines highlighting is off by default. All this stuff can be toggled editing the file ``.vim/bundle/highlight-bad-python/ftplugin/python.vim``.

* **Similar color scheme on vim and gvim**.

* **2 spaces indentation for html and javascript** (can disable it removing the ``tablength-exceptions`` plugin from ``.vim/bundle/``).

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

* **Git integration**, with commands such as: ``:GitStatus``, ``:GitDiff``, ``:GitBlame``, ``:GitLog``, ``:GitCommit``, or simply ``:Git`` with your own command. Also includes key mappings and syntax highlighting for git displays.

2 steps installation
--------------------

(you will need a vim compiled with python support. Check it with ``vim --version | grep +python``)

* **Put the configuration files where they belong**

  Copy the files ``.vimrc`` and ``.gvimrc``, and the folder ``.vim`` (all of them contained on the `downloaded file <https://github.com/fisadev/fisa-vim-config/downloads>`_) to your linux home folder.

  Example: my linux user is "fisa", so now I have this tree:

  ::

    /home/fisa/.vimrc
    /home/fisa/.gvimrc
    /home/fisa/.vim/

* **Install dependencies**

  ::

    sudo apt-get install exuberant-ctags
    sudo pip install dbgp vim-debug pep8 flake8

(if you don't have Pip, find it here: `pip <http://pypi.python.org/pypi/pip>`_)

Done! You have your new shiny powerful vim :)

Sources
-------

Thanks to some people from `Pyar <http://python.org.ar>`_, who show me vim for the first time and shared their configurations with me on the PyCamp 2010 :). Some of my tweaks were copied from their configurations.

* Hector Sanchez
* Juanjo Conti
* Lucas
* Joaquin Sorianello
* Alejandro Santos
* Facundo Batista
* Luciano Bello

And thanks to all the developers of the plugins that I simply use here:

* `Plugins manager (Pathogen) <https://github.com/tpope/vim-pathogen>`_
* `Debugger (vim-debug) <http://github.com/jabapyth/vim-debug/>`_
* `GVim color scheme (wombat) <http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/>`_
* `Consoles as buffers (!ConqueTerm) <http://www.vim.org/scripts/script.php?script_id=2771>`_
* `Autocompletition (autocomplpop) <http://www.vim.org/scripts/script.php?script_id=1879>`_
* `Better file browser (NERDTree) <http://www.vim.org/scripts/script.php?script_id=1658>`_
* `Better python indentation <http://www.vim.org/scripts/script.php?script_id=974>`_
* `Better python syntax coloring <http://www.vim.org/scripts/script.php?script_id=790>`_
* `Search and read python documentation (PyDoc) <http://www.vim.org/scripts/script.php?script_id=910>`_
* `Class/module browser (Tagbar) <http://www.vim.org/scripts/script.php?script_id=3465>`_
* `Pending tasks list (!TaskList) <http://www.vim.org/scripts/script.php?script_id=2607>`_
* `python code checker (Pyflakes-vim) <http://www.vim.org/scripts/script.php?script_id=2441>`_
* `Search results counter (!IndexedSearch) <http://www.vim.org/scripts/script.php?script_id=1682>`_
* `Code commenter (NERDCommenter) <http://www.vim.org/scripts/script.php?script_id=1218>`_
* `HTML/XML tags navigation (Matchit) <http://www.vim.org/scripts/script.php?script_id=39>`_
* `Code and files fuzzy finder (ctrlp) <https://github.com/kien/ctrlp.vim>`_
* `Current class/method status (python helper) <http://www.vim.org/scripts/script.php?script_id=435>`_
* `PEP8 checker (with shows pyflakes errors too) <https://github.com/nvie/vim-flake8>`_
* `Zen coding <https://github.com/mattn/zencoding-vim/>`_
* `Git integration <https://github.com/motemen/git-vim>`_
