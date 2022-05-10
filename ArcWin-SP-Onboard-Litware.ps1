 # Add the service principal application ID and secret here
$servicePrincipalClientId="03b750bb-8aaf-41b7-a2d3-b94618a5185c"
$servicePrincipalSecret="<ENTER SECRET HERE>"

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# Download the installation package
Invoke-WebRequest -Uri "https://aka.ms/azcmagent-windows" -TimeoutSec 30 -OutFile "$env:TEMP\install_windows_azcmagent.ps1"

# Install the hybrid agent
& "$env:TEMP\install_windows_azcmagent.ps1"
if($LASTEXITCODE -ne 0) {
    throw "Failed to install the hybrid agent"
}

# Run connect command
& "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "rg-Litware-Arc" --tenant-id "b7d9d616-77ff-4c75-a1ab-779a520b2035" --location "switzerlandnorth" --subscription-id "054fb2d3-71b3-4456-8353-e365bff1749a" --cloud "AzureCloud" --tags "Datacenter='Hem 19',City=Gottmadingen,StateOrDistrict=Baden-Wuerttemberg,CountryOrRegion=Germany" --correlation-id "60ce7f86-d500-438f-b52e-81746f545015"

if($LastExitCode -eq 0){Write-Host -ForegroundColor yellow "To view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines"}
