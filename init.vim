set relativenumber
set hidden
let mapleader=" "
set clipboard=unnamed
map <Leader>m :source $MYVIMRC<CR>
map <leader>; :Commentary<CR>
noremap <C-w> :w<cr>
nnoremap <Leader>q :bufdo :Bdelete<CR>
inoremap <C-w> <C-c>:w<cr> 
noremap <leader>q :q<cr> 
" move line 
map ∆ <A-j>
map ˚ <A-k>
map ˙ <A-h>
map ¬ <A-l>


call plug#begin('~/.vim/plugged') 

Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'
Plug 'konfekt/fastfold'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-fugitive'
Plug 'asheq/close-buffers.vim'
Plug 'bling/vim-bufferline'
Plug 'terryma/vim-smooth-scroll'
Plug 'kana/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'storyn26383/vim-vue'
Plug 'digitaltoad/vim-pug' 
Plug 'pangloss/vim-javascript'
Plug 'tmux-plugins/vim-tmux-focus-events' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


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

" Coc global extensions

let g:coc_global_extensions=[ 
	\ "coc-pairs",
	\ "coc-xml", 
	\ "coc-flutter", 
	\ "coc-omnisharp",
	\ "coc-lists",
	\ "coc-phpactor",
	\ "coc-prettier",
	\ "coc-snippets",
	\ "coc-eslint",
	\ "coc-emmet",
	\ "coc-explorer", 
	\ "coc-html",
	\ "coc-json",
	\ "coc-r-lsp",
	\ "coc-tailwindcss",
	\ "coc-tsserver",
	\ "coc-vetur",
	\ "coc-git",
	\]

" coc multi cursors
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2 
" coc explorer
nmap <leader>e :CocCommand explorer<CR>

" vue


" git
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>
autocmd User CocGitStatusChange {command}


" ctrlp
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif


set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor\|test'

" language server 
let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'typescript.tsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'python': ['/usr/local/bin/pyls'],
  \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
  \ 'vue': ['vls']
  \ }

" dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
