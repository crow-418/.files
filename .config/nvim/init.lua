-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "plugins",
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})

require("options")
require("autocmds")

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
    "tinymist",
    "emmet_language_server",
})

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
