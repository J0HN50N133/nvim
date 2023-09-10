local function input_args()
        local argument_string = vim.fn.input("Program arg(s) (enter nothing to leave it null): ")
        return vim.fn.split(argument_string, " ", true)
end

local function input_exec_path()
        return vim.fn.input('Path to executable (default to "a.out"): ', vim.fn.expand("%:p:h") .. "/a.out", "file")
end

return function(opts)
        local dap = require('dap')
        local dapui = require('dapui')
        dapui.setup(opts)
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
        end
        dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                        command = 'codelldb',
                        args = { "--port", "${port}" },
                }
        }
        dap.configurations.cpp = {
                {
                        name = "Debug",
                        type = "codelldb",
                        request = "launch",
                        program = input_exec_path,
                        cwd = '${workspaceFolder}',
                        terminal = "integrated",
                        stopOnEntry = false,
                },
                {
                        name = "Debug (with args)",
                        type = "codelldb",
                        request = "launch",
                        program = input_exec_path,
                        args = input_args,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = false,
                        terminal = "integrated",
                },
                {
                        name = "Attach to a running process",
                        type = "codelldb",
                        request = "attach",
                        program = input_exec_path,
                        stopOnEntry = false,
                        waitFor = true,
                }
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
        local function dap_begin()
                vim.keymap.set('n', '<F5>', function() dap.continue() end)
                vim.keymap.set('n', '<F10>', function() dap.step_over() end)
                vim.keymap.set('n', '<F11>', function() dap.step_into() end)
                vim.keymap.set('n', '<F12>', function() dap.step_out() end)
                vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
                vim.keymap.set('n', '<Leader>lp',
                        function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
                vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
                vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
                vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                        require('dap.ui.widgets').hover()
                end)
                vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                        require('dap.ui.widgets').preview()
                end)
                vim.keymap.set('n', '<Leader>df', function()
                        local widgets = require('dap.ui.widgets')
                        widgets.centered_float(widgets.frames)
                end)
                vim.keymap.set('n', '<Leader>ds', function()
                        local widgets = require('dap.ui.widgets')
                        widgets.centered_float(widgets.scopes)
                end)
                dap.continue()
        end
        local function dap_end()
                vim.keymap.set('n', '<F5>', function() dap_begin() end)
                vim.keymap.del('n', '<F10>')
                vim.keymap.del('n', '<F11>')
                vim.keymap.del('n', '<F12>')
                vim.keymap.del('n', '<Leader>B')
                vim.keymap.del('n', '<Leader>lp')
                vim.keymap.del('n', '<Leader>dr')
                vim.keymap.del('n', '<Leader>dl')
                vim.keymap.del({ 'n', 'v' }, '<Leader>dh')
                vim.keymap.del({ 'n', 'v' }, '<Leader>dp')
                vim.keymap.del('n', '<Leader>df')
                vim.keymap.del('n', '<Leader>ds')
                dapui.close()
                dap.clear_breakpoints()
                dap.disconnect()
        end
        vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<F5>', function() dap_begin() end)
        vim.api.nvim_create_user_command('DapBegin',
                function()
                        dap_begin()
                end,
                { nargs = 0 })
        vim.api.nvim_create_user_command('DapEnd',
                function()
                        dap_end()
                end,
                { nargs = 0 })
end
