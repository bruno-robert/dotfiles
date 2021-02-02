set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')

" auto close brackets etc.
Plug 'raimondi/delimitmate'

" vimwiki
Plug 'vimwiki/vimwiki'

" vim-sneak (better navigation/motion) use the s command followed by a 2
" letters, works just like f
Plug 'justinmk/vim-sneak'

" intellisense for vim (conquer of completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ful path fuzzy file buffer
Plug 'ctrlpvim/ctrlp.vim'

" vim-easymotion use <Leader><Leader>w for example to highlight all word
" movements, this allows fast movement through a file
" You can also use it with f, b, w, t, etc.
Plug 'easymotion/vim-easymotion'

" Great little status bar for vim
Plug 'vim-airline/vim-airline'

" file pane for vim
Plug 'preservim/nerdtree'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

" colorize hex valuec
Plug 'lilydjwg/colorizer'

" Reload files modified externaly
Plug 'djoshea/vim-autoread'

Plug 'posva/vim-vue'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-surround'

" syntax highlight and more
Plug 'sheerun/vim-polyglot'

Plug 'hdima/python-syntax'
call plug#end()

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
