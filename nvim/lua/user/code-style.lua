require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "cpp", "cmake", "dockerfile", "lua", "make", "markdown", "markdown_inline", "python", "rust", "toml", "vimdoc" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

  },
}

-- Treesitter folding 
vim.wo.foldexpr = ''

-- Define a global function to toggle fold expression
_G.toggle_fold = function()
  if vim.wo.foldexpr == '' then
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  else
    vim.wo.foldexpr = ''
  end
end
