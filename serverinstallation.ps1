./setup.exe /mode:install /IAcceptExchangeServerLicenseTerms /Role:mailbox /customerfeedbackenabled:false /targetdir:"D:\\Exchange\\" /MdbName:STL-AB /dbfilepath:"M:\\ExchangeDB\\STL-AB\\STL-AB.edb" /LogFolderPath:"L:\\ExchangeLogs\\STL-AB\\" 

# create new offline address book
New-OfflineAddressBook -Name "OAB16" -AddressLists "\Default Global Address List"

# confirm
Get-OfflineAddressBook
Get-MailboxDatabase |ft name,server,offlineaddressbook -AutoSize

# create mailstores
New-MailboxDatabase -Name "STL_A-B" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-AB\STL-AB.edb -LogFolderPath L:\ExchangeLogs\STL-AB -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_C-D" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-CD\STL-CD.edb -LogFolderPath L:\ExchangeLogs\STL-CD -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_E-J" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-EJ\STL-EJ.edb -LogFolderPath L:\ExchangeLogs\STL-EJ -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_K-M" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-KM\STL-KM.edb -LogFolderPath L:\ExchangeLogs\STL-KM -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_N-R" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-NR\STL-NR.edb -LogFolderPath L:\ExchangeLogs\STL-NR -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_S-Z" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-SZ\STL-SZ.edb -LogFolderPath L:\ExchangeLogs\STL-SZ -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL-CALLCENTER" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-CALLCENTER\STL-CALLCENTER.edb -LogFolderPath L:\ExchangeLogs\STL-CALLCENTER -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL_DROPBOX_MbxDB" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-_DROPBOX_MbxDB\STL-_DROPBOX_MbxDB.edb -LogFolderPath L:\ExchangeLogs\STL-_DROPBOX_MbxDB -OfflineAddressBook "OAB16" -confirm:$false
New-MailboxDatabase -Name "STL-ExEmployees" -Server STLPVEXC02 -EdbFilePath M:\ExchangeDB\STL-ExEmployees\STL-ExEmployees.edb -LogFolderPath L:\ExchangeLogs\STL-ExEmployees -OfflineAddressBook "OAB16" -confirm:$false
Restart-Service -Name MSExchangeIS
 


