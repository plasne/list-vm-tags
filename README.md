This repository includes some scripts that can help with capacity planning.

# vmtags.ps1

This simple PowerShell script lets you write out all the tags from VMs in an Azure Subscription.

## Login

```powershell
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionId 11111111-1111-1111-1111-111111111111
```

## Run

```powershell
./vmtags.ps1 -Filename tagged.csv
```

# limits.ps1

This simple PowerShell script lets you write out all the vCPU quota limits for specified subscriptions.

## Login

```powershell
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionId 11111111-1111-1111-1111-111111111111
```

## Run

```powershell
./limits.ps1 -Filename limits.csv
```
