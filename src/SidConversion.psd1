@{
Author='almaceleste'
Copyright='GNU Affero GPL v3 (ɔ) 2020 almaceleste'
Description='this module contains the cmdlets for conversion SID (security identifier) of a Windows user or group account to the name of this account and backward'
DotNetFrameworkVersion='2.0'
GUID='edafd5e9-e2db-42d5-b850-aa748a4dbbc4'
HelpInfoURI = 'https://github.com/almaceleste/sidconversion/blob/master/README.md'
ModuleVersion='0.1.1'
PowerShellVersion='3.0'
PrivateData = @{
    PSData = @{
        LicenseUri='https://github.com/almaceleste/sidconversion/blob/master/LICENSE'
        ProjectUri='https://github.com/almaceleste/sidconversion'
        Tags=@(
            'account',
            'conversion',
            'convert',
            'domain',
            'group',
            'identifier',
            'local',
            'principal',
            'security',
            'sid',
            'string',
            'user',
            'well-known',
            'windows')
    }
}
RequiredAssemblies=@(
    'mscorlib.dll')
RequiredModules=@(
    'Microsoft.PowerShell.Utility')
RootModule='SidConversion.psm1'
AliasesToExport=@('cfsid','ctsid')
CmdletsToExport=@(
    'ConvertFrom-Sid',
    'ConvertTo-Sid')
}
