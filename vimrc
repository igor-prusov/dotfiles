set nocompatible              " be iMproved, required
filetype off                  " required

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'msanders/snipmate.vim'
Plug 'majutsushi/tagbar'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'klen/python-mode'
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/syntastic'
Plug 'junegunn/goyo.vim'
Plug 'bogado/file-line'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'jlanzarotta/bufexplorer'
Plug 'juneedahamed/vc.vim'
Plug 'keith/swift.vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"Plug 'xavierd/clang_complete'
Plug 'chazy/cscope_maps'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'vimwiki/vimwiki'
Plug 'Konfekt/FastFold'
"Plug 'justmao945/vim-clang'
"Plug 'osyo-manga/vim-marching'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-rooter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'

Plug 'tssm/fairyfloss.vim'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/pyte'
Plug 'dracula/vim'
Plug 'HiPhish/info.vim'
if g:os == "Darwin"
	Plug '/usr/local/opt/fzf'
elseif g:os == "Linux"
	Plug '~/.fzf'
endif
Plug 'junegunn/fzf.vim'
Plug 'junkblocker/patchreview-vim'
Plug 'itchyny/calendar.vim'



"Plug 'jcf/vim-latex'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"********************Vundle End**************************************

colorscheme monokai

let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode -file-line-error-style $*'
let g:pymode_breakpoint = 0
let g:session_autosave = 'no'

let g:neocomplete#enable_at_startup = 1

let g:clang_library_path='/usr/lib/llvm-3.8/lib'
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Don't locate buffers by default
let g:bufExplorerFindActive=0

"Disable vim-bookmarks default key mappings because they conflict with marks
let g:bookmark_no_default_key_mappings = 1

let g:infoprg = "/usr/bin/info"

"Add key mappings for bookmarks
nmap <Leader>fa <Plug>BookmarkAnnotate
nmap <Leader>ft <Plug>BookmarkToggle

let g:ycm_show_diagnostics_ui = 0

" vim-marching and neocomplete
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_overwrite_completefunc = 1
  let g:neocomplete#force_omni_input_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.objc =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.objcpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" neosnippet
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif

" be more liberal about hidden buffers
set hidden
" Keep more commands in history
set history=5000
" Update buffer if coresponding file changes
set autoread
" Fix backspace behavior
set backspace=indent,eol,start

syntax on

"********************Arduino********************************
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

autocmd FileType arduino map <F5> :cd %:p:h/..<CR> :!ino build<CR>
"*************************************************************

set nocp
set hlsearch
set incsearch
set laststatus=2

filetype plugin on
"***************************C++****************************
autocmd FileType cpp set number
autocmd FileType cpp map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd FileType cpp map <F3> :TagbarToggle<CR>

"***************************C******************************
autocmd FileType c map <F3> :TagbarToggle<CR>

"***************************Python****************************
autocmd FileType python map  <F3> :TagbarToggle<CR>

"***************************Device Tree****************************
au BufRead,BufNewFile *.dts set filetype=dts
au BufRead,BufNewFile *.dtsi set filetype=dts
autocmd Filetype dts setlocal tabstop=4
autocmd Filetype dts setlocal softtabstop=4
autocmd Filetype dts setlocal smartindent
autocmd Filetype dts setlocal noexpandtab
autocmd Filetype dts setlocal shiftwidth=4

"***************************TASM******************************
au BufRead,BufNewFile *.ASM setlocal filetype=tasm
au BufRead,BufNewFile *.ASM setlocal noexpandtab
au BufRead,BufNewFile *.ASM setlocal tabstop=8
au BufRead,BufNewFile *.ASM setlocal shiftwidth=8
au BufRead,BufNewFile *.ASM setlocal softtabstop=8
"au BufRead,BufNewFile *.ASM let g:ycm_min_num_of_chars_for_completion=100
"au BufRead,BufNewFile *.ASM setlocal shiftwidth=2 tabstop=2

"*************************************************************
map <F3> :TagbarToggle<CR>
map <F12> :set invnu<CR>
map <F11> :set invrelativenumber<CR>
map <silent> <F2> :NERDTreeToggle<CR>
map <C-TAB> <leader>c<space>
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"map <C-j> :tabprevious<CR>
"map <C-k> :tabnext<CR>

map <C-p> :FZF<CR>

"***************Bindings for vimdiff**************************
nnoremap <expr> <S-up> &diff ? '[c' : '<nop>'
nnoremap <expr> <S-down> &diff ? ']c' : '<nop>'
nnoremap <expr> <S-left> &diff ? 'do' : '<nop>'
nnoremap <expr> <S-right> &diff ? 'dp' : '<nop>'

"*****************ENGLISH_THOUSANDS****************************
command Countsymb %s/[\n\t\ \.\,\:\"]//g <bar> :w<bar>:!wc -m %


"*****************Hilight trailing spaces**********************
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"*****************Tabulation*********************
"set smartindent

function TabStyle(type)
	if a:type == "tabs"
		set tabstop=8
		set softtabstop=8
		set noexpandtab
		set shiftwidth=8
	elseif a:type == "spaces"
		set tabstop=4
		set softtabstop=4
		set shiftwidth=4
		set expandtab
	else
		echon "Unknown type: "
		echom a:type
	endif
endfunction

"call TabStyle("tabs")

"*****************less.vim config******************
function LessInitFunc()
	set readonly
	set nomodifiable
	set noswapfile
endfunction

"****************Termdebug************************
packadd termdebug
let g:termdebug_wide = 163
function Debug()
	hi debugPC guibg=blue
	hi debugBreakpoint guibg=red
	Termdebug
	:bdelete! debugged\ program
endfunction

map <F9> :call Debug()<CR>


"*****************Encodings************************
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r        :e ++enc=koi8-r<CR>
menu Encoding.windows-1251  :e ++enc=cp1251<CR>
menu Encoding.utf-8         :e ++enc=utf8<CR>
map <F8> :emenu Encoding.<TAB>

menu Indent.tabs	:call TabStyle("tabs")<CR>
menu Indent.spaces	:call TabStyle("spaces")<CR>
map <F7> :emenu Indent.<TAB>

"*****************air-line************************
"let g:airline_powerline_fonts = 1

"*****************invivsible chars************************
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"*****************Match Hilights***********************
"Match trailing spaces
nmap <leader>mt :match ExtraWhitespace /\s\+$/<CR>
"Clear highlight
nmap <leader>mm :match<CR>


"*****************Delete buffers************************
map <leader>x :bd<CR>

"*****************CoC mappings *************************
nmap <leader>cd :CocList diagnostics<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F1> :CocList symbols<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

menu Actions.Rename	<Plug>(coc-rename)
map <F6> :emenu Actions.<TAB>

"*****************highlight search results************************
set hlsearch

"**********************local vimrc*************************
let local_vimrc="~/.vimrc.local"
if filereadable(expand(local_vimrc))
	execute 'source'.fnameescape(local_vimrc)
endif
