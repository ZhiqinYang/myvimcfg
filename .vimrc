set nocompatible
nmap <Tab> <C-w>w
nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>
nmap <leader>w :w!<CR>


filetype plugin indent on

syntax on

"color molokai
set nocompatible
set backspace=indent,eol,start
set expandtab
set backspace=2
set number
set history=1000
set maxmempattern=2000
set ignorecase
set linespace=0
set showcmd
set hlsearch
set incsearch

set langmenu=zh_CN.UTF-8
set helplang=cn
set viminfo+=!

"将Tab替换为空格
set      expandtab
set      smarttab
retab


"使用VIM不兼容模式
set      nocp
"命令行高度为2
set      cmdheight=2

"set mouse=n

"允许继续向前删除
set   backspace=indent,eol,start
"允许光标跨行
set      whichwrap=b,<,>,[,],h,l


set autoread
set showmatch
set matchtime=1
set completeopt=longest,menu
set nobackup
set noswapfile
set encoding=utf-8 fileencodings=utf-8
let g:molokai_original = 1

syntax enable
set background=dark
colorscheme solarized



""""""""""""""""""""""""""""""
" plug settings
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'maralla/completor.vim'
Plug 'git://git.wincent.com/command-t.git'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/Auto-Pairs'
Plug 'majutsushi/tagbar'
call plug#end()
"""""""""""""""""""""""



""""""""""""""""""""completor"""""""""""""""""""""""""""""
filetype plugin indent on     " required!
"Brief help
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"see :h vundle for more details or wiki for FAQ
"NOTE: comments after Bundle command are not allowed..
"
au BufWritePost *.go GoImports
let g:completor_gocode_binary = '/usr/local/gotool/bin/gocode'
let g:go_fmt_autosave = 1
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "gofmt"

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> Tab_Or_Complete()

""""""""""""""""""""completor END"""""""""""""""""""""""""""""




""""""""""""""""""""CtrlSF"""""""""""""""""""""""""""""
let g:ctrlsf_ignore_dir = ['sql', '\.*', 'log', 'pkg']
nmap ,m :CtrlSF <C-R>=expand('<cword>')<CR><CR>
""""""""""""""""""""CtrlSF END"""""""""""""""""""""""""""""

""""""""""""""""""""CtrlP"""""""""""""""""""""""""""""
nmap ,, :CtrlP<CR>
nmap <C-F> <Plug>CtrlSFPrompt
map ,f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.build|github.com|labix.org|golang.org|bin|pkg|DataTables\-1\.10\.13|js|tools)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|ini|pem|sh|csv|a|py|awk|lua|bat|sql|xls|xlsx)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
""""""""""""""""""""CtrlP END"""""""""""""""""""""""""""""



""""""""""""""""""""TagBar"""""""""""""""""""""""""""""
map <F3> :TagbarToggle<CR>
""""""""""""""""""""TagBar END"""""""""""""""""""""""""""""




""""""""""""""""""""PowerLine"""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_theme="你的主题"
"
" 是否启用顶部tabline
let g:airline#extensions#tabline#enabled = 1
" 顶部tabline显示方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace        = 0
""""""""""""""""""""PowerLine END"""""""""""""""""""""""""""""

""""""""""""""""""""" ctrlsf """"""""""""""""
let g:ctrlsf_ackprg = 'ag'
"""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""go vim """""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""括号 提供颜色"""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""括号 提供颜色 END"""""""""""""""""""""""""""""
