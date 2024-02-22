local wk = require("which-key")

wk.setup({
    operators = { gc = "Comments" },
})

wk.register({
  --Buffer
  ["<Tab>"]     = { "<cmd> bnext <cr>",     "Next Buffer"},
  ["<S-Tab>"]   = { "<cmd> bprevious <cr>", "Previoud Buffer"},
  ["<leader>q"] = { "<cmd> bdelete <cr>",   "Destroy Buffer"},

  --Moving
  ["<C-h>"]     = { "hhhh",     "Fast Move Left"},
  ["<C-j>"]     = { "jjjj",     "Fast Move Down"},
  ["<C-k>"]     = { "kkkk",     "Fast Move Up "},
  ["<C-l>"]     = { "llll",     "Fast Move Right "},

  --Fallback upper case HJKL to lower case hjkl
  ["H"]     = { "h",     "Move Left"},
  ["J"]     = { "j",     "Move Down"},
  ["K"]     = { "k",     "Move Up "},
  ["L"]     = { "l",     "Move Right "},

  --Copy
  ["Y"]     = { "y$",     "Copy From Cursor to the End Of Line"},
  ["yw"]    = { "yiw",    "Copy Always the Whole Word"},

  --Telescope 
  ["<leader>f"]  = { name = "fuzzy finder" },
  ["<leader>ff"] = { "<cmd> lua require('telescope.builtin').find_files({no_ignore=true, hidden=true}) <cr>",        "Find File" },
  ["<leader>fg"] = { "<cmd> lua require('telescope.builtin').live_grep() <cr>",                                      "Live Search" },
  ["<leader>gg"] = { "<cmd> lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')}) <cr>", "Live Search Word Under Cursor" },
  ["<C-p>"]      = { "<cmd> lua require('telescope.builtin').find_files({no_ignore=true, hidden=true}) <cr>",        "Find File" },

  --Nvim Tree
  ["<leader>e"] = { "<cmd> NvimTreeToggle <cr>",    "File Tree Explorer" },

  --Floating Terminal
  ["<leader>t"] = { "<cmd> ToggleTerm <cr>", {noremap = true, silent = true}, "Toggle Terminal" },

  --Neo Test
  ["<leader>r"]   = { "<cmd> lua require('neotest').run.run() <cr>",                   "Run Current Test" },
  ["<leader>rr"]  = { "<cmd> lua require('neotest').run.run(vim.fn.expand('%')) <cr>", "Run All Tests in File" },
  ["<leader>s"]   = { "<cmd> lua require('neotest').run.stop() <cr>",                  "Stop Current Test" },
  ["<leader>ss"]  = { "<cmd> lua require('neotest').summary.toggle() <cr>",            "Show Test Summary" },
  ["<leader>o"]   = { "<cmd> lua require('neotest').output.open({enter = true}) <cr>", "Show Test Output" },

  --LspSaga
  ["gd"]   = { "<cmd> Lspsaga goto_definition <cr>", "Go to Definition" },
  ["gt"]   = { "<cmd> Lspsaga goto_type_definition <cr>", "Go to Type Definition" },
  ["<leader>rn"]   = { "<cmd> Lspsaga rename <cr>", "Rename Word Under Cursor" },
  ["<leader>qq"]   = { "<cmd> Lspsaga code_action <cr>", "Code action" },
  ["<leader>s"]   = { "<cmd> ClangdSwitchSourceHeader <cr>", "Toggle Header/Source" },
  ["<leader>d"]   = { "<cmd> Lspsaga show_cursor_diagnostics <cr>", "Show cursor diagnostic" },
  ["[d"]   = { "<cmd> Lspsaga diagnostic_jump_prev <cr>", "Show prev diagnostic" },
  ["]d"]   = { "<cmd> Lspsaga diagnostic_jump_next <cr>", "Show next diagnostic" },
  ["<leader>o"]   = { "<cmd> Lspsaga outline <cr>", "Show tab with functions outline" },

  --TroubleToggle
  ["<leader>dd"]   = { "<cmd> TroubleToggle <cr>", "Show diagnostic list" },

  -- Code Folding
  ["F"]   = { "<cmd> lua toggle_fold() <cr>", "Toggle code folding" },
  
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
