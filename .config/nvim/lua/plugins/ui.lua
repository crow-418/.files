local highlights = {
    StatusLine = { fg = "#aaaaaa", bg = "#242424" },
    StatusLineNC = { fg = "#444444", bg = "#080808" },

    Normal = { bg = "#101010" },
    NormalFloat = { fg = "#7a7a7a", bg = "#101010" },

    Pmenu = { fg = "#7a7a7a", bg = "#191919" },
    PmenuSel = { fg = "#000000", bg = "#cccccc" },

    DiagnosticOk = { fg = "#789978" },
    DiagnosticError = { fg = "#FF6C6B" },
    DiagnosticWarn = { fg = "#EBCB8B" },
    DiagnosticInfo = { fg = "#8AB4F8" },
    DiagnosticHint = { fg = "#BCCC9A" },
    DiagnosticDeprecated = { fg = "#ffaa88" },
    DiagnosticUnnecessary = { fg = "#444444" },
}

for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end

return {
    { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },
}
