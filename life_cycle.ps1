#az login


$subscriptionId = "xxxx.xxxx.xxxx.xxxx"
Set-AzContext -SubscriptionId $subscriptionId



$ResourceGroupName='prodResourceGroup'
$storageAccount='storageAccount'
$coolTierThreshold=10
$ArchieveThreshold=30 
$deleteThreshold=100

az storage account blob-service-properties update `
    --resource-group $ResourceGroupName `
    --account-name $storageAccount `
    --enable-last-access-tracking true

#$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -DaysAfterCreationGreaterThan $deleteThreshold
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToArchive -daysAfterModificationGreaterThan $ArchieveThreshold #-DaysAfterLastTierChangeGreaterThan 40 -InputObject $action
$action = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToCool -DaysAfterLastAccessTimeGreaterThan $coolTierThreshold -EnableAutoTierToHotFromCool -InputObject $action
#$action = Add-AzStorageAccountManagementPolicyAction -SnapshotAction Delete -daysAfterCreationGreaterThan $deleteThreshold -InputObject $action
$action 

$filter = New-AzStorageAccountManagementPolicyFilter -PrefixMatch blobprefix1,blobprefix2

$rule = New-AzStorageAccountManagementPolicyRule -Name nBanks-data-tier-rule -Action $action -Filter $filter
$rule

Get-AzResourceGroup


$policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName $ResourceGroupName -AccountName $storageAccount -Rule $rule



