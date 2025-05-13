vim.cmd.colorscheme("tokyonight")

vim.o.background = "dark"
-- Transparent backgrounds for various elements
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "NONE", bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "NONE", bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "NONE", bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "NONE", bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "NONE", bg = "NONE", ctermbg = "NONE" })

local hl = vim.api.nvim_get_hl(0, { name = "NormalFloat" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = hl.bg, fg = hl.fg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa" })

vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
	config = config or {}
	config.border = "rounded"
	config.winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"

	if not (result and result.contents) then
		return
	end

	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util._trim(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then
		return
	end

	return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end
