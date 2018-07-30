Param(
  [Parameter(Mandatory=$True,Position=1)] [string] $Filename
)

$results = @()
# $regions = "eastus", "eastus2", "westus", "centralus", "northcentralus", "southcentralus", "northeurope", "westeurope", "eastasia", "southeastasia", "japaneast", "japanwest", "australiaeast", "australiasoutheast", "brazilsouth", "southindia", "centralindia", "westindia", "canadacentral", "canadaeast", "westus2", "westcentralus", "uksouth", "ukwest", "koreacentral", "koreasouth", "francecentral"
$regions = "centralus", "southcentralus", "northeurope", "westeurope", "uksouth"

$regions | %{
  $region = $_

  $vms = Get-AzureRmVMUsage -Location $region
  $vms | %{
    $vm = $_

    $entry = @{
      "Region" = $region
      "SKU" = $vm.name.LocalizedValue
      "Current" = $vm.CurrentValue
      "Limit" = $vm.Limit
    }
    $results += $entry

  }

}

$headers = $results | %{ $_.Keys } | Select -Unique
$list = $results | %{New-Object PSObject -Property $_} | Select -Property $headers
$list | Export-Csv -Path $Filename -NoTypeInformation
