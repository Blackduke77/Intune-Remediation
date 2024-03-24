# Function to check if TeamViewer or TeamViewer Host is installed
function IsTeamViewerInstalled() {
    try {
        $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
        $installedSoftware = Get-ItemProperty -Path $regPath | Where-Object { $_.DisplayName -like "*TeamViewer*" }
        return $installedSoftware -ne $null
    } catch {
        return $false
    }
}

# Check if TeamViewer or TeamViewer Host is installed
if (IsTeamViewerInstalled) {
    Write-Output "TeamViewer or TeamViewer Host is installed."
    exit 1  # Detected
} else {
    Write-Output "TeamViewer or TeamViewer Host is not installed."
    exit 0  # Not Detected
}
