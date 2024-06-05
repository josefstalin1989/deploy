# Define the URLs and paths
$odtUrl = "https://download.microsoft.com/download/F/1/8/F18F1E22-BA98-4D0B-97A6-579B771EE8C5/setup.exe"
$odtPath = "$env:TEMP\setup.exe"
$configXml = @"
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Remove>
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
"@
$xmlPath = "$env:TEMP\uninstall.xml"

# Download the Office Deployment Tool
Invoke-WebRequest -Uri $odtUrl -OutFile $odtPath

# Save the configuration XML file
$configXml | Out-File -FilePath $xmlPath -Encoding UTF8

# Run the Office Deployment Tool with the uninstall configuration
Start-Process -FilePath $odtPath -ArgumentList "/configure $xmlPath" -Wait

# Clean up the installer and XML file
Remove-Item -Path $odtPath -Force
Remove-Item -Path $xmlPath -Force
