set nocompatible
filetype plugin indent on
syntax on
set nowrap
set confirm
set foldmethod=syntax
set cursorline
set history=10000
set number
set wildmenu
set colorcolumn=120
set hidden
" indent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set cindent
    set cinoptions=+0
    set cinkeys-=0#
    set indentkeys-=0#
" encoding
    set encoding=utf-8
    set fileencoding=utf-8
" list mode
    set listchars=tab:>·,trail:~,extends:>,precedes:<
    "set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
    set list
" spell check
set spell
" search
set hlsearch
set incsearch
" Colorscheme
    set background=dark
    colorscheme solarized
    " let g:solarized_termcolors=256
    " set t_Co=256
set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled=1 " Enable the list of buffers
    let g:airline_powerline_fonts=1
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='bubblegum'
Plug 'scrooloose/syntastic'
    let g:syntastic_tcl_checkers=['nagelfar']
    let g:syntastic_tcl_nagelfar_conf='$HOME/scripts/nagelfar125/nagelfar.syntax'
    let g:syntastic_tcl_nagelfar_exec='$HOME/scripts/nagelfar125/nagelfar.tcl'
    let g:syntastic_aggregate_errors=1
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
Plug 'scrooloose/nerdtree'
    let g:NERDTreeDirArrowExpandable='▸'
    let g:NERDTreeDirArrowCollapsible='▾'

    autocmd vimenter * NERDTree
    " Go to previous (last accessed) window.
    autocmd VimEnter * wincmd p

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " NERDTress File highlighting
        function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
         exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
         exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
        endfunction

        call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
        call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
        call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
        call NERDTreeHighlightFile('tcl', 'Magenta', 'none', '#ff00ff', '#151515')
Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_cmd='CtrlPMixed'
    let g:ctrlp_working_path_mode='ra'
    let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'chaoren/vim-wordmotion'
Plug 'gregsexton/MatchTag'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'takac/vim-hardtime'
    let g:hardtime_default_on=0
Plug 'unblevable/quick-scope'
    " Trigger a highlight in the appropriate direction when pressing these keys:
    let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
    " Trigger a highlight only when pressing f and F.
    let g:qs_highlight_on_keys=['f', 'F']
Plug 'kshenoy/vim-signature'
Plug 'kien/rainbow_parentheses.vim'
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :set list!<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd BufWritePre * %s/\s\+$//e
call togglebg#map("<F5>")
nnoremap <esc><esc> :noh<return><esc>
