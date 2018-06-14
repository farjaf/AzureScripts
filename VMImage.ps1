# stop virtual machine
Stop-AzureRmVM -ResourceGroupName myResourceGroup -Name myVM -Force

Set-AzureRmVM -ResourceGroupName myResourceGroup -Name myVM -Generalized

#create image
$vm = Get-AzureRmVM -Name myVM -ResourceGroupName myResourceGroup

$image = New-AzureRmImageConfig -Location westeurope -SourceVirtualMachineId $vm.ID 

New-AzureRmImage -Image $image -ImageName myImage -ResourceGroupName myResourceGroup