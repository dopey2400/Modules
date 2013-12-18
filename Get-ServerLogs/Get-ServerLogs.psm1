<# Out-File c:\test_eventlog_group.txt #>

function Get-ServerLogs{
    [cmdletBinding()]
    $remoteScriptBlock = {
        Get-EventLog -LogName application -EntryType Error, warning, information -After (Get-Date).AddHours(-24) |
        Select-Object machinename, entrytype, message, source, eventid |
        Group-Object -Property EventID, Source |
        ForEach-Object {
            $groupInfo = $_
            Add-Member -InputObject $groupInfo.Group[0] -MemberType NoteProperty -Name Count -Value $groupInfo.Count -PassThru
        }
    }
        
    Invoke-Command -ComputerName (Get-Content C:\test_servers.txt) -Command $remoteScriptBlock |
    Format-List |
    ConvertTo-Html c:\eventlog.html
}