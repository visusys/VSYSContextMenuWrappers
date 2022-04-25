param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    $FileExtension  = [System.IO.Path]::GetExtension($File)
    $FileName       = [System.IO.Path]::GetFileName($File)
    $FileDirectory  = [System.IO.Path]::GetDirectoryName($File)
    $FolderName     = "Unknown"

    switch($FileExtension) {
        ".TTF" {
            $FolderName = "TT"
        }
        ".OTF" {
            $FolderName = "OT"
        }
        ".WOFF" {
            $FolderName = "WEB"
        }
        ".WOFF2" {
            $FolderName = "WEB"
        }
        ".PDF" {
            $FolderName = "Info"
        }
        ".TXT" {
            $FolderName = "Info"
        }
        ".RTF" {
            $FolderName = "Info"
        }
        ".SVG" {
            $FolderName = "Vector"
        }
        ".AI" {
            $FolderName = "Vector"
        }
        default {
            $FolderName = "Unknown"
        }
    }

    
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

Remove-Item $FileList -Force