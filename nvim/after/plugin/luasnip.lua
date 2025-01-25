local ls = require("luasnip")
local lua_loaders = require("luasnip.loaders.from_lua")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-O>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

lua_loaders.load({paths = vim.fn.stdpath("config").."/snippets"})
