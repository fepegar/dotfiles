# Fernando's dotfiles

## macOS and Linux

Set up with

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply fepegar
```

## Windows

1. Start with the **standard experience** from
   [Microsoft Windows Developer Config](https://github.com/microsoft/WindowsDeveloperConfig).
   It requires Windows 11, administrator rights, internet access, and hardware
   virtualization for WSL. Review the upstream scripts and settings before running
   the following in PowerShell:

   ```powershell
   irm https://aka.ms/devconfig/standard/setup.ps1 | iex
   ```

   Save your work first: setup can restart Windows and resume after sign-in.
   Let it finish, accept the UAC prompts, and review its summary before continuing.
   The standard experience supplies developer tools, Windows Terminal settings,
   and WSL with Ubuntu without the full experience's Remote Desktop enablement.

2. Open a new, non-elevated PowerShell window and install/apply these dotfiles:

   ```powershell
   winget install --exact --id twpayne.chezmoi --source winget --accept-source-agreements --accept-package-agreements
   ```

   Open another PowerShell window so the updated PATH is available, then run:

   ```powershell
   chezmoi init --apply fepegar
   ```

   The Windows package hook applies a declarative WinGet configuration, following
   WindowsDeveloperConfig's DSC v3 workload format. It preserves the personal
   application list and skips packages that already satisfy the configuration.
   Review the configuration before applying: package license agreements are
   accepted automatically, and installers may request elevation.

   Maintain the application list in
   [`home/.chezmoitemplates/windows-packages.dsc.yaml`](home/.chezmoitemplates/windows-packages.dsc.yaml).
   Chezmoi embeds it in the package hook, so changes to the list trigger a new run.
   Failed configurations stop the hook instead of silently continuing.

3. Open Ubuntu once to create your Linux user, then run the Linux setup above
   inside WSL to configure the Linux shell and tools.

Keep App Installer (WinGet) up to date; the package hook needs WinGet 1.11 or newer
with DSC v3 configuration support enabled.
If `winget configure` is unavailable, follow the upstream
[troubleshooting guide](https://github.com/microsoft/WindowsDeveloperConfig#-troubleshooting)
(including `winget configure --enable` where needed).
The Microsoft bootstrap is intentionally separate from chezmoi so an ordinary
dotfile apply does not initiate its reboot/resume workflow.
