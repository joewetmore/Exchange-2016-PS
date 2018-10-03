# CMD shell commands to migrate the mail queue
md q:\Exchange && md q:\Exchange\TransportRoles && md q:\Exchange\TransportRoles\Data && md q:\Exchange\TransportRoles\Data\Queue
copy %ExchangeInstallPath%Bin\EdgeTransport.exe.config %ExchangeInstallPath%Bin\EdgeTransport.exe.config.backup


Edit : %ExchangeInstallPath%Bin\EdgeTransport.exe.config
And change:
    <add key="QueueDatabasePath" value="Q:\Exchange\TransportRoles\data\Queue" />
    <add key="QueueDatabaseLoggingPath" value="Q:\Exchange\TransportRoles\data\Queue" />


net stop MSExchangeTransport && net start MSExchangeTransport




# PS command to get the anonymous relay connector config
$formatenumerationlimit = -1
Get-ReceiveConnector -Identity "stlpvexc01\relay" | fl remoteipranges


# create new receiveconnectors
New-ReceiveConnector -Name "Relay" -server STLPVEXC02 -TransportRole Frontend -Usage custom -permissiongroups AnonymousUsers -Bindings 0.0.0.0:25 -maxmessagesize 39MB -RemoteIPRanges 10.10.10.1-10.10.10.39, 10.10.10.41-10.10.10.245, 10.10.17.0/24, 10.10.16.0/24, 10.10.15.0/24, 10.10.80.0/24, 10.10.11.0/24, 10.10.12.0/24, 50.204.65.180/31, 76.8.218.48/29, 50.204.144.0/26, 50.204.66.16/28, 12.216.195.50, 10.0.71.0/24, 10.0.70.0/24, 10.0.100.210, 10.0.80.0/24, 10.0.10.30, 10.0.50.0/24, 10.0.51.0/24, 10.0.1.0/24, 10.0.10.0/24
Get-ReceiveConnector "STLPVEXC02\Relay" | Add-ADPermission -User 'NT Authority\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient

New-ReceiveConnector -Name "Relay" -server MANPVEXC02 -TransportRole Frontend -Usage custom -permissiongroups AnonymousUsers -Bindings 0.0.0.0:25 -maxmessagesize 39MB -RemoteIPRanges 10.0.30.41-10.0.30.255, 10.0.30.1-10.0.30.39, 10.10.31.0/24
Get-ReceiveConnector "MANPVEXC02\Relay" | Add-ADPermission -User 'NT Authority\Anonymous Logon' -ExtendedRights MS-Exch-SMTP-Accept-Any-Recipient



