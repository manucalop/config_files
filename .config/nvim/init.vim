" Manuel Castillo .vimrc File

" {{{ Plugins and settings
call plug#begin('~/.local/share/nvim/plugged')
" Directory tree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" Make plugin (plugin)
" Autocompletion , { 'do': ':UpdateRemotePlugins' }. Check ctags
Plug 'Shougo/deoplete.nvim'
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux'
" Mini mode creator
Plug 'tomtom/tinykeymap_vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'taketwo/vim-ros'
"Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
" Need to check those (form mcantor) btw, tpope is our friend
"Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"" Automatic tab adjust
"Plug 'tpope/vim-sleuth'
" Repeat with . non-native commands
Plug 'tpope/vim-repeat'
"" Enhance the vim tree view (netrw)
Plug 'tpope/vim-vinegar'
"" UNIX tools
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
call plug#end()

"   }}}

"   {{{     Mappings

" ------------------------------------------------
"                   MAPPINGS     
" ------------------------------------------------
    let mapleader = ","
    nnoremap j  gj
    vnoremap j  gj
    nnoremap k  gk
    vnoremap k  gk
    nnoremap 0  g0
    vnoremap 0  g0
    nnoremap $  g$
    vnoremap $  g$
    " Fast cursor movement
    nnoremap <c-j> 5gj
    nnoremap <c-k> 5gk
    vnoremap <c-j> 5gj
    vnoremap <c-k> 5gk
    nnoremap <s-j> o<ESC>k
    nnoremap <s-k> O<ESC>j
    " Tab jumping
    nnoremap <c-n> :tabnext<CR>
    nnoremap <c-p> :tabprevious<CR>
    " NERDTree Toogle
    nnoremap <c-_> :NERDTreeToggle<CR>
    " Easy saving
    inoremap <C-u> <ESC>:w<CR>
"    autocmd StdinReadPre * let s:std_in=1
"    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " Go to first/last line of the paragraph
 "   map { {j
 "   map } }k
    
    " Change indent continuously
    vmap < <gv
    vmap > >gv
   " Terminal mapping
    command Term :0tabnew | :terminal 
    tnoremap <Esc> <C-\><C-n>
    " Ranger mapping
    nnoremap ,r :Ranger<CR>
    " deoplete tab-complete
"    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    " Cantor shortcuts
    " Creating lines
"   }}}

"   {{{     Mode

"Window mode {{{

  call tinykeymap#EnterMap('windows', ',w', {'name': 'Windows mode: [b]new [v]new [q]uit [hljk]movements <s-hljk>resize <c-hljk>move'}) 
  call tinykeymap#Map('windows', 'l', ':wincmd l') 
  call tinykeymap#Map('windows', 'h', ':wincmd h') 
  call tinykeymap#Map('windows', 'j', ':wincmd j') 
  call tinykeymap#Map('windows', 'k', ':wincmd k') 
  call tinykeymap#Map('windows', '<s-l>', ':wincmd >') 
  call tinykeymap#Map('windows', '<s-h>', ':wincmd <') 
  call tinykeymap#Map('windows', '<s-j>', ':wincmd -') 
  call tinykeymap#Map('windows', '<s-k>', ':wincmd +') 
  call tinykeymap#Map('windows', '<c-h>', ':wincmd R') 
  call tinykeymap#Map('windows', '<c-l>', ':wincmd r') 
  call tinykeymap#Map('windows', '<c-k>', ':wincmd R') 
  call tinykeymap#Map('windows', '<c-j>', ':wincmd r') 
  call tinykeymap#Map('windows', 'b', 'new') 
  call tinykeymap#Map('windows', 'v', 'vnew') 
  call tinykeymap#Map('windows', 'q', 'close')

"}}}

" Tab mode {{{

    call tinykeymap#EnterMap('tabs', ',t', {'name': 'Tabs mode: [n]ew [q]uit [hl]movements'}) 
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
"}}}

"Browser mode {{{
" call tinykeymap#EnterMap('browser', ',b', {'name': 'Tabs mode: [n]ew [q]uit [hl]movements'}) 
"     call tinykeymap#Map('browser', 'l', 'norm! 5l') 
"     call tinykeymap#Map('browser', 'h', 'norm! 5h') 
"     call tinykeymap#Map('browser', 'k', 'norm! <c-y>') 
"     call tinykeymap#Map('browser', 'j', 'norm! <c-e>') 

"   }}}

" }}}

"   {{{     Options 
    
" Color options
    set nocompatible
    set background=dark
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors

    syntax on
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
"    set ignorecase smartcase
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
    set scrolloff=5
" Set system clipboard as default
    set clipboard=unnamedplus
" Avoid creating backup files (~file)    
    set nobackup
" Airline setup
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
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
" Extend the use of %
let loaded_matchit = 1

"   }}}

"   {{{ Deoplete exclusion with vim-multicursors
" Called once right before you start selecting multiple cursors
" function! Multiple_cursors_before()
"     if exists('g:deoplete#disable_auto_complete') 
" 	   let g:deoplete#disable_auto_complete = 1
"     endif
" endfunction

" " Called once only when the multiple selection is canceled (default <Esc>)
" function! Multiple_cursors_after()
"     if exists('g:deoplete#disable_auto_complete')
" 	   let g:deoplete#disable_auto_complete = 0
"     endif
" endfunction
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
"
" Functions {{{
"

" }}}
