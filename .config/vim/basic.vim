set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8 " 読み込み時の文字コードの自動判別。左側優先。"
set fileformats=unix,dos,mac " 改行コードの自動判別。左側優先。
"set ambiwidth=double " □や○文字が崩れる問題を解決
set showcmd 
syntax enable 

" タブ・インデント
set expandtab
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空学に対してタブキーやバックスペースでカーソルが動く幅
set smartindent " 開業時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

" 文字列検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" カーソル
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" バックスペースキーの有効化
set backspace=indent,eol,start

"カッコ・タグジャンプ
set showmatch " カッコの対応関係を一瞬表示する
inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap [<Enter> []<Left><CR><Esc><S-o>
inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>

" バッファ操作
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprev<CR>
nnoremap <C-d> :bd<CR>

" コマンド補完
set history=5000 " 保存するコマンド履歴の数

" マウスの有効化
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

" ペースト設定
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set title
set laststatus=2
set cmdheight=2
set ruler
set hidden
set list
set listchars=tab:>\ ,extends:<
set noswapfile
set nobackup
set nowritebackup

" 端末内で256カラーを利用するための設定
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set t_Co=256
  set background=dark
endif

highlight LineNr ctermfg=darkyellow

set updatetime=300
set shortmess+=c
set signcolumn=yes
