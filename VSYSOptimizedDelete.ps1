param (
    [Parameter(Mandatory,Position=0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_ -PathType Container)) {
            throw [System.ArgumentException] "Folder doesn't exist."
        }
        if (Test-Path -LiteralPath $_ -PathType Leaf) {
            throw [System.ArgumentException] "File passed when a folder was expected."
        }
        return $true
    })]
    [String]
    $Folder
)

$Folder = $Folder.TrimEnd([IO.Path]::DirectorySeparatorChar)

$IsUnsafe = (Test-IsWindowsPathUnsafe $Folder).IsUnsafe

if($IsUnsafe){
    Invoke-VBMessageBox "Deletion has been blocked for safety. ($Folder)" -Title "Deletion Blocked" -Icon Critical -BoxType OKOnly -DefaultButton 1
    exit
}

$Result = Invoke-VBMessageBox "Are you sure you want to permanently delete this folder and all contents? ($Folder)" -Title "Delete Confirmation" -Icon Question -BoxType YesNoCancel -DefaultButton 3
if ($Result -ne 'Yes') {
    exit
}else{
    Remove-Item $Folder -Force -Recurse
}

