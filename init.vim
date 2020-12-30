set hidden 
set relativenumber
set smartcase 
let mapleader=" "
map <Leader>m :source $MYVIMRC<CR>
map <leader>; :Commentary<CR>
noremap <C-s> :w!<cr>
noremap <leader>b :CtrlPBuffer<CR> 
nnoremap <Leader>q :bufdo :Bdelete<CR>
noremap <leader>q :q<cr> 
setlocal foldmethod=expr

set nocompatible

let $LANG='en_US.UTF-8'
set clipboard=unnamed,unnamedplus 
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" let g:python_host_prog = '/Users/cheikkone/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/cheikkone/.pyenv/versions/neovim3/bin/python'

" move line 
map ∆ <A-j>
map ˚ <A-k>
map ˙ <A-h>
map ¬ <A-l> 

call plug#begin('~/.vim/plugged') 
" show tags
Plug 'liuchengxu/vista.vim'
" move blocks of text
Plug 'matze/vim-move'
" add short cut for copy and pass 
Plug 'roxma/vim-tmux-clipboard'
" allow to update vim status with tmux 
Plug 'tmux-plugins/vim-tmux-focus-events' 
" allow to move between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" share regestrie to tmux but is not required because the mode by default is clipboard='unnamed,unnamedplus' 
Plug 'roxma/vim-tmux-clipboard' 
" the master of git in vim
Plug 'tpope/vim-fugitive'
" close buffer easy 
Plug 'asheq/close-buffers.vim'
" Plug 'bling/vim-bufferline'
Plug 'cohama/lexima.vim'
" add commentary on all languages
Plug 'preservim/nerdcommenter'
" Plug 'tpope/vim-commentary'
" easy surround
Plug 'tpope/vim-surround'
" search files on all vim
Plug 'kien/ctrlp.vim' 
" multi cursor on vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
" show regestrie and macro
Plug 'junegunn/vim-peekaboo'
" easy move
Plug 'easymotion/vim-easymotion'
" spotify
Plug 'hendrikpetertje/vimify' 
" Plug 'tpope/vim-abolish'
Plug 'lucasprag/simpleblack'
" current theme
Plug 'christoomey/vim-system-copy' 
" highlight vim
Plug 'yuezk/vim-js' 
" dart
Plug 'dart-lang/dart-vim-plugin'
" vue
Plug 'posva/vim-vue'
" scss
Plug 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plug 'cakebaker/scss-syntax.vim'
" Plug 'sheerun/vim-polyglot'

" share snippets
Plug 'honza/vim-snippets' 
" dart
Plug 'dart-lang/dart-vim-plugin'
" share snippets
Plug 'honza/vim-snippets' 
" coc vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" themes
Plug 'ayu-theme/ayu-vim' "
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'ulwlu/elly.vim' 
" indent guid
Plug 'thaerkh/vim-indentguides' 
" marks
Plug 'kshenoy/vim-signature' 
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'

call plug#end() 
" Theme

" set background=dark
set termguicolors 
let g:quantum_italics=1
let g:quantum_black=1
" colorscheme quantum
" let ayucolor="light"  " for light version of theme
colorscheme ayu
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme elly
" colorscheme simpleblack


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

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor\|vendors\|dist\' 

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
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

" coc

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', '.eslintrc']

let g:coc_global_extensions = [ 
      \'coc-explorer', 
      \'coc-todolist', 
      \'coc-git', 
      \'coc-tailwindcss',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-vetur',
      \'coc-tsserver', 
      \'coc-snippets', 
      \'coc-flutter', 
      \]

" \'coc-tabnine', 
" \'coc-html',

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
set hidden 
set nobackup
set nowritebackup 
set cmdheight=2 
set updatetime=800 
set shortmess+=c 

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" completion 
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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> <leader>j <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>k <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format') 
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>) 
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
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
" Resume latest coc list.  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" autocmd FileType vue let b:coc_suggest_disable = 1

" explorer 
nmap <space>e :CocCommand explorer<CR>

" coc-lsp

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'vue',
      \ 'help'
      \]
" ag 
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" preview 
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

" git 
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap <leader>f <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap <leader>d <Plug>(coc-git-prevchunk)
nmap <leader>f <Plug>(coc-git-nextchunk)

" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)

" show chunk diff at current position
nmap <leader>gs <Plug>(coc-git-chunkinfo)
nmap gs <Plug>(coc-git-chunkinfo)


" show commit contains current position
nmap gc <Plug>(coc-git-commit)

" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" coc-snippets

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" tags
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
     \   'method': 'NearestMethodOrFunction'
      \ },
      \ }



" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'typescript': 'vim_lsp',
  \ 'javascript': 'vim_lsp',
  \ 'vue': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>


autocmd BufReadPost fugitive:///*//2/*,fugitive:///*//3/* setlocal nomodifiable readonly


" indent guid
let g:indentguides_ignorelist = ['text']

let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'



" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='elly' 

let g:lightline = {
      \ 'colorscheme': 'elly',
      \ }


" dart
let g:lsc_auto_map = v:true
let g:lsc_enable_autocomplete = v:true
au BufRead,BufNewFile *.dart set filetype=dart


" vimeasy modification

" Gif config

" vim easy_motion

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction


" smartcase
let g:EasyMotion_smartcase = 1 

" spotify
let g:spotify_token='NmUzYjQzMmRhZjNkNDViZmJlNDRjNDBlYTFhZjE4MmI6MjM2NDA5Y2Q2ZmRmNGRjZGIzOGVhODY2OTFlYmYyYmI='

" Fzf 
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"' 

" fugitive vim 
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" vue
let g:vue_pre_processors = ['html', 'scss']

" commentary
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

map <leader>; <plug>NERDCommenterToggle

" nerdcommenter
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" scss
au BufRead,BufNewFile *.scss set filetype=scss.css

" vim-airline
let g:airline#extensions#whitespace#enabled = 0 
