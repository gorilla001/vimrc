"syntax on
"set number
"filetype on
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"
"" Pathogen load
""filetype off
"
""call pathogen#infect()
""call pathogen#helptags()
"
""filetype plugin indent on
"syntax on
"
"" Override go-to.definition key shortcut to Ctrl-]
""let g:pymode_rope_goto_definition_bind = "<C-]>"
""
"" " Override run current python file key shortcut to Ctrl-Shift-e
""let g:pymode_run_bind = "<C-S-e>"
""
"" " Override view python doc key shortcut to Ctrl-Shift-d
""let g:pymode_doc_bind = "<C-S-d>"
"
""let g:pymode_folding = 0
""let g:pymode_lint = 0
""let g:pymode_lint_on_write = 1
""let g:pymode_lint_message = 1
""let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
""let g:pymode_lint_sort = []
"autocmd BufRead *.py setlocal colorcolumn=0
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Syntax Checking/Highlighting

Plugin 'scrooloose/syntastic'
let python_highlight_all=1
syntax on

"Color Schemes

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

call togglebg#map("<F5>")

"File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree
"map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrowExpandable = '＋'
let g:NERDTreeDirArrowCollapsible = '－'
let NERDTreeMinimalUI=1

"Super Searching
Plugin 'kien/ctrlp.vim'

"Line Numbering
set nu

"Git Integration
Plugin 'tpope/vim-fugitive'

"Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"System clipboard
set clipboard=unnamed

"VIM in the Shell
"set editing-mode vi

"Comments
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu
let mapleader=';'

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
