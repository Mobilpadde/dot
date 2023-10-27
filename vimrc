if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if (has("termguicolors"))
  set termguicolors
endif

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

-- Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

Plug 'ollykel/v-vim'

Plug 'NoorWachid/VimVLanguage'

Plug 'tpope/vim-surround'

-- Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'kien/ctrlp.vim'

Plug 'ervandew/supertab'

Plug 'franbach/miramare'
Plug 'sainnhe/forest-night'

Plug 'pangloss/vim-javascript'

Plug 'evanleck/vim-svelte'

Plug 'iloginow/vim-stylus'

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

Plug 'bling/vim-airline'
Plug 'jacoborus/tender.vim'

Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'

Plug 'irrationalistic/vim-tasks'

Plug 'goonzoid/vim-reprocessed'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

call plug#end()

set termguicolors

let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
let g:miramare_transparent_background = 0

colorscheme miramare

let mapleader = " "

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

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 1

map <C-q> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <F7> gg=G<C-o><C-o>

nmap <F8> :TagbarToggle<CR>

nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :Vista!!<CR>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg <CR>

" ,;
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" processing
let g:reprocessed_map_keys = 0
nnoremap <leader>1 :RunCurrentSketch<cr>

" prettier
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svelte PrettierAsync

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" airline
let g:airline_theme = 'tender'
set laststatus=2

set listchars+=space:·
set rnu
set nu
set so=999
set sts=2
set ts=2
set sw=2
set et

" go
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
