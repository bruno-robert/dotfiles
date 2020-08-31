set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
