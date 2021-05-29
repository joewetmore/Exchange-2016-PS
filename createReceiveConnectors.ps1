New-ReceiveConnector -Server Sac-exch2016-p1 -Name “SFCU API Relay” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.195.30-10.10.195.32
Set-ReceiveConnector "Sac-exch2016-p1\SFCU API Relay" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\SFCU API Relay" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “Forcepoint Management Server” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.194.41
Set-ReceiveConnector "Sac-exch2016-p1\Forcepoint Management Server" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\Forcepoint Management Server" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “DNA-WEB Relay” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.194.234,65.74.149.200, 10.10.198.1,10.10.198.254,10.10.195.90,10.10.195.199,10.10.194.33,10.10.194.30
Set-ReceiveConnector "Sac-exch2016-p1\DNA-WEB Relay" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\DNA-WEB Relay" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “Solarwinds Alerts” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.196.110
Set-ReceiveConnector "Sac-exch2016-p1\Solarwinds Alerts" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\Solarwinds Alerts" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “Jira Relay” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.195.209
Set-ReceiveConnector "Sac-exch2016-p1\Jira Relay" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\Jira Relay" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “Akcelerant Relay” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 10.10.194.140,10.10.194.139,10.10.194.196,10.10.194.198,10.10.194.199,10.10.198.0/24,10.10.194.195,10.10.194.176,10.10.194.162,10.10.194.161,10.10.194.28
Set-ReceiveConnector "Sac-exch2016-p1\Akcelerant Relay" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\Akcelerant Relay" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
 
New-ReceiveConnector -Server Sac-exch2016-p1 -Name “Inbound from Office 365” -TransportRole FrontendTransport -Custom -Bindings 0.0.0.0:25 -RemoteIpRanges 23.103.144.0/20,216.32.180.0/23,157.56.110.0/23,40.92.0.0/14,40.107.0.0/16,207.46.108.0/25,52.100.0.0/14,157.56.120.0/25,157.56.116.0/25,134.170.101.0/24,207.46.100.0/24,157.56.112.0/24,157.56.87.192/26, 157.55.133.160/27,134.170.171.0/24,134.170.140.0/24
Set-ReceiveConnector "Sac-exch2016-p1\Inbound from Office 365" -PermissionGroups AnonymousUsers
Get-ReceiveConnector "Sac-exch2016-p1\Inbound from Office 365" | Add-ADPermission -User 'NT AUTHORITY\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient
