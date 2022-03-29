local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end


if vim.fn.has("win32") == 1 then
  plugins_count = vim.fn.len(vim.fn.globpath("~/AppData/Local/nvim-data/site/pack/packer/start", "*", 0, 1))
else
  plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val =  {
  [[ _______             ____   ____.__         ]],
  [[ \      \   ____  ___\   \ /   /|__| _____  ]],
  [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
  [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
  [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
  [[        \/     \/                        \/ ]],
} 
  dashboard.section.buttons.val = {
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("m", "  Bookmarks", ":Telescope marks <CR>"),
 	dashboard.button("e", "  Extensions ", ":e ~/.config/nvim/lua/VisualStudioNeovim/Core/plugins.lua<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/VisualStudioNeovim/<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}


dashboard.section.footer.val = {
  "",
  "--   VisualStudioNeovim Loaded " .. plugins_count .. " plugins    --",
  "",
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
