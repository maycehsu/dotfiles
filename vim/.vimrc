set nu
set tabstop=4
set shiftwidth=4

" Color configuration
set t_Co=256
colorscheme torte
set cursorline
set hlsearch
set incsearch
set cindent
hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
hi Search cterm=reverse ctermbg=none ctermfg=none
set ignorecase

set statusline=[%{expand('%:p')}][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]
set laststatus=2
set conceallevel=3
syntax on


hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
" hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLineNr cterm=none ctermfg=DarkMagenta ctermbg=White

nnoremap <silent> <F8> :TlistToggle<CR>

set rtp+=~/.fzf

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf/fzf-history'



set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'gnattishness/cscope_maps'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'iberianpig/tig-explorer.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'wookayin/fzf-ripgrep.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required


let g:NERDTreeWinSize=60
let g:NERDTreeGitStatusUseNerdFonts = 1 


function IsBinary()
	if (&binary == 0)
		return ""
	else
		return "[Binary]"
	endif
endfunction

function FileSize()
	let bytes = getfsize(expand("%:p"))
	if bytes <= 0
		return "[Empty]"
	endif
	if bytes < 1024
		return "[" . bytes . "B]"
	elseif bytes < 1048576
		return "[" . (bytes / 1024) . "KB]"
	else
		return "[" . (bytes / 1048576) . "MB]"
	endif
endfunction
nmap <C-b>n :bnext<CR>
nmap <C-b>p :bprev<CR>
nnoremap <silent> <F1> :FZF<CR>
nnoremap <silent> <F2> :Buffers<CR>
nnoremap <silent> <F3> :cw<CR>
nnoremap <silent> <F4> :ccl<CR>
nnoremap <silent> <F9> :History<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F10> :tabe<CR>
nnoremap <silent> <F11> :tabp<CR>
nnoremap <silent> <F12> :tabn<CR>
nnoremap <silent> - :NERDTreeToggle<CR>
nnoremap <silent> _ :NERDTreeFind<CR>

map <C-n> <Esc>:tabnew %<CR>
" autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0
set diffopt+=vertical
set foldmethod=syntax


if has("multi_byte")
	set encoding=utf8
endif
set fileencodings=ucs-bom,gb18030,utf-8,default


"function! LoadCscope()
"	let db = findfile("cscope.out", ".;")
"	if (!empty(db))
"		let path = strpart(db, 0, match(db, "/cscope.out$"))
"		set nocscopeverbose " suppress 'duplicate connection' error
"		exe "cs add " . db . " " . path
"		set cscopeverbose
	"else add the database pointed to by environment variable 
"	elseif $CSCOPE_DB != "" 
"		cs add $CSCOPE_DB
"	endif
"endfunction
"au BufEnter /* call LoadCscope()

