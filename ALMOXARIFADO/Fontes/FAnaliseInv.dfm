inherited frmAnaliseInv: TfrmAnaliseInv
  Left = 44
  Top = 136
  Caption = 'Análise das Diferenças de Inventário'
  ClientHeight = 346
  ClientWidth = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 708
    Height = 307
    object dbgrdArtigos: TwwDBGrid
      Left = 1
      Top = 61
      Width = 706
      Height = 245
      TabStop = False
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição'#9'F'
        'QTDECONTADA'#9'15'#9'Contagem'
        'SALDOINICIAL'#9'15'#9'Saldo'
        'DIFERENCAATUAL'#9'15'#9'Diferença'
        'CUSTOMEDIO'#9'10'#9'Custo médio')
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
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 706
      Height = 60
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object Label3: TLabel
        Left = 504
        Top = 8
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object sbSelecionaInv: TSpeedButton
        Left = 328
        Top = 20
        Width = 161
        Height = 27
        Caption = '&Seleciona Inventário'
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
        OnClick = sbSelecionaInvClick
      end
      object edAlmoxa: TEdit
        Left = 16
        Top = 24
        Width = 310
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
        Text = 'EDALMOXA'
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 504
        Top = 24
        Width = 177
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        LookupTable = qryUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 307
    Width = 708
    inherited tb97Fundo: TToolbar97
      Left = 321
      DockPos = 323
      inherited sep1: TToolbarSep97
        Left = 300
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 217
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 219
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 302
      end
      object bbtnAtualizaSaldo: TBitBtn
        Left = 0
        Top = 0
        Width = 217
        Height = 33
        Caption = '&Atualiza Saldo pela Contagem'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnAtualizaSaldoClick
        Glyph.Data = {
          16030000424D160300000000000076000000280000003F000000150000000100
          040000000000A002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777770777888888888
          8888887777778888888888888887777778888888888888887770770000000000
          000008888770000000000000008888770000000000000008888070B7B7B70FBF
          BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
          FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
          BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
          FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
          FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
          FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
          FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
          FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
          BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
          FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
          BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
          FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
          BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
          F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
          077777777777777770FBF077777777777777770FBF0887777770777777770BF0
          777777777777777770BF0777777777777777770BF08877777770777777770FB0
          777777777777777770FB0777777777777777770FB08777777770777777777007
          7777777777777777770077777777777777777770087777777770}
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 65523
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' || C.DESCCOR) A' +
        'S DESCRICAO,'
      '      CM.CUSTOMEDIO, RC.SALDOINICIAL,'
      '      RC.QTDECONTADA, RC.DIFERENCAATUAL'
      'FROM'
      '    ARTIGO A,'
      '    TAMANHO T,'
      '    PRODUTO P,'
      '    COR C,'
      '    SALDO S,'
      '    CUSTOMED CM,'
      '    RESCONT RC'
      'WHERE S.CODALMOXARIFADO(+) = 1'
      'AND CM.CODCUSTEIO(+) = 1  AND'
      'P.CODPRODUTO = A.CODPRODUTO AND A.CODCOR = C.CODCOR(+) AND'
      'A.CODTAMANHO = T.CODTAMANHO(+) AND A.CODARTIGO = S.CODARTIGO(+)'
      'AND A.CODARTIGO = CM.CODARTIGO(+)'
      'AND A.CODARTIGO = RC.CODARTIGO(+)'
      'Order By DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 75
    Top = 154
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 87
    end
    object qryQTDECONTADA: TFloatField
      DisplayLabel = 'Contagem'
      DisplayWidth = 15
      FieldName = 'QTDECONTADA'
      DisplayFormat = '0.00000#,#####'
    end
    object qrySALDOINICIAL: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 15
      FieldName = 'SALDOINICIAL'
      DisplayFormat = '0.00000#,#####'
    end
    object qryDIFERENCAATUAL: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 15
      FieldName = 'DIFERENCAATUAL'
      DisplayFormat = '0.00000#,#####'
    end
    object qryCUSTOMEDIO: TFloatField
      DisplayLabel = 'Custo médio'
      DisplayWidth = 10
      FieldName = 'CUSTOMEDIO'
      DisplayFormat = '0.00#,##'
    end
  end
  object dsGrid: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 195
    Top = 154
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 429
    Top = 154
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Inventário'
      'Data Inventário'
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'INVENTAR'
      'GRUPPROD')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO')
    Filtro.Strings = (
      'GRUPPROD.CODGRUPOPROD(+) = INVENTAR.CODGRUPOPROD')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 567
    Top = 110
  end
  object qryContagem: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 345
    Top = 154
  end
  object qryInventario: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 528
    Top = 189
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 435
    Top = 208
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 414
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
