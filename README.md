# Dotfiles

## Requirements

- Git
- Curl

## Install

Install config tracking in your `$HOME` by running:

```shell
curl -Lks https://raw.githubusercontent.com/korkota/dotfiles/main/.bin/install.sh | /bin/bash
```

[Import the main VSCode profile.](https://vscode.dev/profile/github/4cf18a6a5f9bdb4132aff59a5385ab26)\
Don't forget to disable telemetry in `settings.json`:
```json
{
  "telemetry.telemetryLevel": "off",
}
```
