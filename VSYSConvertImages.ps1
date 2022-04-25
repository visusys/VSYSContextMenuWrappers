param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg','gif','tiff','bmp','webp', IgnoreCase = $true)]
    [String]
    $DestFormat

)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $File  = $_
    $SrcFormat = ([System.IO.Path]::GetExtension($File)).Replace('.','')
    $DstFormat = ($Using:DestFormat).ToLower()

    Write-Host "`$SrcFormat:" $SrcFormat -ForegroundColor Green

    $OrgFile = [System.IO.Path]::GetFullPath($File)
    $NewFile = [System.IO.Path]::ChangeExtension($File, $DstFormat)

    $Idx = 2
    while (Test-Path -LiteralPath $NewFile -PathType Leaf) {

        $Dir = [System.IO.Path]::GetDirectoryName($NewFile)
        $Fn = [System.IO.Path]::GetFileNameWithoutExtension($NewFile)

        $NewFile = $Dir + '\' + $Fn + " ($Idx)" + "." + $DstFormat
        $Idx++
    }

    if(($SrcFormat -eq 'png') -and (($DstFormat -eq 'jpg') -or ($DstFormat -eq 'bmp'))){
        magick $OrgFile -background white -flatten -alpha off $NewFile
    }elseif (($SrcFormat -eq 'tiff') -and (($DstFormat -eq 'jpg') -or ($DstFormat -eq 'bmp'))){
        magick $OrgFile -background white -flatten -alpha off $NewFile
    }elseif (($SrcFormat -eq 'gif') -and (($DstFormat -eq 'jpg') -or ($DstFormat -eq 'bmp'))){
        magick $OrgFile -background white -flatten -alpha off $NewFile
    }elseif (($SrcFormat -eq 'webp') -and (($DstFormat -eq 'jpg') -or ($DstFormat -eq 'bmp'))){
        magick $OrgFile -background white -flatten -alpha off $NewFile
    }else{
        magick $OrgFile $NewFile
    }

} -ThrottleLimit 20


Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox("Conversion to $($DestFormat.ToUpper()) Complete.",'OKOnly,SystemModal,Information', 'Conversion Complete')


Remove-Item $FileList -Force
