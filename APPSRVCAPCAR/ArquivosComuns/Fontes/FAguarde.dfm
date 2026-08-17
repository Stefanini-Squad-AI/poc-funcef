object frmAguarde: TfrmAguarde
  Left = 246
  Top = 401
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Aguarde...'
  ClientHeight = 53
  ClientWidth = 304
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 54
    Top = 6
    Width = 244
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblMensagem'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object pbAguarde: TProgressBar
    Left = 54
    Top = 30
    Width = 244
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
    Visible = False
  end
  object Animate1: TAnimate
    Left = 0
    Top = 0
    Width = 48
    Height = 53
    Active = False
    Align = alLeft
    CommonAVI = aviFindComputer
    StopFrame = 8
  end
end
FÝ¨9¦À¥R
