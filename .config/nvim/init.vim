" Manuel Castillo .vimrc File

" {{{ Plugins and settings
call plug#begin('~/.local/share/nvim/plugged')
" Directory tree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" Autocompletion , { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.6/lib/libclang.so.1'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
" Make plugin (plugin)
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Mini mode creator
Plug 'tomtom/tinykeymap_vim'
" Ranger integration
Plug 'terryma/vim-multiple-cursors'
"Plug 'taketwo/vim-ros'
"Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
" Need to check those (form mcantor) btw, tpope is our friend
"Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-commentary'
"" Automatic tab adjust
"Plug 'tpope/vim-sleuth'
"Plug 'tpope/vim-surround'
"" vim-repeat: make vim-commentary and vim-surround work with .
"Plug 'tpope/vim-repeat'
"" vim-markdown: some stuff for fenced language highlighting
"Plug 'tpope/vim-markdown'
""let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'yaml', 'haml', 'bash=sh']
"" Enhance the vim tree view
"Plug 'tpope/vim-vinegar'
"" UNIX tools
"Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
call plug#end()

"   }}}

"   {{{     Mappings

" ------------------------------------------------
"                   MAPPINGS     
" ------------------------------------------------
    nmap j  gj
    vmap j  gj
    nmap k  gk
    vmap k  gk
    nmap 0  g0
    vmap 0  g0
    nmap $  g$
    vmap $  g$
    " Paragraph jumping 
    nmap <c-j> 10gj
    nmap <c-k> 10gk
    vmap <c-j> 10gj
    vmap <c-k> 10gk
    nmap <c-_> :NERDTreeToggle<CR>
    
    " Change indent continuously
    vmap < <gv
    vmap > >gv
   " command Nt NERDTreeToggle

    " Ranger mapping
    nmap gr :Ranger<CR>
    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"   }}}

"   {{{     Modes 

" Window mode (replacing the window key binding CTRL-W)
"   call tinykeymap#EnterMap('windows', '<c-w>', {'name': 'Windows mode: [n]ew [v]new [q]uit [hljk]movements <s-hljk>resize <c-hljk>move'}) 
"   call tinykeymap#Map('windows', 'l', ':wincmd l') 
"   call tinykeymap#Map('windows', 'h', ':wincmd h') 
"   call tinykeymap#Map('windows', 'j', ':wincmd j') 
"   call tinykeymap#Map('windows', 'k', ':wincmd k') 
"   call tinykeymap#Map('windows', '<s-l>', ':wincmd >') 
"   call tinykeymap#Map('windows', '<s-h>', ':wincmd <') 
"   call tinykeymap#Map('windows', '<s-j>', ':wincmd -') 
"   call tinykeymap#Map('windows', '<s-k>', ':wincmd +') 
"   call tinykeymap#Map('windows', '<c-h>', ':wincmd R') 
"   call tinykeymap#Map('windows', '<c-l>', ':wincmd r') 
"   call tinykeymap#Map('windows', '<c-k>', ':wincmd R') 
"   call tinykeymap#Map('windows', '<c-j>', ':wincmd r') 
"   call tinykeymap#Map('windows', 'n', 'new') 
"   call tinykeymap#Map('windows', 'v', 'vnew') 
"   call tinykeymap#Map('windows', 'q', 'close')

" Tab mode (replacing gt: :tabnext)
    call tinykeymap#EnterMap('tabs', 'gt', {'name': 'Tabs mode: [n]ew [q]uit [hl]movements'}) 
    call tinykeymap#Map('tabs', 'l', 'tabnext') 
    call tinykeymap#Map('tabs', 'h', 'tabprev') 
    call tinykeymap#Map('tabs', '<c-l>', 'tabmove +1') 
    call tinykeymap#Map('tabs', '<c-h>', 'tabmove -1') 
    call tinykeymap#Map('tabs', 'n', 'tabnew') 
    call tinykeymap#Map('tabs', 't', 'norm! gt') 
    call tinykeymap#Map('tabs', 'T', 'norm! gT') 
    call tinykeymap#Map('tabs', '0', 'tabfirst') 
    call tinykeymap#Map('tabs', '$', 'tablast') 
    call tinykeymap#Map('tabs', 'q', 'tabclose')
"   }}}

"   {{{     Options 
    
" Color options
    set nocompatible
    syntax on
    set background=dark
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=3
    colorscheme onedark
    hi Visual cterm=bold 
    hi Folded gui=bold guibg=NONE guifg=Blue70 
"    filetype plugin on
    set path+=**
    set wildmode=full
    set wildmenu
    set encoding=utf-8
    set nospell
    "set spell
    set spelllang=en_us
    "set mouse=xterm2
" Enable mouse usage
    "set mouse=a
" Highlight search results
    set nohlsearch
" Makes search act like search in modern browsers
    set incsearch
    set ignorecase smartcase
    " Splits
    set splitright

" Formatting
   set tabstop=2 shiftwidth=2 softtabstop=2
   set expandtab
" Start with everything folded
" "zo" to open folds, "zc" to close, "za" to toggle "zn" to disable.
		set foldlevelstart=0
		set foldenable 
		set fdm=marker
" use :retab to convert tabs into spaces
" Number lines (I have them in Airline)
    set number
" Soft wrapping
    set wrap
    set linebreak
    set nolist
" Set system clipboard as default
    set clipboard=unnamedplus
" Avoid creating backup files (~file)    
    set nobackup
" Airline setup
    let g:airline#extensions#tabline#enabled = 0
    let g:airline_powerline_fonts = 1
    let g:airline_theme='onedark'
    let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
 "   let g:airline_section_z       (percentage, line number)
    
    " Just show the filename (no path) in the tab
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:tmuxline_powerline_separators = 0
    let g:airline#extensions#tmuxline#enabled = 0

" Neomake configuration
    " Call neomake automatically on write
    " call neomake#configure#automake('w')
    " let g:neomake_open_list = 2

" For autocomplete (deoplete)
let g:deoplete#enable_at_startup = 1

" Tinykeymaps
let g:tinykeymaps_default=0 
let g:tinykeymap#message_fmt='--%s %s--'
"   }}}

"   {{{ Deoplete exclusion with vim-multicursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists('g:deoplete#disable_auto_complete') 
	   let g:deoplete#disable_auto_complete = 1
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists('g:deoplete#disable_auto_complete')
	   let g:deoplete#disable_auto_complete = 0
    endif
endfunction
"
""   }}}

"hi Visual cterm=reverse,bold 
"hi Visual cterm=bold ctermfg=Black ctermbg=Blue

" Color scheme
" color molokai
" Make the modification indicator [+] white on red background
"au ColorScheme * hi User1 gui=bold term=bold cterm=bold guifg=white guibg=red ctermfg=white ctermbg=red

" Tweak the color of the fold display column
"au ColorScheme * hi FoldColumn cterm=bold ctermbg=233 ctermfg=146

" See Max Cantor dotfiles https://github.com/mcantor/dotfiles/tree/master/vim
