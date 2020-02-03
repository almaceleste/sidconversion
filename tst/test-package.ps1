#!/usr/bin/pwsh

$modulename='SidConversion'
$reponame="${modulename}Repo"
$repopath="/tmp/$modulename/"
$result='///  test is ok.  ///'
$Error.Clear()
Uninstall-Module $modulename -ErrorAction Ignore
Unregister-PSRepository $reponame -ErrorAction Ignore
Remove-Item $repopath/* -Recurse -ErrorAction Ignore

New-Item -ItemType Directory -Path $repopath -ErrorAction Ignore
Copy-Item ./pkg/$modulename.nupkg -Destination $repopath

Write-Output '===  Register-Repository  ==='
Register-PSRepository -Name $reponame -SourceLocation $repopath -InstallationPolicy Trusted -Verbose

$Error.Clear()
Write-Output '===  Install-Module  ==='
Install-Module -Name $modulename -Scope CurrentUser -Repository $reponame -Verbose
if ($Error.Count -eq 0) {
    Uninstall-Module $modulename
}
Unregister-PSRepository $reponame
if ($Error.Count -ne 0) {
    $result=$Error
}
Remove-Item $repopath/* -Recurse -ErrorAction Ignore

Write-Output '====================='
Write-Output $result
Write-Output '====================='
