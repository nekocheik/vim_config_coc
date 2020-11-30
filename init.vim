set relativenumber
let mapleader=" "
set clipboard=unnamed
map <Leader>m :source $MYVIMRC<CR>
map <leader>; :Commentary<CR>
noremap <C-w> :w<cr>
nnoremap <Leader>q :bufdo :Bdelete<CR>
inoremap <C-w> <C-c>:w<cr> 
noremap <leader>q :q<cr> 

" let g:python_host_prog = '/Users/cheikkone/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/cheikkone/.pyenv/versions/neovim3/bin/python' 

" " move line 
" map ∆ <A-j>
" map ˚ <A-k>
" map ˙ <A-h>
" map ¬ <A-l>


call plug#begin('~/.vim/plugged') 
" Plug 'posva/vim-vue'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" for completion and snippets
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'dart-lang/dart-vim-plugin'

" Plug 'matze/vim-move'
" Plug 'roxma/vim-tmux-clipboard'
" Plug 'tpope/vim-fugitive'
" Plug 'asheq/close-buffers.vim'
" Plug 'bling/vim-bufferline'
" Plug 'terryma/vim-smooth-scroll'
" Plug 'kana/vim-repeat'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'kien/ctrlp.vim'
" Plug 'digitaltoad/vim-pug' 
" Plug 'prabirshrestha/vim-lsp' 
" Plug 'lighttiger2505/deoplete-vim-lsp'

" Plug 'konfekt/fastfold' 
" Plug 'pangloss/vim-javascript'
" Plug 'tmux-plugins/vim-tmux-focus-events' 
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'roxma/vim-tmux-clipboard'
Plug 'cocopon/iceberg.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'mhartington/oceanic-next'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'

" javascript typescript jsx
" Plug 'pangloss/vim-javascript' 
" Plug 'leafgarland/typescript-vim' 
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'ianks/vim-tsx'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
call plug#end() 

" Or if you have Neovim >= 0.1.5
 if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
colorscheme Iceberg 
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" completion
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

