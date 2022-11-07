--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
lvim.lsp.automatic_servers_installation = true

lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "prettier/vim-prettier"
    -- "github/copilot.vim",
  },
  {
    "rebelot/kanagawa.nvim",
    "folke/tokyonight.nvim",
    "nxvu699134/vn-night.nvim",
  }
}

require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/vscode-es7-javascript-react-snippets" } }

vim.opt.showtabline = 2
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true

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

-- local bufferline = require "lvim.core.bufferline"
-- bufferline.setup {

--   options = {
--     groups = {
--       options = {
--         toggle_hidden_on_enter = true
--       },
--       items = {
--         {
--           name = "JSX", -- Mandatory
--           highlight = { undercurl = false, guisp = "#9FA5C0" }, -- Optional
--           auto_close = false,
--           priority = 2, -- determines where it will appear relative to other groups (Optional)
--           -- icon = "", -- Optional
--           matcher = function(buf) -- Mandatory
--             return buf.filename:match('%.jsx') or buf.filename:match('%_spec')
--           end,
--         }
--       }
--     }

--   }
-- }

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    -- filetypes = {
    --   "javascriptreact",
    --   "javascript",
    --   "typescriptreact",
    --   "typescript",
    --   "json",
    --   "markdown",
    --   "css",
    --   "php"
    -- },
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
-- lvim.builtin.lualine.style = "none"
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "kanagawa"
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "vn-night"
lvim.transparent_window = true

-- local custom_vnnight = require "lualine.themes.vn-night"

-- require("tokyonight").setup({
--   style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day",
--   terminal_colors = true,
--   transparent = false,
--   styles = {
--     comments = { italic = true }
--   }
-- })

-- keymappings [view all the defaults by pressing <leader>Lk]
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
-- lvim.keys.normal_mode["<CR>"] = ":BufferLineGroupToggle<CR>"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

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
