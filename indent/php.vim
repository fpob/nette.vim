" File:             indent/php.vim
" Language:         PHP
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Created:          2015-11-14
" Latest Revision:  2015-11-14
" Description:      Nette PHP indentation
"
if exists('b:did_indent') && b:did_indent
    finish
endif

if exists('b:nette_tab_indent')
    if b:nette_tab_indent
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
endif

let b:did_indent = 1
