" Thad Sauter vim config

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dadbod'

" Colorschemes
Plug 'rainglow/vim'
Plug 'patstockwell/vim-monokai-tasty'

" Syntax highlighting
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'Quramy/tsuquyomi'
call plug#end()

" Key mappings
inoremap jj <esc>
map <C-nn> :bn<CR>
let mapleader=" "

" Color theme
syntax enable
set background=dark
colorscheme vim-monokai-tasty
let g:rehash256 = 1

" Colors for vim 8
if (has("termguicolor"))
  set termguicolors
endif

" Enable filetype plugins
filetype plugin on

" NERDtree config
let g:NERDTreeNodeDelimiter = "\u00a0"
set encoding=utf-8
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeLimitedSyntax = 1
map <C-e> :NERDTreeToggle <CR>
let nerdtreequitonopen = 1
autocmd stdinreadpre * let s:std_in=1
let NERDTreeChDirMode=0

" NERDTree colors
hi Directory guifg=#FF0000 ctermfg=white
hi NERDTreeCWD ctermfg=white
hi NERDTreeDirSlash ctermfg=grey

" After a re-source, fix syntax matching issues (concealing brackets): 
if exists('g:loaded_webdevicons') 
  call webdevicons#refresh() 
endif

set backspace=indent,eol,start " Make backspace behave like most editors
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set expandtab
set number
set relativenumber
autocmd FileType python set softtabstop=2
set hidden
set showtabline=2
set lcs+=space:· " Show spaces as dots

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Visual studio code-like bindings
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :GGrep<CR>
nmap <C-m> gcc
xmap <C-m> gc
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Fzf config
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0]  }, <bang>0)
let $FZF_DEFAULT_COMMAND = 'rg --hidden --ignore .git -l -g ""'

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Enable linting
let g:ale_linters = {'javscript': ['eslint'], 'ruby': ['rubocop']}

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
  let buf = bufnr("%")
  if exists("w:SavedBufView") &&has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff 
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction
          
" When switching buffers, preserve window view.
if v:version >= 700
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
endif                                                                 "

" Copy to clipboard as well
set clipboard=unnamed

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
