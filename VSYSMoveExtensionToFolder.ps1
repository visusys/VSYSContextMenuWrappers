param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

Move-ExtensionToFolder -Files $Files

Remove-Item $FileList -Force