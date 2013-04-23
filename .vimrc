syntax enable
set autoindent
set hlsearch
set number

set mouse=a

if has("autocmd")
  filetype plugin on
  
  augroup python
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4
    autocmd BufReadPre,FileReadPre      *.py set shiftwidth=4
    autocmd BufReadPre,FileReadPre      *.py set expandtab
  augroup END

  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb,*.erb,*.rake set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb,*.erb,*.rake set shiftwidth=2
    autocmd BufReadPre,FileReadPre      *.rb,*.erb,*.rake set expandtab
  augroup END

  augroup js
    autocmd BufReadPre,FileReadPre      *.js set tabstop=2
    autocmd BufReadPre,FileReadPre      *.js set shiftwidth=2
    autocmd BufReadPre,FileReadPre      *.js set expandtab
  augroup END

  augroup php
    autocmd BufReadPre,FileReadPre      *.php set tabstop=4
    autocmd BufReadPre,FileReadPre      *.php set shiftwidth=4
    autocmd BufReadPre,FileReadPre      *.php set expandtab
  augroup END
endif

au FileType xhtml,html,htm,php,xml,ejs setlocal tabstop=2
au FileType xhtml,html,htm,php,xml,ejs setlocal shiftwidth=2
au FileType xhtml,html,htm,php,xml,ejs setlocal expandtab
au BufNewFile,BufRead *.ejs set filetype=html

" Map Ctrl+C and Ctrl+V to X11 clipboard
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection primary"))<CR>p

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.
set showcmd

" Folding Stuffs
set foldmethod=marker

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>
" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Space will toggle folds!
noremap <space> za

" Highlight current line
set cul


augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.


set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

set laststatus=2


" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let g:solarized_termcolors=256
colorscheme solarized
call pathogen#infect()
