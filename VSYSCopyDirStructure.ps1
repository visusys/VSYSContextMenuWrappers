param (
    [Parameter(Mandatory,Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $FileList
)

$Folders = Get-Content $FileList

foreach ($Folder in $Folders) {
    Copy-DirectoryStructureToNewFolder -SourcePath $Folder
}

Remove-Item $FileList -Force

$wshell = New-Object -ComObject wscript.shell
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")

