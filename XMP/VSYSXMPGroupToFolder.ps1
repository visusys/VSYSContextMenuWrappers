param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

. (Join-Path $PSScriptRoot 'VSYSXMPGroupToFolderForm.ps1')

$FilesCollection = New-Object System.Collections.ArrayList
$XMPFiles = Get-Content $FileList

function InitializeForm {
    $idx = 1
    foreach ($File in $XMPFiles) {
    
        $content = (Get-Content -LiteralPath $File -Raw)
        $xml = [xml]$content
    
        $pf = [System.IO.Path]::GetFileName($File)
        $dn = [System.IO.Path]::GetDirectoryName($File)
        $pn = [Regex]::Unescape($xml.xmpmeta.rdf.Description.Name.Alt.li.InnerText)
        $pg = [Regex]::Unescape($xml.xmpmeta.rdf.Description.Group.Alt.li.InnerText)
        
        $dfolder = $dn + "\" + $pg + "\"
        
        $obj = [PSCustomObject]@{
            Index               = $idx
            OriginalPath        = $dn + "\" + $pf
            PresetFile          = $pf
            PresetName          = $pn
            XMPGroupFolderName  = $pg
            DestinationFolder   = $dfolder
            FinalPath           = $dfolder + $pf
        }
    
        [void] $FilesCollection.Add($obj)
        [void] $DataGridPresetList.Rows.Add($idx, $pf, $pn, $pg)
        $idx++
    }

    Remove-Item $FileList -Force

}


function MovePresets {
    param (
        [Parameter(Mandatory,Position = 0)]
        [System.Collections.ArrayList]
        $Collection
    )

    $Result = Invoke-VBMessageBox -Message "Are you sure you want to move $($Collection.Count) files?" -Title "Confirmation" -Icon Question -BoxType YesNo
    if($Result -ne "Yes"){return}

    foreach ($File in $Collection) {
        if(!(Test-Path -LiteralPath $File.DestinationFolder -PathType Container)){
            New-Item $File.DestinationFolder -ItemType Directory -Force
        } 
        Move-Item -LiteralPath $File.OriginalPath $File.DestinationFolder
    }

    Invoke-VBMessageBox -Message "Moved $($Collection.Count) XMP files." -Title "Operation Complete" -Icon Information -BoxType OKOnly
    $XMPGroupToFolderForm.close()
}

InitializeForm


###########################################################
# EVENT HANDLERS

$XMPGroupToFolderForm.add_Closing({
   
})

$BTNCancel.Add_Click({
    $XMPGroupToFolderForm.close()
})

$BTNMove.Add_Click({
    MovePresets $FilesCollection
})

$LINKGithub.Add_Click({
    
    start 'http://www.github.com/visusys'

})

$XMPGroupToFolderForm.ShowDialog()