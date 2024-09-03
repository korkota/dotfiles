set scrolloff=8
set number
set relativenumber

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set hlsearch

call plug#begin()
Plug 'easymotion/vim-easymotion'
" Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
call plug#end()

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
colorscheme industry
set background=dark

let mapleader = " "

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>

