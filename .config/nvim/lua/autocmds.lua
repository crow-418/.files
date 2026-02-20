local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "highlight on yank",
})

autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    desc = "Disable New Line Comment",
})

autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = "go to last loc when opening a buffer",
})

autocmd("VimResized", {
    command = "wincmd =",
    desc = "Rebalance splits on resize",
})

autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not (client and client.server_capabilities.documentHighlightProvider) then
            return
        end

        autocmd("CursorMoved", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
            end,
            desc = "IDE-like highlight when stopping cursor",
        })

        autocmd({ "CursorMovedI", "BufLeave" }, {
            callback = vim.lsp.buf.clear_references,
            desc = "Clear LSP highlights",
        })
    end,
    desc = "Wrapper for IDE-like highlight cmds to check if lsp is attached",
})

autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
    desc = "Start treesitter",
})

autocmd("LspProgress", {
    callback = function(ev)
        local status = vim.lsp.status()
        if string.len(status) >= 80 then
            status = string.sub(status, 1, 80) .. ".."
        end

        vim.notify(status)

        if ev.data.params.value.kind == "end" then
            vim.defer_fn(function()
                vim.api.nvim_echo({ { "", "Normal" } }, false, {})
            end, 1000)
        end
    end,
    desc = "Show progress of LSP in cmdline",
})
