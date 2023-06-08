function ConvertTo-FlatObject
{
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [PSObject]$InputObject,
        
        [Parameter()]
        [string]$Parent = ''
    )
    
    process
    {
        foreach ($property in $InputObject.PSObject.Properties)
        {
            if ($property.Value -is [PSCustomObject])
            {
                $property.Value | ConvertTo-FlatObject -Parent $($Parent + $property.Name + "_")
            }
            elseif ($property.Value -is [System.Collections.IList] -and $null -ne $property.Value)
            {
                $index = 0
                foreach ($value in $property.Value)
                {
                    if ($value -is [PSCustomObject])
                    {
                        $value | ConvertTo-FlatObject -Parent $($Parent + $property.Name + $index.ToString() + "_")
                    }
                    else
                    {
                        New-Object -TypeName PSObject -Property @{
                            "$($Parent + $property.Name + $index.ToString())" = $value.ToString()
                        }
                    }
                    $index++
                }
            }
            else
            {
                New-Object -TypeName PSObject -Property @{
                    "$($Parent + $property.Name)" = $property.Value.ToString()
                }
            }
        }
    }
}