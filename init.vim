set relativenumber
let mapleader = ";"
noremap . ;
noremap <Space> .
noremap <C-s> :update<CR>

call plug#begin('~/.vim/plugged')

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" javascript syntax
Plug 'pangloss/vim-javascript'

" vue syntax
Plug 'leafoftree/vim-vue-plugin'

" surround tag
Plug 'tpope/vim-surround'

" ctrlP
Plug 'ctrlpvim/ctrlp.vim'

" close tag
Plug 'alvan/vim-closetag'

" theme
Plug 'altercation/vim-colors-solarized'

" auto indent
Plug 'ciaranm/detectindent'

" emmet
Plug 'mattn/emmet-vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'

" langague server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" ----- Nerdtree

" shortcute nerdtree
map <C-n> :NERDTreeToggle<CR>

" ----- vim-javascript

" highlighting javascript
let g:javascript_plugin_flow = 1

" highlighting jsdoc 
let g:javascript_plugin_ngdoc = 1
" ------- vim-vue
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_has_init_indent = 2
let g:vim_vue_plugin_highlight_vue_keyword = 1


" ------ vim surround

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" ------- close tag

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.js,*.vue,*.php,*.jsx,*.html,*.xhtml,*.phtml'



" -------- vim theme

let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" --------- coc
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }


xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)


command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

