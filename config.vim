
" Cloning vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Installing plugins:
" vim +BundleClean! +BundleInstall! +qall


" Turn off old vi compatibility (emulation of old bugs)
set nocompatible
behave mswin

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'

" JavaScript:

Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'

Bundle 'scrooloose/syntastic'
" This needs this:
" npm install -g jshint

" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

Bundle 'Valloric/YouCompleteMe'

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" English, please - doesn't always work for some reason
" language en

" execute pathogen#infect()

" Add better UTF-8 support.
scriptencoding utf-8
set encoding=utf-8
set fenc=utf-8
set enc=utf-8

" Tabs as spaces, set to 4 and smart indenting stuff.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" --- Haven't tried these yet:
" Improve the backspace key.
"set backspace=indent,eol,start
" Enable the tab complete menu.
"set wildmenu
" Corrects the spelling under the cursor with the first suggestion.
"nmap <leader>z 1z=u


" Disabled code folding. It can be weird sometimes.
set nofoldenable

if has('gui_running')
    " Fonts and colors for GUI:
   if has('win32')
"       set guifont=Monospace:h12
       set guifont=Consolas:h12
   else
       set guifont=DejaVu\ Sans\ Mono\ 12
   endif

    " Remove the menu bar and toolbar.
   set guioptions-=m
   set guioptions-=T

    " Remove the scrool bar.
   set guioptions-=r
endif

syntax enable

if has('gui_running')
    set background=dark
    if has('win32')
        colorscheme desert
    else
        colorscheme solarized " desert
    endif
else
    colorscheme desert
endif

" Set line width.
set tw=140

" Virtual editing for moving cursor anywhare even if no char is there.
set virtualedit+=block

" Hide line numbers
set nonumber

" Show the file name in the window title bar.
set title

" Disable backups.
set nobackup
set noswapfile

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

" Don't reset cursor to start of line when moving around.
set nostartofline

" Spelling
" Configure the spelling language and file.
set spelllang=en_us
" TODO: Consider adding a better spell file.
"set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell

" Automatically cd into the directory that the file is in.
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
autocmd BufEnter * silent! lcd %:p:h

" Remove any trailing whitespace that is in the file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Turns off the annoying beeping.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Key mappings
inoremap jj <esc>

let mapleader = ','
let maplocalleader = ','

" Some of the Ctrl-W remapped to commma.
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

" Clears the search. (c)
nmap <silent> <leader>c/ :nohlsearch<CR>

" Some usefull features 'over-mapped' by windows shortcuts.
nnoremap <leader>inc <c-a>
nnoremap <leader>dec <c-x>

inoremap <a-o> <cr><esc>O

" Plugin mappings
nnoremap <silent> <leader>n :NERDTree<cr>
nnoremap <silent> <leader>p :CtrlP<cr>

if has('win32')
    nnoremap <leader>hosts :tabe C:\Windows\System32\drivers\etc\hosts<cr>
endif

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

