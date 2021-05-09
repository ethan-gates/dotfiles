""" Vim-Plug

call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'                 " Customize status/tabline
"Plug 'atelierbram/Base2Tone-vim'               " Duotone syntax highlighting
"Plug 'blueyed/vim-diminactive'                 " Dim inactive windows
"Plug 'junegunn/goyo.vim'                       " Minimal, centered sessions
"Plug 'junegunn/limelight.vim'                  " Focused editing that dims surrounding text

" NERDTree
Plug 'scrooloose/nerdtree'                     " File tree explorer
"Plug 'Xuyuanp/nerdtree-git-plugin'             " Shows git status flags
Plug 'ryanoasis/vim-devicons'                  " Adds filetype-specific icons

" Functionalities
"Plug 'airblade/vim-gitgutter'                  " Show git diff markers
"Plug 'jiangmiao/auto-pairs'                    " Inserts/deletes brackets, parens, quotes in pairs
"Plug 'Shougo/deoplete.nvim'                    " Autocompletion
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " CLI fuzzy finder (not a plugin, a wrapper for vim)
"Plug 'junegunn/fzf.vim'                        " Plugin for fzf-based commands
"Plug 'scrooloose/nerdcommenter'                " Plugin for easy commenting
Plug 'sheerun/vim-polyglot'                    " Language packs
"Plug 'tpope/vim-sensible'                      " Universal set of vim defaults

" All Plugins must be added before the following line
call plug#end()

"Colors and syntax
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
let ayucolor="light"  " for light version of theme
colorscheme ayu

syntax enable
syntax on

"Windows and line numbers
set number
set splitbelow
set splitright

"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr guifg=#a0a0a0

"Window navigation
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"Faster startup
let g:python3_host_skip_check = 1
let g:python_host_skip_check = 1


"NerdTree
nnoremap <leader>n :vert e.<CR>









