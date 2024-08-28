# Dotfiles

## Requirements

- Git
- Curl

## Install

Install config tracking in your `$HOME` by running:

```shell
curl -Lks https://raw.githubusercontent.com/korkota/dotfiles/main/.bin/install.sh | /bin/bash
```

[Import the main VSCode profile.](https://vscode.dev/profile/github/8367d1cb88215902ab26456791a8f3b6)\
Don't forget to disable telemetry in `settings.json`:
```json
{
  "dev.containers.defaultExtensions": [
    "eamodio.gitlens",
    "EditorConfig.EditorConfig",
    "streetsidesoftware.code-spell-checker"
  ],
  "telemetry.telemetryLevel": "off",
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": [":"],
      "commands": ["workbench.action.showCommands"],
      "silent": true
    },
    {
      "before": ["<C-h>"],
      "after": ["<C-w>", "h"]
    },
    {
      "before": ["<C-j>"],
      "after": ["<C-w>", "j"]
    },
    {
      "before": ["<C-k>"],
      "after": ["<C-w>", "k"]
    },
    {
      "before": ["<C-l>"],
      "after": ["<C-w>", "l"]
    },
    {
      "before": ["<Leader>", "t", "t"],
      "commands": [":tabnew"]
    },
    {
      "before": ["<Leader>", "t", "n"],
      "commands": [":tabnext"]
    },
    {
      "before": ["<Leader>", "t", "p"],
      "commands": [":tabprev"]
    },
    {
      "before": ["<Leader>", "t", "o"],
      "commands": [":tabo"]
    },
    {
      "before": ["<Leader>", "/"],
      "commands": [":noh"]
    },
    {
      "before": ["leader", "w"],
      "commands": ["workbench.action.files.save"]
    },
    {
      "before": ["<Leader>", "p"],
      "commands": ["workbench.action.showCommands"]
    },
    {
      "before": ["<Leader>", "t"],
      "commands": ["workbench.action.gotoSymbol"]
    },
    {
      "before": ["K"],
      "commands": ["lineBreakInsert"],
      "silent": true
    }
  ],
  "window.newWindowProfile": "main",
  "workbench.experimental.enableNewProfilesUI": true
}
```
