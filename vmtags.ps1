Param(
  [Parameter(Mandatory=$True,Position=1)] [string] $Filename
)

$results = @()

$vms = Get-AzureRmVM
$vms | %{
  $vm = $_

  $entry = @{
    "ResourceGroup" = $vm.ResourceGroupName
    "Name" = $vm.Name
    "VmSize" = $vm.HardwareProfile.VmSize
    "AzureRegion" = $vm.Location
  }

  if ($vm.Tags.Count -gt 0) {
    $vm.Tags.Keys | %{
       $key = $_.ToLower()
       $entry[$key] = $vm.Tags.Item($_)
    }
  }

  $results += $entry

}

$headers = $results | %{ $_.Keys } | Select -Unique
$list = $results | %{New-Object PSObject -Property $_} | Select -Property $headers
$list | Export-Csv -Path $Filename -NoTypeInformation
