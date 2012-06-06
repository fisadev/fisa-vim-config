# tabman.vim - Tab management for Vim

This plugin provides a convenient way to navigate between tabs and the windows
they contain. Features include (but not limited to) jumping to a specific
window opened in another tab; closing tabs, buffers or windows anywhere without
switching to them.

Screenshot:

![tabman][1]

## Usage
* Press `<leader>mt` or run `:TMToggle` to toggle TabMan.
* Press `<leader>mf` or run `:TMFocus` to give focus to/open the TabMan window.

## Options
* Change the default mappings:

    ```vim
    let g:tabman_toggle = '<leader>mt'
    let g:tabman_focus  = '<leader>mf'
    ```

* Change the width of the TabMan window:

    ```vim
    let g:tabman_width = 25
    ```

* And the position:

    ```vim
    let g:tabman_side = 'left'
    ```

* Set this to 1 to show windows created by plugins, help and quickfix:

    ```vim
    let g:tabman_specials = 0
    ```

* Set this to 0 to disable line numbering in the TabMan window:

    ```vim
    let g:tabman_number = 1
    ```

Once TabMan’s opened, press ? for help on extra keymaps.

[1]: http://i.imgur.com/HnpGG.png
