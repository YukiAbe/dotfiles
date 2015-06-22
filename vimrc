""abe write this file 
""2012/02/22 update

""set number
set number
""activation indent
""set cindent
""set calor
syntax on
""back space is cut off indent
set backspace=2


""Buftab
""let g:buftabs_only_basename=1
""let g:buftabs_in_statusline=1
""let g:buftabs_active_highlight_group="Visual"

""set statusline=%{g:buftabs_list}%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
""set laststatus=2
""""end Buftab

""autoindent befor row
set autoindent
""display tab and space
"" set list
""display case arc 
set showmatch

if has("cscope")
	set csprg=/home/abe/local/cscope-15.7a/bin/cscope
	set csto=0
	set cst
	set nocsverb
	"" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	"" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif


"" Enable neocomplcache
let g:neocomplcache_enable_at_startup = 1
"" Disenable AutoComplPop
let g:acp_enableAtStartup = 0
"" samething path
setlocal omnifunc=syntaxcomplete#Complete
"" set spell
set spell
""
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" set utf-8
set fileencoding=utf-8

"" 
set showmatch
set enc=utf-8


set cursorline
:highlight CursorLine guibg=lightblue ctermbg=lightgray cterm=none

set visualbell t_vb=
set tabstop=2
set nobackup

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o> 
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o> 
augroup END
