param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    $FileName       = [System.IO.Path]::GetFileName($File)
    $FileDirectory  = [System.IO.Path]::GetDirectoryName($File)
    $FolderName     = "New Folder"
    
    $FinalDirectory = $FileDirectory + "\" + $FolderName
    if(!(Test-Path -LiteralPath $FinalDirectory -PathType Container)){
        New-Item -Path $FinalDirectory -ItemType Directory -Force
    }
    $FinalDirectoryAndFile = $FinalDirectory + "\" + $FileName
    Move-Item -LiteralPath $File -Destination $FinalDirectoryAndFile
}

$wshell = New-Object -ComObject wscript.shell
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 20
$wshell.SendKeys("{F5}")

Remove-Item $FileList -Force