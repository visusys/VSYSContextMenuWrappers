param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList
$TempDir = New-TempDirectory -Length 10 
$TempDir = $TempDir.FullName

# Prepare the JavaScript file for use
#
$SourceScript = $PSScriptRoot + "\VSYSConvert3DSTEPMOI.js"
$DestScript = $TempDir + "\VSYSConvert3DSTEPMOI.js"

Copy-Item -LiteralPath $SourceScript -Destination $TempDir -Force

$ConvertedFiles = New-Object -TypeName "System.Collections.ArrayList"
foreach ($File in $Files) {

    $OriginalPath = [System.IO.Path]::GetDirectoryName($File)
    $ConvertedFiles.Add([System.IO.Path]::ChangeExtension($File,'fbx'))
    $File = $File.Replace('\','\\')

    # Append conversion instructions to the JS file.
    "`nConvert( '$File' );" | Out-File -FilePath $DestScript -Append
}

# Finally, add an exit command to the JS File.
"moi.exit( true );" | Out-File -FilePath $DestScript -Append


# Run the script and start conversion.
#
Write-Host "Processing..."
MoI.exe `"$DestScript`" | Out-Null


# Move converted files to the temporary directory and
# Populate a new arraylist with the correct paths to the new FBX files
$RelocatedFiles = New-Object -TypeName "System.Collections.ArrayList"
foreach ($3DFile in $ConvertedFiles) {  
    $RelocatedFile = Move-Item -LiteralPath $3DFile -Destination $TempDir -Force -PassThru
    $RelocatedFiles.Add($RelocatedFile.FullName)
}

# After conversion we need to update FBX files if not OBJ.
#
Write-Host "Completed conversion. Now updating FBX files to 2013..."

foreach ($File in $RelocatedFiles){

    $FileName  = [System.IO.Path]::GetFileName($File)
    $UpdateDir = $TempDir + '\Converted'
    $FileToUpdate  = $UpdateDir + '\' + $FileName

    if(!(Test-Path -LiteralPath $UpdateDir -PathType Container)){
        New-Item -Path $UpdateDir -ItemType Directory -Force | Out-Null
    }

    FBXCONVERTER.exe `"$File`" `"$FileToUpdate`" /v /l /f201300 /e /binary | Out-Null
    Move-Item -LiteralPath $FileToUpdate -Destination $OriginalPath
}

# Clean up temp files.
if(Test-Path -LiteralPath $TempDir -PathType Container){
    Remove-Item -LiteralPath $TempDir -Force -Recurse
}