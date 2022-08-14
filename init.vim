if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

set nocompatible
set ttyfast
set lazyredraw
set confirm
set ruler
set nobackup
set autoindent
set number
set hlsearch
set cursorline
set showmatch
set nostartofline
set showmode
set wildmenu
set smarttab
set wildmode=list:longest
set mouse=a
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"numerical settings
set scrolloff=5
set shiftwidth=4
set tabstop=4
set history=100
set updatetime=300
set cmdheight=2

"toggle
set pastetoggle=<F11>

"vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'lambdalisue/suda.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'dpelle/vim-LanguageTool'
Plug 'lervag/vimtex'
Plug 'Maxattax97/coc-ccls'
Plug 'pangloss/vim-javascript'
Plug 'deoplete-plugins/deoplete-clang'

call plug#end()

filetype on
syntax on
filetype plugin indent on

"Coc selection
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
  " remap for complete to use tab and <cr>
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <c-space> coc#refresh()

" set colorscheme
colorscheme atom-dark-256

" <C-n> for toggling nerdtree 
nmap <C-n> :NERDTreeToggle<CR>

" vimtex settings
let g:vimtex_view_general_viewer = 'mupdf'
