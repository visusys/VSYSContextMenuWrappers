param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg', IgnoreCase = $true)]
    [String]
    $DestFormat
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $File  = $_
    $Filename = [System.IO.Path]::GetFileNameWithoutExtension($File)
    $FileDirectory  = [System.IO.Path]::GetDirectoryName($File)
    $NewFilename = [System.IO.Path]::ChangeExtension($File, $Using:DestFormat)

    magick.exe $File -background none $NewFilename

} -ThrottleLimit 20