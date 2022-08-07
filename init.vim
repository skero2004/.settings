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

call plug#end()

" use <Tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

filetype on
syntax on
filetype plugin indent on

" set colorscheme
colorscheme atom-dark-256

" <C-n> for toggling nerdtree 
nmap <C-n> :NERDTreeToggle<CR>

" vimtex settings
let g:vimtex_view_general_viewer = 'mupdf'
