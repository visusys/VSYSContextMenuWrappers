param (
    [Parameter(Mandatory, Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $FileList
)

$Folders = Get-Content $FileList
if(!$Folders){
    throw [System.Exception] "Folder list is empty."
}

$Icon = "C:\Tools\icons\folder-status\Positive 1.ico"
Set-FolderIcon $Folders -Icon $Icon

Remove-Item $FileList -Force