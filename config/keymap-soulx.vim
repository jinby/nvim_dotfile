filetype plugin indent on

map <C-a> ggVG
vmap <C-c> "+y
vmap <C-v> "+p
nmap <C-v> "+p
imap <C-v> <ESC>"+pa

noremap K 5k
noremap J 5j

imap <c-s> <ESC>:w<cr>a
nmap <c-s> :w<cr>
vmap <c-s> :w<cr>

map <A-j> :tabn<cr>
map <A-k> :tabp<cr>

noremap tn :tabnew<cr>
noremap R :source $MYVIMRC<cr>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

noremap <LEADER>j <c-w>j<CR>
noremap <LEADER>h <c-w>h<CR>
noremap <LEADER>l <c-w>l<CR>
noremap <LEADER>k <c-w>k<CR>

" resize
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>



" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
if !common#functions#HasPlug('ResizeWindow.vim')
    " 更改窗口垂直大小
    nnoremap <M--> :resize +3<CR>
    nnoremap <M-_> :resize -3<CR>
    " 更改窗口水平大小
    nnoremap <M-(> :vertical resize -3<CR>
    nnoremap <M-)> :vertical resize +3<CR>
endif
" 分割窗口

" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 使用回车打开关闭折叠
"nnoremap <CR> za
" shift enter，为何不可以？
nnoremap <S-Return> zMzo
" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 使用alt q关闭当前buffer
nnoremap <M-q> <esc>:bdelete<cr>

" 去除EX模式
nmap Q <nop>
" 使用Q进行宏录制
noremap Q q

nmap << <<_
nmap >> >>_

nnoremap ! :!

" 跳转到最后
" 0是跳转到开头
nnoremap 9 $

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
inoremap <M-h> <esc>^i
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
" noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
" xnoremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>
noremap <silent> <space><space> <esc>:silent! write<cr>
xnoremap <silent> <space><space> <esc>:silent! write<cr>

" 复制到末尾
"nnoremap Y y$
"nnoremap vv ^vg_

if !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('vim-crystalline')
    nnoremap  <M-l> :call common#functions#MoveTabOrBuf(1)<cr>
    nnoremap  <M-h> :call common#functions#MoveTabOrBuf(0)<CR>
    tnoremap  <M-l> <c-\><c-n>:call common#functions#MoveTabOrBuf(1)<cr>
    tnoremap  <M-h> <c-\><c-n>:call common#functions#MoveTabOrBuf(0)<CR>
endif
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>


map <leader>o <ESC>:call OpenFileLocation()<CR>

" ===
" === markdown 锚点
" ===
autocmd Filetype * inoremap <buffer> <silent> ,, <++>
autocmd Filetype * inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype * nnoremap ,f /<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA  
autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a