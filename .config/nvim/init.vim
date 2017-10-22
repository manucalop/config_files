call plug#begin('~/.local/share/nvim/plugged')

" Directory tree
Plug 'scrooloose/nerdtree'
" Autocompletion , { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim'
" Make plugin (plugin)
"Plug 'neomake/neomake'
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
" Solarized colors
"Plug 'altercation/vim-colors-solarized'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" To navigate with Ctrl hjkl in vim and tmux at the same time
" Plug 'christoomey/vim-tmux-navigator'
" Mini mode creator
Plug 'tomtom/tinykeymap_vim'
" Ranger integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
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
" Tab mode
    let g:tinykeymaps_default=0 
    call tinykeymap#EnterMap('tabs', 'gt', {'name': 'Tabs mode: [n]ew [q]uit [hl]movements'}) 
"    call tinykeymap#ModeMsg("tabs", "")
    call tinykeymap#Map('tabs', 'l', 'tabnext') 
    call tinykeymap#Map('tabs', 'h', 'tabprev') 
    call tinykeymap#Map('tabs', 'n', 'tabnew') 
    call tinykeymap#Map('tabs', 't', 'norm! gt') 
    call tinykeymap#Map('tabs', 'T', 'norm! gT') 
    call tinykeymap#Map("tabs", "^", "tabfirst") 
    call tinykeymap#Map("tabs", "$", "tablast") 
    call tinykeymap#Map("tabs", "q", "tabclose")
    let g:tinykeymap#message_fmt="--%s %s--"
" Ranger mapping
    let g:ranger_map_keys = 0
    map gr :Ranger<CR>
    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" ------------------------------------------------
"                    OPTIONS
" ------------------------------------------------
    set encoding=utf-8
    set nospell
    set spelllang=en_us
"    set ttymouse=xterm2
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
    call deoplete#enable()
" ------------------------------------------------
