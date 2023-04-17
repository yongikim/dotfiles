local function get_setup(name)
	return string.format('require("plugins.%s")', name)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Sessions
	-- use({
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require("auto-session").setup({
	-- 			log_level = "error",
	-- 			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- 		})
	-- 	end,
	-- })

	-- Filer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
		config = get_setup("neo-tree"),
	})

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = get_setup("telescope"),
	})
	use({
		"kevinhwang91/nvim-hlslens",
		config = get_setup("hlslens"),
	}) -- 単語検索で何個目のヒットかをカーソル横に表示

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = get_setup("lspconfig"),
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = get_setup("mason-lspconfig"),
	})

	-- Comment out
	-- use 'tpope/vim-commentary'

	-- 補完
	use({
		"hrsh7th/nvim-cmp",
		config = get_setup("cmp"),
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use({
		"windwp/nvim-autopairs", -- カッコを自動で閉じる
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Format on save
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = get_setup("null-ls"),
	})

	-- 構文解析(treesitter)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = get_setup("treesitter"),
	})

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = get_setup("markdown-preview"),
	})

	-- colorschemes
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("nvim-colorizer").setup()
		end,
	})
	-- use({
	-- 	"svrana/neosolarized.nvim", -- Solarized
	-- 	requires = { "tjdevries/colorbuddy.nvim" },
	-- 	config = get_setup("neosolarized"),
	-- })
	use({
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = true,
				theme = "dragon",
			})
			vim.cmd("colorscheme kanagawa")
		end,
	})
	-- use({
	-- 	"shaunsingh/solarized.nvim",
	-- 	config = function()
	-- 		require("solarized").set()
	-- 		vim.cmd("colorscheme solarized-high")
	-- 	end,
	-- })
	use("folke/tokyonight.nvim")
	use("ishan9299/nvim-solarized-lua") -- treesitterに対応したsolarized
	use({
		"mhartington/oceanic-next",
	})
	use({
		"Th3Whit3Wolf/onebuddy",
	})
	use({
		"Th3Whit3Wolf/one-nvim",
	})
	use({
		"RRethy/nvim-base16",
	})

	-- UI parts
	-- use({
	-- 	"startup-nvim/startup.nvim", -- 起動画面
	-- 	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local buffer_name = vim.fn.expand("%")
	-- 		if buffer_name ~= "" then
	-- 			print(buffer_name)
	-- 			vim.g.startup_disable_on_startup = true
	-- 		end
	-- 		require("startup").setup()
	-- 	end,
	-- })
	use({
		"j-hui/fidget.nvim", -- nvim-lspの稼働状況を表示
		config = function()
			require("fidget").setup()
		end,
	})
	use("kkharji/lspsaga.nvim") -- リッチなUI
	use("folke/lsp-colors.nvim") -- 色を豊かに
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = get_setup("lualine"),
	})
	use({
		"SmiteshP/nvim-navic", -- 今いる関数名をステータスラインに表示
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"akinsho/bufferline.nvim", -- バッファライン
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	})
	use("onsails/lspkind.nvim") -- 補完の候補の横にアイコンを表示
	use({
		"petertriho/nvim-scrollbar", -- スクロールバー
		config = function()
			require("scrollbar").setup()
			require("scrollbar.handlers.search").setup()
		end,
	})
	use({
		"lewis6991/gitsigns.nvim", -- Git情報を行番号の左に表示
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ -- エラー情報を表示
		"folke/trouble.nvim",

		requires = "kyazdani42/nvim-web-devicons",
		config = get_setup("trouble"),
	})

	-- ターミナル
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = get_setup("toggleterm"),
	})

	require("plugins.lsp")

	-- Tex
	use({
		"lervag/vimtex",
		config = get_setup("vimtex"),
	})
end)
