wsl --install

$apps = @(
    "7zip.7zip",
    "Anthropic.Claude",
    "Coder.CoderDesktop",
    "DigitalScholar.Zotero",
    "Docker.DockerDesktop",
    "GIMP.GIMP",
    "GitHub.cli",
    "GitHub.Copilot",
    "ITK-SNAP.ITK-SNAP",
    "Kitware.Slicer",
    "Microsoft.Azure.StorageExplorer",
    "Microsoft.Coreutils",
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "RealVNC.VNCViewer",
    "SlackTechnologies.Slack",
    "Spotify.Spotify",
    "Starship.Starship",
    "Tailscale.Tailscale",
    "VideoLAN.VLC",
    "Zoom.Zoom"
)

foreach ($app in $apps) {
    winget install -e --id=$app --silent --accept-source-agreements --accept-package-agreements
}
