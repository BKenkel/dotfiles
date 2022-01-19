source $VIMRUNTIME/defaults.vim

" Enable mouse for visual mode
" set mouse=a
" set clipboard=unnamed

" Enable Line numbers
" set number

" Fix W and Q
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

" -------------------------
" Searching
" -------------------------

" Highlight matching brace
set showmatch

" Case insensitive searching
set ignorecase
set smartcase

" Highlight all search results
set hlsearch

" Apply indentation from current line to new line
set autoindent



" -------------------------
" vim-plug
" https://github.com/junegunn/vim-plug/
" -------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! ConditionalOn(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()

" List of Plugins

" Initialize plugin system
call plug#end()

