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
" Sets central temp file location, to prevent local default behavior.
if isdirectory($HOME . '/.vim/.tmp') == 0
  :silent !mkdir -m 700 -p ~/.vim/.tmp > /dev/null 2>&1
endif

set backupdir=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,
set directory=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,

set nu " vi 실행시 number line 생성
set rnu " Use relative number
set background=dark
set laststatus=2 " 상태바 표시를 항상한다
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
set completeopt=longest,menuone
set nowrap " Vim will not break the line
set lazyredraw " For faster scrolling
syntax sync minlines=256

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
" Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Auto-Pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rails'
Plugin 'shougo/neocomplcache.vim'
Plugin 'slim-template/vim-slim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

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
" Recommended setting for syntastc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" neocomplcache setting
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3 " 3 chars before pops up
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_smart_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

" Airline setting
let g:airline#extensions#tabline#enabled = 1 " ensable smarter tab line
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_theme='dark'
let g:airline_powerline_fonts=0

" Ignore for ctrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|node_modules',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
let g:ctrlp_max_files=20000

" Setting for AutoPairs
let g:AutoPairsShortcutBackInsert = '<C-B>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ================
" Auto Command
" ================
autocmd BufWritePre * %s/\s\+$//e
autocmd vimenter * IndentGuidesEnable

" ================
" Command
" ================
command! MakeTags !ctags -R .

" ================
" Key Mapping
" ================
" Buffer switch
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :bn<CR>
nnoremap <F3> :bp<CR>
nnoremap <F2> :bp\|bd #<CR>

" NERD Tree는 F7키
nmap <F7> :NERDTreeToggle<CR>
nmap - :NERDTreeFind<CR>

" Set F6 to toggle relative number
nmap <F6> :set rnu!<CR>

" Set F8 to toggle paste mode
map <silent> <F8> :set paste!<CR>

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

" select popup menu when hit Tab
" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
