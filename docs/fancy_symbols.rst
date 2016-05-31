Fancy symbols and breadcrumbs in the status line
------------------------------------------------

Airline allows you to use fancy symbols on the status line for breadcrumbs and indicators (example: a padlock when editing read-only files). Using them requires to have a patched font in your terminal. It may sound black magic, but in fact is quite easy.

**Get the font patcher and dependencies**

Grab the ``fontpatcher`` directory from this repo to some location on your computer (the patcher was written by Kim Silkebækken, the author of the original vim-powerline plugin). Then install the ``argparse`` and ``fontforge`` dependencies: in Ubuntu you only need to run ``sudo apt-get install python-fontforge``. In other distros there should be packages with similar names.

**Patch**

We will need to patch a font. Pick the font you want to patch (it should be a monospace font). Copy its .ttf file (on Ubuntu you can find them under ``/usr/share/fonts/truetype/``) to the ``fontpatcher`` folder. Cd into that folder and run ``./fontpatcher YOURFONTFILE.ttf``. Now you will have a file named ``YOURFONTFILE-Powerline.ttf``, that's your patched font.

**Install**

Now we need to install the patched font to our system. On Ubuntu, double click on the font file and choose "install". On other systems copy the font file to the ``YOURHOMEFOLDER/.fonts/`` folder and then run ``sudo fc-cache -vf``.

**Configure**

After installing the font, go to the settings of your terminal app and select the patched font. Finally, open your ``.vimrc`` and uncomment the lines at the end of the file, after the comment that explains that those are the lines for the fancy symbols.

That's it! Restart your vim and enjoy the beauty of Airline.

