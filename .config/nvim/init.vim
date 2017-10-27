" vim: fdm=marker foldenable sw=4 ts=4  
" Manuel Castillo .vimrc File
" "zo" to open folds, "zc" to close, "za" to toggle "zn" to disable.


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
Plug 'taketwo/vim-ros'
Plug 'flazz/vim-colorschemes'
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
"   }}}

"   {{{     Options 
    
"    set nocompatible
"    syntax enable
"    filetype plugin on
    set path+=**
    set wildmode=full
    set wildmenu
    set encoding=utf-8
    "set nospell
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
    " Spelling
    "set dictionary+=/usr/share/dict/words thesaurus+=$HOME/.thesaurus
    set background=dark

" Formatting
   set tabstop=2 shiftwidth=2 softtabstop=2
   set expandtab
" Start with everything folded
   set foldlevelstart=0
" use :retab to convert tabs into spaces
" Number lines (I have them in Airline)
    "set number
" Soft wrapping
    set wrap
    set linebreak
    set nolist
" Set system clipboard as default
    set clipboard=unnamedplus
" Avoid creating backup files (~file)    
    set nobackup
" Airline setup
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_theme='deus'
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
"
"" Custom Functions {{{
"
"" MySessionSave() {{{
"function! MySessionSave()
"    tabdo NERDTreeClose
"    mksession! .session.vim
"    qall!
"endfunction
"" }}}
"
"" MyStatusLine() {{{
"
"function! MyStatusLine()
"    let statusline = ""
"    " Filename (F -> full, f -> relative)
"    let statusline .= "%f"
"    " Buffer flags
"    let statusline .= "%( %h%1*%m%*%r%w%) "
"    " File format and type
"    let statusline .= "(%{&ff}%(\/%Y%))"
"    " Left/right separator
"    let statusline .= "%="
"    " Line & column
"    let statusline .= "(%l,%c%V) "
"    " Character under cursor (decimal)
"    let statusline .= "%03.3b "
"    " Character under cursor (hexadecimal)
"    let statusline .= "0x%02.2B "
"    " File progress
"    let statusline .= "| %P/%L"
"    return statusline
"endfunction
"
"" }}}
"
"" CleanupSassSource() {{{
"
"function! CleanupSassSource()
"  " All comma delimiters should have a following space
"  silent '<,'>s/,\([^\s]\)/, \1/ge
"  " All comma delimiters should have 1 and only 1 space
"  silent '<,'>s/,\s\{2,\}/, /ge
"endfunction
"
"" }}}
"
"" Miscellaneous {{{
"function! RSTHeader(chr)
"    " inserts an RST header without clobbering any registers
"    put =substitute(getline('.'), '.', a:chr, 'g')
"endfunction
"
"function! CurrLineLength()
"    return len(getline(line(".")))
"endfunction
"
"function! LineLength(row)
"    return len(getline(a:row))
"endfunction
"" }}}
"
"" Source/Header Swap {{{
"function! SourceHeaderSwap()
"    if expand('%:h') == 'content/ui'
"        execute ":edit mods/base/ui/".expand('%:t:r').".py"
"    elseif expand('%:h') == 'mods/base/ui'
"        execute ":edit content/ui/".expand('%:t:r').".html"
"    elseif expand('%:e') == 'h'
"        if filereadable(expand('%:r').".cpp")
"            execute ":edit ".expand('%:r').".cpp"
"        else
"            execute ":edit ".expand('%:r').".c"
"        endif
"    else
"        edit %<.h
"    endif
"endfunction
"" }}}
"
"" Syntax Info {{{
"function! GetSynInfo()
"    let stack = synstack(line("."), col("."))
"
"    let info = ""
"
"    for synid in reverse(stack)
"        if strlen(info)
"            let info .= " < "
"        endif
"
"        let syn = GetSynDict(synid)
"        let info .= GetSynInfoString(syn)
"    endfor
"
"    return info
"endfunction
"
"function! GetSynInfoString(syndict)
"    if a:syndict["syn"] != a:syndict["hi"]
"        let add_hi = a:syndict["hi"]." "
"    else
"        let add_hi = ""
"    endif
"
"    return a:syndict["syn"]." (".add_hi."fg=".a:syndict["fg"]." bg=".a:syndict["bg"].")"
"endfunction
"
"function! GetHereSynId(trans)
"    return synID(line("."), col("."), a:trans)
"endfunction
"
"function! GetSynDict(synid)
"    let hiid = synIDtrans(a:synid)
"
"    let syn = synIDattr(a:synid, "name")
"    let hi = synIDattr(hiid, "name")
"    let fg = synIDattr(hiid, "fg")
"    let bg = synIDattr(hiid, "bg")
"
"    return {"syn":syn, "hi":hi, "fg":fg, "bg":bg}
"endfunction
"" }}}
"
"" Screen Functions {{{
"let $SCREENSWAP = $HOME."/.screenquickswap"
"let $SCREENFILE = $HOME."/.screenquickfile"
"
"function! ScreenGet(targetpath, contents)
"    " XXX TODO follow symlinks on contents for files
"    call WriteTo(a:targetpath, a:contents)
"    call StripEmptyLines(a:targetpath) " this is necessary because the redir in WriteTo ALWAYS inserts a newline
"    call StripSubversionBupkus(a:targetpath) " this is necessary because the redir in WriteTo ALWAYS inserts a newline
"    call ScreenYank(a:targetpath)
"    redraw!
"endfunction
"
"function! WriteTo(targetpath, contents)
"    silent exec "redir! > ".a:targetpath."\|silent echo \"".escape(a:contents,'"')."\"\|redir END"
"endfunction
"
"function! StripEmptyLines(filepath)
"    " XXX TODO modify this to only strip the FIRST newline
"    silent exec "!sed -i '/^$/d' ".a:filepath
"endfunction
"
"function! StripSubversionBupkus(filepath)
"    silent exec "!sed -ri 's_(\.svn/text-base/|\.svn-base$)__g' ".a:filepath
"endfunction
"
"function! ScreenYank(filepath)
"    silent exec "!screen -S $STY -X readbuf '".a:filepath."'"
"endfunction
"" }}}
"
"" MyNext() and MyPrev(): Movement between tabs OR buffers {{{
"function! MyNext()
"    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
"        " Tab support && tabs open
"        normal gt
"    else
"        " No tab support, or no tabs open
"        execute ":bnext"
"    endif
"endfunction
"function! MyPrev()
"    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
"        " Tab support && tabs open
"        normal gT
"    else
"        " No tab support, or no tabs open
"        execute ":bprev"
"    endif
"endfunction
"" }}}
"
"" SwapSplitResizeShortcuts(): Resizing split windows {{{
"if !exists( 'g:resizeshortcuts' )
"    let g:resizeshortcuts = 'horizontal'
"    nnoremap _ <C-w>-
"    nnoremap + <C-w>+
"endif
"
"function! SwapSplitResizeShortcuts()
"    if g:resizeshortcuts == 'horizontal'
"        let g:resizeshortcuts = 'vertical'
"        nnoremap _ <C-w><
"        nnoremap + <C-w>>
"        echo "Vertical split-resizing shortcut mode."
"    else
"        let g:resizeshortcuts = 'horizontal'
"        nnoremap _ <C-w>-
"        nnoremap + <C-w>+
"        echo "Horizontal split-resizing shortcut mode."
"    endif
"endfunction
"" }}}
"
"" SwapBrowseMode(): Easy changing for scrolloff {{{
"if !exists( 'g:browsemode' )
"    let g:browsemode = 'nobrowse'
"    set sidescrolloff=0
"    set scrolloff=0
"endif
"
"function! SwapBrowseMode()
"    if g:browsemode == 'nobrowse'
"        let g:browsemode = 'browse'
"        set sidescrolloff=999
"        set scrolloff=999
"        echo "Browse mode enabled."
"    else
"        let g:browsemode = 'nobrowse'
"        set sidescrolloff=0
"        set scrolloff=0
"        echo "Browse mode disabled."
"    endif
"endfunction
"" }}}
"
"" VisualHTMLTagWrap(): Wraps visual selection in an HTML tag {{{
"function! VisualHTMLTagWrap()
"    let html_tag = input( "html_tag to wrap block: ")
"    let jumpright = 2 + strlen( html_tag )
"    normal `<
"    let init_line = line( "." )
"    exe "normal i<".html_tag.">"
"    normal `>
"    let end_line = line( "." )
"    " Don't jump if we're on a new line
"    if( init_line == end_line )
"        " Jump right to compensate for the characters we've added
"        exe "normal ".jumpright."l"
"    endif
"    exe "normal a</".html_tag.">"
"endfunction
"" }}}
"
"" QuickFunctionPrototype(): Quickly generate a function prototype. {{{
"function! QuickFunctionPrototype()
"    let function_name = input( "function name: ")
"    if &ft == "php"
"        " The extra a\<BS> startinsert! is because this function drops
"        " out of insert mode when it finishes running, and startinsert
"        " ignores auto-indenting.
"        exe "normal ofunction ".function_name."(){\<CR>}\<ESC>Oa\<BS>"
"        startinsert!
"    else
"        echo "Filetype not supported."
"    endif
"endfunction
"" }}}
"
"" WordProcessingToggle() {{{
"function! WordProcessingToggle()
"    if !exists('b:wordprocessing') || b:wordprocessing
"        let b:wordprocessing = 'true'
"        setlocal wrap linebreak nolist
"        setlocal textwidth=0
"        echo "Word processing mode enabled."
"    else
"        let b:wordprocessing = 'false'
"        setlocal nowrap nolinebreak list
"        setlocal textwidth=80
"        echo "Word processing mode disabled."
"    endif
"endfunction
"" }}}
"
"" NotepadLineToggle(): For Notepad-like handling of wrapped lines {{{
"function! NotepadLineToggle()
"    if !exists('b:notepadlines') || b:notepadlines
"        nnoremap <buffer> j gj
"        nnoremap <buffer> k gk
"        let b:notepadlines = 'true'
"        setlocal wrap
"        echo "Notepad wrapped lines enabled."
"    else
"        unmap <buffer> j
"        unmap <buffer> k
"        let b:notepadlines = 'false'
"        setlocal nowrap
"        echo "Notepad wrapped lines disabled."
"    endif
"endfunction
"" }}}
"
"" Tasksheets {{{
"
"function! UpdateTaskRemain(line_no, remain, hours_worked)
"    let l:check_line = a:line_no
"    let l:last_line = line('$')
"    let l:already_has_summary = 0
"
"    " echo "update " . a:line_no . " remaining: " . string(a:remain) . " with worked: " . string(a:hours_worked)
"
"    while l:check_line <= l:last_line
"        if getline(l:check_line + 1) == ""
"            " last line before empty (end of task clause)
"            break
"        endif
"        let l:check_line += 1
"    endwhile
"
"    let l:line = getline(l:check_line)
"
"    if l:line =~ "^REMAIN" || l:line =~ "^TOTAL"
"        let l:already_has_summary = 1
"    endif
"
"    let l:total = "TOTAL: " . string(a:hours_worked)
"
"    if a:remain > 0.0
"        let l:new_summary = "REMAIN: " . string(a:remain) . " (" . l:total . ")"
"    else
"        let l:new_summary = l:total
"    endif
"
"    if l:already_has_summary
"        call setline(l:check_line, l:new_summary)
"    else
"        call append(l:check_line, l:new_summary)
"    endif
"endfunction
"
"function! UpdateTaskDisplay()
"    if &ft != 'tasksheet' | return | endif
"    let l:default_project = substitute(system("python custom_calc_timesheet.py " . expand("%") . " default_project"), '\n', '', '')
"    let l:tasks = split(system("python custom_calc_timesheet.py " . expand("%") . " exhaust"), '\n')
"
"    exe "normal mz"
"
"    syn clear taskBudgetExceeded
"    syn clear taskBudgetExhausted
"
"    for l:task in l:tasks
"        let [l:task_id, l:project, l:remain, l:hours_worked] = split(l:task, " ")
"
"        if str2float(l:remain) < 0.0
"            exe "syn match taskBudgetExceeded /" . l:task_id . "/ contained"
"        elseif str2float(l:remain) == 0.0
"            exe "syn match taskBudgetExhausted /" . l:task_id . "/ contained"
"        endif
"
"        if l:project == l:default_project
"            let l:default_project_pattern = "\\[" . l:project . "\\]"
"            let l:anything_else_pattern = "[^\\[]"
"            let l:project_pattern = "\\(" . l:default_project_pattern . "\\|" . l:anything_else_pattern . "\\)"
"        else
"            let l:project_pattern = "\\[" . l:project . "\\]"
"        endif
"
"        exe "g/^" . l:task_id . " " . l:project_pattern . "/call UpdateTaskRemain(line('.'), " . l:remain . ", " . l:hours_worked . ")"
"    endfor
"
"    exe "normal `z"
"endfunction
"
"" do this so it's called after everything is cleared by `syntax enable` when
"" re-sourcing .vimrc
"call UpdateTaskDisplay()
"
"" }}}
"
"" {{{ Sane Pasting
"
"function! SmartPaste()
"    setl paste
"    normal "+p
"    setl nopaste
"endfunction
"
"" }}}
"
"function! ExtendRight()
"    let l:start=winnr()
"    exe "normal \<c-w>l"
"    let l:shrink=bufnr('%')
"    close
"    exe "normal " . l:start . "\<c-w>w"
"    exe "normal \<c-w>k"
"    vsplit
"    exe "b " . l:shrink
"endfunction
"
"" }}}
"
"" Local Settings {{{
"
""if filereadable($HOME."/.local/vim/.vimrc")
""    source $HOME/.local/vim/.vimrc
""endif
"
""set exrc
"set secure
"
"" }}}

hi Folded ctermbg=NONE ctermfg=Blue  cterm=bold
"hi Visual cterm=reverse,bold 
hi Visual cterm=bold ctermfg=Black ctermbg=Blue

" Color scheme
" color molokai
" Make the modification indicator [+] white on red background
"au ColorScheme * hi User1 gui=bold term=bold cterm=bold guifg=white guibg=red ctermfg=white ctermbg=red

" Tweak the color of the fold display column
"au ColorScheme * hi FoldColumn cterm=bold ctermbg=233 ctermfg=146
