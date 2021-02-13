let g:vim_vue_plugin_load_full_syntax = 1

let g:vim_vue_plugin_use_scss = 1

let g:vim_vue_plugin_highlight_vue_attr = 1

let g:vim_vue_plugin_highlight_vue_keyword = 1

function! OnChangeVueSubtype(subtype)
  echom 'Subtype is '.a:subtype
  if a:subtype == 'html'
    setlocal commentstring=<!--%s-->
    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
  elseif a:subtype =~ 'css'
    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
  else
    setlocal commentstring=//%s
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
  endif
endfunction

" Example
autocmd FileType vue inoremap <buffer><expr> : InsertColon()

function! InsertColon()
  let tag = GetVueTag()
  return tag == 'template' ? ':' : ': '
endfunction
