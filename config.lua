--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "prettier/vim-prettier"
    -- "github/copilot.vim",
  },
  {
    "catppuccin/nvim", as = "catppuccin"
  }
}

vim.opt.showtabline = 2
vim.opt.tabstop = 4
vim.opt.termguicolors = true

vim.g.catppuccin_flavour = "macchiato"

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
      "css"
    },
  },
}

-- -- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
}

-- generalP
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-d>"] = "yyp"
lvim.keys.normal_mode["<C-j>"] = ":m.+1<CR>"
lvim.keys.normal_mode["<C-k>"] = ":m.-2<CR>"
lvim.keys.visual_mode["<C-j>"] = ":m'>+1<CR>gv=gv"
lvim.keys.visual_mode["<C-k>"] = ":m'<-2<CR>gv=gv"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
