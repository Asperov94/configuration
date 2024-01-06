"====================================================
" General settings
""=====================================================
call plug#begin('~/.config/nvim/plugged')
  Plug 'nvim-lua/plenary.nvim' " какая то зависимостьcolorscheme gruvbox
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " для поиска hi Normal guibg=NONE ctermbg=NONE
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " для поиска файловhi NonText guibg=NONE ctermbg=NONE
  Plug 'nvim-telescope/telescope.nvim' " для грепа                    hi VertSplit guibg=NONE ctermbg=NONE
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " для дополнения текста hi StatusLine guibg=NONE ctermbg=NONE
  Plug 'preservim/nerdtree' " Експлорер                           hi StatusLineNC guibg=NONE ctermbg=NONE
  Plug 'f-person/git-blame.nvim' " Гит блейм :GitBlameToggle          syntax on                             " Включаем подсветку синтаксиса кода
  Plug 'nvim-lua/plenary.nvim'         " зависимость для неогитlet no_buffers_menu=1                  " Отключаем меню в буферах
  Plug 'sindrets/diffview.nvim'        " зависимость для неогитlet g:gitblame_virtual_text_column = 80
  Plug 'ibhagwan/fzf-lua'              " зависимость для неогитlet g:gitblame_delay = 5000
  Plug 'TimUntersberger/neogit' " посмотреть изменения гитset backspace=indent,eol,start         " Настройка backspace для удобного редактирования
  Plug 'rbong/vim-flog'                                                                               
  Plug 'morhetz/gruvbox'                                                                              
  Plug 'nvim-tree/nvim-web-devicons'                                                                  
  Plug 'tpope/vim-fugitive'                                                                           
call plug#end()                                                                                       


colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
let g:gitblame_virtual_text_column = 120
""=====================================================
set mousemodel=popup                  " Устанавливаем режим работы мыши в popup
set mouse=                            " Отключаем определение режима мыши
set ttyfast                           " Устанавливаем параметр ttyfast
set ruler                             " Включаем отображение позиции курсора в статусной строке
set switchbuf=useopen                 " настройка, которая указывает Vim отдавать предпочтение уже открытым буферам при переключении между файлами.
set completeopt-=preview              " Изменяем параметры завершения текста
set visualbell t_vb=                  " отключаем пищалку и мигание 
set gcr=a:blinkon0                    " Устанавливаем параметр gcr для анимации мигания курсора
set novisualbell                      " отключаем пищалку и мигание
set enc=utf-8                         " Устанавливаем кодировку UTF-8 по умолчанию в файлах
set ls=2                              " Всегда показываем статусбар
set incsearch                         " Включаем инкрементный поиск
set hlsearch                          " Включаем подсветку результатов поиска
set nu                                " Показывать номера строк
set scrolloff=5                       " Скролл на 5 строк за раз
set nobackup                          " Отключаем создание резервных копий файлов
set nowritebackup                     " Отключаем резервное копирование при редактировании
set noswapfile                        " Отключаем создание файлов обмена
set expandtab                         "
set tabstop=2                         " Настройка для работы с символом Tab
set shiftwidth=2                      "
set smartcase                         "
set ignorecase                        "
set clipboard=unnamedplus             "
set title titlestring=%{getcwd()}     "
set statusline=%{getcwd()}            "
set showtabline=2                     "
"=================Мои Клавиши==========================
:map <F2> :NERDTree %:p:h<CR>
:map <F5> :term %:p<CR>:startinsert<CR>
:map <F3> :term<CR>:startinsert<CR>
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gl :term lazygit<CR>:startinsert<CR>
nnoremap gs :!git status<CR>
nnoremap tt :term <CR>:startinsert<CR>
nnoremap tn :tabnew .<CR>
nnoremap tv :vsplit<CR>
nnoremap ts :split<CR>
nnoremap <C-S-c> y
nnoremap <C-p> <C-w>
nnoremap <leader>gg :call ToggleDiffview()<CR>
nnoremap <leader>gd :execute 'DiffviewOpen develop...' . system('git symbolic-ref --short HEAD')<Bar>let g:diffview_is_open = 1<CR>
function! ToggleDiffview()
  if exists('g:diffview_is_open') && g:diffview_is_open
    let g:diffview_is_open = 0
    DiffviewClose
  else
    let g:diffview_is_open = 1
    DiffviewOpen
  endif
endfunction
"===========================================================

set showcmd

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
