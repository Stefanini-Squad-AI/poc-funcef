object molPlanoOrcamentario: TmolPlanoOrcamentario
  Left = 0
  Top = 0
  Width = 322
  Height = 42
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 112
    Height = 13
    Caption = 'Plano Orçamentário'
  end
  object cboPlanoOrcamen: TwwDBLookupCombo
    Left = 8
    Top = 18
    Width = 305
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEPLANOORC'#9'60'#9'NOMEPLANOORC'#9'F')
    LookupTable = CdsPlanoOrcamen
    LookupField = 'IDPLANOORCAMEN'
    Options = [loColLines]
    DropDownCount = 5
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object sqlPlanoOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  PLANOORCAMENTARIO'
      'ORDER BY'
      '  NOMEPLANOORC')
    ClientDataSet = CdsPlanoOrcamen
    Left = 104
    Top = 6
  end
  object CdsPlanoOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    AfterOpen = CdsPlanoOrcamenAfterOpen
    Left = 48
    Top = 6
  end
  object cdsParametro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 248
    Top = 6
  end
  object sqlParametro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOORCAMEN'
      'FROM'
      ' PARAMORCAMENTO')
    ClientDataSet = cdsParametro
    Left = 200
    Top = 6
  end
end
