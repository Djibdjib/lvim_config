lvim.lsp.automatic_servers_installation = true

lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "prettier/vim-prettier",
    "tpope/vim-surround"
  },
  {
    "nxvu699134/vn-night.nvim",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {}
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- CUSTOM MENU
lvim.builtin.which_key.mappings["n"] = {
  name = "Custom",
  o = { ":SymbolsOutline<cr>", "Toggle SymbolsOutline" },
}

-- PERF
-- TODO
-- NOTE
-- FIX
-- WARNING
lvim.builtin.which_key.mappings["nt"] = {
  name = "TODO",
  q = { ":TodoQuickFix<cr>", "TODO QuickFix" },
  n = { "<cmd>lua require('todo-comments').jump_next()<cr>", "Jump to Next TODO" },
  p = { "<cmd>lua require('todo-comments').jump_prev()<cr>", "Jump to Prev TODO" },
}

vim.opt.timeoutlen = 100
vim.opt.showtabline = 2
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  command = "highlight CursorLine guibg=#3B3636 guifg=fg",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  command = "highlight Folded guibg=#000000 guifg=fg",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.js", "*.jsx" },
  command = "silent loadview"
})
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.js", "*.jsx" },
  command = "silent mkview"
})

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
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
lvim.colorscheme = "vn-night"
lvim.transparent_window = true

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-d>"] = "yyp"
lvim.keys.normal_mode["<C-j>"] = ":m.+1<CR>"
lvim.keys.normal_mode["<C-k>"] = ":m.-2<CR>"
lvim.keys.visual_mode["<C-j>"] = ":m'>+1<CR>gv=gv"
lvim.keys.visual_mode["<C-k>"] = ":m'<-2<CR>gv=gv"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<C-g>"] = "$vaBzf"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

lvim.keys.normal_mode["gpd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", noremap = true }
lvim.keys.normal_mode["gpt"] = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", noremap = true }
lvim.keys.normal_mode["gpi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", noremap = true }
lvim.keys.normal_mode["gpr"] = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", noremap = true }
lvim.keys.normal_mode["gP"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", noremap = true }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<C-t>"

lvim.builtin.nvimtree.setup.view.side = "left"

-- lvim.builtin.nvimtree.show_icons.git = 0

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
