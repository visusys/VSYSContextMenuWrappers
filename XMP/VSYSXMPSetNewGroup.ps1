param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

. (Join-Path $PSScriptRoot 'VSYSXMPSetNewGroupForm.ps1')

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
        Write-Host "`$pg:" $pg -ForegroundColor Green
        $dfolder = $dn + "\" + $pg + "\"
        
        $obj = [PSCustomObject]@{
            Index               = $idx
            OriginalPath        = $dn + "\" + $pf
            PresetFile          = $pf
            XMPPresetName       = $pn
            XMPGroupName        = $pg
        }
    
        [void] $FilesCollection.Add($obj)
        [void] $DGRIDPresetData.Rows.Add($idx, $pf, $pn, $pg)
        $idx++
    }

    Remove-Item $FileList -Force

}

function Change-XMPGroups {

    param (
        [Parameter(Mandatory)]
        [String]
        $GroupName
    )

    foreach ($XMPFile in $XMPFiles) {
        $content = (Get-Content -LiteralPath $XMPFile -Raw)
        $xml = [xml]$content

        $replace = [Regex]::Escape($xml.xmpmeta.rdf.Description.Group.Alt.li.InnerText)

        if($replace){
            # Save the new changes to each XMP file
            $NewName = $GroupName
            $content = $content -replace $replace, $NewName
            $content | Set-Content $XMPFile -NoNewline
        }else{
            Invoke-VBMessageBox -Message "No Group node was found in $XMPFile" -Title "Group not found" -Icon Critical -BoxType OKOnly
            continue
        }
    }

    $NumProcessed = @($XMPFiles).Length
    Invoke-VBMessageBox "Group Change Complete. $NumProcessed XMP files were updated." -Title "Operation Complete" -Icon Information -BoxType OKOnly
    $SetXMPGroupForm.close()

}

##########################################
# Group Name Validation Stack 
# Ensures input is properly sanitized

Function Validate-GroupName {

    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Name
    )

    $ValidationObject = [PSCustomObject]@{
        Valid  = $true
        Error  = ''
    }

    if($Name.Length -gt 35){
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Group name exceeds 35 characters'
        return $ValidationObject
    }

    If ($Name -match '(\r\n|\r|\n)'){
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Group name contains a carriage return or line break of some kind.'
        return $ValidationObject
    }

    If ($Name -match '\t+'){
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Group name contains a horizontal tab.'
        return $ValidationObject
    }

    If ($Name -match '\v+'){
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Group name contains a vertical tab.'
        return $ValidationObject
    }

    If ($Name -match '\e+'){
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Group name contains an escape character.'
        return $ValidationObject
    }

    If ($Name -notmatch '^[\w\s\d\\\.\$\^\{\}\[\]\(\)\*\?\+\-\|''"&<>,/#%=@:;!~_]+$'){ 
        $ValidationObject.Valid = $false
        $ValidationObject.Error = 'Failed Validation: Regex Pattern Mismatch, likely an unsupported character in the Group Name'
        return $ValidationObject
    }

    $ValidationObject.Valid = $true
    $ValidationObject.Error = ""
    return $ValidationObject
}

##########################################
# Form on close event handler

$SetXMPGroupForm.add_Closing({
    [environment]::exit(0)
})


##########################################
# Convert button click event handler

# Initialize the final group name to null
$EnteredGroupName = $null

$BTNRename.Add_Click({

    $EnteredGroupName = $TBOXNewGroup.Text

    if([string]::IsNullOrEmpty($EnteredGroupName)){
        $Results = Invoke-VBMessageBox 'Entered group name is empty.' -Title 'Validation Error' -Icon Critical -BoxType RetryCancel -DefaultButton 1
        if($Results -eq 'Retry'){
            Write-Host "`$EnteredGroupName:" $EnteredGroupName -ForegroundColor Green
            return
        }else{
            $SetXMPGroupForm.close()
        }
    }

    $EnteredGroupName = $EnteredGroupName.TrimEnd()
    $EnteredGroupName = $EnteredGroupName.TrimStart()
    $EnteredGroupName = Remove-DiacriticsFromString -String $EnteredGroupName

    [PSCustomObject]$ValidationResults = Validate-GroupName -Name $EnteredGroupName

    if($ValidationResults.Valid){
        
        $EnteredGroupName = $EnteredGroupName.replace("&",'&amp;')
        $EnteredGroupName = $EnteredGroupName.replace("<",'&lt;')
        $EnteredGroupName = $EnteredGroupName.replace(">",'&gt;')
        $EnteredGroupName = $EnteredGroupName.replace("'",'&apos;')
        $EnteredGroupName = $EnteredGroupName.replace('"','&quot;')
        
        if($EnteredGroupName -ne $null){
            Change-XMPGroups -GroupName $EnteredGroupName
        }

    } else {
        $Results = Invoke-VBMessageBox $ValidationResults.Error -Title 'Validation Error' -Icon Critical -BoxType RetryCancel -DefaultButton 1
        if($Results -eq 'Retry'){

        }else{
            #$SetXMPGroupForm.close()
        }
    }
})

$BTNCancel.Add_Click({
    $SetXMPGroupForm.close()
})


$LINKGithub.Add_Click({
    start 'http://www.github.com/visusys'
})


InitializeForm
$SetXMPGroupForm.ShowDialog()


