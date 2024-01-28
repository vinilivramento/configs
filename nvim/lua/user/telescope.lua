-- search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
vim.keymap.set('n', '<C-p>', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})

-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})

-- search word under cursor
vim.keymap.set('n', '<leader>gg', ':lua require"telescope.builtin".grep_string({search = vim.fn.expand("<cword>")})<CR>', {})
