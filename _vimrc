" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Ack
" nose, django-nose
" pylint

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Pytest
"     Runs your Python tests in Vim.
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Minibufexpl
"    Visually display what buffers are currently opened
"
" Pydoc
"    Opens up pydoc within vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" Py.test
"    Run py.test test's from within vim
"
" MakeGreen
"    Generic test runner that works with nose
"
" PyLint
"    Analyzes Python source code looking for bugs and signs of poor quality.
"
" Conque
" Conque is a Vim plugin which allows you to run interactive programs, such as
" bash on linux or powershell.exe on Windows, inside a Vim buffer. In other
" words it is a terminal emulator which uses a Vim buffer to display the
" program output.
" http://code.google.com/p/conque
"
" Ag-vim
" This plugin is a front for ag, A.K.A. the_silver_searcher. Ag can be used as
" a replacement for 153% of the uses of ack. This plugin will allow you to run
" ag from vim, and shows the results in a split window.
" https://github.com/rking/ag.vim
"
" EasyGrep
" EasyGrep is a plugin for performing search and replace operations through
" multiple files. 
" http://vim.sourceforge.net/scripts/script.php?script_id=2438
"
" LustyExplorer
" LustyExplorer is a fast and responsive way to manage files and buffers in
" Vim.  It includes a filesystem explorer, a buffer switcher, and a buffer
" grep for searching through and switching between files and buffers quickly,
" all through a mostly common interface. 

" ############ SETTINGS ###################
" This must be first, because other otpions as a side effects.
set nocompatible      " Don't be compatible with vi

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Disable intro screen
set shm=atI

" Improve redrawing for newer computers
set ttyfast

" Disable backup
set nobk nowb noswf

"Only undo up to 150
set undolevels=150

" Allow backspacing over anything
set bs=2

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Store lots os :cmdline history
set history=1000

" Show incomplete cmds down the bottom
set showcmd

" Show current mode down the bottom
set showmode

" Disable visual bell
set vb

" Show breakline
set showbreak=...

" Setting font
set guifont=Courier\ New\ 8

" Vertical/horizontal scroll off setting
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Wild Mode
" Make cmdline tab completation similar to bash
set wildmode=full
" Enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

" Ignore these files when completation
set wildignore+=*.o,*.obj,.git,*.pyc

" Setting colorscheme
colorscheme transparent

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

" displays tabs with :set list & displays when a line runs off-screen
"set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list
set hidden

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a regex

" Removing tool bar
set guioptions-=T

" Setting cursor-line ON
set cursorline

" Setting number line ON
set number
set numberwidth=1

" Enable mouse support, unless in insert mode
set mouse=v
set ttymouse=xterm2

" Show title on console title bar
set title

" Replace the default rep programa with ack
let g:ackprg="ag --column --color-match --line-numbers"
set grepprg=ag
set grepformat=%f:%l:%c:%m

" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

" Insert completation
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6                   "Keep a small completation window

" Show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location$
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set matchtime=2             " (for only .2 seconds).
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidthd
set matchpairs+=<:>         " show matching <> (html mainly) as well$
set foldmethod=indent       " allow us to fold on indents$
set foldlevel=99            " don't fold by default$

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Automatic closing brakets
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" ===================================================================== "
" Setting this when need to log vim.
" mkdir ~/.log/vim
" ===================================================================== "
"set verbosefile=~/.log/vim/verbose.log
"set verbose=2
" ===================================================================== "

" ===================================================================== "
" Pathogen - Allows us to organize our vim plugins
" ====================================================================  "
filetype off
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" try to detect filestypes
filetype on
" turn on synthax highlighting
syntax on


" ##### KEY MAPPING #####
let mapleader=","

" Toggle the task list
map <leader>td <Plug>TaskList

" Run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
nmap <silent><Leader>ts <Esc>:Pytest session<CR>
nmap <silent><Leader>tv <Esc>:Pytest verbose<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Run pep8
"let g:pep8_map='<leader>8'

" ,v  brings up my .vimrc
" ,V reload the .vimrc -- makign all change active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quick window$
nmap <leader>o :copen<CR>
nmap <leader>oo :cclose<CR>

" For when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" save file (ctrl-s)
map <C-s> :w<CR>

" copy selected text (ctrl-c)
vmap <C-c> +y

" paste clipboard contest (ctrl-v)
imap <C-p> <esc>P

" cut selected text (ctrl-x)
vmap <C-x> x

" Open new file dialog (ctrl-n)
map <C-n> :browse confirm e<cr>

" Open save-as dialog (ctrl-shift-n)
map <C-S-s> :browse confirm saveas<cr>

" NERDTree Close
map <leader>nn :NERDTree<cr>

" NERDTree Open
map <leader>nc :NERDTreeClose<cr>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Buffer cycling
map <C-right> <ESC>:bn<cr>
map <C-left> <ESC>:bp<cr>

" Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

" Key to remove duplicated lines.
map ,d <esc>:%s/\(^\n\{2,}\)/\r/g<CR>

" Ag searching
nmap <leader>a <ESC>:Ag!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Run bash shell
map <leader>sh :ConqueTermSplit bash<CR>
map <leader>ip :ConqueTermSplit ipython<CR>

" Mapping to move lines
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

"key mapping for window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"key mapping for tab navigation
" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" ############ FUNCTIONS ###################

" reacalculate the traling whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Recalculate the long line warning whe idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" Define :HighlightLongLines comman to ghighlight the offending parts of
" lines that are longer than the specified lgnth (defaulting to 100)
command! -nargs=? HighlihgtLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 100
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg 'Usage: HighlightLongLines [length]"
    endif
endfunction

" Reaload .vimrc
" Soruce the .vimrc or _vimrc file
if &term == "win32" || "pcterm" || has("gui_win32")
    map ,v e: $HOME/_vimrc
    nmap <F12> :<C-u>source ~/_vimrc <BAR> echo "vimrc reloaded"<CR>
else
    map ,v :e $HOME/.vimrc<CR>
    nmap <F12> :<C-u>source .vimrc <BAR> echo "vimrc realoaded"<CR>
endif

" ==================================================================
" Preserve
" =================================================================
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l,c)
endfunction

" ==================================================================
" Tidying Whitespaces
" ==================================================================
function! <SID>StripTrailingWhitespaces()
    :call Preserve("%s/\\s\\+$//e")
endfunction
nmap <leader>$ :call <SID>StripTrailingWhitespaces()<CR>

" ==================================================================
" Deleting blank lines
" ==================================================================
"Function: <SID>DeleteBlankLines
"Desc: delete blank lines on buffer
"
"Arguments:
"
function! <SID>DeleteBlankLines()
    :call Preserve(":g/^$/de")
endfunction
nmap <leader>0 :call <SID>DeleteBlankLines()<CR>

" ===================================================================
" Python
" ===================================================================
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead *py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Setting pylint
autocmd FileType python compiler pylint

" turn of hlsearch and update pyflakes on enter
autocmd BufRead,BufNewFile *.py nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>
nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>

" Clear the search buffer when hitting return and update pyflake checks
function! PressedEnter()
    :nohlsearch
endfunction

if has("autocmd")
    autocmd FileType python autocmd BufWritePre <buffer> :call Autopep8()
    autocmd FileType c,python,java,javascript,html,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
    autocmd FileType html,css autocmd BufWritePre <buffer> :call <SID>DeleteBlankLines()
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

"snipmate setup
try
  source ~/.vim/bundle/snipmate/snippets/support_functions.vim
endtry
function s:SetupSnippets()
    try
        call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "htmldjango")
        call ExtractSnips("~/.vim/bundle/snipmate/snippets/html", "eruby")
    endtry
endfunction
autocmd vimenter * call s:SetupSnippets()

" ==========================================================
" SuperTab - Allows us to get code completion with tab
" ==========================================================
" Try different completion methods depending on its context
let g:SuperTabDefaultCompletionType = "context"

" ############### PLUGINS SETTINGS ##################

" load ftpplugins and indent files
filetype plugin on
filetype indent on

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" Ariline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Autopep8
" Disable show diff window
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79

" Fuzzy Finder Settings
let g:fuzzy_matching_limit = 20
let g:fuzzy_ignore="*.ico;*.png;*PNG;*.jpg;*.JPG;*.GIF;*.gif;tmp/**;log/**"

" disable caching for Fuzzy Finder
let g:fuf_tag_cache_dir = ''
let g:fuf_taggedfile_cache_dir = ''

" NERDTree ignore files
let NERDTreeIgnore = ['\.pyc$','\.obj$', '\.o$']

" Settings for Conque Shell plugin
" http://code.google.com/p/conque
"" Fast Mode
let g:ConqueTerm_FastMode = 0

"" Color support
let g:ConqueTerm_Color = 1

"" Keep updating terminal buffer
let g:ConqueTerm_ReadUnfocused = 1

"" Insert mode when entering buffer
let g:ConqueTerm_InsertOnEnter = 1

"" Hide start messages
let g:ConqueTerm_StartMessages = 0

"" Close buffer when program exits
let g:ConqueTerm_CloseOnEnd = 1

" Start NERDTree when in gui_gnome  MODE
if has("gui_running")
    set guicursor=a:blinkon0 " Disable blinking cursor
    set columns=100 lines=38 " Default window size
    if has("gui_gnome")
        colorscheme railscasts
        "autocmd VimEnter * NERDTree
    endif
endif
