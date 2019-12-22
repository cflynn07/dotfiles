" Casey Flynn <cflynn.us@gmail.com>
" Dec 12, 2018

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim/killersheep'
Plug 'w0rp/ale'

call plug#end()

" -----------------------------------------------------------------------------
" General Config

let mapleader = ','
let g:NERDTreeNodeDelimiter = "\u00a0"

set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set noswapfile
set nowrap
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable cursor line position tracking:
:set cursorline
" Remove the underline from enabling cursorline:
:highlight clear CursorLine
" Set line numbering to red background:
:highlight CursorLineNR ctermbg=red

" Enable line numbers
set nu

" -----------------------------------------------------------------------------
" Colorscheme
colorscheme delek
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

" -----------------------------------------------------------------------------
" NERDTree configuration

" autocmd vimenter * NERDTree - disable NERDTree open on start
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" -----------------------------------------------------------------------------
" tcomment

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

" -----------------------------------------------------------------------------
" CtrlP

" Leader F is for file related mappîngs (open, browse...) 
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

" Ctrl B for buffer related mappings
nnoremap <silent> <Leader>b :CtrlPBuffer<CR> " cycle between buffer
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

" -----------------------------------------------------------------------------
" Lightline

set laststatus=2
set noshowmode

" -----------------------------------------------------------------------------
" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------------------------
" JSBeautify

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" -----------------------------------------------------------------------------
" ale

let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

" -----------------------------------------------------------------------------
" Emmet

let g:user_emmet_leader_key=','
