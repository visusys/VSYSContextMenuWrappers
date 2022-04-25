param (
    [Parameter(Mandatory)]
    [String[]]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $FilenamesOnly,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoQuotes
)

$Path = Get-Content $FileList

if($FilenamesOnly){
    if($NoQuotes){
        Copy-PathToClipboard -Path $Path -FilenamesOnly -NoQuotes
    }else{
        Copy-PathToClipboard -Path $Path -FilenamesOnly
    }
}else{
    if($NoQuotes){
        Copy-PathToClipboard -Path $Path -NoQuotes
    }else{
        Copy-PathToClipboard -Path $Path
    }
}

Remove-Item $FileList