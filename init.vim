" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 10.0

" TODO current problems:
" * end key not working undef tmux+fish

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:


"commenting 
Plug 'scrooloose/nerdcommenter'
""code folding
Plug 'tmhedberg/SimpylFold'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ErichDonGubler/vim-sublime-monokai'
" Now the actual plugins:
"Plug 'powerline/powerline'

"auto-completion stuff
Plug 'python-mode/python-mode'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'klen/rope-vim'



"cpp syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'


"git interface
Plug 'tpope/vim-fugitive'



"python sytax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
"Plug 'w0rp/ale'

" slow
Plug 'scrooloose/syntastic'
" Plug 'airblade/vim-gitgutter'
" Yank history navigation
" Plug 'vim-scripts/YankRing.vim'


"Colors!!!
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'beigebrucewayne/min_solo'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'Dru89/vim-adventurous'

"--------------------------------------------"
" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" Automatically close parenthesis, etc
"Plug 'Townk/vim-autoclose'


" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

"Docstring
Plug 'heavenshell/vim-pydocstring'

"--------------------------------------------"
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Surround
Plug 'tpope/vim-surround'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Ack code search (requires ack installed in the system)
"Plug 'mileszs/ack.vim'
" TODO is there a way to prevent the progress which hides the editor?

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
"TODO is there a better option for neovim?

" Window chooser
Plug 't9md/vim-choosewin'

" Automatically sort python imports
Plug 'fisadev/vim-isort'

" Highlight matching html tags
Plug 'valloric/MatchTagAlways'

" Generate html in a simple way
Plug 'mattn/emmet-vim'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Linters
Plug 'neomake/neomake'
" TODO is it running on save? or when?
" TODO not detecting errors, just style, is it using pylint?

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
"Plug 'myusuf3/numbers.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme VisualStudioDark 
else
    colorscheme sublimemonokai
    let g:sublimemonokai_term_italic = 1

endif

" needed so deoplete can auto select the first suggestion
"set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
"set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" save as sudo
"ca w!! w !sudo tee "%"

" System Clipboard
set clipboard=unnamed


" " tab navigation mappings
map tt :tabnew
" map <M-Right> :tabn<CR>
" imap <M-Right> <ESC>:tabn<CR>
" map <M-Left> :tabp<CR>
" imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)q
set shell=/bin/zsh

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
"map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
"let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
"map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write (slow)
" autocmd! BufWritePost * Neomake

" Check code as python3 by default
"let g:neomake_python_python_maker = neomake#makers#ft#python#python()
"let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
"let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
"let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Fzf ------------------------------

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tag<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
nmap ,c :Commands<CR>
" to be able to call CtrlP with default search text
"function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    "execute ':CtrlP' . a:ctrlp_command_end
    "call feedkeys(a:search_text)
"endfunction
" same as previous mappings, but calling with current word as default text
"nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>


" Deoplete -----------------------------

" Use deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
"nmap ,r :Ack
"nmap ,wr :Ack <cword><CR>

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '~/.config/nvim/'

" Airline ------------------------------
let g:airline_theme='solarized_flood'
"let g:airline_powerline_fonts = 0 
"let g:airline_theme = 'bubblegum'
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#branch#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on docs/fancy_symbols.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'


" let g:airline_theme='solarized'
"let g:airline_powerline_fonts= 0
"let g:Powerline_symbols='patched'
"let  g:airline_left_sep = "\uE0B0"
"let g:airline_right_sep = "\uE0B2"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = '|'
"let g:airline#extensions#tabline#left_alt_sep = '|'
"" set the CN (column number) symbol:
""let g:airline_section_z = airline#section#create(["\uE0A1".' '.'%{line(".")}'.'',"\uE0A3" . ' '. '%{col(".")}'])
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ','linenr', ':%3v'])


"----------------MINE--------------------------"
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za


"pydiction path
let g:pydiction_location = '/home/mfc/.config/nvim/plugged/Pydiction'


"custom keys
let mapleader='\'

"I don't like swap files
set noswapfile

" set guifont=Monaco:h14

"bind ctrl+<movement> keys to move around the windows, instead of usning ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


""easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


"make search case insensative
set hlsearch
set incsearch
set ignorecase
set smartcase


" enable mouse
set mouse=a

"Quick quit command
map <F4> :nohl<CR>

" Toggle paste mode
set pastetoggle=<F2>


"Quic save command
noremap <Leader>s :update<CR>
noremap <C-x> <Esc>:update<CR>
inoremap <C-s> <c-o>:w<CR>:
noremap <C-s> <c-o>:update<CR>
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Easy movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
"au BufRead,BufNewFile *.py,*.pyw, set textwidth=80

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
"autocmd FileType python set autoindent


" make backspaces more powerfull
set backspace=indent,eol,start


" Flag White Spaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



" ----------------Pymode-----------------------

" open docstring window at the bottom
" set splitbelow
let g:pymode = 1 
let g:pymode_warnings = 1
" let g:pymode_paths = []
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 79
"let g:pymode_quickfix_minheight = 3
" let g:pymode_python = 'python3'
let g:pymode_indent = 0
let g:pymode_folding = 0
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 0
" let g:pymode_virtualenv_path = $VIRTUA_ENV
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>h'
" let g:pymode_breakpoint = 1
 let g:pymode_breakpoint_bind = '<leader>b'
" let g:pymode_breakpoint_cmd = ''
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1 
let g:pymode_syntax = 1
" let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_lint_mssage = 1
let g:pymode_lint_checkers = ['pylint']
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_select = "E501,W0011,W430"
let g:pymode_lint_sort = []
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_rope = 1 
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
" let g:pymode_rope_show_doc_bind = '<C-c>d'
" let g:pymode_rope_regenerate_on_write = 0
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
" let g:pymode_rope_autoimport = 1
" let g:pymode_rope_autoimport_import_after_complete = 0
" let g:pymode_rope_goto_definition_bind = '<C-c>g'
" let g:pymode_rope_goto_definition_cmd = 'new'
" let g:pymode_rope_rename_bind = '<C-c>rr'


"------------python with virtualenv support----------------

"py3 << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUA_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "sys.path.insert(0, project_base_dir)
  "activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF



"--------------powerline-------------------
" set g:powerline_pycmd = "py3"
" set rtp+=$HOME/.virtualenvs/py3.5/lib/python3.5/site-packages/powerline/bindings/vim/
" set guifont=Incosolata\ for\ Powerline:h13


" auto close quick fix window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']


"-------------Indent Python in the Google way--------------------------------

"setlocal indentexpr=GetGooglePythonIndent(v:lnum)

"let s:maxoff = 50 " maximum number of lines to look backwards.

"function GetGooglePythonIndent(lnum)

  "" Indent inside parens.
  "" Align with the open paren unless it is at the end of the line.
  "" E.g.
  ""   open_paren_not_at_EOL(100,
  ""                         (200,
  ""                          300),
  ""                         400)
  ""   open_paren_at_EOL(
  ""       100, 200, 300, 400)
  "call cursor(a:lnum, 1)
  "let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        "\ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        "\ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        "\ . " =~ '\\(Comment\\|String\\)$'")
  "if par_line > 0
    "call cursor(par_line, 1)
    "if par_col != col("$") - 1
      "return par_col
    "endif
  "endif

  "" Delegate the rest to the original function.
  "return GetPythonIndent(a:lnum)

"endfunction

"let pyindent_nested_paren="&sw*2"
"let pyindent_open_paren="&sw*2"

" Moving line with j and k 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv



"-------------------------
let g:python3_host_prog = '/home/mfc/.conda/envs/neovim3/bin/python'

"------colorcolumn--------
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 80)
"set colorcolumn=0
set cc=
