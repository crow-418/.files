vim.lsp.enable({
    "rust_analyzer",
    "lua_ls",
    "html",
    "cssls",
    "clangd",
    "bashls",
    "pyright",
    "ts_ls",
    "gopls",
    "yamlls",
    "emmet_language_server",
})

return {
    { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },
    { "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
}
