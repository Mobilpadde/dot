call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'kien/ctrlp.vim'

Plug 'ervandew/supertab'

Plug 'sainnhe/vim-color-forest-night'

Plug 'pangloss/vim-javascript'

Plug 'evanleck/vim-svelte'

Plug 'iloginow/vim-stylus'

Plug 'valloric/youcompleteme'

Plug 'dense-analysis/ale'

Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'

call plug#end()

set termguicolors
colorscheme forest-night

let NERDTreeShowHidden = 1
let go_fmt_autosave = 1

let g:go_fmt_command = "goimports"
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-tab>', '<2-LeftMouse>'],
  \}

map <C-q> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <F7> gg=G<C-o><C-o>

nnoremap <leader>a :cclose<CR>

set listchars+=space:·
set rnu
set nu
set so=999
set sts=2
set ts=2
set sw=2
set et
