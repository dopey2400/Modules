<#
.Synopsis
This is the short explanation
.Description
This is the long description
.Parameter ComputerName
This is for the remote computer
.Example
DiskInfo -computername remote
this is for the remote computer
#>

function Reset-ADAccount{

[cmdletBinding()]
          
        $user = (Read-Host -Prompt "Provide the Active Directory username: ")
        $creds = (Read-Host -Prompt "Provide your administrator credentials")
        

    $newPassword = (Read-Host -Prompt "Provide New Password" -AsSecureString); Set-ADAccountPassword -Credential $creds -Identity $user -Newpassword $newPassword -Reset -Verbose
    Get-ADUser $user | Set-ADUser -Credential $creds -ChangePasswordAtLogon $true -Verbose
}