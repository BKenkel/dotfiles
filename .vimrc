source $VIMRUNTIME/defaults.vim

" vim-plug ---------------------------------------------------------- {{{
" https://github.com/junegunn/vim-plug/

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

call plug#end()

" }}}

" Searching --------------------------------------------------------- {{{

" Case insensitive searching
set ignorecase
set smartcase

" Highlight all search results
set hlsearch

" Incrementally highlight searches
set incsearch

" }}}

" Folding ----------------------------------------------------------- {{{

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup end

" Default to open folds
set foldlevel=99

" }}}

" Styling ----------------------------------------------------------- {{{

highlight LineNr ctermfg=grey

" --- Git Gutter ---------------------------------------------------- {{{

" SignColumn is same color as line number column
highlight! link SignColumn LineNr

" Sign (on a row) does not have a special background color
let g:gitgutter_set_sign_backgrounds = 1

highlight GitGutterAdd	  ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red

" --- }}}

" --- Airline ------------------------------------------------------- {{{
" Enable powerline symbols
let g:airline_powerline_fonts = 1


" Far right section - line:col percentage%
let g:airline_section_z = "%l:%c %3p%%"

" --- }}}

" }}}

" Everything else --------------------------------------------------- {{{

" Enable mouse for normal and visual mode
set mouse=nv

" Turn on syntax highlighting
syntax on

" Turn on line numbers
set number

" Apply indentation from current line to new line
set autoindent

" Highlight matching brace
set showmatch

" Number of commands to save in history
set history=1000

" Fix W and Q
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

" Vim update time
set updatetime=100

" --- NERDTree ------------------------------------------------------ {{{
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" --- }}}

" --- Key Mappings ------------------------------------------------- {{{

map <F5> :NERDTreeToggle<CR>

" --- }}}

" }}}

