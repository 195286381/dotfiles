""""""""""""""""""""""""""""""""""""""    basic config   """""""""""""""""""""""""""""""""""
"==========================================
" Author:  Xzzzzz
" Version: 1.0
" Email: 195286381@qq.com
" BlogPost: http://www.xz1990.com
" ReadMe: README.md
" Last_modify: 2017-01-15
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================

set nocompatible
set laststatus=2
" filetype off
syntax on " 设置语法高亮
set number " 显示行号
set so=7
" set cursorline " 设置当前行高亮
" set cursorcolumn " 设置当前列高亮
""""""""""""""""
"设置字体
"set guifont=Source\ Code\ Pro\ Bold\ 11
" 高亮搜索
set hls

autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
""""""""""""""""
" 设置缩进
""""""""""""""""
set tabstop=2  
set softtabstop=2 
set shiftwidth=2
set smarttab
set smartindent
" 设置主题

"
set ruler
set showcmd

"set title to show in console title bar
set title
"do not keep a backup file!
set nobackup
" 括号自动补全
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap < <><ESC>i

" 禁用方向键

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" >>> 配色方案" 
" Plug 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
" Plug 'vim-scripts/phd'


" 美化状态栏
" Plugin 'Lokaltog/vim-powerline'

" 美化状态栏 和 主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" C++ 语法高亮支持
" Plugin 'octol/vim-cpp-enhanced-highlight'

" JavaScript 语法 (ES5 and ES6)
" Plugin 'othree/yajs.vim'

" 支持大多数语言代码高亮
Plugin 'sheerun/vim-polyglot'

" 文件搜索
Plugin 'wincent/command-t'

" 下面这个插件可取代Command-T 但是现在暂时不支持目录忽略，所以先暂时不用
" 还有就是安装下载不下来啊
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" 相同缩进的代码关联起来
Plugin 'nathanaelkane/vim-indent-guides'

" 我习惯把类的接口和实现分在不同文件中，常有在接口文件（MyClass.h）和实现文件（MyClass.cpp）中来回切换的操作。
" 你当然可以先分别打开接口文件和实现文件，再手动切换，但效率不高。
" 我希望，假如在接口文件中，vim 自动帮我找到对应的实现文件，当键入快捷键，在新 buffer 中打开对应实现文件。
Plugin 'derekwyatt/vim-fswitch'

" 书签可视化的插件
Plugin 'kshenoy/vim-signature'

" 显示git diff 和 stages/undoes 片段
Plugin 'airblade/vim-gitgutter'

" 解决中文输入法下面无法使用命令
Plugin 'ybian/smartim'

" 它可以让书签行高亮
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'

" 基于标签的标识符列表插件
Plugin 'majutsushi/tagbar'

" 如何自动生成标签并引入
Plugin 'vim-scripts/indexer.tar.gz'
" 上面插件，依赖下面两个插件
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

" 上下文插件，例如搜索到关键字，中间缩略，展示一段上下文
Plugin 'dyng/ctrlsf.vim'

" 多光标编辑功能
Plugin 'terryma/vim-multiple-cursors'

" 快速开关注释
Plugin 'scrooloose/nerdcommenter'

" ASCII art 风格的注释
Plugin 'vim-scripts/DrawIt'

" 模板补全插件
Plugin 'SirVer/ultisnips'

" 随键而全的、支持模糊搜索的、高速补全的插件
" YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发
Plugin 'Valloric/YouCompleteMe'

" 根据类声明自动生成类实现的代码框架
Plugin 'derekwyatt/vim-protodef'

" 查看文件列表
Plugin 'scrooloose/nerdtree'

" 显示多个 buffer 对应的 window
Plugin 'fholgado/minibufexpl.vim'

" 提高HTML和CSS的工作流
Plugin 'mattn/emmet-vim'

" 快捷键选中 `<>`、`[]`、`{}` 中间的内容
" 这个与自定义快捷键冲突
Plugin 'gcmt/wildfire.vim'

" 让你有机会撤销最近一步或多步操作
Plugin 'sjl/gundo.vim'

" 快速移动，两次 `<leader>` 作为前缀键
Plugin 'Lokaltog/vim-easymotion'

" 编辑 markdown 文档，自动开启 firefox 为你显示 markdown 最终效果
" Plugin 'suan/vim-instant-markdown'

" 中/英输入平滑切换
" Plugin 'lilydjwg/fcitx.vim'

" 语法高亮多种知名JS库
Plugin 'othree/javascript-libraries-syntax.vim'

" React jsx 语法高亮
" Plugin 'mxw/vim-jsx'

" 提供快速编写xml/html的能力，如标签自动闭合等
Plugin 'othree/xml.vim'

" 实时显示颜色的功能，如#FFFFFF
Plugin 'cakebaker/scss-syntax.vim'

" CSS3 高亮，包括stylus,Less,Sass
Plugin 'hail2u/vim-css3-syntax'


Plugin 'spf13/vim-autoclose'
" 添加代码补全

Plugin 'marijnh/tern_for_vim'
"
Plugin 'ervandew/supertab'
" 
Plugin 'tpope/vim-surround'
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后)}})))

colorscheme molokai
" 配置YCM
let g:ycm_min_num_of_chars_for_completion = 1 
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_complete_in_comments = 0
" 配置 Smart Air bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '◀'
" >>>>>>>>>>
" YCM 补全

" 随键而全的、支持模糊搜索的、高速补全的插件
" YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发
" Plug 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel term=bold ctermbg=darkred guibg=#13354A


" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
