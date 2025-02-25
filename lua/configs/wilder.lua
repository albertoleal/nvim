local wilder = require "wilder"

wilder.setup {
  modes = { ":", "/", "?" },
  previous_key = "nn",
  next_key = "mm",
  accept_key = "<Down>",
  reject_key = "<Up>",
}

wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer {
    highlighter = wilder.basic_highlighter(),
  }
)
