"nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"Funny!
"========================================================
"echom "(>^.^<)"

"Generic confi"
"=========================================================================================
set number										"显示行号
set guifont=Monaco\ 10,Monospace\ 10			"字体
set go=											"gvim无工具栏
set nocompatible								"不兼容Vi
set shiftround
set autoindent shiftwidth=4						"自动缩进,宽度为4
set incsearch									"实时搜索
set hlsearch									"高亮搜索结果
set tabstop=4									"Tab距离为4
set encoding=utf-8								"所用的编码
set termencoding=utf-8							"输出到终端采用的编码类型"
set fileencoding=utf-8							"vim自动判断文件编码所采用的顺序
set smartindent
set cindent
set ignorecase
set showmatch
if has("gui_running")
	set cursorline 									"高亮光标所在行
endif
set ww+=h,l,<,>,~,[,]
"使h,j,<LEFT>,<RIGHT>等可以回到上一行，具体 help whichwrap"

colorscheme desert

syntax on										"打开语法高亮									
filetype on										"打开文件类型检测
filetype indent on								"打开文件时打开相应的缩进文件

set iskeyword=_,$,@,#,%,-						"含有以下关键词的单词不做换行
set laststatus=2								"总是显示状态栏

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

"Set mapleader
let mapleader = ","
let g:mapleader = ","
let maplocalleder = "\\"

"Key mapping
"========================================================
""nomorl模式映射空格为文本折叠
nnoremap <silent> <SPACE> za	
"insert模式，Ctrl-d 删除一行
inoremap <silent> <C-D> <ESC>dd$a
"insert模式，Ctrl-u 将光标所在单词转为大写
inoremap <silent> <C-U> <ESC>viwU<ESC>ea
"快速编辑～/.vimrc
nnoremap <silent> <leader>ee :vsplit $MYVIMRC<CR>
"快速source ～/.vimrc
nnoremap <silent> <leader>ss :source $MYVIMRC<CR>

nnoremap <silent> H ^
nnoremap <silent> L $

inoremap <silent> jk <ESC>
inoremap <silent> <ESC> <NOP>

nnoremap <silent> nn :
nnoremap <silent> : <NOP>

augroup commentgroup
	autocmd!
	autocmd BufReadPost .vimrc :nnoremap <silent> <localleader>c I"<ESC>
	autocmd FileType vim setlocal foldmethod=marker
augroup END

"my abbreviations
"==========================================================================
iabbrev	@@ wqshare1023@gmail.com
iabbrev wqn	WenQin

"Plugin install
"==========================================================================
"set nocompatible              " be iMproved
"filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle "Yggdroot/indentLine"
Bundle "airblade/vim-gitgutter"
Bundle "gregsexton/gitv"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-surround"
Bundle "Raimondi/delimitMate"

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
Bundle 'file:///Home/sisi/Downloads/statusline.vim'


"taglist
Bundle 'taglist.vim'

filetype plugin indent on     " required!plugin install

map <leader>il :IndentLinesToggle<CR>

