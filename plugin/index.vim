
call plug#begin('~/.vim/plugged') 
" show tags
" Plug 'liuchengxu/vista.vim'
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
Plug 'tpope/vim-commentary'
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
" Plug 'hendrikpetertje/vimify' 
" current theme
Plug 'christoomey/vim-system-copy' 

" Plug 'sheerun/vim-polyglot'

" highlight vim
" Plug 'yuezk/vim-js' 
" dart
" Plug 'dart-lang/dart-vim-plugin'
" vue
" Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" scss
" Plug 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'sheerun/vim-polyglot'

" share snippets
Plug 'honza/vim-snippets' 
" dart
" Plug 'dart-lang/dart-vim-plugin'
Plug 'shime/vim-livedown'
" share snippets
Plug 'honza/vim-snippets' 

" coc vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" twig
Plug 'nelsyeung/twig.vim' 

" themes
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'wadackel/vim-dogrun'
Plug 'ajmwagar/vim-deus' 

" indent guid
Plug 'thaerkh/vim-indentguides' 
" marks
Plug 'kshenoy/vim-signature' 

Plug 'tpope/vim-sensible'

Plug 'mhinz/vim-startify'

Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/lib.kom' -- removed! You can remove it from your vimrc
Plug 'romgrk/barbar.nvim'

call plug#end() 

" coc
source $HOME/.config/nvim/plugin/coc.vim
" ctrlp
source $HOME/.config/nvim/plugin/ctrlp.vim
" fugitive
source $HOME/.config/nvim/plugin/fugitive.vim
" bar
source $HOME/.config/nvim/plugin/bar.vim
" markdown
source $HOME/.config/nvim/plugin/markdow.vim
