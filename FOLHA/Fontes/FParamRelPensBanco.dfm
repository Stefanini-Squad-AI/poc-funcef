inherited frmParamRelPensBanco: TfrmParamRelPensBanco
  Left = 175
  Top = 203
  HelpContext = 180098
  Caption = 
    'Parâmetro do Relatório de Pensão Alimentícia de Favorecidos por ' +
    'Banco'
  ClientHeight = 231
  ClientWidth = 513
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 192
    object Banco: TGroupBox
      Left = 10
      Top = 124
      Width = 494
      Height = 56
      Caption = 'Banco'
      TabOrder = 2
      object dblkBanco: TwwDBLookupCombo
        Left = 7
        Top = 25
        Width = 475
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Banco'#9'F')
        LookupTable = qryBanco
        LookupField = 'NOME'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object Patrocinadora: TGroupBox
      Left = 10
      Top = 65
      Width = 494
      Height = 56
      Caption = 'Patrocinadora'
      TabOrder = 1
      object dblkPatro: TwwDBLookupCombo
        Left = 7
        Top = 25
        Width = 475
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Patrocinadora'#9'F')
        LookupTable = qryPatro
        LookupField = 'NOME'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object grpMesRef: TGroupBox
      Left = 10
      Top = 6
      Width = 494
      Height = 56
      Caption = 'Histórico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dblkfolha: TwwDBLookupCombo
        Left = 7
        Top = 23
        Width = 475
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryHist
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 192
    Width = 513
    inherited tb97Fundo: TToolbar97
      Left = 341
      DockPos = 344
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 172
      DockPos = 175
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 71
    Top = 318
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, PJ.NOME'
      'FROM PATRO PT, PESSOA PJ'
      'WHERE PT.IDPESSOA = PJ.IDPESSOA'
      'ORDER BY PJ.NOME')
    ValidateWithMask = True
    Left = 173
    Top = 86
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BC.IDPESSOA, PB.NOME'
      'FROM BANCO BC, PESSOA PB'
      'WHERE BC.IDPESSOA = PB.IDPESSOA'
      'ORDER BY PB.NOME')
    ValidateWithMask = True
    Left = 173
    Top = 140
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' ')
    ValidateWithMask = True
    Left = 173
    Top = 17
    object qryHistHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistIDHSTFOLHABENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
end
