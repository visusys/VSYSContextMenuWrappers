param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

$Fonts = Get-Content $FileList

if(!$Fonts){
    throw [System.Exception] "No selected files to convert."
}

$Fonts | ForEach-Object -Parallel {
    
    woff2_compress.exe $_
    
} -ThrottleLimit 10

Remove-Item $FileList -Force