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
if (has('gui_running') != 1)
  set term=screen-256color
endif

set nu " vi 실행시 number line 생성
set rnu " Use relative number
set background=dark

set laststatus=2 " 상태바 표시를 항상한다
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

if has('gui_running') " Gui Setting
  set linespace=2
  set guifont=Monaco:h11
endif

set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
au CursorHold * checktime " check the file change every 4s of inactivity in normal mode
set nopaste " prevent weird indentaion
set smartcase " case sensitive
set ruler " display current cursor positionn 'tpope/vim-surround'
set cursorline " Set highlighted line
set incsearch " Start searching while entering
set so=10 " Set scrolloff
set sidescrolloff=5
set viminfo='100,f1 " Set viminfo file to save the marks
set confirm " Ask when try to abandon unsaved buffer
set wildchar=<Tab> wildmenu wildmode=full " Show wildmenu
set completeopt=longest,menuone
" set nowrap " Vim will not break the line
set nolist wrap linebreak breakat&vim " break the line only on tab or whitespace

set lazyredraw " For faster scrolling
syntax sync minlines=256
set mouse=a " Enable mouse use
set clipboard=unnamed " Use system clipboard with unnamed register
set ttimeoutlen=50  " Make Esc work faster

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
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'

" Language Support Plugin
Plugin 'sheerun/vim-polyglot'
Plugin 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'pangloss/vim-javascript'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'slim-template/vim-slim'

Plugin 'mattn/emmet-vim'
Plugin 'benekastah/neomake'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Auto-Pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rails'
Plugin 'shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'

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

" Emmet setting
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Neomake Setting
autocmd! BufWritePost * Neomake

" Recommended setting for syntastc
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'

" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Indent guide setting
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 10
" Indent color for dark theme
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=236

" Indent color for light theme
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#eeeeee ctermbg=255
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#e4e4e4 ctermbg=254

" neocomplete setting
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" NERD Tree를 왼쪽에 생성
let NERDTreeWinPos = "left"
let g:NERDTreeWinSize=60

" colorscheme
colorscheme molokai
" colorscheme Monokai
" colorscheme mayansmoke
" colorscheme desert256v2
" colorscheme guardian
" colorscheme distinguished
" colorscheme github

" Airline setting
let g:airline#extensions#tabline#enabled = 1 " ensable smarter tab line
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_theme='molokai'
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
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" ================
" Command
" ================
command! MakeTags !ctags -R .

" ================
" Key Mapping
" ================

" Toggle comment
nnoremap ,c :call NERDComment(0,"toggle")<CR>

" Move screen row
noremap j gj
noremap k gk

" Replace current inner word with last yanked text
nnoremap S diw"0P

" Buffer switch
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :bn<CR>
nnoremap <F3> :bp<CR>
nnoremap <F2> :bp\|bd #<CR>

" nerd tREE는 f7키
nmap <F7> :NERDTreeToggle<CR>
nmap - :NERDTreeFind<CR>

" Set F6 to toggle relative number
nmap <F6> :set rnu!<CR>

" Set F8 to toggle paste mode
map <silent> <F8> :set paste!<CR>

" Override * to search a word on the current cursor and count its occurrences
nnoremap * *<C-O>:%s///gn<CR><C-O>

" :noh when press esc
nnoremap <silent> <Esc><Esc> :noh<return><esc>

" correct indent with p
nnoremap <leader>p p`[v`]=

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
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>
