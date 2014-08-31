
"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim

"try
"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP<CR>
noremap <Leader>w :w<CR>


vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

nmap <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" let Vundle manage Vundle
"" required! 
Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
" vim-scripts repos
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'MarcWeber/ultisnips'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'dhazel/conque-term'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'kien/ctrlp.vim'
"Plugin "kalamay/vim-lldb"
call vundle#end()

filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_key_list_previous_completion=['<Up>']
"let g:ycm_key_invoke_completion = '<C-Tab>'
"let g:ycm_use_ultisnips_completer = 1
"let g:ycm_key_list_select_completion = [ ]
"let g:ycm_key_list_previous_completion = [ ]
"let g:SuperTabDefaultCompletionType = '<C-Tab>'



"" Ultisnips
"let g:UltiSnipsExpandTrigger="<c-j>"

"let g:UltiSnipsExpandTrigger = '<f5>'
"set runtimepath+=~/.vim/ultisnips_rep
"let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsListSnippets="<c-s-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-space>"
"let g:UltiSnipsJumpBackwardTrigger="<c-s-space>"

""""""""""""""""""""""""""""""
" airline setup
""""""""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
set laststatus=2



"color desert
syntax enable
syntax on

set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set guifont=menlo:h15
set number
set ts=2
set sw=2


set smartindent
set ts=2
set sw=2
set expandtab
set nowrap

set textwidth=80
set autoindent
set backspace=2

" Make quickfix span all panes and wrap
" long lines
au FileType qf wincmd J


"colorscheme vividchalk
""inoremap ( ()<ESC>i
""inoremap { {}<ESC>i
""inoremap [ []<ESC>i
""inoremap " ""<ESC>i
"source $VIMRUNTIME/matchit.vim

"execute pathogen#infect()
syntax on
filetype plugin indent on


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ 

" Fast saving
nmap <leader>s :w!<cr>

"let g:LatexBox_viewer = 'preview'
"let g:LatexBox_latexmk_options = '-pv'
let g:LatexBox_latexmk_options = "-pvc -pdf -bibex"
"set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>


set runtimepath+=~/.vim/bundle/ultisnips/

let g:LatexBox_viewer = 'preview'
let g:LatexBox_latexmk_options = '-pvc -pv'

" Toggle 80 column marker
nnoremap <F2> :call ToggleColorColumn()<CR>

map <F3> :NERDTreeToggle<CR>

nmap <F6> :!g++ -o %:r -Wall -stdlib=libstdc++ -L/usr/local/lib -L/usr/local/lib/fst  -lfst -ldl  % && ./%:r

nmap <F7> :make<CR>

nmap <S-F7> :make<CR>

nnoremap <F9> :cnext<CR>

nnoremap <silent> <F10> :TagbarToggle<CR>

 " Complete options (disable preview scratch window)
"  set completeopt = menu,menuone,longest
 " Limit popup menu height
 " set pumheight = 15
 
 " SuperTab option for context aware completion
 " let g:SuperTabDefaultCompletionType = "context"
 
 " Disable auto popup, use <Tab> to autocomplete
 " let g:clang_complete_auto = 0
 " Show clang errors in the quickfix window
 " let g:clang_complete_copen = 1

" autocmd vimenter * NERDTree


"Easier split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


func! ToggleColorColumn()
    if exists("b:colorcolumnon") && b:colorcolumnon
        let b:colorcolumnon = 0
        exec ':set colorcolumn=0'
        echo '80 column marker off'
    else
        let b:colorcolumnon = 1
        exec ':set colorcolumn=80'
        echo '80 column marker on'
    endif    
endfunc


au BufRead,BufNewFile *.grm set filetype=thraxgrm

"Tag notes from
"http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
"C-] - go to definition
"C-T - Jump back from the definition.
"C-W C-] - Open the definition in a horizontal split
"
"Add these lines in vimrc
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"
"C-\ - Open the definition in a new tab
"A-] - Open the definition in a vertical split
"
"After the tags are generated. You can use the following keys to tag into and
"tag out of functions:
"
"Ctrl-Left_MouseClick - Go to definition
"Ctrl-Right_MouseClick - Jump back from definition
"
"Tag command
"ctags --file-scope=no -R `pwd`
set tags+=tags
set tags+=$KALDI_ROOT/src/tags
set tags+=/Users/dixonp/tools/kaldi-trunk/src/tags
set nocst

set path+=$KALDI_ROOT/src/
set path+=/Users/dixonp/tools/kaldi-trunk/src


nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>

"map ; in : in normal mode
noremap ; :

"Disable cursor keus
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Get the bell turned off
set noerrorbells 
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

let ft_stdout_mappings = {
      \'applescript': 'osascript',
      \'bash': 'bash',
      \'bc': 'bc',
      \'haskell': 'runghc',
      \'javascript': 'node',
      \'lisp': 'sbcl',
      \'nodejs': 'node',
      \'ocaml': 'ocaml',
      \'perl': 'perl',
      \'php': 'php',
      \'python': 'python',
      \'ruby': 'ruby',
      \'scheme': 'scheme',
      \'sh': 'sh',
      \'sml': 'sml',
      \'spice': 'ngspice'
      \}

for ft_name in keys(ft_stdout_mappings)
  execute 'autocmd Filetype ' . ft_name . ' nnoremap <buffer> <F5> :write !'
        \. ft_stdout_mappings[ft_name] . '<CR>'
endfor

let ft_execute_mappings = {
      \'c': 'gcc -o %:r -Wall -std=c99 % && ./%:r',
      \'cc': 'g++ -o %:r -Wall -L/usr/local/lib -L/usr/local/lib/fst  -lfst -ldl  % && ./%:r',
      \'erlang': 'escript %',
      \'pascal': 'fpc % && ./%:r'
      \}

for ft_name in keys(ft_execute_mappings)
  execute 'autocmd FileType ' . ft_name
        \. ' nnoremap <buffer> <C-P> :write \| !'
        \. ft_execute_mappings[ft_name] . '<CR>'
endfor
