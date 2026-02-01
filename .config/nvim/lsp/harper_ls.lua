---@type vim.lsp.Config
return {
    cmd = { "harper-ls", "--stdio" },
    filetypes = {
        "asciidoc",
        "gitcommit",
        "html",
        "markdown",
        "typst",
        "toml",
    },
    root_markers = { ".harper-dictionary.txt", ".git" },
}
