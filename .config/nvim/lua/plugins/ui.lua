return {
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
