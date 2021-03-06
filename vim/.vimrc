set nocompatible      " Don't force vi compatibility
behave xterm          " Alternative is "mswin"

" NEOBUNDLE CONFIG START {{{

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
      set rtp+=/usr/local/opt/fzf
    endif
    call neobundle#begin(expand($HOME.'/.vim/bundle/'))

    NeoBundle 'Shougo/neobundle.vim'


    " Vimproc async commands (NeoBundle, Unite)
    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }

    NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

    " Filesystem {{{

      NeoBundle 'junegunn/fzf.vim'
      NeoBundle 'haya14busa/incsearch.vim'
      NeoBundle 'moll/vim-bbye'

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
      NeoBundleLazy 'plasticboy/vim-markdown',  {'autoload': {'filetypes': 'markdown'}}
      " Preview of markdown in browser
      NeoBundleLazy 'joedicastro/vim-markdown-extra-preview',  {'autoload': {'filetypes': 'markdown'}}

    " }}}

    " Python {{{

      " Python programming plugin
      NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': 'python'}}
      " Admin virtualenvs
      NeoBundleLazy 'jmcantrell/vim-virtualenv', {'autoload': {'filetypes': 'python'}}
      " View indent lines
      NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': 'python'}}

    " }}}

    " Go {{{
        NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': 'go'}}
    " }}}

    " Ruby {{{
        NeoBundleLazy 'tpope/vim-rails', {'autoload': {'filetypes': 'ruby'}}
    " }}}

    " Syntax {{{

      NeoBundleLazy 'vim-scripts/JSON.vim', {'autoload': {'filetypes': ['json']}}
      NeoBundle 'scrooloose/syntastic'
      NeoBundle 'sirver/UltiSnips'
      NeoBundle 'honza/vim-snippets'

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
      " Multicursor
      NeoBundle 'kris89/vim-multiple-cursors'
      " Yankring
      NeoBundle 'vim-scripts/yankring.vim'

    " }}}

    call neobundle#end()

    filetype plugin indent on

" FIN NEOBUNDLE CONFIG }}}

" Basic config {{{ ======================================================================

  scriptencoding utf-8
  set encoding=utf-8              " Encoding to UTF-8.
  set ls=2                        " Status bar always visible
  set go-=T                       " No tools.
  set go-=m                       " No menu.
  set go+=rRlLbh                  " Scroll bars enabled.
  set go-=rRlLbh                  " Desactiva todas las barras de desplazamiento.
  " set cursorline                  " Cursor line highlighted.
  " hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
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
  set nu                          " Line numbers on
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
  set tabstop=2                  " One tab -> 2 spaces.
  set shiftwidth=2               " Number of spaces for autoindent.
  set softtabstop=2              " Tab of 4 spaces.
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

" Trim unwanted spaces on save {{{
    function! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
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
    nnoremap <Leader>l :ls<CR>
    nnoremap <Leader>x :bp!<CR>
    nnoremap <Leader>z :bn!<CR>
    nnoremap <Leader>g :e#<CR>
    nnoremap <Leader>1 :1b<CR>
    nnoremap <Leader>2 :2b<CR>
    nnoremap <Leader>3 :3b<CR>
    nnoremap <Leader>4 :4b<CR>
    nnoremap <Leader>5 :5b<CR>
    nnoremap <Leader>6 :6b<CR>
    nnoremap <Leader>7 :7b<CR>
    nnoremap <Leader>8 :8b<CR>
    nnoremap <Leader>9 :9b<CR>
    nnoremap <Leader>0 :10b<CR>
    nnoremap <silent><Leader>z :bn<CR>
    nnoremap <silent><Leader>x :bp<CR>
    nnoremap <silent><Leader>q :Bdelete<CR>

  " Window close
    nnoremap <Leader>Q <C-w>c

" }}}

" Tabs {{{

  " Move between tabs
  nnoremap <silent> <C-Up> :tabnext<CR>
  nnoremap <silent> <C-Down> :tabprevious<CR>

  " Tab creation
  nnoremap <silent> <C-t> :tabnew<CR>

" }}}

" Copy and paste to unnamed not the default clipboard {{{
    let g:yankring_replace_n_pkey = ''
    let g:yankring_replace_n_nkey = ''
    nmap <leader>p :YRShow<CR>
" }}}

" Show no print chars {{{

  nmap <Leader>eh :set list!<CR>
  set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

  " Max line number is 100
  highlight OverLength ctermbg=grey ctermfg=white guibg=#592929
  match OverLength /\%121v.*/

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

" FZF {{{
  " Mapping selecting mappings
  nnoremap <leader>f :Files<CR>
  xmap <leader>f <plug>(fzf-maps-x)
  omap <leader>f <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

" }}}

" Commentary {{{ -------------------------------------------------------------

  nmap <Leader>c <Plug>CommentaryLine
  xmap <Leader>c <Plug>Commentary

  augroup plugin_commentary
      au!
      au FileType python setlocal commentstring=#%s
      au FileType php setlocal commentstring=//%s
      au FileType sh setlocal commentstring=#%s
      au FileType ruby setlocal commentstring=#%s
      au FileType htmldjango setlocal commentstring={#\ %s\ #}
      au FileType puppet setlocal commentstring=#\ %s
      au FileType yaml setlocal commentstring=#%s
      au FileType coffee setlocal commentstring=#%s
  augroup END

" }}}

" Incsearch {{{
    set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
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

" Gitv {{{

  nnoremap <silent> <leader>gv :Gitv --all<CR>
  nnoremap <silent> <leader>gV :Gitv! --all<CR>
  vnoremap <silent> <leader>gV :Gitv! --all<CR>

  let g:Gitv_OpenHorizontal = 'auto'
  let g:Gitv_WipeAllOnClose = 1
  let g:Gitv_DoNotMapCtrlKey = 1

  autocmd FileType git set nofoldenable

" }}}

" GitGutter

  nmap ,nh <Plug>GitGutterNextHunk
  nmap ,ph <Plug>GitGutterPrevHunk

" }}}

" PYTHON {{{

  " PythonMode {{{

    let g:pymode_breakpoint_key = '<Leader>B'

    let g:pymode_lint_ignore = "E124,E128,W"
    let g:pymode_options_max_line_length = 120
    let g:pymode_lint_checker = 'pylint, pep8'
    let g:pymode_lint_config = $HOME.'/dotfiles/pylint/pylint.rc'

    let g:pymode_rope = 0
    let g:pymode_rope_goto_def_newwin = 'new'
    let g:pymode_rope_guess_project = 0
    let g:pymode_rope_vim_completion = 1
    let g:pymode_rope_always_show_complete_menu = 1

    let g:pymode_doc = 0
    let g:pymode_folding = 0

    let g:pymode_trim_whitespaces = 1

    let g:pymode_indent = 1
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

" Syntastic {{{
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_python_pylint_post_args="--max-line-length=120"
" }}}

" TIPOS DE ARCHIVO  {{{ ======================================================

    " Trim unwant spaces
    autocmd FileType sh,php,javascript,json,python,go :call <SID>StripTrailingWhitespaces()

    " Go {{{
        let g:go_fmt_fai_silently = 0
        let g:go_fmt_command = "goimports"
        let g:go_doc_keywordprg_enabled = 0
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        au FileType go nmap <Leader>r <Plug>(go-run)
        au FileType go nmap <Leader>gb <Plug>(go-build)
        au FileType go nmap <Leader>gi <Plug>(go-install)
        au FileType go nmap <Leader>gt <Plug>(go-test)
        au FileType go nmap <Leader>gc <Plug>(go-coverage)
        autocmd FileType go set nofoldenable

    " }}}

  " Ruby {{{
      autocmd FileType ruby compiler rubyunit
      autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
      autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
      autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
      autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
      autocmd FileType ruby,eruby set nofoldenable

  " }}}

  " Javascript {{{

      autocmd FileType javascript set efm=%-P%f,
              \%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
              \%-G%f\ is\ OK.,%-Q

  " }}}

  " DJANGO HTML (Templates) {{{

      au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
      au BufNewFile,BufRead *.jst set filetype=html

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



