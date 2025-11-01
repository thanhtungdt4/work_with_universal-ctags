" ==============================================================
" Android C++ Development Helper - Vim Configuration
" ==============================================================

" --- Encoding ---
set encoding=utf-8
set fileencoding=utf-8

syntax on
set number
set ruler
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase smartcase
set nowrap
set tabstop=4 shiftwidth=4 expandtab
set autoindent

set path+=.,**
set wildignore+=*.o,*.a,*.so,*.swp,*.zip,*.jar,*.dex,out/**,build/**

if filereadable("cscope.out")
    cs add cscope.out
    cs reset
endif

if filereadable("tags")
    set tags=./tags,tags;$HOME
endif

" Jump to definition (ctags)
nnoremap <C-]> :tag <C-R><C-W><CR>
nnoremap <C-t> :pop<CR>
nnoremap <C-o> <C-o>
nnoremap <C-i> <C-i>

" --- Cscope shortcuts ---
if has("cscope")
    set cscopetag cscopeverbose
    nmap <C-\>s :cs find s <C-R><C-W><CR>
    nmap <C-\>g :cs find g <C-R><C-W><CR>
    nmap <C-\>c :cs find c <C-R><C-W><CR>
    nmap <C-\>t :cs find t <C-R><C-W><CR>
    nmap <C-\>e :cs find e <C-R><C-W><CR>
    nmap <C-\>f :cs find f <C-R><C-W><CR>
    nmap <C-\>i :cs find i <C-R><C-W><CR>
endif

" --- Enable mouse scrolling ---
" set mouse=a

command! -nargs=1 FindHeader execute "find " . <q-args>
autocmd FileType c,cpp,h,hpp setlocal includeexpr=substitute(v:fname,'^\"\\|\"$','','g')

set laststatus=2
set statusline=%f%m%r%h%w\ [%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]

set foldmethod=syntax
set foldlevel=99

nnoremap <silent> <Leader>h :let @/='\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>

" ==============================================================
" END
" ==============================================================
