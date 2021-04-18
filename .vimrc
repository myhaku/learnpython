" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/autoload')
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading

" Using a non-default branch

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" Plugin options

" Plugin outside ~/.vim/plugged with post-update hook

" Unmanaged plugin (manually installed and updated)

" Initialize plugin system
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
