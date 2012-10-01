fisa-vim-config
===============

my vim configuration (lot of python, autocompletition, fuzzy finder, debugger, ...)

What is this?
-------------

**(IMPORTANT! updating from a previous version? check the install section for new dependencies, and read the updating instructions. It can also be useful to look at the CHANGELOG)**

My personal `Vim <http://www.vim.org/>`_ configuration, built according to my personal preferences, without any justification to think it's the best possible vim configuration. If you like it, great! :)
It's mainly oriented to python software development, but many of its features are useful for other languages and editing tasks.

Feel free to distribute it (it's GPL licensed), and I'm not responsible for any good or bad consecuences of using it (I don't know how a vim configuration can harm you, but you should never underestimate the power of vim :p).

You can report any issue on the `Issues <https://github.com/fisadev/fisa-vim-config/issues>`_ section. And if you need/want to contact me, my gmail account is "fisadev".

(Juan Pedro Fisanotti)

`Download <https://raw.github.com/fisadev/fisa-vim-config/master/.vimrc>`_

Features or it didn't happen!
-----------------------------

magic-powered autocompletition

.. image:: http://i.imgur.com/7xf4A.png

class browser

.. image:: http://i.imgur.com/KBzeO.png

detecting your nasty errors

.. image:: http://i.imgur.com/9U1KP.png

fuzzy code finder (next step: mind reader)

.. image:: http://i.imgur.com/stkUL.png


Most important features include:

* **Plugins managed using Vundle**! You can easily install or remove plugins, and they are installed into ``.vim/bundle/``. More info `here <https://github.com/gmarik/vundle>`_

* **Smart autocompletition as you type**, sometimes using python instrospection (completition of module names, instance methods and attributes) and sometimes text-based (used words).

* **Fuzzy file and code finder** (like Textmante or Sublime Text 2):

  * ``,e`` = open file (like the original :e) but with recursive and fuzzy file name matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with ``Ctrl-t``!
  * ``,g`` = fuzzy symbol finder (classes, methods, variables, functions, ...) on the current file. Example: if you type "usr" it will find the User class definition on the current file. ``,G`` does the same but on all opened files.
  * ``,f`` = fuzzy text finder on all the opened files. Example: if you type "ctm=6" it will find the line containing "current_time = 16".
  * ``,m`` = fuzzy finder of most recently used files.
  * ``,d`` = same as ``,g`` (symbol finder) but initiates the search with the word under the cursor (sort of "fuzzy go to definition"). ``,D`` does the same but on all opened files.
  * ``,we``, ``,wg``, ``,wf`` and ``,wm`` = same as ``,e``, ``,g``, ``,f`` and ``,wm`` but initiate the search with the word under the cursor (also the upper case version of ``,G``, ``,wG``).
  * ``,pe`` = same as ``,e`` but initiates the search with the path under the cursor.

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

* **Grep text recursively** and navigate the results:

  * ``,r`` uses the system grep (faster).
  * ``,R`` uses vimgrep (slower).
  * ``,wr`` and ``,wR`` do the same, but searching the word under the cursor.

* Some settings for better **tabs and spaces handling**.

* **Better file browser**, toggle it with ``F3``.

* **Results count** while searching text.

* **Search and read python documentation** with the ``:Pydoc`` command. Example: ``:Pydoc collections``.

* **Comment and uncomment code** with ``\ci``.

* **Easy tab navigation**:

  * ``tt`` = new tab and leaves the cursor waiting to specify the file path to open (leave blank to open an empty tab).
  * ``tn`` or ``Ctrl-Shift-Right`` = next tab.
  * ``tp`` or ``Ctrl-Shift-Left`` = previous tab.
  * ``tm`` = move current tab to the end.
  * ``tl`` = show a list of current tabs with their inner windows on a side pane. You can navigate them!

  The mappings starting with the ``t`` letter work only on command mode, but the mappings with ``Ctrl-Shift`` work on both, command and insert mode.

* **Easy window navigation** using ``Alt-arrows`` keys.

* Some vim goodies enabled by default: 

  * **incremental search** (moves to the first result while you are typing).
  * **highlighted search results**.
  * **line numbers**.
  * keep **cursor 3 lines away from screen border while scrolling**.
  * **shell-like autocompletition of commands and paths** (autocomplete the common part and show matching options).

* **Python interpreter inside vim**, or any other console. They are opened as a buffer using the command ``:ConqueTerm``. Examples: ``:ConqueTerm python``, ``:ConqueTerm bash``.

* **Save current file as sudo** using ``:w!!``.

* **Navigate html/xml tags** the same way that you navigate (), {} and []: using ``%``.

* **Beautiful status line allways visible**, with colors, breadcrumbs and useful information about file type, encoding and position.

* **Automatically removes trailing spaces** when saving python files.

* **Smart autoclosing of (, [, and {**

* **Beautiful color schemes for on vim with 256 colors (fisa colorscheme) and gvim (wombat colorscheme)**.

* **Use of 256 colors** when possible.

* **2 spaces indentation for html and javascript** (can disable it removing two lines from the ``.vimrc``).

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

* **Better python indentation**.

* Really neat **surround actions** using the surround.vim plugin. Learn how to use it `here <https://github.com/tpope/vim-surround>`_.

Super easy installation
-----------------------

(you will need a vim compiled with python support. Check it with ``vim --version | grep +python``)

(**if you have your own .vim folder or have a version of fisa-vim-config older than 3.0, you should move it to a backup location and start with no .vim folder!**)

* **Dependencies**

  ::

    sudo apt-get install exuberant-ctags git
    sudo pip install dbgp vim-debug pep8 flake8 pyflakes

  (if you don't have Pip, find it here: `pip <http://pypi.python.org/pypi/pip>`_)

* **Put the configuration files where they belong**

  Place the file ``.vimrc`` on your linux home folder.

  Example: my linux user is "fisa", so now I have: ``/home/fisa/.vimrc``.

* **Open vim**

  Simply run ``vim`` on your terminal, and it will try to install the plugins. They will be installed into the ``.vim/bundle`` folder.

  Wait for the installation to finish...
  
  Done! You have your new shiny powerful vim :)

* **Optional: fancy symbols and breadcrumbs**

  If you want fancy symbols and breadcrumbs on your status line, there is a small tutorial for that at the end of this README.

Keeping your vim up-to-date
---------------------------

After updating the .vimrc, you should run ``:BundleClean`` (this will remove plugins no longer used) and ``:BundleInstall!`` (this will install any new plugins, and update the existing ones to the last versions). You can also run ``:BundleInstall!`` at any time to update the installed plugins.

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

* `Plugins manager (Vundle) <https://github.com/gmarik/vundle>`_
* `Vundle autoinstalation <Hace unos años los líderes eran Nokia y WinMobile...>`_
* `Debugger (vim-debug) <http://github.com/jabapyth/vim-debug/>`_
* `GVim color scheme (wombat) <http://www.vim.org/scripts/script.php?script_id=1778>`_
* `Consoles as buffers (ConqueShell) <http://www.vim.org/scripts/script.php?script_id=2771>`_
* `Autocompletition (autocomplpop) <http://www.vim.org/scripts/script.php?script_id=1879>`_
* `Better file browser (NERDTree) <https://github.com/scrooloose/nerdtree>`_
* `Search and read python documentation (PyDoc) <https://github.com/fs111/pydoc.vim>`_
* `Class/module browser (Tagbar) <https://github.com/majutsushi/tagbar>`_
* `Pending tasks list (TaskList) <http://www.vim.org/scripts/script.php?script_id=2607>`_
* `Python code checker (Pyflakes-vim) <http://www.vim.org/scripts/script.php?script_id=2441>`_
* `Search results counter (IndexedSearch) <http://www.vim.org/scripts/script.php?script_id=1682>`_
* `Code commenter (NERDCommenter) <https://github.com/scrooloose/nerdcommenter>`_
* `HTML/XML tags navigation (Matchit) <http://www.vim.org/scripts/script.php?script_id=39>`_
* `Code and files fuzzy finder (ctrlp) <https://github.com/kien/ctrlp.vim>`_
* `PEP8 checker (with shows pyflakes errors too) <https://github.com/nvie/vim-flake8>`_
* `Zen coding <https://github.com/mattn/zencoding-vim/>`_
* `Git integration <https://github.com/motemen/git-vim>`_
* `Tab list pane (tabman) <https://github.com/kien/tabman.vim>`_
* `Beautiful status line (Powerline) <https://github.com/Lokaltog/vim-powerline>`_
* `256 colorscheme (fisa) <https://github.com/fisadev/fisa-vim-colorscheme>`_
* `Surround actions <https://github.com/tpope/vim-surround>`_
* `AutoClose <https://github.com/Townk/vim-autoclose>`_
* `Better python indentation <https://github.com/vim-scripts/indentpython.vim--nianyang>`_

Optional: fancy symbols and breadcrumbs in the status line
----------------------------------------------------------

Powerline allows you to use fancy symbols on the status line for breadcrumbs and indicators (example: a padlock when editing read-only files). Using them requires to have a patched font in your terminal. It may sound black magic, but in fact is quite easy.

**Patch**

First we will need to patch a font. Pick the font you want to patch (it should be a monospace font). Copy its .ttf file (on Ubuntu you can find them under ``/usr/share/fonts/truetype/``) to the ``.vim/bundle/vim-powerline/fontpatcher`` folder. Cd into that folder and run ``./fontpatcher YOURFONTFILE.ttf``. Now you will have a file named ``YOURFONTFILE-Powerline.ttf``, that's your patched font.

**Install**

Now we need to install the patched font to our system. On Ubuntu, double click on the font file and choose "install". On other systems copy the font file to the ``YOURHOMEFOLDER/.fonts/`` folder and then run ``sudo fc-cache -vf``. 

**Configure**

After installing the font, go to the settings of your terminal app and select the patched font. Finally, open your ``.vimrc`` and uncomment the line ``let g:Powerline_symbols = 'fancy'``.

That's it! Restart your vim and enjoy the beauty of Powerline.

