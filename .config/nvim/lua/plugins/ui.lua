return {
    {
        "nvim-mini/mini.diff",
        event = "VeryLazy",
        version = "*",
        opts = {
            view = {
                style = "sign",
                signs = {
                    add = "┃",
                    change = "┃",
                    delete = "_",
                },
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            delay = 0,
            icons = {
                mappings = false,
            },
            sort = { "alphanum" },
        },
    },
    { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd.colorscheme("vague")
        end,
    },
}
