syntax on
set relativenumber
call plug#begin('~/.vim/plugged')
Plug 'sickill/vim-monokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdtree'
call plug#end()
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver']
map <C-n> :NERDTreeToggle<CR>
imap jj <Esc>
let NERDTreeShowHidden=1
colorscheme monokai
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
