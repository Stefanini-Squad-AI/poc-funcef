inherited frmExecAssociaDoc: TfrmExecAssociaDoc
  Left = 49
  Top = 118
  HelpContext = 1350040
  Caption = 'Associação de documentos'
  ClientHeight = 405
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 142
    Width = 731
    Height = 230
    object sbtnAssociar: TSpeedButton
      Left = 328
      Top = 44
      Width = 73
      Height = 49
      Hint = 'Associa Documento'
      Caption = 'Associa'
      Glyph.Data = {
        6E020000424D6E02000000000000760000002800000036000000120000000100
        040000000000F801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777FFFFFF777777777777777777777770077777770000007777777
        777FF888888F7777777777777777777777007777700111111077017777F88777
        77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
        7777004444440770470077701119999911111177F877F88888F777F877704444
        4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
        47007701197777777111117F87F87777777877F870444C77777C444447007700
        0977777711111177888877777F8FFFF87044C777777744444700777777777779
        99999977FFFFF777788888887000C77777744444470070000007777777777778
        888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
        7777888800000077777777777700704444C7777777044C7877778777777F87F8
        011111C77777700097007044440077777044C778777788FFFFF8778701111C77
        7777701197007044444400000444C7787FF7778888877F870111100777770119
        7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
        7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
        C777777777777888888777777977991111119977770077777777777777777777
        777777777777777777777799999977777700}
      Layout = blGlyphTop
      NumGlyphs = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAssociarClick
    end
    object sbtnCancelar: TSpeedButton
      Left = 328
      Top = 132
      Width = 73
      Height = 49
      Hint = 'Exclui a Associação'
      Caption = 'Cancela'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
        88888887788888778F88887991919191088888788888888878F8879919191919
        108887F88888888887F88791919191919088878888888888878F791919191919
        19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
        19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
        190878F8888888888878879191919191908887F88888888887F8879919191919
        1088878F88888888878888799191919108888878FF88888F7888888779999977
        8888888778FFFF77888888888777778888888888877777888888}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnCancelarClick
    end
    object Panel5: TPanel
      Left = 1
      Top = -1
      Width = 312
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Parcelas do Contrato'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBgrdBemOriginal: TwwDBGrid
      Left = 1
      Top = 26
      Width = 312
      Height = 199
      Selected.Strings = (
        'NUMPARCELA'#9'5'#9'Parc'#9'T'
        'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'T'
        'CODDOCUMENTO'#9'12'#9'Documento'#9'F'
        'VLRPRESTACAO'#9'13'#9'Valor Parcela'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnCellChanged = DBgrdBemOriginalCellChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsParc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 417
      Top = -1
      Width = 312
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Documentos não associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object wwDBGrid1: TwwDBGrid
      Left = 417
      Top = 26
      Width = 312
      Height = 199
      Selected.Strings = (
        'CODDOCUMENTO'#9'12'#9'Documento'#9'F'
        'DATAVENCIMENTO'#9'17'#9'Vencimento'#9'T'
        'VLR_LANC'#9'14'#9'Valor'#9'F'
        'NODOCUMENTO'#9'10'#9'Nr. Documento'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDocs
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 731
    Height = 142
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 101
      Width = 92
      Height = 13
      Caption = 'Tipo de Receita'
    end
    object sbAbrir: TSpeedButton
      Left = 669
      Top = 27
      Width = 42
      Height = 38
      Hint = 'Exibir Documentos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAbrirClick
    end
    object dbcboReceita: TwwDBLookupCombo
      Left = 9
      Top = 116
      Width = 452
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO'#9'F')
      LookupTable = qryReceita
      LookupField = 'IDTIPOCUSTORECIMO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    inline molProposta1: TmolProposta
      Left = 2
      Top = 2
      Width = 463
      TabOrder = 1
      inherited edtNomProp: TEdit
        Width = 297
      end
      inherited btnBuscaProp: TBitBtn
        Left = 410
        OnClick = molProposta1btnBuscaPropClick
      end
      inherited btnLimpaProp: TBitBtn
        Left = 434
      end
    end
    object rgRelacao: TRadioGroup
      Left = 470
      Top = 12
      Width = 185
      Height = 87
      Caption = 'Relacionar por '
      ItemIndex = 0
      Items.Strings = (
        'Nome do Comprador'
        'Imóveis do Contrato')
      TabOrder = 2
    end
    object rgTipoAssocia: TRadioGroup
      Left = 9
      Top = 44
      Width = 451
      Height = 54
      Caption = ' Tipo de Associação '
      ItemIndex = 0
      Items.Strings = (
        'Documentos do Administração Imobiliária'
        'Documentos do Contas a Receber (Independe o Tipo de Receita)')
      TabOrder = 3
      OnClick = rgTipoAssociaClick
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 141
    Top = 160
  end
  object qryParc: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPARCFINANCIMOV, P.CODDOCUMENTO, P.NUMPARCELA, C.IDLOC' +
        'ATARIO,'
      '       P.DATAVENCIMENTO, P.VLRPRESTACAO'
      '  FROM CONTRATOIMOVEL C, PARCFINANCIMOV P,'
      '       ( SELECT DISTINCT IDCONDINICIAL, IDCONTRATOIMOVEL'
      '           FROM CONDPAGIMOVEL ) CP'
      ' WHERE C.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'
      '   AND CP.IDCONDINICIAL = P.IDCONDPAGIMOVEL'
      
        '   AND ( P.FLGTIPOLANC IN(2,3,5,6,7,8,10) OR (P.FLGTIPOLANC = 4 ' +
        'AND P.CODDOCUMENTO IS NOT NULL) )'
      '   AND P.NUMPARCELA > 0'
      '   AND C.IDLOCATARIO = :PIDCOMPRADOR'
      
        '   AND ( (P.CODDOCUMENTO IS NULL AND NVL(P.FLGLANCINTEGRA,0) = 0' +
        ' ) OR'
      '         P.CODDOCUMENTO IN ( SELECT DISTINCT CODDOCUMENTO'
      '                               FROM DOCUMENTO'
      '                              WHERE IDMODULO <> 135'
      '                                AND RECPAG = '#39'R'#39
      
        '                                AND ( (:PIDLOCATARIO IS NULL) OR' +
        ' (IDFORCLI = :PIDLOCATARIO) )'
      '                                ) )'
      ' ORDER BY DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 141
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end>
    object qryParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcNUMPARCELA: TFloatField
      FieldName = 'NUMPARCELA'
    end
    object qryParcIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsDocs: TwwDataSource
    AutoEdit = False
    DataSet = qryDocs
    Left = 437
    Top = 160
  end
  object qryDocs: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODDOCUMENTO, NODOCUMENTO, DATAVENCIMENTO,'
      '       SUM(VLRLANCRECEB) AS VLR_LANC'
      '  FROM LANCAMENTOSIMOVEL'
      ' WHERE CODDOCUMENTO IS NOT NULL'
      '   AND IDTIPOCUSTORECIMO = :PIDTIPOCUSTORECIMO'
      '   AND ( (:PIDLOCATARIO IS NULL) OR (IDFORCLI = :PIDLOCATARIO) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (IDIMOVEL IN (SELECT ID' +
        'IMOVEL'
      
        '                                                         FROM CO' +
        'NTRATOXIMOVEL'
      
        '                                                        WHERE ID' +
        'CONTRATOIMOVEL = :PIDCONTRATOIMOVEL)) )'
      '   AND CODDOCUMENTO NOT IN ( SELECT P.CODDOCUMENTO'
      
        '                               FROM CONTRATOIMOVEL C, PARCFINANC' +
        'IMOV P,'
      
        '                                    ( SELECT DISTINCT IDCONDINIC' +
        'IAL, IDCONTRATOIMOVEL'
      '                                        FROM CONDPAGIMOVEL ) CP'
      
        '                              WHERE C.IDCONTRATOIMOVEL = CP.IDCO' +
        'NTRATOIMOVEL'
      
        '                                AND CP.IDCONDINICIAL = P.IDCONDP' +
        'AGIMOVEL'
      '                                AND P.CODDOCUMENTO IS NOT NULL'
      
        '                                AND C.IDLOCATARIO = :PIDCOMPRADO' +
        'R )'
      ' GROUP BY CODDOCUMENTO, NODOCUMENTO, DATAVENCIMENTO'
      ' ORDER BY DATAVENCIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 437
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCOMPRADOR'
        ParamType = ptUnknown
      end>
    object qryDocsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocsDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryDocsVLR_LANC: TFloatField
      FieldName = 'VLR_LANC'
      DisplayFormat = '###,##0.00'
    end
    object qryDocsNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
  end
  object qryReceita: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCUSTORECIMO, DESCCUSTORECIMO'
      '  FROM TIPOCUSTORECIMOV'
      ' WHERE RECCUSTO = '#39'R'#39
      '   AND IDMODULO = 64'
      ' ORDER BY DESCCUSTORECIMO '
      '')
    ValidateWithMask = True
    Left = 501
    Top = 106
    object qryReceitaDESCCUSTORECIMO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryReceitaIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
  end
  object updParc: TUpdateSQL
    Left = 142
    Top = 132
  end
end
