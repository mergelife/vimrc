".vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible
"Sets how many lines of history VIM har to remember
set history=400
"Set to auto read when a file is changed from the outside
set autoread
"Have the mouse enabled all the time:
"when you need to copy from vim, maybe you have to ':set mouse=' first
set mouse=a
"""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable
syntax on
"set colorscheme
colorscheme elflord
"colorscheme default
"endif
"""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors away from the border- when moving vertical..
set so=7
"Turn on WiLd menu
set wildmenu
"Always show current position
set ruler
"The commandbar is 2 high
set cmdheight=2
"Show line number
set nu
"Set backspace
set backspace=eol,start,indent
"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l
"show matching bracets
set showmatch
"How many tenths of a second to blink
set mat=2
"Highlight search things
set hlsearch
"imediately show the search result
set is
"""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0
"""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""
"set expandtab
set shiftwidth=2
set ambiwidth=double
set smarttab
set ts=4
set lbr
set tw=500
set selection=inclusive
   """""""""""""""""""""""""""""" " Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set ai
   "Set auto indent width = 4 spaces
   set sw=4
   "Smart indet
   set si
   "C-style indenting
  " set cindent "usage: select codes, press '=' key, the codes will autoindenting
   "Wrap lines
   set wrap
"Encoding settings
if has("multi_byte")
    " Set fileencoding priority
    if getfsize(expand("%")) > 0
        set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
    else
        set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
    endif
    " CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        " Use cp936 to support GBK, euc-cn == gb2312
        set encoding=cp936
        set termencoding=cp936
        set fileencoding=cp936
    elseif v:lang =~ "^zh_TW"
        " cp950, big5 or euc-tw
        " Are they equal to each other?
        set encoding=big5
        set termencoding=big5
        set fileencoding=big5
    elseif v:lang =~ "^ko"
        " Copied from someone's dotfile, untested
        set encoding=euc-kr
        set termencoding=euc-kr
        set fileencoding=euc-kr
    elseif v:lang =~ "^ja_JP"
        " Copied from someone's dotfile, unteste
        set encoding=euc-jp
        set termencoding=euc-jp
        set fileencoding=euc-jp
    endif
    " Detect UTF-8 locale, and replace CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
        set termencoding=utf-8
        set fileencoding=utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

"选中状态下 Ctrl+c 复制
"vmap <C-c> "+y
"for MacOS
set clipboard+=unnamed
"搜索忽略大小写
set ignorecase
"""""""""""""""""""""""""""""""""""""
"plugins
"""""""""""""""""""""""""""""""""""""
"===== ctags =====
"For ctags, then it can find the 'tags' file even not in current directory
set tags=tags;/
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .;cscope -Rbq;filenametags.sh<CR>
map <C-_>q :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .;cscope -Rbq;filenametags.sh<CR>

"===== Tlist =====
""if &diff
""let Tlist_Auto_Open=0 "don't auto pen when compare two files
""else
""let Tlist_Auto_Open=1 "auto pen Tlist when open a file
""endif
"set taglist window in right, delete the following line if you don't like
""let Tlist_Use_Right_Window=0
""let Tlist_Auto_Update=1 
""let Tlist_File_Fold_Auto_Close=1
"auto close Tlist when exiting file.
"let Tlist_Exit_OnlyWindow = 1 
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"nmap <silent> <F9> :Tlist<cr>

"===== 自动补全 =====
set nocp
filetype plugin on
"filetype plugin indent on
"set completeopt=longest,menu


"===== auto paste F9  =====
set pastetoggle=<F9>


"===== miniBufexpl =====
"let g:miniBufExplExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBUfExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
"===== winManager =====
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout= 'NERD_Tree|TagList,BufExplorer'
let g:winManagerWidth=30
"let g:AutoOpenWinManager=1
"let g:AutoOpenWinManager=1
 "   let g:AutoOpenWinManager=0 "don't auto pen when compare two files else
"else    
 "   let g:AutoOpenWinManager=1 "auto pen Tlist when open a file
"endif
"nmap <silent> <F8> :WMToggle<cr>

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
      exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
     return 1
endfunction
"nmap wm :WMToggle<CR>
nmap <silent> <F4> :WMToggle<CR>
"===== quickfix =====
nmap <F7> :cp<CR>
nmap <F8> :cn<CR>
nmap <F6> :cw<CR>
"===== grep =====
nnoremap <silent> <F3> :Grep<CR>

"===== supertab =====
let g:SuperTabDefaultCompletionType="context" 
"===== A.vim =====
nnoremap <silent> <F12> :IH<CR> 
"===== NERD_tree.vim =====
"nmap <F10> :NERDTreeToggle<CR> let NERDTreeWinPos='right'
let NERDChristmasTree=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NerdTreeWinSize=31

"===== fencview.vim =====
nmap <silent> <F5> :FencAutoDetect<cr>
"let g:fencview_autodetec=1
"let g:fencview_auto_patterns='*'
"set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936,sjis,cp932

"===== mark.vim =====
nmap tt \m

"===== vbookmark.vim =====
"let g:vbookmark_bookmarkSaveFile = '/home/caolei/.vimbookmark'
"disable default key
let g:vbookmakr_disableMapping = 1
nnoremap <silent> <C-F2> :VbookmarkToggle<CR>
nnoremap <silent> <F2> :VbookmarkNext<CR>
nnoremap <silent> <S-F2> :VbookmarkPrevious<CR>

"===== cscope =====

"shortcut key
"0 ro s: 查找本C符号(可以跳过注释)
"0 or s: Find this C symbol
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"1 or g: 查找本定义 
"1 or g: Find this definition
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"2 or d: 查找本函数调用的函数
"2 or d: Find functions called by this function
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"3 or c: 查找调用本函数的函数
"3 or c: Find functions calling this function
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"4 or t: 查找本字符串
"4 or t: Find this text string
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"6 or e 查找本 egrep 模式
"6 or e: Find this egrep pattern
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"7 or f: 查找本文件
"7 or f: Find this file
nmap <C-_>f :cs find f <C-R>=expand("<cword>")<CR><CR>
"8 or i: 查找包含本文件的文件
"8 or i: Find files #including this file
nmap <C-_>i :cs find i <C-R>=expand("<cword>")<CR><CR>
 
"use quickfix windows show cscope's result 
:set cscopequickfix=s-,c-,d-,i-,t-,e-

"find  .  -name  '*.o'  -type f -print  -exec  rm  -rf  {} \; 



"auto add database
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/")
        if !empty(cscope_file)&&filereadable(cscope_file)
            exe "cs add" cscope_file cscope_pre
        endif
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lookupfile
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")               "设置tag文件的名字
"	let g:LookupFile_TagExpr = '"./filenametags"'
"endif
"auto add filenametags
if filereadable("filenametags")
	let g:LookupFile_TagExpr = '"./filenametags"'
else
    let g:filenametags_file=findfile("filenametags",".;")
	let filenametags_pre=matchstr(filenametags_file,".*/")
	if !empty(filenametags_file)&&filereadable(filenametags_file)
        let g:LookupFile_TagExpr='g:filenametags_file'
	endif
endif

"映射LookupFile为,lk
nmap <silent> <leader>lk :LookupFile<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>
