return {
  "snacks.nvim",
  opts = function(_, opts)
    opts.terminal.win.keys.nav_h = nil
    opts.terminal.win.keys.nav_l = nil
  end,
}
