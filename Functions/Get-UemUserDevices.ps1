function Get-UemUserDevices
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][string]$UserGuid
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region
    $functionConfig.Uri = $functionConfig.Uri -replace '{userGuid}', $UserGuid

    return Invoke-UemApiCall @functionConfig
}