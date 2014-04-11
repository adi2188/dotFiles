set cindent
"set t_Co=256
"colorscheme torte
set shiftwidth=2
set tabstop=2
set expandtab
set ruler
set ls=2
set bg=dark
syntax on
set nowrap
set nocompatible
set ignorecase
set scrolloff=2
set backspace=2
set pastetoggle=<F12>
set hlsearch
set nobackup
set nowb
set noswapfile

filetype plugin on

let mapleader = ","
"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/vim_local/vimrc

"Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit `pwd`<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>q :q!<cr>
map <leader>w :w!<cr>
try
set switchbuf=usetab
set stal=2
catch
endtry

map e :e `pwd`
map <leader>n :tabn<cr>
map <leader>p :tabp<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 5gt
map <leader>7 5gt
map <leader>8 5gt
map <leader>9 5gt
map <F11> :MRU<cr>
set pastetoggle=<F2>
let MRU_Max_Entries = 20

noremap <Space> <PageDown>
if has('statusline')
    " Status line detail:
    " %f    file path
    " %y    file type between braces (if defined)
    " %([%R%M]%)  read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "     shows a '!' if the file format is not the platform
    "     default
    " %{'$'[!&list]}  shows a '*' if in list mode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "     only for debug : display the current syntax item name
    " %=    right-align following items
    " #%n   buffer number
    " %l/%L,%c%V  line number, total number of lines, and column number
    function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
        let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%=#%n %l/%L,%c%V [%{strlen(&ft)?&ft:'none'}/%{&encoding}/%{&fileformat}]"
      else
        let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V [%{strlen(&ft
      endif
    endfunc

    " Switch between the normal and vim-debug modes in the status line
    nmap _ds :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
  set titlestring=%t%(\ [%R%M]%)
    endif
endif

"tab auto completion
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30
fun! InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<tab>"
 else
 return "\<c-p>"
 endif
endfun

fun! ShiftInsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<s-tab>"
 else
 return "\<c-n>"
 endif
endfun

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-r>=ShiftInsertTabWrapper()<cr>
set dictionary+=dict.file
set dictionary+=%
set iskeyword+=:
set complete+=k

"end tab auto completion

" enables real tabs for Makefiles only
augroup Makefile
au!
au BufReadPre Makefile set noexpandtab
augroup END

" vim -b : edit binary using xxd-format!
augroup Binary
au!
au BufReadPre  *.bin let &bin=1
au BufReadPost *.bin if &bin | %!xxd
au BufReadPost *.bin set ft=xxd | endif
au BufWritePre *.bin if &bin | %!xxd -r
au BufWritePre *.bin endif
au BufWritePost *.bin if &bin | %!xxd
au BufWritePost *.bin set nomod | endif
augroup END

" remap split screen navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
