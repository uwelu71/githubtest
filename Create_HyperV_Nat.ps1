# Create a new Hyper-V Virtual Switch
# New-VMSwitch –SwitchName “NATSwitch” –SwitchType Internal

# Get-NetworkInterface

# Configure the NAT Gateway IP Address
# New-NetIPAddress –IPAddress 172.21.21.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch)"

# Configure the NAT Rule
# New-NetNat –Name MyNATnetwork –InternalIPInterfaceAddressPrefix 172.21.21.0/24

# Inbound Nat Rule
# Add-NetNatStaticMapping -NatName "VMSwitchNat" -Protocol TCP -ExternalIPAddress 0.0.0.0 -InternalIPAddress 172.21.21.2 -InternalPort 80 -ExternalPort 80


# COnfig for Sharkoon Hyper-V Server Home Office DC Gottmadingen

New-VMSwitch –SwitchName “NATSwitch0” –SwitchType Internal
New-NetIPAddress –IPAddress 172.16.0.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch0)"
New-NetNat –Name MyNATnetwork0 –InternalIPInterfaceAddressPrefix 172.16.0.0/24

New-VMSwitch –SwitchName “NATSwitch1” –SwitchType Internal
New-NetIPAddress –IPAddress 172.16.1.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch1)"
New-NetNat –Name MyNATnetwork1 –InternalIPInterfaceAddressPrefix 172.16.1.0/24

New-VMSwitch –SwitchName “NATSwitch2” –SwitchType Internal
New-NetIPAddress –IPAddress 172.16.2.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch2)"
New-NetNat –Name MyNATnetwork2 –InternalIPInterfaceAddressPrefix 172.16.2.0/24

New-VMSwitch –SwitchName “NATSwitch3” –SwitchType Internal
New-NetIPAddress –IPAddress 172.16.3.1 -PrefixLength 24 -InterfaceAlias "vEthernet (NATSwitch3)"
New-NetNat –Name MyNATnetwork3 –InternalIPInterfaceAddressPrefix 172.16.3.0/24

<# Cofigure IP Settings by powerShell
Get-NetAdapter
New-NetIPaddress -InterfaceIndex 12 -IPAddress 172.0.3.3 -PrefixLength 24 -DefaultGateway 172.0.3.0
Set-DNSClientServerAddress –InterfaceIndex 12 -ServerAddresses 8.8.8.8
#>