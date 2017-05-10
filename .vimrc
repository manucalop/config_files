set nocompatible              " be iMproved required
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ------------------------------------------------
"                    PLUGINS
" ------------------------------------------------

" let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim' 

" Folder tree with git plugin
    Plugin 'scrooloose/nerdtree'
    Plugin 'xuyuanp/nerdtree-git-plugin'

" Git tools
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

" Syntax check
    Plugin 'scrooloose/syntastic'

" Parenthesis, brackets, etc
    Plugin 'tpope/vim-surround'

" Fuzzy finder
    Plugin 'ctrlpvim/ctrlp.vim'

" Autocompletion (need some dependencies)
    Plugin 'valloric/youcompleteme'

" Markdown
    Plugin 'plasticboy/vim-markdown'
" Latextools
    Plugin 'latex-box-team/latex-box'
"    Plugin 'lervag/vimtex'
" C/C++ tools
    Plugin 'c.vim'
" Color schemes
    Plugin 'flazz/vim-colorschemes'
" Nerd commenter
    Plugin 'scrooloose/nerdcommenter'
" Spell check
    Plugin 'reedes/vim-lexical'
" ------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
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
" ------------------------------------------------
"                    OPTIONS
" ------------------------------------------------

" Highlight search results
    set hlsearch
" Makes search act like search in modern browsers
    set incsearch
"Clean screen highlights (search results)
    nnoremap <silent> <C-l> :nohl<CR><C-l>

" Convert tabs into 4  spaces
    set tabstop=4
    set shiftwidth=4
    set expandtab
" use :retab to convert tabs into spaces
    set number
" Soft wrapping
    set wrap
    set linebreak
    set nolist
" Select colorscheme
"    colorscheme Tomorrow-Night
" Latex autocompletion
    let g:vimtex_enabled=1
    let g:vimtex_complete_enabled=1
    let g:vimtex_complete_recursive_bib=1
" Spell check    
    let g:lexical#spell = 1         " 0=disabled, 1=enabled
" ------------------------------------------------
