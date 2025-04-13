return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples

    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/syncthing/obsidian/korkota/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/syncthing/obsidian/korkota/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    -- ui = { enable = false },
    workspaces = {
      {
        name = "personal",
        path = "~/syncthing/obsidian/korkota/",
      },
    },

    daily_notes = {
      folder = "daily_notes",
      template = "daily.md",
    },

    templates = {
      folder = "templates",
    },

    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({ "open", url }) -- Mac OS
      vim.fn.jobstart({ "wsl-open", url })
    end,
  },
}
