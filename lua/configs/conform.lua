local options = {
  formatters_by_ft = {
    php = { "pint", "php_cs_fixer", stop_after_first = true },
    go = { "gofmt", "goimports", "golines" },
    ruby = { "rufo" },
    rust = { "rustfmt" },
    lua = { "stylua" },
    yaml = { "yamlfmt" },
  },

  format_on_save = {
    lsp_fallback = true,
  },
}

return options
