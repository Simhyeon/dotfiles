call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
Plug 'lervag/vimtex'
Plug 'timonv/vim-cargo'
Plug 'udalov/kotlin-vim'
Plug 'shime/vim-livedown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release' }
Plug 'dense-analysis/ale'
call plug#end()

set autoindent
imap jk <Esc>
vmap jk <Esc>
set tabstop=4
set cindent
set smartindent
set shiftwidth=4
set number
set more
set ruler
set encoding=UTF-8
" set noshowmatch
set autoread
syntax enable
set mouse=a
set termguicolors
colorscheme seoul256
colo seoul256
set background=dark
let g:seoul256_background = 256

" highlight MatchParen cterm=none ctermbg=green ctermfg=blue
highlight Comment ctermfg=grey cterm=italic
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <silent> <F6> :NERDTreeToggle<CR>
nmap <silent> <F8> :Vista!!<CR>

" showmatch disable
" let g:loaded_matchparen=1

" airline theme
let g:airline_theme='seoul256'
set hidden

"gruvbox speicfic configs
" let g:gruvbox_italic = 1
" let g:gruvbox_bold = 1

highlight clear SignColumn

" line number toggle setting relative on normal absolute on insert
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" remove background color
hi Normal guibg=NONE ctermbg=NONE


" ---------------------------------------------------------------------------------------------
  
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
"  Markdown plugin
nmap <silent> <C-l> :LivedownToggle<CR>
let g:livedown_browser = "firefox"
" ---------------------------------------------------------------------------------------------
" custom keymap
" toggle nerd tree
map <silent> <C-n> :NERDTreeToggle<CR>

" ---------------------------------------------------------------------------------------------
"  FzfPreview Settings
map <silent> <C-f> :CocCommand fzf-preview.ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ---------------------------------------------------------------------------------------------
" Coc Setting
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ---------------------------------------------------------------------------------------------
" Vista vim
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["▸ ", ""]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0

"-------------------------------------------------------------
" fzf config

nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-q> :q<CR>
" nnoremap <silent> <Leader>e :call Fzf_dev()<CR>

" " general
" let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
" let $FZF_DEFAULT_OPTS="--reverse " " top to bottom
" 
" " use rg by default
" if executable('rg')
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif
" 
" " floating fzf window with borders
" function! CreateCenteredFloatingWindow()
"     let width = min([&columns - 4, max([80, &columns - 20])])
"     let height = min([&lines - 4, max([20, &lines - 10])])
"     let top = ((&lines - height) / 2) - 1
"     let left = (&columns - width) / 2
"     let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
" 
"     let top = "╭" . repeat("─", width - 2) . "╮"
"     let mid = "│" . repeat(" ", width - 2) . "│"
"     let bot = "╰" . repeat("─", width - 2) . "╯"
"     let lines = [top] + repeat([mid], height - 2) + [bot]
"     let s:buf = nvim_create_buf(v:false, v:true)
"     call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"     call nvim_open_win(s:buf, v:true, opts)
"     set winhl=Normal:Floating
"     let opts.row += 1
"     let opts.height -= 2
"     let opts.col += 2
"     let opts.width -= 4
"     call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     au BufWipeout <buffer> exe 'bw '.s:buf
" endfunction
" 
" " Files + devicons + floating fzf
" function! Fzf_dev()
"   let l:fzf_files_options = '--preview "bat --theme="base16" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
"   function! s:files()
"     let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
"     return s:prepend_icon(l:files)
"   endfunction
" 
"   function! s:prepend_icon(candidates)
"     let l:result = []
"     for l:candidate in a:candidates
"       let l:filename = fnamemodify(l:candidate, ':p:t')
"       " Currently glyph support is very poor in alacritty which is daily
" 	  " termianl 
" 	  let l:icon = "`"
" 	  "WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
"       call add(l:result, printf('%s %s', l:icon, l:candidate))
"     endfor
" 
"     return l:result
"   endfunction
" 
"   function! s:edit_file(item)
"     let l:pos = stridx(a:item, ' ')
"     let l:file_path = a:item[pos+1:-1]
"     execute 'silent e' l:file_path
"   endfunction
" 
"   call fzf#run({
"         \ 'source': <sid>files(),
"         \ 'sink':   function('s:edit_file'),
"         \ 'options': '-m --reverse ' . l:fzf_files_options,
"         \ 'down':    '40%',
"         \ 'window': 'call CreateCenteredFloatingWindow()'})
" 
" endfunction

" fzf recommended command
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

"-------------------------------------------------------------
" NerdTree Configs
"
" UI Settings
" let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
" let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree

"-------------------------------------------------------------
" LaTex option

let g:tex_flavor='latex'

"-------------------------------------------------------------
" split option
set splitbelow splitright

nnoremap <C-h> <C-W>h 
nnoremap <C-j> <C-j>j 
nnoremap <C-k> <C-k>k 
nnoremap <C-l> <C-l>l 

nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

set fillchars+=vert:\ 
