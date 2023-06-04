-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
