[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')


Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

$SetXMPGroupForm = New-Object -TypeName System.Windows.Forms.Form


[System.Windows.Forms.DataGridViewTextBoxColumn]$Num               = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$PresetFile        = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$XMPName           = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$XMPGroup          = $null
[System.Windows.Forms.Panel]                    $PANELTopHeader    = $null
[System.Windows.Forms.PictureBox]               $IMGAdobeLogo      = $null
[System.Windows.Forms.PictureBox]               $IMGMainHeader     = $null
[System.Windows.Forms.DataGridView]             $DGRIDPresetData   = $null
[System.Windows.Forms.Label]                    $LBLEnterGroupName = $null
[System.Windows.Forms.TextBox]                  $TBOXNewGroup      = $null
[System.Windows.Forms.Button]                   $BTNRename         = $null
[System.Windows.Forms.Button]                   $BTNCancel         = $null
[System.Windows.Forms.PictureBox]               $IMGVisusys        = $null
[System.Windows.Forms.LinkLabel]                $LINKGithub        = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'VSYSXMPSetNewGroupResources.ps1')
[System.Windows.Forms.DataGridViewCellStyle]$ColumnHeaderStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$DefaultStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$NumColumnHeaderStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
$PANELTopHeader    = (New-Object -TypeName System.Windows.Forms.Panel)
$IMGMainHeader     = (New-Object -TypeName System.Windows.Forms.PictureBox)
$IMGAdobeLogo      = (New-Object -TypeName System.Windows.Forms.PictureBox)
$DGRIDPresetData   = (New-Object -TypeName System.Windows.Forms.DataGridView)
$LBLEnterGroupName = (New-Object -TypeName System.Windows.Forms.Label)
$TBOXNewGroup      = (New-Object -TypeName System.Windows.Forms.TextBox)
$BTNRename         = (New-Object -TypeName System.Windows.Forms.Button)
$BTNCancel         = (New-Object -TypeName System.Windows.Forms.Button)
$IMGVisusys        = (New-Object -TypeName System.Windows.Forms.PictureBox)
$LINKGithub        = (New-Object -TypeName System.Windows.Forms.LinkLabel)
$Num               = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PresetFile        = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$XMPName           = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$XMPGroup          = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PANELTopHeader.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).BeginInit()
([System.ComponentModel.ISupportInitialize]$DGRIDPresetData).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).BeginInit()
$SetXMPGroupForm.SuspendLayout()
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
$PANELTopHeader.TabIndex = [System.Int32]0
#
#IMGMainHeader
#
$IMGMainHeader.Image = ([System.Drawing.Image]$resources.'IMGMainHeader.Image')
$IMGMainHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]34))
$IMGMainHeader.Name = [System.String]'IMGMainHeader'
$IMGMainHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]276,[System.Int32]28))
$IMGMainHeader.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGMainHeader.TabIndex = [System.Int32]0
$IMGMainHeader.TabStop = $false
#
#IMGAdobeLogo
#
$IMGAdobeLogo.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Right)
$IMGAdobeLogo.Image = ([System.Drawing.Image]$resources.'IMGAdobeLogo.Image')
$IMGAdobeLogo.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]714,[System.Int32]23))
$IMGAdobeLogo.Name = [System.String]'IMGAdobeLogo'
$IMGAdobeLogo.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]51,[System.Int32]51))
$IMGAdobeLogo.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGAdobeLogo.TabIndex = [System.Int32]1
$IMGAdobeLogo.TabStop = $false
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


$ColumnHeaderStyle.Alignment          = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$ColumnHeaderStyle.BackColor          = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]243)),([System.Int32]([System.Byte][System.Byte]243)),([System.Int32]([System.Byte][System.Byte]243)))
$ColumnHeaderStyle.Font               = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$ColumnHeaderStyle.ForeColor          = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)))
$ColumnHeaderStyle.SelectionBackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]233)),([System.Int32]([System.Byte][System.Byte]233)),([System.Int32]([System.Byte][System.Byte]233)))
$ColumnHeaderStyle.SelectionForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)))
$ColumnHeaderStyle.WrapMode           = [System.Windows.Forms.DataGridViewTriState]::True


$DGRIDPresetData.ColumnHeadersDefaultCellStyle = $ColumnHeaderStyle
$DGRIDPresetData.ColumnHeadersHeight           = [System.Int32]38
$DGRIDPresetData.ColumnHeadersHeightSizeMode   = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::DisableResizing
$DGRIDPresetData.Columns.AddRange($Num,$PresetFile,$XMPName,$XMPGroup)

$DefaultStyle.Alignment                    = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$DefaultStyle.BackColor                    = [System.Drawing.Color]::White
$DefaultStyle.Font                         = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$DefaultStyle.ForeColor                    = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]120)),([System.Int32]([System.Byte][System.Byte]120)),([System.Int32]([System.Byte][System.Byte]120)))
$DefaultStyle.Padding                      = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$DefaultStyle.SelectionBackColor           = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)))
$DefaultStyle.SelectionForeColor           = [System.Drawing.Color]::Black
$DefaultStyle.WrapMode                     = [System.Windows.Forms.DataGridViewTriState]::False

$DGRIDPresetData.DefaultCellStyle          = $DefaultStyle
$DGRIDPresetData.EnableHeadersVisualStyles = $false
$DGRIDPresetData.Location                  = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]25,[System.Int32]120))
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
$DGRIDPresetData.Size                      = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]740,[System.Int32]352))
$DGRIDPresetData.TabIndex                  = [System.Int32]1
$DGRIDPresetData.GridColor                 = [System.Drawing.Color]::FromArgb(230, 230, 230)
$DGRIDPresetData.Margin                    = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]20))

#
#LBLEnterGroupName
#
$LBLEnterGroupName.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left)
$LBLEnterGroupName.AutoSize = $true
$LBLEnterGroupName.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LBLEnterGroupName.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLEnterGroupName.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]486))
$LBLEnterGroupName.Name = [System.String]'LBLEnterGroupName'
$LBLEnterGroupName.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]188,[System.Int32]21))
$LBLEnterGroupName.TabIndex = [System.Int32]2
$LBLEnterGroupName.Text = [System.String]'Enter a New Group Name'
#
#TBOXNewGroup
#
$TBOXNewGroup.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$TBOXNewGroup.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$TBOXNewGroup.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]25,[System.Int32]520))
$TBOXNewGroup.Name = [System.String]'TBOXNewGroup'
$TBOXNewGroup.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]740,[System.Int32]33))
$TBOXNewGroup.TabIndex = [System.Int32]3
#
#BTNRename
#
$BTNRename.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNRename.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNRename.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]620,[System.Int32]580))
$BTNRename.Name = [System.String]'BTNRename'
$BTNRename.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]145,[System.Int32]44))
$BTNRename.TabIndex = [System.Int32]4
$BTNRename.Text = [System.String]'Rename All'
$BTNRename.UseVisualStyleBackColor = $true
#
#BTNCancel
#
$BTNCancel.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNCancel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCancel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]512,[System.Int32]580))
$BTNCancel.Name = [System.String]'BTNCancel'
$BTNCancel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]94,[System.Int32]44))
$BTNCancel.TabIndex = [System.Int32]5
$BTNCancel.Text = [System.String]'Cancel'
$BTNCancel.UseVisualStyleBackColor = $true
#
#IMGVisusys
#
$IMGVisusys.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left)
$IMGVisusys.Image = ([System.Drawing.Image]$resources.'IMGVisusys.Image')
$IMGVisusys.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]584))
$IMGVisusys.Name = [System.String]'IMGVisusys'
$IMGVisusys.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]102,[System.Int32]31))
$IMGVisusys.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGVisusys.TabIndex = [System.Int32]6
$IMGVisusys.TabStop = $false
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

$LINKGithub.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]588))
$LINKGithub.Name = [System.String]'LINKGithub'
$LINKGithub.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]144,[System.Int32]21))
$LINKGithub.TabIndex = [System.Int32]7
$LINKGithub.TabStop = $true
$LINKGithub.Text = [System.String]'github.com/visusys'
#
#Num
#
$Num.AutoSizeMode = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::None
$Num.FillWeight = [System.Single]1.3
$Num.HeaderText = [System.String]'#'
$Num.MinimumWidth = [System.Int32]46
$Num.Name = [System.String]'Num'
$Num.ReadOnly = $true
$Num.Width = [System.Int32]46
$NumColumnHeaderStyle.Alignment = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleCenter
$Num.DefaultCellStyle = $NumColumnHeaderStyle

#
#PresetFile
#
$PresetFile.FillWeight = [System.Single]6.454946
$PresetFile.HeaderText = [System.String]'Preset File'
$PresetFile.Name = [System.String]'PresetFile'
$PresetFile.ReadOnly = $true
#
#XMPName
#
$XMPName.FillWeight = [System.Single]6.454946
$XMPName.HeaderText = [System.String]'XMP Preset Name'
$XMPName.Name = [System.String]'XMPName'
$XMPName.ReadOnly = $true
#
#XMPGroup
#
$XMPGroup.FillWeight = [System.Single]6.454946
$XMPGroup.HeaderText = [System.String]'Current XMP Group'
$XMPGroup.Name = [System.String]'XMPGroup'
$XMPGroup.ReadOnly = $true
#
#SetXMPGroupForm
#
$SetXMPGroupForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]788,[System.Int32]651))
$SetXMPGroupForm.Controls.Add($LINKGithub)
$SetXMPGroupForm.Controls.Add($IMGVisusys)
$SetXMPGroupForm.Controls.Add($BTNCancel)
$SetXMPGroupForm.Controls.Add($BTNRename)
$SetXMPGroupForm.Controls.Add($TBOXNewGroup)
$SetXMPGroupForm.Controls.Add($LBLEnterGroupName)
$SetXMPGroupForm.Controls.Add($DGRIDPresetData)
$SetXMPGroupForm.Controls.Add($PANELTopHeader)
$SetXMPGroupForm.MaximizeBox = $False
$SetXMPGroupForm.MinimizeBox = $False
$SetXMPGroupForm.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1100,[System.Int32]800))
$SetXMPGroupForm.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]600,[System.Int32]500))
$SetXMPGroupForm.Name = [System.String]'SetXMPGroupForm'
$SetXMPGroupForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$PANELTopHeader.ResumeLayout($false)
$PANELTopHeader.PerformLayout()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).EndInit()
([System.ComponentModel.ISupportInitialize]$DGRIDPresetData).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).EndInit()
$SetXMPGroupForm.ResumeLayout($false)
$SetXMPGroupForm.PerformLayout()
Add-Member -InputObject $SetXMPGroupForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name Num -Value $Num -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name PresetFile -Value $PresetFile -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name XMPName -Value $XMPName -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name XMPGroup -Value $XMPGroup -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name PANELTopHeader -Value $PANELTopHeader -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name IMGAdobeLogo -Value $IMGAdobeLogo -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name IMGMainHeader -Value $IMGMainHeader -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name DGRIDPresetData -Value $DGRIDPresetData -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name LBLEnterGroupName -Value $LBLEnterGroupName -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name TBOXNewGroup -Value $TBOXNewGroup -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name BTNRename -Value $BTNRename -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name BTNCancel -Value $BTNCancel -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name IMGVisusys -Value $IMGVisusys -MemberType NoteProperty
Add-Member -InputObject $SetXMPGroupForm -Name LINKGithub -Value $LINKGithub -MemberType NoteProperty
}
. InitializeComponent
