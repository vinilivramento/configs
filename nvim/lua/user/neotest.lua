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
vim.keymap.set('n', '<leader>r', ':lua require("neotest").run.run()<CR>', { silent = true })

--run all tests in file
vim.keymap.set('n', '<leader>rr', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { silent = true })

-- stop nearest test
vim.keymap.set('n', '<leader>s', ':lua require("neotest").run.run()<CR>', { silent = true })

-- show test summary
vim.keymap.set('n', '<leader>ss', ':lua require("neotest").summary.toggle()<CR>', { silent = true })

-- output open
vim.keymap.set('n', '<leader>o', ':lua require("neotest").output.open({enter = true})<CR>', { silent = true })
