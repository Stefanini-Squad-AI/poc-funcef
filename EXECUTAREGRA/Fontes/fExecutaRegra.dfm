inherited frmExecutaRegra: TfrmExecutaRegra
  Left = 302
  Top = 300
  Caption = 'Executa Regra Numerica'
  ClientHeight = 385
  ClientWidth = 1267
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdExecucao: TLabel [0]
    Left = 232
    Top = 7
    Width = 777
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIdArquivo: TLabel [1]
    Left = 232
    Top = 47
    Width = 777
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIdDebug: TLabel [2]
    Left = 232
    Top = 79
    Width = 777
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnProcessa: TButton [3]
    Left = 16
    Top = 24
    Width = 209
    Height = 25
    Caption = 'Processa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnProcessaClick
  end
  object mLog: TMemo [4]
    Left = 16
    Top = 120
    Width = 1233
    Height = 241
    ScrollBars = ssVertical
    TabOrder = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 131
    Top = 139
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object QryExecucao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 200
    Top = 36
  end
end
