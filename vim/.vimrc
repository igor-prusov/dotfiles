set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'

Plug 'HiPhish/info.vim'
Plug 'Konfekt/FastFold'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
"Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'bogado/file-line'
Plug 'chazy/cscope_maps'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
"Plug 'honza/vim-snippets'
Plug 'itchyny/calendar.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'juneedahamed/vc.vim'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junkblocker/patchreview-vim'
Plug 'keith/swift.vim'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/pyte'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
"Plug 'xolox/vim-session'
Plug 'mileszs/ack.vim'
Plug 'eugen0329/vim-esearch'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'p00f/clangd_extensions.nvim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'tanvirtin/vgit.nvim',
"Plug 'airblade/vim-gitgutter'

"FZF and LSP integration
Plug 'gfanto/fzf-lsp.nvim'

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

let g:session_autosave = 'no'

" completion config
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline('/', {
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
  --   sources = cmp.config.sources({
  --     { name = 'path' }
  --   }, {
  --     { name = 'cmdline' }
  --   })
  -- })
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  end


  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('clangd_extensions').setup {
    server = {
      capabilities = capabilities,
      cmd = {"/home/19836454/opt/clangd_13.0.0/bin/clangd", "--background-index", "--compile-commands-dir=./" },
      on_attach = on_attach,
      flags = {
          debounce_text_changes = 150
      }
    },
  }

  vim.diagnostic.config({virtual_text = false})

  require('gitsigns').setup()
EOF

" Don't locate buffers by default
let g:bufExplorerFindActive=0

"Disable vim-bookmarks default key mappings because they conflict with marks
let g:bookmark_no_default_key_mappings = 1

let g:infoprg = "/usr/bin/info"
let g:ackprg = 'ag --nogroup --nocolor --column'

" be more liberal about hidden buffers
set hidden
" Keep more commands in history
set history=5000
" Update buffer if coresponding file changes
set autoread
" Fix backspace behavior
set backspace=indent,eol,start
" For coc.nvim
"set updatetime=300
"set cmdheight=1

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

"***************************Rust****************************
autocmd FileType rust let b:dispatch = 'cargo build'

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

call TabStyle("tabs")

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


"*******************Buffers*****************************
"Delete buffers
map <leader>x :bd<CR>
"List buffers with FZF
"nmap <leader>be :Buffers<CR>
"

"*****************highlight search results************************
set hlsearch

"**********************local vimrc*************************
let local_vimrc="~/.vimrc.local"
if filereadable(expand(local_vimrc))
	execute 'source'.fnameescape(local_vimrc)
endif
