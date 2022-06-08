let test#strategy = "neovim"

" vim-test mappings
nnoremap <silent> <leader>vtn :TestNearest<CR>
nnoremap <silent> <leader>vtf :TestFile<CR>
nnoremap <silent> <leader>vta :TestSuite<CR>
nnoremap <silent> <leader>vtl :TestLast<CR>
nnoremap <silent> <leader>vtg :TestVisit<CR>
tnoremap <C-o> <C-\><C-n>

let g:docker_compose_proj_mapping = {'micro-service-portal': 'portal'}

" my functions
function! DockerComposeTransform(cmd) abort
  let l:root_folder = get(split(getcwd(), '/'), -1, '')

  if empty(glob('docker-compose.yml'))
    return a:cmd
  else
    return "docker-compose exec ". get(g:docker_compose_proj_mapping, l:root_folder, '') . ' '. a:cmd
  endif
endfunction

function! KbTestFile()
  let l:project = matchstr(@%, '^\(generations\|calendar\|transitions\)')
  let l:file_path = substitute(@%, '^' . l:project . '/',  '', 'g')

  if empty(l:project)
    echom 'project not found for ' . @%
  else
    let l:command = ":sp term://docker-compose exec " . l:project . " rspec " . l:file_path
    execute l:command
  endif
endfunction

function! KbTestLine()
  let l:project = matchstr(@%, '^\(generations\|calendar\|transitions\)')
  let l:file_path = substitute(@%, '^' . l:project . '/',  '', 'g')
  let l:current_line = line('.')

  if empty(l:project)
    echom 'project not found for ' . @%
  else
    let l:command = ":sp term://docker-compose exec " . l:project . " rspec " . l:file_path . ":" . l:current_line
    execute l:command
  endif
endfunction

nnoremap <silent> <leader>ktf :call KbTestFile()<CR>
nnoremap <silent> <leader>ktl :call KbTestLine()<CR>

let g:test#custom_transformations = {'docker_compose': function('DockerComposeTransform')}
let g:test#transformation = 'docker_compose'
