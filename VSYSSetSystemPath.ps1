Param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $Path,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Remove
)

if(!(Test-IsAdmin)){
    Request-AdminRights -HiddenWindow
    Exit
}

if($Remove){
    Set-SystemPath $Path -Remove
}else{
    Set-SystemPath $Path
}

