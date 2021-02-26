#Check wdigest flag
$check=Get-ItemProperty -Path HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\WDigest -Name "UserLogonCredential" -ErrorAction SilentlyContinue
if($check.UserLogonCredential -ne 0){ write-host 'wdigest UserLogonCredential not set' -BackgroundColor Red}
if($check.UserLogonCredential -eq 0){ write-host 'wdigest UserLogonCredential set' -BackgroundColor Green}

$check2=Get-ItemProperty -Path HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\WDigest -Name "Negotiate" -ErrorAction SilentlyContinue
if($check2.Negotiate -ne 0){ write-host 'wdigest Negotiate not set' -BackgroundColor Red }
if($check2.Negotiate -eq 0){ write-host 'wdigest Negotiate set' -BackgroundColor Gren }

#RunAsPPL
$check3=Get-ItemProperty -Path HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\LSA -Name "RunAsPPL" -ErrorAction SilentlyContinue
if($check3.RunAsPPL -ne 1){ write-host 'RunAsPPL not set' -BackgroundColor Red }
if($check3.RunASPPL -eq 1){ write-host 'RunASPPL set' -BackgroundColor Gren }

$DevGuard = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace "root\Microsoft\Windows\DeviceGuard" -ErrorAction SilentlyContinue
if($DevGuard.SecurityServicesConfigured -contains '0'){ write-host 'CredentialGuard not configured' -BackgroundColor Red }
if($DevGuard.SecurityServicesConfigured -contains '1'){ write-host 'CredentialGuard configured' -BackgroundColor Green }
if($DevGuard.SecurityServicesRunning -contains '0'){ write-host 'CredentialGuard not running' -BackgroundColor Red }
if($DevGuard.SecurityServicesRunning -contains '1'){ write-host 'CredentialGuard not running' -BackgroundColor Green }

#Cached Accounts
$cachedaccounts=Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "CachedLogonsCount" -ErrorAction SilentlyContinue
if([INT]$cachedaccounts.CachedLogonsCount -ge '3'){ write-host "CachedLogonsCount higher than 2. Result: "$cachedaccounts.CachedLogonsCount -BackgroundColor Red }
if([INT]$cachedaccounts.CachedLogonsCount -le '2'){ write-host "CachedLogonsCount lower than 2. Result: "$cachedaccounts.CachedLogonsCount -BackgroundColor Green }
