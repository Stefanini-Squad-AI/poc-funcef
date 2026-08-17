inherited frmConsAgendaEventos: TfrmConsAgendaEventos
  Left = 276
  Top = 270
  HelpContext = 790578
  BorderIcons = []
  Caption = 'Consulta de Dados'
  ClientHeight = 453
  ClientWidth = 796
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 796
    Height = 414
    inherited bvlSepTit: TBevel
      Width = 794
    end
    inherited pnlTitulo: TPanel
      Width = 794
      inherited lbNomDescricao: TfcLabel
        Width = 199
        Caption = 'Agenda de Eventos'
      end
    end
    object pgcMercados: TPageControl
      Left = 1
      Top = 101
      Width = 794
      Height = 312
      ActivePage = tbsRendaVariavel
      Align = alClient
      TabOrder = 1
      object tbsRendaVariavel: TTabSheet
        Caption = 'Renda &Variável'
        object dbgRendaVariavel: TwwDBGrid
          Left = 0
          Top = 0
          Width = 786
          Height = 284
          Selected.Strings = (
            'VENCIMENTO'#9'12'#9'Vencimento'
            'DESCTIPOOPERACAO'#9'30'#9'Operação'
            'SIGLAEMISSOR'#9'27'#9'Emissor'
            'ASSEMBLEIA'#9'13'#9'Assembleia'
            'PERCENTUAL'#9'15'#9'Percentual'
            'PU'#9'19'#9'PU')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRendaVariavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = ppmRendaVariavel
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsRendaFixa: TTabSheet
        Caption = 'Renda &Fixa'
        ImageIndex = 2
        object dbgRendaFixa: TwwDBGrid
          Left = 0
          Top = 0
          Width = 778
          Height = 332
          Selected.Strings = (
            'VENCIMENTO'#9'12'#9'Vencimento'
            'TITULO'#9'16'#9'Tipo de Evento'
            'INVESTIMENTO'#9'31'#9'Investimento'
            'PERFIL'#9'27'#9'Perfil'
            'ITEM'#9'23'#9'Item'
            'DATAEMISSAO'#9'12'#9'Emissão'
            'DATAOPERACAO'#9'12'#9'Operação'
            'PERCFLUXO'#9'16'#9'Percentual do Fluxo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRendaFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = ppmRendaFixa
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsBMF: TTabSheet
        Caption = '&BM&&F'
        ImageIndex = 1
        object dbgBMF: TwwDBGrid
          Left = 0
          Top = 0
          Width = 778
          Height = 276
          Selected.Strings = (
            'VENCIMENTO'#9'12'#9'Vencimento'
            'DESCTIPOCTINVEST'#9'35'#9'Tipo'
            'DESCINVESTIMENTO'#9'36'#9'Investimento'
            'PRECOEXERC'#9'21'#9'Prç Exercício')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBMF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = ppmBMF
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsEmprestimo: TTabSheet
        Caption = '&Empréstimo'
        ImageIndex = 4
        object dbgEmprestimo: TwwDBGrid
          Left = 0
          Top = 0
          Width = 778
          Height = 276
          Selected.Strings = (
            'DATAVENCOPER'#9'12'#9'Vencimento'
            'DESCINVESTIMENTO'#9'28'#9'Investimento'
            'DESCTIPOINVEST'#9'25'#9'Tipo Investimento'
            'DESCCARTINVEST'#9'38'#9'Carteira'
            'DESCTIPOOPERACAO'#9'27'#9'Tipo Operação'
            'DATAOPERACAO'#9'15'#9'Data Operação'
            'QTDOPERACAO'#9'19'#9'Quantidade'
            'PUOPERACAO'#9'12'#9'P U'
            'VLROPERACAO'#9'16'#9'Valor'
            'TAXAOPERACAO'#9'9'#9'Taxa'
            'VLRRESGATE'#9'14'#9'Resgate'
            'VLRJUROS'#9'11'#9'Juros')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsEmprestimo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = ppmEmp
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 794
      Height = 56
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object Label2: TLabel
        Left = 216
        Top = 8
        Width = 81
        Height = 13
        Caption = 'Vizualizar até '
      end
      object Label3: TLabel
        Left = 300
        Top = 32
        Width = 72
        Height = 13
        Caption = 'Dias adiante'
      end
      object dblTipoInv: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 169
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPOINV'#9'14'#9'Tipo de Investimento'#9'F')
        LookupTable = qryTipoInvest
        LookupField = 'IDTPINV'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblTipoInvChange
      end
      object spnDias: TSpinEdit
        Left = 216
        Top = 24
        Width = 77
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 30
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 796
    inherited tb97Fundo: TToolbar97
      Left = 624
      DockPos = 1053
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 371
      DockPos = 800
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object btImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 8
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryRendaVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS TIPOREL,'
      '       OD.DATACOM AS VENCIMENTO,'
      '       EM.SIGLAEMISSOR,'
      '       TP.DESCTIPOOPERACAO,'
      '       OD.DATAAGE AS ASSEMBLEIA,'
      '       OD.DIVPORACAO AS PU,'
      '       OD.PERCENTUAL'
      'FROM OPERACAODIREITO OD, TIPOOPERACAO TP, EMISSOR EM'
      'WHERE OD.DATACOM BETWEEN (TO_DATE(:DATAI,'#39'DD/MM/YYYY'#39') + 1) AND'
      '                          TO_DATE(:DATAF,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDEMISSOR = EM.IDEMISSOR'
      
        'ORDER BY VENCIMENTO, TP.DESCTIPOOPERACAO, EM.SIGLAEMISSOR, ASSEM' +
        'BLEIA'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 41
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAF'
        ParamType = ptInput
      end>
    object qryRendaVariavelVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryRendaVariavelDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 30
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRendaVariavelSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 27
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object qryRendaVariavelASSEMBLEIA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Assembleia'
      DisplayWidth = 13
      FieldName = 'ASSEMBLEIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryRendaVariavelPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 15
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,###.############'
    end
    object qryRendaVariavelPU: TFloatField
      DisplayWidth = 19
      FieldName = 'PU'
      DisplayFormat = '###,###,##0.000000000000'
    end
  end
  object dsRendaVariavel: TwwDataSource
    AutoEdit = False
    DataSet = qryRendaVariavel
    Left = 41
    Top = 290
  end
  object dsBMF: TwwDataSource
    AutoEdit = False
    DataSet = qryBMF
    Left = 200
    Top = 290
  end
  object qryBMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 3 AS TIPOREL,'
      '       SB.DATAVENCIMENTO AS VENCIMENTO,'
      '       TC.DESCTIPOCTINVEST,'
      '       IV.DESCINVESTIMENTO,'
      '       SB.PRECOEXERC'
      'FROM SERIESBMF SB, TIPOCONTRINVEST TC, INVESTIMENTO IV'
      
        'WHERE SB.DATAVENCIMENTO BETWEEN (TO_DATE(:DATAI,'#39'DD/MM/YYYY'#39') + ' +
        '1) AND'
      '                                 TO_DATE(:DATAF,'#39'DD/MM/YYYY'#39')'
      '  AND SB.IDTIPOCONTRINVEST = TC.IDTIPOCONTRINVEST'
      '  AND SB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      'ORDER BY VENCIMENTO, DESCTIPOCTINVEST, DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 201
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAF'
        ParamType = ptInput
      end>
    object qryBMFVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryBMFDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 35
      FieldName = 'DESCTIPOCTINVEST'
      Size = 60
    end
    object qryBMFDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 36
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBMFPRECOEXERC: TFloatField
      DisplayLabel = 'Prç Exercício'
      DisplayWidth = 21
      FieldName = 'PRECOEXERC'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qryRendaFixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 2 AS TIPOREL,'
      '       '#39'VENCIMENTOS'#39' AS TITULO,'
      '       OP.VENCOPERACAO AS VENCIMENTO,'
      '       DC.DESCCURVARENFIX AS PERFIL,'
      '       IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '       '#39#39' AS ITEM,'
      '       0 AS PERCFLUXO,'
      '       OP.DATAEMISSAO, OP.DATAOPERACAO'
      'FROM OPERRENFIX OP, INVESTIMENTO IV,'
      '     (SELECT OC.IDOPERRENFIX, CR.DESCCURVARENFIX'
      '      FROM OPERRENFIXXCURVAS OC, CURVASRENFIX CR'
      '      WHERE OC.IDCURVARENFIX = CR.IDCURVARENFIX'
      '      GROUP BY OC.IDOPERRENFIX, CR.DESCCURVARENFIX) DC'
      'WHERE OP.VENCOPERACAO BETWEEN TO_DATE(:DATAI,'#39'DD/MM/YYYY'#39') AND'
      '                              TO_DATE(:DATAF,'#39'DD/MM/YYYY'#39')'
      '  AND OP.IDOPERRENFIX = DC.IDOPERRENFIX'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      ''
      'UNION'
      ''
      'SELECT 2 AS TIPOREL,'
      '       '#39'FLUXOS     '#39' AS TITULO,'
      '       FI.DATAFLUXO AS VENCIMENTO,'
      '       CR.DESCCURVARENFIX AS PERFIL,'
      '       IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '       IR.DESCITEMRENFIX AS ITEM,'
      '       FI.PERCFLUXO,'
      
        '       TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAEMISSAO, TO_DATE('#39#39','#39'DD/M' +
        'M/YYYY'#39') AS DATAOPERACAO'
      
        'FROM FLUXOINVESTRENFIX FI, INVESTIMENTO IV, CURVASRENFIX CR, ITE' +
        'MRENFIX IR'
      'WHERE FI.DATAFLUXO BETWEEN TO_DATE(:DATAI,'#39'DD/MM/YYYY'#39') AND'
      '                           TO_DATE(:DATAF,'#39'DD/MM/YYYY'#39')'
      '  AND FI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND FI.IDCURVARENFIX = CR.IDCURVARENFIX'
      '  AND FI.IDITEMRENFIX = IR.IDITEMRENFIX'
      ''
      
        'ORDER BY VENCIMENTO, TITULO, INVESTIMENTO, PERFIL, DATAEMISSAO, ' +
        'DATAOPERACAO')
    ValidateWithMask = True
    Left = 131
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAF'
        ParamType = ptInput
      end>
    object qryRendaFixaVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRendaFixaTITULO: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 16
      FieldName = 'TITULO'
      Size = 21
    end
    object qryRendaFixaINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 31
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryRendaFixaPERFIL: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 27
      FieldName = 'PERFIL'
      Size = 60
    end
    object qryRendaFixaITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 23
      FieldName = 'ITEM'
      Size = 60
    end
    object qryRendaFixaDATAEMISSAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Emissão'
      DisplayWidth = 12
      FieldName = 'DATAEMISSAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRendaFixaDATAOPERACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Operação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRendaFixaPERCFLUXO: TFloatField
      DisplayLabel = 'Percentual do Fluxo'
      DisplayWidth = 16
      FieldName = 'PERCFLUXO'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsRendaFixa: TwwDataSource
    AutoEdit = False
    DataSet = qryRendaFixa
    Left = 131
    Top = 290
  end
  object ppmRendaVariavel: TPopupMenu
    OnPopup = ppmRendaVariavelPopup
    Left = 424
    Top = 56
    object RVFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = RVFixarColunaClick
    end
    object RVLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = RVLiberarColunaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RVLiberaTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = RVLiberaTodasColunasClick
    end
  end
  object ppmBMF: TPopupMenu
    OnPopup = ppmBMFPopup
    Left = 578
    Top = 56
    object BMFFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = BMFFixarColunaClick
    end
    object BMFLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = BMFLiberarColunaClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object BMFLiberarTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = BMFLiberarTodasColunasClick
    end
  end
  object ppmRendaFixa: TPopupMenu
    OnPopup = ppmRendaFixaPopup
    Left = 509
    Top = 56
    object RFFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = RFFixarColunaClick
    end
    object RFLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = RFLiberarColunaClick
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
    object RFLiberaTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = RFLiberaTodasColunasClick
    end
  end
  object dsEmprestimo: TwwDataSource
    AutoEdit = False
    DataSet = qryEmprestimo
    Left = 273
    Top = 289
  end
  object qryEmprestimo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 4 AS TIPOREL,'
      
        '       OE.DATAVENCOPER, TI.DESCTIPOINVEST, CI.DESCCARTINVEST, IV' +
        '.DESCINVESTIMENTO,'
      '       TP.DESCTIPOOPERACAO, OE.DATAOPERACAO,'
      
        '       OE.QTDOPERACAO, OE.PUOPERACAO, OE.VLROPERACAO, OE.TAXAOPE' +
        'RACAO,'
      '       OE.VLRRESGATE, OE.VLRJUROS'
      
        'FROM OPEREMPACOES OE, CARTEIRAINVEST CI, INVESTIMENTO IV, TIPOIN' +
        'VEST TI, TIPOOPERACAO TP'
      
        'WHERE OE.DATAVENCOPER BETWEEN (TO_DATE(:DATAI,'#39'DD/MM/YYYY'#39') + 1)' +
        ' AND'
      '                               TO_DATE(:DATAF,'#39'DD/MM/YYYY'#39')'
      '  AND OE.IDTIPOINVEST = TI.IDTIPOINVEST'
      '  AND OE.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND OE.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OE.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      
        'ORDER BY OE.DATAVENCOPER, IV.DESCINVESTIMENTO, TI.DESCTIPOINVEST' +
        ', CI.DESCCARTINVEST,'
      '         TP.DESCTIPOOPERACAO, OE.DATAOPERACAO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 273
    Top = 233
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAF'
        ParamType = ptInput
      end>
    object qryEmprestimoDATAVENCOPER: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryEmprestimoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 28
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryEmprestimoDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo Investimento'
      DisplayWidth = 25
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryEmprestimoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 38
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryEmprestimoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo Operação'
      DisplayWidth = 27
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryEmprestimoDATAOPERACAO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Operação'
      DisplayWidth = 15
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryEmprestimoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 19
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryEmprestimoPUOPERACAO: TFloatField
      DisplayLabel = 'P U'
      DisplayWidth = 12
      FieldName = 'PUOPERACAO'
      DisplayFormat = '###,###,##0.00000000'
    end
    object qryEmprestimoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryEmprestimoTAXAOPERACAO: TFloatField
      DisplayLabel = 'Taxa'
      DisplayWidth = 9
      FieldName = 'TAXAOPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryEmprestimoVLRRESGATE: TFloatField
      DisplayLabel = 'Resgate'
      DisplayWidth = 14
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryEmprestimoVLRJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 11
      FieldName = 'VLRJUROS'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object ppmEmp: TPopupMenu
    OnPopup = ppmEmpPopup
    Left = 650
    Top = 56
    object EmpFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = EmpFixarColunaClick
    end
    object EmpLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = EmpLiberarColunaClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object EmpLiberarTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = EmpLiberarTodasColunasClick
    end
  end
  object qryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDTPINV,'
      '       '#39'Todos'#39' AS TIPOINV'
      'FROM DUAL'
      'UNION'
      'SELECT 1 AS IDTPINV,'
      '       '#39'Renda Variável'#39' AS TIPOINV'
      'FROM DUAL'
      'UNION'
      'SELECT 2 AS IDTPINV,'
      '       '#39'Renda Fixa'#39' AS TIPOINV'
      'FROM DUAL'
      'UNION'
      'SELECT 3 AS IDTPINV,'
      '       '#39'BM&F'#39' AS TIPOINV'
      'FROM DUAL'
      'UNION'
      'SELECT 4 AS IDTPINV,'
      '       '#39'Empréstimo'#39' AS TIPOINV'
      'FROM DUAL'
      ''
      'ORDER BY IDTPINV')
    ValidateWithMask = True
    Left = 145
    Top = 65
    object qryTipoInvestTIPOINV: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 14
      FieldName = 'TIPOINV'
      Size = 14
    end
    object qryTipoInvestIDTPINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTPINV'
      Visible = False
    end
  end
end
