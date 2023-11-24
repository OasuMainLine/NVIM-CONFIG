-- This file is for setting up packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  vim.notify("Error while importing packer")
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])




local attach_plugins = function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim", } -- Useful lua functions used by lots of plugins

  -- Completion
  use { "hrsh7th/nvim-cmp", }         -- The completion plugin
  use { "hrsh7th/cmp-buffer", }       -- buffer completions
  use { "hrsh7th/cmp-path", }         -- path completions
  use { "saadparwaiz1/cmp_luasnip", } -- snippet completions
  use { "L3MON4D3/LuaSnip", tag = "v2.1.0", run = "make install_jsregexp" }
  use { "hrsh7th/cmp-nvim-lsp", }
  use { "hrsh7th/cmp-nvim-lua", }

  -- Comments
  use { "numToStr/Comment.nvim", }
  -- LSP
  use { "neovim/nvim-lspconfig", }
  use {
    "williamboman/mason.nvim"
  }
  use { "williamboman/mason-lspconfig.nvim", }


  -- Formatting
  use { "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } }

  -- Linting
  use { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } }
  -- Highlighting
  use {
    "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
  }
  -- File Explorer
  use {
    "nvim-tree/nvim-web-devicons"
  }
  use {
    "nvim-tree/nvim-tree.lua"
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { "nvim-telescope/telescope-project.nvim", requires = { { "nvim-telescope/telescope.nvim" } } }

  -- Colorschemes
  use "lunarvim/darkplus.nvim"

  -- Statusline
  use({
    "NTBBloodbath/galaxyline.nvim",
    -- your statusline
    config = function()
      require("user.plugins.galaxyline")
    end,
    -- some optional icons
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })

  -- startup
  use {
    'goolord/alpha-nvim',
  }
  -- sessions
  use { "natecraddock/sessions.nvim" }
  if packer_bootstrap then
    require("packer").sync()
  end
end

packer.startup({
  attach_plugins,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
