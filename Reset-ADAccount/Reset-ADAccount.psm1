<#
.Synopsis

This is cmdlet will allow you to change
an Active Directory password and force a password change

.Description

This is cmdlet will allow you change an Active Directory username and force a password change. After the cmdlet is done running
you will see details on the user account for the following attributes

-PasswordExpired - if True then the user will be forced to change the password upon logging in
-whenChanged - Should be equal to the date and time that you ran this cmdlet
-PasswordLastSet - Displays when the user last changed their password

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