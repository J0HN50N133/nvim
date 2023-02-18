conf_root = vim.fn.expand('~/.config/nvim/')
vimplug = conf_root .. 'autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(vimplug)) ~= 0 then
  os.execute('curl -fLo ' .. vimplug .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.api.nvim_create_autocmd({"VimEnter"}, {
    pattern = {"*"},
    command = "PlugInstall -- sync | source $MYVIMRC"
  })
end
vim.o.runtimepath = table.concat( { conf_root, vim.o.runtimepath, conf_root..'after' } , ",")
vim.o.packpath = vim.o.runtimepath
vim.o.conceallevel = 3
vim.cmd.source('~/.config/nvim/general.vim')
vim.cmd.source('~/.config/nvim/mycommand.vim')
vim.cmd.source('~/.config/nvim/plug_list.vim')
vim.cmd.source('~/.config/nvim/plugconf.vim')
vim.cmd.source('~/.config/nvim/apperance.vim')
vim.cmd.source('~/.config/nvim/keybindings.vim')
vim.cmd.source('~/.config/nvim/treesitter.lua')
