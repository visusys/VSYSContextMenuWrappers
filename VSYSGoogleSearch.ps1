param (
    [Parameter(Mandatory,Position = 0)]
    [string[]]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoExtension,

    [Parameter(Mandatory=$false)]
    [Switch]
    $ImageSearch,

    [Parameter(Mandatory=$false)]
    [String]
    $ImageSearchSize = '2mp',

    [Parameter(Mandatory=$false)]
    [String]
    $SiteOrDomain = ''
)


if (!(Test-Path -LiteralPath $FileList)) {
    throw [System.Exception] "File list doesn't exist."
}

$Files = Get-Content $FileList

if(!$Files){
    throw [System.Exception] "File list is empty."
}

if($Files.GetType().Name -eq 'String'){
    if($NoExtension){
        $Files = [System.IO.Path]::GetFileNameWithoutExtension($Files)
    }else{
        $Files = [System.IO.Path]::GetFileName($Files)
    }
} else {
    for ($i = 0; $i -lt $Files.Count; $i++) {
        if($NoExtension){
            $Files[$i] = [System.IO.Path]::GetFileNameWithoutExtension($Files[$i])
        }else{
            $Files[$i] = [System.IO.Path]::GetFileName($Files[$i])
        }
    }
}

if($ImageSearch){
    Search-GoogleIt -Query $Files -SiteOrDomain $SiteOrDomain -ImageSearch -ImageSearchSize $ImageSearchSize
}else{
    Search-GoogleIt -Query $Files -SiteOrDomain $SiteOrDomain
}

Remove-Item $FileList -Force