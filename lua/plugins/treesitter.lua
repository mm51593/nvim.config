return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").install({
                    "c",
                    "cpp",
                    "rust",
                    "go",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "bash",
                    "json",
                    "yaml",
                    "toml",
                    "markdown",
                    "markdown_inline",
                    "zig",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local bufnr = args.buf
                    if vim.treesitter.get_parser(bufnr, nil, { error = false }) then
                        vim.treesitter.start(bufnr)
                    end
                end,
            })
        end,
    },
}
