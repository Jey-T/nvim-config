vim.o.tabstop = 2
vim.bo.tabstop = 2

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "deno_fmt", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "deno_fmt", stop_after_first = true },
		typescript = { "deno_fmt", stop_after_first = true },
		typescriptreact = { "deno_fmt", stop_after_first = true },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
