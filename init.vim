syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
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

Plugin 'git@github.com:ycm-core/YouCompleteMe.git'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plugin 'mileszs/ack.vim'
Plugin 'git@github.com:inkarkat/vim-ingo-library.git'
Plugin 'inkarkat/vim-spellcheck'

" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required

" Theme and syntax
colorscheme gruvbox
set background=dark
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

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
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>

"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"nnoremap <Leader>ps :Rg<SPACE>
"nnoremap <C-p> :GFiles<CR>
"nnoremap <Leader>pf :Files<CR>
"nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
"nnoremap <Leader>+ :vertical resize +5<CR>
"nnoremap <Leader>- :vertical resize -5<CR>
"nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" nerdtree
" let NERDTreeMinimalUI = 1

" YCM
" nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
" nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>



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

