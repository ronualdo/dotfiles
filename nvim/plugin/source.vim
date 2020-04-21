if !exists(":Source")
  command Source source ~/.config/nvim/init.vim
endif

if !exists(":SourceAndInstall")
  command SourceAndInstall source ~/.config/nvim/init.vim <bar> :PlugInstall
endif
