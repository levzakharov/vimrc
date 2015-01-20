set nocompatible                " Make Vim more useful, keep at the beginning
set laststatus=2                " Show statusline
set encoding=utf8
set clipboard=unnamed           " Use the OS clipboard by default (on versions compiled with `+clipboard`)
syntax on                       " Enable syntax highlighting
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " Show the filename in the window titlebar
set visualbell                  " do not beep
set noerrorbells
set cursorline                  " Highlight current line
set tabstop=4                   " Make tabs as wide as two spaces
set showmatch
set backspace=indent,eol,start  " Allow backspace in insert mode
set ttyfast                     " Optimize for fast terminal connections
set gdefault                    " Add the g flag to search/replace by default
set binary
set noeol                       " Don’t add empty newlines at the end of files
set modeline                    " Respect modeline in files
set ignorecase                  " Ignore case of searches
set hlsearch                    " Highlight searches
set smartindent
set shiftwidth=4
set expandtab
set ruler                       " Show the cursor position
set showmode                    " Show the current mode
set modelines=4
set t_Co=256                    " Set 256 colors
set relativenumber

set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

color peachpuff

"[Hide/show the white-space and more invisible symbols]"
set list
set listchars=tab:\|-,trail:-
set nojoinspaces

" Switch between relative and absolute line number
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

function! Compile()
    if &ft == "cpp"
        execute '!clear && g++ %'
    elseif &ft == "pascal"
        execute '!clear && fpc %'
    endif
endfunc

function! Run()
    if &ft == "cpp"
        execute '!clear && ./a.out'
    elseif &ft == "python"
        execute '!clear && python %'
    elseif &ft == "pascal"
        execute '!clear && ./a'
    endif
endfunc

map <leader>b :call Compile()<cr>
map <C-b> :call Run()<cr>

" airline customization
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline_section_b='%{strftime("%c")}'

filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree.git'
nmap <leader>d :NERDTreeToggle<CR>

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" vim-airline
Plugin 'bling/vim-airline'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Tabular
Plugin 'godlygeek/tabular'

" delitMate
Plugin 'Raimondi/delimitMate'

" SuperTab
Plugin 'ervandew/supertab'

" --- Python ---
" Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
" Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
" Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" All of your Plugins must be added before the following line
call vundle#end()            " equired
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


