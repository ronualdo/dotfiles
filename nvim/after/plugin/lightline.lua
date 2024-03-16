vim.g.lightline = {
  colorscheme = "Tomorrow_Night",
  active = {
    left = {
      {"mode", "paste"},
      {"readonly", "filename", "modified"}
    }
  }
}
