# Use the following version for dev purposes
# and point it to your git local copy
# Import-Module -Name "C:\Romain\psDeploy\psDeploy\psDeploy.psm1" -Force

Import-Module psDeploy
Assert-PsDeploySupported



New-User -Name 'Bob' -Password 'Password1'
Add-UserToGroup -Username 'Bob' -Group 'IIS_WPG'
Remove-UserFromGroup -Username 'Bob' -Group 'IIS_WPG'

New-VirtualDirectory -Website 'MyWeb' -Name 'Content' -Path 'C:\Inetpub\Content'
Remove-VirtualDirectory -Website 'MyWeb' -Name 'Content'

New-AppPool -Name 'MyWeb'
Remove-AppPool -Name 'MyWeb'

