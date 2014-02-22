set nocompatible      " Don't force vi compatibility
behave xterm          " Alternative is "mswin"
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set guifont=Monaco\ for\ Powerline

" Formatting (some of these are for coding in C and C++)
set ts=4  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set smartindent
set smarttab
set expandtab
set t_Co=256

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
set novisualbell  " No blinking .
set noerrorbells  " No noise.

" gvim specific
set mousehide  " Hide mouse after chars typed

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups/ " Where backups will go.
set directory=~/.vim/tmp/     " Where temporary files will go.
set mouse=a  " Mouse in all modes
set nohidden
set laststatus=2
" RVM
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

let mapleader = ","

" Vundle Config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Init Vundle
Bundle 'gmarik/vundle'
" My Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/surround.vim'
Bundle 'wicent/Command-T'
Bundle 'hallettj/jslint.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/guicolorscheme.vim'
Bundle 'tpope/vim-rails'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'

syntax on 
filetype plugin indent on
" Solarized
colorscheme desert

" For Ruby
if has("autocmd") 
  autocmd FileType ruby compiler rubyunit
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType javascript set efm=%-P%f,
        \%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
        \%-G%f\ is\ OK.,%-Q
endif

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap jj <ESC>

nmap <leader>rci :%!ruby-code-indenter<cr> 
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Edit vimrc \ev
nnoremap <silent> ,ev :tabnew<CR>:e ~/.vimrc<CR>

" NERDTree
let g:NERDTreeWinPos = "left" 
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
nnoremap <silent> <F2> :NERDTreeToggle <CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Cambiamos de buffer
nnoremap <silent> <C-L> :bn<CR>
nnoremap <silent> <C-H> :bp<CR>
nnoremap <silent> ,w :bd<CR>

" Command-T
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>
let g:CommandTMaxDepth=8
let g:CommandTMaxHeight=10

"Ruby
nmap <Leader>a :cf /tmp/autotest.txt<CR> :compiler rubyunit<CR>
imap <S-CR>    <CR><CR>end<Esc>-cc
" Testing
set completeopt=menu,preview

" JS
let $JS_CMD='node'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
