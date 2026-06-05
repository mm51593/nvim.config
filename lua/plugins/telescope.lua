return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-ui-select.nvim"
        },
        build = "make",

        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "➤ ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top",
                    },
                    file_ignore_patterns = {
                        ".git",
                    },
                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown(),
                },
            })
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })

            vim.keymap.set("n", "gd", builtin.lsp_definitions)
            vim.keymap.set("n", "gr", builtin.lsp_references)
            vim.keymap.set("n", "gi", builtin.lsp_implementations)
            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)
            vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols)

            vim.keymap.set("n", "<leader>gc", builtin.git_commits)
            vim.keymap.set("n", "<leader>gb", builtin.git_branches)
            vim.keymap.set("n", "<leader>gs", builtin.git_status)
        end,
    },
}
