set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Auto complete
"Plugin 'valloric/youcompleteme'

" Other plugins
Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

au BufNewFile,BufRead *.ejs set filetype=html

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : "»",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "x",
    \ "Clean"     : "ø",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"[readonly]":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[RO' : ''
endfunction

function! LightLineFilename()
  return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:F') ? expand('%:F') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" Fix fish issue
set shell=/bin/sh 

" Increase gitgutter max signs
let g:gitgutter_max_signs=1000

" Increase updatetime for gitgutter
set updatetime=250

"Git Gutter characters
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'

"Enable omnicomplete
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

"Line Numbers
set number

"Syntax Highlighting
syntax on

"Disable Word Wrap
set nowrap

"Easy switching between multiple files
set hidden

"Better command line completion
set wildmenu

"Auto indentation
set autoindent

"Instead of failing a command because of unsaved changes, ask to save
set confirm

" Enable spell checking
setlocal spell spelllang=en_us

"Solarized
set bg=dark
set t_Co=256
"let g:solarized_termcolors=256
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" Enable omnicomplete and for filetypes
augroup omni_complete
	"clear commands before resettng
	autocmd!
	"Enable filetypes
	autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END
	
" Set tabbing to 4 spaces
set shiftwidth=4 tabstop=4 expandtab

"Remap split switching to C-jkhl
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-H> <C-W>h<C-W>
map <C-L> <C-W>l<C-W>

set pastetoggle=<F2>

nnoremap <esc> :noh<return><esc>

"When you past a yank, it is automatically yanked again
xnoremap p pgvy

"Remap :W to :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

"Remap :Q to :q
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

" Mutlpiple cursor key maps
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-a>'
let g:multi_cursor_prev_key='<C-s>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Make lines wrap to next/previous with arrow keys
set whichwrap+=<,>,h,l,[,]

" Always show status line
set laststatus=2

" ctrlp excludes
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|vendor\|ckeditor\|framework\|bower_components\|sass-cache\|dist'
set wildignore+=*.sw*

" ctrlp show dotfiles
let g:ctrlp_show_hidden = 1

" Enable scrolling
" set mouse=a

" Fix backspace
set backspace=2

" Open nerdtree tabs on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Highlight the current line
set cursorline

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

highlight TabLineSel ctermfg=32 ctermbg=White
