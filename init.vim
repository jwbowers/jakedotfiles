"set runtimepepath+=~/.vim/after
"let &packpath = &runtimepath
" source ~/.vimrc
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
" Search {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
" case-sensitive otherwise

" vim-plug stuff
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Coc Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
"Plug 'jalvesaq/Nvim-R', {'for': ['r', 'rmd']}
"Plug 'jalvesaq/R-Vim-runtime', {'for': ['r', 'rmd']}
Plug 'vim-pandoc/vim-pandoc-syntax',  {'for': ['rmd']}

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
" Colors
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'overcache/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'romainl/flattened'
Plug 'morhetz/gruvbox'

Plug 'ntpeters/vim-better-whitespace'

Plug 'github/copilot.vim'

Plug 'chrisbra/csv.vim'

" Plug 'vigoux/LanguageTool.nvim'

" Initialize plugin system
call plug#end()

"languagetool
" let g:languagetool_server='/usr/local/Cellar/languagetool/5.3/libexec/languagetool-server.jar'
" let g:languagetool_server_command='/usr/local/bin/languagetool'

" Maybe this is good?
set termguicolors

" nvim-r stuff
" Install radian: pip3 install radian
" let R_app              = "radian"
" let R_args             = []
" let R_bracketed_paste  = 1
" let R_cmd              = "R"
" https://hongyuanjia.me/en/post/building-an-r-development-environment-in-neovim-using-windows-wsl/
" " Radian integration with NVim-R
" let R_app = "radian"
" let R_cmd = "R"
" let R_hl_term = 0
" let R_args = []
"  let R_bracketed_paste = 1
" end radian setup
let R_hl_term          = 1
let R_min_editor_width = 30
let R_nvimpager        = "vertical"
" If you always prefer a horizontal split, set the value of `R_rconsole_width` to 0:
" let R_rconsole_height = 15
let R_rconsole_width   = 0
let g:R_hi_fun         = 1
let r_syntax_folding   = 0
let R_assign = 0
let R_debug = 0
let r_indent_align_args = 0
" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0
let Rout_more_colors = 1
let rout_follow_colorscheme = 1
"let R_set_omnifunc = ["r",  "rmd", "rnoweb", "rhelp", "rrst"]
"let R_auto_omni = ["r",  "rmd", "rnoweb", "rhelp", "rrst"]

"incsearch stuff
" map / <Plug>(incsearch-forward)
"map ? <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"This unsets the 'last search pattern' register by hitting return
"https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
" nnoremap <silent><CR>:nohlseach<CR><CR>

"color
colorscheme NeoSolarized

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Coc Completion stuff maybe
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" https://www.narga.net/how-to-set-up-code-completion-for-vim/
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Better reflowing paragraphs for latex
" https://superuser.com/questions/422214/vim-gq-command-to-re-wrap-paragraph-and-latex
let &l:flp = '^\s*\\\(end\|item\)\>'
"set formatlistpat=^\\s*\\\\\\(end\\\\|item\\)\\>
set formatoptions+=n
set textwidth=80


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"endif


"vimtex ignore some warnings
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]


