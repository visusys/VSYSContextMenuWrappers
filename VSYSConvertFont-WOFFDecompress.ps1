param (
    [Parameter(Mandatory,Position = 0)]
    [String]$FileList,

    [Parameter(Mandatory,Position = 1)]
    [ValidateSet('TTF','OTF', IgnoreCase = $true)]
    [String]
    $OutputFormat
)

$WOFFS = Get-Content $FileList

if(!$WOFFS){
    throw [System.Exception] "No selected files to convert."
}

D:\Dev\Python\Fonttools\Scripts\Activate.ps1

$WOFFS | ForEach-Object -Parallel {

    $FontExtension = [System.IO.Path]::GetExtension($_)

    if($Using:OutputFormat -eq 'otf'){

        python.exe "C:\Tools\scripts\BIN\woff2otf.py" $_

    } else {

        Write-Host "`$FontExtension:" $FontExtension -ForegroundColor Green
        # Output format is TTF
        $FontFile = $_
        switch ($FontExtension) {
            '.woff2' {
                woff2_decompress $FontFile
                break
            }
            '.woff' {
                $OriginalFileName = [System.IO.Path]::GetFileName($FontFile)
                $NewFileName = [System.IO.Path]::ChangeExtension($OriginalFileName, 'ttf')
                $FullDirectory = [System.IO.Path]::GetDirectoryName($FontFile)
                $NewTTFFile = $FullDirectory + "\" + $NewFileName

                # C:\Tools\scripts\BIN\Fonttools\Scripts\Activate.ps1
                python.exe "C:\Tools\scripts\BIN\woff2otf.py" $FontFile $NewTTFFile
                break
            }
        }
    }

} -ThrottleLimit 15

Remove-Item $FileList -Force



