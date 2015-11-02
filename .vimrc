"-------------------------------------------------
" => Initialization (Vundle)
"-------------------------------------------------
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  " Relaod VimRc when modified
  autocmd! bufwritepost .vimrc :call ReloadVimRc()

"------------------------------------------------
" => General
"------------------------------------------------
  " ==> Vim Settings
    let mapleader=','                   " Change the mapleader
    let maplocalleader='\'              " Change the maplocalleader
    set timeoutlen=500                  " Time to wait for a command
    set noautochdir                     " Don't change Dir on file open
    set autoread                        " Set autoread when a file is changed outside
    set autowrite                       " Write on make/shell commands
    au FileChangedShell * echo          " Warning: File changed on disk
    set hidden                          " Turn on hidden
    set modeline                        " Turn on modeline
    set encoding=utf-8                  " Set utf-8 encoding
    set completeopt+=longest            " Optimize auto complete
    set completeopt-=preview            " Optimize auto complete
    set noerrorbells                    " No sound on errors
    set novisualbell                    " No sound on errors
    set t_vb=                           " No sound on errors
    set cursorcolumn                    " Display vertical and horizontal current line
    set cursorline                      " Display vertical and horizontal current line
    " Spelling
    set spl=en_us,es spell
    hi clear SpellBad                   " Highlight bad spelled words
    hi SpellBad cterm=underline
    " Backups
    set noswapfile                      " Don't use a .~ swap file
    set undofile                        " Use a directory to save undos
    set undodir=~/.vim/undodir
    set backupdir=~/.vim/backup
    " Create undo directory if it doesn't exist
    if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
    endif
    " Create backup directory if it doesn't exist
    if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
    endif
    set history=1000                    " Increase the lines of history
    set undolevels=10000                " maximum number of changes that can be undone
    set undoreload=10000                " maximum number lines to save for undo on a buffer reload
    set mousehide                       " hide while typing
    set mouse=a                         " Mouse can click over buffers, but just that.

  " ==> Vim Mappings
    map <leader>ts :set spell!<cr>
    map <leader>tw :set wrap!<cr>

"-------------------------------------------------
" => Smart Mappings (aka vim tune, with no plugins)
"-------------------------------------------------
  " Make j and k work the way you expect
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

  " Repeat last substitution, including flags, with &.
    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

  " Keep the cursor in place while joining lines
    nnoremap J mzJ`z

  " Select entire buffer
    nnoremap vaa ggvGg_

  " Strip all trailing whitespace in the current file
    " autocmd BufWritePre * :%s/\s\+$//<CR>:let @/=''<CR>
    autocmd BufWritePre * :%s/\s\+$//e

  " Modify all the indents
    nnoremap <leader>= gg=G

  " Misc
    " save file when accidently trying to save in insermode
    imap :w <Esc>:w
    " Double ;; inserts a single ; at the end
    imap ;; <C-o>A;<Esc>
    " Don't search for words on selection mode
    vmap K k
    " simil to quick exec on find
    nnoremap f: /<C-f>
    " Copying pasting
    imap <C-v> <C-o>"+p
    vmap <C-p> "+p<cr>
    vmap <C-C> "+y
    vmap  "+y
    " a bit faster to get the q: and my own f:
    nmap q; q:
    nmap f; f:

"------------------------------------------------
" => Completions
"------------------------------------------------
  " ==> Vim Settings
    "" Line Completion
    imap <C-l> <c-x><C-l>
    "" Omni Completion
    "imap <C-k> <c-x><c-o>
    "" Spelling Completion
    imap <C-h> <c-x>s
    "" File Completion
    imap <C-f> <c-x><c-f>

  " ==> Plugins
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'honza/vim-snippets'
    Plugin 'matthewsimo/angular-vim-snippets' " Angular Snippets
    Plugin 'justinj/vim-react-snippets' " React Snipps
      Plugin 'MarcWeber/vim-addon-mw-utils' " Dependacy of above
      Plugin 'tomtom/tlib_vim' " Dependacy of above
      Plugin 'garbas/vim-snipmate' " Dependacy of above
    Plugin 'sirver/ultisnips' " Snippet engine
      let g:UltiSnipsExpandTrigger="<C-K>"
      let g:UltiSnipsJumpForwardTrigger="<Tab>"
      let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------
  " ==> Vim Settings
    set foldlevelstart=0 " Start with all folds closed
    set foldmethod=indent

  " ==> Vim Mappings
    map <leader>fe :set foldenable!<cr>

  " ==> Plugins
    " Mantain fold when editing @origanl from vimTip
    set foldopen=hor,mark,percent,quickfix,search,tag,undo
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"-------------------------------------------------
" => Fancy
"-------------------------------------------------
  " ==> Vim Settings
    set t_Co=256                                                 " Set current terminal to 256 colors
    set title                                                    " Set title
    set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%) " Don't show full paths, abbreviate them
    set showtabline=2                                            " Always show tab line
    " Set up tab labels
    set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]             " Don't know this line, sorry.
    set wildmenu                                                 " Show list instead of just completing
    set wildmode=list:longest,full                               " Use powerful wildmenu
    set shortmess=at                                             " Avoids hit enter
    set showcmd                                                  " Show cmd
    set whichwrap+=h,l,<,>,[,]                                   " Backspace and cursor keys wrap to
    set sidescroll=1                                             " Minimal number of columns to scroll horizontally
    set showmatch                                                " Show matching brackets/parenthesis
    set matchtime=2                                              " Decrease the time to blink
    set relativenumber                                           " Show line numbers relative
    set number!                                                  " Show the current line number ;)
    set formatoptions+=rnlmM                                     " Optimize format options
    set wrap                                                     " Since horizontal scrolling is such a pain in the A on vi
    set textwidth=120                                            " Change text width
    set list                                                     " Show these tabs and spaces and so on
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮             " Change listchars Preaty special characters
    set linebreak                                                " Wrap long lines at a blank
    set showbreak=↪                                              " Change wrap line break
    set fillchars=diff:⣿,vert:│                                  " Change fillchars
    set cc=120                                                   " visible column at 120 so we can knwo our limit

  " ==> Plugins
    Plugin 'vim-scripts/colorsupport.vim'
    Plugin 'w0ng/vim-hybrid' " Colorscheme hybrid
    Plugin 'altercation/vim-colors-solarized'


    if !exists("g:hybrid_use_Xresources")
      let g:hybrid_use_Xresources = 0
    endif

    " Highlight clear

    if exists("syntax_on")
      syntax reset
    endif

    " let s:_style = s:background

    " let g:colors_name = "hybrid"


    " let s:_palette = {'gui' : {} , 'cterm' : {}}

    " let s:_palette.gui.background = { 'dark' : "#1d1f21", 'light' : "#e4e4e4" }
    " let s:_palette.gui.foreground = { 'dark' : "#c5c8c6", 'light' : "#000000" }
    " let s:_palette.gui.selection  = { 'dark' : "#373b41", 'light' : "#bcbcbc" }
    " let s:_palette.gui.line       = { 'dark' : "#282a2e", 'light' : "#d0d0d0" }
    " let s:_palette.gui.comment    = { 'dark' : "#707880", 'light' : "#5f5f5f" }
    " let s:_palette.gui.red        = { 'dark' : "#cc6666", 'light' : "#5f0000" }
    " let s:_palette.gui.orange     = { 'dark' : "#de935f", 'light' : "#875f00" }
    " let s:_palette.gui.yellow     = { 'dark' : "#f0c674", 'light' : "#5f5f00" }
    " let s:_palette.gui.green      = { 'dark' : "#b5bd68", 'light' : "#005f00" }
    " let s:_palette.gui.aqua       = { 'dark' : "#8abeb7", 'light' : "#005f5f" }
    " let s:_palette.gui.blue       = { 'dark' : "#81a2be", 'light' : "#00005f" }
    " let s:_palette.gui.purple     = { 'dark' : "#b294bb", 'light' : "#5f005f" }
    " let s:_palette.gui.window     = { 'dark' : "#303030", 'light' : "#9e9e9e" }
    " let s:_palette.gui.darkcolumn = { 'dark' : "#1c1c1c", 'light' : "#808080" }
    " let s:_palette.gui.addbg      = { 'dark' : "#5F875F", 'light' : "#d7ffd7" }
    " let s:_palette.gui.addfg      = { 'dark' : "#d7ffaf", 'light' : "#005f00" }
    " let s:_palette.gui.changebg   = { 'dark' : "#5F5F87", 'light' : "#d7d7ff" }
    " let s:_palette.gui.changefg   = { 'dark' : "#d7d7ff", 'light' : "#5f005f" }
    " let s:_palette.gui.delbg      = { 'dark' : "#cc6666", 'light' : "#ffd7d7" }
    " let s:_palette.gui.darkblue   = { 'dark' : "#00005f", 'light' : "#d7ffd7" }
    " let s:_palette.gui.darkpurple = { 'dark' : "#5f005f", 'light' : "#5f005f" }

    " let s:_palette.cterm.background = { 'dark' : "234", 'light' : "254" }
    " let s:_palette.cterm.window     = { 'dark' : "236", 'light' : "247" }
    " let s:_palette.cterm.darkcolumn = { 'dark' : "234", 'light' : "244" }
    " let s:_palette.cterm.addbg      = { 'dark' : "65" , 'light' : "194" }
    " let s:_palette.cterm.addfg      = { 'dark' : "193", 'light' : "22"  }
    " let s:_palette.cterm.changebg   = { 'dark' : "60" , 'light' : "189" }
    " let s:_palette.cterm.changefg   = { 'dark' : "189", 'light' : "53"  }
    " let s:_palette.cterm.darkblue   = { 'dark' : "17",  'light' : "194" }
    " let s:_palette.cterm.darkcyan   = { 'dark' : "24",  'light' : "22" }
    " let s:_palette.cterm.darkred    = { 'dark' : "52",  'light' : "189" }
    " let s:_palette.cterm.darkpurple = { 'dark' : "53",  'light' : "53" }

    " if g:hybrid_use_Xresources == 1
      " let s:_palette.cterm.foreground = { 'dark' : "15" }  " White
      " let s:_palette.cterm.selection  = { 'dark' : "8" }   " DarkGrey
      " let s:_palette.cterm.line       = { 'dark' : "0" }   " Black
      " let s:_palette.cterm.comment    = { 'dark' : "7" }   " LightGrey
      " let s:_palette.cterm.red        = { 'dark' : "9" }   " LightRed
      " let s:_palette.cterm.orange     = { 'dark' : "3" }   " DarkYellow
      " let s:_palette.cterm.yellow     = { 'dark' : "11" }  " LightYellow
      " let s:_palette.cterm.green      = { 'dark' : "10" }  " LightGreen
      " let s:_palette.cterm.aqua       = { 'dark' : "14" }  " LightCyan
      " let s:_palette.cterm.blue       = { 'dark' : "12" }  " LightBlue
      " let s:_palette.cterm.purple     = { 'dark' : "13" }  " LightMagenta
      " let s:_palette.cterm.delbg      = { 'dark' : "9" }   " LightRed
    " else
      " let s:_palette.cterm.foreground = { 'dark' : "250" }
      " let s:_palette.cterm.selection  = { 'dark' : "237" }
      " let s:_palette.cterm.line       = { 'dark' : "235" }
      " let s:_palette.cterm.comment    = { 'dark' : "243" }
      " let s:_palette.cterm.red        = { 'dark' : "167" }
      " let s:_palette.cterm.orange     = { 'dark' : "173" }
      " let s:_palette.cterm.yellow     = { 'dark' : "221" }
      " let s:_palette.cterm.green      = { 'dark' : "143" }
      " let s:_palette.cterm.aqua       = { 'dark' : "109" }
      " let s:_palette.cterm.blue       = { 'dark' : "110" }
      " let s:_palette.cterm.purple     = { 'dark' : "139" }
      " let s:_palette.cterm.delbg      = { 'dark' : "167" }
    " endif

    " let s:_palette.cterm.foreground.light = "16"
    " let s:_palette.cterm.selection.light  = "250"
    " let s:_palette.cterm.line.light       = "252"
    " let s:_palette.cterm.comment.light    = "59"
    " let s:_palette.cterm.red.light        = "52"
    " let s:_palette.cterm.orange.light     = "94"
    " let s:_palette.cterm.yellow.light     = "58"
    " let s:_palette.cterm.green.light      = "22"
    " let s:_palette.cterm.aqua.light       = "23"
    " let s:_palette.cterm.blue.light       = "17"
    " let s:_palette.cterm.purple.light     = "53"
    " let s:_palette.cterm.delbg.light      = "224"

    " let s:_none   = "NONE"
    " let s:_t_none = "NONE"
    " let s:_n      = "NONE"
    " let s:_c      = ",undercurl"
    " let s:_r      = ",reverse"
    " let s:_s      = ",standout"
    " let s:_b      = ",bold"
    " let s:_u      = ",underline"
    " let s:_i      = ",italic"

    " function! s:_build_prim(hi_elem, field)
      " let l:vname = "s:_" . a:hi_elem . "_" . a:field " s:_bg_comment
      " let l:gui_assign = "gui".a:hi_elem."=".s:_palette.gui[a:field][s:_style] " guibg=...
      " let l:cterm_assign = "cterm".a:hi_elem."=".s:_palette.cterm[a:field][s:_style] " ctermbg=...
      " exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
    " endfunction

    " let s:_bg_none = ' guibg=NONE ctermbg=NONE'
    " call s:_build_prim('bg', 'foreground')
    " call s:_build_prim('bg', 'background')
    " call s:_build_prim('bg', 'selection')
    " call s:_build_prim('bg', 'line')
    " call s:_build_prim('bg', 'comment')
    " call s:_build_prim('bg', 'red')
    " call s:_build_prim('bg', 'orange')
    " call s:_build_prim('bg', 'yellow')
    " call s:_build_prim('bg', 'green')
    " call s:_build_prim('bg', 'aqua')
    " call s:_build_prim('bg', 'blue')
    " call s:_build_prim('bg', 'purple')
    " call s:_build_prim('bg', 'window')
    " call s:_build_prim('bg', 'darkcolumn')
    " call s:_build_prim('bg', 'addbg')
    " call s:_build_prim('bg', 'addfg')
    " call s:_build_prim('bg', 'changebg')
    " call s:_build_prim('bg', 'changefg')
    " call s:_build_prim('bg', 'delbg')
    " call s:_build_prim('bg', 'darkblue')
    " call s:_build_prim('bg', 'darkcyan')
    " call s:_build_prim('bg', 'darkred')
    " call s:_build_prim('bg', 'darkpurple')

    " let s:_fg_none = ' guifg=NONE ctermfg=NONE'
    " call s:_build_prim('fg', 'foreground')
    " call s:_build_prim('fg', 'background')
    " call s:_build_prim('fg', 'selection')
    " call s:_build_prim('fg', 'line')
    " call s:_build_prim('fg', 'comment')
    " call s:_build_prim('fg', 'red')
    " call s:_build_prim('fg', 'orange')
    " call s:_build_prim('fg', 'yellow')
    " call s:_build_prim('fg', 'green')
    " call s:_build_prim('fg', 'aqua')
    " call s:_build_prim('fg', 'blue')
    " call s:_build_prim('fg', 'purple')
    " call s:_build_prim('fg', 'window')
    " call s:_build_prim('fg', 'darkcolumn')
    " call s:_build_prim('fg', 'addbg')
    " call s:_build_prim('fg', 'addfg')
    " call s:_build_prim('fg', 'changebg')
    " call s:_build_prim('fg', 'changefg')
    " call s:_build_prim('fg', 'darkblue')
    " call s:_build_prim('fg', 'darkcyan')
    " call s:_build_prim('fg', 'darkred')
    " call s:_build_prim('fg', 'darkpurple')

    " exe "let s:_fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
    " exe "let s:_fmt_bold = ' gui=NONE".s:_b.      " cterm=NONE".s:_b.      " term=NONE".s:_b    ."'"
    " exe "let s:_fmt_bldi = ' gui=NONE".s:_b.      " cterm=NONE".s:_b.      " term=NONE".s:_b    ."'"
    " exe "let s:_fmt_undr = ' gui=NONE".s:_u.      " cterm=NONE".s:_u.      " term=NONE".s:_u    ."'"
    " exe "let s:_fmt_undb = ' gui=NONE".s:_u.s:_b.  " cterm=NONE".s:_u.s:_b.  " term=NONE".s:_u.s:_b."'"
    " exe "let s:_fmt_undi = ' gui=NONE".s:_u.      " cterm=NONE".s:_u.      " term=NONE".s:_u    ."'"
    " exe "let s:_fmt_curl = ' gui=NONE".s:_c.      " cterm=NONE".s:_c.      " term=NONE".s:_c    ."'"
    " exe "let s:_fmt_ital = ' gui=NONE".s:_i.      " cterm=NONE".s:_i.      " term=NONE".s:_i    ."'"
    " exe "let s:_fmt_stnd = ' gui=NONE".s:_s.      " cterm=NONE".s:_s.      " term=NONE".s:_s    ."'"
    " exe "let s:_fmt_revr = ' gui=NONE".s:_r.      " cterm=NONE".s:_r.      " term=NONE".s:_r    ."'"
    " exe "let s:_fmt_revb = ' gui=NONE".s:_r.s:_b.  " cterm=NONE".s:_r.s:_b.  " term=NONE".s:_r.s:_b."'"

    " exe "let s:_sp_none       = ' guisp=".s:_none      ."'"
    " exe "let s:_sp_foreground = ' guisp=". s:_palette.gui.foreground[s:_style] ."'"
    " exe "let s:_sp_background = ' guisp=". s:_palette.gui.background[s:_style] ."'"
    " exe "let s:_sp_selection  = ' guisp=". s:_palette.gui.selection[s:_style]  ."'"
    " exe "let s:_sp_line       = ' guisp=". s:_palette.gui.line[s:_style]       ."'"
    " exe "let s:_sp_comment    = ' guisp=". s:_palette.gui.comment[s:_style]    ."'"
    " exe "let s:_sp_red        = ' guisp=". s:_palette.gui.red[s:_style]        ."'"
    " exe "let s:_sp_orange     = ' guisp=". s:_palette.gui.orange[s:_style]     ."'"
    " exe "let s:_sp_yellow     = ' guisp=". s:_palette.gui.yellow[s:_style]     ."'"
    " exe "let s:_sp_green      = ' guisp=". s:_palette.gui.green[s:_style]      ."'"
    " exe "let s:_sp_aqua       = ' guisp=". s:_palette.gui.aqua[s:_style]       ."'"
    " exe "let s:_sp_blue       = ' guisp=". s:_palette.gui.blue[s:_style]       ."'"
    " exe "let s:_sp_purple     = ' guisp=". s:_palette.gui.purple[s:_style]     ."'"
    " exe "let s:_sp_window     = ' guisp=". s:_palette.gui.window[s:_style]     ."'"
    " exe "let s:_sp_addbg      = ' guisp=". s:_palette.gui.addbg[s:_style]      ."'"
    " exe "let s:_sp_addfg      = ' guisp=". s:_palette.gui.addfg[s:_style]      ."'"
    " exe "let s:_sp_changebg   = ' guisp=". s:_palette.gui.changebg[s:_style]   ."'"
    " exe "let s:_sp_changefg   = ' guisp=". s:_palette.gui.changefg[s:_style]   ."'"
    " exe "let s:_sp_darkblue   = ' guisp=". s:_palette.gui.darkblue[s:_style]   ."'"
    " exe "let s:_sp_darkcyan   = ' guisp=". s:_palette.gui.darkcyan[s:_style]   ."'"
    " exe "let s:_sp_darkred    = ' guisp=". s:_palette.gui.darkred[s:_style]    ."'"
    " exe "let s:_sp_darkpurple = ' guisp=". s:_palette.gui.darkpurple[s:_style] ."'"

    " exe "Highlight! ColorColumn"   .s:_fg_none        .s:_bg_line        .s:_fmt_none
    " exe "Highlight! CursorColumn"  .s:_fg_none        .s:_bg_line        .s:_fmt_none
    " exe "Highlight! CursorLine"    .s:_fg_none        .s:_bg_line        .s:_fmt_none
    " exe "Highlight! Directory"     .s:_fg_blue        .s:_bg_none        .s:_fmt_none
    " exe "Highlight! DiffAdd"       .s:_fg_addfg       .s:_bg_addbg       .s:_fmt_none
    " exe "Highlight! DiffChange"    .s:_fg_changefg    .s:_bg_changebg    .s:_fmt_none
    " exe "Highlight! DiffDelete"    .s:_fg_background  .s:_bg_delbg       .s:_fmt_none
    " exe "Highlight! DiffText"      .s:_fg_background  .s:_bg_blue        .s:_fmt_none
    " exe "Highlight! ErrorMsg"      .s:_fg_background  .s:_bg_red         .s:_fmt_stnd
    " exe "Highlight! VertSplit"     .s:_fg_window      .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Folded"        .s:_fg_comment     .s:_bg_darkcolumn  .s:_fmt_none
    " exe "Highlight! FoldColumn"    .s:_fg_none        .s:_bg_darkcolumn  .s:_fmt_none
    " exe "Highlight! SignColumn"    .s:_fg_none        .s:_bg_darkcolumn  .s:_fmt_none
    " exe "Highlight! LineNr"        .s:_fg_selection   .s:_bg_none        .s:_fmt_none
    " exe "Highlight! CursorLineNr"  .s:_fg_yellow      .s:_bg_none        .s:_fmt_none
    " exe "Highlight! MatchParen"    .s:_fg_background  .s:_bg_changebg    .s:_fmt_none
    " exe "Highlight! ModeMsg"       .s:_fg_green       .s:_bg_none        .s:_fmt_none
    " exe "Highlight! MoreMsg"       .s:_fg_green       .s:_bg_none        .s:_fmt_none
    " exe "Highlight! NonText"       .s:_fg_selection   .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Pmenu"         .s:_fg_foreground  .s:_bg_selection   .s:_fmt_none
    " exe "Highlight! PmenuSel"      .s:_fg_foreground  .s:_bg_selection   .s:_fmt_revr
    " exe "Highlight! Question"      .s:_fg_green       .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Search"        .s:_fg_background  .s:_bg_yellow      .s:_fmt_none
    " exe "Highlight! SpecialKey"    .s:_fg_selection   .s:_bg_none        .s:_fmt_none
    " exe "Highlight! SpellCap"      .s:_fg_blue        .s:_bg_darkblue    .s:_fmt_undr
    " exe "Highlight! SpellLocal"    .s:_fg_aqua        .s:_bg_darkcyan    .s:_fmt_undr
    " exe "Highlight! SpellBad"      .s:_fg_red         .s:_bg_darkred     .s:_fmt_undr
    " exe "Highlight! SpellRare"     .s:_fg_purple      .s:_bg_darkpurple  .s:_fmt_undr
    " exe "Highlight! StatusLine"    .s:_fg_comment     .s:_bg_background  .s:_fmt_revr
    " exe "Highlight! StatusLineNC"  .s:_fg_window      .s:_bg_comment     .s:_fmt_revr
    " exe "Highlight! TabLine"       .s:_fg_foreground  .s:_bg_darkcolumn  .s:_fmt_revr
    " exe "Highlight! Title"         .s:_fg_yellow      .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Visual"        .s:_fg_none        .s:_bg_selection   .s:_fmt_none
    " exe "Highlight! WarningMsg"    .s:_fg_red         .s:_bg_none        .s:_fmt_none
    " Highlight LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline

    " if !has('gui_running') || g:hybrid_use_Xresources != 1
      " exe "Highlight! Normal"        .s:_fg_foreground  .s:_bg_background  .s:_fmt_none
    " else
      " exe "Highlight! Normal"        .s:_fg_foreground  .s:_bg_none        .s:_fmt_none
    " endif

    " exe "Highlight! Comment"         .s:_fg_comment     .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Constant"        .s:_fg_red         .s:_bg_none        .s:_fmt_none
    " exe "Highlight! String"          .s:_fg_green       .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Identifier"      .s:_fg_purple      .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Function"        .s:_fg_yellow      .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Statement"       .s:_fg_blue        .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Operator"        .s:_fg_aqua        .s:_bg_none        .s:_fmt_none

    " exe "Highlight! PreProc"         .s:_fg_aqua        .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Type"            .s:_fg_orange      .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Structure"       .s:_fg_aqua        .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Special"         .s:_fg_green       .s:_bg_none        .s:_fmt_none
    " exe "Highlight! Underlined"      .s:_fg_blue        .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Ignore"          .s:_fg_none        .s:_bg_none        .s:_fmt_none

    " exe "Highlight! Error"           .s:_fg_red         .s:_bg_darkred     .s:_fmt_undr

    " exe "Highlight! Todo"            .s:_fg_addfg       .s:_bg_none        .s:_fmt_none

    " exe "Highlight! qfLineNr"        .s:_fg_yellow      .s:_bg_none        .s:_fmt_none

    " Highlight! link diffRemoved Constant
    " Highlight! link diffAdded Special


    " let s:background = s:_style

    Plugin 'bling/vim-airline'
      let g:hybrid_use_Xresources = 1
      let g:airline_theme = 'ubaryd'
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_buffers = 1
      let g:airline#extensions#tabline#buf_min_count = 1
      let g:airline#extensions#branch#enabled = 1
      let g:airline#extensions#tagbar#enabled = 1
    Plugin 'mhinz/vim-startify' " Smart starup ! just staring
    Plugin 'kshenoy/vim-signature' " Just as the Numbers, and gitGutter will show vertically the marks.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IDE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ==> Plugins
    Plugin 'kien/Ctrlp.vim'                 " Fuzzy file opener
      let g:ctrlp_working_path_mode = 'ra'
      let g:ctrlp_extensions = [ 'mixed', 'buffertag', 'undo', 'changes', 'tag', 'dir', 'line' ]
      " try to get it faster
      let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg --ignore .DS_Store --ignore "**/*.pyc"  -g ""'
      let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
      if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      endif
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlPMixed'
      nmap <c-b> :CtrlPBuffer<cr>
      nmap <c-c> :CtrlPChangeAll<cr>
    Plugin 'scrooloose/nerdcommenter'       " NERD commenter
      let NERDSpaceDelims=1
      let NERDRemoveExtraSpaces=1
      map <leader>/ <plug>NERDCommenterToggle
    " Plugin 'mbbill/undotree'              " Undo tree
    Plugin 'scrooloose/nerdtree'            " NERD tree
      map <leader>N :NERDTreeToggle<cr>
      map <leader>n :NERDTreeFind<cr>
      let NERDTreeDirArrows=1
      let NERDTreeQuitOnOpen = 1
      " Plugin 'jistr/vim-nerdtree-tabs' " NERD tree tabs. To keep the nerdTree Window UNIQ
    Plugin 'tpope/vim-fugitive'             " Git wrapper
      nmap <leader>g :Gstatus<cr>
    Plugin 'airblade/vim-gitgutter'         " Git diff sign
      nmap <leader>tg :GitGutterToggle<cr>
      nmap [h <Plug>GitGutterPrevHunk
      nmap ]h <Plug>GitGutterNextHunk
    "Plugin 'Raimondi/delimitMate'          " Closing of quotes
    "Plugin 'tpope/vim-abolish'             " Abolish
    Plugin 'tpope/vim-surround'             " Surround
    "Plugin 'godlygeek/tabular'             " Tabular
    "Plugin 'AndrewRadev/splitjoin.vim'     " Splitjoin
    "Plugin 'Keithbsmiley/investigate.vim'  " Helper
    "Plugin 'wellle/targets.vim'            " Text objects
    Plugin 'majutsushi/tagbar'              " Tag bar
      nmap <c-t> :TagbarToggle<cr>
    Plugin 'vim-scripts/scratch.vim'        " Open a new file as scratch
      map <leader>st :Sscratch<cr>
    Plugin 'editorconfig/editorconfig-vim'
      let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Expected Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ==> Vim Settings
    set clipboard=unnamed " Able to copy an paste between xwindows                       "
    set laststatus=1      " Enables the status line at the bottom of Vim Only when SPLIT

  " ==> Plugins
    Plugin 'tpope/vim-repeat'                    " Repeat
    Plugin 'kristijanhusak/vim-multiple-cursors' " Multiple cursors
    Plugin 'Raimondi/delimitMate'                " Closing of quotes
    Plugin 'edsono/vim-matchit'                  " Match it
    Plugin 'sickill/vim-pasta'                   " Paste Aligned to context
    Plugin 'Valloric/MatchTagAlways'             " Force to math the HTML tag


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Motions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ==> Plugins
    " Plugin 'tpope/vim-unimpaired' " Pairs of mappings
    Plugin 'Lokaltog/vim-easymotion' " Easy motion
      let g:EasyMotion_smartcase = 1
      map  <Plug>(easymotion-sn)
    Plugin 'bkad/CamelCaseMotion' " Camel case motion
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ==> Plugins
    Plugin 'digitaltoad/vim-jade'
    Plugin 'groenewege/vim-less'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'elzr/vim-json'
    Plugin 'juvenn/mustache.vim'
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'kaihendry/vim-html5'
    Plugin 'vim-stylus'
    Plugin 'tpope/vim-rails' " Rails
    Plugin 'mattn/emmet-vim' " Emmet
      let g:user_emmet_leader_key='<C-K>'
      let g:user_emmet_settings={'indentation':'    '}
      let g:use_emmet_complete_tag=1
    Plugin 'LaTeX-Box-Team/LaTeX-Box' " LaTex
    Plugin 'sheerun/vim-polyglot' " Language Support
    Plugin 'mxw/vim-jsx' " JsX ReactJS language
    Plugin 'marijnh/tern_for_vim'
      autocmd FileType javascript nmap K :TernDoc<cr>
      autocmd FileType !javascript unmap K :TernDoc<cr>
      let g:tern_show_argument_hints = 'on_hold'
      let g:tern_show_signature_in_pum = 1
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript' " Extend JS syntas with know libraries
      let g:javascript_conceal_function   = "ƒ"
      let g:javascript_conceal_null       = "ø"
      let g:javascript_conceal_this       = "@"
      let g:javascript_conceal_return     = "⇚"
      let g:javascript_conceal_undefined  = "¿"
      let g:javascript_conceal_NaN        = "ℕ"
      let g:javascript_conceal_prototype  = "¶"
      let g:javascript_conceal_static     = "•"
      let g:javascript_conceal_super      = "Ω"
    Plugin 'scrooloose/syntastic' " Syntax checking
      map <leader>e :Errors<cr>
      let g:airline#extensions#syntastic#enabled = 1
      let g:syntastic_scss_checkers = ['scss_lint']
      set statusline+=%{SyntasticStatuslineFlag()}
      let g:syntastic_ignore_files = ['-spec.js$']
      let g:syntastic_html_checkers=['']
      let g:syntastic_javascript_checkers = ['eslint']
      let g:syntastic_javascript_eslint_exec = 'eslint_d'
      let g:syntastic_check_on_open=1
      let g:syntastic_aggregate_errors=1
      let g:syntastic_auto_jump=1
      let g:syntastic_auto_loc_list=1
      let g:syntastic_error_symbol = '✗'
      let g:syntastic_style_error_symbol = '✠'
      let g:syntastic_warning_symbol = '∆'
      let g:syntastic_style_warning_symbol = '≈'
      " Disable Sytnastic
      let g:syntastic_mode="pasive"
      let g:syntastic_check_on_open=0
    Plugin 'xolox/vim-easytags'   " Javascript Tags made easy ;)
      let g:easytags_cmd = 'ctags'
      let g:easytags_dynamic_files = 1
      let g:easytags_file = '~/.vim/tags'
      let g:easytags_always_enabled = 1
      let g:easytags_events = ['BufWritePost']
      set tags=./tags
      Plugin 'xolox/vim-misc'
    " Plugin 'gabrielelana/vim-markdown'
    Plugin 'othree/javascript-libraries-syntax.vim'
      let g:used_javascript_libs = 'jQuery,underscore,angularjs,angularui,angularuirouter,react,requirejs'
    Plugin 'bendavis78/vim-polymer'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Social Plugins
    Plugin 'vim-scripts/TwitVim'
  " Text Plugins
    Plugin 'vim-scripts/loremipsum'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TAB, SPLITS & NAVIGATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ==> Vim Settings
    set splitbelow
  " Splits Resize GUI and nongui
    nmap _ :wincmd -<cr>
    nmap + :wincmd +<cr>
    nmap = :wincmd <<cr>
    nmap - :wincmd ><cr>

  " Map C-[jk] to move between splits move tab like firefox
    nmap <C-j> :wincmd w<cr>
    nmap <C-k> :wincmd W<cr>

  " nmap <c-k> :wincmd W<cr>
    nmap 1 1gt<cr>
    nmap 2 2gt<cr>
    nmap 3 3gt<cr>
    nmap 4 4gt<cr>
    nmap 5 5gt<cr>
    nmap 6 6gt<cr>
    nmap 7 7gt<cr>
    nmap 8 8gt<cr>
    nmap 9 9gt<cr>
    nmap 0 10gt<cr>

  " quick tab move [ tab, and shift tab ]
    nmap <S-Tab> :call TabOrBuffer(0)<cr>
    " nmap <Tab> :call TabOrBuffer(1)<cr>

  " ==> Plugins
    Plugin 'jkramer/vim-narrow'

"-------------------------------------------------
" => Internal Eficenty
"-------------------------------------------------
  set ttyfast                 " Faster Terminal, redraws stuff quicker!
  set linespace=0         " No extra spaces between text lines
  set lazyredraw                 " Don't update the display while executing macros
  set timeoutlen=300

  " ==> Plugins
    Plugin 'rking/ag.vim' " Use Ag instead of Grep, is faster
      nmap <leader>f :AgFromSearch<cr>
      vmap <leader>f y:Ag! ''2hp<cr>

"-------------------------------------------------
" => Indent
"-------------------------------------------------
  " ==> Vim Settings
    set autoindent " Preserve current indent on new lines
    set cindent " set C style indent
    set expandtab " Convert all tabs typed to spaces
    set tabstop=2 " Indentation levels every four columns
    set softtabstop=2 " Indentation levels every four columns
    set shiftwidth=2 " Indent/outdent by four columns
    set shiftround " Indent/outdent to nearest tabstop

  " ==> Plugins
    Plugin 'Align'
      vmap t :Align

"-------------------------------------------------
" => Search
"-------------------------------------------------
  " ==> Vim Settings
    set ignorecase
    set smartcase " Case sensitive when uc present
    set hlsearch  " Highlight search terms
    set incsearch " Find as you type search

  " ==> Vim Mappings
    vmap A $
    vmap I ^
    vmap s :s/
    " double // to search selected text ;)
    vnorem // y/<c-r>"<cr>
    vnorem <C-H> y:<C-f>pI%s/<Esc>A//gic<Esc>hhhi
    " Use ,Space to toggle the highlight search
    nnoremap <Leader><Space> :set hlsearch!<CR>

  " ==> Plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUG INS mine Aem
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    if &ft == 'javascript' || &ft == 'jasmine.javascript' || &ft == 'javascript.jsx'
      exe "normal oconsole.log();"
      exe "normal hhp"
    elseif &ft == 'php'
      exe "normal ovar_dump();"
      exe "normal hhp"
    elseif &ft == 'sql'
      exe "normal oselect ;"
      exe "normal hp"
    else
      echo &ft
      echo "not implemente yet, please do"
    endif
  endfunction
    nmap <leader>v :call DebugVar()<cr>

  function! ReloadVimRc()
    source $HOME/.vimrc
    :PluginClean
    :PluginInstall
    :syntax enable
    :set background=dark
    :colorscheme solarized
    :colorscheme hybrid
    :AirlineRefresh
  endfunction

"-------------------------------------------------
" => Finizalization
"-------------------------------------------------
  call vundle#end()            " required
  filetype plugin indent on    " required
  syntax enable
  set background=dark
  colorscheme solarized
  colorscheme hybrid

  Plugin 'zef/vim-cycle'
  " call AddCycleGroup(['set', 'get'])
  " call AddCycleGroup(['set', 'get']
    " \ ,['push', 'pop']
    " \ ,['mas', 'menos']
    " \ ,['prev', 'next']
    " \ ,['start', 'end']
    " \ ,['read', 'write']
    " \ ,['truthy', 'falsy']
    " \ ,['filter', 'reject']
    " \ ,['internal', 'external']
    " \ ,['short', 'normal', 'long']
    " \ ,['subscribe', 'unsubscribe']
    " \ ,['header', 'body', 'footer']
    " \ ,['protected', 'private', 'public']
    " \ ,['red', 'blue', 'green', 'yellow']
    " \ ,['tiny', 'small', 'medium', 'big', 'huge']
    " \ ,['pico', 'nano', 'micro', 'mili', 'kilo', 'mega', 'giga', 'tera', 'peta']
    " \ ,['sunday', 'monday', 'tuesday', 'wensday', 'thursday', 'friday', 'saturday']
    " \ )
