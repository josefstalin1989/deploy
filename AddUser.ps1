# Define the username and password
$Username = "Andy"  # Replace with desired username
$Password = "Test"  # Replace with desired password

# Create the user account
try {
    # Create a secure password
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
   
    # Create the local user account
    New-LocalUser -Name $Username -Password $SecurePassword -FullName "$Username User" -Description "Local user account created via script"

    # Optionally, add the user to a group (e.g., Administrators)
    # Add-LocalGroupMember -Group "Administrators" -Member $Username

    Write-Host "User account '$Username' created successfully."
} catch {
    Write-Host "Failed to create user account: $_"
}