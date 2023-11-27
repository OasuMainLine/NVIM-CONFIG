-- This file is for keeping all plugin imports in one place
-- Packer has to be the first require
require "user.plugins.packer"
--

require "user.plugins.telescope"
require "user.plugins.treesitter".config()
require "user.plugins.nvim-tree"
require "user.plugins.harpoon"
require "user.plugins.gitsigns"
require "user.plugins.alpha"
require "user.plugins.comment"
require "user.plugins.sessions"
require "user.plugins.bufferline"
