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
" Plug 'morhetz/gruvbox'
" Plug 'crusoexia/vim-dracula'
" Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

" Webdev Plugs
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Rainbow Parenthesis
Plug 'junegunn/rainbow_parentheses.vim'

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
" colorscheme dracula

" colorscheme nightfly
" let g:nightflyTerminalColors = 0
" let g:moonflyCursorColor = 1
" let g:moonflyTerminalColors = 1
" let g:moonflyUnderlineMatchParen = 1
" let g:moonflyUndercurls = 1
" let g:moonflyItalics = 1

" let g:dracula_italic = 1

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

