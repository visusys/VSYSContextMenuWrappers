[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')

$FilenameToXMPPresetNameForm = New-Object -TypeName System.Windows.Forms.Form

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

[System.Windows.Forms.Panel]                    $PANELTopHeader    = $null
[System.Windows.Forms.PictureBox]               $IMGAdobeLogo      = $null
[System.Windows.Forms.PictureBox]               $IMGMainHeader     = $null
[System.Windows.Forms.DataGridView]             $DGRIDPresetData   = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$Num               = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$PresetFilename    = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$CurrentPresetName = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$NewPresetName     = $null
[System.Windows.Forms.LinkLabel]                $LINKGithub        = $null
[System.Windows.Forms.PictureBox]               $IMGVisusys        = $null
[System.Windows.Forms.Button]                   $BTNCancel         = $null
[System.Windows.Forms.Button]                   $BTNRename         = $null
function InitializeComponent {

$resources = . (Join-Path $PSScriptRoot 'VSYSXMPPresetToFileNameResources.ps1')

[System.Windows.Forms.DataGridViewCellStyle]$ColumnHeadersStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$DefaultCellStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$dataGridViewCellStyle5 = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)


$PANELTopHeader    = (New-Object -TypeName System.Windows.Forms.Panel)
$IMGAdobeLogo      = (New-Object -TypeName System.Windows.Forms.PictureBox)
$IMGMainHeader     = (New-Object -TypeName System.Windows.Forms.PictureBox)
$DGRIDPresetData   = (New-Object -TypeName System.Windows.Forms.DataGridView)
$Num               = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PresetFilename    = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$CurrentPresetName = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$NewPresetName     = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$LINKGithub        = (New-Object -TypeName System.Windows.Forms.LinkLabel)
$IMGVisusys        = (New-Object -TypeName System.Windows.Forms.PictureBox)
$BTNCancel         = (New-Object -TypeName System.Windows.Forms.Button)
$BTNRename         = (New-Object -TypeName System.Windows.Forms.Button)


$PANELTopHeader.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).BeginInit()
([System.ComponentModel.ISupportInitialize]$DGRIDPresetData).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).BeginInit()
$FilenameToXMPPresetNameForm.SuspendLayout()
#
#PANELTopHeader
#
$PANELTopHeader.BackColor = [System.Drawing.Color]::Black
$PANELTopHeader.Controls.Add($IMGAdobeLogo)
$PANELTopHeader.Controls.Add($IMGMainHeader)
$PANELTopHeader.Dock     = [System.Windows.Forms.DockStyle]::Top
$PANELTopHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$PANELTopHeader.Name     = [System.String]'PANELTopHeader'
$PANELTopHeader.Size     = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]788,[System.Int32]96))
$PANELTopHeader.TabIndex = [System.Int32]1
#
#IMGAdobeLogo
#
$IMGAdobeLogo.Anchor   = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Right)
$IMGAdobeLogo.Image    = ([System.Drawing.Image]$resources.'IMGAdobeLogo.Image')
$IMGAdobeLogo.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]714,[System.Int32]23))
$IMGAdobeLogo.Name     = [System.String]'IMGAdobeLogo'
$IMGAdobeLogo.Size     = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]51,[System.Int32]51))
$IMGAdobeLogo.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGAdobeLogo.TabIndex = [System.Int32]1
$IMGAdobeLogo.TabStop  = $false
#
#IMGMainHeader
#
$IMGMainHeader.Image    = ([System.Drawing.Image]$resources.'IMGMainHeader.Image')
$IMGMainHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]34))
$IMGMainHeader.Name     = [System.String]'IMGMainHeader'
$IMGMainHeader.Size     = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]406,[System.Int32]23))
$IMGMainHeader.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGMainHeader.TabIndex = [System.Int32]0
$IMGMainHeader.TabStop  = $false
#
#DGRIDPresetData
#
$DGRIDPresetData.AllowUserToAddRows    = $false
$DGRIDPresetData.AllowUserToDeleteRows = $false
$DGRIDPresetData.AllowUserToResizeRows = $false
$DGRIDPresetData.Anchor                = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$DGRIDPresetData.AutoSizeColumnsMode   = [System.Windows.Forms.DataGridViewAutoSizeColumnsMode]::Fill
$DGRIDPresetData.BackgroundColor       = [System.Drawing.Color]::White
$DGRIDPresetData.BorderStyle           = [System.Windows.Forms.BorderStyle]::Fixed3D


$ColumnHeadersStyle.Alignment          = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$ColumnHeadersStyle.BackColor          = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]243)),([System.Int32]([System.Byte][System.Byte]243)),([System.Int32]([System.Byte][System.Byte]243)))
$ColumnHeadersStyle.Font               = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$ColumnHeadersStyle.ForeColor          = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)))
$ColumnHeadersStyle.SelectionBackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]233)),([System.Int32]([System.Byte][System.Byte]233)),([System.Int32]([System.Byte][System.Byte]233)))
$ColumnHeadersStyle.SelectionForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)))
$ColumnHeadersStyle.WrapMode           = [System.Windows.Forms.DataGridViewTriState]::True

$DGRIDPresetData.ColumnHeadersDefaultCellStyle = $ColumnHeadersStyle
$DGRIDPresetData.ColumnHeadersHeight           = [System.Int32]38
$DGRIDPresetData.ColumnHeadersHeightSizeMode   = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::DisableResizing
$DGRIDPresetData.Columns.AddRange($Num,$PresetFilename,$CurrentPresetName,$NewPresetName)

$DefaultCellStyle.Alignment                = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$DefaultCellStyle.BackColor                = [System.Drawing.Color]::White
$DefaultCellStyle.Font                     = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$DefaultCellStyle.ForeColor                = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]120)),([System.Int32]([System.Byte][System.Byte]120)),([System.Int32]([System.Byte][System.Byte]120)))
$DefaultCellStyle.Padding                  = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$DefaultCellStyle.SelectionBackColor       = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)))
$DefaultCellStyle.SelectionForeColor       = [System.Drawing.Color]::Black
$DefaultCellStyle.WrapMode                 = [System.Windows.Forms.DataGridViewTriState]::False

$DGRIDPresetData.DefaultCellStyle          = $DefaultCellStyle
$DGRIDPresetData.EnableHeadersVisualStyles = $false
$DGRIDPresetData.Location                  = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]24,[System.Int32]120))
$DGRIDPresetData.Name                      = [System.String]'DGRIDPresetData'
$DGRIDPresetData.ReadOnly                  = $true
$DGRIDPresetData.RowHeadersVisible         = $false
$DGRIDPresetData.RowTemplate.Height        = 32
$DGRIDPresetData.RowTemplate.ReadOnly      = $true
$DGRIDPresetData.RowTemplate.Resizable     = [System.Windows.Forms.DataGridViewTriState]::False
$DGRIDPresetData.ScrollBars                = [System.Windows.Forms.ScrollBars]::Vertical
$DGRIDPresetData.SelectionMode             = [System.Windows.Forms.DataGridViewSelectionMode]::FullRowSelect
$DGRIDPresetData.ShowCellErrors            = $false
$DGRIDPresetData.ShowCellToolTips          = $false
$DGRIDPresetData.ShowEditingIcon           = $false
$DGRIDPresetData.ShowRowErrors             = $false
$DGRIDPresetData.Size                      = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]740,[System.Int32]359))
$DGRIDPresetData.TabIndex                  = [System.Int32]2
#
#Num
#
$Num.AutoSizeMode                 = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::None
$dataGridViewCellStyle5.Alignment = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleCenter
$Num.DefaultCellStyle             = $dataGridViewCellStyle5
$Num.FillWeight                   = [System.Single]1.3
$Num.HeaderText                   = [System.String]'#'
$Num.MinimumWidth                 = [System.Int32]46
$Num.Name                         = [System.String]'Num'
$Num.ReadOnly                     = $true
$Num.Width                        = [System.Int32]46
#
#PresetFilename
#
$PresetFilename.FillWeight = [System.Single]6.454946
$PresetFilename.HeaderText = [System.String]'Preset Filename'
$PresetFilename.Name       = [System.String]'PresetFilename'
$PresetFilename.ReadOnly   = $true
#
#CurrentPresetName
#
$CurrentPresetName.FillWeight = [System.Single]6.454946
$CurrentPresetName.HeaderText = [System.String]'Current Preset Name'
$CurrentPresetName.Name       = [System.String]'CurrentPresetName'
$CurrentPresetName.ReadOnly   = $true
#
#NewPresetName
#
$NewPresetName.FillWeight = [System.Single]6.454946
$NewPresetName.HeaderText = [System.String]'New Preset Name'
$NewPresetName.Name       = [System.String]'NewPresetName'
$NewPresetName.ReadOnly   = $true
#
#LINKGithub
#
$LINKGithub.ActiveLinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)))

$LINKGithub.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left)
$LINKGithub.AutoSize = $true
$LINKGithub.DisabledLinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)))

$LINKGithub.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LINKGithub.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)))

$LINKGithub.LinkBehavior = [System.Windows.Forms.LinkBehavior]::NeverUnderline
$LINKGithub.LinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)),([System.Int32]([System.Byte][System.Byte]110)))

$LINKGithub.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]509))
$LINKGithub.Name = [System.String]'LINKGithub'
$LINKGithub.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]144,[System.Int32]21))
$LINKGithub.TabIndex = [System.Int32]11
$LINKGithub.TabStop = $true
$LINKGithub.Text = [System.String]'github.com/visusys'
#
#IMGVisusys
#
$IMGVisusys.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left)
$IMGVisusys.Image = ([System.Drawing.Image]$resources.'IMGVisusys.Image')
$IMGVisusys.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]26,[System.Int32]505))
$IMGVisusys.Name = [System.String]'IMGVisusys'
$IMGVisusys.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]102,[System.Int32]31))
$IMGVisusys.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGVisusys.TabIndex = [System.Int32]10
$IMGVisusys.TabStop = $false
#
#BTNCancel
#
$BTNCancel.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNCancel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCancel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]512,[System.Int32]501))
$BTNCancel.Name = [System.String]'BTNCancel'
$BTNCancel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]94,[System.Int32]44))
$BTNCancel.TabIndex = [System.Int32]9
$BTNCancel.Text = [System.String]'Cancel'
$BTNCancel.UseVisualStyleBackColor = $true
#
#BTNRename
#
$BTNRename.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNRename.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNRename.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]620,[System.Int32]501))
$BTNRename.Name = [System.String]'BTNRename'
$BTNRename.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]145,[System.Int32]44))
$BTNRename.TabIndex = [System.Int32]8
$BTNRename.Text = [System.String]'Rename All'
$BTNRename.UseVisualStyleBackColor = $true
#
#FilenameToXMPPresetNameForm
#
$FilenameToXMPPresetNameForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]788,[System.Int32]569))
$FilenameToXMPPresetNameForm.Controls.Add($LINKGithub)
$FilenameToXMPPresetNameForm.Controls.Add($IMGVisusys)
$FilenameToXMPPresetNameForm.Controls.Add($BTNCancel)
$FilenameToXMPPresetNameForm.Controls.Add($BTNRename)
$FilenameToXMPPresetNameForm.Controls.Add($DGRIDPresetData)
$FilenameToXMPPresetNameForm.Controls.Add($PANELTopHeader)
$FilenameToXMPPresetNameForm.MaximizeBox = $False
$FilenameToXMPPresetNameForm.MinimizeBox = $False
$FilenameToXMPPresetNameForm.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1100,[System.Int32]800))
$FilenameToXMPPresetNameForm.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]600,[System.Int32]500))
$FilenameToXMPPresetNameForm.Name = [System.String]'FilenameToXMPPresetNameForm'
$FilenameToXMPPresetNameForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$PANELTopHeader.ResumeLayout($false)
$PANELTopHeader.PerformLayout()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).EndInit()
([System.ComponentModel.ISupportInitialize]$DGRIDPresetData).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).EndInit()
$FilenameToXMPPresetNameForm.ResumeLayout($false)
$FilenameToXMPPresetNameForm.PerformLayout()
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name PANELTopHeader -Value $PANELTopHeader -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name IMGAdobeLogo -Value $IMGAdobeLogo -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name IMGMainHeader -Value $IMGMainHeader -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name DGRIDPresetData -Value $DGRIDPresetData -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name Num -Value $Num -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name PresetFilename -Value $PresetFilename -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name CurrentPresetName -Value $CurrentPresetName -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name NewPresetName -Value $NewPresetName -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name LINKGithub -Value $LINKGithub -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name IMGVisusys -Value $IMGVisusys -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name BTNCancel -Value $BTNCancel -MemberType NoteProperty
Add-Member -InputObject $FilenameToXMPPresetNameForm -Name BTNRename -Value $BTNRename -MemberType NoteProperty
}
. InitializeComponent
