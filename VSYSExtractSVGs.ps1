param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $File,

    [Parameter(Mandatory = $false, Position = 1)]
    [String]
    $Destination
)

if(!(Test-IsAdmin)){
    Request-AdminRights -HiddenWindow
}

if(!$Destination){
    $Destination = [System.IO.Path]::GetDirectoryName($File)
}

Get-SVGsFromFile -Source $File -Destination $Destination
