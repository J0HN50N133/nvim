local bin_path = vim.fn.stdpath('data') .. '/bin'
local ghproxy = 'https://ghproxy.com/'
local fmt = string.format
vim.fn.setenv("PATH", bin_path .. ":" .. vim.fn.getenv("PATH"))
local function boot_lazy()
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
                vim.fn.system({
                        "git",
                        "clone",
                        "--filter=blob:none",
                        ghproxy .. "https://github.com/folke/lazy.nvim.git",
                        "--branch=stable", -- latest stable release
                        lazypath,
                })
        end
        vim.opt.rtp:prepend(lazypath)
end
local function boot_rg()
        -- bootstrap, get rg
        local rg_path = bin_path .. '/rg'
        if not vim.loop.fs_stat(rg_path) then
                local VERSION = '13.0.0'
                local URL = fmt(
                        '%sgithub.com/BurntSushi/ripgrep/releases/download/%s/ripgrep-%s-x86_64-unknown-linux-musl.tar.gz',
                        ghproxy, VERSION, VERSION)
                os.execute('mkdir -p ' .. bin_path)
                os.execute(fmt("curl -sL %s | tar -xzf - -C %s --wildcards '*/rg' --strip=1", URL, bin_path))
        end
end

local function boot_node()
        local node_path = bin_path .. '/nodejs'
        if not vim.loop.fs_stat(node_path .. '/bin/node') then
                local VERSION = 'v18.17.1'
                local DISTRO = 'linux-x64'
                local URL = fmt('https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/%s/node-%s-%s.tar.xz',
                        VERSION, VERSION, DISTRO)
                os.execute('mkdir -p ' .. node_path)
                os.execute(fmt('curl -sL %s | tar -xJ --strip=1 -C %s', URL, node_path))
        end
        vim.fn.setenv("PATH", node_path .. '/bin' .. ":" .. vim.fn.getenv("PATH"))
end

boot_lazy()
boot_rg()
boot_node()
