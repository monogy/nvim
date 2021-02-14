" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
",F2：添加/更新文件头
",F3：文件树
",F4：TagList
",F5：程序运行
",F6：文件检查并保存
",F7：注释/反注释
"-/+: 使用此对新窗口的命令上/下移动

" === Auto load for first time uses
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
	" silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				" \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
"
""
"
" === System
let &t_ut=''
set autochdir
" 环境颜色
set t_Co=256     "终端开启256色支持"
" let g:molokai_original = 1
let g:rehash256 = 1
"
" 背景透明设置
" 使用此皮肤时，将不会透明
colorscheme molokai
" 打开此命令，同时关闭colorscheme时，将启动透明
hi Normal ctermfg=252 ctermbg=none

" === Eset noexpandtab
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set ruler
set cmdheight=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set modifiable
set scrolloff=4
set timeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set autoread
set autowriteall
""set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set viewdir=~/.config/nvim/view
au BufWinLeave *.* silent mkview
"au BufWinEnter *.* silent loadview
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
"set autowrite
""set shortmess+=c
syntax on
filetype plugin indent on
"set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
" if has("vms")
      " set nobackup " do not keep a backup file, use versions instead
" else
      " set backup " keep a backup file
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

set colorcolumn=0
set laststatus=2 "1为关闭底部状态栏 2为开启"

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set ambiwidth=double
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 记录光标位置
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" === Terminal Behavior
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
""let g:terminal_color_0   = '#000000'
""let g:terminal_color_1   = '#FF5555'
""let g:terminal_color_2   = '#50FA7B'
""let g:terminal_color_3   = '#F1FA8C'
""let g:terminal_color_4   = '#BD93F9'
""let g:terminal_color_5   = '#FF79C6'
""let g:terminal_color_6   = '#8BE9FD'
""let g:terminal_color_7   = '#BFBFBF'
""let g:terminal_color_8   = '#4D4D4D'
""let g:terminal_color_9   = '#FF6E67'
""let g:terminal_color_10  = '#5AF78E'
""let g:terminal_color_11  = '#F4F99D'
""let g:terminal_color_12  = '#CAA9FA'
""let g:terminal_color_13  = '#FF92D0'
""let g:terminal_color_14  = '#9AEDFE'

" === Basic Mappings
let mapleader=" "
noremap ; :

" 打开插件管理
noremap <LEADER>pi :PlugInstall<CR>
noremap <LEADER>pu :PlugUpdate<CR>
noremap <LEADER>pc :PlugClean<CR>

" Save & quit
noremap <silent>Q :q!<CR>
noremap <silent><C-s> :w<CR>
noremap <silent>zz :wq<CR>

noremap <C-u> <C-z>
noremap <C-z> u
"
" make Y to copy till the end of the line
noremap Y y$

" Copy to system clipboard
vnoremap Y "+y
"
" Indentation
nnoremap < <<
nnoremap > >>

" Open up lazygit
noremap \t :term<CR>
" exit the terminal
" <Ctrl>n

" 全选
noremap <silent><C-a> ggVG

" 插入新行
nnoremap <silent><LEADER><CR> i<CR><ESC>i

" === Cursor Movement
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v
noremap <silent> i k
noremap <silent> j h
noremap <silent> k j
noremap <silent> l l

" I/J/K/L keys for 5 times i/j/k/l (faster navigation)
noremap <silent> I 5k
noremap <silent> K 5j
noremap <silent> L 5l
noremap <silent> J 5h

" b key: go to the start of the line
noremap <silent> b ^
" B key: go to the end of the line
noremap <silent> B $

" i-->h插入命令
noremap h i
noremap H I

" Ctrl+I/K noremap <C-y> <C-e>
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>

" === noremap <LEADER>e <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap u <nop>
noremap s <nop>
noremap S <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
"
noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
" noremap sh <C-w>t<C-w>K
" Place the two screens side by side
" noremap sv <C-w>t<C-w>H

" Rotate screens
" noremap srh <C-w>b<C-w>K
" noremap srv <C-w>b<C-w>H

" === Other useful stuff
" \p to show the current buffer file path
" nnoremap \p 1<C-G>

" Auto change directory to current dir
" autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" noremap tx :r !figlet

" noremap <LEADER>- :lN<CR>
" noremap <LEADER>= :lne<CR>

" find and replace
" noremap \s :%s//g<left><left>

" Compile function
noremap <silent><F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		" :res -15
		:term ./%<
	" elseif &filetype == 'java'
		" exec "!javac %"
		" exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	" elseif &filetype == 'tex'
		" silent! exec "VimtexStop"
		" silent! exec "VimtexCompile"
	" elseif &filetype == 'dart'
		" exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		" silent! exec "CocCommand flutter.dev.openDevLog"
	" elseif &filetype == 'javascript'
		" set splitbelow
		" :sp
		" :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	" elseif &filetype == 'go'
		" set splitbelow
		" :sp
		" :term go run .
	endif
endfunc

" === Install Plugins with Vim-Plug
call plug#begin('~/.config/nvim/plugged')

" 文件树
" if has('nvim')
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" else
	" Plug 'Shougo/defx.nvim'
	" Plug 'roxma/nvim-yarp'
	" Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'kristijanhusak/defx-icons'

"文件搜索
Plug 'junegunn/fzf', {'dir': '~/.config/nvim/fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" 文件管理器
Plug 'francoiscabrol/ranger.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 程序调试
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
" Plug 'puremourning/vimspector'"
"python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" 多光标操作
Plug 'terryma/vim-multiple-cursors'

" 复制可视化
Plug 'junegunn/vim-peekaboo'

" "注释&反注释
Plug 'scrooloose/nerdcommenter' " in <space>cn/<space>cu to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch

"文本对齐
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =

Plug 'jiangmiao/auto-pairs'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Markdown
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'CarryHJR/vim-instant-markdown-plus', {'for': 'markdown', 'do': 'npm install -g instant-markdown-d'}
" Plug 'dkarter/bullets.vim'

" git
" Plug 'airblade/vim-gitgutter'
" Plug 'kdheepak/lazygit.nvim'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

"启动界面
Plug 'mhinz/vim-startify'

" vim-airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"彩虹括号
Plug 'luochen1990/rainbow'
"indentLine 缩进显示
Plug 'Yggdroot/indentLine'

" Formatter
Plug 'Chiel92/vim-autoformat'

" 图标
Plug 'ryanoasis/vim-devicons'

" 颜色管理
Plug 'flazz/vim-colorschemes'

call plug#end()
"================================================
set regexpengine=1
" set encoding=UTF-8

" === Dress up my vim
set termguicolors	" enable true colors support
hi NonText ctermfg=gray guifg=grey10

" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ===================== Start of Plugin Settings =====================
" === coc
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
""let g:coc_global_extensions = ['coc-python',  'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-pyright', 'coc-emmet', 'coc-snippets', 'coc-ecdict']
" let g:coc_node_path = '/usr/local/node-v12.14.1-linux-arm64/bin/node'
let g:coc_global_extensions = [
			\'coc-yank', 
			\'coc-clangd', 
			\'coc-python', 
			\'coc-lists', 
			\'coc-pyright', 
			\'coc-html', 
			\'coc-stylelint', 
			\'coc-snippets', 
			\'coc-highlight']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~# '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Useful commands
nnoremap <silent>cy :<C-u>CocList -A --normal yank<cr>
nmap <silent>cd <Plug>(coc-definition)
nmap <silent>ct <Plug>(coc-type-definition)
nmap <silent>ci <Plug>(coc-implementation)
nmap <silent>cr <Plug>(coc-references)
nmap <LEADER>rc <plug>(coc-cursors-word)
nmap <LEADER>rw :CocCommand document.renameCurrentWord<CR>
nmap <LEADER>rn <Plug>(coc-rename)
nmap <LEADER>rf <plug>(coc-refactor)
nnoremap <c-c> :CocCommand<CR>
nnoremap <silent>cs :CocCommand snippets.editSnippets<CR>
" nmap ts <Plug>(coc-translator-p)
"nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" set nobackup
" set nowritebackup
set signcolumn=yes
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use <C-l> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-m> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-m>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-l>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" === some error checking
let g:ale_linters = {
			\ 'c++'    : ['clang'],
			\ 'c'      : ['clang'],
			\ 'python' : ['Pyright']
			\}
			" \ 'python' : ['pylint']
" let g:ale_cpp_ccls_init_options = {
" \   'cache': {
" \       'directory': '/tmp/ccls/cache'
" \   }
" \ }
"
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights     = 0
"自定义图标
let g:ale_sign_error        = '✗'
let g:ale_sign_warning      = '⚡'
" let g:ale_statusline_format = ['✗: %d', '⚡': %d', '✔︎: OK']
"显示Linter名称，出错或警告等相关信息
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
" let g:airline#extensions#ale#enable = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" === Python-syntax
let g:python_highlight_all = 1
let g:python_slow_sync     = 0

"bash-language-server
let g:LanguageClient_serverCommands = {
		\ 'sh': ['bash-language-server', 'start']
		\ }

" === FZF
noremap FF :Files 
noremap FB :Buffers  
noremap FH :History:<CR>
noremap FM :Maps<CR>
let g:fzf_preview_window = 'right:80%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)

" === far.vim
noremap <LEADER>f :Far  %<left><left>
noremap <LEADER>d :Fardo<CR>


"auto-format
" noremap <silent><F6> :Autoformat<CR>:w<CR>
noremap <silent><F6> :Autoformat<CR>
let g:autoformat_verbosemode=1
let g:formatter_yapf_style = 'pep8'


" Tabular
noremap . :Tab /

" " == vim-multiple-cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<a-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<a-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" === Vista.vim
noremap <silent><F4> :Vista!!<CR>
noremap <silent><C-t> :Vista finder<CR>
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent          = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive    = 'ctags'
let g:vista_fzf_preview          = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'method' ] ]
			\ },
			\ 'component_function': {
			\   'method': 'NearestMethodOrFunction'
			\ },
			\ }

" === Ranger.vim
nnoremap R :Ranger<CR>
let g:ranger_map_keys = 0

" === Colorizer
let g:colorizer_syntax = 1

" 文件树配置
nmap <silent><F3> :Defx<CR>
autocmd FileType defx call s:defx_mappings()
call defx#custom#option('_', {
			\ 'winwidth': 20,
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 0,
			\ 'buffer_name': '',
			\ 'toggle': 1,
			\ 'resume': 1
			\ })
function! s:defx_mappings() abort
	nnoremap <silent><buffer><expr> o     <SID>defx_toggle_tree()                    " 打开或关闭文件/文件夹
	nnoremap <silent><buffer><expr> h     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
	nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction


" ===
" === vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
noremap <leader>vr :VimspectorRestart<CR>

sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" 快捷键
nmap fc <Plug>VimspectorContinue
nmap fs <Plug>VimspectorStop
nmap fr <Plug>VimspectorRestart
nmap fp <Plug>VimspectorPause
nmap fb <Plug>VimspectorToggleBreakpoint
nmap fg <Plug>VimspectorToggleBreakpoint( { trigger expr, hit count expr } )
nmap fa <Plug>VimspectorAddFunctionBreakpoint( '<cexpr>' )
nmap ft <Plug>VimspectorRunToCursor
nmap fv <Plug>VimspectorStepOver
nmap fi <Plug>VimspectorInto
nmap fo <Plug>VimspectorStepOut


" Nerd-Commenter
let g:NERDSpaceDelims=1 "注释后自动添加一个空格
"注释/反注释
map  <silent><F7> <plug>NERDCommenterToggle

"air-line配置
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep       = '▶'
let g:airline_left_alt_sep   = '❯'
let g:airline_right_sep      = '◀'
let g:airline_right_alt_sep  = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1
" 打开后，tabline和tmuxline都可以得到增强
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep       = ' '
let g:airline#extensions#tabline#left_alt_sep   = '|'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter   = 'default'
let g:airline#extensions#vimtex#left         = " "
let g:airline#extensions#vimtex#right        = " "
" sa sd sc：左移、右移、关闭buffer
noremap <silent>sd :bn<CR>
noremap <silent>sa :bp<CR>
noremap <silent>sc :bd<CR>

let g:airline#extensions#whitespace#enabled=1
let g:airline_theme='molokai'

" let g:airline_theme='molokai'
" colorscheme molokai
" let g:molokai_original = 1

" rainbow 彩虹括号
let g:rainbow_active = 1

" IndentLines
noremap  <silent><LEADER>il :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" 中英文输入法切换
let g:input_toggle = 1
function! Fcitx2en()
	let s:input_status = system("fcitx-remote")
	if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx-remote -c")
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx-remote -o")
		let g:input_toggle = 0
	endif
endfunction

" autocmd InsertLeave * call Fcitx2zh()
autocmd InsertLeave * call Fcitx2en()


" 使用F2键调用函数AddAuthor
map <silent><F2> :call AddAuthor()<cr>
autocmd BufNewFile *.sh,*.py,*.c,*.cpp,*.h call AddAuthor()
autocmd BufNewFile *.h call Loading_Message_H()
autocmd BufNewFile *.cpp call Loading_Message_Cpp()
autocmd BufNewFile *.n call Loading_Message_Note()

function AddAuthor()
	let n=1
	while n < 8
		let line = getline(n)
		if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
		call AddTitleForT()
endfunction

" 文件头信息写入--用于#、/**/注释的脚本
function AddTitleForT()
	if &filetype == 'sh'
		call append(0,"#!/bin/bash")
	elseif &filetype == 'python'
		call append(0,"#!/usr/bin/env python")
	else
		call append(0,"/*")
	endif
	call append(1,"# _*_ coding:utf-8 _*_")
	call append(2,"# **********************************************************")
	call append(3,"# * Author        : 李阳")
	call append(4,"# * Email         : monogy@163.com")
	call append(5,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
	call append(6,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
	call append(7,"# * Filename      : ".expand("%:t"))
	call append(8,"# * Description   :")
	call append(9,"# *********************************************************/")
	call append(10,"")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

function UpdateTitle()
	execute '/* Last modified\s* :/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
	execute '/* Filename      :/s@:.*$@\=": ".expand("%:t")@'
	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

" .h文件自动添加
function Loading_Message_H()
	let fileName = expand("%:t:r")
	call append(11, "#pragma once")
	call append(12, "")
	call append(13, "class ".fileName)
	call append(14,"{")
	call append(15, "  public:")
	call append(16, "")
	call append(17, "};")
	call append(18,"")
	echohl WarningMsg | echo "Successful in adding the .h header." | echohl None
endfunction

" .cpp文件自动添加
function Loading_Message_Cpp()
		let fileName = expand("%:t:r")
		call append(11, '#include "'.fileName.'.h"')
		call append(12, '#include <iostream>')
		call append(13, '#include <map>')
		call append(14, '#include <set>')
		call append(15, '#include <vector>')
		call append(16, '#include <queue>')
		call append(17, '#include <stack>')
		call append(18, '#include <string>')
		call append(19, '#include <algorithm>')
		call append(20, '#include <string>')
		call append(21, 'using namespace std;')
		call append(22, "")
		call append(23, "int main (){")
		call append(24, " ")
		call append(25, "	return 0;")
		call append(26, "}")
		call append(27, "")
	echohl WarningMsg | echo "Successful in adding the .cpp header." | echohl None
endfunction

" .n文件自动添加
function Loading_Message_Note()
	call append(0,"# _*_ coding:utf-8 _*_")
	call append(1,"# **********************************************************")
	call append(2,"# * Author        : 李阳")
	call append(3,"# * Email         : monogy@163.com")
	call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
	call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
	call append(6,"# * Filename      : ".expand("%:t"))
	call append(7,"# * Description   : ".expand("日记"))
	call append(8,"# *********************************************************/")
	call append(9,"")
	echohl WarningMsg | echo "Successful in adding the .cpp header." | echohl None
endfunction

" 悬浮窗口
 " let buf = nvim_create_buf(v:false, v:true)
		" call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
		" let opts = {'relative': 'cursor', 'width': 10, 'height': 2, 'col': 0,
				" \ 'row': 1, 'anchor': 'NW'}
		" let win = nvim_open_win(buf, 0, opts)
		" " optional: change highlight, otherwise Pmenu is used
		" call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
		"
		"

" ===
" === vim-instant-markdown
" ===
filetype plugin on
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
" let g:bullets_enabled_file_types = [
			" \ 'markdown',
			" \ 'text',
			" \ 'gitcommit',
			" \ 'scratch'
			" \]

" ===
" === lazygit.nvim
" ===
" noremap <c-g> :LazyGit<CR>
" let g:lazygit_floating_window_winblend = 0 " transparency of floating window
" let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
" let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
" let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===================== End of Plugin Settings =====================

" === Necessary Commands to Execute
exec "nohlsearch"

let g:pymode_rope=0

if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

" Bookmarks
" mx       : 添加标签
" dmx      : 删除特定标签
" m<space> : 删除全部标签
" ''x      : 跳到指定标签
"
"
" 保存root权限的文件
nnoremap <silent>ws :w !sudo tee %<cr>

" 打开init文件
nnoremap <silent>\i :tabnew ~/.config/nvim/init.vim<cr>

" 取消高亮
noremap <silent><leader>/ :noh<cr>

noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


