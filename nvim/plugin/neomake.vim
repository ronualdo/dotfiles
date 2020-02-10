" neomake config
augroup neomake
  autocmd! BufWritePost * Neomake
augroup END

let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_python_enabled_makers=['flake8']
let g:neomake_ruby_enabled_makers=['rubocop', 'reek', 'mri']
let g:neomake_elixir_enabled_makers = ['elixir']
