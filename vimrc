set nocompatible | filetype indent plugin on | syn on

" bootstrap VAM
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" addons
VAMActivate github:bling/vim-airline
VAMActivate github:vim-perl/vim-perl
VAMActivate github:altercation/vim-colors-solarized
VAMActivate github:nanotech/jellybeans.vim
VAMActivate github:kien/ctrlp.vim
VAMActivate github:yko/mojo.vim
VAMActivate github:elzr/vim-json
VAMActivate github:mileszs/ack.vim
VAMActivate github:airblade/vim-gitgutter
VAMActivate github:tpope/vim-fugitive
VAMActivate github:scrooloose/nerdcommenter
VAMActivate github:gregsexton/MatchTag
VAMActivate github:tpope/vim-unimpaired
VAMActivate github:majutsushi/tagbar " requires ctags executable
VAMActivate github:chrisbra/Recover.vim
VAMActivate github:genadyp/vawa.vim

" theme
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme jellybeans

" perl
let perl_no_subprototype_error=1
let perl_extended_vars = 1
let perl_include_pod = 1

" mojolicious
let mojo_highlight_data=1

" behavior
syntax enable
set modelines=0
set encoding=utf-8
set number
set hidden
set title
set scrolloff=3
set showmode " disabled by airline below
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set ruler
set ttyfast
set backspace=indent,eol,start
set colorcolumn=90

" tabbing
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs

"line tracking
set numberwidth=5
set cursorline
set cursorcolumn

" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" vim shortcuts
" cleanup trailing whitespace
nnoremap <Leader>wc :%s/\s\+$//c<CR>
nnoremap <Leader>wa :%s/\s\+$//<CR>

" external commands:
" perltidy
nnoremap <Leader>t mz:%!perltidy -q<CR>'z:delmarks z<CR>
" prove
" current file
nnoremap <Leader>p <Esc>:!prove -l %<CR>
" all tests
nnoremap <Leader>pa <Esc>:!prove -lr<CR>

" invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" ctags integration (from http://andrew.stwrt.ca/posts/vim-ctags/):
" ctrlp
nnoremap <leader>. :CtrlPTag<cr>
" tagbar
nnoremap <silent> <Leader>b :TagbarOpenAutoClose<CR>
nnoremap <silent> <Leader>B :TagbarToggle<CR>

" airline
set ttimeoutlen=50
set laststatus=2
set noshowmode

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_left_sep = '' " '▶'
let g:airline_right_sep = '' " '◀'
let g:airline_symbols.linenr = '' " '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" see also:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
" http://grantlucas.com/posts/2012/09/using-vim-arduino-development
