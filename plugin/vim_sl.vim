let s:save_cpo = &cpo
set cpp&vim

if exists('g:loaded_kato_sl_vim')
    finish
endif

command! Q call g:vim_sl#sl()

let g:loaded_kato_sl_vim = v:true
let &cpo = s:save_cpo
unlet s:save_cpo
