set nocompatible      " Don't force vi compatibility
behave xterm          " Alternative is "mswin"

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" Autoinstall of NeoBundle {{{

  let iCanHazNeoBundle=1
  let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
  if !filereadable(neobundle_readme)
      echo "Installing NeoBundle.."
      echo ""
      silent !mkdir -p $HOME/.vim/bundle
      silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
      let iCanHazNeoBundle=0
  endif

  " Call NeoBundle
  if has('vim_starting')
      set rtp+=$HOME/.vim/bundle/neobundle.vim/
  endif
  call neobundle#rc(expand($HOME.'/.vim/bundle/'))

  NeoBundle 'Shougo/neobundle.vim'

" }}}

" BUNDLES (Install of plugins using NeoBundle) {{{

" Vimproc async commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" Filesystem {{{
  
  NeoBundle 'kien/ctrlp.vim'

" }}} 

" DCVS {{{

  " Git commands in vim
  NeoBundle 'tpope/vim-fugitive'
  " Diff of changes against git repo
  NeoBundle 'airblade/vim-gitgutter'
  " Git view
  NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
              \ 'autoload':{'commands':'Gitv'}}

" }}}

" Markdown {{{

  " Markdown syntax
  NeoBundleLazy 'plasticboy/vim-markdown'
  " Preview of markdown in browser
  NeoBundleLazy 'joedicastro/vim-markdown-extra-preview'

" }}}

" Linux utils {{{

  " Diff between dirs
  NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
  
" }}}

" Python {{{

  " Python programming plugin
  NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
  " Admin virtualenvs
  NeoBundleLazy 'jmcantrell/vim-virtualenv', {'autoload': {'filetypes': ['python']}}
  " View indent lines
  NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}

" }}}

" Code snippets {{{

  " Snippets manager
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'honza/vim-snippets'

" }}}

" Syntax {{{

  NeoBundleLazy 'vim-scripts/JSON.vim', {'autoload': {'filetypes': ['json']}}
  NeoBundleLazy 'vim-scripts/crontab.vim', {'autoload': {'filetypes': ['crontab']}}
  " NeoBundle 'scrooloose/syntastic'

" }}}
"
  NeoBundle 'kchmck/vim-coffee-script'

" Open external links {{{

  NeoBundle 'vim-scripts/utl.vim'

" }}}

" Text edition {{{

  " Dates change
  NeoBundle 'tpope/vim-speeddating'
  " Surround object between chars
  NeoBundle 'tpope/vim-surround'
  " Repeat some ops using 'dot'
  NeoBundle 'tpope/vim-repeat'
  " Comment and decomment lines
  NeoBundle 'tpope/vim-commentary'
  " Navigate undo tree
  NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
  " text-objects
  " NeoBundle 'kana/vim-textobj-entire' " ae, ie
  " NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
  " NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
  " NeoBundle 'kana/vim-textobj-line' " al, il
  " NeoBundle 'kana/vim-textobj-underscore' " a_, i_
  " NeoBundle 'kana/vim-textobj-user'
  " Multicursor
  NeoBundle 'kris89/vim-multiple-cursors'

" }}}

" HTML/CSS {{{

  NeoBundleLazy 'othree/html5.vim', {'autoload':
              \ {'filetypes': ['html', 'xhttml', 'css']}}
" }}}

" FIN BUNDLES }}}

" Basic config {{{ ======================================================================

  scriptencoding utf-8
  set encoding=utf-8              " Encoding to UTF-8.
  set ls=2                        " Status bar always visible
  set go-=T                       " No tools.
  set go-=m                       " No menu.
  set go+=rRlLbh                  " Scroll bars enabled.
  set go-=rRlLbh                  " Desactiva todas las barras de desplazamiento.
  set cursorline                  " Cursor line highlighted.
  hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
  set fillchars+=vert:│           " Mejora aspecto de la división de ventanas.
  set ttyfast                     " Mejora el redibujado de la pantalla.
  set title                       " Filename as title in the term.
  set showcmd                     " Show incompleted commands.
  set hidden                      " Hidden closed buffers.
  set ruler                       " Show a permanent ruler.
  set lazyredraw                  " Redraw in lazy mode.
  set autoread                    " Update the changes out of vim.
  set ttimeoutlen=0               " No delay while change modes
  set backspace=indent,eol,start  " Backspace key behavior
  " set nu                          " Line numbers on
  set cf                          " Enable error files & error jumping.

" }}}

" Search config {{{

  set incsearch                   " Incremental search.
  set showmatch                   " Show parenthesis match.
  set hlsearch                    " Search results highlighted.
  set smartcase                   " Smart case sensitive.
  set ignorecase                  " No case sensitive while searching.

" }}}

" History and undo {{{

  set history=1000
  set undofile
  set undoreload=1000

  if $TMUX == ''
    set clipboard=unnamed
  endif

" }}}

" Wildmenu {{{

  set wildmenu                        " Commandline autocomple.
  set wildmode=list:longest,full      " Show a list with all the options.

  set wildignore+=.hg,.git,.svn                    " Version control
  set wildignore+=*.sw?                            " Vim swap files
  set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
  set wildignore+=*.luac                           " Lua byte code
  set wildignore+=*.jar                            " java archives
  set wildignore+=*.pyc                            " Python byte code
  set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, spaces and wrapping {{{ -----------------------------------------

  set expandtab                  " Spaces instead of tab.
  set tabstop=4                  " One tab -> 4 spaces.
  set shiftwidth=4               " Number of spaces for autoindent.
  set softtabstop=4              " Tab of 4 spaces.
  set autoindent                 " Autoindent on.
  set colorcolumn=+1
  set tags=./.tags,.tags;

" }}}

" Visual config {{{{

  set showmatch  " Show matching brackets.
  set mat=5  " Bracket blinking.
  " set list
  set novisualbell  " No blinking .
  set noerrorbells  " No noise.

" }}}}

" Color, Font, Highlight {{{

  syntax on                      " Habilita el resaltado de sintaxis.
  set background=dark            " Establece el fondo oscuro.
  set t_Co=256                   " Habilita 256 colores en modo consola.
  if has('gui_running')          " Habilita el tema molokai para gvim y vim.
      colorscheme molokai
  else
      colorscheme molokai256
  endif
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
  set guifont=Monaco\ for\ Powerline

" }}}

" gvim specific {{{
  
  set mousehide  " Hide mouse after chars typed
  set mouse=a  " Mouse in all modes
  set nohidden

" }}}

" Create dirs if they dont exists {{{

  function! MakeDirIfNoExists(path)
      if !isdirectory(expand(a:path))
          call mkdir(expand(a:path), "p")
      endif
  endfunction

" }}}

" Backup config {{{ 

  set backup
  set nohidden
  set backupdir=$HOME/.vim/tmp/backup/
  set undodir=$HOME/.vim/tmp/undo/
  set directory=$HOME/.vim/tmp/swap/
  set viminfo+=n$HOME/.vim/tmp/viminfo

  " Create dirs
  silent! call MakeDirIfNoExists(&undodir)
  silent! call MakeDirIfNoExists(&backupdir)
  silent! call MakeDirIfNoExists(&directory)

" }}}

let mapleader = ","

" Only let the vim mode {{{

  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>
  inoremap jj <ESC>
  inoremap kk <ESC>

" }}}

" Windows {{{

  " New windows creation (vertical and horizontal)
    nnoremap <Leader>v <C-w>v
    nnoremap <Leader>h <C-w>s

  " Change between windows
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

  " Change between buffers
    nnoremap <silent><Leader>z :bn<CR>
    nnoremap <silent><Leader>x :bp<CR>
    nnoremap <silent><Leader>q :bd<CR>

  " Window close
    nnoremap <Leader>Q <C-w>c

" }}} 

" Tabs {{{

  " Move between tabs
  nnoremap <silent> <C-Right> :tabnext<CR>
  nnoremap <silent> <C-Left> :tabprevious<CR>

  " Tab creation
  nnoremap <silent> <C-t> :tabnew<CR>

" }}}

" Copy and paste to clipboard {{{
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
" }}}

" Show no print chars {{{

  nmap <Leader>eh :set list!<CR>
  set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

  " Max line number is 100
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/

" }}}

" Quick save {{{

  nmap <silent> <Leader>w :update<CR>

" }}}

" Trim blank spaces for the current line {{{

  nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Change grep for silver searcher {{{
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
" }}}

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE> -i<SPACE>

" Toggle the QuickFix window {{{

  function! s:QuickfixToggle()
      for i in range(1, winnr('$'))
          let bnum = winbufnr(i)
          if getbufvar(bnum, '&buftype') == 'quickfix'
              cclose
              lclose
              return
          endif
      endfor
      copen
  endfunction
  command! ToggleQuickfix call <SID>QuickfixToggle()

  nnoremap <silent> <Leader>k :ToggleQuickfix<CR>

" }}}

" Shebang files with auto exec perms (#!) {{{

  augroup shebang_chmod
    autocmd!
    autocmd BufNewFile  * let b:brand_new_file = 1
    autocmd BufWritePost * unlet! b:brand_new_file
    autocmd BufWritePre *
          \ if exists('b:brand_new_file') |
          \   if getline(1) =~ '^#!' |
          \     let b:chmod_post = '+x' |
          \   endif |
          \ endif
    autocmd BufWritePost,FileWritePost *
          \ if exists('b:chmod_post') && executable('chmod') |
          \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
          \   unlet b:chmod_post |
          \ endif
  augroup END

" }}}

" Edit vimrc \ev
  nnoremap <silent> ,ev :tabnew<CR>:e ~/.vimrc<CR>

" PLUGINS

" CTRLP {{{
  
  nnoremap <Leader>f :CtrlPMixed<CR>
  nnoremap <leader>t :CtrlPTag<CR>

" }}}

" Commentary {{{ -------------------------------------------------------------

  nmap <Leader>c <Plug>CommentaryLine
  xmap <Leader>c <Plug>Commentary

  augroup plugin_commentary
      au!
      au FileType python setlocal commentstring=#%s
      au FileType php setlocal commentstring=#%s
      au FileType htmldjango setlocal commentstring={#\ %s\ #}
      au FileType puppet setlocal commentstring=#\ %s
      au FileType yaml setlocal commentstring=#%s
  augroup END

" }}}

" Powerline {{{ --------------------------------------------------------------

  let g:Powerline_symbols = 'fancy'
  let g:Powerline_cache_file = $HOME.'/.vim/tmp/Powerline.cache'

  set noshowmode

" }}}

" Ranger as file navigator {{{

  fun! RangerChooser()
      exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
      if filereadable('/tmp/chosenfile')
          exec 'edit ' . system('cat /tmp/chosenfile')
          call system('rm /tmp/chosenfile')
      endif
      redraw!
  endfun
  map <Leader>F :call RangerChooser()<CR>

" }}}

" Fugitive {{{

  nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
  nnoremap <Leader>gs :Gstatus<CR>
  nnoremap <Leader>gw :Gwrite<CR>
  nnoremap <Leader>go :Gread<CR>
  nnoremap <Leader>gR :Gremove<CR>
  nnoremap <Leader>gm :Gmove<Space>
  nnoremap <Leader>gc :Gcommit<CR>
  nnoremap <Leader>gd :Gdiff<CR>
  nnoremap <Leader>gb :Gblame<CR>
  nnoremap <Leader>gB :Gbrowse<CR>
  nnoremap <Leader>gp :Git! push<CR>
  nnoremap <Leader>gP :Git! pull<CR>
  nnoremap <Leader>gi :Git!<Space>
  nnoremap <Leader>ge :Gedit<CR>
  nnoremap <Leader>gE :Gedit<Space>
  nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
              \ quickfix"<CR>:redraw!<CR>
  nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
              \ quickfix"<CR>:redraw!<CR>
  nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
  nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
              \ quickfix -no-quit<CR>
  nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
              \Unite -no-quit quickfix'<CR>
  nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
              \Unite -no-quit quickfix'<CR>

  nnoremap <Leader>ggc :silent! Ggrep -i<Space>

  " para el diffmode
  noremap <Leader>du :diffupdate<CR>

  if !exists(":Gdiffoff")
      command Gdiffoff diffoff | q | Gedit
  endif
  noremap <Leader>dq :Gdiffoff<CR>

" }}}

" Gitv {{{

  nnoremap <silent> <leader>gv :Gitv --all<CR>
  nnoremap <silent> <leader>gV :Gitv! --all<CR>
  vnoremap <silent> <leader>gV :Gitv! --all<CR>

  let g:Gitv_OpenHorizontal = 'auto'
  let g:Gitv_WipeAllOnClose = 1
  let g:Gitv_DoNotMapCtrlKey = 1

  autocmd FileType git set nofoldenable

" }}}

" PYTHON {{{

  " PythonMode {{{

    let g:pymode_breakpoint_key = '<Leader>B'

    let g:pymode_lint_checker = 'pylint, pep8'
    let g:pymode_lint_ignore = 'E501, W404'
    let g:pymode_lint_config = $HOME.'/dotfiles/pylint/pylint.rc'

    let g:pymode_rope = 0
    let g:pymode_rope_goto_def_newwin = 'new'
    let g:pymode_rope_guess_project = 0
    let g:pymode_rope_vim_completion = 1
    let g:pymode_rope_always_show_complete_menu = 1

    let g:pymode_doc = 0
    let g:pymode_folding = 0

  " }}}

  " Virtualenv {{{

    let g:virtualenv_auto_activate = 1
    let g:virtualenv_stl_format = '(%n)'

  " }}}

" }}}

" MARKDOWN {{{

    let g:vim_markdown_folding_disabled=1

" }}}

" RVM {{{

  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
  
" }}}

" TIPOS DE ARCHIVO  {{{ ======================================================

  " Ruby {{{
      autocmd FileType ruby compiler rubyunit
      autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
      autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
      autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
      autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " }}}

  " Javascript {{{

      autocmd FileType javascript set efm=%-P%f,
              \%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
              \%-G%f\ is\ OK.,%-Q

  " }}}

  " DJANGO HTML (Templates) {{{

      au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

  " }}}

  " JSON {{{

    autocmd BufNewFile,BufRead *.json set ft=json

    augroup json_autocmd
      autocmd!
      autocmd FileType json set autoindent
      autocmd FileType json set formatoptions=tcq2l
      autocmd FileType json set textwidth=78 shiftwidth=2
      autocmd FileType json set softtabstop=4 tabstop=4
      autocmd FileType json set expandtab
      autocmd FileType json set foldmethod=syntax
    augroup END

  " }}}

  " LUA {{{

    au BufRead,BufNewFile rc.lua setlocal foldmethod=marker

  " }}}

  " MARKDOWN {{{

    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
    autocmd FileType markdown NeoBundleSource vim-markdown
    autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview

  " }}}

" }}}



