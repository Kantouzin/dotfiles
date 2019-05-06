scriptencoding utf-8

" encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set termencoding=utf-8

" reset augroup---------------------------

augroup MyAutoCmd
  autocmd!
augroup END

let s:is_windows = has("win32") || has("win64")

if s:is_windows
  set shellslash
endif

" dein scripts-----------------------------

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

" end dein scripts-------------------------

" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定。
set softtabstop=4
" vimが自動でインデントを行った際、設定する空白数。
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。 
" 行頭以外では 'tabstop' の数だけ空白が挿入される。
set smarttab

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

"---------------------------------------------------------------------------
" file automatically created

" *~
set nobackup
" *.un~
set noundofile

"---------------------------------------------------------------------------
" colorscheme

syntax on
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme molokai

"---------------------------------------------------------------------------

" copy to clipboard when yanking
set clipboard=unnamed,autoselect

filetype indent on

set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim
