"----------------------------------------------
" .vimrc
"----------------------------------------------

" Enable backspace
set backspace=indent,eol,start

" disable compatible options
set nocompatible

" enable netrw
filetype plugin on
syntax enable

set tags=./tags;$HOME

"----------------------------------------------
" Display Configuration

" Line number
set number

" 右下に行,列を表示する
set ruler

" スクロール時に指定分だけ前後行数を常に表示する
set scrolloff=3

" 不可視文字を表示
set list

" 不可視文字の追加定義
set listchars=trail:_,tab:>-

" 折り返しを表示する
set wrap

" ノーマルモード入力中のコマンドを表示
set showcmd

" 対応括弧をハイライト表示
set showmatch

" 対応括弧のハイライト表示秒数(N x 0.1sec)
set matchtime=1

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" 補完で表示されるメニューの高さ
set pumheight=10

" 現在行を下線で表示
set cursorline


"----------------------------------------------
" 文字コードに関する設定

" エンコード
set encoding=utf-8

" ファイルエンコード
set fileencoding=utf-8


"----------------------------------------------
" カーソル移動に関する設定

" 文字がない場所もカーソル移動
set virtualedit=all


"----------------------------------------------
" インデントに関する設定

" 前行に合わせて自動インデント
set autoindent

" 構文に合わせて自動インデント
set smartindent

" TABをスペース4つ分にする
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"----------------------------------------------
" 検索に関する設定

" 検索マッチ文字列をハイライト表示
set hlsearch

" 大・小文字を区別して検索
set noignorecase

" インクリメンタルサーチする
set incsearch

"----------------------------------------------
" バックアップに関する設定

" バックアップファイルを作成しない
set nobackup

" スワップファイルを作成しない
set noswapfile

" バックアップファイルを作成する
" set backup
" set backupdir=

" スワップファイルを作成する
" set swapfile
" set directory=

"----------------------------------------------
" ステータスラインに関する設定

" ファイル名の表示
set statusline=%F

" ファイルタイプの表示
set statusline+=[ft:%{&filetype}]

" 変更チェック表示
set statusline+=%m

" ReadOnly or Not
set statusline+=%r

" 以降は右寄せ
set statusline+=%=

" File Encoding
set statusline+=[ENC=%{&fileencoding}]

" 現在行数/全行数
set statusline+=[LOW=%l/%L]


" Always display statusline
set laststatus=2

" Enable modeline
set modeline

"----------------------------------------------
" GUIに関する設定

" 表示行数(固定しない)
"set lines=

" 表示列数(固定しない)
"set columns=

" コマンドラインの行数
set cmdheight=2

" 上部にタブを表示しない
set showtabline=0

"----------------------------------------------
" Folding
set nofoldenable
" set foldlevel=99

"----------------------------------------------
" Color
colorscheme monokai



"----------------------------------------------
" Custom Key Binds

" KEY BIND FOR Quickfix
nnoremap [q :cprevious<CR>   " to previous
nnoremap ]q :cnext<CR>       " to next
nnoremap [Q :<C-u>cfirst<CR> " to head
nnoremap ]Q :<C-u>clast<CR>  " to last

" Auto display
augroup grepopen
    autocmd!
    autocmd QuickfixCmdPost vimgrep cw
augroup END

" Folding
nnoremap <space> za

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin management
Plugin 'gmarik/Vundle.vim'
" Status Line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" File Explorer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>m <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
" Git
Plugin 'tpope/vim-fugitive'
" Comment
Plugin 'tyru/caw.vim'
" YAML
Plugin 'mrk21/yaml-vim'
" Indentation
Plugin 'Yggdroot/indentLine'
" File Search
Plugin 'kien/ctrlp.vim'
" Surrounding
Plugin 'tpope/vim-surround'

" Terraform
Plugin 'hashivim/vim-terraform'

let g:indentLine_enabled = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|pyc)|__pycache__|ansible_collections|venv)$'

" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
let mapleader = "\<Space>"
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

syntax on

call vundle#end()
filetype plugin indent on

autocmd FileType yaml setlocal ai et ts=2 sw=2 sts=2 indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

