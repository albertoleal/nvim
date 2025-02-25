require("neotest").setup {
  adapters = {
    require "neotest-golang" {
      runner = "go",
      go_test_args = {
        "-v",
        "-race",
        "-count=1",
        "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
      },
    },
    require "neotest-pest",
    require "neotest-rust" {
      args = {},
    },
    require "neotest-jest" {
      jestCommand = "npm test",
      jestConfigFile = "jest.config.ts",
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    },
  },
}
