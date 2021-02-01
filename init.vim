" Based largely on the webpage from jdhao's blog
" https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
" =========================================
" Basic configuration
" =========================================
let dotvim = "$HOME/.config/nvim/"

" =========================================
" Plugin Setup - Start
" =========================================
call plug#begin("~/.config/nvim/plugged")
	" Jedi Vim Plugin
	Plug 'davidhalter/jedi-vim'
	" Deoplete Plugin
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Deoplete Jedi
	Plug 'zchee/deoplete-jedi'
	" Airline plugin
	Plug 'vim-airline/vim-airline'	
	Plug 'vim-airline/vim-airline-themes'
	" Auto pairs
	Plug 'jiangmiao/auto-pairs'
	" Nerdcommenter
	Plug 'scrooloose/nerdcommenter'
	" Code Auto-format plugin
	Plug 'sbdchd/neoformat'
	" Nerdtree
	Plug 'scrooloose/nerdtree'
	" Code checker
	Plug 'neomake/neomake'
	" Multiple cursors
	Plug 'terryma/vim-multiple-cursors'
	" Highlight yank area
	Plug 'machakann/vim-highlightedyank'
	" Code Folding
	Plug 'tmhedberg/SimpylFold'
	" Jellybeans Color scheme
	Plug 'nanotech/jellybeans.vim'
	" Vim extension for Ag
	Plug 'mileszs/ack.vim'
call plug#end()

" ================================
" Plugin Settings
" ================================
" Configure ack.vim for using Ag
let g:ackprg = 'ag --vimgrep'

" Enable the deoplete at startup
let g:deoplete#enable_at_startup = 1
" Set airline theme name
let g:airline_theme='bubblegum'
" Neoformat 
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Jedi configuration
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Pylint
let g:neomake_python_enabled_makers = ['pylint']

" Color theme setup
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

" ================================
" General
" ================================
" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or nowhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
set switchbuf=useopen

" =========================================
" Key Mappings
" =========================================
" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p
" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>
" better ESC
inoremap <C-k> <Esc>
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Change directory automatically to the one containing the file
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" Relative line numbering
if exists('+relativenumber')
  set relativenumber
  set number
endif


" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

if has("gui_vimr")
	source ~/.config/nvim/ginit.vim
endif
