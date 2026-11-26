object frmEspera: TfrmEspera
  Left = 499
  Top = 322
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Aguarde'
  ClientHeight = 65
  ClientWidth = 313
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
    Left = 64
    Top = 16
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
    Left = 64
    Top = 32
    Width = 233
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 0
    Visible = False
  end
  object Animacao: TAnimate
    Left = 8
    Top = 8
    Width = 49
    Height = 53
    Active = False
    AutoSize = False
    CommonAVI = aviFindComputer
    StopFrame = 8
  end
end
