function Get-UemApiFunctionConfig
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][string]$functionName,
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$region
    )

    $functionConfig = $apiFunctionConfig[$functionName]
    $functionConfig.Uri = $regionUris[$region] + $functionConfig.Uri

    return $functionConfig
}