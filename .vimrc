syntax on
set ts=4 expandtab
set number
set mouse=a
set bs=2
set ruler
set foldmethod=syntax
set nofoldenable
set tabpagemax=100
set cursorline
set showmatch
let python_highlight_all = 1

color khlcolor
set gfn=Monospace\ Bold\ 15

let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands


"NERDTree configs
"execute pathogen#infect()
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"NERDTreeMirrorOpen

"move to next tab
map <C-l> :tabn<CR>
"move to prev tab
map <C-h> :tabp<CR>

"close NERDtree automatically after opening a file
let NERDTreeQuitOnOpen = 1

"automatically adjust window sizes in split mode
autocmd VimResized * wincmd =

"opens gvim window with a certain width
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 2
          \| let &columns = &numberwidth + 100

autocmd BufRead,BufNewFile *.drc  set filetype=calibre
autocmd BufRead,BufNewFile *.hdr  set filetype=calibre
autocmd BufRead,BufNewFile *.lua  set filetype=alt

set tags=./tags;

hi MatchParen cterm=underline ctermbg=none ctermfg=cyan
