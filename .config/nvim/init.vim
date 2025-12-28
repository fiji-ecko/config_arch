set encoding=utf-8
" Не игнорировать регистр при поиске
set smartcase


" Подствечивать найденный патерн               
set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set relativenumber

filetype plugin indent on

call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'webhooked/kanso.nvim'
call plug#end()

colorscheme kanso

" Автоматическое откртие NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeShowHidden = 1

let g:airline_theme='deus'

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
