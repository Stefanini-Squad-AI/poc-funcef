object molOrigemLanc: TmolOrigemLanc
  Left = 0
  Top = 0
  Width = 378
  Height = 41
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 10
    Top = 6
    Width = 131
    Height = 13
    Caption = 'Origem do Lançamento'
  end
  object cboOrigemLanc: TwwDBComboBox
    Left = 9
    Top = 20
    Width = 369
    Height = 21
    ShowButton = True
    Style = csOwnerDrawFixed
    MapList = True
    AllowClearKey = False
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'Acréscimo de Valor'#9'A'
      'Aquisição à Vista'#9'C'
      'Lançamento de Dívidas'#9'D'
      'Lançamento de Reembolso'#9'E'
      'Folha de Aluguéis'#9'F'
      'Imp. Prestação de Contas'#9'I'
      'Lançamento Individual'#9'L'
      'Lançamento Múltiplo'#9'M'
      'Prestação de Contas'#9'P'
      'Folha de Remunerações'#9'R'
      'Alienação à Vista'#9'S'
      'Lançamento com Rateio'#9'T'
      'Lançamento de Previsão'#9'V')
    Sorted = False
    TabOrder = 0
    UnboundDataType = wwDefault
    OnKeyDown = cboOrigemLancKeyDown
  end
end
