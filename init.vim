call plug#begin("~/.vim/plugged")
  " Theme 
  Plug 'dracula/vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'sirver/ultisnips'
  Plug 'morhetz/gruvbox'
  Plug 'tomtom/tcomment_vim'
  Plug 'honza/vim-snippets'
  Plug 'posva/vim-vue'  " Vue JS syntax highlighting
  " Plug 'scrooloose/nerdcommenter'  " NERD commenter. Quickly comment lines
	Plug 'preservim/nerdcommenter' 
  Plug 'Xuyuanp/nerdtree-git-plugin'                          " show git status in file tree view
  Plug 'itchyny/lightline.vim'                                " better look of vim status line
  Plug 'ap/vim-buftabline'                                    " buffers to tabline, shows buffers as tabs on top of window
  Plug 'tomasr/molokai'                                       " sublime theme
  Plug 'dunstontc/vim-vscode-theme'                           " vscode theme
  Plug 'equalsraf/neovim-gui-shim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Soares/base16.nvim'
  Plug 'chriskempson/base16-vim'
	" File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
	" Plug 'valloric/youcompleteme'
  " File Search
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf.vim'
  Plug 'ervandew/supertab'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors

endif



" let base16colorspace=256

set hidden

" switch buffers
nnoremap <A-2> :bnext<CR>
nnoremap <A-1> :bprev<CR>

" search text in files
nmap <D-F> :Ag

set tabstop=2
set shiftwidth=2
set expandtab
" inoremap <silent<expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" emmet.includeLanguages = {"vue-html": "html", "javascript": "javascriptreact"}

let g:ackprg = 'ag --nogroup --nocolor --column'


set number

" Theme
syntax enable
" colorscheme molokai " gruvbox  | dracula
" if g:colors_name == "gruvbox"
" highlight Normal ctermbg=16 guibg=#18191a
" List other overrides here
" endif

set cursorline  
set cursorcolumn 


set showmatch
hi MatchParen cterm=none ctermbg=green ctermfg=blue
" set background=dark
" let base16colorspace=256
colorscheme base16-tomorrow-night

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

set encoding=UTF-8

set guifont=Fira\ Code:h11

"if exists("g:loaded_webdevicons")
"  call webdevicons#refresh()
"endif

" let g:coc_node_path='/usr/bin/node'


" set guifont=FiraCode:10
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
"function! OpenTerminal()
"  split term://bash
"  resize 10
"endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END




let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
