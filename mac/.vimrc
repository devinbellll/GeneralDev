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
set tags=./tags,tags;$HOME
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = 'find %s -type f \( -iname \*.h -o -iname \*.c -o -iname \*.py \)'
let g:ctrlp_clear_cache_on_exit = 0

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd Filetype c   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype h   setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
set number

nnoremap <silent><Bs> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><S-Bs> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

colorscheme iceberg

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


set mouse-=a
set number relativenumber
set nu rnu

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>

" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" <F7> restores that 'shutdown session'
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" If you really want to, this next line should restore the shutdown session
" automatically, whenever you start vim.  (Commented out for now, in case
" somebody just copy/pastes this whole block)
"
autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>

" manually save a session with <F5>
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>

" recall the manually saved session with <F6>
noremap <F6> :source ~/.vim/manual_session.vim<cr>

map gn :bn<cr>
map gp :bp<cr>
map gd :Bclose<cr>  

" Remove trailing whitespaces with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
