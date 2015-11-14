" File:             ftplugin/neon.vim
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Created:          2015-11-14
" Latest Revision:  2015-11-14

augroup NetteNeonFtplugin
    autocmd!

    autocmd BufWritePost *.neon execute 'NetteNeonCheck'
augroup END
