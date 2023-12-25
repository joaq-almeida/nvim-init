""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

"""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETTING
"""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
 " Here goes the plugins
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'jalvesaq/Nvim-R'
 Plug 'sheerun/vim-polyglot'
 Plug 'preservim/nerdtree'
 Plug 'jiangmiao/auto-pairs'
 Plug 'itchyny/lightline.vim'
 Plug 'numToStr/Comment.nvim' 
 Plug 'itchyny/vim-gitbranch'
 Plug 'ellisonleao/gruvbox.nvim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox theme 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

"""""""""""""""""""""""""""""""""""""""""""""
" MAPPING SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
let maplocalleader = " "

" Some keys to exit insert and visual mode.
inoremap qq <Esc>
vnoremap qq <Esc>
tnoremap qq <Esc> <C-\><C-n> 


" Open terminal inside Vim
map <space>tt :vnew term://bash<CR>

" Split windows
map <space>3 :vsplit<CR>
map <space>2 :split<CR>
map <space>k :bdelete<CR>

" move panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remaps for saving and quitting Vim
nmap <C-s> :w!<cr>
nmap <space>qq :q!<cr>

" PLUGIN: FZF mappings
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>g :Commits<CR>
nnoremap <silent> <space>H :Helptags<CR>
nnoremap <silent> <space>hh :History<CR>

" NERDTree mappings
nmap <space>e :NERDTreeToggle<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <A-Left> :vertical resize +3<CR>
noremap <silent> <A-Right> :vertical resize -3<CR>
noremap <silent> <A-Up> :resize +3<CR>
noremap <silent> <A-Down> :resize -3<CR>

