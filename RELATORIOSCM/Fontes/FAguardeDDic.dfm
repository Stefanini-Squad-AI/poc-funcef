object FrmAguardeDDic: TFrmAguardeDDic
  Left = 197
  Top = 217
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Aguarde....'
  ClientHeight = 65
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 68
    Top = 25
    Width = 228
    Height = 16
    Caption = 'Montando Dicionário de Dados...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Animate1: TAnimate
    Left = 8
    Top = 8
    Width = 48
    Height = 50
    Active = False
    CommonAVI = aviFindFile
    StopFrame = 23
  end
end
