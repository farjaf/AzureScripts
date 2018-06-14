Login-AzureRmAccount
$resourceGroupName = "myResourceGroup"
$resourceGroupLocation = "West Central US"
# Database name
$DBName = "testdbfarzad"

#Write and read locations and priorities for the database
$locations = @(@{"locationName" = "South Central US"; "failoverPriority"=0}, @{"locationName"="North Central US"; "failoverPriority" = 1})

# Create the resource group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

# IP addresses that can access the database through the firewall
$iprangefilter = "10.0.0.1"

# Consistency policy
$consistencyPolicy = @{"defaultConsistencyLevel"="BoundedStaleness";
                       "maxIntervalInSeconds"="10"; 
                       "maxStalenessPrefix"="200"}

$DBProperties = @{"databaseAccountOfferType"="Standard"; 
                          "locations"=$locations; 
                          "consistencyPolicy"=$consistencyPolicy; 
                          "ipRangeFilter"=$iprangefilter}

New-AzureRmResource -ResourceType "Microsoft.DocumentDb/databaseAccounts" `
                    -ApiVersion "2015-04-08" `
                    -ResourceGroupName $resourceGroupName `
                    -Location $resourceGroupLocation `
                    -Name $DBName `
                    -PropertyObject $DBProperties



Remove-AzureRmResourceGroup -ResourceGroupName "myResourceGroup"