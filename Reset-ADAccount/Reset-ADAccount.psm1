<#
.Synopsis
This is the short explanation

.Description
This is the long description

.Example
Reset-ADAccount
Provide the Active Directory username: <SamAccountName>
Provide your administrator credentials <Domain>\<SamAccountNAme>
#>

function Reset-ADAccount{
[cmdletBinding()]
          
$user = (Read-Host -Prompt "Provide the Active Directory username: ")
$creds = (Read-Host -Prompt "Provide your administrator credentials")

$newPassword = (Read-Host -Prompt "Provide New Password" -AsSecureString); Set-ADAccountPassword -Credential $creds -Identity $user -Newpassword $newPassword -Reset -Verbose
Get-ADUser $user | Set-ADUser -Credential $creds -ChangePasswordAtLogon $true -Verbose
Get-ADUser $user -Properties PasswordExpired, whenChanged, PasswordLastSet
}