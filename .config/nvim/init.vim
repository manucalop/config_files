" Manuel Castillo .vimrc File

" {{{ Plugins 
call plug#begin('~/.local/share/nvim/plugged')
" I like minimal tpope's philosophy
" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Some usefull mappings
Plug 'tpope/vim-unimpaired'
" Tools for comments
Plug 'tpope/vim-commentary'
" Tools for brackets, or any surroundings
Plug 'tpope/vim-surround'
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
" Plug 'taketwo/vim-ros'
"Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
" Need to check those (form mcantor) btw, tpope is our friend
"Plug 'tpope/vim-obsession'
Plug 'majutsushi/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
"" Automatic tab adjust
"Plug 'tpope/vim-sleuth'
" Repeat with . non-native commands
Plug 'tpope/vim-repeat'
"" Enhance the vim tree view (netrw)
Plug 'tpope/vim-vinegar'
" UNIX tools
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
call plug#end()

"   }}}

"   {{{     Mappings

" ------------------------------------------------
"                   MAPPINGS     
" ------------------------------------------------
"    let mapleader = ","
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
    " Tmux like windows
    nnoremap <c-w>n :tabnext<CR>
    nnoremap <c-w>p :tabprevious<CR>
    nnoremap <c-w>c :tabnew<CR>
    nnoremap <c-w>v :vnew<CR>
    nnoremap <c-w>b :below new<CR>
    nnoremap <c-w><c-l> :vertical resize +5<CR>
    nnoremap <c-w><c-h> :vertical resize -5<CR>
    nnoremap <c-w><c-k> :resize +5<CR>
    nnoremap <c-w><c-j> :resize -5<CR>
    " NERDTree Toogle
    nnoremap <c-_> :NERDTreeToggle<CR>
    nnoremap <c-i> :TagbarToggle<CR>
    " Easy saving
    inoremap <C-s> <ESC>:w<CR>
    nnoremap <C-s> :w<CR>
    " Change indent continuously
    vmap < <gv
    vmap > >gv
   " Terminal mapping
    command Term :0tabnew | :terminal 
    tnoremap <Esc> <C-\><C-n>
    " Ranger mapping
    nnoremap ,r :Ranger<CR>

    " ROS Snippets
    command! RosMake       :-1read $HOME/.config/nvim/snippets/ros/CMakeLists.txt
    command! RosMakeAcado  :-1read $HOME/.config/nvim/snippets/ros/cmake_acado.txt
    command! RosMakeExe    :-1read $HOME/.config/nvim/snippets/ros/cmake_executable.txt
    command! RosMakeLib    :-1read $HOME/.config/nvim/snippets/ros/cmake_library.txt
    command! RosMakeTest   :-1read $HOME/.config/nvim/snippets/ros/cmake_test.txt
    command! RosMakeMsg    :-1read $HOME/.config/nvim/snippets/ros/cmake_msg.txt
    command! RosMakeSrv    :-1read $HOME/.config/nvim/snippets/ros/cmake_srv.txt
    command! RosMakeAction :-1read $HOME/.config/nvim/snippets/ros/cmake_action.txt

    command! RosPack       :-1read $HOME/.config/nvim/snippets/ros/package.xml
    command! RosPackDep    :-1read $HOME/.config/nvim/snippets/ros/package_depend.xml
    command! RosPackMsg    :-1read $HOME/.config/nvim/snippets/ros/package_msg.xml

    command! RosCppMain    :-1read $HOME/.config/nvim/snippets/ros/main.cpp
    command! RosCppParam   :-1read $HOME/.config/nvim/snippets/ros/param.cpp
    command! RosCppPub     :-1read $HOME/.config/nvim/snippets/ros/publisher.cpp
    command! RosCppSub     :-1read $HOME/.config/nvim/snippets/ros/subscriber.cpp
    command! RosCppCallback :-1read $HOME/.config/nvim/snippets/ros/callback.cpp
    command! RosCppSrv     :-1read $HOME/.config/nvim/snippets/ros/server.cpp
    command! RosCppSrvFunc :-1read $HOME/.config/nvim/snippets/ros/server_func.cpp
    command! RosCppTimer   :-1read $HOME/.config/nvim/snippets/ros/timer.cpp

    " Cpp snippets
    command! CppClass      :-1read $HOME/.config/nvim/snippets/cpp/class.cpp
    command! CppTemp       :-1read $HOME/.config/nvim/snippets/cpp/template.cpp

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
    call tinykeymap#Map('tabs', '<s-l>', 'tabmove +1') 
    call tinykeymap#Map('tabs', '<s-h>', 'tabmove -1') 
    call tinykeymap#Map('tabs', 'n', 'tabnew') 
    call tinykeymap#Map('tabs', 't', 'norm! gt') 
    call tinykeymap#Map('tabs', 'T', 'norm! gT') 
    call tinykeymap#Map('tabs', '0', 'tabfirst') 
    call tinykeymap#Map('tabs', '$', 'tablast') 
    call tinykeymap#Map('tabs', 'q', 'tabclose')
"}}}

" }}}

"   {{{     Options 
    
" Color options
    set nocompatible
    set background=dark
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
    set termguicolors

"    syntax on
    colorscheme onedark

    hi Visual cterm=bold 
    hi Folded gui=bold guibg=NONE guifg=Blue70 
    set path+=**
    set wildmode=longest:full,full
    set spelllang=en_us
" Enable mouse usage
    set mouse=a
    " Splits
    set splitright
" Tab formatting
    set tabstop=2 shiftwidth=2 softtabstop=2
    set expandtab
" use :retab to convert tabs into spaces
" Start with everything folded
" "zo" to open folds, "zc" to close, "za" to toggle "zn" to disable.
    set foldlevelstart=0
    set foldenable 
    set fdm=marker
" Number lines (I have them in Airline)
    set number
    set relativenumber
    set cursorline
" Soft wrapping
    set wrap
    set linebreak
    set nolist
    set nohlsearch
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

" For autocomplete (deoplete)
    let g:deoplete#enable_at_startup = 1

" Tinykeymaps
    let g:tinykeymaps_default=0 
    let g:tinykeymap#message_fmt='--%s %s--'
" NERDTree
    let NERDTreeWinSize=40
" Tags
    set tags+=~/.config/nvim/tags/usr_all
    set tags+=~/.config/nvim/tags/ros_all
"   }}}
"
" TODO
" Functions {{{
" See Max Cantor dotfiles https://github.com/mcantor/dotfiles/tree/master/vim
"function! RosPublisher(name_pub, msg_type, topic)
" }}}
