param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$InputFolders = Get-Content $FileList

foreach ($Folder in $InputFolders) {

    $LogFile = $Folder + '\FontRenamer.log'

    if(Test-Path -LiteralPath $LogFile -PathType Leaf){
        Remove-Item $LogFile -Force
    }

    Start-Process -FilePath FontRenamer.exe -ArgumentList "`"$Folder`" /r" -Wait

    Remove-Item $LogFile -Force
}

Remove-Item $FileList -Force