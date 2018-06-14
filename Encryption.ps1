# Login to your subscription
Login-AzureRmAccount 
# Select the subscription to work within 
Select-AzureRmSubscription -SubscriptionName MDSN
# Identify the VM you want to encrypt by name and resource group name 
$rgName = 'myVM'; 
$vmName = 'myVM'; 
# Provide the Client ID and Client Secret 
$aadClientID = 'TestKey'; 
$aadClientSecret = 'MzDsAZztuNALmMJpXL+6zFZ8ePLPmG6xThCApZySRFY='; 
# Get a reference to your Key Vault and capture its URL and Resource ID 
$KeyVaultName = 'FarzadKeyVault'; 
$KeyVault = Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname; 
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
$KeyVaultResourceId = $KeyVault.ResourceId; 
# Enable Azure to access the secrets in your Key Vault to boot the encrypted VM. 
Set-AzureRmKeyVaultAccessPolicy -VaultName $KeyVaultName -ResourceGroupName $rgname –EnabledForDiskEncryption 
# Encrypt the VM 
Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgname -VMName $vmName -AadClientID $aadClientID -AadClientSecret $aadClientSecret -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId;

Get-AzureRmVmDiskEncryptionStatus -ResourceGroupName $rgname -VMName $vmName

