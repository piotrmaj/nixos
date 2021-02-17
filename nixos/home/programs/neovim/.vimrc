"""""""""""""""""""""""""""""FLAGS""""""""""""""""""""""""""
" set statusline+=%F\ %l:%c
set autochdir
set autoindent
set autowriteall
set colorcolumn=80
set cursorline
set dictionary+=/usr/share/dict/words
set expandtab
set ignorecase
set incsearch
set lazyredraw
set linebreak
set list
set mouse=a
set nobackup
set nojoinspaces
set noshowmode
set nospell
set nowrapscan
set number
set path+=**
set relativenumber
set regexpengine=1
set ruler
set scrolloff=4
set shada=:10,'10,%,n~/.local/share/nvim/shada/main.shada
set shiftwidth=2
set shortmess+=ac
set showcmd
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set splitright
set termguicolors
set title
set undofile
set wildmenu
set wildmode=longest,list,full

"""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""

""""""Misc
"Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
" Open NERDTree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree if opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeNodeDelimiter = "\u00a0"

"Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=0
let g:gruvbox_italicize_strings=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_sign_column='bg0'

"Plug 'command-t'
nmap <silent> <C-p> <Plug>(CommandT)


""""""
"call plug#end()
"""""""""""""""""""""""""""AESTHETICS""""""""""""""""""""""
" Colorscheme
colorscheme gruvbox
" hi Comment guifg=#999090
hi CocCodeLens guibg=#333333 guifg=#999090
hi Normal guibg=#000000
hi LineNr guibg=#202020
hi SignColumn guibg=#202020
hi ALEErrorSign guibg=#202020
hi ALEWarningSign guibg=#202020

" Disable neovim insert mode bar cursor
set guicursor=

" Highlight search
set hlsearch

" Scrolling past the line pops you below
set whichwrap+=<,>,h,l,[,]

" No line numbers in terminal (this breaks in vanilla vim)
autocmd TermOpen * setlocal nonumber norelativenumber

" File picker
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 20

"""""""File Extension defaults
augroup MDProj
    au!
    autocmd BufRead,BufNewFile *.md set tw=80
    autocmd BufRead,BufNewFile *.md set spell spelllang=en_gb
    autocmd BufRead,BufNewFile *.md setlocal syntax=off
augroup END

augroup TexProj
    au!
    autocmd BufRead,BufNewFile *.tex set tw=80
    autocmd BufRead,BufNewFile *.tex set spell spelllang=en_gb
augroup END

augroup CProj
    au!
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h set cindent shiftwidth=8
augroup END

augroup JSProj
    au!
    autocmd BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx set filetype=javascript
    autocmd BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx set softtabstop=2 shiftwidth=2
augroup END

augroup PyProj
    au!
    autocmd BufRead,BufNewFile *.py set softtabstop=4 shiftwidth=4
augroup END

""""""""""""""""""""""""""GENERAL MAPS"""""""""""""""""""""
" Scroll in wrapped lines
"map <Up> gk
"map <Down> gj
""""""""""""""""""""""""INSERT MODE MAPS"""""""""""""""""""

" paste
"inoremap <C-v> <ESC>"+pa
" dictionary completion
"inoremap <C-k> <C-x><C-x><C-k>

""""""""""""""""""""""""NORMAL MODE MAPS"""""""""""""""""""

" Sends things away without overwriting the register
nnoremap <leader>d "_d

" Open shell (this breaks in vanilla vim)
nnoremap <C-S> :sp<CR>:term<CR>A

" Remove search highlights
nnoremap <F3> :noh<CR>

nnoremap <Esc> :w<CR>

""""""""""""""""""""""SPLIT WINDOWS""""""""""""""""""""""""

" For moving split windows
nnoremap <C-W>h <C-W><S-H>
nnoremap <C-W>j <C-W><S-J>
nnoremap <C-W>k <C-W><S-K>
nnoremap <C-W>l <C-W><S-L>
" For moving focus between split windows
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

"""""""""""""""""""""VISUAL MODE MAPS""""""""""""""""""""""
" Sends things away without overwriting the register
vnoremap <leader>d "_d

" Move selected blocks up and down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

vnoremap <C-c> "+y
vnoremap <C-x> "+d

""""""""""""""""""""""""""""MISC""""""""""""""""""""""""""
