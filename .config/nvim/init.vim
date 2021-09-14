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
Plug 'edkolev/tmuxline.vim'
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
Plug 'tpope/vim-eunuch'
"Plug 'sheerun/vim-polyglot'
" Latex
Plug 'lervag/vimtex'
" Completion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

    " LaTeX snippets
    command! TexImg        :-1read $HOME/.config/nvim/snippets/latex/img.tex
    command! TexTable      :-1read $HOME/.config/nvim/snippets/latex/table.tex
    command! TexEqn        :-1read $HOME/.config/nvim/snippets/latex/eqn.tex
    command! TexSubEqns    :-1read $HOME/.config/nvim/snippets/latex/subeqns.tex
    command! TexMultEqn    :-1read $HOME/.config/nvim/snippets/latex/multeqn.tex
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
    "
" coc.nvim {{{
    let g:coc_global_extensions = [
      \ 'coc-pairs',
      \ 'coc-json', 
      \ 'coc-yank',
      \ 'coc-xml',
      \ 'coc-vimtex',
      \ 'coc-vimlsp',
      \ 'coc-tag',
      \ 'coc-syntax',
      \ 'coc-git',
      \ 'coc-sh',
      \ 'coc-python',
      \ 'coc-markmap',
      \ 'coc-markdownlint',
      \ 'coc-highlight',
      \ 'coc-gitignore',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-html',
      \ 'coc-docker',
      \ 'coc-css',
      \ 'coc-cmake',
      \ 'coc-clangd',
      \ 'coc-bibtex',
      \ 'coc-yaml'
      \ ]
      " \ 'coc-tabnine',
      " \ 'coc-spell-checker',
      " \ 'coc-explorer',
    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    " set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  "}}}
  "
"   }}}

"Auto commands{{{
autocmd FileType tex :setlocal spell
autocmd FileType cpp :set tags+=~/.config/nvim/tags/ros_all
"}}}

" TODO
" Functions {{{
" See Max Cantor dotfiles https://github.com/mcantor/dotfiles/tree/master/vim
"function! RosPublisher(name_pub, msg_type, topic)
" }}}
