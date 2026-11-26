object FrmCustomAguardeMT: TFrmCustomAguardeMT
  Left = 491
  Top = 216
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Aguarde...'
  ClientHeight = 66
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblMsg: TLabel
    Left = 72
    Top = 24
    Width = 168
    Height = 16
    Caption = 'Verificando documentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Animate: TAnimate
    Left = 8
    Top = 8
    Width = 48
    Height = 50
    Active = False
    CommonAVI = aviFindFile
    StopFrame = 23
  end
end
