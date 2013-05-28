"" VIMRC
"" Author: Kevin Granger
"
" Based on / Inspired by / Stolen from:
" 	Stanley Chan		https://github.com/Happy-Dude/dotfiles/tree/master/vim
" 	Ian Langworth		http://statico.github.io/vim.html


set nocompatible               " be iMproved
filetype off                   " required for vundle

" Bundles {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles

"Solarized, the bestest colorscheme
Bundle 'altercation/vim-colors-solarized'
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

"NERDtree, a tree explorer plugin
Bundle 'scrooloose/nerdtree'	
nmap <leader>e :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0

"syntastic: Syntax checking hacks
Bundle 'scrooloose/syntastic'	

"ctrlp: Full path fuzzy file, buffer, mru, tag, ... finder
Bundle 'kien/ctrlp.vim'		

"closetag: Functions and mappings to close open HTML/XML tags 
Bundle 'closetag.vim'		
"
"css-color: colorize css
Bundle 'ap/vim-css-color'	
"
"vim-seek: make navigating within a line easier
Bundle 'goldfeld/vim-seek'	
let g:seek_subst_disable = 1
"
"fugitive: git integration
Bundle 'tpope/vim-fugitive'	
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader>d :Gdiff<CR>

"obsession: continuously updated session files
Bundle 'tpope/vim-obsession'	

"easymotion: Vim motions on speed!
Bundle 'Lokaltog/vim-easymotion'

"sparkup: easier html
Bundle 'tristen/vim-sparkup'

"gitgutter: shows a git diff in the gutter
 Bundle 'airblade/vim-gitgutter'

"gundo: undo tree visualization 
Bundle 'sjl/gundo.vim'
nnoremap <Leader>g :GundoToggle<CR>

"gitv: gitk for vim
Bundle 'gitv'

"inline_edit: Edit code that's embedded within other code
Bundle 'AndrewRadev/inline_edit.vim'
nnoremap <Leader>i :InlineEdit<CR>
vnoremap <Leader>i :InlineEdit<CR>

"restore_view: restore buffer views on opening and closing
Bundle 'restore_view.vim'

" vimwiki: Personal Wiki for Vim
Bundle 'vimwiki'
let g:vimwiki_list = [
			\ {'path': '~/flx/wiki'}
			\]

" LOOK INTO:
" showmarks

" Bundles from sample vundle .vimrc
" TODO: che-che-che-che che-che-check 'em out
" TODO: check out command-t versus ctrlp versus fuzzyfinder
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
"" non github repos
"Bundle 'git://git.wincent.com/command-t.git' 

filetype plugin indent on     " required for vundle
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

" }}} end Bundles

set showcmd

set ignorecase	"Ignore case when searching
set smartcase	"UNLESS there are caps, in which case, be sensitive.
"set infercase "Case inferred by default
set hlsearch	"Highlight search things
nmap \q :noh<CR>
set incsearch	"Highlight as I type


set showmatch "Show matching brackets
set matchtime=5 "How many tenths of a second to show matching paren with showmatch set

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

set wildmenu "Turn on wild menu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
"Ignore these list file extensions
set wildmode=list:longest,full
"Turn on wild mode huge list
set wildchar=<TAB>
"Path/file expansion in colon mode

"set guioptions=em	"e ensures tab bar is displayed in GUI; m ensures menu bar is displayed
set showcmd		"Display commands as they are typed
set cmdheight=1		"Set the commandbar height
set showtabline=2	"Display tab line even if single file opened
set guitablabel=%t	"Display buffer name on tab label
"set nohidden		"When I close a tab, remove from buffer
set tm=500 		"Set tooltip menu

""" relativenumber is a VIM 7.3 option
""" If the option doesn't exist, fall back to just absolute line numbers
if exists('+relativenumber')
    set relativenumber "Display how far away each line is from the current one by default

"Switch to absolute line numbers whenever Vim loses focus
    autocmd FocusLost * :set number
    autocmd FocusGained * :set relativenumber

"Use absolute line numbers when in insert mode and relative numbers when in normal mode
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

else
    set number "Show absolute line numbers

endif

set ruler		"Show cursor position all times
set numberwidth=5	"Aesthetic uses only... and for displaying large line numbers
set more		"Use more propmt -- pausing screen when too many items are displayed
set noautowrite		"Don't automagically write on :next
set hid			"Change buffer - without saving

set undofile		"Have VIM save undo history to file and restore it on open
set history=350		"Sets how many lines of history VIM will remember
set undolevels=500	"Number of undo levels

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


nmap <leader>p :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


" tab mode switching from Ian

nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

"foldin'

nnoremap <space> za
vnoremap <space> zf



"winder stuff

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

"powerline!
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

hi Normal ctermbg=none

" vim:fdm=marker
