require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
  },
  background = {
      dark = "mocha",
  }
})

vim.o.termguicolors = true
vim.o.background = "dark"
-- vim.cmd[[colorscheme catppuccin]]
vim.cmd[[colorscheme monokaipro]]
