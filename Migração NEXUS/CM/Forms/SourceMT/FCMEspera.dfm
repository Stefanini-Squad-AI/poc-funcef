object frmCMEspera: TfrmCMEspera
  Left = 300
  Top = 203
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Aguarde'
  ClientHeight = 65
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 60
    Top = 12
    Width = 105
    Height = 16
    Caption = 'Processando...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Progress: TProgressBar
    Left = 60
    Top = 30
    Width = 229
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 0
    Visible = False
  end
  object Animacao: TAnimate
    Left = 3
    Top = 6
    Width = 48
    Height = 53
    Active = False
    CommonAVI = aviFindComputer
    StopFrame = 8
  end
end
