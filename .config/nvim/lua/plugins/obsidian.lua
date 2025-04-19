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
  keys = {
    { "<localleader>Ob", ":ObsidianBacklinks<cr>", desc = "Obsidian [b]acklinks" },
    { "<localleader>Oc", ":ObsidianToggleCheckbox<cr>", desc = "Obsidian toggle [c]heckbox" },
    { "<leader>Od", ":ObsidianDailies<cr>", desc = "Obsidian [d]ailies" },
    { "<leader>Oe", ":ObsidianExtractNote<cr>", desc = "Obsidian [e]xtract note" },
    { "<localleader>Of", ":ObsidianFollowLink<cr>", desc = "Obsidian [f]ollow link" },
    { "<leader>Og", ":ObsidianTags<cr>", desc = "Obsidian ta[g]s" },
    { "<leader>Oi", ":ObsidianPasteImg<cr>", desc = "Obsidian paste [i]mage" },
    { "<localleader>Ol", ":ObsidianLinks<cr>", desc = "Obsidian [l]inks" },
    { "<leader>Om", ":ObsidianNewFromTemplate<cr>", desc = "Obsidian note from te[m]plate" },
    { "<leader>On", ":ObsidianNew<cr>", desc = "Obsidian [n]ew" },
    { "<leader>Oo", ":ObsidianQuickSwitch<cr>", desc = "Obsidian [o]pen quickswitch" },
    { "<leader>OO", ":ObsidianOpen<cr>", desc = "Obsidian [O]pen in app" },
    { "<leader>Op", ":ObsidianTemplate<cr>", desc = "Obsidian Tem[p]late" },
    { "<leader>Or", ":ObsidianRename<cr>", desc = "Obsidian [r]ename" },
    { "<leader>Os", ":ObsidianSearch<cr>", desc = "Obsidian [s]earch" },
    { "<localleader>Os", ":ObsidianLink<cr>", desc = "Obsidian link [s]election" },
    { "<localleader>OS", ":ObsidianLinkNew<cr>", desc = "Obsidian link [S]election" },
    { "<leader>Ot", ":ObsidianToday<cr>", desc = "Obsidian [t]oday" },
    { "<leader>OT", ":ObsidianTomorrow<cr>", desc = "Obsidian [T]omorrow" },
    { "<localleader>OT", ":ObsidianTOC<cr>", desc = "Obsidian [T]OC" },
    { "<leader>Ow", ":ObsidianWorkspace<cr>", desc = "Obsidian [w]orkspace" },
    { "<leader>Oy", ":ObsidianYesterday<cr>", desc = "Obsidian [y]esterday" },
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
