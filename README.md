# invoke-bagdorr

## Getting started

invoke-bagdorr (invoke-bakdörr translated from skånska) is a simple script that checks for recommended security hardening on Windows clients

### Usage

```
iex (new-object net.webclient).downloadstring("https://raw.githubusercontent.com/viksecurity/invoke-bagdorr/main/invoke-bagdorr.ps1")

wdigest UserLogonCredential not set
wdigest Negotiate not set
RunAsPPL not set
CredentialGuard not configured
CredentialGuard not running
CachedLogonsCount higher than 2. Result:  10

```
