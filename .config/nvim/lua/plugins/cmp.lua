return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "1.*",
        opts = {
            keymap = { preset = "default" },

            sources = {
                default = { "lsp", "path", "buffer" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = { documentation = { auto_show = true } },
        },
        opts_extend = { "sources.default" },
    },
}
