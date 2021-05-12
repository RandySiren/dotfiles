syntax on

"-----------BASIC SETTINGS------------
set relativenumber
set number
set nohlsearch
set noshowmatch
set noshowmode
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set ignorecase
set autoindent
set breakindent
set breakindentopt=shift:2,min:40
set wrap
set noswapfile
set nobackup
set undofile
set incsearch
set scrolloff=4
set cmdheight=1
set signcolumn=yes
set colorcolumn=80

filetype plugin indent on

"------------PLUGINS--------------
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme snazzy
let g:lightline = { 'colorscheme': 'darcula' }
let g:goyo_width = 80
let g:goyo_height = "65%"
set background=dark
set t_ut=


"-------------REMAPPINGS--------------
let mapleader = " "
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <Leader>pv :NERDTree<CR>
nnoremap <Leader>rg :Rg<CR>
nnoremap <C-f> :Files<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :Goyo<CR>

nnoremap <Leader>= :vertical resize -5<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :resize -5<CR>
nnoremap <Leader>_ :resize +5<CR>

inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

inoremap <C-c> <esc>
inoremap <C-e> <esc>A
nnoremap <C-e> <S-$>

" autocomplete during insert handling
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <silent> ge <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Buffers
nnoremap <Leader>; :Buffers<CR>
nnoremap <Leader><Leader> <c-^>

" Goyo stuff
autocmd! User GoyoEnter set relativenumber nu
