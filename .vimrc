" " ==> Reminders
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " * Standard Vim protocol for quickfixing is to show you the output of the command then jump to the first result automatically. You can cycle through the results with :cn[ext] and :cp[rev].

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                      Initialization (Vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible                                                            " be iMproved, required
  filetype off                                                                " required
  call plug#begin('~/.vim/plugged')

  " Relaod VimRc when modified
    function! PlugAll()
      :PlugClean
      :PlugInstall
      :PlugUpdate
    endfunction
    autocmd! BufUnload .vimrc :source ~/.vimrc | exec PlugAll()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                             General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Vim Settings
    let mapleader=','                                                          " Change the mapleader
    set timeoutlen=500                                                         " Time to wait for a command
    set noautochdir                                                            " Don't change Dir on file open
    set autoread                                                               " Set autoread when a file is changed outside
    set autowrite                                                              " Write on make/shell commands
    au FileChangedShell * echo Warning: File changed on disk
    set hidden                                                                 " Turn on hidden
    set modeline                                                               " Turn on modeline
    set encoding=utf-8                                                         " Set utf-8 encoding
    set completeopt+=longest                                                   " Optimize auto complete
    set completeopt-=preview                                                   " Optimize auto complete
    set noerrorbells                                                           " No sound on errors
    set novisualbell                                                           " No sound on errors
    set t_vb=                                                                  " No sound on errors
    set cursorcolumn                                                           " Display vertical and horizontal current line
    set cursorline                                                             " Display vertical and horizontal current line
    noremap <C-l> :syntax sync fromstart<cr>:redraw!<cr>                       " Since vim looses highlight colors sometimes
    set spl=en_us,es spell
      map <leader>ts :set spell!<cr>

  " Backups
    set noswapfile                                                             " Don't use a .~ swap file
    set undofile                                                               " Use a directory to save undos
    set undodir=~/.vim/undodir
    set backupdir=~/.vim/backup
    if !isdirectory(expand(&undodir))                                          " Create undo directory if it doesn't exist
      call mkdir(expand(&undodir), 'p')
    endif
    if !isdirectory(expand(&backupdir))                                        " Create backup directory if it doesn't exist
      call mkdir(expand(&backupdir), 'p')
    endif
    set history=1000                                                           " Increase the lines of history
    set undolevels=10000                                                       " maximum number of changes that can be undone
    set undoreload=10000                                                       " maximum number lines to save for undo on a buffer reload
    set mousehide                                                              " hide while typing
    set mouse=a                                                                " Mouse can click over buffers, but just that.
    set exrc                                                                   " Execute .vimrc file under current folders ;)
    set secure                                                                 " Just run .vimrc file that the owner is `whoami`
    set cm=blowfish2                                                           " Set the encription method to the best (vim >= 7.4)

  " Extra Mappings
    map <leader>tw :set wrap!<cr>
    map <leader>x :!!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"           Smart Mappings (aka vim tune, with no plugins)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Make j and k work the way you expect
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

  " Repeat last substitution, including flags, with &.
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>


  " Strip all trailing whitespace in the current file
    autocmd BufWritePre * %s/\s\+$//e


  " Modify all the indents
    nnoremap <leader>= gg=G

  " Keep the cursor in place while joining lines
    nnoremap J mzJ`z

  " Select entire buffer
    nnoremap vaa ggvGg_

  " Misc
    " save file when accidentally trying to save in insert mode
    imap :w <Esc>:w
    " Double ;; inserts a single ; at the end
    imap ;; <C-o>A;<Esc>
    " Don't search for words on selection mode
    vmap K k
    " símil to quick exec on find
    nnoremap f: /<C-f>
    " Copying pasting
      " Mac Osx Support
      " imap <C-v> <Esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
      " Linux support
      imap <C-v> <C-o>"+P
    vmap <C-p> "+p<cr>
    vmap <C-C> "+y
    vmap  "+y
    " a bit faster to get the q: and my own f:
    nmap q; q:
    nmap f; f:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                          Completions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    "Line Completion
    imap <C-l> <c-x><C-l>
    "Omni Completion
    "imap <C-k> <c-x><c-o>
    "Spelling Completion
    imap <C-h> <c-x>s
    "File Completion
    imap <C-f> <c-x><c-f>

  " Plugins
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
      let g:ycm_collect_identifiers_from_comments_and_strings = 1
      let g:ycm_collect_identifiers_from_tags_files = 1
    Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'
      let g:UltiSnipsExpandTrigger="<C-K>"
      let g:UltiSnipsJumpForwardTrigger="<C-F>"
      let g:UltiSnipsJumpBackwardTrigger="<C-B>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                         Fold Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set foldlevelstart=0                                                       " Start with all folds closed
    set foldmethod=indent

  " Mappings
    map <leader>fe :set foldenable!<cr>

  " Plugins
    " Mantain fold when editing @origanl from vimTip
    set foldopen=hor,mark,percent,quickfix,search,tag,undo
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                            Fancy
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set t_Co=256                                                               " Set current terminal to 256 colors
    set title                                                                  " Set title
    set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)               " Don't show full paths, abbreviate them
    set showtabline=2                                                          " Always show tab line
    set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]                           " Don't know this line, sorry.
    set wildmenu                                                               " Show list instead of just completing
    set wildmode=list:longest,full                                             " Use powerful wildmenu
    set shortmess=at                                                           " Avoids hit enter
    set showcmd                                                                " Show cmd
    set whichwrap+=h,l,<,>,[,]                                                 " Backspace and cursor keys wrap to
    set sidescroll=1                                                           " Minimal number of columns to scroll horizontally
    set showmatch                                                              " Show matching brackets/parenthesis
    set matchtime=2                                                            " Decrease the time to blink
    set relativenumber                                                         " Show line numbers relative
    set number!                                                                " Show the current line number ;)
    set formatoptions+=rnlmM                                                   " Optimize format options
    set nowrap                                                                 " Since horizontal scrolling is such a pain in the A on vi
    set textwidth=120                                                          " Change text width
    set list                                                                   " Show these tabs and spaces and so on
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮                           " Change listchars Preaty special characters
    set linebreak                                                              " Wrap long lines at a blank
    set showbreak=↪                                                            " Change wrap line break
    set fillchars=diff:⣿,vert:│                                                " Change fillchars
    set cc=120                                                                 " visible column at 120 so we can knwo our limit

  " Plugins
    Plug 'vim-scripts/colorsupport.vim'
    Plug 'w0ng/vim-hybrid'                                                     " Colorscheme hybrid
    Plug 'altercation/vim-colors-solarized'
      function! SetTheme()
        set background=dark
        colorscheme solarized
        colorscheme hybrid
      endfunction

      function! FixTheme()
        hi clear SpellBad
        hi clear SpellCap
        hi SpellBad cterm=underline
        hi SpellCap cterm=underline
        hi NonText ctermbg=none
        hi Normal ctermbg=none
        hi Folded ctermbg=none
        hi CursorLine ctermbg=none
        hi CursorLine cterm=bold
        hi CursorColumn ctermbg=none
        hi CursorColumn cterm=bold
      endfunction

    if !exists("g:hybrid_use_Xresources")
      let g:hybrid_use_Xresources = 0
    endif

    " Highlight clear
    if exists("syntax_on")
      syntax reset
    endif

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
      let g:hybrid_use_Xresources = 1
      let g:airline_theme = 'ubaryd'
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_buffers = 1
      let g:airline#extensions#tabline#buf_min_count = 1
      let g:airline#extensions#branch#enabled = 1
      let g:airline#extensions#tagbar#enabled = 1

    Plug 'junegunn/limelight.vim'
      map <leader>l :Limelight!!<cr>
      let g:limelight_conceal_ctermfg = '243'                                  " Comments color
      let g:limelight_paragraph_span = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                             IDE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
    Plug 'ctrlpvim/ctrlp.vim'                                                  " Fuzzy file opener
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      let g:ctrlp_working_path_mode = 'ra'
    Plug 'scrooloose/nerdcommenter'                                            " NERD commenter
      let NERDSpaceDelims=1
      let NERDRemoveExtraSpaces=1
      map <leader>/ <plug>NERDCommenterToggle
    Plug 'scrooloose/nerdtree'                                                 " NERD tree
      map <leader>N :NERDTreeToggle<cr>
      map <leader>n :NERDTreeFind<cr>
      let NERDTreeDirArrows=1
      let NERDTreeQuitOnOpen = 1
    Plug 'tpope/vim-fugitive'                                                  " Git wrapper
      nmap <leader>g :Gstatus<cr>
      function! s:vimplug_load_fugitive()
        if exists('b:git_dir')
          call plug#load('vim-fugitive')
          autocmd! vimplug_load_fugitive
          call fugitive#detect(expand('%:p'))
        endif
      endfunction
      augroup vimplug_load_fugitive
        au!
        au BufWinEnter * call s:vimplug_load_fugitive()
      augroup END
    Plug 'airblade/vim-gitgutter'                                              " Git diff sign
      nmap <leader>tg :GitGutterToggle<cr>
      nmap [h <Plug>GitGutterPrevHunk
      nmap ]h <Plug>GitGutterNextHunk
    Plug 'tpope/vim-surround'                                                  " Surround
    Plug 'majutsushi/tagbar'                                                   " Tag bar
      nmap <c-t> :TagbarToggle<cr>
    Plug 'editorconfig/editorconfig-vim'
      let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    Plug 'mtth/scratch.vim'                                                    " A simple Scratch window for tooling
      nmap <leader>st :Scratch<cr>
    Plug 'simnalamburt/vim-mundo'                                              " See the undo history graphically
      nnoremap <leader>u :MundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                    Expected Enhancements
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set clipboard=unnamed                                                      " Able to copy an paste between xwindows                       "
    set laststatus=1                                                           " Enables the status line at the bottom of Vim Only when SPLIT

  " Mappings
    " When pasting don't replace the current register.
    xnoremap p pgvy

  " Plugins
    Plug 'tpope/vim-repeat'                                                    " Repeat
    Plug 'kristijanhusak/vim-multiple-cursors'                                 " Multiple cursors
    Plug 'Raimondi/delimitMate'                                                " Closing of quotes
    Plug 'tmhedberg/matchit'                                                   " Match it
    Plug 'sickill/vim-pasta'                                                   " Paste Aligned to context
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'zef/vim-cycle'                                                       " Add more synonyms to loop from, not only numbers ;)
    Plug 'othree/eregex.vim'                                                   " Use the Perl/Ruby(/JavaScript) Regex engine.
      let g:eregex_default_enable = 0                                          "   Disable eregex, on search use it with :%S// for searchNReplace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                           Motions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
    Plug 'Lokaltog/vim-easymotion'                                             " Easy motion
      let g:EasyMotion_smartcase = 1
      map  <Plug>(easymotion-sn)
    Plug 'bkad/CamelCaseMotion'                                                " Camel case motion
      map w <Plug>CamelCaseMotion_w
      map b <Plug>CamelCaseMotion_b
      map e <Plug>CamelCaseMotion_e
      sunmap w
      sunmap b
      sunmap e
      omap iw <Plug>CamelCaseMotion_iw
      xmap iw <Plug>CamelCaseMotion_iw
      omap ib <Plug>CamelCaseMotion_ib
      xmap ib <Plug>CamelCaseMotion_ib
      omap ie <Plug>CamelCaseMotion_ie
      xmap ie <Plug>CamelCaseMotion_ie

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                           Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
    Plug 'sheerun/vim-polyglot'                                                " Language Support a TON
      Plug 'polpo/vim-html-js-indent'                                          " This indent plugin restores the inline JavaScript/HTML indenting support which was removed from vim-javascript.
      Plug 'bendavis78/vim-polymer'
      Plug 'moll/vim-node'
      " Plug 'webdesus/polymer-ide.vim', { 'do': 'npm install' }                 " Since Polymer Project is so new, there's not yet a support for it
        " Polymer files are always HTML, but heavy in JS
        let g:NERDCustomDelimiters = {
            \ 'html': { 'left': '//' }
        \ }
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }                        " JavaScript Libraries support
      autocmd FileType javascript nmap K :TernDoc<cr>
      autocmd FileType html nmap K :TernDoc<cr>
      " autocmd FileType !(javascript|html) unmap K :TernDoc<cr>
      let g:tern_show_argument_hints = 'on_hold'
      let g:tern_show_signature_in_pum = 1
      " Set tern in HTML
      setlocal omnifunc=tern#Complete
      " call tern#Enable()
      runtime after/ftplugin/javascript_tern.vim
      set ft=html.javascript_tern
      set ft=html.javascript

    " Plug 'w0rp/ale'                                                            " A version of Syntactic that works a-sync
      " let g:ale_fix_on_save = 1
      " let g:ale_completion_enabled = 1
      " let g:ale_sign_column_always = 1
      " let g:ale_sign_error = '✗'
      " let g:ale_sign_warning = '∆'
      " let g:airline#extensions#ale#enabled = 1
      " " highlight clear ALEErrorSign
      " " highlight clear ALEWarningSign
      " let g:ale_fixers = {
      " \   'javascript': ['eslint'],
      " \   'html': ['eslint'],
      " \}

    Plug 'scrooloose/syntastic'                                                " Syntax Checker with Async (vim-syntastic/syntastic)
      map <leader>e :SyntasticToggleMode<cr>
      let g:syntastic_enable_async = 1
      let g:syntastic_async_tmux_if_possible = 1
      let g:syntastic_async_tmux_new_window = 1
      let g:airline#extensions#syntastic#enabled = 1
      set statusline+=%{SyntasticStatuslineFlag()}
      let g:syntastic_html_checkers=['eslint']
      let g:syntastic_javascript_checkers = ['eslint']
      let g:syntastic_javascript_eslint_exec = 'eslint_d'
      " let g:syntastic_html_checkers=['polylint', 'eslint']
      " let g:syntastic_javascript_checkers = ['polylint', 'eslint']
      let g:syntastic_mode="pasive"
      let g:syntastic_check_on_open=0
      let g:syntastic_aggregate_errors=1
      let g:syntastic_auto_jump=0
      let g:syntastic_auto_loc_list=1
      let g:syntastic_error_symbol = '✗'
      let g:syntastic_style_error_symbol = '✠'
      let g:syntastic_warning_symbol = '∆'
      let g:syntastic_style_warning_symbol = '≈'
      let g:ycm_show_diagnostics_ui = 0                         " Compabillity with YCM Disable Sytnastic on load

    Plug 'millermedeiros/vim-esformatter', { 'do': 'npm install esformatter' } " ECMAScript code beautifier/formatter. `npm install -g esformatter`
      nnoremap <silent> <leader>c :EsformatterVisual<CR>
    Plug 'Chiel92/vim-autoformat'                                              " Try to format with eslint
      let g:formatdef_eslint = '"eslint-formatter"'
      let g:formatters_javascript = ['eslint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                        Misc Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Social Plugins
    Plug 'vim-scripts/TwitVim'
  " Text Plugins
    Plug 'vim-scripts/loremipsum'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                   Tab, Splits & Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set splitbelow

  " Mappings
    nmap _ :2wincmd -<cr>
    nmap + :3wincmd +<cr>
    nmap = :3wincmd <<cr>
    nmap - :2wincmd ><cr>
    nmap <C-j> :wincmd w<cr>
    nmap <C-k> :wincmd W<cr>

  " quick tab move [ tab, and shift tab ]
    nmap <S-Tab> :call TabOrBuffer(0)<cr>
    nmap <Tab> :call TabOrBuffer(1)<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                   Internal Efficiency
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set ttyfast                                                               " Faster Terminal, redraws stuff quicker!
    set linespace=0                                                           " No extra spaces between text lines
    set lazyredraw                                                            " Don't update the display while executing macros
    set timeoutlen=300

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                   Indent and formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set autoindent                                                             " Preserve current indent on new lines
    set cindent                                                                " set C style indent
    set expandtab                                                              " Convert all tabs typed to spaces
    set tabstop=2                                                              " Indentation levels every four columns
    set softtabstop=2                                                          " Indentation levels every four columns
    set shiftwidth=2                                                           " Indent/outdent by four columns
    set shiftround                                                             " Indent/outdent to nearest tabstop

  " Plugins
    Plug 'godlygeek/tabular'                                                   " Sometimes, it's useful to line up text
      nmap <Leader>a :Tab<CR>
      vmap <Leader>a :Tab<CR>
      nmap <Leader>t :Tabularize /
      vmap <Leader>t :Tabularize /

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                        Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Settings
    set ignorecase
    set smartcase                                                              " Case sensitive when uc present
    set hlsearch                                                               " Highlight search terms
    set incsearch                                                              " Find as you type search

  " Mappings
    vmap A $
    vmap I ^
    vmap s :s/
    " double // to search selected text ;)
    vnorem // y/<c-r>"<cr>
    vnorem <C-H> y:<C-f>pI%S/<Esc>A//gic<Esc>hhhi
    " Use ,Space to toggle the highlight search
    nnoremap <Leader><Space> :set hlsearch!<CR>

  " Plugins
    Plug 'mileszs/ack.vim'                                                     " Search in the whole project (folder)
      nnoremap <Leader>f :Ack!<Space>
      vnoremap <Leader>f y:Ack! <C-r>=fnameescape(@")<CR><CR>
      if executable('ag')
        let g:ackprg = 'ag --vimgrep'
      endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                     Local Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! TabOrBuffer(next)
    let next=a:next
    if (tabpagenr('$') == 1)
      if ( next == 1 )
        exec "bn"
      else
        exec "bp"
      endif
    else
      if ( next == 1 )
        exec "tabn"
      else
        exec "tabp"
      endif
    endif
  endfunction

  function! DebugVar()
    if &ft == 'javascript' || &ft == 'jasmine.javascript' || &ft == 'javascript.jsx' || &ft == 'html'
      exe "normal oconsole.log();"
      exe "normal hi': ', "
      exe "normal pg;"
      exe "normal bblp^j"
    elseif &ft == 'php'
      exe "normal ovar_dump();"
      exe "normal hi': ', "
      exe "normal pg;"
      exe "normal bblp^j"
    elseif &ft == 'sql'
      exe "normal oselect ;"
      exe "normal hi': ', "
      exe "normal pg;"
      exe "normal bblp^j"
    else
      echo &ft
      echo "not implemente yet, please do"
    endif
  endfunction
  nmap <leader>v :call DebugVar()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""|"""""""""""""""""""""""""""""""""""""|
"                    Finizalization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    Plug 'zef/vim-cycle'
      autocmd VimEnter call AddCycleGroup(['set', 'get'])
      autocmd VimEnter call AddCycleGroup(['form', 'to'])
      autocmd VimEnter call AddCycleGroup(['push', 'pop'])
      autocmd VimEnter call AddCycleGroup(['mas', 'menos'])
      autocmd VimEnter call AddCycleGroup(['prev', 'next'])
      autocmd VimEnter call AddCycleGroup(['start', 'end'])
      autocmd VimEnter call AddCycleGroup(['light', 'dark'])
      autocmd VimEnter call AddCycleGroup(['open', 'close'])
      autocmd VimEnter call AddCycleGroup(['read', 'write'])
      autocmd VimEnter call AddCycleGroup(['truthy', 'falsy'])
      autocmd VimEnter call AddCycleGroup(['filter', 'reject'])
      autocmd VimEnter call AddCycleGroup(['internal', 'external'])
      autocmd VimEnter call AddCycleGroup(['short', 'normal', 'long'])
      autocmd VimEnter call AddCycleGroup(['subscribe', 'unsubscribe'])
      autocmd VimEnter call AddCycleGroup(['header', 'body', 'footer'])
      autocmd VimEnter call AddCycleGroup(['protected', 'private', 'public'])
      autocmd VimEnter call AddCycleGroup(['red', 'blue', 'green', 'yellow'])
      autocmd VimEnter call AddCycleGroup(['tiny', 'small', 'medium', 'big', 'huge'])
      autocmd VimEnter call AddCycleGroup(['pico', 'nano', 'micro', 'mili', 'kilo', 'mega', 'giga', 'tera', 'peta'])
      autocmd VimEnter call AddCycleGroup(['sunday', 'monday', 'tuesday', 'wensday', 'thursday', 'friday', 'saturday'])

  " Finish Plug system
    call plug#end()

  " Theme Should be at last I don't know why
    exec SetTheme()
    au BufRead,BufNewFile,BufReadPost * exec FixTheme()
