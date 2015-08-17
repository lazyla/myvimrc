""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >> Author: Lazyla
" >> E-mail: bugtags@gmail.com
" >> LastModified:2015-08-11 18:05:26

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 说明，帮助记忆  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1.按F7可以直接编译并执行C、C++、java代码以及执行shell脚本，按“F8”可进行C、C++代码的调试
"2.自动插入文件头 ，新建C、C++源文件时自动插入表头：包括文件名、作者、联系方式、建立时间等，读者可根据需求自行更改
"3.映射“Ctrl + A”为全选并复制快捷键，方便复制代码
"4.按“F2”可以直接消除代码中的空行
"5.“F4”可列出当前目录文件，打开树状文件目录
"6. 支持鼠标选择、方向键移动
"7. 代码高亮，自动缩进，显示行号，显示状态行
"8.按“Ctrl + P”可自动补全, 现在tab应该也可以了，没试过
"9.[]、{}、()、""、' '等都自动补全
"10. F1                 F2                   F3                  F4: open taglist    F5:生成tag文件，更新taglist    F6                 
"    F7:编译运行c(pp)                 F8:c(pp)调试         F9                  F10            F11:c\h文件切换     F12:跳到最上
"11.wm打开侧边栏

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全局设置 (置顶)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"平台判断
function! GetSystem()
	if (has("win32") || has("win64"))
		return "windows"
	elseif has("unix")
		return "linux"
	elseif has("mac")
		return "mac"
	endif
endfunction

"let mapleader="\<space>"

inoremap jj <ESC>

"自动插入最后修改日期和时间
autocmd BufWritePre,FileWritePre [._]vimrc ks|call LastModified()|'s

fun! LastModified()
	exe "1,$s/[L]astModified: .*/LastModified:" .
				\ strftime("%F %T") . "/e"
endfun
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 设定窗口位置   
winpos 5 5

" 设定窗口大小  
set lines=43 columns=140

" 用浅色高亮当前行
autocmd InsertLeave * se nocul  

" 用浅色高亮当前行  
autocmd InsertEnter * se cul    

" 不要闪烁  
set novisualbell      

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set nocompatible 

" 语法高亮
syntax on
set backspace=indent,eol,start

" 显示行号
set number

" 突出显示当前行
set cursorline 

" 打开状态栏标尺             
set ruler 

"统一缩进为4
set softtabstop=4
set shiftwidth=4

"Tab键的宽度
set tabstop=4

"搜索逐字符高亮
set hlsearch

"自动缩进
set autoindent
set cindent

" 为C程序提供自动缩进
set smartindent
set incsearch
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"背景使用黑色
"set background=dark

" 设置背景主题  
"color asmanian2     

" 设置字体
if GetSystem() == "windows"
	if has("gui_running")
		"set guifont=Courier_New:h16
		set guifont=Courier_10_Pitch:h16
	endif
else
	if has("gui_running")
		set guifont=Courier\ 10\ Pitch\ 16
		"set guifont=Courier\ New\ 15    
		"set guifont=Droid\ Sans\ Mono\ 15
	endif
endif

"设置主题
colorscheme desert
"colorscheme torte
"colorscheme murphy 
"colorscheme elflord
"colorscheme ron
"colorscheme murphy

"编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"set fileencodings=gbk,ucs-bom,utf-8,cp936,gb18030,big5,latin1
set fileencoding=utf-8
set enc=utf-8

if GetSystem() == "windows"
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	language message zh_CN.UTF-8
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=1  

" 输入的命令显示出来，看的清楚些
set showcmd         

" 命令行（在状态行下）的高度，设置为1
set cmdheight=1
"set cmdheight=2      

" 总是显示状态行
set laststatus=2

" 光标移动到buffer的顶部和底部时保持3行距离 
"set scrolloff=3  

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息如下：
" %F    当前文件名
" %m    当前文件修改状态
" %r    当前文件是否只读
" %Y    当前文件类型
" %{&fileformat}当前文件编码
" %b    当前光标处字符的 ASCII 码值
" %B    当前光标处字符的十六进制值
" %l    当前光标行号
" %c    当前光标列号
" %V    当前光标虚拟列号 (根据字符所占字节数计算)
" %p    当前行占总行数的百分比
" %%    百分号
" %L    当前文件总行数


"从不备份  
set nobackup
set ignorecase smartcase

"搜索是否要绕回文件开头
"set nowrapscan	

"vundle
filetype off
if has("unix")
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else 
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
endif
"if you want to install vim-markdown
"(https://github.com/plasticboy/vim-markdown), just add "Bundle
"'plasticboy/vim-markdown'"
"then run [vim +BundleInstall]

"文件侦测
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on 


"Set extra options when running in GUI mode
if has("gui_running")
	" 隐藏工具栏                   
	set guioptions-=T
	" 隐藏菜单栏           
	set guioptions-=m 
	set t_Co=256
	set guitablabel=%M\ %t
	" 不要图形按钮    
	set go= 
endif


" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread

"vimrc文件修改之后自动加载
if GetSystem() == "windows"
	autocmd! bufwritepost _vimrc source %
else
	autocmd! bufwritepost .vimrc source %
endif

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

if has("autocmd") 
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
	autocmd FileType python set omnifunc = pythoncomplete#Complete
endif

"setlocal completefunc=javacomplete#CompleteParamsInfo

"代码补全 
set completeopt=longest,menu
"set completeopt=preview,menu

"共享剪贴板  
set clipboard+=unnamed

"自动保存
set autowrite

"设置魔术
set magic          

"设置折叠
set foldcolumn=0
"相同缩进构成折叠
"set foldmethod=indent
"手动设置折叠 
set foldmethod=manual     
set foldlevel=3
"空格键来开关折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"开始折叠 
set foldenable              

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 不要用空格代替制表符
"set noexpandtab

" 在行和段开始处使用制表符
"set smarttab

" 历史记录数
set history=1000
set noswapfile

"搜索忽略大小写
set ignorecase

"行内替换
set gdefault
"set helplang=cn

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
"set whichwrap+=<,>,h,l
"set whichwrap=b,s,<,>,[,]
"set nowrap
set wrap

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
"set selectmode=mouse,key
set selectmode=key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"打开后跳到上次关闭时的光标位置
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\	exe "normal g'\"" |
				\ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( <c-r>=AutoPare('(',')')<CR>
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap (( ();<ESC><Left>i

:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>

":inoremap [ []<ESC>i
:inoremap [ <c-r>=AutoPare('[',']')<CR>
:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap = <c-r>=AutoSpace('=')<CR>
:inoremap == <c-r>=AutoSpace('==')<CR>
:inoremap , , 
"::inoremap < <c-r>=AutoSpace('<')<CR>
"::inoremap > <c-r>=AutoSpace('>')<CR>
":inoremap << <><ESC>i


":inoremap : <c-r>=AutoSpace(':')<CR>

:inoremap " <c-r>=AutoPare('"','"')<CR>
:inoremap ' ''<ESC>i

""""""""""""""""""""""""""function""""""""""""""""""""""""""
function! AutoSpace(input)
	return "\<space>".a:input."\<space>"
endfunction


function! AutoPare(open, close)				
	:let line = getline('.')
	if col('.') < strlen(line) 
		return a:open
	else
		if getline('.')[col('.') - 2] == ' '					"光标比实际值多1，所以需要减2
			return a:open.a:close."\<ESC>i"
		else
			return a:open.a:close.";\<Left>\<ESC>i"
		endif
	endif
endfunction

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"智能Tab补全,根据上下文自动选择补全模式
"""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
function! Smart_TabComplete()
	let line = getline('.')                         " current line

	let substr = strpart(line, -1, col('.')+1)      " from the start of the current
	" line to one character right
	" of the cursor
	let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
	if (strlen(substr)==0)                          " nothing to match on empty string
		return "\<tab>"
	endif
	let has_period = match(substr, '\.') != -1      " position of period, if any
	let has_slash = match(substr, '\/') != -1       " position of slash, if any
	if (!has_period && !has_slash)
		return "\<C-X>\<C-P>"                         " existing text matching
	elseif ( has_slash )
		return "\<C-X>\<C-F>"                         " file matching
	else
		return "\<C-X>\<C-O>"                         " plugin matching
	endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 

imap  <F2> <Esc><Right>a
imap  <F3> <Esc><Right><Right>a

"映射全选+复制 ctrl+a
map <C-A> ggVG"+Y
map! <C-A> <Esc>ggVG"+Y
map <F12> gg=G

"选中状态下 Ctrl+c 复制
vmap <C-c> "+y
vmap <C-x> "yd								"Ctrl+x
nmap <C-v> "yp								"Ctrl+v
vmap <C-v> "yp
imap <C-s> <Esc>:wa<cr>i<Right>				"Ctrl+s
nmap <C-s> :wa<cr>

"按一次v选择一个字符, 两次选择一个单词,
"三次选择一段代码;注释的退回上一次的选择操作(需要vim-expand-region)
"https://github.com/terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)


"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 

"匹配那些末尾有空格或TAB的行。（es：Endspace Show）
map es :/.*\s\+$<CR>

"删除行末尾的空格或TAB（ed：Endspace Delete）
map ed :s#\s\+$##<CR>

"比较文件  
nnoremap <C-F2> :vert diffsplit 

"新建标签  
"ap <M-F2> :tabnew 

"列出当前目录文件  
"ap <F3> :tabnew .

"打开树状文件目录  
"ap <C-F3> \be 

"make 运行
:set makeprg=g++\ -Wall\ \ %

"C，C++ 按F7编译运行
map <F7> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc

"C,C++的调试
""ap <F8> :call Rungdb()<CR>
""func! Rungdb()
""	exec "w"
""	exec "!g++ % -g -o %<"
""	exec "!gdb %<"
""endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==>新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: Larry_Chen") 
		call append(line(".")+2, "\# mail: Larry_Chen@asus.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
		call setline(1, "\/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Larry_Chen") 
		call append(line(".")+2, "	> Mail: Larry_Chen@asus.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " \************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "\#include<iostream>")
		call append(line(".")+7, "\using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "\#include<>")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"设置tags  
"set tags=/home/larry_chen/src/github/tags
"set autochdir 
"按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++kinds=+p --fields=+iaS --extra=+q . <CR><CR> : TlistUpdate<CR>
imap <F5> <ESC> :!ctags -R --c++-kikds=+p --fields=+ias --extra=+q . <CR><CR> : TlistUpdate<CR>
set tags=tags
set tags+=./tags			"add current directory's generated tags file
set tags+=~/src/ze550rel/tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ap <F9> :call SaveInputData()<CR>
"func! SaveInputData()
"	exec "tabnew"
"	exec 'normal "+gP'
"	exec "w! /tmp/input_data"
"endfunc


"------------------------------------------------------------------------
"plugin - taglist.vim 查看函数列表，需要ctags程序
"F4 打开隐藏taglist窗
"进入~/.vim/bundle
"git clone git://github.com/vim-scripts/taglist.vim.git 
"通过Ctrl-w或鼠标点击在Taglist窗口和编辑区切换，在Taglist窗口鼠标或者键盘选择，然后点击或者回车，跳转到该符号定义的位置
"help taglist.txt查询更多功能
"--------------------------------------------------------------------------
if GetSystem() == "windows"
	let Tlist_Ctags_Cmd = 'C:\Program /File\ctags\ctags.exe'
else
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1					"只显示当前文件taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1				"如果taglist是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1				"在右侧窗口显示taglist
let Tlist_GainFocus_On_ToggleOpen  = 1		"打开taglist，光标保留在taglist窗口
"let Tlist_File_Fold_Auto_Close = 0			" 不要关闭其他文件的tags  
"let Tlist_Auto_Open = 1
"let Tlist_Auto_Update = 1
"let Tlist_Sort_Type = "name"				" 按照名称排序  
"let Tlist_Hightlight_Tag_on_BufEnter = 1
"let Tlist_Enable_Fold_Column = 0			"不要显示折叠树
"let Tlist_Process_File_Always = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Compace_Format = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin - NERDtee设定
"let NERDChristmasTree=1
"let NERDTreeAutoCenter=1
"let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
"let NERDTreeMouseMode=2
"let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
"let NERDTreeWinPos='left'
"let NERDTreeWinSize=31
"nnoremap f :NERDTreeToggle
"ap <F7> :NERDTree<CR>  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin - winManager
"ctrl+Tab，切换到前一个buffer，并在当前窗口打开文件；
"ctrl+shift+Tab，切换到后一个buffer，并在当前窗口打开文件；
"ctrl+箭头键，可以切换到上下左右窗口中；
"ctrl+h,j,k,l，切换到上下左右的窗口中。
""""""""""""""""""""""""""""""""""'""""""""""'""""""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

nmap wm :WMToggle<cr>
"minibufexpl
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplModeSelTarget=1
let g:miniBufExplMoreThanOne=0


""""""""""""""""""""""""""""""""""'""""""""""'""""""""""""""""""""""""""""""""""
"按F11即可以在c/h文件中切换，也可以通过输入:A实现
nnoremap <silent> <F11> :A<CR>
""""""""""""""""""""""""""""""""""'""""""""""'""""""""""""""""""""""""""""""""""
"将光标定位到要查找的内容上，按下F5，确定要查找的内容和搜索范围，gvim会在弹出的QuickFix窗口中列出所有符合条件的搜索结果
"nnoremap <silent> <F5> :Grep<CR>
""""""""""""""""""""""""""""""""""'""""""""""'""""""""""""""""""""""""""""""""""
"书签不可用
"光标定位在需要添加书签的地方，按下ctrl+F2，即添加了书签
"使用F2在书签之间正向切换，shift+F2反向切换


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"-----------------------------------------------------------------
"let g:AutoComplPop_NotEnableAtStartup = 1
"let g:NeoComplCache_EnableAtStartup = 1
"let g:NeoComplCache_SmartCase = 1
"let g:NeoComplCache_TagsAutoUpdate = 1
"let g:NeoComplCache_EnableInfo = 1
"let g:NeoComplCache_EnableCamelCaseCompletion = 1
"let g:NeoComplCache_MinSyntaxLength = 3
"let g:NeoComplCache_EnableSkipCompletion = 1
"let g:NeoComplCache_SkipInputTime = '0.5'
"let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'

" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" snippets expand key
"imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
"smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------
"-----------------------------------------------------------------

" -----------------------------------------------------------------------------
"  < cscope 工具配置>
" -----------------------------------------------------------------------------
if has("cscope")
    " 设定可以使用quickfix窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    " 支持用Ctrl+] 和 Ctrl+t 快捷键在代码直接跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
