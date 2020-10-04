call neomake#configure#automake('nrwi', 500)

let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_ruby_enabled_makers=['rubocop', 'reek', 'mri']
let g:neomake_elixir_enabled_makers = ['elixir']
