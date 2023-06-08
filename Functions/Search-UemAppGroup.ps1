function Search-UemAppGroup
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][string]$Name
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    $functionConfig.Uri = $functionConfig.Uri -replace '{name}', $Name

    Invoke-UemApiCall @functionConfig
}

<#  Search-UemAppGroup
    Field	Type	Description
    name	string	Name of the application group. Case insensitive exact match.
#>