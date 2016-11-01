set nocompatible              " be iMproved, required
filetype off                  " required

" vi 실행시 number line 생성
set nu
" Set F6 to toggle relative number
nmap <F6> :set rnu!<CR>
" Override * to search a word on the current cursor and count its occurrences
nnoremap * *<C-O>:%s///gn<CR><C-O>

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set background=light
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set nopaste " prevent weird indentaion
set smartcase " case sensitive
set ruler " display current cursor positionn 'tpope/vim-surround'
autocmd vimenter * NERDTree

" 코딩 작업시 자동 들여쓰기
set smartindent
set autoindent
set cindent
set bs=indent,eol,start    " backspace 키 사용 가능

" 일반모드에서 / 검색시 하이라이팅
set hlsearch

" 일반모드에서 / 검색시 대소문자 구분하지 않음
set ignorecase

" Tab 관련 설정. 일반적으로 가장 많이 쓰이는 tabstop 4, shiftwidth 4
set tabstop=2
set expandtab
set shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'The-NERD-Tree'
Plugin 'AutoComplPop'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Recommended settingor syntastc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" NERD Tree를 왼쪽에 생성
let NERDTreeWinPos = "left"

" colorscheme
colorscheme jellybeans
" NERD Tree는 F7키. Tag List는 F8키에 매칭.
let g:airline#extensions#tabline#enabled = 1 " ensable smarter tab line
nmap <F7> :NERDTree<CR>
