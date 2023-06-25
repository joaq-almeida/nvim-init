" Global settings "
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
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
set signcolumn=yes   " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any

" Remaps """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <C-s> :w!<cr>
nmap <space>qq :q!<cr>
nmap<C-s> <cmd>w<cr><esc>
vmap<C-s> <cmd>w<cr><esc>
smap<C-s> <cmd>w<cr><esc>
nmap<C-s> <cmd>w<cr><esc>

" Move to window using the <ctrl> hjkl keys
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Resize window using <ctrl> arrow keys
nmap <C-Up> <cmd>resize +2<cr>
nmap <C-Down> <cmd>resize -2<cr>
nmap <C-Left> <cmd>vertical resize -2<cr>
nmap <C-Right> <cmd>vertical resize +2<cr>

" Buffers
nmap <S-h> <cmd>bprevious<cr>
nmap <S-l> <cmd>bnext<cr>

" Create Close Files
nmap <space>n <cmd>enew<cr>
nmap <space>c <C-W>c

" Autocmds """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HighlightLightWordUnderCursor()
    if getline(".")[col("."-1)] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\v\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold, CursorHoldI * call HighlightWordUnderCursor()

" Plugins """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
   Plug 'dracula/vim', { 'as': 'dracula' }
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'preservim/nerdtree'
   Plug 'Xuyuanp/nerdtree-git-plugin'
   Plug 'nvim-lua/plenary.nvim'  "NEEDS RIPGREP AND FD"
   Plug 'nvim-telescope/telescope.nvim'
   Plug 'ryanoasis/vim-devicons'
   Plug 'jiangmiao/auto-pairs'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'sheerun/vim-polyglot'
   Plug 'dense-analysis/ale'
   Plug 'honza/vim-snippets'
   Plug 'jalvesaq/Nvim-R'
call plug#end()

" Themes """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula

" NERDtree"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
nnoremap <space>e :NERDTreeToggle<cr>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Airline """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_y = 0
let g:airline_section_z = 0

" Telescope """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help<cr>

" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1

" COC configuration """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Installed coc-json and coc-tsserver

let g:coc_global_extensions=[ 'coc-snippets', 'coc-omnisharp', 'coc-pyright', 'coc-r-lsp', 'coc-markdownlint', 'coc-tsserver', 'coc-json', 'coc-html' ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> K :call ShowDocumentation()<CR>

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


