local e = vim.env
local g = vim.g
local fn = vim.fn

e.GTAGSLABEL = 'native-pygments'
e.GTAGSCONF = '/usr/share/gtags/gtags.conf'
-- gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
g.gutentags_project_root = {'.root', '.svn', '.git', '.hg', '.project'}
g.gutentags_ctags_tagfile = '.tags'

-- 同时开启 ctags 和 gtags 支持：
g.gutentags_modules = {}
if fn.executable('ctags') then
	table.insert(g.gutentags_modules, 'ctags')
end

-- 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
g.gutentags_cache_dir = fn.expand('~/.cache/tags')
--配置 ctags 的参数
g.gutentags_ctags_extra_args = {'--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px'}

--如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
table.insert(g.gutentags_ctags_extra_args, '--output-format=e-ctags')

--禁用 gutentags 自动加载 gtags 数据库的行为
g.gutentags_auto_add_gtags_cscope = 1
--g.gutentags_define_advanced_commands = 1
g.gutentags_plus_switch = 1

