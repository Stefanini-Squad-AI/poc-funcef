inherited frmAtuUltCompra: TfrmAtuUltCompra
  Left = 17
  Top = 103
  Caption = 'Atualização de Preço de Última Compra'
  ClientHeight = 436
  ClientWidth = 757
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 757
    Height = 397
    object grpArtigo: TGroupBox
      Left = 5
      Top = 5
      Width = 747
      Height = 60
      Align = alTop
      TabOrder = 0
      object sbSelecionaItem: TSpeedButton
        Left = 529
        Top = 18
        Width = 169
        Height = 29
        Caption = '&Seleciona Itens'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
          FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
          FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
          FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
          00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
          55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
          5555777577775755555550FBFB0555555555575FFF7555555555570000755555
          5555557777555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = sbSelecionaItemClick
      end
      object Label7: TLabel
        Left = 7
        Top = 12
        Width = 107
        Height = 13
        Caption = 'Grupo de Produtos'
      end
      object rgOrdena: TRadioGroup
        Left = 304
        Top = 10
        Width = 201
        Height = 37
        Caption = ' Ordenar por '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&Alfabética'
          '&Código')
        TabOrder = 0
      end
      object dblcGrupoProd: TwwDBLookupCombo
        Left = 7
        Top = 26
        Width = 283
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição'
          'CODGRUPOPROD'#9'10'#9'Código')
        LookupTable = qryGrupo
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object dbgrdArtigos: TwwDBGrid
      Left = 5
      Top = 65
      Width = 747
      Height = 263
      TabStop = False
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCRICAO'#9'71'#9'Descrição'
        'CODMEDIDA'#9'11'#9'Un. Medida'
        'VALULTCOMPRA'#9'19'#9'Valor Ultima Compra')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsGrid
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnExit = dbgrdArtigosExit
      IndicatorColor = icBlack
    end
    object grpSaldo: TGroupBox
      Left = 5
      Top = 328
      Width = 747
      Height = 64
      Align = alBottom
      TabOrder = 2
      object Label4: TLabel
        Left = 478
        Top = 15
        Width = 122
        Height = 13
        Caption = 'Preço de Ult. Compra'
      end
      object Label6: TLabel
        Left = 618
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Un. Medida'
      end
      object Label2: TLabel
        Left = 9
        Top = 15
        Width = 34
        Height = 13
        Caption = 'Artigo'
      end
      object Label3: TLabel
        Left = 133
        Top = 15
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescProd
      end
      object dbedDescProd: TDBEdit
        Left = 133
        Top = 30
        Width = 326
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'DESCRICAO'
        DataSource = dsGrid
        ReadOnly = True
        TabOrder = 2
      end
      object IncschArtigo: TwwIncrementalSearch
        Left = 6
        Top = 30
        Width = 106
        Height = 21
        SearchField = 'CodArtigo'
        ShowMatchText = True
        TabOrder = 0
      end
      object dblckcmbArtigo: TwwDBLookupCombo
        Left = 6
        Top = 30
        Width = 112
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODARTIGO'#9'14'#9'CODARTIGO'
          'DESCRICAO'#9'87'#9'DESCRICAO')
        DataField = 'CODARTIGO'
        DataSource = dsGrid
        LookupTable = qryArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edPreco: TDBRealEdit
        Left = 478
        Top = 30
        Width = 124
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '        0,00000')
        TabOrder = 3
        WordWrap = False
        IntDigits = 15
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALULTCOMPRA'
        DataSource = dsGrid
      end
      object dbeUnidade: TDBEdit
        Left = 618
        Top = 30
        Width = 61
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CODMEDIDA'
        DataSource = dsGrid
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 757
    inherited tb97Fundo: TToolbar97
      Left = 582
      DockPos = 582
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 414
      DockPos = 414
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR) AS ' +
        'DESCRICAO,'
      '       A.CODARTIGO, P.CODMEDCUSTO AS CODMEDIDA, A.VALULTCOMPRA'
      'FROM'
      '      ARTIGO A,'
      '      PRODUTO P'
      'WHERE'
      '          (RTRIM(P.CODGRUPOPROD) = '#39#39')'
      '      AND (P.CODPRODUTO = A.CODPRODUTO)'
      'ORDER BY DESCRICAO'
      '')
    UpdateObject = updSaldo
    ValidateWithMask = True
    Left = 75
    Top = 154
    object qryCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 71
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryCODMEDIDA: TStringField
      DisplayLabel = 'Un. Medida'
      DisplayWidth = 11
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryVALULTCOMPRA: TFloatField
      DisplayLabel = 'Valor Ultima Compra'
      DisplayWidth = 19
      FieldName = 'VALULTCOMPRA'
      DisplayFormat = '#,##0.00000'
    end
  end
  object dsGrid: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 195
    Top = 154
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' || C.DESCCOR)' +
        ' AS DESCRICAO,'
      '       A.CODARTIGO '
      'FROM    ARTIGO A, TAMANHO T, PRODUTO P, COR C'
      'WHERE'
      '      (A.FLGATIVO = '#39'S'#39')'
      '  AND (P.CODPRODUTO = A.CODPRODUTO)'
      '  AND (A.CODCOR = C.CODCOR(+))'
      '  AND (A.CODTAMANHO = T.CODTAMANHO(+))'
      'Order By DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 267
    Top = 154
  end
  object updSaldo: TUpdateSQL
    Left = 354
    Top = 163
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 429
    Top = 154
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         CODGRUPOPROD,'
      '         DESCGRUPOPROD '
      'FROM '
      '         GRUPPROD'
      'WHERE'
      '         (STATUSGRUPO = '#39'A'#39') '
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 609
    Top = 189
  end
end
