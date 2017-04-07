" File:             ftdetect/nette.vim
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      File type detection for Nette

augroup NetteFtdetect
    autocmd!

    " Nette Tester
    autocmd BufRead,BufNewFile *.phpt setlocal filetype=php

    " NEON
    autocmd BufRead,BufNewFile *.neon setlocal filetype=neon

    " Latte template
    autocmd BufRead,BufNewFile *.latte setlocal filetype=html.latte

augroup END
