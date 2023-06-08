# BlackberryUemModule.psd1
@{
    PowerShellVersion = '5.1'
    RootModule = 'BlackberryUemModule.psm1'
    ModuleVersion = '1.0.1'
    GUID = '5115696a-7569-4b7b-943f-647682d6d9df'
    Author = 'Daniel Meridew'
    CompanyName = 'MERIDEW Consultancy LTD'
    FunctionsToExport = @(
        'Get-UemAuthToken',
        'Get-UemUserDevices',
        'Search-UemUser',
        'Search-UemAppGroup',
        'Send-UemUserDeviceCommand',
        'Get-UemUserDeviceCommandStatus'
    )
}
