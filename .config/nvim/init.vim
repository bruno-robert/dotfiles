set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Also load the default vim configuration
source ~/.vimrc

call plug#begin('~/.vim/plugged')
" == Tools ==
" Vim Surround
Plug 'tpope/vim-surround'

" auto close brackets etc.
Plug 'raimondi/delimitmate'

" vim-sneak (better navigation/motion) use the s command followed by a 2
" letters, works just like f
Plug 'justinmk/vim-sneak'

" vim-easymotion use <Leader><Leader>w for example to highlight all word
" movements, this allows fast movement through a file
" You can also use it with f, b, w, t, etc.
Plug 'easymotion/vim-easymotion'

" vimwiki
Plug 'vimwiki/vimwiki'

" intellisense for vim (conquer of completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ful path fuzzy file buffer
Plug 'ctrlpvim/ctrlp.vim'

" file pane for vim
Plug 'preservim/nerdtree'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

" Reload files modified externaly
Plug 'djoshea/vim-autoread'

" Autoformating
Plug 'Chiel92/vim-autoformat'

" == Visuals ==
" Great little status bar for vim
Plug 'vim-airline/vim-airline'

" colorize hex values
Plug 'lilydjwg/colorizer'

" displays whitespace
Plug 'ntpeters/vim-better-whitespace'

" syntax highlight and more
Plug 'sheerun/vim-polyglot'

" == Language Support ==
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'

call plug#end()

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
