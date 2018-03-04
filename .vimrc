colorscheme onedark 
syntax enable

lang C
set number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set hls is
set nrformats=
imap <C-t> <nop>
set pastetoggle=<F2>
scriptencoding utf-8
set encoding=utf-8
set lazyredraw
set clipboard=unnamed,autoselect
set backspace=indent,eol,start

inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-h> <C-g>u<C-h>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
au BufRead,BufNewFile *.tpl setl ft=gohtmltmpl

"---------------------------------------------------------------------
" Start Neobundle Settings.
"---------------------------------------------------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'grep.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'Align'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
      \ }
      \}
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'maverickg/stan.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'w0rp/ale'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'


"-----------------------------------------------------------------------
call neobundle#end()
" Required:
filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------------------
" End Neobundle Settings.
"---------------------------------------------------------------------

"--------------------------------------------------------------------
" matchit
"---------------------------------------------------------------------
if !exists('loaded_machit')
  runtime macros/matchit.vim
endif

"--------------------------------------------------------------------
" quickrun.vim
"--------------------------------------------------------------------
nnoremap <silent> ,qr :QuickRun -outputter/buffer/split 
      \ ":botright 8sp" -hook/time/enable 1<CR>


"--------------------------------------------------------------------
" rainbow_parentheses.vim
"--------------------------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare

"---------------------------------------------------------------------
" neocomplete
"---------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:jsx_ext_required = 0
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"---------------------------------------------------------------------
" neosnippet
"---------------------------------------------------------------------
let s:my_snippet = '~/dotfiles/snippets'
let g:neosnippet#snippets_directory = s:my_snippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<Tab>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"---------------------------------------------------------------------
" unite
"---------------------------------------------------------------------
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:gitgutter_system_function       = 'vimproc#system'
let g:gitgutter_system_error_function = 'vimproc#get_last_status'
let g:gitgutter_shellescape_function  = 'vimproc#shellescape'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'venv/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)\?$'

call unite#custom#source(
      \ 'file_rec/async,file_rec/git',
      \ 'ignore_pattern',
      \ s:unite_ignore_file_rec_patterns)


function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git
  else
    Unite file_rec/async
  endif
endfunction

nnoremap <silent> ,b :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,r :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,f :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
nnoremap <silent> ,s :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

"---------------------------------------------------------------------
" vim-exchange
"---------------------------------------------------------------------
xmap gx <Plug>(Exchange)

"--------------------------------------------------------------------
" ale
"---------------------------------------------------------------------
let g:ale_fixers = {
\   'python': ['autopep8', 'flake8']
\}

"--------------------------------------------------------------------
" jedi
"---------------------------------------------------------------------
autocmd FileType python setlocal completeopt-=preview
let g:jedi#goto_definitions_command = ",g"

"---------------------------------------------------------------------
" vim-go
"---------------------------------------------------------------------
au FileType go nmap ,gi <Plug>(go-imports)

"-------------------------------------------------------------------
" memolist-vim
"--------------------------------------------------------------------
let g:memolist_path = "$HOME/Dropbox/1writer"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "$HOME/Dropbox/1writer"

"--------------------------------------------------------------------
" lightline
"---------------------------------------------------------------------
set laststatus=2
set t_Co=256
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode'
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
