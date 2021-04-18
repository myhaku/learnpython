
call plug#begin('~/.vim/autoload')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

set nu
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

syntax on

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
if &filetype=='c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype=='cpp'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype=='python'
	exec "!time python %"
endif
endfunc
