# Windows Security Identifier (SID) conversion module for PowerShell
# GNU Affero GPL v3 (ɔ) 2020 almaceleste
# https://github.com/almaceleste

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# https://www.gnu.org/licenses/agpl-3.0.html
# https://www.gnu.org/licenses/agpl-3.0.txt

<#
    .SYNOPSIS
    ConvertFrom-Sid converts the SID of the user or group account to the name of this account
    .DESCRIPTION
    ConvertFrom-Sid converts the SID of the user or group account to the name of this account. you could convert both local and domain accounts SIDs. 
    .PARAMETER sid
    SID of the user or group account whose name we want to get
    .EXAMPLE
    ConvertFrom-Sid -sid S-1-1-0  # output: Everyone
    this example returns Everyone user group account name
    .EXAMPLE
    ConvertFrom-Sid -sid S-1-5-21-<example.com part>-501  # output: Guest
    this example returns default guest domain account name
    .INPUTS
    string
    .OUTPUTS
    string
    .LINK
    https://github.com/almaceleste/powershell/sidconversion#ConvertFrom-Sid
    .COMPONENT
    System.Security.Principal
    .NOTES
    Version:        0.1.0.0
    Author:         almaceleste
    Creation Date:  2020
    Purpose/Change: Initial script development
#>
function ConvertFrom-Sid {
    [Alias("cfsid")]
    [CmdletBinding()]
    param (
        [Parameter(
            HelpMessage='enter SID (security identifier, looks like S-1-1-...)',
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [ValidateLength(5,256)]
        [ValidatePattern('^S-[0-9]{1}-[0-9]{1}[\-0-9]{0,251}', Options='IgnoreCase')]
        [System.String]
        $SID
    )
    try {
        $account = (New-Object System.Security.Principal.SecurityIdentifier($SID)).Translate([System.Security.Principal.NTAccount])
        return $account.Value
    }
    catch {
        return "SID $SID not found"
    }
}

<#
    .SYNOPSIS
    ConvertTo-Sid converts a Windows user or group account name to the SID of this account
    .DESCRIPTION
    ConvertTo-Sid converts a Windows user or group account name to the SID of this account. you could convert both local and domain accounts (for local accounts use local machine name (or .) as parameter -domain)
    .PARAMETER accountName
    account name of user or group for which we want to get SID
    .PARAMETER domain
    domain name of user or group for which we want to get SID
    .EXAMPLE
    ConvertTo-Sid -name everyone   # output: S-1-1-0
    this example returns SID for the Everyone user group
    .EXAMPLE
    ConvertTo-Sid -name guest -domain example.com   # output: S-1-5-21-<example.com part>-501
    this example returns SID for the Guest domain user
    .INPUTS
    string
    .OUTPUTS
    string
    .LINK
    https://github.com/almaceleste/powershell/sidconversion#ConvertTo-Sid
    .COMPONENT
    System.Security.Principal
    .NOTES
    Version:        0.1.0.0
    Author:         almaceleste
    Creation Date:  2020
    Purpose/Change: Initial script development
#>
function ConvertTo-Sid {
    [Alias("ctsid")]
    [CmdletBinding()]
    param
    (
        [Alias('samAccountName')]
        [Parameter(
            HelpMessage='input user of group account name (exclude "/ \ [ ] : ; | = , + * ? < > and space)',
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [ValidateLength(1,104)]
        [ValidatePattern('[^\"/\\\[\]:;\|=\,\+\*\?<>\s]', Options='IgnoreCase')]
        [System.String]
        $accountName, 

        [Alias('NTDomain')]
        [Parameter(
            HelpMessage="input NT domain name or FQDN (exclude `" , ~ : ! @ # $ % ^ & ' ( ) { } _ and space)",
            Mandatory=$false,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [ValidateLength(1,64)]
        [ValidatePattern("^[a-z0-9][^,~:!@#\$%\^\&\'\(\)\{\}_\s]+[^\-]$|\.", Options='IgnoreCase')]
        [System.String]
        $domain
    )
    try {
        if ([string]::IsNullOrEmpty($domain)) {
            $account = New-Object System.Security.Principal.NTAccount($accountName)
        }
        else {
			if ($domain -eq ".") {$domain=$env:computername}
            $account = New-Object System.Security.Principal.NTAccount($domain,$accountName)
        }
        $sid = $account.Translate([System.Security.Principal.SecurityIdentifier])
        return $sid.Value
    }
    catch {
        return "Account $accountName does not exist"
    }
}

if ($PSVersionTable.PSVersion.Major -lt 4) {
    New-Alias -Name cfsid -Value ConvertFrom-Sid
    New-Alias -Name ctsid -Value ConvertTo-Sid
    Export-ModuleMember -Alias * -Function *
}