inherited FrmViewCotacao: TFrmViewCotacao
  Left = 43
  Top = 143
  Caption = 'Cotação'
  ClientHeight = 298
  ClientWidth = 707
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 25
    Width = 707
    object plnItem: TPanel
      Left = 344
      Top = 5
      Width = 358
      Height = 224
      Align = alRight
      BevelOuter = bvNone
      Caption = 'plnItem'
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Width = 8
        Height = 224
        Cursor = crHSplit
        Beveled = True
      end
      object PgItem: TPageControl
        Left = 8
        Top = 0
        Width = 350
        Height = 224
        ActivePage = TabPrazoEnt
        Align = alClient
        TabOrder = 0
        object TabPrazoEnt: TTabSheet
          Caption = 'Prazo de Ent.'
          object GrdPrazoEnt: TwwDBGrid
            Left = 0
            Top = 0
            Width = 342
            Height = 196
            Selected.Strings = (
              'QTDEENT'#9'10'#9'Qtde.'
              'CODMEDIDA'#9'4'#9'Unid.'
              'DATAENT'#9'10'#9'Data')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoEntrega
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TabPrazoPag: TTabSheet
          Caption = 'Prazo de Pag.'
          object GrdPrazoPag: TwwDBGrid
            Left = 0
            Top = 0
            Width = 342
            Height = 196
            Selected.Strings = (
              'PERCENT'#9'10'#9'Percentual'
              'PRAZOPGTO'#9'10'#9'Prazo em dias'
              'DATAPGTO'#9'18'#9'Data Pagto.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoPgto
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TabAgreg: TTabSheet
          Caption = 'Agregados'
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 342
            Height = 196
            Selected.Strings = (
              'DESCCUSTAGREG'#9'20'#9'Descrição'#9'F'
              'PERCENT'#9'10'#9'Aliquota'
              'BASECALCULO'#9'10'#9'Base'
              'VALOR'#9'10'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsImpostos
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object TabObsItem: TTabSheet
          Caption = 'Obs. Item'
          Enabled = False
          object memObsItem: TDBMemo
            Left = 0
            Top = 0
            Width = 365
            Height = 196
            Align = alLeft
            DataField = 'OBS'
            DataSource = dsCotacao
            MaxLength = 200
            TabOrder = 0
          end
        end
      end
    end
    object GrdItem: TwwDBGrid
      Left = 5
      Top = 5
      Width = 339
      Height = 224
      Hint = 'Duplo click para cancelar o item'
      Selected.Strings = (
        'VENCEDOR'#9'1'#9'  '#9'F'
        'RAZAOSOCIAL'#9'30'#9'Fonecedor'#9'F'
        'QTDEFORNECIDA'#9'10'#9'Qtde. '#9'F'
        'PRECO'#9'10'#9'Preço'#9'F'
        'CODMEDIDA'#9'4'#9'Unid.'#9'F'
        'NUMCOT'#9'10'#9'Nº da Contação'#9'F'
        'DATACOT'#9'18'#9'Data'#9'F'
        'TXJUROS'#9'10'#9'Tx. Juros'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clSilver
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsCotacao
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 259
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 541
      DockPos = 573
    end
  end
  object PlnDescProd: TPanel [2]
    Left = 0
    Top = 0
    Width = 707
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Caption = '  Descrição do Produto'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     DECODE(CO.IDITEMOC,NULL,'#39'X'#39','#39' '#39') AS VENCEDOR,'
      '     CO.CODPROCESSO,'
      '     CO.IDPROCXART,'
      '     CO.IDFORCLI,'
      '     CO.PROPOSTA,'
      '     CO.QTDEFORNECIDA,'
      '     CO.PRECO,'
      '     CO.CODMEDIDA,'
      '     CO.NUMCOT,'
      '     CO.DATACOT,'
      '     CO.OBS,'
      '     CO.MOECODIGO,'
      '     CO.TXJUROS,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '     PESSOA P,'
      '     COTACOES CO'
      ''
      'WHERE'
      '        (CO.CODPROCESSO = :CODPROCESSO)'
      '    AND (CO.IDPROCXART  = :IDPROCXART)'
      '    AND (CO.IDFORCLI = P.IDPESSOA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 433
    Top = 71
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end>
    object qryCotacaoVENCEDOR: TStringField
      DisplayLabel = '  '
      DisplayWidth = 1
      FieldName = 'VENCEDOR'
      Size = 1
    end
    object qryCotacaoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fonecedor'
      DisplayWidth = 30
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryCotacaoQTDEFORNECIDA: TFloatField
      DisplayLabel = 'Qtde. '
      DisplayWidth = 10
      FieldName = 'QTDEFORNECIDA'
      Origin = 'COTACOES.QTDEFORNECIDA'
    end
    object qryCotacaoPRECO: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 10
      FieldName = 'PRECO'
      Origin = 'COTACOES.PRECO'
    end
    object qryCotacaoCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'COTACOES.CODMEDIDA'
      Size = 4
    end
    object qryCotacaoNUMCOT: TFloatField
      DisplayLabel = 'Nº da Contação'
      DisplayWidth = 10
      FieldName = 'NUMCOT'
      Origin = 'COTACOES.NUMCOT'
    end
    object qryCotacaoDATACOT: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATACOT'
      Origin = 'COTACOES.DATACOT'
    end
    object qryCotacaoTXJUROS: TFloatField
      DisplayLabel = 'Tx. Juros'
      DisplayWidth = 10
      FieldName = 'TXJUROS'
      Origin = 'COTACOES.TXJUROS'
    end
    object qryCotacaoCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Origin = 'COTACOES.CODPROCESSO'
      Visible = False
    end
    object qryCotacaoIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Origin = 'COTACOES.IDPROCXART'
      Visible = False
    end
    object qryCotacaoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
      Visible = False
    end
    object qryCotacaoPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
      Visible = False
    end
    object qryCotacaoOBS: TStringField
      DisplayWidth = 200
      FieldName = 'OBS'
      Origin = 'COTACOES.OBS'
      Visible = False
      Size = 200
    end
    object qryCotacaoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'COTACOES.MOECODIGO'
      Visible = False
    end
  end
  object qryPrazoEntrega: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCotacao
    SQL.Strings = (
      'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, IDPRAZOENT,'
      '       CODMEDIDA, PERIODOPRAZO, DATAENT, QTDEENT'
      'FROM PRAZOENTREGA'
      'WHERE (CODPROCESSO = :CODPROCESSO)'
      ' AND  (IDPROCXART  = :IDPROCXART)'
      ' AND  (IDFORCLI    = :IDFORCLI)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 442
    Top = 158
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryPrazoEntregaQTDEENT: TFloatField
      DisplayLabel = 'Qtde.'
      DisplayWidth = 10
      FieldName = 'QTDEENT'
      Origin = 'PRAZOENTREGA.QTDEENT'
      DisplayFormat = '#,##0.00'
    end
    object qryPrazoEntregaCODMEDIDA: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'PRAZOENTREGA.CODMEDIDA'
      Size = 4
    end
    object qryPrazoEntregaDATAENT: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAENT'
      Origin = 'PRAZOENTREGA.DATAENT'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryPrazoEntregaPERIODOPRAZO: TStringField
      DisplayLabel = 'Período'
      DisplayWidth = 1
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGA.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
    object qryPrazoEntregaCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOENTREGA.CODPROCESSO'
      Visible = False
    end
    object qryPrazoEntregaIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOENTREGA.IDPROCXART'
      Visible = False
    end
    object qryPrazoEntregaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOENTREGA.IDFORCLI'
      Visible = False
    end
    object qryPrazoEntregaPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOENTREGA.PROPOSTA'
      Visible = False
    end
    object qryPrazoEntregaIDPRAZOENT: TFloatField
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
      Visible = False
    end
  end
  object qryImpostos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCotacao
    SQL.Strings = (
      'SELECT'
      '       VA.CODPROCESSO,'
      '       VA.IDPROCXART,'
      '       VA.IDFORCLI,'
      '       VA.PROPOSTA,'
      '       VA.CODTIPOCUSTAGREG,'
      '       VA.BASECALCULO,'
      '       VA.PERCENT,'
      '       VA.VALOR,'
      '       TA.DESCCUSTAGREG'
      'FROM'
      '      VALORAGREGCOT VA,'
      '      TIPOAGRE TA'
      'WHERE'
      '           (VA.CODPROCESSO = :CODPROCESSO)'
      '  AND (VA.IDPROCXART  = :IDPROCXART)'
      ' AND  (VA.IDFORCLI    = :IDFORCLI)'
      '  AND (TA.FLGINCIDECOMPRA = '#39'S'#39')'
      '  AND (VA.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG)'
      'ORDER BY TA.DESCCUSTAGREG'
      ''
      ' ')
    ValidateWithMask = True
    Left = 547
    Top = 155
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryImpostosDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'DESCCUSTAGREG'
      Origin = 'BASEDADOS.TIPOAGRE.DESCCUSTAGREG'
      Size = 60
    end
    object qryImpostosPERCENT: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'VALORAGREGCOT.PERCENT'
      DisplayFormat = '#,##0.00'
    end
    object qryImpostosBASECALCULO: TFloatField
      DisplayLabel = 'Base'
      DisplayWidth = 10
      FieldName = 'BASECALCULO'
      Origin = 'VALORAGREGCOT.BASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object qryImpostosVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      Origin = 'VALORAGREGCOT.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryImpostosCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'VALORAGREGCOT.CODPROCESSO'
      Visible = False
    end
    object qryImpostosIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'VALORAGREGCOT.IDPROCXART'
      Visible = False
    end
    object qryImpostosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'VALORAGREGCOT.IDFORCLI'
      Visible = False
    end
    object qryImpostosPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'VALORAGREGCOT.PROPOSTA'
      Visible = False
    end
    object qryImpostosCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'VALORAGREGCOT.CODTIPOCUSTAGREG'
      Visible = False
    end
  end
  object qryPrazoPgto: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsCotacao
    SQL.Strings = (
      'SELECT CODPROCESSO, IDPROCXART, IDFORCLI, PROPOSTA, IDPRAZOPGTO,'
      '       PRAZOPGTO, PERIODOPRAZO, DATAPGTO, PERCENT'
      'FROM PRAZOPGTO'
      'WHERE (CODPROCESSO = :CODPROCESSO) AND'
      '      (IDPROCXART  = :IDPROCXART)'
      ' AND  (IDFORCLI    = :IDFORCLI)')
    ValidateWithMask = True
    Left = 586
    Top = 98
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryPrazoPgtoPERCENT: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
      DisplayFormat = '#,##0.00'
    end
    object qryPrazoPgtoPRAZOPGTO: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryPrazoPgtoDATAPGTO: TDateTimeField
      DisplayLabel = 'Data Pagto.'
      DisplayWidth = 18
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryPrazoPgtoCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
      Visible = False
    end
    object qryPrazoPgtoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
      Visible = False
    end
    object qryPrazoPgtoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
      Visible = False
    end
    object qryPrazoPgtoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
      Visible = False
    end
    object qryPrazoPgtoIDPRAZOPGTO: TFloatField
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
      Visible = False
    end
    object qryPrazoPgtoPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object dsCotacao: TwwDataSource
    AutoEdit = False
    DataSet = qryCotacao
    Left = 436
    Top = 54
  end
  object dsPrazoPgto: TwwDataSource
    AutoEdit = False
    DataSet = qryPrazoPgto
    Left = 588
    Top = 78
  end
  object dsPrazoEntrega: TwwDataSource
    AutoEdit = False
    DataSet = qryPrazoEntrega
    Left = 444
    Top = 142
  end
  object dsImpostos: TwwDataSource
    AutoEdit = False
    DataSet = qryImpostos
    Left = 548
    Top = 142
  end
end
