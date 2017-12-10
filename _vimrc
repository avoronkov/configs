execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
syntax on
set bg=dark

se bs=2
se bg=dark


set ffs=unix,dos
set ruler

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4 

se mouse=a
se ttymouse=xterm2

set autoindent smartindent
set hlsearch

set ignorecase

set modeline

set number

autocmd FileType python :set expandtab
autocmd FileType python	:let python_highlight_all=1
autocmd FileType python map <Leader>pf :wa \| :call Flake8()<CR>

autocmd FileType php :set expandtab

command! Blame VCSBlame

" autocmd FileType go map <Leader>gb :wa \| :!go build<CR>
" autocmd FileType go map <Leader>gt :wa \| :!go test<CR>
autocmd FileType go map <Leader>gf :wa \| :GoFmt<CR>
autocmd FileType go map <Leader>gr :wa \| :GoRun<CR>
autocmd FileType go map <Leader>gb :wa \| :GoBuild<CR>

" execute pathogen#infect()

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_bin_path = expand("~/dev/go/bin")

fu! s:QuiltSend(host)
	exe ":wa"
	exe ":!qsend " . a:host
endfu

command! -nargs=1 Qs call s:QuiltSend(<q-args>)
map <Leader>qs :wa \| :!qsend ,<CR>

fu LatexAddFrame()
	call append(line('.'), "\\end{frame}")
	call append(line('.'), "\\begin{frame}{}")
endfu

fu LatexAddBlock()
	call append(line('.'), "\t\\end{block}")
	call append(line('.'), "\t\\begin{block}{}")
endfu

autocmd FileType tex map <Leader>f :call LatexAddFrame()<CR>
autocmd FileType tex map <Leader>b :call LatexAddBlock()<CR>

let g:loaded_logipat = 1
