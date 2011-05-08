" Use Vim setting, rather then VI settings.
" ############ SETTINGS ###################
" This must be first, because other otpions as a side effects.
set nocompatible

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

" Find the nextr match as we type the search
set incsearch

" Highlight searchs by default
set hlsearch

" Show breakline
set showbreak=... 

" Indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Setting font 
set guifont=Courier\ New\ 8

" Vertical/horizontal scroll off setting 
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Wild Mode
" Make cmdline tab completation similar to bash
set wildmode=list:longest
" Enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

" Setting colorscheme
colorscheme evening

" Setting status line
set statusline=%F%m%r%h%w
set statusline+=\ [FORMAT=%{&ff}]
set statusline+=\ [TYPE=%Y]
set statusline+=\ [ENCODING=\%{&fenc}]
set statusline+=\ [ASCII=\%03.3b]
set statusline+=\ [%p%%]
set statusline+=\ [%l,%L]
set statusline+=\ [COL=\%c]
set statusline+=\ [*ERROR=%#error#
set statusline+=%{StatuslineTabWarning()} 
set statusline+=%{StatuslineTrailingSpaceWarning()} 
set statusline+=%{StatuslineLongLineWarning()} 
set statusline+=%*]
set laststatus=2

" Removing tool bar
set guioptions-=T

" Setting cursor-line ON
set cursorline

" Setting number line ON
set number

" Enable mouse support, unless in insert mode
set mouse=a
set ttymouse=xterm2

" Automatic closing brakets
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" turn on synthax highlighting
syntax on

" ##### KEY MAPPING ##### 

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

" FufBuffer
map <C-A-r> :FufBuffer<cr>

" FufFile 
map <C-S-r> :FufFile<cr>

" FufDir
map <C-S-d> :FufDir<cr>

" NERDTree Close
map <F2> :NERDTree<cr>

" NERDTree Open
map <F3> :NERDTreeClose<cr>

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

" ############ FUNCTIONS ###################
" reacalculate the traling whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" Return '[\s]' if trailing white space is detected
" Return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$','nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" Return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" Recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Return '[&et]' if &et is set wrong
" Return '[mixed-indenting]' if space and tab are used to indent
" Return an empty string if everthing is fin 
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
           let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" Recalculate the long line warning whe idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" Return a warinig for "long lines" where "long" is either &textwidth or 80 
" (if no &textwidth is set)
" Return '' if no long lines
" Return '[#x,my,$z] if long lines ar found, ware x is the number of long
" lines, y is median length of the long lines and z is the length of the
" longest line.
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" . 
                        \ '#' . len(long_line_lens) . "," . 
                        \ 'm' . s:Median(long_line_lens) . "," . 
                        \ '$' . max(long_line_lens) . ']'
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
endfunction

" Return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
  let threshold = (&tw ? &tw : 100)
  let spaces = repeat(" ", &ts)

  let long_line_lens = []

  let i = 1
  while i <= line("$")
    let len = strlen(substitute(getline(i) ,'\t', spaces, 'g'))
    if len > threshold
        call add(long_line_lens, len)
    endif
    let i += 1
  endwhile
  return long_line_lens
endfunction

" Find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)
   
    " Binary search
    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
     else
        return (nums[l/2] + nums[(l/2) - 1]) / 2
    endif
endfunction

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

" ############### PLUGINS SETTINGS ##################

" load ftpplugins and indent files
filetype plugin on 
filetype indent on 

" Fuzzy Finder Settings
let g:fuzzy_matching_limit = 20
let g:fuzzy_ignore="*.ico;*.png;*PNG;*.jpg;*.JPG;*.GIF;*.gif;tmp/**;log/**"
" disable caching for Fuzzy Finder
let g:fuf_tag_cache_dir = ''
let g:fuf_taggedfile_cache_dir = ''

" NERDTree ignore files
let NERDTreeIgnore = ['\.pyc$']

" Start NERDTree when in gui_gnome  MODE
if has("gui_running")
    set guicursor=a:blinkon0 " Disable blinking cursor
    set columns=100 lines=38 " Default window size
    if has("gui_gnome")      
        colorscheme evening
        autocmd VimEnter * NERDTree
    endif
endif
