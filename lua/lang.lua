local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local trouble = require('trouble')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_installer.setup {
  automatic_installation = true,
}

trouble.setup {
  use_diagnostic_signs = true,
  signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  },
}

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  require('lsp_signature').on_attach({
    debug = false,
    handler_opts = {
      border = "single",
    },
  })
end

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    capabilities = lsp_status.capabilities,
    on_attach = on_attach,
  }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 4,
    format = function(diagnostic)
      -- Only show the first line with virtualtext.
      return string.gsub(diagnostic.message, '\n.*', '')
    end,
  },
  signs = true,
  update_in_insert = false,
}
)

lspkind.init()

-- Emmet
if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = { 'emmet-ls', '--stdio' };
      filetypes = { 'html', 'css', 'blade', 'javascriptreact', 'javascript.jsx' };
      root_dir = function()
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
})

-- TypeScript
lspconfig.tsserver.setup({
  init_options = {
    hostInfo = "neovim",
    maxTsServerMemory = 8192,
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})


lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = {
    ["window/showMessageRequest"] = function(_, result, params)
      return result
    end,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})


-- Go
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unusedwrite = true,
      },
      staticcheck = true,
    },
  },
}

-- Docker
require 'lspconfig'.dockerls.setup {}

-- Yaml
require 'lspconfig'.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
        ["https://json.schemastore.org/chart.json"] = "Chart.yaml"
      }
    }
  }
}

vim.api.nvim_exec([[
  autocmd CursorHold * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()
]], false)
