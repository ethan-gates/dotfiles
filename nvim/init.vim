""" Vim-Plug

call plug#begin('~/.local/share/nvim/plugged')

" Aesthetics
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'                 " Customize status/tabline
Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'atelierbram/Base2Tone-vim'               " Duotone syntax highlighting
"Plug 'blueyed/vim-diminactive'                 " Dim inactive windows
"Plug 'junegunn/goyo.vim'                       " Minimal, centered sessions
"Plug 'junegunn/limelight.vim'                  " Focused editing that dims surrounding text

" Tree explore
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Functionalities
Plug 'neovim/nvim-lspconfig'
Plug 'airblade/vim-gitgutter'                  " Show git diff markers
"Plug 'jiangmiao/auto-pairs'                    " Inserts/deletes brackets, parens, quotes in pairs
"Plug 'Shougo/deoplete.nvim'                    " Autocompletion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " CLI fuzzy finder (not a plugin, a wrapper for vim)
Plug 'junegunn/fzf.vim'                        " Plugin for fzf-based commands
"Plug 'scrooloose/nerdcommenter'                " Plugin for easy commenting
Plug 'sheerun/vim-polyglot'                    " Language packs
"Plug 'tpope/vim-sensible'                      " Universal set of vim defaults

" Extras
Plug 'dstein64/vim-startuptime'

" All Plugins must be added before the following line
call plug#end()

"----------------------------------------------------------------
"                          Aesthetics
"----------------------------------------------------------------

"Colors and syntax
set termguicolors     " enable true colors support
let ayucolor="mirage" " {mirage, dark, light}
colorscheme ayu

syntax enable
syntax on

"Windows and line numbers
"set nu
set splitbelow
set splitright

" Constrast line numbers
hi LineNr guifg=#a0a0a0
"git gutter bg that matches normal bg
hi SignColumn guibg=#212733


"----------------------------------------------------------------
"                         Navigation
"----------------------------------------------------------------

nnoremap <SPACE> <Nop>
let mapleader=" "

"Cycle to next buffer
nnoremap <leader>b :bn<CR>
"List buffers
nnoremap <leader>l :buffers<CR>
"Cycle to next window
nnoremap <leader>w <C-w><C-w>

"Fast scroll
nnoremap m 2<C-e>
nnoremap , 2<C-y>
set scrolloff=15

"Terminal escape to normal mode, but not for fzf
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>
"au BufLeave * tnoremap <Esc> <c-\><c-n>

"----------------------------------------------------------------
"                     Plugins Configuration
"----------------------------------------------------------------

"neovim/nvim-lspconfig
lua << EOF
--require'lspconfig'.solargraph.setup{}
EOF


"FZF
nnoremap ff :Files<CR>
nnoremap ft :Rg<CR>
nnoremap fb :Buffers<CR>

" Nvim tree
nnoremap <leader>n :NvimTreeToggle<CR>

"IndentBlankLine
command Indent IndentBlanklineToggle
let g:indent_blankline_enabled = v:false

"Nvim-tree
lua << EOF
require'nvim-tree'.setup{
	open_on_setup = true
}
EOF

"----------------------------------------------------------------
"                            Misc
"----------------------------------------------------------------

"Faster startup
let g:python3_host_skip_check = 1
let g:python_host_skip_check = 1

"""" File specific
au BufRead,BufNewFile Podfile.template set filetype=ruby
au BufRead,BufNewFile Podspec.template set filetype=ruby
au BufRead,BufNewFile Podfile.lock set filetype=yaml
