call plug#begin('~/.config/vim_plugged')

" all languages
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" ruby / rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" go
Plug 'mattn/vim-goimports', { 'for': 'go' }

" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" tex
Plug 'lervag/vimtex'

" color scheme
Plug 'cocopon/iceberg.vim'

" extend vim
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" 各種設定の読み込み
call map(sort(split(globpath(&runtimepath, 'rc/*.vim'))), {->[execute('exec "so" v:val')]})
