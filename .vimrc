" Instalador Vundle  ------------------------------------------------------ {{{

" Instalando el gestor de plugins Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Instalando Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" Requerido para Vundle
set nocompatible
filetype off

" Añadimos al runtimepath el Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" }}}

" Listado de Plugins ------------------------------------------------------ {{{

Bundle 'gmarik/vundle'

" Navegador de archivos NEDTree
Bundle 'scrooloose/nerdtree'

" Powerline mejorada
Bundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim' }

" Fuzzy Finder - Buscar archivos
Bundle 'kien/ctrlp.vim'

" Commenter - Permite comentar las líneas de código
Bundle 'scrooloose/nerdcommenter'

" Surround
Bundle 'tpope/vim-surround'

" Autoclose - Cierra automaticamente los caracteres
Bundle 'Townk/vim-autoclose'

" Syntax checking
"Bundle 'scrooloose/syntastic'

" Tagbar - Ventana para mostrar la estructura de la Clase o Modulo
Bundle 'majutsushi/tagbar'

" Multiple cursors
Bundle 'terryma/vim-multiple-cursors'

" Python
Bundle 'klen/python-mode'

" Vim-easymotion - Permite desplazarse por el documento más rapido.
Bundle 'Lokaltog/vim-easymotion'

" Autocompletado mejorado
Bundle 'AutoComplPop'

"Snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" Temas de colores
Bundle 'morhetz/gruvbox'
Bundle 'sickill/vim-monokai'
Bundle 'altercation/vim-colors-solarized'

" }}}

" Instalación inicial de los plugins  ------------------------------------- {{{

if iCanHazVundle == 0
    echo "Instalando los Plugins ..."
    echo ""
    :BundleInstall
endif

filetype plugin indent on

" }}}

" Color ------------------------------------------------------------------- {{{
syntax on
set background=dark
if &term =~? 'mlterm\|xterm\|screen-256'
    let &t_Co = 256
    colorscheme gruvbox
else
    colorscheme solarized
endif
" }}}

" Opciones basica --------------------------------------------------------- {{{
set encoding=utf-8

set ruler
set relativenumber
set laststatus=2
set noshowmode
set colorcolumn=80

" Mejorando el Wildmenu
set wildmenu
set wildmode=list:longest

" Deshabilita la creacion de backups.
set nobackup
set nowritebackup
set noswapfile

" Busquedas
set ignorecase
set smartcase
set incsearch
set hlsearch

" Mostrar caracteres como espacios, tabs, etc...
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:⋅
set lisp " Para que en el autocompletado me aparezcan las palabras con '-'.

set splitbelow " Ventana nueva abajo
set splitright " Ventan nueva a la derecha.
set autoread " Recargar archivo si fue modificado fuera de vim.

" Mejor autocompletado.
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete

" Habilitamos el ratón
set mouse=a

au VimResized * :wincmd = " Redimensionar los splits al reducir la ventana.

" Solo mostrar el current line en la ventana actual y en normal mode.
set cursorline
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Autocompletado
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" }}}

" Tabs, espacios, wrapping ------------------------------------------------ {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set formatoptions=qrn1j

autocmd FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType css setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType make setlocal softtabstop=8 shiftwidth=8 tabstop=8 noexpandtab

" }}}

" Remapeo de teclas ------------------------------------------------------- {{{

let mapleader=","

" Help key.
noremap <F1> <nop>
inoremap <F1> <nop>

" Abrir el .vimrc para editarlo.
nmap vimrc :tabnew ~/.vimrc<cr>

" Cerrar un archivo
nnoremap <leader>q <esc>:q<cr>

" Guardar archivo
noremap <F2> <esc>:w<cr>
inoremap <F2> <esc>:w<cr>
vnoremap <F2> <esc>:w<cr>

" Abrir el NERDTree
noremap <F3> :NERDTreeToggle<cr>
inoremap <F3> <esc>:NERDTreeToggle<cr>

" Encuentra un archivo abierto en el NERDTree
noremap <F4> :NERDTreeFind<CR>

" Abre o cierra el Tagbar
map <F5> :TagbarToggle<CR>

" Muestra los registros,
nnoremap <F11> <esc>:registers<cr>
inoremap <F11> <esc>:registers<cr>
vnoremap <F11> <esc>:registers<cr>

" <ESC>
inoremap kj <esc>l

" Duplicar linea
nnoremap dl :t.<CR>

" Mover linea a linea
noremap j gj
noremap k gk

" Para mover bloques de texto y lineas.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Se vuelver a seleccionar el texto despues de identarlo
vnoremap < <gv
vnoremap > >gv
nnoremap > <c-w>>
nnoremap < <c-w><

" Selecciona la linea actual sin seleccionar la identación.
nnoremap vv ^vg_

" Que el vat seleccione desde el incio al fin de lineas.
nnoremap vat vato0o$

" Seleccionar todo el documento.
nnoremap <leader>a ggVG

" Movimiento entre los Tabs
nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>
nnoremap tm :tabm<cr>
nnoremap tt :tabnew<cr>

" Cambiar entre ventanas
noremap <TAB><TAB> <C-w><C-w>

" Guardar cuando se requiere permisos de root
cmap w!! %!sudo tee > /dev/null %

" Limpiar busquedas
noremap <silent><Leader>/ :nohls<CR>

" Mantener en el medio la busqueda.
nnoremap n nzzzv
nnoremap N Nzzzv

" }}}

" Busqueda ---------------------------------------------------------------- {{{
set incsearch
set ignorecase
set hlsearch
set scrolloff=10

" Mantener en el medio la busqueda.
nnoremap n nzzzv
nnoremap N Nzzzv

" }}}

" Plugins - Configuración ------------------------------------------------- {{{
" NERDTree ---------------------------------------------------------------- {{{

" No mostrar archivos con estas terminaciones.
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']

let NERDTreeHighlightCursorline = 1

" }}}
" Ctrl-p ------------------------------------------------------------------ {{{
let g:ctrlp_map = '<leader>e'
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>f :CtrlPLine<CR>
noremap <leader>m :CtrlPMRUFiles<CR>
"" Funcion para buscar por la palabra que se le pase
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
"" Busqueda de palabras
"" Busca la palabra en el buffer
noremap <leader>wb :call CtrlPWithSearchText(expand('<cword>'), 'Buffer')<CR>
"" Busca la palabra en el Archivo
noremap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"" Busca la palabra como nombre de archivo
noremap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
noremap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"" Que no cambie el working directory
let g:ctrlp_working_path_mode = 0
"" Ignorar estos archivos
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
            \ 'file': '\.pyc$\|\.pyo$',
            \ }
let ctrlp_filter_greps = "".
            \ "egrep -iv '\\.(" .
            \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
            \ ")$' | " .
            \ "egrep -v '^(\\./)?(" .
            \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/|docs/build/" .
            \ ")'"
" }}}
" Tagbar ------------------------------------------------------------------ {{{
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0
" }}}
" Multi Cursor ------------------------------------------------------------ {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
" }}}
" Autocompletion----------------------------------------------------------- {{{
" Cerrado automatico del Autocompletions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
highlight Pmenu ctermbg=4 guibg=LightGray
" Abrir el autocompletado
imap <C-J> <C-X><C-O>
" Ir a la definición de una clase, metodo, etc..
nmap gd <c-w><c-]>
" }}}
" Python Mode ------------------------------------------------------------ {{{
" Disable lint check.
"let g:pymode_lint = 1
"" Documentation
"let g:pymode_doc = 1
"
"let g:pymode_lint_checker = "pyflakes,pep8"
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_ignore = "E501,C0111,E265,E116"
"
"let g:pymode_lint_signs = 1
"
"let g:pymode_folding = 0
"
let g:pymode_rope = 0
""let g:pymode_rope_autoimport = 0
""let g:pymode_rope_complete_on_dot = 0
"" open definitions on same window, and with my custom mapping
let g:pymode_rope_goto_definition_bind = 'gd'
"let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_breakpoint_bind = '<leader>B'
"" Virtualenv detection
"let g:pymode_virtualenv = 1
"" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
" }}}
" Syntastic -------------------------------------------------------------- {{{
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_checker_args='asas-d C0111,E501'
" }}}
" }}}

" Folding ----------------------------------------------------------------- {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" Misc ----------------------------------------------------------------- {{{

" Highlight last spaces
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave,BufWinEnter * match ExtraWhitespace /\s\+$/
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Remove last spaces
au BufWritePre *.txt :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.* :%s/\s\+$//e
" }}}

