-- Ensuring packer is installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

--Autocommand that reloads neovim when saving this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

--plugins
return packer.startup(function(use)
	--my plugins
	use("wbthomason/packer.nvim") --nvim
	use("joshdick/onedark.vim") -- colorscheme: onedark
	use({ "svrana/neosolarized.nvim", requires = { "tjdevries/colorbuddy.nvim" } }) -- colorscheme: neosolarized
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("christoomey/vim-tmux-navigator") -- tmux
	use("szw/vim-maximizer") -- vim maximizer window
	use("tpope/vim-surround") -- surround
	use("numToStr/Comment.nvim") -- comments
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("windwp/nvim-autopairs") -- autopairs
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autotag

	use("kyazdani42/nvim-web-devicons") -- icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" }) -- tabbar

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	--autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	--snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--managing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim") -- typescrpt added functionality
	use("onsails/lspkind.nvim")

	--formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	--gitsigns
	use("lewis6991/gitsigns.nvim")
	-- git fugitive
	use({ "dinhhuy258/git.nvim" })
	--toggleterm
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	--indent lines
	use("lukas-reineke/indent-blankline.nvim")
	--copilot
	use("github/copilot.vim")
	--colorizer
	use("norcalli/nvim-colorizer.lua") --regular colors
	use({
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
	}) --tailwind color highlighting

	if packer_bootstrap then
		require("packer").sync()
	end
end)
