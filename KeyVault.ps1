Login-AzureRmAccount
Get-AzureRmSubscription

Set-AzureRmContext -SubscriptionId 78f77b8f-60bd-43fc-8e11-358941a173a5

New-AzureRmResourceGroup –Name 'ContosoResourceGroup' –Location 'East US'

New-AzureRmKeyVault -VaultName 'FarzadKeyVault' -ResourceGroupName 'ContosoResourceGroup' -Location 'East US'

$key = Add-AzureKeyVaultKey -VaultName 'FarzadKeyVault' -Name 'ContosoFirstKey' -Destination 'Software'
$key.id

#$securepfxpwd = ConvertTo-SecureString –String '123' –AsPlainText –Force  ## This stores the password 123 in the variable $securepfxpwd
#$key = Add-AzureKeyVaultKey -VaultName 'FarzadKeyVault' -Name 'ContosoImportedPFX' -KeyFilePath 'c:\softkey.pfx' -KeyFilePassword $securepfxpwd

Get-AzureKeyVaultKey –VaultName 'FarzadKeyVault'

$secretvalue = ConvertTo-SecureString 'Pa$$w0rd' -AsPlainText -Force
$secret = Set-AzureKeyVaultSecret -VaultName 'FarzadKeyVault' -Name 'SQLPassword' -SecretValue $secretvalue
$secret.Id
(get-azurekeyvaultsecret -vaultName "Farzadkeyvault" -name "SQLPassword").SecretValueText

#MzDsAZztuNALmMJpXL+6zFZ8ePLPmG6xThCApZySRFY=

Set-AzureRmKeyVaultAccessPolicy -VaultName 'FarzadKeyVault' -ServicePrincipalName 44e05573-2911-417d-9442-556b887e8f47 -PermissionsToKeys decrypt,sign