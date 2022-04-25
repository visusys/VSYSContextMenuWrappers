param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

Convert-PNGtoICO -InputPNGs $Files

Remove-Item $FileList -Force
