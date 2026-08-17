inherited frmCadPesqTend: TfrmCadPesqTend
  Left = 104
  Top = 152
  HelpContext = 740022
  Caption = 'Pesquisa Salarial: Dados do Mercado (apenas Tendências)'
  ClientHeight = 371
  ClientWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 590
    Height = 285
    BorderWidth = 2
    object Label8: TLabel
      Left = 295
      Top = 93
      Width = 89
      Height = 13
      Caption = 'Salário Nominal'
    end
    object Label9: TLabel
      Left = 421
      Top = 93
      Width = 70
      Height = 13
      Caption = 'Salário Real'
    end
    object Label1: TLabel
      Left = 203
      Top = 109
      Width = 79
      Height = 13
      Caption = 'Menor Salário'
    end
    object Label2: TLabel
      Left = 203
      Top = 134
      Width = 87
      Height = 13
      Caption = 'Primeiro Quartil'
    end
    object Label3: TLabel
      Left = 203
      Top = 158
      Width = 32
      Height = 13
      Caption = 'Moda'
    end
    object Label4: TLabel
      Left = 203
      Top = 182
      Width = 35
      Height = 13
      Caption = 'Média'
    end
    object Label5: TLabel
      Left = 203
      Top = 206
      Width = 49
      Height = 13
      Caption = 'Mediana'
    end
    object Label6: TLabel
      Left = 203
      Top = 230
      Width = 89
      Height = 13
      Caption = 'Terceiro Quartil'
    end
    object Label7: TLabel
      Left = 203
      Top = 254
      Width = 75
      Height = 13
      Caption = 'Maior Salário'
    end
    object Label13: TLabel
      Left = 50
      Top = 165
      Width = 97
      Height = 13
      Caption = 'Frequência Total'
    end
    object gbxPesquisa: TGroupBox
      Left = 12
      Top = 7
      Width = 567
      Height = 73
      Caption = 'Pesquisa Salarial e Cargo'
      TabOrder = 0
      object dbedCodPesqui: TDBEdit
        Left = 9
        Top = 17
        Width = 55
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'IDPESQSALAR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedData: TDBEdit
        Left = 328
        Top = 17
        Width = 83
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DATAREFPESQ'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCodCargo: TDBEdit
        Left = 9
        Top = 42
        Width = 55
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'IDCARGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dblckPesquisa: TwwDBLookupCombo
        Left = 68
        Top = 17
        Width = 255
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPESQSALAR'#9'40'#9'Nome da Pesquisa'#9'F'
          'DATAREFPESQ'#9'18'#9'Data Ref.'#9'F')
        DataField = 'IDPESQSALAR'
        DataSource = ds
        LookupTable = CdsPesquisa
        LookupField = 'IDPESQSALAR'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnChange = dblckPesquisaChange
      end
      object dblckCargo: TwwDBLookupCombo
        Left = 68
        Top = 42
        Width = 255
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TITULO'#9'40'#9'TITULO'#9'F')
        DataField = 'IDCARGO'
        DataSource = ds
        LookupTable = CdsCargo
        LookupField = 'IDCARGO'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dblckEntid: TwwDBLookupCombo
        Left = 328
        Top = 42
        Width = 230
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDEMPRESAPARTIC'
        DataSource = ds
        LookupTable = CdsEntid
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
      end
    end
    object dbedMenor: TDBRealEdit
      Left = 297
      Top = 107
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MENOR'
      DataSource = ds
    end
    object dbedMenorR: TDBRealEdit
      Left = 416
      Top = 107
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MENOR_R'
      DataSource = ds
    end
    object dbedPrimQ: TDBRealEdit
      Left = 297
      Top = 131
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PRIMQUA'
      DataSource = ds
    end
    object dbedPrimQR: TDBRealEdit
      Left = 416
      Top = 131
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PRIMQUA_R'
      DataSource = ds
    end
    object dbedModa: TDBRealEdit
      Left = 297
      Top = 155
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MODA'
      DataSource = ds
    end
    object dbedModaR: TDBRealEdit
      Left = 416
      Top = 155
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MODA_R'
      DataSource = ds
    end
    object dbedMedia: TDBRealEdit
      Left = 297
      Top = 179
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MEDIA'
      DataSource = ds
    end
    object dbedMediaR: TDBRealEdit
      Left = 416
      Top = 179
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MEDIA_R'
      DataSource = ds
    end
    object dbedMediana: TDBRealEdit
      Left = 297
      Top = 203
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MEDIANA'
      DataSource = ds
    end
    object dbedMedianaR: TDBRealEdit
      Left = 416
      Top = 203
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 10
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MEDIANA_R'
      DataSource = ds
    end
    object dbedTercQ: TDBRealEdit
      Left = 297
      Top = 227
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'TERCQUA'
      DataSource = ds
    end
    object dbedTercQR: TDBRealEdit
      Left = 416
      Top = 227
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 12
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'TERCQUA_R'
      DataSource = ds
    end
    object dbedMaior: TDBRealEdit
      Left = 297
      Top = 251
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 13
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MAIOR'
      DataSource = ds
    end
    object dbedMaiorR: TDBRealEdit
      Left = 416
      Top = 251
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 14
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'MAIOR_R'
      DataSource = ds
    end
    object dbedFreq: TDBEdit
      Left = 50
      Top = 180
      Width = 97
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'FREQ'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
  end
  inherited Dock972: TDock97
    Width = 590
    inherited Toolbar971: TToolbar97
      object sbtnGrafico: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar os Dados em Gráfico'
        Caption = '&Gráfico'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
          0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
          0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
          CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
          CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
          CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
          CCC77777777777777377330333333333CCC3337F33333333737F370333333333
          0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
          7777777777777777777733333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnGraficoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 590
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 428
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 253
      DockPos = 261
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 20
    Top = 326
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 330
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 85
    Top = 326
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 20
    Top = 313
  end
  inherited Cds: TCMClientDataSet
    Left = 302
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Dados de Pesquisas'
    Colunas.Strings = (
      'PQ.IDPESQSALAR'
      'PQ.NOMEPESQSALAR'
      'PQ.DATAREFPESQ'
      'CG.TITULO'
      'EP.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Pesquisa'
      'Nome da Pesquisa'
      'Data da Pesquisa'
      'Cargo'
      'Empresa Participante')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA EP'
      'TENDPESQSAL TD'
      'PESQISAL PQ'
      'CARGO CG')
    CamposChave.Strings = (
      'TD.IDPESQSALAR'
      'TD.IDCARGO'
      'TD.IDEMPRESAPARTIC')
    Filtro.Strings = (
      'EP.IDPESSOA           = TD.IDEMPRESAPARTIC'
      'TD.IDPESQSALAR    = PQ.IDPESQSALAR'
      'TD.IDCARGO             = CG.IDCARGO')
    Larguras.Strings = (
      '15'
      '40'
      '15'
      '40'
      '60')
    Left = 85
    Top = 312
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 197
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 183
  end
  object CdsPesquisa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 169
  end
end
