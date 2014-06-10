"" VIMRC
"" Author: Kevin M Granger
"
" Based on / Inspired by / Stolen from:
" 	Stanley Chan		https://github.com/Happy-Dude/dotfiles/tree/master/vim
" 	Ian Langworth		http://statico.github.io/vim.html


"" TODO: {{{
"
" LOOK INTO:
" showmarks
" check out command-t versus ctrlp versus fuzzyfinder
"
" Bundles from sample vundle .vimrc:
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"" non github repos
"Bundle 'git://git.wincent.com/command-t.git' 
" }}}


" NeoBundle Init {{{
if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}


NeoBundle "pangloss/vim-javascript"


" Aesthetics {{{

	" Color {{{

		"Solarized, the bestest colorscheme
		NeoBundle 'altercation/vim-colors-solarized'
		syntax enable

		"set background=light
		"this actually just goes off of .Xresources. So, dark is light if .Xr is light
		set background=dark
		"if has('gui_running')
		"	set background=light
		"else
		"	set background=dark
		"endif

		colorscheme solarized

	" }}}

" }}}


" File Management {{{

"NERDtree, a tree explorer plugin
NeoBundle 'scrooloose/nerdtree'	
nmap <leader>e :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0

"ctrlp: Full path fuzzy file, buffer, mru, tag, ... finder
NeoBundle 'kien/ctrlp.vim'		

nmap <leader>p :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
" }}}


" Language {{{

"syntastic: Syntax checking hacks
NeoBundle 'scrooloose/syntastic'	

"inline_edit: Edit code that's embedded within other code
NeoBundle 'AndrewRadev/inline_edit.vim'
nnoremap <Leader>i :InlineEdit<CR>
vnoremap <Leader>i :InlineEdit<CR>

" Web {{{

"closetag: Functions and mappings to close open HTML/XML tags 
NeoBundle 'closetag.vim'		

"css-color: colorize css
NeoBundle 'ap/vim-css-color'	

"sparkup: easier html
NeoBundle 'tristen/vim-sparkup'
" }}}
" }}}


" Navigation {{{

"vim-seek: make navigating within a line easier
NeoBundle 'goldfeld/vim-seek'	
let g:seek_subst_disable = 1

"easymotion: Vim motions on speed!
NeoBundle 'Lokaltog/vim-easymotion'

" To move up and down logical lines instead of physical lines
" Instead of changing the Home row keys, use the arrow keys
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
noremap <silent> <Up> gk
noremap <silent> <Down> gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj

" emacs-like cmd keys, from Ian Langworth

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" buffer stuff from Ian
nmap <M-j> :bnext<CR>
nmap <M-k> :bprev<CR>
" }}}


" Version Control {{{

"fugitive: git integration
NeoBundle 'tpope/vim-fugitive'	
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader>d :Gdiff<CR>

"gitgutter: shows a git diff in the gutter
NeoBundle 'airblade/vim-gitgutter'

"gitv: gitk for vim
"NeoBundle 'gitv'

" }}}


" Session / Projects {{{

"obsession: continuously updated session files
NeoBundle 'tpope/vim-obsession'	

"restore_view: restore buffer views on opening and closing
"Bundle 'restore_view.vim'

" }}}


" Undo {{{

"gundo: undo tree visualization 
NeoBundle 'sjl/gundo.vim'
nnoremap <Leader>g :GundoToggle<CR>

set undofile		"Have VIM save undo history to file and restore it on open
set history=350		"Sets how many lines of history VIM will remember
set undolevels=500	"Number of undo levels

" }}}


" Main Screen {{{

set ruler		"Show cursor position all times
set numberwidth=5	"Aesthetic uses only... and for displaying large line numbers
set more		"Use more propmt -- pausing screen when too many items are displayed
set noautowrite		"Don't automagically write on :next
set hidden			"Change buffer - without saving

set cursorline "Highlight the current line
"set cursorcolumn "Highlight the current column
""" Highlight column 81 for old-school 80 character terminal widths
""" The elseif hack is from http://stackoverflow.com/a/235970

if exists('+colorcolumn')
    set colorcolumn=81
else
    highlight ColorColumn ctermbg=235
    match ColorColumn /\%81v/
endif

" }}}


" Command-Line {{{

set wildmenu "Turn on wild menu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
"Ignore these list file extensions
set wildmode=list:longest,full
"Turn on wild mode huge list
set wildchar=<TAB>
"Path/file expansion in colon mode

" }}}


" Search {{{

set showcmd

set ignorecase	"Ignore case when searching
set smartcase	"UNLESS there are caps, in which case, be sensitive.
"set infercase "Case inferred by default
set hlsearch	"Highlight search things
nmap \q :noh<CR>
set incsearch	"Highlight as I type


set showmatch "Show matching brackets
set matchtime=5 "How many tenths of a second to show matching paren with showmatch set

" }}}


" Overall Window {{{

"set guioptions=em	"e ensures tab bar is displayed in GUI; m ensures menu bar is displayed
set showcmd		"Display commands as they are typed
set cmdheight=1		"Set the commandbar height
set showtabline=2	"Display tab line even if single file opened
set guitablabel=%t	"Display buffer name on tab label
"set nohidden		"When I close a tab, remove from buffer
set tm=500 		"Set tooltip menu

" }}}


" Misc Editor Usability {{{

NeoBundle "godlygeek/tabular"

NeoBundle "nathanaelkane/vim-indent-guides"

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" relativenumber {{{
"""" relativenumber is a VIM 7.3 option
"""" If the option doesn't exist, fall back to just absolute line numbers
"if exists('+relativenumber')
"    set relativenumber "Display how far away each line is from the current one by default
"
""Switch to absolute line numbers whenever Vim loses focus
"    autocmd FocusLost * :set number
"    autocmd FocusGained * :set relativenumber
"
""Use absolute line numbers when in insert mode and relative numbers when in normal mode
"    autocmd InsertEnter * :set number
"    autocmd InsertLeave * :set relativenumber
"
"else
"    set number "Show absolute line numbers
"
"endif
" }}}

" tab mode switching from Ian

nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

"foldin'

nnoremap <space> za
vnoremap <space> zf

" }}}


" Vimwiki {{{

" vimwiki: Personal Wiki for Vim
NeoBundle 'vimwiki'
let g:vimwiki_list = [
			\ {'path': '~/flx/wiki'}
			\]

" }}}


" NeoBundle End {{{

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" }}}


" Window Management {{{

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

" }}}


" Powerline {{{
set rtp+=~/.local/lib/python3.3/site-packages/powerline/bindings/vim
set laststatus=2
set noshowmode
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=0
	augroup END
endif
" }}}


" Where do these go? {{{

" Not sure, really. gvim versus console vim solarized solution thingy maybe?
hi Normal ctermbg=none

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" }}}



" vim:fdm=marker
