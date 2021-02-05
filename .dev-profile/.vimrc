"" Standard VIM Profile for Development
"" Copyright (C) 2014 Jaskirat M.S. Rajasansir
"" License BSD, see LICENSE for details


" *** INIT ***
set nocompatible
if ! len(glob("~/.vim_backup/"))
  silent !mkdir ~/.vim_backup > /dev/null 2>&1
endif
if ! len(glob("~/.vim_undo/"))
  silent !mkdir ~/.vim_undo > /dev/null 2>&1
endif

call pathogen#infect()                             " Pathogen load plugins


" *** GENERAL SETTINGS ***
set backspace=indent,eol,start                      " backspace works across lines
set hidden                                          " hide buffers, dont close
set history=10000                                   " A lot of command history
set ignorecase                                      " Ignore case when searching
set smartcase                                       " But enable it again if an upper case character is included
set wrapscan                                        " Searches wrap around EOF
set gdefault                                        " Applies substitutions globally on lines by default
set autoread                                        " Reads a file automatically when changed externally
set fileformats=unix,dos                            " Prefer UNIX file format over DOS (for Windows)
set fileformat=unix                                 " Default to UNIX (for Windows)

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%


" *** BACKUP AND UNDO ***
set backup                                          " Keep the backup regardless of write success
set backupskip=                                     " There are no files that shouldn't be backed up.
set updatetime=2000                                 " Write swap files after 2 seconds of inactivity.
set backupext=.vim.bk                               " All backups will be suffixed with this
set backupdir=~/.vim_backup                         " Backups stored in here
set directory=~/.vim_backup
set writebackup                                     " Make a backup of the original file when writing

set undolevels=1000                                 " A lot of undo levels
set undofile                                        " Undo previous actions even after you close and reopen a file
set undodir=~/.vim_undo                             " Put all undo files in one place


" *** TEXT FORMATTING - TABS ***
set shiftwidth=4                                    " Use indents of 4 spaces
set tabstop=4                                       " Indentation every 4 columns
set softtabstop=4
set expandtab                                       " Expand tabs to spaces
set autoindent                                      " Copy indent from previous line


" *** UI ***
set t_Co=256                                       " Ensure vim renders in 256-color mode
let g:solarized_termcolors=256
let g:solarized_termtrans=1

set ruler                                           " show where we are
set number                                          " line numbers
syntax on                                           " enable syntax highlighting
set cursorline                                      " Highlight the current line the cursor is on
set wildmenu                                        " Show all matches for auto-completion
set background=dark                                 " for solarized colour-scheme
colorscheme solarized

set title                                          " Show title in window titlebar
set hlsearch                                       " Highlight search
set incsearch                                      " Incremental search highlight
set showmatch                                      " Show matching braces
set mat=5                                          " Duration to show match
set laststatus=2                                   " Always show status line
set visualbell                                     " Disable audio bell, use visual instead
set scrolloff=5                                    " Start scrolling 5 lines before top/bottom
set sidescrolloff=5                                " Start scrolling 5 chars befrore left/right


" *** airline ***
if len(getbufinfo({'buflisted':1})) > 1            " Only show tab list if more than one file open
  let g:airline#extensions#tabline#enabled = 1
endif

let g:airline#extensions#tabline#formatter = 'unique_tail'

" *** gitgutter ***
let g:gitgutter_signs = 0
highlight clear SignColumn
let g:gitgutter_map_keys = 0


" *** KEY MAPPING ***
" Disable HELP on F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Allow :W and :Q
command W w
command Q q

" Tab switching via F7/F8
map <F7> :tabn<CR>
map <F8> :tabp<CR>

" Move vertically by visual line (rather than acutal line)
nnoremap j gj
nnoremap k gk


" *** Mappings ***
let mapleader = ","                                                            " Bring the leader key closer to the home row
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Show tab / psace issues
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
" List all open files
nnoremap <leader>ls :buffers<CR>
" Show git diff summary
nnoremap <leader>gd :GitGutterSignsToggle<CR>
