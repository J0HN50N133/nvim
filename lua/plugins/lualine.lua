require('lualine').setup({
	options = {
		theme = 'tokyonight',
	},
	sections = {
		lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰰂 ' }
			},
		},
	},
})
