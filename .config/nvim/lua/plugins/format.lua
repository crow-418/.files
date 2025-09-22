return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
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
                sh = { "shfmt" },
                rust = { "rustfmt" },
                toml = { "rustfmt" },
                c = { "clang-format" },
            },
        },
    },
}
