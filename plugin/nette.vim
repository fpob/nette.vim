" File:             plugin/nette.vim
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Created:          2015-11-13
" Latest Revision:  2015-11-14

if exists('b:loaded_nette') && b:loaded_nette
    finish
endif

function s:ErrorMsg(message)
    echohl ErrorMsg
    echom a:message
    echohl None
endfunction

function! s:NetteNeonCheck()
    let l:indent = ''

    for i in range(1, line('$'))
        let l:line = getline(i)

        if match(l:line, "^\t") >= 0
            let l:line_indent = 'tab'
        elseif match(l:line, '^' . repeat(' ', &shiftwidth)) >= 0
            let l:line_indent = 'space'
        else
            let l:line_indent = ''
        endif

        if l:line_indent !=? ''
            if l:indent !=? '' && l:indent !=? l:line_indent
                let l:indent = 'mismatch'
                break
            endif

            let l:indent = l:line_indent
        endif
    endfor

    if l:indent ==? 'mismatch'
        call s:ErrorMsg('Nette: NEON: indentation ' . l:indent)
    endif
endfunction

command! NetteNeonCheck :call <SID>NetteNeonCheck()

let g:loaded_nette = 1
