object molOrcamento: TmolOrcamento
  Left = 0
  Top = 0
  Width = 104
  Height = 37
  TabOrder = 0
  object Label17: TLabel
    Left = 0
    Top = 2
    Width = 94
    Height = 13
    Caption = 'Comp. Orçamen.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCompOrc: TDBRealEdit
    Left = 0
    Top = 16
    Width = 71
    Height = 21
    Alignment = taRightJustify
    Lines.Strings = (
      '0')
    TabOrder = 0
    WordWrap = False
    IntDigits = 10
    DecDigits = 0
    NumberFormat = iNumber
    Signal = False
  end
  object btnBuscaCompromisso: TBitBtn
    Left = 72
    Top = 16
    Width = 23
    Height = 21
    Hint = 'Busca um Compromisso'
    TabOrder = 1
    OnClick = btnBuscaOrcamentoClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
      87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
      FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
      0E070F757770000000E070FFF707777777007700007777777777}
  end
end
