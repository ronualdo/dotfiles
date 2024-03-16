local create_user_command = vim.api.nvim_create_user_command

create_user_command('Vrun',
  function(opts)
    local command = ":vsp term://{%s}"
    vim.cmd(string.format(command, opts.fargs[1]))
  end,
  {
    nargs=1,
    desc="Runs the command provided as arg in a vertical terminal"
  }
)

create_user_command('Trun',
  function(opts)
    local command = ":tabnew term://{%s}"
    vim.cmd(string.format(command, opts.fargs[1]))
  end,
  {
    nargs=1,
    desc="Runs the command provided as arg in a new tab"
  }
)

create_user_command('Run',
  function(opts)
    local command = ":sp term://{%s}"
    vim.cmd(string.format(command, opts.fargs[1]))
  end,
  {
    nargs=1,
    desc="Runs the command provided as arg in a horizontal terminal"
  }
)
