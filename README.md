### about
SidConversion module contains the cmdlets for conversion SID (security identifier) of a Windows user or group account to the name of this account and backward
* required PowerShell version 3.0 or later
* `ConvertFrom-Sid` cmdlet converts the SID of the user or group account to the name of this account
* `ConvertTo-Sid` converts a Windows user or group account name to the SID of this account
* if you want to try this cmdlets or need to convert a SID once and do not want to install module, you could use the scripts `ConvertFrom-Sid.ps1` and `ConvertTo-Sid.ps1`, which are full-fledged separate copies of the same-named cmdlets

#### license  
[![license](https://img.shields.io/github/license/almaceleste/sidconversion.svg?longCache=true)](https://github.com/almaceleste/sidconversion/blob/master/LICENSE)

### how to install
#### install from github with git
```
git clone https://github.com/almaceleste/sidconversion.git
Register-PSRepository -Name SidConversionRepo -SourceLocation ./sidconversion
Install-Module SidConversion -Scope CurrentUser -Repository SidConversionRepo
```
#### install from PowerShell Gallery
```
Install-Module -Name SidConversion
```

### list of cmdlets
#### ConvertFrom-Sid
`ConvertFrom-Sid` converts the SID of the user or group account to the name of this account. you could convert both local and domain accounts SIDs.

#### ConvertTo-Sid
`ConvertTo-Sid` converts a Windows user or group account name to the SID of this account. you could convert both local and domain accounts (for local accounts use local machine name (or .) as parameter -domain)

### support me
[![Beerpay](https://beerpay.io/almaceleste/sidconversion/badge.svg?style=beer-square)](https://beerpay.io/almaceleste/sidconversion) [![Beerpay](https://beerpay.io/almaceleste/sidconversion/make-wish.svg?style=flat-square)](https://beerpay.io/almaceleste/sidconversion?focus=wish)
[![](https://img.shields.io/badge/Paypal-donate_me-blue.svg?longCache=true&logo=paypal)](https://www.paypal.me/almaceleste "paypal | donate me") 
