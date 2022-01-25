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
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux'
" Mini mode creator
Plug 'tomtom/tinykeymap_vim'
" Plug 'taketwo/vim-ros'
Plug 'joshdick/onedark.vim'
" Need to check those (form mcantor) btw, tpope is our friend
"Plug 'tpope/vim-obsession'
" Plug 'majutsushi/tagbar'
" Plug 'craigemery/vim-autotag'
" Plug 'ludovicchabant/vim-gutentags'
"" Automatic tab adjust
"Plug 'tpope/vim-sleuth'
" Repeat with . non-native commands
Plug 'tpope/vim-repeat'
"" Enhance the vim tree view (netrw)
Plug 'tpope/vim-vinegar'
" UNIX tools
" Plug 'tpope/vim-eunuch'
"Plug 'sheerun/vim-polyglot'
" Latex
" Plug 'lervag/vimtex'

Plug 'psliwka/vim-smoothie'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
 " For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Completion 
"
" New stuff
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"
" " Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
" Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons
"
" Plug 'nikvdp/neomux'
"
" Plug 'tpope/vim-ragtag'
"
" Plug 'tomtom/tcomment_vim'

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

    nnoremap <c-j> 5j
    nnoremap <c-k> 5k
    " Create empty lines above and below
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
    "nnoremap <c-i> :TagbarToggle<CR>
    " Easy saving
    "inoremap <C-i> <ESC>:w<CR>
    nnoremap <C-s> :w<CR>
    " Change indent continuously
    vmap < <gv
    vmap > >gv
   " Terminal mapping
    command Term :0tabnew | :terminal 
    tnoremap <Esc> <C-\><C-n>
    " Ranger mapping
    nnoremap ,r :Ranger<CR>

    nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>


"   }}}

    " Snippets{{{

    " ROS {{{
    
    " RosCmake{{{
    command! RosCmake       :-1read $HOME/.config/nvim/snippets/ros/cmake/CMakeLists.txt
    command! RosCmakeAcado  :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_acado.txt
    command! RosCmakeExe    :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_executable.txt
    command! RosCmakeLib    :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_library.txt
    command! RosCmakeTest   :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_test.txt
    command! RosCmakeMsg    :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_msg.txt
    command! RosCmakeSrv    :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_srv.txt
    command! RosCmakeAction :-1read $HOME/.config/nvim/snippets/ros/cmake/cmake_action.txt
    "}}}
    
    " RosPack{{{
    command! RosPack       :-1read $HOME/.config/nvim/snippets/ros/package/package.xml
    command! RosPackDep    :-1read $HOME/.config/nvim/snippets/ros/package/package_depend.xml
    command! RosPackMsg    :-1read $HOME/.config/nvim/snippets/ros/package/package_msg.xml
    "}}}
    
    "RosCpp{{{
    command! RosCppMain     :-1read $HOME/.config/nvim/snippets/ros/cpp/main.cpp
    command! RosCppParam    :-1read $HOME/.config/nvim/snippets/ros/cpp/param.cpp
    command! RosCppPub      :-1read $HOME/.config/nvim/snippets/ros/cpp/publisher.cpp
    command! RosCppSub      :-1read $HOME/.config/nvim/snippets/ros/cpp/subscriber.cpp
    command! RosCppCallback :-1read $HOME/.config/nvim/snippets/ros/cpp/callback.cpp
    " command! RosCppSrv      :-1read $HOME/.config/nvim/snippets/ros/cpp/server.cpp
    " command! RosCppSrvFunc  :-1read $HOME/.config/nvim/snippets/ros/cpp/server_func.cpp
    command! RosCppTimer    :-1read $HOME/.config/nvim/snippets/ros/cpp/timer.cpp
    "}}}

"}}}

    " Cpp {{{
    command! CppClass      :-1read $HOME/.config/nvim/snippets/cpp/class.cpp
    command! CppTemp       :-1read $HOME/.config/nvim/snippets/cpp/template.cpp
    "}}}

    " LaTeX{{{
    command! TexImg        :-1read $HOME/.config/nvim/snippets/latex/img.tex
    command! TexTable      :-1read $HOME/.config/nvim/snippets/latex/table.tex
    command! TexEqn        :-1read $HOME/.config/nvim/snippets/latex/eqn.tex
    command! TexSubEqns    :-1read $HOME/.config/nvim/snippets/latex/subeqns.tex
    command! TexMultEqn    :-1read $HOME/.config/nvim/snippets/latex/multeqn.tex
    "}}}

"}}}

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
    set termguicolors

"    syntax on
    colorscheme onedark

    hi Visual cterm=bold 
    hi Folded gui=bold guibg=NONE guifg=Blue70 
    set path+=**
    set wildmode=longest:full,full
    " set wildmode=list:full,full
    set spelllang=en_us
" Enable mouse usage
    set mouse=a
    " Splits
    set splitright
" Tab formatting
    set tabstop=4 shiftwidth=4 softtabstop=0
    set expandtab
    set smarttab
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
    " set completeopt=menuone,noselect
    set completeopt=menu,menuone,noselect
    set fileencoding=utf-8
    set pumheight=10
    set noshowmode
    set noswapfile
" Scroll
    set scrolloff=10
    " set scroll=5
    set whichwrap+=<,>,[,],h,l
    set iskeyword+=-
    set formatoptions-=cro
    set incsearch
    set ruler
    set smartindent
    set virtualedit=all
" Airline setup
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_powerline_fonts = 0
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
    " let g:deoplete#enable_at_startup = 1

" Tinykeymaps
    let g:tinykeymaps_default=0 
    let g:tinykeymap#message_fmt='--%s %s--'
" NERDTree
    let NERDTreeWinSize=40
" Tags
    " set tags+=~/.config/nvim/tags/usr_all_tags
    " set tags+=~/.config/nvim/tags/ros_all
    " set tags+=~/manuel_ws/ros/obstacle_avoidance_ws/src/tags
"   }}}

"Auto commands{{{
autocmd FileType tex :setlocal spell
autocmd FileType cpp :set tags+=~/.config/nvim/tags/ros_all

augroup packer_user_config
    autocmd!
    " autocmd BufWritePost init.vim source <afile> | PlugClean | PlugInstall
    autocmd BufWritePost init.vim source <afile>
augroup end
"}}}

" TODO
" Functions {{{
" See Max Cantor dotfiles https://github.com/mcantor/dotfiles/tree/master/vim
"function! RosPublisher(name_pub, msg_type, topic)
" }}}

" nvim-cmp{{{
 lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = 'path' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['pyright'].setup{capabilities = capabilities}
  require'lspconfig'.pyright.setup{}
EOF
"}}}
