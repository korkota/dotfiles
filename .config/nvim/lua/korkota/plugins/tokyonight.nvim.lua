return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = colors.black
      end,
    })

    vim.cmd([[colorscheme tokyonight]])
  end,
}
