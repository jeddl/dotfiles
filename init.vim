syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
" set wrap linebreak
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
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

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" set nocompatible               " be improved, required
" filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" my plugins here
" ===================

Plugin 'neoclide/coc.nvim', {'branch': 'release'} 
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
" File search
Plugin 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plugin 'mileszs/ack.vim'
Plugin 'git@github.com:inkarkat/vim-ingo-library.git'
Plugin 'inkarkat/vim-spellcheck'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
" TS syntax highlight
Plugin 'git@github.com:leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'

" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required

" ===== COC related =====
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
" nmap <leader>qf<Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 
" ===== COC related ===== 


" Indentation
autocmd FileType Html setlocal ts=2 sts=2 sw=2
autocmd FileType JavaScript setlocal ts=2 sts=2 sw=2
autocmd FileType TypeScript setlocal ts=2 sts=2 sw=2
autocmd FileType Python setlocal ts=4 sts=4 sw=4
autocmd FileType Go setlocal ts=8 sts=8 sw=8
" Syntax settings
augroup SyntaxSettings
    autocmd!
    " set filetypes as typescript.tsx
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

" Theme and syntax
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.brach = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''

colorscheme gruvbox
let g:indentLine_enabled = 1
let g:indentLine_setColors = 15
let g:indentLine_color_term = 15
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'gruvbox'
set background=dark
set list lcs=tab:\|\

" Init
let loaded_matchparen = 1
let mapleader = " "
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :vsplit v<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

"nnoremap <Leader>ps :Rg<SPACE>
"nnoremap <C-p> :GFiles<CR>
"nnoremap <Leader>pf :Files<CR>
"nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" nerdtree
" let NERDTreeMinimalUI = 1

" SpellCheck
nnoremap <leader>sp :SpellCheck<CR>
let g:SpellCheck_DefineAuxiliaryCommands = 0
" set spell
highlight link qfSpellErrorWord             SpellBad
highlight link qfSpellErrorWordInContext    Normal
highlight link qfSpellContext               SpecialKey

" ag items
if executable('ag')
    " Use ag over grep"
    set grepprg = ag\ --nogroup\ --nocolor\ --column

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    let g:ctrlp_use_caching = 0
endif

