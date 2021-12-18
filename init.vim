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
set termguicolors

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
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'

" Webdev Plugs
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Rainbow Parenthesis
Plug 'junegunn/rainbow_parentheses.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Svelte Syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

" NERDTREE CONFIG:
" ---------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" AUTO FORMAT AND IMPORT:
" -----------------------
let g:go_fmt_command = 'goimports'
let g:rustfmt_autosave = 1

" DEOPLETE:
" ---------
let g:deoplete#enable_at_startup = 1
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:python_host_prog = ''
let g:python3_host_prog = '/data/data/com.termux/files/usr/bin/python3'

" COLOR SCHEME:
" --------
colorscheme nightfly
let g:nightflyTerminalColors = 1

" Airline:
" --------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='dark'
let g:airline_mode_map = {
    \ 'c': 'C',
    \ 'n': 'N',
    \ 'V': 'V',
    \ 'i':'I'}
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" SYNTAX HIGHLIGHTING:
"--------------------
" - Syntax For go:
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

syntax on

" HIGHLIGHTING:
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

" WebDev:
" -------
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Graphql:
" --------
au BufNewFile,BufRead *.prisma setfiletype graphql
let g:graphql_javascript_tags = ["gql", "graphql", "Relay.QL"]

" Color Braces:
" -------------
au VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

" Svelte Config:
" --------------
let g:svelte_preprocessors = ['typescript']

