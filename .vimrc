" GENERAL SETTINGS --------------------------------------------------------------------- {{{ 

" https://web.archive.org/web/20190228223619/https://blog.interlinked.org/tutorials/vim_tutorial.html
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Turn syntax highlighting on.
syntax on
colorscheme gruvbox
" we use a dark background, don't we?
set bg=dark

" Always show the menu, insert longest match
set completeopt=menuone,longest

" Add numbers to each line on the left-hand side.
set number
set relativenumber
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn
" Set shift width to 4 spaces.
set shiftwidth=2
set numberwidth=5
" Set tab width to 4 columns.
set tabstop=2
" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap
" usaved changes are not discarded when the file is abandoned(not the active
" in any buffer, window, or tab, and can only be viewed when buffers are
" listed)
set hidden
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=100
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
inoremap jj <esc>

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'chriskempson/base16-vim'
  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'

call plug#end()

" }}}
