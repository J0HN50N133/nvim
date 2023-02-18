local api = vim.api

api.nvim_create_user_command('Lg',
  function(opts)
    vim.cmd.AsyncRun({'-mode=terminal', 'lazygit'})
  end,
  { nargs = 0 })
api.nvim_create_user_command('ReloadConf',
  function(opts)
    vim.cmd.source(MYVIMRC)
  end,
  { nargs = 0 })
