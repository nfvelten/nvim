local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "VisualStudioNeovim.Configs.LSP.lsp-installer"
require("VisualStudioNeovim.Configs.LSP.handlers").setup()
require "VisualStudioNeovim.Configs.LSP.null-ls"
