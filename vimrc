set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'msanders/snipmate.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Raimondi/delimitMate'
"Plugin 'scrooloose/syntastic'
Plugin 'junegunn/goyo.vim'
Plugin 'bogado/file-line'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'juneedahamed/vc.vim'
Plugin 'keith/swift.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
"Plugin 'Rip-Rip/clang_complete'
Plugin 'chazy/cscope_maps'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'vimwiki/vimwiki'
Plugin 'Konfekt/FastFold'
"Plugin 'justmao945/vim-clang'
Plugin 'osyo-manga/vim-marching'
Plugin 'pangloss/vim-javascript'
"Plugin 'airblade/vim-gitgutter'
Plugin 'MattesGroeger/vim-bookmarks'

Plugin 'tssm/fairyfloss.vim'
Plugin 'molokai'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pyte'
Plugin 'dracula/vim'


"Plugin 'jcf/vim-latex'


" All of your Plugins must be added before the following line
call vundle#end()            " required

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

let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/"
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Make CtrlP ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Don't locate buffers by default
let g:bufExplorerFindActive=0

"Disable vim-bookmarks default key mappings because they conflict with marks
let g:bookmark_no_default_key_mappings = 1

"Add key mappings for bookmarks
nmap <Leader>fa <Plug>BookmarkAnnotate
nmap <Leader>ft <Plug>BookmarkToggle

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

syntax on

"********************Arduino********************************
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

autocmd FileType arduino map <F5> :cd %:p:h/..<CR> :!ino build<CR>
autocmd FileType arduino map <F9> :cd %:p:h/..<CR> :!ino upload<CR>
autocmd FileType arduino map <F1> :!ino serial<CR>
"*************************************************************

set nocp
set hlsearch
set incsearch
set laststatus=2

filetype plugin on
"***************************C++****************************
autocmd FileType cpp set number
autocmd FileType cpp map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd FileType cpp map <F9> :w <CR> :cd %:p:h/<CR> :make<CR>
autocmd FileType cpp map <F3> :TagbarToggle<CR>

"***************************C******************************
autocmd FileType c map <F3> :TagbarToggle<CR>
autocmd FileType c map <F9> :w <CR> :cd %:p:h/<CR> :make<CR>

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
map <F10> :GitGutterToggle<CR>
map <silent> <F2> :NERDTreeToggle<CR>
map <C-TAB> <leader>c<space>
map <leader>b :CtrlPBuffer<CR>
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"map <C-j> :tabprevious<CR>
"map <C-k> :tabnext<CR>

"***************Bindings for vimdiff**************************
nnoremap <expr> <S-up> &diff ? '[c' : '<nop>'
nnoremap <expr> <S-down> &diff ? ']c' : '<nop>'
nnoremap <expr> <S-left> &diff ? 'do' : '<nop>'
nnoremap <expr> <S-right> &diff ? 'dp' : '<nop>'

"*****************ENGLISH_THOUSANDS****************************
command Countsymb %s/[\n\t\ \.\,\:\"]//g <bar> :w<bar>:!wc -m %


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

call TabStyle("tabs")


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


"*****************Delete buffers************************
map <leader>x :bd<CR>

"*****************highlight search results************************
set hlsearch

"*********************Abbreviations************************
abbreviate O OpenSession

"**********************local vimrc*************************
let local_vimrc="~/.vimrc.local"
if filereadable(expand(local_vimrc))
	execute 'source'.fnameescape(local_vimrc)
endif
