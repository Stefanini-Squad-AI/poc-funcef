inherited frmExecDesfazRepactuacao: TfrmExecDesfazRepactuacao
  Left = 399
  Top = 87
  HelpContext = 1350012
  Caption = 'Desfaz Repactuação'
  ClientHeight = 399
  ClientWidth = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 555
    Height = 360
    object GroupBox1: TGroupBox
      Left = 13
      Top = 11
      Width = 524
      Height = 185
      Caption = 'Repactuação'
      TabOrder = 0
      inline molRepactuacao1: TmolRepactuacao
        Left = 6
        Top = 19
        inherited btnBuscaRep: TBitBtn
          OnClick = molRepactuacao1btnBuscaRepClick
        end
        inherited btnLimpaRep: TBitBtn
          OnClick = molRepactuacao1btnLimpaRepClick
        end
      end
    end
    object PageControl1: TPageControl
      Left = 13
      Top = 199
      Width = 524
      Height = 195
      ActivePage = tbsParcelas
      TabOrder = 1
      object tbsParcelas: TTabSheet
        Caption = 'Parcelas'
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 516
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas Incorporadas ao Saldo Devedor'
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
          Left = 0
          Top = 27
          Width = 516
          Height = 105
          Selected.Strings = (
            'NUMPARCELA'#9'10'#9'Parcela'#9'T'
            'CAL_TIPO'#9'49'#9'Tipo'#9'T'
            'DATAVENCIMENTO'#9'20'#9'Vencimento'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = dsParcRepactua
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
          OnCalcCellColors = DBgrdBemOriginalCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBemOriginalTopRowChanged
        end
      end
      object tbsOperacoes: TTabSheet
        Caption = 'Operações'
        ImageIndex = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 516
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Operações de Acréscimos e Descontos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgOperacoes: TwwDBGrid
          Left = 0
          Top = 27
          Width = 516
          Height = 105
          Selected.Strings = (
            'FLGTIPOOPER'#9'3'#9'Tipo'#9'F'
            'DESCCUSTORECIMO'#9'60'#9'Descrição'#9'F'
            'VLROPERACAO'#9'14'#9'Valor'#9'F'
            'OBSERVACAO'#9'200'#9'Observação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = dsOperacoes
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
          OnCalcCellColors = DBgrdBemOriginalCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBemOriginalTopRowChanged
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 555
    inherited tb97Fundo: TToolbar97
      Left = 383
      DockPos = 392
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      inherited ToolbarSep971: TToolbarSep97
        Left = 191
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 17
        Width = 174
        Caption = '&Desfazer Repactuação'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 347
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryParcRepactua: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcRepactuaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     CP.IDCONTRATOIMOVEL,'
      '     PF.CODDOCUMENTO,'
      ''
      
        '     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39' |' +
        '| TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO)' +
        ' AS DATAVENCIMENTO,'
      '     PF.VLRPRESTACAO AS VLRPRESTACAO,'
      '     PF.VLRJUROS,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.DATAPAGAMENTO,'
      '     PF.VLRPAGO'
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      ''
      '     ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,'
      '              A.NUMPARCELAS    AS NUMPARCELAS,'
      '              A.DATAINI,'
      '              A.IDCONDPAGIMOVEL'
      '       FROM   CONDPAGIMOVEL A,'
      '              (SELECT   IDCONDINICIAL,'
      '                        MAX(DATAINI) AS DATAINI'
      '               FROM     CONDPAGIMOVEL'
      '               GROUP BY IDCONDINICIAL) B'
      '       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL'
      '         AND   B.DATAINI       = A.DATAINI ) CPFINAL'
      ''
      'WHERE'
      '         (PF.FLGLANCINTEGRA IN (5,6))'
      '     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      
        '     AND ( (:pIDREPACTUA IS NULL) OR (PF.IDREPACTUA = :pIDREPACT' +
        'UA) )'
      ''
      'ORDER BY PF.DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 309
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDREPACTUA'
        ParamType = ptUnknown
      end>
    object qryParcRepactuaIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcRepactuaIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcRepactuaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcRepactuaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcRepactuaNUMPARCELA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parcela'
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryParcRepactuaDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryParcRepactuaVLRPRESTACAO: TFloatField
      DisplayLabel = 'Prestação'
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcRepactuaVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryParcRepactuaFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcRepactuaFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcRepactuaDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryParcRepactuaVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryParcRepactuaCAL_TIPO: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Size = 25
      Calculated = True
    end
  end
  object dsParcRepactua: TwwDataSource
    AutoEdit = False
    DataSet = qryParcRepactua
    Left = 309
    Top = 96
  end
  object qryCondRepactua: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcRepactuaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       CP.IDREPACTUA,'
      '       R.PLNCODIGO,'
      '       CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL'
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI,'
      '       REPCONDPAGIMOV R'
      'WHERE'
      '       CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL'
      '  AND  CP.IDREPACTUA    = R.IDREPACTUA'
      '  AND  R.IDREPACTUA     = :PIDREPACTUA'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 253
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDREPACTUA'
        ParamType = ptUnknown
      end>
    object qryCondRepactuaIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
    end
    object qryCondRepactuaIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDREPACTUA'
    end
    object qryCondRepactuaIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDINICIAL'
    end
    object qryCondRepactuaDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAVENCIMENTO'
    end
    object qryCondRepactuaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.REPCONDPAGIMOV.PLNCODIGO'
    end
  end
  object qryAlteradoresLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO'
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A'
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( LD.OPERACAO = '#39'4 '#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
  end
  object qryCondResult: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcRepactuaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDCONDPAGIMOVEL, C.IDREPACTUA, c.dataini '
      '  FROM REPCONDRESULTIMOV R, CONDPAGIMOVEL C'
      ' WHERE R.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'
      '   AND R.IDREPACTUA = :PIDREPACTUA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDREPACTUA'
        ParamType = ptUnknown
      end>
    object qryCondResultIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.REPCONDRESULTIMOV.IDCONDPAGIMOVEL'
    end
    object qryCondResultIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDREPACTUA'
    end
    object qryCondResultDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.DATAINI'
    end
  end
  object qryOperacoes: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcRepactuaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     R.IDREPACTUA,'
      '     R.IDTIPOCUSTORECIMO,'
      '     R.FLGTIPOOPER,'
      '     T.DESCCUSTORECIMO,'
      '     R.VLROPERACAO,'
      '     R.OBSERVACAO'
      'FROM'
      '     REPCONDIMOVXOPER R,'
      '     TIPOCUSTORECIMOV T'
      'WHERE'
      '     R.IDREPACTUA = :PIDREPACTUA'
      'AND  T.IDTIPOCUSTORECIMO = R.IDTIPOCUSTORECIMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 413
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDREPACTUA'
        ParamType = ptUnknown
      end>
    object qryOperacoesIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
      Origin = 'BASEDADOS.REPCONDIMOVXOPER.IDREPACTUA'
    end
    object qryOperacoesIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.REPCONDIMOVXOPER.IDTIPOCUSTORECIMO'
    end
    object qryOperacoesFLGTIPOOPER: TStringField
      FieldName = 'FLGTIPOOPER'
      Origin = 'BASEDADOS.REPCONDIMOVXOPER.FLGTIPOOPER'
      FixedChar = True
      Size = 1
    end
    object qryOperacoesDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryOperacoesVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.REPCONDIMOVXOPER.VLROPERACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryOperacoesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.REPCONDIMOVXOPER.OBSERVACAO'
      Size = 200
    end
  end
  object dsOperacoes: TDataSource
    DataSet = qryOperacoes
    Left = 416
    Top = 88
  end
end
