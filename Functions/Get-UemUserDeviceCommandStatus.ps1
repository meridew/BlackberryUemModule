function Get-UemUserDeviceCommandStatus
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][Guid]$UserGuid,
        [Parameter(Mandatory = $true)][Guid]$UserDeviceGuid,
        [Parameter(Mandatory = $true)][Guid]$CommandGuid
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    $functionConfig.Uri = $functionConfig.Uri -replace '{userGuid}', $UserGuid
    $functionConfig.Uri = $functionConfig.Uri -replace '{userDeviceGuid}', $DeviceGuid
    $functionConfig.Uri = $functionConfig.Uri -replace '{commandGuid}', $CommandGuid

    return Invoke-UemApiCall @functionConfig
}