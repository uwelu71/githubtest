 # Download the installation package
wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh

# Run connect command
azcmagent connect --resource-group "rg-uludemo-DC-Go-De" --tenant-id "b7d9d616-77ff-4c75-a1ab-779a520b2035" --location "switzerlandnorth" --subscription-id "054fb2d3-71b3-4456-8353-e365bff1749a" --cloud "AzureCloud" --tags "Datacenter=DC01,City=Gottmadingen,StateOrDistrict=Baden-Wuerttemberg,CountryOrRegion=Germany" --correlation-id "896a8cb2-b06b-4942-aa29-a8ad5e605006"

if [ $? = 0 ]; then echo -e "\033[33mTo view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines\033[m"; fi
