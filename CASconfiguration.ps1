
# PS commands to gather legacy CAS configuration
$Server = “STLPVEXC01"   
#$Server = “MANPVEXC01"   
Get-OWAVirtualDirectory -Server $Server | fl Id,ServerName,OwaVersion,InternalURL,ExternalURL,LogonFormat,InternalAuthenticationMethods,FormsAuthentication,DefaultDomain,ExternalAuthenticationMethods
Get-ECPVirtualDirectory -Server $Server | fl Id,InternalURL,ExternalURL,InternalAuthenticationMethods,FormsAuthentication,DefaultDomain,ExternalAuthenticationMethods
Get-OABVirtualDirectory -Server $Server | fl Id,InternalURL,ExternalURL ,InternalAuthenticationMethods,ExternalAuthenticationMethods
Get-ActiveSyncVirtualDirectory -Server $Server | fl Id,InternalURL,ExternalURL ,InternalAuthenticationMethods,ExternalAuthenticationMethods
Get-WebServicesVirtualDirectory -Server $Server | fl Id,InternalURL,ExternalURL ,InternalAuthenticationMethods,ExternalAuthenticationMethods 
Get-ClientAccessService -Identity $Server | fl Fqdn,AutodiscoverServiceInternalURI


# PS commands to configure Exch2016 virtual directories
$Server = “STLPVEXC02"   
$FQDNInternal = "stlmail.ccaglobal.com"
$FQDNExternal = "stlmail.ccaglobal.com"
Get-OWAVirtualDirectory -Server $Server | Set-OWAVirtualDirectory -InternalURL "https://$($FQDNInternal)/owa" -ExternalURL "https://$($FQDNExternal)/owa"
Get-ECPVirtualDirectory -Server $Server | Set-ECPVirtualDirectory -InternalURL "https://$($FQDNInternal)/ecp" -ExternalURL "https://$($FQDNExternal)/ecp"
Get-OABVirtualDirectory -Server $Server | Set-OABVirtualDirectory -InternalURL "https://$($FQDNInternal)/oab" -ExternalURL "https://$($FQDNExternal)/oab"
Get-ActiveSyncVirtualDirectory -Server $Server | Set-ActiveSyncVirtualDirectory -InternalURL "https://$($FQDNExternal)/Microsoft-Server-ActiveSync" -ExternalURL "https://$($FQDNExternal)/Microsoft-Server-ActiveSync"
Get-WebServicesVirtualDirectory -Server $Server | telnet -InternalURL "https://$($FQDNExternal)/EWS/Exchange.asmx" -ExternalURL "https://mail.ccaglobal.com/EWS/Exchange.asmx"
Get-MapiVirtualDirectory -Server $Server | Set-MapiVirtualDirectory -InternalURL "https://$($FQDNInternal)/mapi" -ExternalURL https://$($FQDNExternal)/mapi
Get-PowerShellVirtualDirectory -Server $Server | Set-PowerShellVirtualDirectory -InternalUrl "https://$($FQDNInternal)/PowerShell"
iisreset /noforce


# PS commands to update SCP
$Server = “STLPVEXC02"   
$AutoD_FQDN = "autodiscover.ccaglobal.local "
Set-ClientAccessService -Identity $Server -AutodiscoverServiceInternalURI https://$($AutoD_FQDN)/Autodiscover/Autodiscover.xml


# configure the Offline Address Book (OAB) to allow Autodiscover to select the right virtual directory for distributing the OAB
Get-OfflineAddressBook | Where {$_.ExchangeVersion.ExchangeBuild.Major -Eq 15} | Set-OfflineAddressBook -GlobalWebDistributionEnabled $True -VirtualDirectories $Null


# PS commands to set and query the Outlook Anywhere internalhost URL
set-outlookanywhere -Identity:"MANPVEXC02\Rpc (Default Web Site)" -InternalHostname manmail.ccaglobal.com -InternalClientsRequireSsl $false
Get-OutlookAnywhere -Identity:"MANPVEXC02\Rpc (Default Web Site)" | fl | more

