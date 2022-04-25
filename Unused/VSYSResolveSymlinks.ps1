param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$Folder
)


# $Result = Invoke-VBMessageBox -Message "Are you sure you want to flatten all symlinks?" -Title "Are you sure?" -Icon Question -BoxType YesNoCancel -DefaultButton 3
# if($Result -ne 'Yes'){
#     exit
# }

# $Symlinks = Get-ChildItem -LiteralPath $Folder | Where-Object LinkType -eq 'SymbolicLink' 
# foreach ($Link in $Symlinks) {
#     Copy-Item $Link.LinkTarget $Link.Directory -Force
#     Remove-Item $Link.FullName
# }


# wsl --cd $Folder -e sh -c 'for f in $(find -xdev -type l); do cp --remove-destination $(readlink $f) $f; done'