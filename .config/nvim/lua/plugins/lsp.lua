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
    { "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
}
