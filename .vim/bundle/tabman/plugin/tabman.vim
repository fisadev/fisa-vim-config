" =============================================================================
" Description: Tab management for Vim
" Author:      Kien Nguyen <github.com/kien>
" =============================================================================

if ( exists('g:loaded_tabman') && g:loaded_tabman ) || v:version < 700 || &cp
	fini
en
let g:loaded_tabman = 1

if !exists('g:tabman_focus')  | let g:tabman_focus  = '<leader>mf' | en
if !exists('g:tabman_toggle') | let g:tabman_toggle = '<leader>mt' | en

com! TMFocus  cal tabman#focus()
com! TMToggle cal tabman#toggle()

exe 'nn <silent>' g:tabman_focus  ':<c-u>TMFocus<cr>'
exe 'nn <silent>' g:tabman_toggle ':<c-u>TMToggle<cr>'
