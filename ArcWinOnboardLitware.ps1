 [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# Download the installation package
Invoke-WebRequest -Uri "https://aka.ms/azcmagent-windows" -TimeoutSec 30 -OutFile "$env:TEMP\install_windows_azcmagent.ps1"

# Install the hybrid agent
& "$env:TEMP\install_windows_azcmagent.ps1"
if($LASTEXITCODE -ne 0) {
    throw "Failed to install the hybrid agent"
}

# Run connect command
& "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect --resource-group "rg-Litware-Arc" --tenant-id "b7d9d616-77ff-4c75-a1ab-779a520b2035" --location "switzerlandnorth" --subscription-id "054fb2d3-71b3-4456-8353-e365bff1749a" --cloud "AzureCloud" --tags "Datacenter=Hem01,City=Gottmadingen,StateOrDistrict=Baden-Wuerttemberg,CountryOrRegion=Germany" --correlation-id "a6e6c7d3-ca6c-4fee-9883-209a8157a00a"

if($LastExitCode -eq 0){Write-Host -ForegroundColor yellow "To view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines"}
