param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Fonts = Get-Content $FileList

D:\Dev\Python\Fonttools\Scripts\Activate.ps1

foreach ($Font in $Fonts) {
    
    $RealFontName = python "C:\Tools\scripts\BIN\get_font_name.py" $Font
    $StaticFontName = $RealFontName

    $CurrentFileName = [System.IO.Path]::GetFileName($Font)
    if($RealFontName -eq $CurrentFileName){
        continue
    }

    $DirectoryName = [System.IO.Path]::GetDirectoryName($Font)
    $NewFontFull = $DirectoryName + '\' + $RealFontName

    $Index = 1
    while (Test-Path -LiteralPath $NewFontFull -PathType Leaf) {

        $FDir  = [System.IO.Path]::GetDirectoryName($NewFontFull)
        $FExt  = [System.IO.Path]::GetExtension($NewFontFull)
        $FName = [System.IO.Path]::GetFileNameWithoutExtension($StaticFontName)

        $RealFontName = $FName + ' (' + $Index + ')' + $FExt
        $NewFontFull = $FDir + '\' + $RealFontName
        $Index += 1
    }

    Rename-Item -LiteralPath $Font -NewName $RealFontName -Force

}

Remove-Item $FileList -Force