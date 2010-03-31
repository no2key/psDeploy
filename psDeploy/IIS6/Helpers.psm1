<#
.Synopsis
Checks that WMI is available and IIS6 installed
#>
function Assert-II6Support
{
	[wmiclass] 'root/MicrosoftIISv2:IIsWebServer' > $null
	if (!$?)
	{
		throw "The IIS WMI Provider for II6 does not appear to be installed"
	}
}
