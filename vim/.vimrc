" --- Neovim turns these on by default, Vim does not ---
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set autoindent
set incsearch hlsearch
set wildmenu
set laststatus=2
set ruler
silent! syntax on
silent! filetype plugin indent on

" --- From options.lua ---
set number relativenumber
set ignorecase smartcase
set tabstop=4 shiftwidth=4 expandtab
set scrolloff=8
set splitright splitbelow
set updatetime=250
set confirm
set fileformats=unix,dos
silent! set cursorline
silent! set breakindent
silent! set signcolumn=yes
silent! set foldlevel=99 foldlevelstart=99

" Everything below needs a Vim built with +eval.
" Minimal builds (vim-tiny) skip this whole block instead of erroring.
if 1
  let mapleader = " "
  let maplocalleader = " "

  " Persistent undo. Vim needs the folder to exist, Neovim creates its own.
  if has('persistent_undo')
    let &undodir = expand('~/.vim/undo')
    if !isdirectory(&undodir)
      call mkdir(&undodir, 'p', 0700)
    endif
    set undofile
  endif

  " ripgrep for :grep, only where it is installed
  if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
    set grepformat=%f:%l:%c:%m
  endif

  " System clipboard, only if this Vim was built with clipboard support
  if has('unnamedplus')
    set clipboard=unnamedplus
  elseif has('clipboard')
    set clipboard=unnamed
  endif

  " --- From keymaps.lua ---
  " Clear search highlight. Ctrl+L instead of Esc: mapping Esc in terminal
  " Vim interferes with arrow keys and other escape sequences.
  nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

  if has('terminal')
    tnoremap <Esc><Esc> <C-\><C-n>
  endif

  " A built-in dark colourscheme (Vim 9+), ignored on older versions
  silent! colorscheme slate
endif
