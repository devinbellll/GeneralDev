syntax on
set nonumber
set ruler

set tabstop=4
set shiftwidth=4 " controls the depth of autoindentation
set expandtab    " converts tabs to spaces
set laststatus=2 " show status line always


autocmd Filetype c   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype h   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
set number

autocmd vimenter * NERDTree
autocmd vimenter * wincmd l 

set backspace=indent,eol,start
set autoindent

nnoremap <C-q> :wq<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <silent><Bs> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><S-Bs> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
