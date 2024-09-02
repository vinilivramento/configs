require("neotest").setup({
  adapters = {
    -- require("rustaceanvim.neotest"),
    require("neotest-python") {
    },
    require("neotest-gtest").setup({}) 
  }
})
