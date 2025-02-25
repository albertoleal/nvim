-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "emmet_ls",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "tailwindcss",
  "jsonls",
  "biome",
  "ts_ls",
  "intelephense",
  "gopls",
  "ruby_lsp",
  "rubocop",
  "rust_analyzer",
  "zls",
  "lua_ls",
  "sqls",
  "marksman",
  "dockerls",
  "docker_compose_language_service",
  "yamlls",
}

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.golangci_lint_ls.setup {
  filetypes = { "go", "gomod" },
}

local ih = require "inlay-hints"

lspconfig.gopls.setup {
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

require("rust-tools").setup {
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = function(c, b)
      ih.on_attach(c, b)
    end,
  },
}
