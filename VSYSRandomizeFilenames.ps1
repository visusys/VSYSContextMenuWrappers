param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    $RandomString = Get-RandomAlphanumericString -Length 20
    $FileExtension = [System.IO.Path]::GetExtension($File)
    $NewFilename = $RandomString + $FileExtension

    Rename-Item -LiteralPath $File -NewName $NewFilename -Force

}

Remove-Item $FileList -Force