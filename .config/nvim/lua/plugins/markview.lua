-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For `nvim-treesitter` users.
  priority = 49,

  -- opts = {
  --   preview = {
  --     modes = { "i", "n", "no", "c" },
  --     -- hybrid_modes = { "i" },
  --     hybrid_modes = { "i", "n" },
  --     linewise_hybrid_mode = true,
  --   },
  -- },

  config = function()
    local presets = require("markview.presets").headings

    require("markview").setup({
      markdown = {
        headings = presets.glow,
      },
      preview = {
        modes = { "i", "n", "no", "c" },
        -- hybrid_modes = { "i" },
        hybrid_modes = { "i", "n" },
        linewise_hybrid_mode = true,
      },
    })
  end,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
}
