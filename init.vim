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
" for completion and snippets
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	
Plug 'matze/vim-move'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-fugitive'
Plug 'asheq/close-buffers.vim'
Plug 'bling/vim-bufferline'
Plug 'terryma/vim-smooth-scroll'
Plug 'kana/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'digitaltoad/vim-pug' 
Plug 'prabirshrestha/vim-lsp' 
Plug 'lighttiger2505/deoplete-vim-lsp'

" Plug 'konfekt/fastfold' 
" Plug 'pangloss/vim-javascript'
Plug 'tmux-plugins/vim-tmux-focus-events' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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

" coc multi cursors
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2 

" coc explorer
nmap <leader>e :CocCommand explorer<CR>

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


set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor\|test'

" language server 

" for php 
" npm i intelephense -g

" vue
" npm i vls -g && npx eslint --init
" active seting for vue and put a path
let g:LanguageClient_loadSettings=1
let g:LanguageClient_settingsPath='~/.config/nvim/vetur-settings.json' 

" javascript
"npm i typescript-language-server -g

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
  \ 'php': ['intelephense', '--stdio'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'typescript.tsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'python': ['/usr/local/bin/pyls'], 
  \ 'vue': ['vls'],
  \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-rename)

" deoplete
function SetLSPShortcuts()
  nnoremap gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap gr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
endfunction()

let g:deoplete#enable_at_startup = 1

augroup LSP
  autocmd!
  autocmd FileType cpp,c,javascript,typescript,vue,python,php call SetLSPShortcuts()
augroup END

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" dart
" let dart_html_in_string=v:true
" let g:dart_style_guide = 2
" let g:dart_format_on_save = 1 


" install python
" pyenv install 2.7.11
" pyenv install 3.4.4

" pyenv virtualenv 2.7.11 neovim2
" pyenv virtualenv 3.4.4 neovim3

" pyenv activate neovim2
" pip install neovim
" pyenv which python  # Note the path

" pyenv activate neovim3
" pip install neovim
" pyenv which python  # Note the path

" # The following is optional, and the neovim3 env is still active
" # This allows flake8 to be available to linter plugins regardless
" # of what env is currently active.  Repeat this pattern for other
" # packages that provide cli programs that are used in Neovim.
" pip install flake8
" ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH 

