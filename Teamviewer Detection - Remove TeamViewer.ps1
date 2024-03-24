# Function to check if TeamViewer or TeamViewer Host is installed
function IsTeamViewerInstalled() {
    try {
        $z = 'TeamViewer'
        
        foreach ($h in 'HKLM') {
            foreach ($x in 'SOFTWARE', 'SOFTWARE\wow6432node') {
                $installedSoftware = Get-ItemProperty -Path "${h}:\$x\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$z*" }

                if ($installedSoftware) {
                    Write-Output "TeamViewer or TeamViewer Host is installed."
                    return $true
                }
            }
        }

        Write-Output "TeamViewer or TeamViewer Host is not installed."
        return $false
    } catch {
        Write-Output "Error occurred: $_"
        return $false
    }
}

# Check if TeamViewer or TeamViewer Host is installed
if (IsTeamViewerInstalled) {
    Write-Output "TeamViewer or TeamViewer Host detected."
    exit 1  # Detected
} else {
    Write-Output "TeamViewer or TeamViewer Host not detected."
    exit 0  # Not Detected
}
