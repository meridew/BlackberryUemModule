$script:ErrorActionPreference = 'Stop'; Set-StrictMode -Version 5.1

$script:RegionUris = Import-PowerShellDataFile .\config\RegionUris.psd1
$script:ApiParams = Import-PowerShellDataFile .\config\ApiParams.psd1

enum Regions {
    REGION1
    REGION2
    REGION3
}

$functionScripts = gci .\Functions

foreach ($functionScript in $functionScripts)
{
    . $functionScript.FullName
}