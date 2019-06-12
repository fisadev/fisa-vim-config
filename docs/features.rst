Most important features include:

* **Plugins managed using Vim-plug**! You can easily install or remove plugins. More info `here <https://github.com/junegunn/vim-plug>`_

* **Smart autocompletion as you type**, sometimes using python instrospection (completion of module names, instance methods and attributes) and sometimes text-based (used words) (from version 4.0, it's even more intelligent!). And it does fuzzy autocompletion too! Fuzzy autocompletion means you don't need to type the exact word, typing "satmod" will suggest stuff like "SatelliteModel".

* **Fuzzy file, code and command finders** (like Textmante or Sublime Text 2):

  * ``,e`` = open file (like the original :e) but with recursive and fuzzy file name matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with ``Ctrl-t``!
  * ``,g`` = fuzzy symbol finder (classes, methods, variables, functions, ...) on the current file. Example: if you type "usr" it will find the User class definition on the current file. ``,G`` does the same but on all opened files, ``,wg`` and ``,wG`` are variants that pre-fill the current word under the cursor as search text.
  * ``,c`` = fuzzy command finder (internal vim commands, or custom commands). Example: if you type "diff" it will find ``:GitDiff``, ``:diffthis``, and many other similar commands.
  * ``,f`` = fuzzy text finder on the current file. Example: if you type "ctm=6" it will find the line containing "current_time = 16". ``,F`` does the same but on all opened files, ``,wf`` and ``,wF`` are variants that pre-fill the current word under the cursor as search text. 

* **Some other neat python goodies**:

  * **Go to definition** with ``,d``, or open the definition on a new tab with ``,D``.
  * **Find occurrences** with ``,o``.
  * **Show docstring** of symbol under the cursor with ``Shift-K``.

* **Classes/module browser** that lists classes, functions, methods, and such of the current file, and navigates to them when ENTER is pressed. Toggle it with ``F4``.

* **Error and style checking of code**. It will detect unused variables or imports, syntax errors, typos in variables, pep8 violations, etc. Works for several languages, highlighting the errors and warnings in the code and with colors at the right end of the status bar. You can open an errors list with ``:lwindow``.

* **Pending tasks browser** pressing ``F2``. This reads the current file searching for comments that start with "TODO", "FIXME", and such, and shows them on a list that allows navigation similar to the class browser.

* **Grep code recursively** and navigate the results:

  * ``,r`` uses the ack command (a kind of grep optimized for code search), lists the found matches, and allows you to open them with ENTER.
  * ``,wr`` does the same, but automatically searching the word under the cursor.

* **Better file browser**, toggle it with ``F3``, or open it with your current file selected using ``,t``.

* **Search results count and highlighted** while searching text.

* **Comment and uncomment code** with ``\ci``.

* **Easy tab navigation** using ``Alt+<horizontal arrows>``. And use ``tt`` as a shortcut to open a new tab.

* Some vim goodies enabled by default:

  * **line numbers**.
  * keep **cursor 3 lines away from screen border while scrolling**.
  * **shell-like autocompletion of commands and paths** (autocomplete the common part and show matching options).
  * **syntax highlighting on** by default.

* **Python interpreter inside vim**, or any other console. They are opened as a buffer using the command ``:ConqueTerm``. Examples: ``:ConqueTerm python``, ``:ConqueTerm bash``. This is Vim-only, as NeoVim has its own native feature for this.

* **Save current file as sudo** using ``:w!!``.

* **Navigate html/xml tags** the same way that you navigate (), {} and []: using ``%``.

* **Beautiful status line allways visible**, with colors, breadcrumbs and useful information about file type, encoding, position, errors, and line ending mode. When working with python files, it also displays the current python function or class where the cursor is.

* **Automatically removes trailing spaces** when saving python files.

* **Smart autoclosing of (, [, and {**

* **Beautiful color schemes for on vim with 256 colors (fisa colorscheme) and gvim (wombat colorscheme)**.

* **Use of 256 colors** when possible.

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

* **Git and other vcs integration**, with commands such as: ``:Gstatus``, ``:Gdiff``, ``:Gblame``, ``:Glog``, ``:Gcommit``, or simply ``:Git`` with your own command. Key mappings and syntax highlighting for git displays. Displays icons on the side of each line based on the result of a diff of the current file (example: if you added a line and still didn't commit the file, that line will have a green ``+`` on its side). And finally, when on a changed file you can **jump through changes** using ``\sn`` and ``\sp``.

* **Better python indentation**.

* Really neat **surround actions** using the surround.vim plugin. For example, you can change double quotes to single quotes with ``cs"'``. Learn more `here <https://github.com/tpope/vim-surround>`_.

* **Indentation defined text objects** for the editing language, named ``i``. For example, you can change an entire indented code block with ``cii``, or the indented block and its header line with ``cai`` (also yank, delete, ...).

* **Indentation based movements**, move to the header of your current python block with ``[-``, to the end of the block with ``]-``, and more (short reference `here <https://github.com/jeetsukumaran/vim-indentwise>`_).

* **Insert ipdb breakpoints** with ``\b``.

* **Copy history navigation** using the YankRing plugin, which allows you to cicle the vim clipboard with ``Ctrl-p`` and ``Ctrl-n``, and many other features (described `here <http://www.vim.org/scripts/script.php?script_id=1234>`_).

* **Automatically sort python imports** using ``:Isort``.

* **Better Vim paths** for temporary swap files, backups, and persistent undos (all of them stored under ``~/.vim/dirs``). Not needed in NeoVim.

* **Simple window chooser**: press ``-`` and you will see big green letters for each window. Just press the letter of the window you want to activate.

* **Paint css color** values with the actual color.

* **Custom configs by folder** add a ``.vim.custom`` file in the project's root folder with whatever configs you want to customize for that project.
  For example, if you have a project tree like this example and you want to exclude ``folder_x`` from FuzzyFinder, put ``let g:ctrlp_custom_ignore["dir"] = g:ctrlp_custom_ignore["dir"] . '|\v[\/]folder_x$'`` in the ``.vim.custom`` file.

     ::

          project
          ├── folder_1
          ├── folder_2
          ├── folder_x
          └── .vim.custom
