set nocompatible              " Be iMproved, required
filetype off                  " Required

""""""""""""""""""""""""
" Vundle Plugins Begin "
""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
:let mapleader = ","
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'fugitive.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tomasiser/vim-code-dark'
Plugin 'leafgarland/typescript-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dense-analysis/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'surround.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required

""""""""""""""""""""""""""
" Syntax and Indentation "
""""""""""""""""""""""""""

filetype plugin indent on    " required
syntax on "Enable syntax highlighting

set shiftwidth=2 "New line indent
set autoindent
set smartindent

set ts=2 "2 Space tab
set sts=2 "For backspace to delete 2 spaces
set et "To convert tabs to spaces

set foldmethod=indent "Code collapse on indentation
set foldnestmax=10 "Limit nesting of folds
set nofoldenable "Disable folding while opening the file
set foldlevel=2 "To not fold first and last lines

set diffopt+=vertical "Always split vim panes vertically

colorscheme synthwave "Get this ColorScheme here - https://github.com/TroyFletcher/vim-colors-synthwave

set number relativenumber "For line numbers relative to current line number 
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

map <C-n> :NERDTreeToggle<CR>

""""""""""""""
" ALE Config "
""""""""""""""
let g:ale_fixers = {
      \  'javascript': ['standard'],
      \  'typescript': ['tslint']
      \}
let g:ale_linters_ignore = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let b:ale_linters = []
let g:ale_echo_cursor = 0 

"""""""""""""""""
" Ctrl-P config "
"""""""""""""""""
" Fuzzy file search

let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }

""""""""""""""""
" Emmet config "
""""""""""""""""
" HTML auto completion

let g:user_emmet_leader_key=','

""""""""""""""""""""
" Buffer shortcuts "
""""""""""""""""""""
" Leader + k - Jump to next file in buffer
" Leader + j - Jump to previous file in buffer
" Leader + d - Remove file from buffer
" Leader + v - List all files in the buffer

nnoremap <leader>k :bn<cr> 
nnoremap <leader>j :bp<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>v :ls<cr>

" Leader + w - Save (write) current file
noremap <leader>w :w<CR>

" Leader + q - Quit current file
noremap <leader>q :q<CR>

" Yank(Copy)
" leader + y - copy selected text to + register
" leader + p - paste text from + register after the cursor
" leader + P - paste text from + register before the cursor
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>p "+P

" Easy navigation in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" current position line
map <leader>. :set cul! cuc!<cr>|"Toggle cursor crosshair. Great when you get a big monitor and you're jumping around.

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
