runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
"set runtimepath=~/.vim,$VIMRUNTIME,~/.vim/after
syntax on
syntax enable
filetype plugin indent on
" set grepprg=grep\ -nH\ $*


set ruler
" set gfn=Source\ Code\ Pro:h16
" set gfn=Meslo\ LG\ S\ Regular\ for\ Powerline:h16

" Vim-LaTeX-Suite
let g:tex_flavor='latex'
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
" let g:Tex_ViewRule_pdf = 'open -a Skim'
" set iskeyword+=:
" let g:vimrplugin_insert_mode_cmds = 0

"Latex-box
let g:LatexBox_viewer='open -a Skim'
let g:LatexBox_latexmk_options='--shell-escape'

"vimtex
" Turn off continuous compilation by default
" let g:vimtex_latexmk_continuous=0
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'process',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" Allow compilation in the background
let g:vimtex_latexmk_background=1
let g:vimtex_latexmk_options= '-verbose -pdf -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape'
let g:vimtex_quickfix_warnings = {
          \ 'Overfull' : 0,
          \ 'Underfull' : 0,
          \ 'packages' : {
          \   'default' : 0,
          \ },
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \}
let g:vimtex_quickfix_ignored_warnings = [
        \  'Underfull',
         \ 'Overfull',
         \ 'specifier changed to',
       \ ]


let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
let g:vimtex_complete_recursive_bib = 1

function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction



" Colors
" set t_Co=16
" set t_Co=256

if has('nvim') || has('termguicolors')
  set termguicolors
endif


if has('gui_running')
	" colorscheme solarized
  colorscheme NeoSolarized
endif
set background=dark

" set term=screen-256color
" Solarized
" set background=light
" set background=dark
" colorscheme monokai
" colorscheme zenburn
" colorscheme solarized
" option name default | optional
" ------------------------------------------------
"  g:solarized_termcolors= 16 | 256
"  g:solarized_termtrans = 0 | 1
"  g:solarized_degrade = 0 | 1
"  g:solarized_bold = 1 | 0
"  g:solarized_underline = 1 | 0
"  g:solarized_italic =   1 | 0
"  g:solarized_contrast = "normal"| "high" or "low"
"  g:solarized_visibility= "normal"| "high" or "low"
"  ------------------------------------------------
let g:solarized_contrast = "normal"
let g:solarized_termcolors= 256
let g:solarized_visibility= "normal"
let g:solarized_termtrans = 1

autocmd BufRead *.txt set tw=78 spell
autocmd BufRead *.tex set tw=78 spell
autocmd BufRead *.Rnw set tw=78 " spell
autocmd BufRead *.Rmd set tw=78 " spell

" TeX
" " Fix F9 mapping on MacBook from
" http://2manyvariables.inmachina.com/2009/07/vim-latex-suite-and-os-x/
"autocmd FileType tex imap <buffer> <M-TAB> <Plug>Tex_Completion
"autocmd FileType tex setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType Rnw setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType Rmd setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType R setlocal shiftwidth=2 tabstop=2 expandtab

" set expandtab

" make hjkl movements accessible from insert mode via the <Alt> modifier key
" http://stackoverflow.com/questions/1737163/vim-traversing-text-in-insert-mode
" inoremap <A-h> <C-o>h
" inoremap <A-j> <C-o>j
" inoremap <A-k> <C-o>k
" inoremap <A-l> <C-o>l

" :fixdel

" Vim-R-Plugin
" let vimrplugin_term_cmd = "/Applications/iTerm.app/Contents/MacOS/iTerm -t R"
" let vimrplugin_term = "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal"
" let r_indent_ess_compatible = 1
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" Nvim-R
" let R_in_buffer = 0
" let R_applescript = 0
" let R_source = '~/.vim/bundle/Nvim-R/R/tmux_split.vim'
" let R_tmux_title = "automatic"
" Disable auto conversion of _ to <-
let R_assign = 0
let R_notmuxconf = 1
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1
" R commands in R output are highlighted
let g:Rout_more_colors = 1
" autocmd TerminalOpen * setlocal nonumber
let R_esc_term = 0
" let R_in_buffer = 0

" Clipboard
set clipboard=unnamed
if $TMUX == ''
	set clipboard+=unnamed
endif

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-May-27 09:10):
set nocompatible
filetype plugin on
" Change the <LocalLeader> key:
" let maplocalleader = ","
set timeoutlen=500

" Syntastic
" let g:syntastic_enable_r_lintr_checker = 1
" let g:syntastic_r_checkers = 1
" let g:syntastic_r_lintr_linters = "with_defaults(line_length_linter = line_length_linter(120), camel_case_linter=NULL, snake_case_linter=NULL, closed_curly_linter=closed_curly_linter(allow_single_line = TRUE), open_curly_linter=open_curly_linter(allow_single_line = TRUE), commented_code_linter=NULL)"
"


"ale
let g:ale_r_lintr_options = "with_defaults(line_length_linter = line_length_linter(120), camel_case_linter=NULL, snake_case_linter=NULL, closed_curly_linter=closed_curly_linter(allow_single_line = TRUE), open_curly_linter=open_curly_linter(allow_single_line = TRUE), commented_code_linter=NULL)"

let g:ale_linters = {
\   'tex': ['write-good','lacheck'],
\}

let g:ale_writegood_options = " writeGood('evaluate', { weasel-words: false, tooWordy: false}); "

"vim-airline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

" from
" http://stackoverflow.com/questions/30443836/install-vim-via-homebrew-with-python-and-python3-support
if has('python')
	let g:jedi#force_py_version = 2
	let g:syntastic_python_python_exec = 'python2'
	let g:pymode_python = 'python2'
elseif has('python3')
	let g:jedi#force_py_version = 3
	let g:syntastic_python_python_exec = 'python3'
	let g:pymode_python = 'python3'
else
	let g:loaded_jedi = 1
endif

" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'r', 'python', 'bash=sh']
" let g:markdown_folding = 1

" configuration for vim-pandoc and vim-rmarkdown
" let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0


" Tab switching
" https://superuser.com/questions/382060/shortcut-to-switch-tabs-in-macvim
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Turn off bells
set noerrorbells
set vb t_vb=

" Make vimdiff wrap text
au VimEnter * if &diff | execute 'windo set wrap' | endif
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" from https://realpython.com/vim-and-python-a-match-made-in-heaven/
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" In general wrap at 80 columns
set textwidth=80
