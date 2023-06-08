function Invoke-UemApiCall
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][string]$Uri,
        [Parameter(Mandatory = $true)][string]$Method,
        [Parameter(Mandatory = $false)][hashtable]$Body,
        [Parameter(Mandatory = $false)][hashtable]$Headers,
        [Parameter(Mandatory = $false)][string]$Region
    )
    
    if ($Headers -and $Headers.ContainsKey('authorization'))
    {
        $Headers.authorization = Get-UemAuthToken -Region $Region
    }

    $PSBoundParameters.Body = $PSBoundParameters.Body | ConvertTo-Json -Depth 10

    try
    {
        $response = Invoke-RestMethod @PSBoundParameters

        return $response
    }
    catch
    {
        Write-Error "An error occurred while making the API call: $_"
    }
}