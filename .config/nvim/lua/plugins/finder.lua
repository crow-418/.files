local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.4 * vim.o.columns)
    return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

return {
    {
        "echasnovski/mini.pick",
        version = "*",
        keys = {
            { "<leader>ff", "<cmd>Pick files<cr>",     desc = "Pick find files" },
            { "<leader>fg", "<cmd>Pick grep_live<cr>", desc = "Pick live grep" },
            { "<leader>fb", "<cmd>Pick buffers<cr>",   desc = "Pick buffers" },
            { "<leader>fh", "<cmd>Pick help<cr>",      desc = "Pick help tags" },
        },
        opts = {
            options = {
                use_cache = true,
            },
            window = {
                config = win_config,
            },
        },
    },
}
