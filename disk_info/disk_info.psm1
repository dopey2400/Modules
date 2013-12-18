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
function Get-DiskInfo{
[cmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string[]]$ComputerName
    )

   Get-wmiObject  -computername $ComputerName -class win32_logicaldisk -Filter "DeviceID='c:'"
}