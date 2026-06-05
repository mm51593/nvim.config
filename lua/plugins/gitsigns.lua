return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr })
                vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr })
            end,
        },
    },
}
