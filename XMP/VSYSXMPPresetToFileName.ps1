param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

. (Join-Path $PSScriptRoot 'VSYSXMPPresetToFileNameForm.ps1')

$FilesCollection = New-Object System.Collections.ArrayList
$XMPFiles = Get-Content $FileList

function InitializeForm {
    $idx = 1
    foreach ($File in $XMPFiles) {
    
        $content = (Get-Content -LiteralPath $File -Raw)
        $xml = [xml]$content
    
        $dir           = [System.IO.Path]::GetDirectoryName($File)
        $filename      = [System.IO.Path]::GetFileName($File)
        $filenameNoExt = [System.IO.Path]::GetFileNameWithoutExtension($File)
        $presetname    = [Regex]::Unescape($xml.xmpmeta.rdf.Description.Name.Alt.li.InnerText)
        
        $obj = [PSCustomObject]@{
            Index               = $idx
            PresetFileName      = $filename
            CurrentPresetName   = $presetname
            NewPresetName       = $filenameNoExt
            OriginalPath        = $dir + "\" + $filename
        }
    
        [void] $FilesCollection.Add($obj)
        [void] $DGRIDPresetData.Rows.Add($idx, $filename, $presetname, $filenameNoExt)
        $idx++
    }

    Remove-Item $FileList -Force

}

function Rename-AllPresets {

    foreach ($XMPFile in $XMPFiles) {
        $content = (Get-Content -LiteralPath $XMPFile -Raw)
        $xml = [xml]$content

        $replace = [Regex]::Escape($xml.xmpmeta.rdf.Description.Name.Alt.li.InnerText)

        if($replace){
            # Save the new changes to each XMP file
            $NewName = [System.IO.Path]::GetFileNameWithoutExtension($XMPFile)
            $NewName = $NewName.replace("&",'&amp;')
            $NewName = $NewName.replace("<",'&lt;')
            $NewName = $NewName.replace(">",'&gt;')
            $NewName = $NewName.replace("'",'&apos;')
            $NewName = $NewName.replace('"','&quot;')
            $content = $content -replace $replace, $NewName
            $content | Set-Content $XMPFile -NoNewline
        }else{
            Invoke-VBMessageBox -Message "No Group node was found in $XMPFile" -Title "Group not found" -Icon Critical -BoxType OKOnly
            continue
        }
    }

    $NumProcessed = @($XMPFiles).Length
    Invoke-VBMessageBox "Preset Rename Complete. $NumProcessed XMP files were updated." -Title "Operation Complete" -Icon Information -BoxType OKOnly
    $FilenameToXMPPresetNameForm.close()
}

$FilenameToXMPPresetNameForm.add_Closing({
    [environment]::exit(0)
})

$BTNCancel.Add_Click({
    $FilenameToXMPPresetNameForm.close()
})

$LINKGithub.Add_Click({
    start 'http://www.github.com/visusys'
})

$BTNRename.Add_Click({
    Rename-AllPresets
})

InitializeForm

$FilenameToXMPPresetNameForm.ShowDialog()


