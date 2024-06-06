# Define the URL of the MSI installer
$installerUrl = "https://dl.dropboxusercontent.com/scl/fi/0kcdra7fyznqpyf8ojbys/AbsoluteFullAgent.msi?rlkey=du2d9t1cfvorl1cejp103ctee&st=wy87dv5u&dl=1"

# Define the path to the temporary directory and the installer file
$tempDir = [System.IO.Path]::GetTempPath()
$installerPath = [System.IO.Path]::Combine($tempDir, "AbsoluteFullAgent.msi")

# Define the path to the log file
$logFilePath = [System.IO.Path]::Combine($tempDir, "AbsoluteInstallLog.txt")

# Download the MSI installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Define the MSI arguments for silent installation with logging
$msiArgs = "/norestart /quiet /L*V `"$logFilePath`" REBOOT=ReallySuppress"

# Install the MSI package silently with logging
Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" $msiArgs" -Wait

# Delete the installer file after installation
Remove-Item -Path $installerPath -Force

# Output the path to the log file
Write-Output "Installation log can be found at: $logFilePath"