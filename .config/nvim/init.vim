call plug#begin('~/.local/share/nvim/plugged')

" Directory tree
Plug 'scrooloose/nerdtree'
" Autocompletion , { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.6/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

"let g:deoplete#sources#clang#libclang_path = '/usr/lib/gcc/x86_64-linux-gnu/5/libgcc_s.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/gcc/x86_64-linux-gnu/'
" Make plugin (plugin)
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
" Solarized colors
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Mini mode creator
Plug 'tomtom/tinykeymap_vim'
" Ranger integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'taketwo/vim-ros'
call plug#end()

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
    
    nmap <silent> <A-k> :wincmd k<CR>
    nmap <silent> <A-j> :wincmd j<CR>
    nmap <silent> <A-h> :wincmd h<CR>
    nmap <silent> <A-l> :wincmd l<CR>   
    nmap <silent> <A-v> :vnew<CR>   
    nmap <silent> <A-l> :new<CR>   
   " command Nt NERDTreeToggle
    " Ranger mapping
    nmap gr :Ranger<CR>
    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ------------------------------------------------
"                   MODES     
" ------------------------------------------------

" Window mode (replacing the window key binding CTRL-W)
    call tinykeymap#EnterMap('windows', '<c-w>', {'name': 'Windows mode: [n]ew [v]new [q]uit [hljk]movements <s-hljk>resize <c-hljk>move'}) 
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
    call tinykeymap#Map('windows', 'n', 'new') 
    call tinykeymap#Map('windows', 'v', 'vnew') 
    call tinykeymap#Map('windows', 'q', 'close')

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
" ------------------------------------------------
"                    OPTIONS
" ------------------------------------------------
    set encoding=utf-8
    set nospell
    set spelllang=en_us
    "set mouse=xterm2
    set mouse=a
" Automatically go to current directory
    set autochdir
" Highlight search results
    set nohlsearch
" Makes search act like search in modern browsers
    set incsearch
"Clean screen highlights (search results)
"    nnoremap <silent> <C-l> :nohl<CR><C-l>
" Convert tabs into 4  spaces
    set tabstop=5
    set shiftwidth=4
    set expandtab
" use :retab to convert tabs into spaces
    set number
" Soft wrapping
    set wrap
    set linebreak
    set nolist
" Set system clipboard
    set clipboard=unnamedplus
" Avoid creating backup files (~file)    
    set nobackup
" Solarized scheme
"    syntax enable
   set background=dark
   let g:solarized_termcolors=256
" Airline setup
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='deus'
"    let g:solarized_termcolors=256
"    let g:airline_theme='solarized'
"    let g:airline_solarized_bg='dark'
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

" For autocomplete (vim)
"set wildmenu
"set wildmode=longest:full,full

" Ranger
let g:ranger_map_keys = 1

" Tinykeymaps
let g:tinykeymaps_default=0 
let g:tinykeymap#message_fmt='--%s %s--'
" ------------------------------------------------
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
