object FrmAguardeDDic: TFrmAguardeDDic
  Left = 197
  Top = 217
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Aguarde....'
  ClientHeight = 59
  ClientWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 21
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
    Top = 4
    Width = 48
    Height = 50
    Active = False
    CommonAVI = aviFindFile
    StopFrame = 23
  end
end
Edit
      Left = 24
      Top = 40
      Width = 129
      Height = 21
      TabOrder = 0
    end
    object rdgOrdenacao: TRadioGroup
      Left = 24
      Top = 116
      Width = 348
      Height = 133
      Caption = 'Ordenação'
      ItemIndex = 0
      Items.Strings = (
        'por Ordem de Número da Suplementação'
        'por Ordem de Código de Contas'
        'por Ordem de Nome de Contas'
