local ok, dap = pcall(require, "dap")
local mason_path = vim.fn.stdpath "data" .. "/mason/packages/"

if os.getenv "OS" == "Windows_NT" then
  mason_path = mason_path:gsub("\\", "/")
end

if not ok then
  return
end

dap.configurations = {
  php = {
    {
      name = "Xdebug (PHP)",
      type = "php",
      request = "launch",
      port = 9003,
    },
  },
  go = {
    {
      name = "Delve (GoLang)",
      type = "go",
      request = "launch",
      program = "${file}",
    },
  },
  javascript = {
    {
      name = "Launch file (Node.js)",
      type = "node",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    {
      name = "Attach (Node.js)",
      type = "node",
      request = "attach",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
  },
}

dap.adapters = {
  php = {
    type = "executable",
    command = "node",
    args = { mason_path .. "php-debug-adapter/extension/out/phpDebug.js" },
  },
  go = {
    type = "server",
    host = "127.0.0.1",
    port = "8086",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:8086", "--log" },
    },
  },
  node = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        mason_path .. "js-debug-adapter/js-debug/src/dapDebugServer.js",
        "${port}",
      },
    },
  },
}
