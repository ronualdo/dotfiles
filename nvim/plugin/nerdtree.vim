" nerdtree config
let NERDTreeQuitOnOpen=1

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

noremap <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>ntf :NERDTreeFind<CR>
