"the default <Leader> is \

"paste normal to avoid paste indent too more
set pastetoggle=<F12>

"replace begin
"https://vim.fandom.com/wiki/Search_and_replace_in_multiple_buffers
":arg *.c All *.c files in current directory.
":set hidden Allow switching away from a changed buffer without saving.
":set autowriteall Or, use this for automatic saving (instead of :set hidden).
"...Move cursor to word that is to be replaced.
":Replace whatever Search and replace in all files in arglist; confirm each change.
":Replace! whatever Same, but do not confirm each change.
":wa Write all changed files (not needed if used :set autowriteall)
" Search for current word and replace with given text for files in arglist.
function! Replace(bang, replace)
	let flag = 'ge'
	if !a:bang
		let flag .= 'c'
	endif
	let search = '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
	let replace = escape(a:replace, '/\&~')
	execute 'argdo %s/' . search . '/' . replace . '/' . flag
endfunction
command! -nargs=1 -bang Replace :call Replace(<bang>0, <q-args>)
nnoremap <Leader>r :call Replace(1, input('Replace '.expand('<cword>').' with: '))<CR>
"replace with interactive
nnoremap <Leader>rc :call Replace(0, input('Replace '.expand('<cword>').' with: '))<CR>

"replace end

"format begin
"Plug 'Chiel92/vim-autoformat'
"clang-format
"https://clang.llvm.org/docs/ClangFormatStyleOptions.html

"have your code be formatted upon saving your file
"au BufWrite * :Autoformat
map <F9> :Autoformat<CR>

"format end

"make polefs client
nmap mp :!make client -j 16<CR>
nmap mg :!compiledb -n make -j 16<CR>

" gtags wrapper for cscope, also workaround for teamviewer
map mm <C-]>
map ms <C-\>s
map me <C-\>e
map mc <C-\>c
nmap <C-m> <C-\>

" save current session
map my :mksession! .session.vim<CR>
nmap <C-y> :mksession! .session.vim<CR>
map mh :split<CR>
map mv :vsplit<CR>

set t_Co=256
set background=dark
"set background=light
"colorscheme solarized
"colorscheme jellybeans
colorscheme default

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" use space instead of tab, execute ':retab' in vim to convert tab to space
"autocmd BufRead,BufNewFile *.c, *.h *.cc *.cpp *.hpp *.go *.py set expandtab

" highlight search result
set hlsearch
hi Search cterm=None ctermfg=Cyan ctermbg=DarkGray
map mn :hi Search cterm=None ctermfg=Cyan ctermbg=DarkGray<CR>
map nh :nohlsearch<CR>


" For YouCompleteMe
set encoding=utf-8

" set mouse=a
set nu
"set rnu
set nocsverb
" no line number
"map ma :set nornu<CR>:set nonu<CR>
"nmap <C-a> :set nornu<CR>:set nonu<CR>
" set line number
"map mz :set nu<CR>:set rnu<CR>
"nmap <C-e> :set nu<CR>:set rnu<CR>

set undolevels=500

"set csprg=gtags-cscope
"cs add GTAGS

" Adjust window size
nmap + <C-W>+
nmap - <C-W>-
nmap > <C-w>>
nmap < <C-w><

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
map J <C-d>
map K <C-u>
map U <C-f>
map I <C-b>

" Jump between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" CtrlP, run 'Ctrl+D' in prompt to switch between filename and fullpath modes
"map <C-b> :CtrlPBuffer<CR>
"let g:ctrlp_by_filename = 3
"let g:ctrlp_max_files = 0
"set wildignore+=*.o,*.a
"let g:ctrlp_custom_ignore = '\v[\/]\.(o|a)$'
"let g:ctrlp_user_command = 'find %s -type f -name *.cc -o -name *.c -o -name *.h -o -name *.hpp -o -name *.go'

" CtrlPFunky
"map mf :CtrlPFunky<CR>
"nmap <C-f> :CtrlPFunky<CR>
"let g:ctrlp_extensions = ['funky']
"let g:ctrlp_funky_syntax_highlight = 1

" Nerdtree
map m2 :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

" Tagbar
map m3 :TagbarToggle<CR>
nmap <F3> :TagbarToggle<CR>

"vim-go
"nmap md :GoDef<CR>
"nmap mr :GoReferrers<CR>

"fzf
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
nnoremap <F7> :Rgw<CR>
nnoremap <F8> :Rg<CR>

" git-gutter
map m4 :GitGutterToggle<CR>
nmap <F4> :GitGutterToggle<CR>
map m5 :GitGutterLineHighlightsToggle<CR>
nmap <F5> :GitGutterLineHighlightsToggle<CR>
map gn :GitGutterNextHunk<CR>
map gp :GitGutterPrevHunk<CR>
set updatetime=300
"let g:gitgutter_signs = 0

" airline
"let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"let g:airline_section_b       (hunks, branch)[*]
"let g:airline_section_c       (bufferline or filename)
"let g:airline_section_gutter  (readonly, csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
"let g:airline_section_y       (fileencoding, fileformat)
"let g:airline_section_z       (percentage, line number, column number)
"let g:airline_section_error   (ycm_error_count, syntastic-err, eclim, languageclient_error_count)
"let g:airline_section_warning (ycm_warning_count, syntastic-warn, languageclient_warning_count, whitespace)
let g:airline_section_b = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" vim-airline-theme, themes are located in ~/.vim/plugged/vim-airline-themes/autoload/airline/themes
let g:airline_theme='violet'

" vim-gutentags
let g:gutentags_project_root = ['.root', '.git']
let g:gutentags_modules = ['gtags_cscope']
let g:gutentags_cache_dir = expand('~/.cache/gtags')
"let g:gutentags_auto_add_gtags_cscope = 0

"vim-cpp-enhanced-highlight
let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

" vim-plug session begin
call plug#begin('~/.vim/plugged')

" My plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'tacahiroy/ctrlp-funky'
Plug 'majutsushi/tagbar'
Plug 'chazy/cscope_maps'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'prabirshrestha/asyncomplete.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Chiel92/vim-autoformat'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
"Plug 'w0rp/ale'
"Plug 'Valloric/YouCompleteMe'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'scrooloose/syntastic'
"Plug 'AutoComplPop'
"Plug 'will133/vim-dirdiff'

"vim-plug session end
call plug#end()

"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
set ts=8
set sw=2
set smarttab
source ~/.vim/.coc.vim

"let g:gutentags_define_advanced_commands = 1
"
"rust
syntax enable
filetype plugin indent on
"enable automatic running of :RustFmt when you save a buffer
let g:rustfmt_autosave = 1 
