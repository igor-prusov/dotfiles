colorscheme molokai
"set background=light

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=e  "remove tab pages
set guioptions+=c  "use console dialogs for simple choices
let local_gvimrc="~/.gvimrc.local"
if filereadable(expand(local_gvimrc))
	execute 'source'.fnameescape(local_gvimrc)
endif
