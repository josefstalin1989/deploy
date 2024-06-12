# Get all installed AppxPackages for the current user
$installedApps = Get-AppxPackage | Where-Object { $_.Name -notlike "*Microsoft.StorePurchaseApp*" -and $_.Name -notlike "*Microsoft.WindowsStore*" }

# Uninstall each AppxPackage
foreach ($app in $installedApps) {
    try {
        Remove-AppxPackage -Package $app.PackageFullName -ErrorAction SilentlyContinue
        Write-Output "Uninstalled: $($app.Name)"
    } catch {
        Write-Output "Failed to uninstall: $($app.Name)"
    }
}

# Get all provisioned AppxPackages
$provisionedApps = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -notlike "*Microsoft.StorePurchaseApp*" -and $_.DisplayName -notlike "*Microsoft.WindowsStore*" }

# Remove each provisioned AppxPackage
foreach ($app in $provisionedApps) {
    try {
        Remove-AppxProvisionedPackage -Online -PackageName $app.PackageName -ErrorAction SilentlyContinue
        Write-Output "Removed provisioned package: $($app.DisplayName)"
    } catch {
        Write-Output "Failed to remove provisioned package: $($app.DisplayName)"
    }
}

Write-Output "Completed uninstallation of all preinstalled store apps."
