" Thad Sauter vim config

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tonchis/vim-to-github'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
" Text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-line'

" Colorschemes
Plug 'rainglow/vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax highlighting
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'kchmck/vim-coffee-script'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'slim-template/vim-slim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Key mappings
inoremap jj <esc>
map <C-nn> :bn<CR>
let mapleader=" "

" Remap markdown key
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-u>'

" Color theme
syntax enable
set background=dark
" colorscheme vim-monokai-tasty
syntax on
" colorscheme dracula
" set laststatus=2
let g:rehash256 = 1

" Something something italics
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
hi htmlArg cterm=italic
hi Comment cterm=italic
" hi Function cterm=italic

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

" Set NERDTree colors
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
set showtabline=0
set nowrap
set expandtab
set number
set relativenumber
autocmd FileType python set softtabstop=2
set hidden

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
nmap <M-s> :w<kEnter>

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
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop']}

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

" don't use binstubs for running tests
let test#ruby#use_binstubs = 0

" Text object dependencies
runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

" Treat hypenated words as one word object
set iskeyword+=-

" Coc auto-completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph']

hi SpellCap ctermbg=12 gui=undercurl guisp=Blue ctermfg=white
