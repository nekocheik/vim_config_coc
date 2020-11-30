set relativenumber
let mapleader=" "
set clipboard=unnamed
map <Leader>m :source $MYVIMRC<CR>
map <leader>; :Commentary<CR>
noremap <C-w> :w<cr>
nnoremap <Leader>q :bufdo :Bdelete<CR>
inoremap <C-w> <C-c>:w<cr> 
noremap <leader>q :q<cr> 

set shiftwidth=2
set autoindent
set smartindent

" let g:python_host_prog = '/Users/cheikkone/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/cheikkone/.pyenv/versions/neovim3/bin/python' 

" " move line 
map ∆ <A-j>
map ˚ <A-k>
map ˙ <A-h>
map ¬ <A-l>


call plug#begin('~/.vim/plugged') 
Plug 'posva/vim-vue'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" for completion and snippets
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'dart-lang/dart-vim-plugin'

" Plug 'matze/vim-move'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'

" Plug 'tpope/vim-fugitive'
" Plug 'asheq/close-buffers.vim'
Plug 'bling/vim-bufferline'
" Plug 'terryma/vim-smooth-scroll'
Plug 'cohama/lexima.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
" Plug 'digitaltoad/vim-pug' 
" Plug 'prabirshrestha/vim-lsp' 
" Plug 'lighttiger2505/deoplete-vim-lsp'

" Plug 'konfekt/fastfold' 
" Plug 'pangloss/vim-javascript'
" Plug 'cocopon/iceberg.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'neoclide/coc.nvim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mhartington/oceanic-next'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" lsp 
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" completion 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" snippet 
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/async.vim'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" javascript typescript jsx
" Plug 'pangloss/vim-javascript' 
" Plug 'leafgarland/typescript-vim' 
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'ianks/vim-tsx'

" (Optional) Multi-entry selection UI.
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'junegunn/fzf'
call plug#end() 
" Theme

set background=dark
set termguicolors
let g:quantum_italics=1
let g:quantum_black=1
colorscheme quantum


" lsp 
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover) 
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"completion
 inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
" snippet 

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" vue
let g:vue_pre_processors = []

" folding
" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendors\|dist\'


" coc
let g:coc_global_extensions = ['coc-explorer']

" explorer

nmap <space>e :CocCommand explorer<CR>
