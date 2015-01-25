"" Standard VIM Profile for Development
"" Copyright (C) 2014 Jaskirat M.S. Rajasansir
"" License BSD, see LICENSE for details


" *** INIT ***
set nocompatible
if ! len(glob("~/.vim_backup/"))
  silent !mkdir ~/.vim_backup > /dev/null 2&1
endif

call pathogen#infect()                             " Pathogen load plugins
set t_Co=256
let g:solarized_termcolors=256                     " For solarized colourscheme
let g:solarized_termtrans=1


" *** GENERAL SETTINGS ***
set backspace=indent,eol,start                      " backspace works across lines
set hidden                                          " hide buffers, dont close
set history=10000                                   " A lot of command history
set ignorecase                                      " Ignore case when searching
set smartcase                                       " But enable it again if an upper case character is included
set wrapscan                                        " Searches wrap around EOF
set gdefault                                        " Applies substitutions globally on lines by default
set autoread                                        " Reads a file automatically when changed externally

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


" *** TEXT FORMATTING - TABS ***
set shiftwidth=4                                    " Use indents of 4 spaces
set tabstop=4                                       " Indentation every 4 columns
set softtabstop=4
set expandtab                                       " Expand tabs to spaces
set autoindent                                      " Copy indent from previous line


" *** UI ***
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

let mapleader = ","                                 " Bring the leader key closer to the home row

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" List all open files
map <leader>ls :buffers<CR>


" *** Status Line Formatting ** 
" Default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=\ %f                                 " File name
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},   " File encoding
set statusline+=\ %{&ff}]                           " File format
set statusline+=\ %y                                " Filetype
set statusline+=\ %m                                " Modified flag
set statusline+=\%r                                 " Read only flag
set statusline+=\ %=                                " Align left
set statusline+=\ %{HasPaste()}                     " Have we enabled paste mode?
set statusline+=\ Line:%l/%L[%p%%]                  " Line X of Y [percent of file]
set statusline+=\ Col:%c\                           " Current column


" *** Functions ***
function! HasPaste()
    if &paste
        return '[PASTE MODE]'
    en
    return ''
endfunction
