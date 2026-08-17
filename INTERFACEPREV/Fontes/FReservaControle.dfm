inherited frmReservaControle: TfrmReservaControle
  Left = 170
  Top = 182
  Caption = 'Baca - Reserva de controle'
  ClientHeight = 229
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 13
  object lblPatrocinadora: TLabel [0]
    Left = 112
    Top = 35
    Width = 80
    Height = 13
    Caption = 'Patrocinadora'
  end
  inherited pnlFundo: TPanel
    Width = 517
    Height = 190
    object Label1: TLabel
      Left = 37
      Top = 28
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object lbltexto: TLabel
      Left = 13
      Top = 138
      Width = 492
      Height = 13
      AutoSize = False
      Caption = 'Texto'
    end
    object BitBtn1: TBitBtn
      Left = 296
      Top = 83
      Width = 209
      Height = 47
      Caption = 'Acertar reserva de controle'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object pb: TProgressBar
      Left = 5
      Top = 154
      Width = 507
      Height = 31
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 190
    Width = 517
    inherited tb97Fundo: TToolbar97
      Left = 347
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      Visible = False
    end
  end
  object dblkPatrocinadora: TwwDBLookupCombo [3]
    Left = 36
    Top = 42
    Width = 313
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'60'#9'Nome')
    LookupTable = qryPatroCombo
    LookupField = 'IDPESSOA'
    Options = [loTitles]
    Style = csDropDownList
    ParentFont = False
    TabOrder = 2
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 65515
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 333
    Top = 25
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 389
    Top = 33
  end
  object qryPatroCombo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME, '
      '               PT.FLGANO13,  PT.MASCMATRICULA, '
      '               PL.IDPLANOPREV'
      'FROM   PESSOA P, PATRO PT, PLANPREVPATRO PL'
      'WHERE  (PT.IDPESSOA = P.IDPESSOA)'
      'AND PL.IDPESSJUR = PT.IDPESSOA'
      'AND PL.IDPLANOPREV <> 14'
      'ORDER BY P.NOME'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 453
    Top = 28
  end
end
