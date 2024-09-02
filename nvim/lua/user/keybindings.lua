local wk = require("which-key")

-- wk.setup({
--     operators = { gc = "Comments" },
-- })

wk.add({
  --Buffer
  { "<S-Tab>", "<cmd> bprevious <cr>", desc = "Previoud Buffer" },
  { "<Tab>", "<cmd> bnext <cr>", desc = "Next Buffer" },
  { "<leader>q", "<cmd> bdelete <cr>", desc = "Destroy Buffer" },

  --Moving
  { "<C-h>", "hhhh", desc = "Fast Move Left" },
  { "<C-j>", "jjjj", desc = "Fast Move Down" },
  { "<C-k>", "kkkk", desc = "Fast Move Up " },
  { "<C-l>", "llll", desc = "Fast Move Right " },

  --Fallback upper case HJKL to lower case hjkl
  { "H", "h", desc = "Move Left" },
  { "J", "j", desc = "Move Down" },
  { "K", "k", desc = "Move Up " },
  { "L", "l", desc = "Move Right " },

  --Copy
  { "Y", "y$", desc = "Copy From Cursor to the End Of Line" },
  { "yw", "yiw", desc = "Copy Always the Whole Word" },

  -- Managing sessions 
  { "<leader>cs", ":mksession! .session.vim <cr>", desc = "Save session" },
  { "<leader>ls", ":source .session.vim <cr>", desc = "Load session" },

  --Telescope 
  { "<leader>f", group = "fuzzy finder" },
  { "<leader>ff", "<cmd> lua require('telescope.builtin').find_files({no_ignore=true, hidden=true}) <cr>", desc = "Find File" },
  { "<leader>fg", "<cmd> lua require('telescope.builtin').live_grep() <cr>", desc = "Live Search" },
  { "<leader>gg", "<cmd> lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')}) <cr>", desc = "Live Search Word Under Cursor" },
  { "<leader>fd", "<cmd> lua require('telescope.builtin').diagnostics() <cr>", desc = "Show diagnostics" },
  { "<C-p>", "<cmd> lua require('telescope.builtin').find_files({no_ignore=true, hidden=true}) <cr>", desc = "Find File" },

  --Nvim Tree
  { "<leader>e", "<cmd> NvimTreeToggle <cr>", desc = "File Tree Explorer" },

  --Floating Terminal
  {"<leader>t", "<cmd> ToggleTerm <cr>", desc = "Toggle Terminal" },

  --Neo Test
  { "<leader>r", "<cmd> lua require('neotest').run.run() <cr>", desc = "Run Current Test" },
  { "<leader>rr", "<cmd> lua require('neotest').run.run(vim.fn.expand('%')) <cr>", desc = "Run All Tests in File" },
  { "<leader>ss", "<cmd> lua require('neotest').summary.toggle() <cr>", desc = "Show Test Summary" },

  --LspSaga
  { "gd", "<cmd> Lspsaga goto_definition <cr>", desc = "Go to Definition" },
  { "gt", "<cmd> Lspsaga goto_type_definition <cr>", desc = "Go to Type Definition" },
  { "<leader>rn", "<cmd> Lspsaga rename <cr>", desc = "Rename Word Under Cursor" },
  { "<leader>qq", "<cmd> Lspsaga code_action <cr>", desc = "Code action" },
  { "<leader>s", "<cmd> ClangdSwitchSourceHeader <cr>", desc = "Toggle Header/Source" },
  { "<leader>d", "<cmd> Lspsaga show_cursor_diagnostics <cr>", desc = "Show cursor diagnostic" },
  { "[d", "<cmd> Lspsaga diagnostic_jump_prev <cr>", desc = "Show prev diagnostic" },
  { "]d", "<cmd> Lspsaga diagnostic_jump_next <cr>", desc = "Show next diagnostic" },
  { "<leader>o", "<cmd> Lspsaga outline <cr>", desc = "Show functions outline" },

  -- Code Folding
  { "F", "<cmd> lua toggle_fold() <cr>", desc = "Toggle code folding" },
  
  --Debugger
  -- TODO
  --vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
  -- vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
  --vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')
  -- vim.keymap.set('n', '<F5>', require 'dap'.continue)
  -- vim.keymap.set('n', '<F10>', require 'dap'.step_over)
  -- vim.keymap.set('n', '<F11>', require 'dap'.step_into)
  -- vim.keymap.set('n', '<F12>', require 'dap'.step_out)
  -- vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
})
