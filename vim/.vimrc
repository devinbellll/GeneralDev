syntax on
set nonumber
set ruler

set rtp+=~/.vim/autoload/pathogen.vim
call pathogen#infect()

set tabstop=4
set shiftwidth=4 " controls the depth of autoindentation
set expandtab    " converts tabs to spaces
set laststatus=2 " show status line always
set hidden

set wildmode=longest,list,full
set wildmenu
set ignorecase
set infercase 

autocmd Filetype c   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype h   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
set number

autocmd vimenter * wincmd l 

set backspace=indent,eol,start
set autoindent

nnoremap <C-q> :wq<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <silent><Bs> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><S-Bs> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

colorscheme iceberg

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


set mouse-=a

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

" Remove trailing whitespaces with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
