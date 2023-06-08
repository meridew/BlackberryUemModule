function Get-UemAuthToken
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    return Invoke-UemApiCall @functionConfig
}