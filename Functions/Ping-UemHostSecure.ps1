function Ping-UemHostSecure 
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    Invoke-UemApiCall @functionConfig
}