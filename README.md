# list-vm-tags

This simple PowerShell script lets you write out all the tags from VMs in an Azure Subscription.

## Login

```powershell
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionId 11111111-1111-1111-1111-111111111111
```

## Run

```powershell
./vmtags.ps1 -Filename out.csv
```
