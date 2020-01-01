" Casey Flynn <cflynn.us@gmail.com>
" Dec 12, 2018

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
" Plug 'airblade/vim-gitgutter'
" ---
" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows
" which lines have been added, modified, or removed. You can also preview,
" stage, and undo individual hunks; and stage partial hunks. The plugin also
" provides a hunk text object.
"
" Plug 'editorconfig/editorconfig-vim'
" ---
" EditorConfig helps maintain consistent coding styles for multiple developers
" working on the same project across various editors and IDEs. The
" EditorConfig project consists of a file format for defining coding styles
" and a collection of text editor plugins that enable editors to read the file
" format and adhere to defined styles. EditorConfig files are easily readable
" and they work nicely with version control systems.
"
" Plug 'frazrepo/vim-rainbow' *performance issues
"   ALT /luochen1990/rainbow
"
" Plug 'godlygeek/tabular'
" ---
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" Sometimes, it's useful to line up text. Naturally, it's nicer to have the
" computer do this for you, since aligning things by hand quickly becomes
" unpleasant. While there are other plugins for aligning text, the ones I've
" tried are either impossibly difficult to understand and use, or too
" simplistic to handle complicated tasks. This plugin aims to make the easy
" things easy and the hard things possible, without providing an unnecessarily
" obtuse interface. It's still a work in progress, and criticisms are
" welcome.
" 
" Plug 'maksimr/vim-jsbeautify'
Plug 'sheerun/vim-polyglot'
" ---
" A collection of language packs for Vim.
"
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" This adds syntax for nerdtree on most common file extensions. Whether you
" want to easily see what is going on in a new project, trying to learn a new
" framework with a different folder structure, or just trying to make your
" NERDTree look better, this plugin can help you. This is intended to be used
" with vim-devicons to add color to icons or entire labels, but will work
" without it. It is possible to disable highlight, but the syntax will still
" be available if you want to make something specific with it. The file icons
" are linked to their labels which are linked to NERDTreeFile, so it will not
" break anything.
"
" Plug 'tomtom/tcomment_vim'
" ---
" tcomment provides easy to use, file-type sensible comments for Vim. It can
" handle embedded syntax.

" Plug 'vim-scripts/taglist.vim'
" ---
" The "Tag List" plugin is a source code browser plugin for Vim and provides
" an overview of the structure of source code files and allows you to
" efficiently browse through source code files for different programming
" languages.
"
" Plug 'vim/killersheep'
" ---
" Game
"
Plug 'dense-analysis/ale'
" ---
" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
" checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your
" text files, and acts as a Vim Language Server Protocol client.
"
Plug 'gcmt/taboo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
" ---
" emmet-vim is a vim plug-in which provides support for expanding
" abbreviations similar to emmet.
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'

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
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

" -----------------------------------------------------------------------------
" Syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------------------------
" JSBeautify

"map <c-f> :call JsBeautify()<cr>
"" or
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
"" for json
"autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
"" for jsx
"autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
"" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" -----------------------------------------------------------------------------
" ale

let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

" -----------------------------------------------------------------------------
" Taboo
let g:taboo_tab_format=' %N %f%m(%W) '
let g:taboo_renamed_tab_format=' %N %l(%W) '

" -----------------------------------------------------------------------------
" Emmet

let g:user_emmet_leader_key=','

" -----------------------------------------------------------------------------
" Vim-Rainbow

let g:rainbow_active = 1
