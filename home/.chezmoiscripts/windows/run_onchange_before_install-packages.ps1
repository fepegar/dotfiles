wsl --install

$apps = @(
    "7zip.7zip",
    "DigitalScholar.Zotero",
    "Docker.DockerDesktop",
    "GIMP.GIMP",
    "GitHub.GitHubDesktop",
    "Microsoft.Azure.StorageExplorer",
    "Microsoft.VisualStudioCode",
    "Spotify.Spotify",
    "Starship.Starship",
    "VideoLAN.VLC",
    "Zoom.Zoom"
)

foreach ($app in $apps) {
    winget install -e --id=$app --silent --accept-source-agreements --accept-package-agreements
}
