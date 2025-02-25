return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{ "onsails/lspkind.nvim" },
	-- {
	-- 	"zeioth/garbage-day.nvim",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- aggressive_mode = false
	-- 		-- grace_period = 60 * 15
	-- 	},
	-- },
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("configs.lint")
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.cmp")
		end,
	},
	-- { "L3MON4D3/LuaSnip" },
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.treesitter"),
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 		{
	-- 			"s1n7ax/nvim-window-picker",
	-- 			version = "2.*",
	-- 			config = function()
	-- 				require("window-picker").setup({
	-- 					filter_rules = {
	-- 						include_current_win = false,
	-- 						autoselect_one = true,
	-- 						-- filter using buffer options
	-- 						bo = {
	-- 							-- if the file type is one of following, the window will be ignored
	-- 							filetype = { "neo-tree", "neo-tree-popup", "notify" },
	-- 							-- if the buffer type is one of following, the window will be ignored
	-- 							buftype = { "terminal", "quickfix" },
	-- 						},
	-- 					},
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"stevearc/resession.nvim",
	-- 	config = function()
	-- 		require("configs.resession")
	-- 	end,
	-- },
	-- { "folke/zen-mode.nvim" },
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- },
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = "InsertEnter",
	-- 	config = true,
	-- },
	-- { "max397574/better-escape.nvim" },
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-neotest/nvim-nio",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		{
	-- 			"fredrikaverpil/neotest-golang",
	-- 			version = "*",
	-- 			dependencies = { "andythigpen/nvim-coverage" },
	-- 		},
	-- 		"V13Axel/neotest-pest",
	-- 		"rouge8/neotest-rust",
	-- 		"nvim-neotest/neotest-jest",
	-- 	},
	-- 	config = function()
	-- 		require("configs.neotest")
	-- 	end,
	-- },
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"simrat39/inlay-hints.nvim",
		dependencies = {
			"simrat39/rust-tools.nvim",
		},
	},
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	lazy = false,
	-- },
	-- {
	-- 	"rachartier/tiny-inline-diagnostic.nvim",
	-- 	event = "VeryLazy", -- Or `LspAttach`
	-- 	priority = 1000, -- needs to be loaded in first
	-- 	config = function()
	-- 		require("tiny-inline-diagnostic").setup()
	-- 		vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
	-- 	end,
	-- },
	-- {
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup()
	-- 	end,
	-- },
	-- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	-- { "brenoprata10/nvim-highlight-colors" },
	-- { "karb94/neoscroll.nvim" },
	-- { "m4xshen/smartcolumn.nvim" },
	-- { "nvim-focus/focus.nvim", version = "*" },
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
	-- { "gelguy/wilder.nvim" },
	-- {
	-- 	"adelarsq/image_preview.nvim",
	-- 	event = "VeryLazy",
	-- },
	-- { "willothy/wezterm.nvim" },
}
