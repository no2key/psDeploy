<#
.Synopsis
Gets a list of all the shared folders on this computer
#>
function Get-SharedFolders
{
    param
    (
        [string] $MachineName = $(hostname)
    )
    
    Get-WmiObject -Class Win32_Share -ComputerName $MachineName
}


<#
.Synopsis
Creates a new shared folder (the folder has to exist)
#>
function New-SharedFolder
{
    param
    (
        [string] $Path = $(throw "Please provide the folder path"),
        [string] $Name = $(throw "Please provide the share name"),
        [int] $Type = 0,
        [int] $MaxConnectionsAllowed,
        [string] $Description = "New share",
        [string] $Password,
        [Win32_SecurityDescriptor] $Access
    )
    
    $objWMI = Get-WmiObject -Class Win32_Share
    
    $result = $objWMI.Create($Path, $Name, $Type)
    if ($result -eq 0)
    {
        Write-Output "Created shared '$Name', pointing to '$Path'"
    }
    else
    {
        throw [RuntimeException] "Failed to create share '$Name', error code = $result"
    }
}


<#
.Synopsis
Removes the shared status of an existing folder
#>
function Remove-SharedFolder
{
    param
    (
        [string] $Name = $(throw "Please provide the name of the share to delete")
    )
    
    $shares = Get-WMIObject -Class Win32_Share | Where {$_.Name -eq $Name}
    
    if ($share)
    {
        $share.Delete()
        Write-Output "Deleted share '$Name'"
    }
    else
    {
        Write-Warning "Could not find share '$Name' to be deleted"
    }
}

