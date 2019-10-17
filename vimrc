
set nocompatible                " be iMproved, required
filetype on                     " required

source ~/.vim/plug.vim
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/Tagbar'
Plug 'vim-scripts/a.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
filetype plugin indent on

" 语法高亮
syntax on

" 显示行号
set nu

" 
set expandtab		" tab使用空格代替
set tabstop=4		" 让一个tab等于4个空格
set softtabstop=4	" 
set shiftwidth=4	" 自动缩进使用4个空格

set nowrap          " 不自动换行
set hlsearch        " 高亮显示结果
set incsearch       " 在输入要搜索的文字时，vim会实时匹配
set ignorecase      " 搜索时忽略大小写
set scrolloff=5     " 光标上下保留5行 

if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
    set autoindent " always set autoindenting on 
endif " has("autocmd")

" 取消自动备份及产生swp文件
set nobackup
set nowb
set noswapfile

" 状态栏设置
set laststatus=2                                    " 状态栏有两行
set statusline=\                                    " 初始化一个空格
set statusline+=%m                                  " 是否被修改
set statusline+=%r                                  " 是否是只读
set statusline+=%h                                  " 是否是帮助文档
set statusline+=%w                                  " 是否是预览窗口
set statusline+=\ %<%F                              " 文件路径
" set statusline+=\ ---\ %<%{getcwd()}              " 显示当前工作目录,%<表示过长就从该位置收缩
set statusline+=\ %=\                               " 右对齐
set statusline+=[%{strlen(&ft)?&ft:'none'}          " 文件类型
set statusline+=,\ %{strlen(&fenc)?&fenc:'none'}    " 文件类型
set statusline+=,\ %{&fileformat}]                  " 文件格式
set statusline+=\ \ %L/%l:%c                        " 总行号\行号:列号
set statusline+=\ \ %b-0x%B\                        " 字符十进制和十六进制的ASCII值


" 状态栏显示当前执行的命令
set showcmd

" 配色
set t_Co=256
colorscheme wombat256mod

" 设置缓冲区编码 文件编码探测LIST
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk

" 允许使用退格键，或set backspace=2
set backspace=eol,start,indent
" 光标移到最左时继续往左则移动上一行; 光标移到最右...
" set whichwrap+=<,>,h,l
 
" 配置 Tagbar 插件
let g:tagbar_left=1             " 窗口在左侧 

" 配置 nerdtree 插件
let NERDTreeWinPos='right'      " 窗口在右侧

" 快捷键
map <C-j> :tabprevious<CR>
map <C-k> :tabnext<CR>

imap <C-k> <up>
imap <C-j> <down>
imap <C-l> <right>
imap <C-h> <left>

nmap 9 :vertical resize +5<CR>
nmap 0 :vertical resize -5<CR>

nmap f :Tagbar<CR>
nmap ee :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

source ~/.vim/coc.vim
