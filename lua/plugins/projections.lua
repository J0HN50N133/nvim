vim.opt.sessionoptions:append("localoptions") -- Save localoptions to session file
require("projections").setup({
        patterns = { ".git", ".svn", ".hg", ".root" },
        store_hooks = {
                pre = function()
                        -- nvim-tree
                        local nvim_tree_present, api = pcall(require, "nvim-tree.api")
                        if nvim_tree_present then api.tree.close() end
                        -- terminal
                        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr})
                                if buftype == "terminal" then
                                        vim.api.nvim_buf_delete(bufnr, { force = true })
                                end
                        end
                end
        }
})
-- Autostore session on VimExit
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        callback = function()
                Session.store(vim.loop.cwd())
        end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
                if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
        end,
})

local Session = require("projections.session")
vim.api.nvim_create_user_command("StoreProjectSession", function()
        Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
        Session.restore(vim.loop.cwd())
end, {})

local Workspace = require("projections.workspace")
-- Add workspace command
vim.api.nvim_create_user_command("AddWorkspace", function()
        Workspace.add(vim.loop.cwd())
end, {})
