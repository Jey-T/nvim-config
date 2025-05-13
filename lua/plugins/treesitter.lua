local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")
		vim.diagnostic.config({
			virtual_text = true, -- Shows error messages inline
			signs = true, -- Shows signs in the gutter
			underline = true, -- Underlines offending code
			update_in_insert = false,
			severity_sort = true,
		})

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"typescript",
				"html",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

return { M }
