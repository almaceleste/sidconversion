@{
Author='almaceleste'
Copyright='GNU Affero GPL v3 (ɔ) 2020 almaceleste'
Description='this module contains the cmdlets for conversion SID (security identifier) of a Windows user or group account to the name of this account'
GUID='edafd5e9-e2db-42d5-b850-aa748a4dbbc4'
HelpInfoURI = 'https://github.com/almaceleste/powershell/sidconversion'
ModuleVersion='0.1.0.0'
PowerShellVersion='3.0'
RootModule='SidConversion.psm1'
AliasesToExport=@('cfsid','ctsid')
CmdletsToExport=@(
    'ConvertFrom-Sid',
    'ConvertTo-Sid')
}
