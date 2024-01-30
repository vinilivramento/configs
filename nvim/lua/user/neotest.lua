require("neotest").setup({
  adapters = {
    require("neotest-rust") {
        args = { "--no-capture" },
    },
    require("neotest-python") {
    },
    require("neotest-gtest").setup({}) 
  }
})

-- run nearest test
vim.keymap.set('n', '<leader>r', ':lua require("neotest").run.run()<CR>', opts)

--run all tests in file
vim.keymap.set('n', '<leader>rr', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

-- stop nearest test
vim.keymap.set('n', '<leader>s', ':lua require("neotest").run.run()<CR>', opts)

-- show test summary
vim.keymap.set('n', '<leader>ss', ':lua require("neotest").summary.toggle()<CR>', opts)

-- output open
vim.keymap.set('n', '<leader>o', ':lua require("neotest").output.open({enter = true})<CR>', opts)
