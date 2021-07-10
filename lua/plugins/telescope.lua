local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                -- ["<C-n>"] = actions.cycle_history_next,
                -- ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<Esc>"] = actions.close,

                ["<c-q>"] = trouble.open_with_trouble,
            },

            n = {
                ["<c-q>"] = trouble.open_with_trouble,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        winblend = 10,
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    }
}

require("telescope").load_extension("fzf")
