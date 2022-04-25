param (
    [Parameter(Mandatory,Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Force
)

$Folders = Get-Content $FileList

foreach ($Folder in $Folders) {
    if($Force){
        Merge-FlattenDirectory $Folder -Force
    }else{
        Merge-FlattenDirectory $Folder
    }
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