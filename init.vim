" Basic setup
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set number
set relativenumber
set nowrap
set encoding=UTF-8
set completeopt=longest,menuone

" Plugins:
" --------
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-dracula'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" NERDTREE CONFIG:
" ---------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" AUTO AND FORMAT IMPORT:
" -----------------------
let g:go_fmt_command = 'goimports'
let g:rustfmt_autosave = 1

" DEOPLETE:
" ---------
let g:deoplete#enable_at_startup = 1

" COLOR SCHEME:
" --------
" colorscheme gruvbox
colorscheme dracula
let g:dracula_italic = 1

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline


" SHORTCUTS:
" ----------
inoremap <C-space> <C-x><C-o>

" ALE:
" ----
let g:ale_linters = {'rust': ['rustc', 'rls']}
let g:ale_rust_cargo_use_check = 1
