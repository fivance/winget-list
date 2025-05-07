Add-Type -AssemblyName System.Windows.Forms

# Open a file dialog to select the JSON file
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Filter = "JSON Files (*.json)|*.json"
$openFileDialog.Title = "Select a JSON File Containing the Program List"

if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $jsonFilePath = $openFileDialog.FileName
} else {
    Write-Host "No file selected. Exiting..." -ForegroundColor Yellow
    exit 1
}

# Load the list of programs to install from the selected JSON file
if (Test-Path $jsonFilePath) {
    try {
        $programs = Get-Content $jsonFilePath | ConvertFrom-Json
    } catch {
        Write-Host "Failed to load or parse JSON file: $jsonFilePath" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "JSON file not found: $jsonFilePath" -ForegroundColor Red
    exit 1
}

foreach ($program in $programs) {
    Write-Host "Installing $program..." -ForegroundColor Cyan
    try {
        winget install --id $program --accept-package-agreements --accept-source-agreements -e
        Write-Host "$program installed successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to install $program." -ForegroundColor Red
    }
}