param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    Write-Host "`$File: " $File -ForegroundColor Green
    $CurrentFolder = Get-ChildItem -LiteralPath $File
    foreach ($ChildFile in $CurrentFolder) {

        Write-Host "`$ChildFile:" $ChildFile -ForegroundColor Green
        
        $FileExtension  = [System.IO.Path]::GetExtension($ChildFile)
        $FileName       = [System.IO.Path]::GetFileName($ChildFile)
        $FileDirectory  = [System.IO.Path]::GetDirectoryName($ChildFile)
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
        Write-Host "Final font directory:" $FinalDirectory -ForegroundColor Green
        if(!(Test-Path -LiteralPath $FinalDirectory -PathType Container)){
            Write-Host "Creating font subdirectory:" $FinalDirectory -ForegroundColor Cyan
            New-Item -Path $FinalDirectory -ItemType Directory -Force
        }

        $FinalDirectoryAndFile = $FinalDirectory + "\" + $FileName
        Write-Host "Final file to be moved:" $FinalDirectoryAndFile -ForegroundColor Green

        Move-Item -LiteralPath $ChildFile -Destination $FinalDirectoryAndFile

    }

}

Remove-Item $FileList -Force