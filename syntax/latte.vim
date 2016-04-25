" File:             syntax/latte
" Language:         Latte
" Maintainer:       Filip Pobořil <tsuki@fpob.eu>
" Description:      Latte syntax highlighting

if exists('b:current_syntax') && b:current_syntax ==? 'latte'
    finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

runtime! syntax/php.vim
unlet! b:current_syntax

syn keyword latteKeyword contained include cache php use l r contentType status
syn keyword latteKeyword contained var default capture
syn keyword latteKeyword contained block define includeblock layout extends
syn keyword latteKeyword contained control form label input inputError snippet
syn keyword latteKeyword contained link plink syntax
syn keyword latteConditional contained if elseif else ifset elseifset ifCurrent
syn keyword latteRepeat contained foreach as for while continueIf breakIf first last sep
syn keyword latteDebug contained dump debugbreak

syn cluster latteExpression contains=latteMacroPhpCode,latteKeyword,latteConditional,latteRepeat,latteDebug,latteMacroIdentifier,latteMacroLink,latteMacroOperator,latteMacroFilter,latteMacroDelimiter

syn region latteMacro matchgroup=latteOperator keepend start=/\m{[%{]\@!\/\?/ end=/\m\/\?[%{]\@!}/ contains=@latteExpression
syn region latteMacro matchgroup=latteOperator keepend start=/\m{{\/\?/ end=/\m\/\?}}/ contains=@latteExpression
syn region latteMacro matchgroup=latteOperator keepend start=/\m{%\/\?/ end=/\m\/\?%}/ contains=@latteExpression

syn match latteMacroOperator contained /\m\(|\|=>\)/
syn match latteMacroDelimiter contained /\m[,:]/
syn match latteMacroIdentifier contained /\m\(\({[{%]\@!\|{{\|{%\)[a-zA-Z]\+\s\)\@<=[a-zA-Z][a-zA-Z0-9_:-]*[%}\s,|]\@=/
syn match latteMacroIdentifier contained /\m\(,\s*\)\@<=\([a-zA-Z]\w*\)\(\s\|=\)\@=/
syn match latteMacroLink contained /\m\(\({[{%]\@!\|{{\|{%\)\(link\|plink\)\s\)\@<=[a-zA-Z0-9:#]\+/
syn match latteMacroFilter contained /\m|\@<=[a-zA-Z][a-zA-Z0-9_-]*/
syn match latteMacroPhpCode contained contains=@phpClTop /\m\({[{%]\@!\|{{\|{%\)\@<=.\{-}\(|[a-zA-Z]\|}[}%]\@!\|}}\|%}\)\@=/
syn match latteMacroPhpCode contained contains=@phpClTop /\m\$[a-zA-Z]\(\w\+\)\?\(->\w\+\((.\{-}\)\?\)\?\(|[a-zA-Z]\|}[}%]\@!\|}}\|%}\)\@=/
syn region latteMacroPhpCode contained contains=@phpClTop keepend start=/\m['"]/ end=/\m['"]/

syn region latteNMacro matchgroup=latteOperator keepend start=/\mn:[a-z][A-Za-z-]*="/ end=/\m"/ contains=@phpClTop

syn cluster htmlPreproc add=latteMacro
syn cluster htmlArgCluster add=latteNMacro

syn keyword latteTodo contained TODO FIXME XXX
syn region latteComment start=/\m{\*/ end=/\m\*}/ contains=latteTodo
syn region latteComment start=/\m{{\*/ end=/\m\*}}/ contains=latteTodo

hi def link latteOperator Operator
hi def link latteKeyword Keyword
hi def link latteConditional Conditional
hi def link latteRepeat Repeat
hi def link latteSeparator Separator
hi def link latteDebug Debug
hi def link latteMacroIdentifier Identifier
hi def link latteMacroLink String
hi def link latteMacroFilter Macro
hi def link latteMacroOperator Operator
hi def link latteMacroDelimiter Delimiter
hi def link latteTodo Todo
hi def link latteComment Comment

let b:current_syntax = 'latte'
