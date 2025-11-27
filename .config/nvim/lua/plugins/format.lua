return {
    {
        "stevearc/conform.nvim",
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({
                        async = true,
                    })
                end,
                desc = "Format buffer on keybind",
            },
        },
        opts = {
            formatters_by_ft = {
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescriptreact = { "prettierd" },
                css = { "prettierd" },
                html = { "prettierd" },
                json = { "prettierd" },
                yaml = { "prettierd" },
                go = { "gofmt", "goimports" },
                lua = { "stylua" },
                python = { "black" },
                rust = { "rustfmt" },
                toml = { "rustfmt" },
            },
        },
    },
}
