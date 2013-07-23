
" Turn off old vi compatibility (emulation of old bugs)
set nocompatible
behave mswin

" English, please - doesn't always work for some reason
" language en

filetype plugin on

execute pathogen#infect()

set encoding=utf-8
set fenc=utf-8

" Tabs as spaces, set to 4 and smart indenting stuff.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

if has('gui_running')
    " Fonts and colors for GUI:
   if has('win32')
       set guifont=Monospace:h12
   else
       set guifont=DejaVu\ Sans\ Mono\ 12
   endif

    " Remove the menu bar and toolbar.
   set guioptions-=m
   set guioptions-=T

    " Remove the scrool bar.
   set guioptions-=r
endif

colorscheme desert

" Set line width.
set tw=140

syntax on

" Virtual editing for moving cursor anywhare even if no char is there.
set virtualedit+=block

" Hide line numbers
set nonumber

" Keep backups in one place.
" set backup
" set backupdir=$vimruntime/.vim/backup
" set directory=$vimruntime/.vim/temp

set nobackup

set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Override 'ignorecase' when needed
set hlsearch    " Highlight search results
set showmatch   " Show matching bracket

" Hide mouse while typing
set mousehide

set scrolloff=3      " Lines visible above/below cursor when scrolling
set sidescrolloff=5  " Lines visible to the left/right of cursor when scrolling

set tabpagemax=128   "Maximum number of tabs open

" Automatically cd into the directory that the file is in.
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Turns off the annoying beeping. Edit: visualbell is even worse...
" set visualbell

" Key mappings
inoremap jj <esc>

let mapleader = ','
let maplocalleader = ','

" Some of the Crtl-W remapped to commma.
nnoremap <leader>, <c-w>w
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h

nnoremap <leader>J <c-w>J
nnoremap <leader>K <c-w>K
nnoremap <leader>L <c-w>L
nnoremap <leader>H <c-w>H

nnoremap <leader>o <c-w>o
nnoremap <leader>_ <c-w>_
nnoremap <leader>= <c-w>=

" Some usefull features 'over-mapped' by windows shortcuts.
nnoremap <leader>inc <c-a>
nnoremap <leader>dec <c-x>

" Edit vim config files (if they exist)
function! EditConfig()
    for config in ['$MYGVIMRC', '$MYVIMRC']
        if exists(config)
            execute 'tabedit '.config
        endif
    endfor
endfunction
nnoremap <leader>cfg :call EditConfig()<cr>

if has('win32')
    " Fancy transparency stuff for windows, needs vimtweak.dll
    function! EnableTransparency()
        call libcallnr("vimtweak.dll", "SetAlpha", 230)
        call libcallnr("vimtweak.dll", "EnableMaximize", 1)
        "call libcallnr("vimtweak.dll", "EnableTopMost", 1)
    endfunction
    noremap <silent> <f11> :call EnableTransparency()<cr>

    function! DisableTransparency()
        call libcallnr("vimtweak.dll", "SetAlpha", 255)
    endfunction
    noremap <silent> <s-f11> :call DisableTransparency()<cr>

    function! SetAlpha(alpha)
        call libcallnr("vimtweak.dll", "SetAlpha", a:alpha)
    endfunction
endif

if has('win32')
    " This doesn't seem to work...
    " set shell=C:\cygwin\bin\bash.exe
endif

" Plugin mappings
nnoremap <silent> <leader>n :NERDTree<cr>
nnoremap <silent> <leader>p :CtrlP<cr>
