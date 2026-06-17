return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
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
                        ".git/",
                    },
                },
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown(),
                },
            })
            local builtin = require("telescope.builtin")

            local find_files_noignore = function()
                builtin.find_files({ no_ignore = true })
            end

            local diagnostics_one_file = function()
                builtin.diagnostics({ buffnr = 0 })
            end

            vim.keymap.set("n", "<leader>sf", find_files_noignore, { desc = "Find files" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume search" })
            vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "Search marks" })

            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto definition" })
            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto references" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Goto implementations" })
            vim.keymap.set("n", "go", builtin.lsp_outgoing_calls, { desc = "Goto outgoing" })
            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Document symbols" })
            vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })

            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

            vim.keymap.set('n', '<leader>q', diagnostics_one_file, { desc = 'Open diagnostics list' })
        end,
    },
}
