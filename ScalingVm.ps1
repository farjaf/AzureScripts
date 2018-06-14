Login-AzureRmAccount
$ResourceGroupName = "MyVM"
$VMName = "myVM"
$NewVMSize = "Standard_A5"
$vm = Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Name $VMName

$vm.HardwareProfile.VmSize = $NewVMSize
Update-AzureRmVM -ResourceGroupName $ResourceGroupName -VM $vm

# Get List of VM sizes in East US
Get-AzureRmVMSize -Location 'East US' | Sort-Object Name | ft Name, NumberOfCores, MemoryInMB, MaxDataDiskCount -AutoSize