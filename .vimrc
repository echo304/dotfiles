set nocompatible              " be iMproved, required
filetype off                  " required

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" ================
" General Setting
" ================
" location of backup, swap, undo
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

" vi 실행시 number line 생성
set nu
set background=light
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
au CursorHold * checktime " check the file change every 4s of inactivity in normal mode
set nopaste " prevent weird indentaion
set smartcase " case sensitive
set ruler " display current cursor positionn 'tpope/vim-surround'
set cursorline " Set highlighted line
set incsearch " Start searching while entering
set so=10 " Set scrolloff
set viminfo='100,f1 " Set viminfo file to save the marks
set confirm " Ask when try to abandon unsaved buffer
set wildchar=<Tab> wildmenu wildmode=full " Show wildmenu

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

" Split Related
set splitbelow
set splitright

" ================
" Vundle Setting
" ================
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
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Auto-Pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rails'

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

" ===================
" Setting for Plugins
" ===================
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

let g:airline#extensions#tabline#enabled = 1 " ensable smarter tab line

" ================
" Auto Command
" ================
autocmd BufWritePre * %s/\s\+$//e
autocmd vimenter * IndentGuidesEnable

" ================
" Key Mapping
" ================
" Buffer switch
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :bn<CR>
nnoremap <F3> :bp<CR>
nnoremap <F2> :bp\|bd #<CR>

" NERD Tree는 F7키
nmap <F7> :NERDTree<CR>

" Set F6 to toggle relative number
nmap <F6> :set rnu!<CR>

" Override * to search a word on the current cursor and count its occurrences
nnoremap * *<C-O>:%s///gn<CR><C-O>

" Enter key to add blank line without switch to insert mode
nmap <CR> o<Esc>

" Split Related Key Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Running macro on 'q' Key
nnoremap <Space> @q
