if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'kien/ctrlp.vim'

Plug 'ervandew/supertab'

Plug 'franbach/miramare'

Plug 'pangloss/vim-javascript'

Plug 'evanleck/vim-svelte'

Plug 'iloginow/vim-stylus'

Plug 'valloric/youcompleteme'

Plug 'dense-analysis/ale'

Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'

Plug 'rust-lang/rust.vim'

Plug 'liuchengxu/vista.vim'

Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'natebosch/vim-lsc'

Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/indentLine'

Plug 'unblevable/quick-scope'

call plug#end()

set termguicolors
colorscheme miramare

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 60
let g:vista_fzf_preview = ['bottom:35%']

let NERDTreeShowHidden = 1
let go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<c-tab>', '<2-LeftMouse>'],
      \}

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" line indentions
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" navigation
let g:qs_highlight_on_keys = ['f', 'F']

map <C-q> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <F7> gg=G<C-o><C-o>

nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :Vista!!<CR>

" fzf
nnoremap <leader>f :Files<CR>

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set listchars+=space:·
set rnu
set nu
set so=999
set sts=2
set ts=2
set sw=2
set et
set laststatus=2
