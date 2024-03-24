# Function to uninstall TeamViewer Host
function UninstallTeamViewer {
    $uninstallCommands = @(Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*TeamViewer*" } | ForEach-Object { "msiexec.exe /x $($_.IdentifyingNumber) /qn /norestart" })
    
    foreach ($command in $uninstallCommands) {
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c $command" -WindowStyle Hidden -Wait
    }
}

# Uninstall TeamViewer Host
Write-Output "Uninstalling TeamViewer ..."

UninstallTeamViewer

Write-Output "TeamViewer  has been uninstalled."
