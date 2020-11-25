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

Plug 'maralla/completor.vim'
Plug 'konfekt/fastfold' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	
Plug 'junegunn/fzf.vim'
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

" Plug 'SirVer/ultisnips'

" Plug 'pangloss/vim-javascript'
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

let g:LanguageClient_serverCommands = {
  \ 'php': ['intelephense', '--stdio'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'typescript.tsx': ['javascript-typescript-stdio', '--stdio'],
  \ 'python': ['/usr/local/bin/pyls'],
  \ 'vue': ['vls']
  \ }

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

augroup LSP
  autocmd!
  autocmd FileType cpp,c,javascript,typescript,vue,python,php call SetLSPShortcuts()
augroup END
" dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


""""""""""" coc vim """"""" 
" TextEdit might fail if hidden is not set.
set hidden 
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup 
" Give more space for displaying messages.
set cmdheight=2 
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300 
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c 
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename) 
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" NOTE: Please see `:h coc-status` for integrations with external plugins that
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>et  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
