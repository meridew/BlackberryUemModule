function Invoke-UemApiCall
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][hashtable]$CallParams,
        [Parameter(Mandatory = $false)][int]$Offset = 0,
        [Parameter(Mandatory = $false)][int]$PageSize = 50,
        [Parameter(Mandatory = $false)][int]$MaxResults
    )

    try
    {
        if (!$script:Results)
        {
            $script:Results = [System.Collections.Generic.List[object]]::new()
        }

        if (!$script:AuthToken)
        {
            $script:AuthToken = Get-UemAuthToken -Region $CallParams.Region
        }

        $CallParams.Headers.authorization = $script:AuthToken
        $CallParams.Body = $CallParams.Body | ConvertTo-Json

        $currentUri = $CallParams.Uri + "&max=$PageSize&offset=$Offset"

        $response = Invoke-RestMethod -Uri $currentUri -Method $CallParams.Method -Body $CallParams.Body -Headers $CallParams.Headers

        $script:Results.AddRange(($response | ConvertFrom-Json))

        if ($MaxResults -and ($script:Results.Count -ge $MaxResults))
        {
            return $script:Results.GetRange(0, $MaxResults)
        }

        if ($response.count -eq $PageSize)
        {
            $Offset += $PageSize
            Invoke-UemApiCall @CallParams -Offset $Offset -PageSize $PageSize -MaxResults $MaxResults
        }

        return $script:Results
    }
    catch
    {
        Write-Error "An error occurred while making the API call: $_"
    }
    finally
    {
        Remove-Variable -Name Results -Scope script
    }
}
