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
set nowritebackup
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
set signcolumn=yes
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
Plug 'kovetskiy/sxhkd-vim'
Plug 'lambdalisue/suda.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'kovetskiy/sxhkd-vim'

call plug#end()

filetype on
syntax on
filetype plugin indent on

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" set colorscheme
colorscheme atom-dark-256

" <C-n> for toggling nerdtree 
nmap <C-n> :NERDTreeToggle<CR>

" vimtex settings
let g:vimtex_view_general_viewer = 'mupdf'
