param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$Folder
)

Invoke-VBMessageBox "Are you sure you want to flatten all symlinks in $Folder?" -Title "Are you sure?" -Icon Question -BoxType YesNoCancel -DefaultButton 3

wsl --cd $Folder -e sh -c 'for f in $(find -xdev -type l); do cp --remove-destination $(readlink $f) $f; done'