$AESKeyFilePath = “\\Covenant-File-Server\ClientVPN$\admin_aeskey.txt” # location of the AESKey                
$SecurePwdFilePath = “\\Covenant-File-Server\ClientVPN$\admin_credpassword.txt" # location of the file that hosts the encrypted password                
$userUPN = "Covenant\admin_brianb759" # User account login 

#use key and password to create local secure password
$AESKey = Get-Content -Path $AESKeyFilePath 
$pwdTxt = Get-Content -Path $SecurePwdFilePath
$securePass = $pwdTxt | ConvertTo-SecureString -Key $AESKey

$adminCreds = New-Object System.Management.Automation.PSCredential($userUPN, $securePass)

#Invoke-Command -FilePath "\\Covenant-File-Server\ClientVPN$\Install_Client_VPN.ps1" -Credential $admincreds -Computer localhost

Start-Process -FilePath "powershell" -Credential $admincreds -ArgumentList @("-file ""\\Covenant-File-Server\ClientVPN$\Install_Client_VPN.ps1""")