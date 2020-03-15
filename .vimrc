syntax on
set number
set relativenumber
call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
call plug#end()
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver']
colorscheme snazzy
