[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')


$XMPGroupToFolderForm = New-Object -TypeName System.Windows.Forms.Form

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()


[System.Windows.Forms.DataGridView]               $DataGridPresetList = $null
[System.Windows.Forms.Panel]                      $PANELHeader        = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]  $Num                = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]  $PresetFile         = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]  $PresetName         = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]  $XMPGroupFolderName = $null
[System.Windows.Forms.Panel]                      $PANELBottom        = $null
[System.Windows.Forms.Button]                     $BTNMove            = $null
[System.Windows.Forms.Button]                     $BTNCancel          = $null
[System.Windows.Forms.PictureBox]                 $IMGAdobeLogo       = $null
[System.Windows.Forms.LinkLabel]                  $LINKGithub         = $null
[System.Windows.Forms.PictureBox]                 $IMGVisusys         = $null
[System.Windows.Forms.PictureBox]                 $IMGMainHeader      = $null
function InitializeComponent
{
[System.Windows.Forms.DataGridViewCellStyle]$ColumnHeaderStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$DefaultGridStyle = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$dataGridViewCellStyle3 = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
[System.Windows.Forms.DataGridViewCellStyle]$dataGridViewCellStyle4 = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)

$resources = . (Join-Path $PSScriptRoot 'VSYSXMPGroupToFolderResources.ps1')

$DataGridPresetList = (New-Object -TypeName System.Windows.Forms.DataGridView)
$Num                = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PresetFile         = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PresetName         = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$XMPGroupFolderName = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$PANELHeader        = (New-Object -TypeName System.Windows.Forms.Panel)
$IMGMainHeader      = (New-Object -TypeName System.Windows.Forms.PictureBox)
$IMGAdobeLogo       = (New-Object -TypeName System.Windows.Forms.PictureBox)
$PANELBottom        = (New-Object -TypeName System.Windows.Forms.Panel)
$LINKGithub         = (New-Object -TypeName System.Windows.Forms.LinkLabel)
$BTNCancel          = (New-Object -TypeName System.Windows.Forms.Button)
$IMGVisusys         = (New-Object -TypeName System.Windows.Forms.PictureBox)
$BTNMove            = (New-Object -TypeName System.Windows.Forms.Button)


([System.ComponentModel.ISupportInitialize]$DataGridPresetList).BeginInit()
$PANELHeader.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).BeginInit()
$PANELBottom.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).BeginInit()
$XMPGroupToFolderForm.SuspendLayout()


#
#DataGridPresetList
#
$DataGridPresetList.AllowUserToAddRows          = $false
$DataGridPresetList.AllowUserToDeleteRows       = $false
$DataGridPresetList.AllowUserToResizeColumns    = $true
$DataGridPresetList.AllowUserToResizeRows       = $false
$DataGridPresetList.Anchor                      = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$DataGridPresetList.AutoSizeColumnsMode         = [System.Windows.Forms.DataGridViewAutoSizeColumnsMode]::Fill
$DataGridPresetList.BackgroundColor             = [System.Drawing.Color]::White
$DataGridPresetList.BorderStyle                 = [System.Windows.Forms.BorderStyle]::Fixed3D


$ColumnHeaderStyle.Alignment                    = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$ColumnHeaderStyle.BackColor                    = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]235)),([System.Int32]([System.Byte][System.Byte]235)),([System.Int32]([System.Byte][System.Byte]235)))
$ColumnHeaderStyle.Font                         = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$ColumnHeaderStyle.ForeColor                    = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)),([System.Int32]([System.Byte][System.Byte]70)))
$ColumnHeaderStyle.SelectionBackColor           = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]223)),([System.Int32]([System.Byte][System.Byte]223)),([System.Int32]([System.Byte][System.Byte]223)))
$ColumnHeaderStyle.SelectionForeColor           = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)),([System.Int32]([System.Byte][System.Byte]90)))
$ColumnHeaderStyle.WrapMode                     = [System.Windows.Forms.DataGridViewTriState]::True

$DataGridPresetList.ColumnHeadersDefaultCellStyle = $ColumnHeaderStyle
$DataGridPresetList.ColumnHeadersHeight           = [System.Int32]38
$DataGridPresetList.Columns.AddRange($Num,$PresetFile,$PresetName,$XMPGroupFolderName)

$DefaultGridStyle.Alignment                     = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$DefaultGridStyle.BackColor                     = [System.Drawing.Color]::White
$DefaultGridStyle.Font                          = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10.5,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$DefaultGridStyle.ForeColor                     = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]65)),([System.Int32]([System.Byte][System.Byte]65)),([System.Int32]([System.Byte][System.Byte]65)))
$DefaultGridStyle.Padding                       = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$DefaultGridStyle.SelectionBackColor            = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)),([System.Int32]([System.Byte][System.Byte]248)))
$DefaultGridStyle.SelectionForeColor            = [System.Drawing.Color]::Black
$DefaultGridStyle.WrapMode                      = [System.Windows.Forms.DataGridViewTriState]::False


$DataGridPresetList.DefaultCellStyle            = $DefaultGridStyle
$DataGridPresetList.EnableHeadersVisualStyles   = $false
$DataGridPresetList.GridColor                   = [System.Drawing.Color]::FromArgb(230, 230, 230)
$DataGridPresetList.Location                    = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]20,[System.Int32]122))
$DataGridPresetList.Margin                      = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]20))
$DataGridPresetList.MultiSelect                 = $false
$DataGridPresetList.Name                        = [System.String]'DataGridPresetList'
$DataGridPresetList.ReadOnly                    = $true
$DataGridPresetList.RowHeadersBorderStyle       = [System.Windows.Forms.DataGridViewHeaderBorderStyle]::Single


$dataGridViewCellStyle3.Alignment               = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleLeft
$dataGridViewCellStyle3.BackColor               = [System.Drawing.SystemColors]::Control
$dataGridViewCellStyle3.Font                    = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$dataGridViewCellStyle3.ForeColor               = [System.Drawing.SystemColors]::WindowText
$dataGridViewCellStyle3.Padding                 = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$dataGridViewCellStyle3.SelectionBackColor      = [System.Drawing.Color]::WhiteSmoke
$dataGridViewCellStyle3.SelectionForeColor      = [System.Drawing.SystemColors]::HighlightText
$dataGridViewCellStyle3.WrapMode                = [System.Windows.Forms.DataGridViewTriState]::True



$dataGridViewCellStyle4.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))


$DataGridPresetList.RowHeadersDefaultCellStyle = $dataGridViewCellStyle3
$DataGridPresetList.RowHeadersVisible          = $false
$DataGridPresetList.RowHeadersWidthSizeMode    = [System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode]::AutoSizeToAllHeaders
$DataGridPresetList.RowsDefaultCellStyle       = $dataGridViewCellStyle4
$DataGridPresetList.RowTemplate.Resizable      = [System.Windows.Forms.DataGridViewTriState]::False
$DataGridPresetList.ScrollBars                 = [System.Windows.Forms.ScrollBars]::Vertical
$DataGridPresetList.SelectionMode              = [System.Windows.Forms.DataGridViewSelectionMode]::FullRowSelect
$DataGridPresetList.Size                       = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]735,[System.Int32]368))
$DataGridPresetList.TabIndex                   = [System.Int32]7
$DataGridPresetList.RowTemplate.Height         = 30;
#
#Num
#
$Num.FillWeight         = [System.Single]1.2
$Num.HeaderText         = [System.String]'#'
$Num.Name               = [System.String]'Num'
$Num.ReadOnly           = $true
#
#PresetFile
#
$PresetFile.FillWeight  = [System.Single]6
$PresetFile.HeaderText  = [System.String]'Preset File'
$PresetFile.Name        = [System.String]'PresetFile'
$PresetFile.ReadOnly    = $true
#
#PresetName
#
$PresetName.FillWeight  = [System.Single]6
$PresetName.HeaderText  = [System.String]'Internal Preset Name'
$PresetName.Name        = [System.String]'PresetName'
$PresetName.ReadOnly    = $true
#
#XMPGroupFolderName
#
$XMPGroupFolderName.FillWeight  = [System.Single]6
$XMPGroupFolderName.HeaderText  = [System.String]'XMP Group and Final Folder'
$XMPGroupFolderName.Name        = [System.String]'XMPGroupFolderName'
$XMPGroupFolderName.ReadOnly    = $true
#
#PANELHeader
#
$PANELHeader.Controls.Add($IMGMainHeader)
$PANELHeader.Controls.Add($IMGAdobeLogo)

$PANELHeader.BackColor              = [System.Drawing.Color]::Black
$PANELHeader.BackgroundImageLayout  = [System.Windows.Forms.ImageLayout]::Center
$PANELHeader.Dock                   = [System.Windows.Forms.DockStyle]::Top
$PANELHeader.Location               = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$PANELHeader.Name                   = [System.String]'PANELHeader'
$PANELHeader.Padding                = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]20))
$PANELHeader.Size                   = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]781,[System.Int32]99))
$PANELHeader.TabIndex               = [System.Int32]8
#
#IMGMainHeader
#
$IMGMainHeader.Anchor               = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$IMGMainHeader.Image                = ([System.Drawing.Image]$resources.'IMGMainHeader.Image')
$IMGMainHeader.Location             = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]20,[System.Int32]35))
$IMGMainHeader.MaximumSize          = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]532,[System.Int32]27))
$IMGMainHeader.MinimumSize          = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]470,[System.Int32]15))
$IMGMainHeader.Name                 = [System.String]'IMGMainHeader'
$IMGMainHeader.Size                 = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]532,[System.Int32]27))
$IMGMainHeader.SizeMode             = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$IMGMainHeader.TabIndex             = [System.Int32]4
$IMGMainHeader.TabStop              = $false
#
#IMGAdobeLogo
#
$IMGAdobeLogo.Dock                  = [System.Windows.Forms.DockStyle]::Right
$IMGAdobeLogo.Image                 = ([System.Drawing.Image]$resources.'IMGAdobeLogo.Image')
$IMGAdobeLogo.Location              = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]701,[System.Int32]20))
$IMGAdobeLogo.Name                  = [System.String]'IMGAdobeLogo'
$IMGAdobeLogo.Size                  = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]60,[System.Int32]59))
$IMGAdobeLogo.SizeMode              = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$IMGAdobeLogo.TabIndex              = [System.Int32]3
$IMGAdobeLogo.TabStop               = $false
#
#PANELBottom
#
$PANELBottom.Controls.Add($LINKGithub)
$PANELBottom.Controls.Add($BTNCancel)
$PANELBottom.Controls.Add($IMGVisusys)
$PANELBottom.Controls.Add($BTNMove)

$PANELBottom.Dock                   = [System.Windows.Forms.DockStyle]::Bottom
$PANELBottom.Location               = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]494))
$PANELBottom.Name                   = [System.String]'PANELBottom'
$PANELBottom.Size                   = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]781,[System.Int32]77))
$PANELBottom.TabIndex               = [System.Int32]9
#
#LINKGithub
#
$LINKGithub.ActiveLinkColor         = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)))
$LINKGithub.AutoSize                = $true
$LINKGithub.DisabledLinkColor       = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)))
$LINKGithub.Font                    = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LINKGithub.ForeColor               = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)))
$LINKGithub.LinkBehavior            = [System.Windows.Forms.LinkBehavior]::NeverUnderline
$LINKGithub.LinkColor               = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)),([System.Int32]([System.Byte][System.Byte]80)))
$LINKGithub.Location                = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]127,[System.Int32]23))
$LINKGithub.Name                    = [System.String]'LINKGithub'
$LINKGithub.Size                    = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]144,[System.Int32]21))
$LINKGithub.TabIndex                = [System.Int32]4
$LINKGithub.TabStop                 = $true
$LINKGithub.Text                    = [System.String]'github.com/visusys'
#
#BTNCancel
#
$BTNCancel.Anchor                   = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNCancel.Font                     = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCancel.Location                 = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]499,[System.Int32]14))
$BTNCancel.Name                     = [System.String]'BTNCancel'
$BTNCancel.Size                     = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]98,[System.Int32]43))
$BTNCancel.TabIndex                 = [System.Int32]3
$BTNCancel.Text                     = [System.String]'Cancel'
$BTNCancel.UseVisualStyleBackColor  = $true
#
#IMGVisusys
#
$IMGVisusys.Anchor                  = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left)
$IMGVisusys.Image                   = ([System.Drawing.Image]$resources.'IMGVisusys.Image')
$IMGVisusys.Location                = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]20,[System.Int32]22))
$IMGVisusys.Name                    = [System.String]'IMGVisusys'
$IMGVisusys.Size                    = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]28))
$IMGVisusys.SizeMode                = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGVisusys.TabIndex                = [System.Int32]2
$IMGVisusys.TabStop                 = $false
#
#BTNMove
#
$BTNMove.Anchor                     = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right)
$BTNMove.Font                       = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNMove.Location                   = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]608,[System.Int32]14))
$BTNMove.Name                       = [System.String]'BTNMove'
$BTNMove.Size                       = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]43))
$BTNMove.TabIndex                   = [System.Int32]0
$BTNMove.Text                       = [System.String]'Move to Folders'
$BTNMove.UseVisualStyleBackColor    = $true
#
#XMPGroupToFolderForm
#
$XMPGroupToFolderForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]781,[System.Int32]571))
$XMPGroupToFolderForm.Controls.Add($PANELBottom)
$XMPGroupToFolderForm.Controls.Add($DataGridPresetList)
$XMPGroupToFolderForm.Controls.Add($PANELHeader)


$XMPGroupToFolderForm.MaximizeBox   = $false
$XMPGroupToFolderForm.MaximumSize   = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1200,[System.Int32]850))
$XMPGroupToFolderForm.MinimizeBox   = $false
$XMPGroupToFolderForm.MinimumSize   = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]600,[System.Int32]400))
$XMPGroupToFolderForm.Name          = [System.String]'XMPGroupToFolderForm'
$XMPGroupToFolderForm.ShowIcon      = $false
$XMPGroupToFolderForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$XMPGroupToFolderForm.Text          = [System.String]' '
$XMPGroupToFolderForm.TopMost       = $true


([System.ComponentModel.ISupportInitialize]$DataGridPresetList).EndInit()
$PANELHeader.ResumeLayout($false)
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGAdobeLogo).EndInit()
$PANELBottom.ResumeLayout($false)
$PANELBottom.PerformLayout()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).EndInit()
$XMPGroupToFolderForm.ResumeLayout($false)


Add-Member -InputObject $XMPGroupToFolderForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name DataGridPresetList -Value $DataGridPresetList -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name PANELHeader -Value $PANELHeader -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name Num -Value $Num -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name PresetFile -Value $PresetFile -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name PresetName -Value $PresetName -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name XMPGroupFolderName -Value $XMPGroupFolderName -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name PANELBottom -Value $PANELBottom -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name BTNMove -Value $BTNMove -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name BTNCancel -Value $BTNCancel -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name IMGAdobeLogo -Value $IMGAdobeLogo -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name LINKGithub -Value $LINKGithub -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name IMGVisusys -Value $IMGVisusys -MemberType NoteProperty
Add-Member -InputObject $XMPGroupToFolderForm -Name IMGMainHeader -Value $IMGMainHeader -MemberType NoteProperty
}
. InitializeComponent
