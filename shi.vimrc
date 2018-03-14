execute pathogen#infect()
syntax on

set number

set tabstop=4

set softtabstop=4

set shiftwidth=4

set expandtab
set cursorcolumn
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
colorscheme distinguished

map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction

filetype plugin on

let g:pydiction_location ='~/.vim/tools/pydiction/complete-dict'

let g:pydiction_menu_height = 20
" *********************************************
" Vbundle插件管理                
" *********************************************
set nocompatible              " required
filetype off                  " required 
   
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        
 
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line                 
call vundle#end()            " required
filetype plugin indent on    " required

" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright
"快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
"ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 开启代码折叠功能
" 根据当前代码行的缩进来进行代码折叠
set foldmethod=indent
set foldlevel=99

Plugin 'scrooloose/nerdtree'

" *********************************************
" NERD插件属性
" *********************************************
"au vimenter * NERDTree   " 开启vim的时候默认开启NERDTree"
map <F2> :NERDTreeToggle<CR>  "设置F2为开启NERDTree的快捷键"
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

Plugin 'majutsushi/tagbar'
" 启动时自动focus
"let g:tagbar_auto_faocus =1 
" 启动指定文件时自动开启tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py call tagbar#autoopen()

Plugin 'Valloric/YouCompleteMe'
" *********************************************
" YCM插件相关
" *********************************************
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
"let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'     
"上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'


"let g:ycm_autoclose_preview_window_after_completion=1
" 跳转到定义处
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 默认tab、s-tab和自动补全冲突
"let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
"let g:ycm_auto_trigger = 1

Plugin 'Yggdroot/indentLine'
let g:indentLine_char='┆'
let g:indentLine_enabled = 0 

Plugin 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1

Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

let mapleader='#'
map <F4> <leader>ci<CR>

map <F8> <leader>:Autopep8<CR>

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" *********************************************
" vim-airline
" *********************************************
" 开启powerline字体
"let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
"set guifont=Source Code Pro for Powerline:h14

filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
