# Define the download URL and the path where the installer will be saved
$downloadUrl = "https://cmito365-my.sharepoint.com/:u:/g/personal/jberntson_cmitsolutions_com/Eduj8KOA4FdMqDaBM2d0IU4BgI_uzb6BNKMcOI6J26VNZQ?download=1"
$installerPath = "$env:TEMP\DriveStrikeInstaller.exe"

# Download the installer
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Define the command line switches for the silent install
$installArgs = "/massDeployToken=8cf7184981fafb87670ed76d4db29547 /massDeployEmail=msp-alltechs@cmitsolutions.com /verysilent"

# Install the software silently
Start-Process -FilePath $installerPath -ArgumentList $installArgs -Wait

# Remove the installer file after installation
Remove-Item -Path $installerPath -Force