" Change viminfo default dir
set viminfo+=n~/.cache/nvim/viminfo

set nocompatible
filetype plugin on
syntax on

set guicursor=
set noshowmatch
set relativenumber
set hlsearch
set hidden
set noerrorbells
" set wrap linebreak
set tabstop=4 softtabstop=4
set shiftwidth=4
" Convert tab to space
" set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set splitbelow splitright
set cursorline
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
set cursorcolumn
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b
" Set 100 characters limit
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
" set mouse=a

" Init
let loaded_matchparen = 1
let mapleader = " "
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:python3_host_prog = '/usr/bin/python3'

" vimwiki
let g:vimwiki_list = [{'path': '~/Codebase/vim-wiki-note/vimwiki', 'path_html': '~/Documents/docs/vimwiki/html'}]

autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.config/nvim/plugged')
" ===================
" my plugins here
" ===================
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" File icons
Plug 'ryanoasis/vim-devicons'
" File explore
Plug 'scrooloose/nerdtree'
" Fuzzy find file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
Plug 'tpope/vim-fugitive'
" TS syntax highlight
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Documentation & notes
Plug 'vimwiki/vimwiki'
" Code comment
Plug 'tpope/vim-commentary'
" Vim start screen
Plug 'mhinz/vim-startify'
" Tag bar
Plug 'majutsushi/tagbar'

Plug 'mileszs/ack.vim'

" ===================
" end of plugins
" ===================
call plug#end()


" ===== COC =====
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahea and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Global Search
nnoremap <leader>prs :CocSearch <C-R>=expand("<cword>")<CR><CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Go
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup end

" Apply AutoFix to problem on the current line.
 nmap <leader>qf <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"
" ===== COC End =====

" Syntax settings
augroup SyntaxSettings
    autocmd!
    " set filetypes as typescript.tsx
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

" ==============================
" Indentation Setttings
" ==============================

" Indentation => space based
"autocmd FileType html setlocal ts=2 sw=2 expandtab
"autocmd FileType javascript setlocal ts=2 sw=2 expandtab
"autocmd FileType typescript setlocal ts=2 sw=2 expandtab
"autocmd FileType typescript.tsx setlocal ts=2 sw=2 expandtab
"autocmd FileType python setlocal ts=4 sw=4 expandtab
"autocmd FileType go setlocal ts=8 sw=8 expandtab

" Indentation => tab based
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts =2 sw=4
autocmd FileType go setlocal ts=8 sts=2 sw=8

" ==============================
" Indentation Settings End
" ==============================

" Theme and syntax
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
" NOTE: In case airline_powerline_fonts = 1 does not work
let g:airline_left_sep = ''
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.maxliner = ''

set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'gruvbox'
let g:NERDTreeWinSize = 40

"set list lcs=tab:\|\
" Show tab indentation (no spaces inserted)
set list

" Enable spell check
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
" Replace all in the current buffer
nnoremap <leader>rp :%s//gI<Left><Left><Left>
" Press ESC to turn off highlighting and clear any message already displayed.
nnoremap <silent> <ESC> :nohlsearch<Bar>:echo<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :vsplit v<CR>
nnoremap <leader>c :split c<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
vmap <leader>y "+y<CR>

" ===============================
" Git Fugitive
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gm :G mergetool<CR>
" ===============================

" ===============================
" FZF & Ag
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let SFZF_DEFAULT_OPTS = '--reverse'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>i :Ag<CR>
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'FZFBackground'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'FZFHighlight', 'FZFHighlight'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ===============================

" ===============================
" Tag bar
nmap <leader>b :TagbarToggle<CR>
" ===============================
