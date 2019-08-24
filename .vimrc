call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Esc mapping
inoremap jk <ESC>
inoremap kj <ESC>
noremap <C-C> <ESC>
xnoremap <C-C> <ESC>

" Fzf
nnoremap <C-x><C-f> :Files<Cr>
nnoremap <leader>s :BLines<Cr>
nnoremap <C-x>b :Buffers<Cr>
