return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,

  -- attachments = {
  --   img_text_func = function(client, path)
  --     path = client:vault_relative_path(path) or path
  --     if not path:is_absolute() then
  --       local p = require("obsidian.path")
  --       local note = client:vault_relative_path(p.buffer())
  --       local parents = #note:parents() - 1 -- as parents() also contains the dot dir
  --       path = tostring(path)
  --       path = ("../"):rep(parents) .. path
  --       path = p.new(path)
  --     end
  --     return string.format("![%s](%s)", path.name, path)
  --   end,
  -- },

  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/syncthing/obsidian/korkota/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/syncthing/obsidian/korkota/*.md",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    { "<localleader>Ob", ":ObsidianBacklinks<cr>", desc = "Obsidian [b]acklinks" },
    { "<localleader>Oc", ":ObsidianToggleCheckbox<cr>", desc = "Obsidian toggle [c]heckbox" },
    { "<leader>Od", ":ObsidianDailies<cr>", desc = "Obsidian [d]ailies" },
    { "<leader>Oe", ":ObsidianExtractNote<cr>", desc = "Obsidian [e]xtract note", mode = { "x" } },
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
    { "<localleader>Os", ":ObsidianLink ", desc = "Obsidian link [s]election to", mode = { "x" } },
    { "<localleader>OS", ":ObsidianLinkNew ", desc = "Obsidian link [S]election to new note", mode = { "x" } },
    { "<leader>Ot", ":ObsidianToday<cr>", desc = "Obsidian [t]oday" },
    { "<leader>OT", ":ObsidianTomorrow<cr>", desc = "Obsidian [T]omorrow" },
    { "<localleader>OT", ":ObsidianTOC<cr>", desc = "Obsidian [T]OC" },
    { "<leader>Ow", ":ObsidianWorkspace<cr>", desc = "Obsidian [w]orkspace" },
    { "<leader>Oy", ":ObsidianYesterday<cr>", desc = "Obsidian [y]esterday" },
  },

  opts = {
    attachments = {
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        local path_string = vim.uri_encode(vim.fs.basename(tostring(path)))
        return string.format("![%s](%s)", path.name, path_string)
      end,
    },

    completion = {
      nvim_cmp = false,
      blink = true,
    },

    daily_notes = {
      folder = "daily_notes",
      template = "daily.md",
    },

    templates = {
      folder = "templates",
    },

    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        return "untitled"
      end
    end,

    new_notes_location = "notes_subdir",

    notes_subdir = "drafts",

    ui = {
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        -- ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
    },

    workspaces = {
      {
        name = "personal",
        path = "~/syncthing/obsidian/korkota/",
      },
    },
  },
}
