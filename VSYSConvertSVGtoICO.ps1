param (
    [Parameter(Mandatory,Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $FileList
)

$Files = Get-Content $FileList

Convert-SVGtoICO -InputSVGs $Files

Remove-Item $FileList -Force
