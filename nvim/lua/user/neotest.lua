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
