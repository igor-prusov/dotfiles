colorscheme molokai
"set background=light

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
let local_gvimrc="~/.gvimrc.local"
if filereadable(expand(local_gvimrc))
	execute 'source'.fnameescape(local_gvimrc)
endif
