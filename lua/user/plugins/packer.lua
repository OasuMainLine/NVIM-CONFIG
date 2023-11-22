-- This file is for setting up packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

local attach_plugins = function (use)

   use { "wbthomason/packer.nvim"} -- Have packer manage itself
  use { "nvim-lua/plenary.nvim",} -- Useful lua functions used by lots of plugins
  
  -- Completion
  use { "hrsh7th/nvim-cmp", } -- The completion plugin
  use { "hrsh7th/cmp-buffer",} -- buffer completions
  use { "hrsh7th/cmp-path", } -- path completions
	use { "saadparwaiz1/cmp_luasnip",} -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", }
	use { "hrsh7th/cmp-nvim-lua", }

  -- LSP
  use { "neovim/nvim-lspconfig", } 
  use {
    "williamboman/mason.nvim"
  }
  use { "williamboman/mason-lspconfig.nvim", }


  -- Highlighting
  use {
	"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
  }
  -- Telescope
  use {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} } 
  }

  -- Null LS
  use {
     "jose-elias-alvarez/null-ls.nvim"
   }

   -- Colorschemes
  use "lunarvim/darkplus.nvim"
end

packer.startup(attach_plugins)
