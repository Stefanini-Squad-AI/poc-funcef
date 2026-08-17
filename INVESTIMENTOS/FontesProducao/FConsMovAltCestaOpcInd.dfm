inherited frmConsMovAltCestaOpcInd: TfrmConsMovAltCestaOpcInd
  Left = 0
  Top = 67
  HelpContext = 790558
  Caption = 'Consulta'
  ClientHeight = 456
  ClientWidth = 794
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 794
    Height = 417
    inherited bvlSepTit: TBevel
      Width = 792
    end
    inherited pnlTitulo: TPanel
      Width = 792
      inherited lbNomDescricao: TfcLabel
        Width = 576
        Caption = 'Movimentação da Alteração de Cesta de Opção de Índice'
      end
    end
    object pnlCestaAnterior: TPanel
      Left = 1
      Top = 101
      Width = 792
      Height = 315
      Align = alClient
      TabOrder = 2
      object pnlTitCestaAnterior: TPanel
        Left = 1
        Top = 1
        Width = 790
        Height = 23
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Movimentação'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgTransferencias: TwwDBGrid
        Left = 1
        Top = 24
        Width = 790
        Height = 290
        Selected.Strings = (
          'DESCINVESTIMENTO_1'#9'35'#9'Investimento'
          'QTDANT'#9'14'#9'Quantidade~Anterior'
          'QTDATU'#9'14'#9'Quantidade~Atual'
          'DIF'#9'14'#9'Quantidade~Movimentada'
          'CUSTO'#9'13'#9'Custo'
          'VARIACAO'#9'13'#9'Variação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clHighlightText
        DataSource = DsConsMovAltCestaOpcInd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
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
    object PnlSelecao: TPanel
      Left = 1
      Top = 45
      Width = 792
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 20
        Top = 5
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 156
        Top = 5
        Width = 95
        Height = 13
        Caption = 'Opção de Índice'
      end
      object dDbData: TCMDateTimePicker
        Left = 20
        Top = 21
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clWhite
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
        OnExit = dDbDataExit
      end
      object dblOpcao: TwwDBLookupCombo
        Left = 156
        Top = 21
        Width = 441
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F'
          'DATAORDEM'#9'15'#9'Data da Operação'#9'F')
        LookupTable = qryOrdemOpcInd
        LookupField = 'IDCESTAOPCIND'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblOpcaoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 794
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 333
      end
      inherited sep3: TToolbarSep97
        Left = 249
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 168
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 252
      end
      object bt_Imprime: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Analítico'
        TabOrder = 2
        OnClick = bt_ImprimeClick
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
      object BitBtn1: TBitBtn
        Left = 84
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Sintético'
        TabOrder = 3
        OnClick = BitBtn1Click
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
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 619
    Top = 11
  end
  object qryOrdemOpcInd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OD.DATAORDEM, IV.DESCINVESTIMENTO, OD.IDCESTAOPCIND,'
      '   OD.IDINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDLOTE, OD.IDBOLETA'
      'FROM ORDEMOPCIND OD, INVESTIMENTO IV, OPCOES OP,'
      '     (SELECT DISTINCT IDCESTAOPCIND, DATAVIGENCIA, IDBOLETA'
      '      FROM  CESTAOPCIND C1'
      '      WHERE ((C1.IDCESTAOPCIND || C1.DATAVIGENCIA) IN'
      
        '                 (SELECT C2.IDCESTAOPCIND || MAX(C2.DATAVIGENCIA' +
        ')'
      '                  FROM CESTAOPCIND C2'
      
        '                  WHERE DATAVIGENCIA <= TO_DATE(:DATAFECHTO,'#39'DD/' +
        'MM/YYYY'#39')'
      '                  GROUP BY IDCESTAOPCIND))) CO'
      'WHERE OD.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OD.IDTIPOOPERACAO = -86'
      '  AND OD.STATUS         = '#39'F'#39
      '  AND OD.IDCESTAOPCIND IS NOT NULL'
      '  AND OD.DATAORDEM      < TO_DATE(:DATAFECHTO,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDCESTAOPCIND  = CO.IDCESTAOPCIND'
      '  AND OP.IDINVESTIMENTO = OD.IDINVESTIMENTO'
      'ORDER BY IV.DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 609
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end>
    object qryOrdemOpcIndDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS."CM.INVESTIMENTO".DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdemOpcIndDATAORDEM: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 15
      FieldName = 'DATAORDEM'
    end
    object qryOrdemOpcIndIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDCESTAOPCIND'
      Visible = False
    end
    object qryOrdemOpcIndIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.ORDEMOPCIND.IDINVESTIMENTO'
      Visible = False
    end
    object qryOrdemOpcIndIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOrdemOpcIndIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryOrdemOpcIndIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
  object QryConsMovAltCestaOpcInd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MV.IDCESTAOPCIND,  OP.DESCINVESTIMENTO, MV.DESCINVESTIMEN' +
        'TO, MV.SGLCUSTODIANTE,'
      
        '       MV.IDCUSTODIANTE,  MV.IDINVESTIMENTO, MV.IDEMISSOR, MV.ID' +
        'CARTEIRAINVEST,'
      
        '       CA.DESCCARTINVEST, SUM(MV.QTDANT) AS QTDANT, SUM(MV.QTDAT' +
        'U) AS QTDATU,'
      '             (SUM(MV.QTDANT) - SUM(MV.QTDATU)) AS DIF,'
      
        '       ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUCUSTO,2' +
        ') AS CUSTO,'
      
        '       ROUND((SUM(MV.QTDANT) - SUM(MV.QTDATU)) * CUSTO.PUVARIACA' +
        'O,2) AS VARIACAO'
      ''
      
        'FROM (SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      
        '             C.DATAVIGENCIA AS DTVGATU,           C.QUANTIDADE A' +
        'S QTDATU,'
      
        '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGANT, 0 AS QTDANT, C' +
        '.IDCESTAOPCIND'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T'
      '      WHERE C.DATAVIGENCIA = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      
        '        AND (((:IDCESTAOPCIND IS NOT NULL) AND (C.IDCESTAOPCIND ' +
        '= :IDCESTAOPCIND)) OR'
      '              (:IDCESTAOPCIND IS NULL))'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE = T.IDCUSTODIANTE'
      '        AND C.IDBOLETA IS NOT NULL'
      ''
      '      UNION'
      ''
      
        '      SELECT I.DESCINVESTIMENTO, C.IDINVESTIMENTO, T.SGLCUSTODIA' +
        'NTE, C.IDCUSTODIANTE,'
      '             I.IDEMISSOR, C.IDCARTEIRAINVEST,'
      '             TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DTVGATU, 0 AS QTDATU,'
      
        '             C.DATAVIGENCIA AS DTVGANT,           C.QUANTIDADE A' +
        'S QTDANT, C.IDCESTAOPCIND'
      '      FROM CESTAOPCIND C, INVESTIMENTO I, CUSTODIANTE T'
      '      WHERE C.DATAVIGENCIA || C.IDCESTAOPCIND IN'
      
        '                       (SELECT MAX(DATAVIGENCIA) || MAX(IDCESTAO' +
        'PCIND)'
      '                        FROM CESTAOPCIND'
      
        '                        WHERE DATAVIGENCIA < TO_DATE(:DATAATUAL,' +
        #39'DD/MM/YYYY'#39')'
      
        '                          AND IDCESTAOPCIND IN (SELECT IDCESTAOP' +
        'CIND'
      '                                                FROM CESTAOPCIND'
      
        '                                                WHERE DATAVIGENC' +
        'IA = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      
        '                                                  AND (((:IDCEST' +
        'AOPCIND IS NOT NULL) AND (IDCESTAOPCIND = :IDCESTAOPCIND)) OR'
      
        '                                                        (:IDCEST' +
        'AOPCIND IS NULL))'
      
        '                                                  AND IDBOLETA I' +
        'S NOT NULL'
      
        '                                                GROUP BY IDCESTA' +
        'OPCIND)'
      '                        GROUP BY IDCESTAOPCIND )'
      '        AND C.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '        AND C.IDCUSTODIANTE = T.IDCUSTODIANTE'
      '     ) MV,'
      ''
      '('
      'SELECT'
      '  IV.DESCINVESTIMENTO,'
      '  H1.IDINVESTIMENTO,'
      '  H1.SALDOVLRCARTINV,'
      '  H1.IDCARTEIRAINVEST,'
      '  H1.SALDOQTDEINVCART,'
      '  H1.SALDOVARIACAO,'
      
        '  (NVL(H1.SALDOVARIACAO,1)/NVL(H1.SALDOQTDEINVCART,1)) AS PUVARI' +
        'ACAO,'
      '  (NVL(H1.SALDOAQUI,1)/NVL(H1.SALDOQTDEINVCART,1)) AS PUCUSTO'
      'FROM'
      '   CM.HISTCARTINV H1, CM.INVESTIMENTO IV'
      'WHERE'
      '   (H1.IDHISTCARTINV  IN'
      '     ('
      '      SELECT MAX(H2.IDHISTCARTINV)'
      '      FROM HISTCARTINV H2'
      '      WHERE'
      '           H2.IDTIPOINVEST       = 2                     AND'
      
        '        (((H2.DATAMOVCARTINV     = TO_DATE(:DATAATUAL,'#39'DD/MM/YYY' +
        'Y'#39')) )  OR'
      
        '         ((H2.DATAMOVCARTINV     < TO_DATE(:DATAATUAL,'#39'DD/MM/YYY' +
        'Y'#39'))    AND (H2.IDHISTCARTINV <9999999999)))'
      
        '      GROUP BY H2.IDINVESTIMENTO, H2.IDCARTEIRAINVEST ))        ' +
        '        AND'
      '   (H1.IDINVESTIMENTO     = IV.IDINVESTIMENTO(+))        AND'
      
        '   (NVL(H1.SALDOQTDEINVCART,0) > 0)) CUSTO, CARTEIRAINVEST CA, O' +
        'RDEMOPCIND OD, INVESTIMENTO OP'
      ''
      'WHERE'
      '   CUSTO.IDINVESTIMENTO         = MV.IDINVESTIMENTO      AND'
      '   CUSTO.IDCARTEIRAINVEST       = MV.IDCARTEIRAINVEST    AND'
      '   CA.IDCARTEIRAINVEST          = MV.IDCARTEIRAINVEST    AND'
      '   OD.IDCESTAOPCIND'#9'        = MV.IDCESTAOPCIND       AND'
      '   OP.IDINVESTIMENTO            = OD.IDINVESTIMENTO'
      ''
      
        'GROUP BY  MV.IDCESTAOPCIND,  MV.IDCARTEIRAINVEST,  MV.DESCINVEST' +
        'IMENTO,  MV.IDINVESTIMENTO,'
      
        '          MV.IDEMISSOR,  MV.SGLCUSTODIANTE,  MV.IDCUSTODIANTE, C' +
        'USTO.PUCUSTO, CUSTO.PUVARIACAO,'
      #9'  CUSTO.SALDOVLRCARTINV, CUSTO.SALDOQTDEINVCART,'
      '          CA.DESCCARTINVEST, OP.DESCINVESTIMENTO'
      ''
      'HAVING  (SUM( MV.QTDANT) - SUM( MV.QTDATU)) <> 0'
      ''
      
        'ORDER BY OP.DESCINVESTIMENTO,  MV.DESCINVESTIMENTO,  MV.SGLCUSTO' +
        'DIANTE'
      ''
      '')
    ValidateWithMask = True
    Left = 511
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
        Value = '01/09/2003'
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCESTAOPCIND'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end>
    object QryConsMovAltCestaOpcIndDESCINVESTIMENTO_1: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO_1'
      Size = 60
    end
    object QryConsMovAltCestaOpcIndQTDANT: TFloatField
      DisplayLabel = 'Quantidade~Anterior'
      DisplayWidth = 14
      FieldName = 'QTDANT'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndQTDATU: TFloatField
      DisplayLabel = 'Quantidade~Atual'
      DisplayWidth = 14
      FieldName = 'QTDATU'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndDIF: TFloatField
      DisplayLabel = 'Quantidade~Movimentada'
      DisplayWidth = 14
      FieldName = 'DIF'
      DisplayFormat = '###,###,###,##0'
    end
    object QryConsMovAltCestaOpcIndCUSTO: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 13
      FieldName = 'CUSTO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 13
      FieldName = 'VARIACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryConsMovAltCestaOpcIndDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryConsMovAltCestaOpcIndIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
    object QryConsMovAltCestaOpcIndSGLCUSTODIANTE: TStringField
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object QryConsMovAltCestaOpcIndIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryConsMovAltCestaOpcIndIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryConsMovAltCestaOpcIndIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object QryConsMovAltCestaOpcIndIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConsMovAltCestaOpcIndDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
  end
  object DsConsMovAltCestaOpcInd: TwwDataSource
    DataSet = QryConsMovAltCestaOpcInd
    Left = 511
    Top = 200
  end
end
