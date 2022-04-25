param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg',IgnoreCase = $true)]
    [String]
    $DestFormat
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $MagickArgs = [System.Collections.ArrayList]@()
    $File       = $_

    $OrgFilePathOnly = [System.IO.Path]::GetDirectoryName($File)
    $OrgFilenameNoExtension = [System.IO.Path]::GetFileNameWithoutExtension($File)
    $OrgFilename = $OrgFilenameNoExtension + '.psd[0]'
    $OrgFile = $OrgFilePathOnly + '\' + $OrgFilename

    $NewFile = [System.IO.Path]::ChangeExtension($File, ($Using:DestFormat).ToLower())
    
    $Index = 1
    while (Test-Path -LiteralPath $NewFile -PathType Leaf) {
        $Fname = $OrgFilenameNoExtension
        $FExt  = [System.IO.Path]::GetExtension($NewFile)
        $Fdir  = [System.IO.Path]::GetDirectoryName($NewFile)

        $NewFile = $Fdir + '\' + $Fname + "($Index)" + $FExt
        $Index++
    }

    $MagickArgs.Add($OrgFile)  | Out-Null
    $MagickArgs.Add($NewFile)  | Out-Null

    magick.exe $MagickArgs

} -ThrottleLimit 20


Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox("Conversion to $($DestFormat.ToUpper()) Complete.",'OKOnly,SystemModal,Information', 'Conversion Complete')

Remove-Item $FileList -Force
