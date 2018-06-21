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
    "Region" = $vm.Location
  }

  if ($vm.Tags.Count -gt 0) {
    $vm.Tags.Keys | %{
       $entry[$_] = $vm.Tags.Item($_)
    }
  }

  $results += $entry

}

$headers = $results | %{ $_.Keys } | Select -Unique
$list = $results | %{New-Object PSObject -Property $_} | Select -Property $headers
$list | Export-Csv -Path $Filename -NoTypeInformation
