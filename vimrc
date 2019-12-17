" ========== encoding ==========

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932
scriptencoding utf-8

" ======= path separator =======

let s:is_windows = has("win32") || has("win64")

if s:is_windows
  set shellslash
endif

" ============ dein ============

" directory installed plugins
let s:dein_dir = expand('~/.vim/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if dein.vim isn't installed, install dein.vim
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

" add dein.vim to runtimepath
if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" start settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " load colorscheme
  call dein#add("tomasr/molokai")
  " load TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " end
  call dein#end()
  call dein#save_state()
endif

" install plugins
if dein#check_install()
  call dein#install()
endif

" =========== search ===========

set ignorecase
set smartcase
set wrapscan

" ============ edit ============

set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set autoindent
set clipboard=unnamed,autoselect

" =========== indent ===========

set tabstop=4
set shiftwidth=0
set smarttab
set expandtab

" ========== display ===========

set number
set ruler
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nowrap
set laststatus=2
set cmdheight=2
set showcmd
set title

" =========== backup ===========

" *~
set nobackup
" *.un~
set noundofile

" ======== colorscheme =========

syntax on
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme molokai

" ========= powerline ==========

set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim

" ========== filetype ==========

filetype indent on

" =========== keymap ===========

inoremap <C-c> <ESC>
