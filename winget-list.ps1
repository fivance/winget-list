# List of programs to install
$programs = @(
	"7zip.7zip",
	"BitSum.ProcessLasso",
	"Ghisler.TotalCommander",
    "Microsoft.VisualStudioCode",
	"Notepad++.Notepad++",
	"Brave.Brave",
	"Dropbox.Dropbox",
	"Synology.DriveClient",
	"TeamViewer.TeamViewer",
	"KeePassXCTeam.KeePassXC",
	"Skillbrains.Lightshot",
	"Spotify.Spotify",
	"VideoLAN.VLC",
	"Stremio.Stremio",
	"TeamSpeakSystems.TeamSpeakClient",
	"Valve.Steam",
	"Discord.Discord"
	
)

foreach ($program in $programs) {
    Write-Host "Installing $program..." -ForegroundColor Cyan
    try {
        winget install --id $program --accept-package-agreements --accept-source-agreements -e
        Write-Host "$program installed successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to install $program." -ForegroundColor Red
    }
}
