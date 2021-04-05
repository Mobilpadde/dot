call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kien/rainbow_parentheses.vim'

Plug 'airblade/vim-gitgutter'

Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

Plug 'evanleck/vim-svelte'

Plug 'dense-analysis/ale'

Plug 'franbach/miramare'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

Plug 'sophacles/vim-processing'

Plug 'vim-crystal/vim-crystal'

Plug 'AndrewRadev/exercism.vim'

call plug#end()

set termguicolors

let mapleader = " "

let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
let g:miramare_transparent_background = 0
colorscheme miramare

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg <CR>

" comma / semicolon
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 1

" line indentions
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" crystal
let g:crystal_define_mappings = 1
let g:crystal_auto_format = 1

set listchars+=space:·
set rnu
set nu
set so=999
set sts=2
set ts=2
set sw=2
set et
set nohlsearch
