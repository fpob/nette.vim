" File:             syntax/latte
" Language:         Latte
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      Latte syntax highlighting

if exists('b:current_syntax') && b:current_syntax ==? 'latte'
    finish
endif

if exists('b:current_syntax')
    unlet b:current_syntax
endif
runtime! syntax/html.vim

if exists('b:current_syntax')
    unlet b:current_syntax
endif
runtime! syntax/php.vim

syn keyword latteKeyword contained include cache php use l r contentType status
syn keyword latteKeyword contained var default capture
syn keyword latteKeyword contained block define includeblock layout extends
syn keyword latteKeyword contained control form label input inputError snippet
syn keyword latteConditional contained if elseif else ifset elseifset ifCurrent
syn keyword latteRepeat contained foreach as for while continueIf breakIf first last sep
syn keyword latteDebug contained dump debugbreak

syn cluster latteExpression contains=@phpClTop,latteKeyword,latteConditional,latteRepeat,latteDebug,latteMacroIdentifier,latteMacroFilter

syn region latteMacro matchgroup=latteOperator keepend start=/{\/\?/ end=/\/\?}/ contains=@latteExpression
syn region latteMacro matchgroup=latteOperator keepend start=/{{\// end=/\/\?}}/ contains=@latteExpression
syn match latteMacroIdentifier contained /\({[a-zA-Z]\+\s\)\@<=[a-zA-Z][a-zA-Z0-9_-]*[}\s,|:]\@=/
syn match latteMacroFilter contained /|\@<=[a-zA-Z][a-zA-Z0-9_-]*/
syn region latteNMacro matchgroup=latteOperator keepend start=/n:[a-z][A-Za-z-]*="/ end=/"/ contains=@phpClTop

syn cluster htmlPreproc add=latteMacro
syn cluster htmlArgCluster add=latteNMacro

syn keyword latteTodo contained TODO FIXME XXX
syn region latteComment start=/{\*/ end=/\*}/ contains=latteTodo
syn region latteComment start=/{{\*/ end=/\*}}/ contains=latteTodo

hi def link latteOperator Operator
hi def link latteKeyword Keyword
hi def link latteConditional Conditional
hi def link latteRepeat Repeat
hi def link latteSeparator Separator
hi def link latteDebug Debug
hi def link latteMacroIdentifier Identifier
hi def link latteMacroFilter Macro
hi def link latteTodo Todo
hi def link latteComment Comment

let b:current_syntax = 'latte'
