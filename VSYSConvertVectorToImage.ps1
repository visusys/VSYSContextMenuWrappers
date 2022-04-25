param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg',IgnoreCase = $true)]
    [String]
    $DestFormat,

    [Parameter(Mandatory=$false)]
    [Switch]
    $OnlyFirstArtboard,

    [Parameter(Mandatory = $false)]
    [Int32]
    $DPIMultiplier = 1

)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $File  = $_
    $SourceFormat = (([System.IO.Path]::GetExtension($File)).Replace('.','')).ToLower()
    $Filename = [System.IO.Path]::GetFileNameWithoutExtension($File)
    $FileDirectory  = [System.IO.Path]::GetDirectoryName($File)
    $TempDirectory = (New-TempDirectory -Length 10).FullName

    $ConvertedFile = $TempDirectory + '\' + $Filename + '-%d' + ".$Using:DestFormat"
    $ConvertedFileFromSVG = $TempDirectory + '\' + $Filename + ".$Using:DestFormat"

    $FinalFile = $FileDirectory + '\' + $Filename + '-%d' + ".$Using:DestFormat"
    
    $PageListString = ""
    if($OnlyFirstArtboard){
        $PageListString = "-sPageList=1"
    }

    $DPI = 72 * $Using:DPIMultiplier
    $DPIString = 72 * $Using:DPIMultiplier
    $DPIString = $DPIString.ToString()
    $DPIString = "-r$DPIString"

    Write-Host "`$DPI:" $DPI -ForegroundColor Green

    switch ($Using:DestFormat) {
        "png" {
            if($SourceFormat -eq 'svg'){
                Write-Host "SVG"
                # -d and -p set the resolution of the image in pixels per inch. 72DPI = Screen
                # rsvg-convert -d 40 -p 40 -a -f png `"$File`" -o `"$ConvertedFileFromSVG`"
                #rsvg-convert -w 2500 -h 2500 -a -f png `"$File`" -o `"$ConvertedFileFromSVG`"
                magick -background none -density $DPI $File -resize 100% `"$ConvertedFileFromSVG`"
            }else{
                #Density at 72 = Screen DPI, Outputs exact size of artboard
                #gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=png16m -r$DPIString $PageListString -sDEVICE=pngalpha "-sOutputFile=$ConvertedFile" $File
                gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=png16m $DPIString $PageListString -sDEVICE=pngalpha "-sOutputFile=$ConvertedFile" $File
            }
        }
        "jpg" {
            if($SourceFormat -eq 'svg'){
                magick -density $DPI $File -resize 100% `"$ConvertedFileFromSVG`"
            }else{
                #gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=jpeg -dJPEGQ=100 -r$DPIString $PageListString "-sOutputFile=$ConvertedFile" $File
                gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=jpeg -dJPEGQ=100 $DPIString $PageListString "-sOutputFile=$ConvertedFile" $File
            }
        }
    }

    $TempFiles = Get-ChildItem -LiteralPath $TempDirectory

    foreach ($TempFile in $TempFiles) {
        
        $TempFilenameFull = [System.IO.Path]::GetFileName($TempFile)
        Write-Host "`$TempFilenameFull:" $TempFilenameFull -ForegroundColor Green

        if(($TempFile.FullName) -eq ($TempDirectory + '\' + $Filename + '-1' + ".$Using:DestFormat")){
            Write-Host "Found first file." -ForegroundColor Yellow
            $NewTempFile = Rename-Item $TempFile -NewName ($Filename + ".$Using:DestFormat") -PassThru
            $TempFile = $NewTempFile.FullName
        }

        Write-Host "Attempting to move $([System.IO.Path]::GetFileName($TempFile)) back to $FileDirectory..." -ForegroundColor Green

        $TempFileDir = [System.IO.Path]::GetDirectoryName($TempFile)
        $TempFilename = [System.IO.Path]::GetFileNameWithoutExtension($TempFile)
        $TempFileExt = [System.IO.Path]::GetExtension($TempFile)

        $TestFileFull = $FileDirectory + '\' + $TempFilename + $TempFileExt
        $ActualFilename = $TempFileDir + '\' + $TempFilename + $TempFileExt

        $Idx = 2
        $DuplicateFound = $false
        while (Test-Path -LiteralPath $TestFileFull -PathType Leaf) {
            Write-Host "Found a duplicate file $([System.IO.Path]::GetFileName($TestFileFull))." -ForegroundColor Green
            $DuplicateFound = $true
            $TestFileFull = $FileDirectory + '\' + $TempFilename + " ($Idx)" + $TempFileExt
            $UpdatedFileName = $TempFilename + " ($Idx)" + $TempFileExt
            $Idx++
        }

        if($DuplicateFound){
            Write-Host "Attempting to rename $([System.IO.Path]::GetFileName($ActualFilename)) to $UpdatedFileName and move it to $FileDirectory"  -ForegroundColor Green
            Rename-Item $ActualFilename -NewName $UpdatedFileName
            Move-Item ($TempFileDir + '\' + $UpdatedFileName) -Destination $FileDirectory
        }else{
            
            Write-Host -Message "Moving $([System.IO.Path]::GetFileName($ActualFilename)) to $FileDirectory" -ForegroundColor Green
            Move-Item $ActualFilename -Destination $FileDirectory
        }
    }

    Write-Host "Temp Directory: $TempDirectory"  -ForegroundColor Green

} -ThrottleLimit 20


Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox("Conversion to $($DestFormat.ToUpper()) Complete.",'OKOnly,SystemModal,Information', 'Conversion Complete')

Remove-Item $FileList -Force
