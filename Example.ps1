Import-Module -Name "C:\Romain\psDeploy\psDeploy\psDeploy.psm1" -Force
Assert-PsDeploySupported

New-VirtualDirectory -Website "MyWeb" -Name "Content" -Path "C:\Inetpub\Content"
Remove-VirtualDirectory -Website "MyWeb" -Name "Content"
Remove-VirtualDirectory -Website "MyWeb" -Name "Content"

Remove-AppPool -Name "MyWeb"
