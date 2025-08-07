set number                      "line numbers are good
set backspace=indent,eol,start	"allow backspace in insert mode
set mouse=a                     "allow use of mouse
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set autoread                    "reload files changed outside vim
set ruler            			"shows current cursor position
set foldmethod=syntax        	"folds code according to language syntax
set tabpagemax=20        		"opens up to 20 files (default: 10)
set showmatch            		"highlight matching brackets/braces/parentheses
set wrap            			"wrap text
set noswapfile            		"do not create swap files
set tabstop=4            		"tab = 4 spaces
set expandtab                   "convert tab into spaces
syntax on                       "syntax highlighting

" Enable persistent undo
set undofile            		"create undo file for each edited file
set undodir=~/.vim/undodir    	"directory to store undo files
set undolevels=1000        		"number of undoable changes
set undoreload=10000        	"amount of data stored for each undo level
