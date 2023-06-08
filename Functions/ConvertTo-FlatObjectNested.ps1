function ConvertTo-FlatObjectNested
{
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [PSObject]$InputObject
    )

    process
    {
        $output = New-Object -TypeName PSObject

        foreach ($property in $InputObject.PSObject.Properties)
        {
            if ($property.Value -is [PSCustomObject])
            {
                $nestedObject = $property.Value | ConvertTo-NestedStringObject
                $output | Add-Member -MemberType NoteProperty -Name $property.Name -Value $nestedObject
            }
            elseif ($property.Value -is [System.Collections.IList] -and $null -ne $property.Value)
            {
                $array = @()
                foreach ($value in $property.Value)
                {
                    if ($value -is [PSCustomObject])
                    {
                        $array += $value | ConvertTo-NestedStringObject
                    }
                    else
                    {
                        $array += $value.ToString()
                    }
                }
                $output | Add-Member -MemberType NoteProperty -Name $property.Name -Value $array
            }
            else
            {
                $output | Add-Member -MemberType NoteProperty -Name $property.Name -Value $property.Value.ToString()
            }
        }

        return $output
    }
}