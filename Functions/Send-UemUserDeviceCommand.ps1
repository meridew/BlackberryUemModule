function Send-UemUserDeviceCommand
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][ValidateSet('DELETE_DEVICE_DATA', 'REMOVE_DEVICE')][string]$CommandType
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    $functionConfig.Uri = $functionConfig.Uri -replace '{userGuid}', $UserGuid
    $functionConfig.Uri = $functionConfig.Uri -replace '{deviceGuid}', $DeviceGuid
    $functionConfig.Uri = $functionConfig.Uri -replace '{commandType}', $CommandType

    return Invoke-UemApiCall @functionConfig
}