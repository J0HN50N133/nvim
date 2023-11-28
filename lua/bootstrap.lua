local uv = vim.uv
local bin_path = vim.fn.stdpath('data') .. '/bin'
local ghproxy = (function(need_proxy) if need_proxy then return 'https://mirror.ghproxy.com/' else return '' end end)(true)
local fmt = string.format
vim.fn.setenv("PATH", bin_path .. ":" .. vim.fn.getenv("PATH"))

local function boot_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  vim.opt.rtp:prepend(lazypath)
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      ghproxy .. "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",   -- latest stable release
      lazypath,
    })
  end
end
local function boot_rg()
  -- bootstrap, get rg
  local rg_path = bin_path .. '/rg'
  if not vim.loop.fs_stat(rg_path) then
    local VERSION = '13.0.0'
    local URL = ghproxy .. fmt(
      'github.com/BurntSushi/ripgrep/releases/download/%s/ripgrep-%s-x86_64-unknown-linux-musl.tar.gz',
      VERSION, VERSION)
    local cmd = fmt("curl -sL %s | tar -xzf - -C %s --wildcards '*/rg' --strip=1", URL, bin_path)
    os.execute('mkdir -p ' .. bin_path)
    uv.new_thread(function(command)
      os.execute(command)
    end, cmd)
  end
end

local function boot_node()
  local node_path = bin_path .. '/nodejs'
  local exe_path = node_path .. '/bin/node'
  if not vim.loop.fs_stat(exe_path) then
    local VERSION = 'v18.17.1'
    local DISTRO = 'linux-x64'
    local URL = fmt('https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/%s/node-%s-%s.tar.xz',
      VERSION, VERSION, DISTRO)
    uv.new_thread(function(node_path, URL)
      os.execute('mkdir -p ' .. node_path)
      os.execute(string.format('curl -sL %s | tar -xJ --strip=1 -C %s', URL, node_path))
    end, node_path, URL)
  end
  vim.fn.setenv("PATH", node_path .. '/bin' .. ":" .. vim.fn.getenv("PATH"))
end

local function boot_lldb()
  local codelldb_path = bin_path .. '/codelldb'
  local exe_path = codelldb_path .. '/extension/adapter/codelldb'
  if not vim.loop.fs_stat(exe_path) then
    local VERSION = 'v1.9.2'
    local ARCH = 'x86_64'
    local OS = 'linux'
    local URL = ghproxy ..
        fmt('github.com/vadimcn/codelldb/releases/download/%s/codelldb-%s-%s.vsix', VERSION,
          ARCH, OS)
    -- install
    local tmpname = os.tmpname()
    uv.new_thread(function(tmpname, URL, codelldb_path)
      os.execute(string.format('wget -qO %s %s', tmpname, URL))
      os.execute(string.format('unzip %s -d %s', tmpname, codelldb_path))
    end, tmpname, URL, codelldb_path)
    vim.fn.setenv("PATH", codelldb_path .. '/extension/adapter' .. ":" .. vim.fn.getenv("PATH"))
  end
end

local main = function()
  boot_lazy()
  boot_rg()
  boot_node()
  boot_lldb()
end

main()
