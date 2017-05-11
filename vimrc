"""""""""""
" AUTOCMD "
"""""""""""
" {{{

"""""""""""""""""
" GENERIC STUFF "
"""""""""""""""""
" Open NERDTree on startup and switch to window to the right
" autocmd vimenter * NERDTree
" Go to the right one window so we don't start in NERDTree
" autocmd VimEnter * wincmd l


" Automatically focus on directory of current file in NERDTree
" it works sometimes but throws a dictionary error others...
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" When entering a new file turn syntax on
augroup syntax
    autocmd!
    autocmd BufReadPre,FileReadPre * syntax on
augroup END
" autocmd BufReadPre,FileReadPre *.java set tags=./tags,tags;$HOME
" autocmd BufReadPre,FileReadPre *.java UpdateTypesFile

"""""""""""""""""
" FILE SPECIFIC "
"""""""""""""""""

" autoreload vimrc whenever we save it
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" sh stuff
augroup sh
    autocmd!
    autocmd FileType sh nnoremap <localleader>c mq^i# <esc>`q2l
    autocmd FileType sh nnoremap <localleader>u mq:s/#\s//<cr>`q2h:set nohlsearch<cr>
    autocmd FileType sh nnoremap <localleader>r :w<cr>:! sh % 
augroup END

" python stuff
augroup python
    autocmd!
    autocmd FileType python iabbrev <buffer> forl for i in range (0,):<C-[>hi
    autocmd FileType python nnoremap <localleader>c mq^i# <esc>`q2l
    autocmd FileType python nnoremap <localleader>u mq:s/#\s//<cr>`q2h:set nohlsearch<cr>
    autocmd FileType python nnoremap <localleader>r :w<cr>:! python % 
augroup END

" potion stuff
augroup potion
    autocmd!
    autocmd FileType potion nnoremap <localleader>r :w<cr>:! potion % 
augroup END

" perl stuff
augroup perl
    autocmd!
    autocmd FileType perl iabbrev <buffer> forl for (my $i = 0; $i <; $i++)<cr>{<C-[>o<C-[>o}<C-[>3k18la
    autocmd FileType perl iabbrev <buffer> AR $ARGV[0]
    autocmd FileType perl nnoremap <localleader>c mq^i# <esc>`q2l
    autocmd FileType perl nnoremap <localleader>u mq:s/#\s//<cr>`q2h:set nohlsearch<cr>
    autocmd FileType perl nnoremap <localleader>r :w<cr>:! perl % 
    autocmd FileType perl set keywordprg=perldoc\ -f
augroup END


" ruby stuff
augroup ruby
    autocmd!
    autocmd FileType ruby iabbrev <buffer> forl for (my $i = 0; i <; i++)<cr>{<C-[>o<C-[>o}<C-[>3k18la
    autocmd FileType ruby nnoremap <localleader>c mq^i# <esc>`q2l
    autocmd FileType ruby nnoremap <localleader>u mq:s/#\s//<cr>`q2h:set nohlsearch<cr>
    autocmd FileType ruby nnoremap <localleader>r :w<cr>:! ruby % 
augroup END

" java stuff
augroup java
    autocmd!
    autocmd FileType java iabbrev <buffer> forl for (int i = 0; i <; i++)<cr>{<C-[>o<C-[>o}<C-[>3k18la
    autocmd FileType java nnoremap <localleader>c mq^i// <esc>`q3l
    autocmd FileType ruby nnoremap <localleader>u mq:s/\/\/\s//<cr>`q2h:set nohlsearch<cr>
    autocmd FileType java nnoremap <localleader>r :w<cr>:! java % 
augroup END

" html stuff
augroup html
    autocmd!
    autocmd FileType html nnoremap <localleader>c mqI<!--<esc>A--><esc>`q4l
    autocmd FileType html nnoremap <localleader>u mq:s/<!--\(.*\)-->/\1/<cr>`q4h:set nohlsearch<cr>
augroup END

" Vimscript file settings
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <localleader>c mq^i" <esc>`q2l
    autocmd FileType vim nnoremap <localleader>u mq:s/"\s//<cr>`q2h:set nohlsearch<cr>
augroup END

" turn on additional syntax highlighting for
" autocmd BufNewFile,BufRead,BufReadPost *.java call CSyntaxAfter()
" }}}

""""""""""""
" PATHOGEN "
""""""""""""
" {{{
call pathogen#infect()

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

execute pathogen#infect()
filetype plugin on
filetype plugin indent on
syntax on
filetype off                  " required
" }}}

"""""""""""""""""
" MISC SETTINGS "
"""""""""""""""""
" {{{

" disable the mouse
set mouse=c
" Necesary  for lots of cool vim things
set nocompatible
" This shows what you are typing as a command.  I love this!
set showcmd
" Folding Stuffs
set foldmethod=marker
" ignores case for search
set ignorecase
set smartcase
" Spaces are better than a tab character
set expandtab
set smarttab
" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full
" show line numbers when editing
set number
" keep at least 5 lines above/below
set scrolloff=5
" current directory of each window will always be the same as the file
" currently being edited
" set autochdir
" incremental search
set incsearch

" support all three newline formats
set fileformats=unix,dos,mac

" extra files that are created go in these folders. the folders have to
" be created before this will work!
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Statusline with buffer number, file name, modification status, position within the buffer and a hex code of the character under cursor
set statusline=%2*%n\|%<%*%-.40F%2*\|\ %2*%M\ %3*%=%1*\ %1*%2.6l%2*x%1*%1.9(%c%V%)%2*[%1*%P%2*]%1*%2B

" use ctrl+x ctrl+k to invike dictionary completion normally
" adds dictionary functionality to vim
set dictionary+=/usr/share/dict/words
" adds dictionary directly to ctrl+n
set complete+=k
" adds tags directly to ctrl+n
set complete+=t

"display a warning if fileformat isnt unix
" set statusline+=%#warningmsg#
" set statusline+=%{&ff!='unix'?'['.&ff.']':''}
" set statusline+=%*

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"""""""""""""
" FUNCTIONS "
"""""""""""""
" {{{
" column fold function
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" quick fix screen toggle function
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

""""""""""""
" MAPPINGS "
""""""""""""
" {{{
"new mappings for the keys
let mapleader = "\<Space>"
let maplocalleader = "\\"

"""""""""""""""
" NORMAL MODE "
"""""""""""""""

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :split $MYVIMRC<cr>
nnoremap <silent> <leader>vv :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :so $MYVIMRC<cr>

" turn syntax on quickly
nnoremap <silent> <leader>so :syntax on<cr>
" here we make sure syntax is on, set tags if they exist, and turn on
" additional syntax
nnoremap <silent> <leader>re :syntax on<cr>:set tags=./tags,tags;$HOME<cr>:UpdateTypesFile<cr>
" remap tag keys to also perform these updates automatically
" open the tag in a new tab
nnoremap <C-\> :tab split<cr>:exec("tag ".expand("<cword>"))<cr>

" give the enter key power in insert mode
nnoremap <cr> o<Esc>
nnoremap <S-Enter> O<Esc>
" toggles search highlight
nnoremap <leader>, :set hlsearch!<cr>
" brings up undo tree
nnoremap <leader>u :GundoToggle<cr>
"encrypt or decrpyt all text then center cursor
nnoremap <F12> ggVGg?''zz

" move a line of text up or down
nnoremap - :m .-2<cr>==
nnoremap _ :m .+1<cr>==

" since ctrl-A selects all text remap the increment command
" to be consistent, ctrl-x will be remapped as well
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>

"toggle relative line number
nnoremap <silent> <leader>n :set relativenumber!<cr>
"add a semicolon to the end of line
nnoremap <leader>; mqA;<esc>`q
nnoremap <leader>p mqIprint <esc>`q6l
"compress multiple blank lines into one
nnoremap <silent> <leader>1 :v/./,/./-j<cr>:set nohlsearch<cr>
"add a space in front of and after a character
nnoremap <leader>5 i<Space><Esc>la<Space><Esc>h
"how many nonwhitespace characters are in a file
nnoremap <leader>c :set nohlsearch<cr>:%s/\S//gn<cr>
"find all duplicate words in a file
nnoremap <leader>d :set hlsearch<cr>/\(\<\w\+\>\)\_s*\1<cr>
"find file in nerdtree
nnoremap <leader>f :NERDTreeFind<cr>
"properly format a json file that is on multiple lines
nnoremap <leader>ff :%!python -m json.tool<cr>
nnoremap <leader>fo :%s/{/\r{\r/g<cr>:%s/}/\r}\r/g<cr>:%!python -m json.tool<cr>gg=G
" add quotes around the word
nnoremap <leader>' :silent! normal mqea"<Esc>bi"<Esc>`ql

"toggle quick fix menu
nnoremap <leader>q :call QuickfixToggle()<cr>
"set ctags tag location
nnoremap <leader>t :set tags=./tags,tags;$HOME<cr>
"fix { in a file
nnoremap <leader>[ mq:%s/{$/\r{/<cr>ggvG=`q

"searches are magic by default
nnoremap # :set hlsearch<cr>#
nnoremap * :set hlsearch<cr>*
nnoremap / :set hlsearch<cr>/
nnoremap ? :set hlsearch<cr>?

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" nnoremap N Nzz
" nnoremap n nzz

" highlight all text entered in last insert mode
nnoremap <leader>l `[v`]

" D deletes until end of line, C changes until end of line, Y yanks the whole
" line? not anymore...
nnoremap Y y$

" I dont use ;; very much...
nnoremap ;; :w!<cr>
inoremap ;; <esc>:w!<cr>a

" swap ; and :
" nnoremap ; :
" nnoremap : ;

""""""""""
" INSERT "
""""""""""
" return to normal mode by pressing jk
inoremap jk <esc>l

""""""""""
" VISUAL "
""""""""""


""""""""""""
" MOVEMENT "
""""""""""""

" basic movement options
nnoremap j gj
nnoremap k gk

" remap H to go to beginning and L to go to end of line
" nnoremap H ^
" nnoremap L $

" inside next (<{ on line
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>

" move with H and L inside of a movement command like ^ and $
onoremap H ^
onoremap L $
" }}}

"""""""""""""""""
" ABBREVIATIONS "
"""""""""""""""""
" {{{
iab curdate ////////////////////<C-[>:r! date /t<C-[>I// <C-[>A// <C-[>o////////////////////<C-[>o

"""""""""
" Games "
""""""""""
" Brogue "
""""""""""
iab ukr Unknown Runic:<cr>Definitely Not:<cr><cr>Probably Not:<cr><cr><cr>Could Be:<cr><Up><Up><Up><Up><Up><Up><C-[>A
iab bl bloodwort near
iab la lava near
iab wa water near
iab ct caustic gas trap near
iab pt paralysis trigger near
iab spt safe paralysis trigger near
iab de Depth
iab va Vault:<cr>(took)
iab vae Vault:<cr>(took)<cr>1 empow
iab rva Ring Vault:<cr>(took)
iab sva Staff Vault:<cr>(took)
" }}}

"""""""""""""""
" COLOR STUFF "
"""""""""""""""
" {{{
" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

"use jgg for all files
colorscheme jgg
"except for text files
augroup colors
    autocmd!
    autocmd BufRead,BufEnter * colorscheme jgg
    " autocmd BufRead,BufEnter *.txt colorscheme behelit
    autocmd BufRead,BufEnter *.rb colorscheme kkruby
    autocmd BufRead,BufEnter *.sh colorscheme torte
augroup END

let loaded_setcolors = 1
let s:mycolors = ['darkblue', 'desert', 'elflord', 'evening', 'koehler', 'murphy', 'pablo', 'ron', 'slate', 'solarized', 'torte', 'behelit', 'birds-of-paradise', 'crayon', 'deepsea', 'kkruby', 'material', 'meta5', 'thornbird', 'cgpro', 'madeofcode', 'penultimate'] " colorscheme names that we use to set color

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = map(paths, 'fnamemodify(v:val, ":t:r")')
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
"    let c1 = 'default elflord peachpuff desert256 breeze morning'
"    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
"    let c3 = 'darkblack freya motus impact less chocolateliquor'
"    let s:mycolors = split(c1.' '.c2.' '.c3)
"    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

" next color scheme
nnoremap <F8> :call NextColor(1)<cr>
" previous color scheme
nnoremap <S-F8> :call NextColor(-1)<cr>
" random color scheme
nnoremap <A-F8> :call NextColor(0)<cr>

" Set color scheme according to current time of day.
function! HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'slate solarized desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

" sets color scheme to match current time of day (needs work)
nnoremap <F7> :call HourColor()<cr>
" }}}
