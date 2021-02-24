if has('nvim')
    call plug#begin('~/.vim/plugged')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'golang' }
    Plug 'fatih/molokai'
    Plug 'preservim/nerdcommenter'  " 注释插件
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-airline/vim-airline'  " 状态栏
    Plug 'Lokaltog/vim-easymotion'  " 优化移动命令
    Plug 'tomtom/tcomment_vim'      " 注释助手
    call plug#end()
endif

" 基础
syntax enable                   " 语法高亮
set noerrorbells                " 出错时不做声音提示
set nobackup                    " 不创建备份文件
set noswapfile                  " 不创建交换文件
filetype on                     " 文件类型检查
filetype plugin on              " 允许插件

" 缩进和空格
filetype indent on              " 根据文件文类自动缩进
set expandtab                   " 自动转换 Tab 为空格
set tabstop=4                   " Tab 显示空格数
set softtabstop=4               " Tab 转换空格数
set shiftwidth=4                " Tab 缩进空格数

" 外观 "
if &co > 80
    set number                   " 当终端大于 80时，显示行号
    set relativenumber           " 显示相对行号
endif

set t_Co=256			        " 启用 256色
set textwidth=80                " 行宽
set cursorline                  " 高亮光标所在行
set cursorcolumn                " 高亮光标所在列
colorscheme molokai    		    " 主题

" 中文
set formatoptions+=B            " 合并中文行时不加空格

" 快捷键前缀
let mapleader="\<space>"

" 剪贴板相关
" 可视模式下复制内容到剪切板
vmap <Leader>c "+yy
" 普通模式下复制内容到剪切板
nmap <Leader>c "+yy
" 普通模式下粘贴系统剪切板内容
nmap <Leader>v "+p

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

if has("gui_running")
    " set ruler                       " 显示尺度信息（右下角显示）
    " set showcmd                     " 在状态栏显示正在输入的命令 - nvim 默认启用
    filetype plugin indent on       " 启用自动补全 - nvim 默认
    set autoindent                  " 新行自动缩进 - nvim 默认
    set nocompatible                " 关闭兼容模式 - nvim 默认启用
    set encoding=utf-8              " 设置默认编码 - nvim 已默认
    set autoread                    " 文件改动提示 - nvim 默认启用
    set transparency=30             " 透明背景
    set go=aAce                     " 隐藏工具栏和滚动条
    set columns=60                  " 长
    set lines=10                    " 宽
endif
