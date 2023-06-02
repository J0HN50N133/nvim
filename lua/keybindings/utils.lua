---@param cmd string
-- return <Plug>(`cmd`)
function Plug(cmd)
	return string.format("<Plug>(%s)", cmd)
end

---@param keyseq string
-- return <leader>(`keyseq`)
function Leader(keyseq)
	return string.format("<Leader>%s", keyseq)
end

---@param cmd string
-- return :`cmd`<CR>
function Colon(cmd)
	return string.format(":%s<CR>", cmd)
end

function Alt(key)
	return string.format("<M-%s>", key)
end

function CocActionAsync(action, ...)
	local args = { ... }
	return function() vim.fn.CocActionAsync(action, unpack(args)) end
end

function CocAction(action, ...)
	local args = { ... }
	return function() vim.fn.CocAction(action, unpack(args)) end
end

-- user define operator
local function infix(f)
	local mt = { __sub = function(self, b) return f(self[1], b) end }
	return setmetatable({}, { __sub = function(a, _) return setmetatable({ a }, mt) end })
end

_G._to = infix(
	function(a, b)
		return
				function(arg)
					return b(a(arg))
				end
	end)
