inherited FrmConsTransPlanosMT: TFrmConsTransPlanosMT
  Left = 120
  Top = 185
  HelpContext = 790564
  Caption = 'FrmConsTransPlanosMT'
  ClientHeight = 515
  ClientWidth = 883
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 883
    Height = 476
    inherited bvlSepTit: TBevel
      Width = 881
    end
    inherited pnlTitulo: TPanel
      Width = 881
      inherited lbNomDescricao: TfcLabel
        Width = 284
        Caption = 'Transferências entre Planos'
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 97
      Width = 881
      Height = 378
      Align = alClient
      TabOrder = 1
      object grdConsulta: TwwDBGrid
        Left = 1
        Top = 1
        Width = 879
        Height = 376
        Selected.Strings = (
          'DATAOPERACAO'#9'10'#9'Data'
          'NUMDOCUMENTO'#9'20'#9'Boleta'
          'DESCCARTINVEST'#9'40'#9'Carteira'
          'DESCINVESTIMENTO'#9'40'#9'Investimento'
          'PLANOORIG'#9'35'#9'Plano / Patro Origem'
          'PERCENTUAL'#9'7'#9'Percent.'
          'SALDOANTORIG'#9'15'#9'Saldo Qtd. Anterior'
          'QTDTRANSFORIG'#9'15'#9'Qtd. Transferida'
          'SALDOATUORIG'#9'10'#9'Saldo Qtd. Após'
          'TIPOSALDO'#9'12'#9'Tipo de Conta'#9'F'
          'PLANODEST'#9'35'#9'Plano / Patro Destino'
          'SALDOANTDEST'#9'14'#9'Saldo Qtd. Anterior'
          'QTDTRANSFDEST'#9'15'#9'Qtd. Recebida'
          'SALDOATUDEST'#9'14'#9'Saldo Qtd. Após')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsConsTransPlanosMT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = grdConsultaCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = grdConsultaTopRowChanged
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 881
      Height = 52
      Align = alTop
      TabOrder = 2
      object Label8: TLabel
        Left = 14
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object lblPlanoPatroOrigem: TLabel
        Left = 113
        Top = 8
        Width = 187
        Height = 13
        Caption = 'Plano / Patrocinadora de Origem'
      end
      object lblCarteira: TLabel
        Left = 359
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object lblInvestimento: TLabel
        Left = 623
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object edDataFim: TCMDateTimePicker
        Left = 14
        Top = 23
        Width = 93
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
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
      end
      object dblkPlanPatroO: TwwDBLookupCombo
        Left = 113
        Top = 23
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPatroO
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkCarteira: TwwDBLookupCombo
        Left = 359
        Top = 23
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'30'#9'Carteira'#9'F')
        LookupTable = cdsCarteira
        LookupField = 'IDCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 623
        Top = 23
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 476
    Width = 883
    inherited tb97Fundo: TToolbar97
      Left = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 851
    Top = 3
  end
  object cdsCarteira: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 529
    Top = 141
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 777
    Top = 148
  end
  object cdsPlanoPatroO: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 108
  end
  object sprConsTransPlanosMT: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OPO.IDPLANPREVCTBPATR, OPO.IDCARTEIRAINVEST, OPO.IDINVEST' +
        'IMENTO, OPO.DATAOPERACAO, OPO.IDTIPOOPERACAO, OPO.NUMDOCUMENTO, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-158, NVL(HC3.SALDOQTDECPMF,0),' +
        '(NVL(HC3.SALDOQTDEINVCART,0)-NVL(HC3.SALDOQTDECPMF,0))) AS SALDO' +
        'ANTORIG, '
      '       OPO.QTDTRANSFORIG,'
      
        '       DECODE(OPO.IDTIPOOPERACAO,-158,HCO.SALDOQTDECPMF,(HCO.SAL' +
        'DOQTDEINVCART-HCO.SALDOQTDECPMF)) AS SALDOATUORIG, '
      
        '       OPO.TIPOSALDO, OPO.PERCENTUAL, OMO.IDOPERACAOINVEST, OPD.' +
        'IDPLANPREVCTBPATR, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-159, NVL(HC2.SALDOQTDECPMF,0),' +
        '(NVL(HC2.SALDOQTDEINVCART,0)-NVL(HC2.SALDOQTDECPMF,0))) AS SALDO' +
        'ANTDEST, '
      '       OPD.QTDTRANSFDEST, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-159,HCD.SALDOQTDECPMF,(HCD.SAL' +
        'DOQTDEINVCART-HCD.SALDOQTDECPMF)) AS SALDOATUDEST, '
      '       PPO.PLANPRVCONTABPATRO AS PLANOORIG, '
      '       PPD.PLANPRVCONTABPATRO AS PLANODEST, '
      '       CA.DESCCARTINVEST, '
      '       IV.DESCINVESTIMENTO, '
      
        '       OPO.DATAOPERACAO || CA.DESCCARTINVEST || PPO.PLANPRVCONTA' +
        'BPATRO || PPD.PLANPRVCONTABPATRO || OPO.NUMDOCUMENTO || OPO.IDIN' +
        'VESTIMENTO AS GRUPO '
      'FROM '
      
        '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, '
      
        '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFORIG, DECODE(OP.IDTIP' +
        'OOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      '          OP.PERCENTUAL '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND (OP.IDPLANPREVCTBPATR = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, O' +
        'P.PERCENTUAL) OPO, '
      
        '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.I' +
        'DTIPOOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      
        '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND (OP.IDPLANPREVCTBPATR = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) O' +
        'MO, '
      '   HISTCARTINV HCO, '
      
        '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, '
      
        '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFDEST, DECODE(OP.IDTIP' +
        'OOPERACAO,-159,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      '          OP.PERCENTUAL '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, O' +
        'P.PERCENTUAL) OPD, '
      
        '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.I' +
        'DTIPOOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      
        '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) O' +
        'MD, '
      
        '   HISTCARTINV HCD, INVESTIMENTO IV, CARTEIRAINVEST CA, VWPLANPR' +
        'EVCTBPATR PPO, VWPLANPREVCTBPATR PPD, '
      
        '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST' +
        ', HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, '
      '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO '
      '   FROM HISTCARTINV HC '
      '   WHERE '
      '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) '
      '                          FROM HISTCARTINV HC1 '
      '                          WHERE '
      '                                HC1.IDTIPOINVEST   = 2  '
      '                            AND HC1.IDCARTEIRAGERENC IS NULL '
      
        '                            AND HC1.DATAMOVCARTINV = TO_DATE('#39'31' +
        '/08/2006'#39','#39'DD/MM/YYYY'#39') '
      '                            AND HC1.TIPMOVCARTINV  = '#39'ATU'#39' '
      
        '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANP' +
        'REVCTBPATR, HC1.IDCARTEIRAINVEST, '
      
        '                                   HC1.IDCARTEIRAGERENC, HC1.IDI' +
        'NVESTIMENTO) ) HC3, '
      
        '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST' +
        ', HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, '
      '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO '
      '   FROM HISTCARTINV HC '
      '   WHERE '
      '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) '
      '                          FROM HISTCARTINV HC1 '
      '                          WHERE '
      '                                HC1.IDTIPOINVEST   = 2 '
      '                            AND HC1.IDCARTEIRAGERENC IS NULL '
      
        '                            AND HC1.DATAMOVCARTINV = TO_DATE('#39'31' +
        '/08/2006'#39','#39'DD/MM/YYYY'#39') '
      '                            AND HC1.TIPMOVCARTINV  = '#39'ATU'#39' '
      
        '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANP' +
        'REVCTBPATR, HC1.IDCARTEIRAINVEST, '
      
        '                                   HC1.IDCARTEIRAGERENC, HC1.IDI' +
        'NVESTIMENTO) ) HC2 '
      'WHERE OMO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND OMO.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND OMO.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND OMO.DATAOPERACAO       = OPO.DATAOPERACAO '
      '  AND OMO.IDTIPOOPERACAO     = OPO.IDTIPOOPERACAO '
      '  AND OMO.NUMDOCUMENTO       = OPO.NUMDOCUMENTO '
      '  AND HCO.IDOPERACAOINVEST   = OMO.IDOPERACAOINVEST '
      '  AND OPD.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND OPD.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND OPD.DATAOPERACAO       = OPO.DATAOPERACAO '
      '  AND OPD.NUMDOCUMENTO       = OPO.NUMDOCUMENTO '
      '  AND OPD.TIPOSALDO          = OPO.TIPOSALDO '
      '  AND OMD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR '
      '  AND OMD.IDCARTEIRAINVEST   = OPD.IDCARTEIRAINVEST '
      '  AND OMD.IDINVESTIMENTO     = OPD.IDINVESTIMENTO '
      '  AND OMD.DATAOPERACAO       = OPD.DATAOPERACAO '
      '  AND OMD.IDTIPOOPERACAO     = OPD.IDTIPOOPERACAO '
      '  AND OMD.NUMDOCUMENTO       = OPD.NUMDOCUMENTO '
      '  AND HCD.IDOPERACAOINVEST   = OMD.IDOPERACAOINVEST '
      '  AND IV.IDINVESTIMENTO      = OPO.IDINVESTIMENTO '
      '  AND CA.IDCARTEIRAINVEST    = OPO.IDCARTEIRAINVEST '
      '  AND PPO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND PPD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR '
      '  AND HC3.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND HC3.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND HC3.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND HC2.IDPLANPREVCTBPATR(+) = OPD.IDPLANPREVCTBPATR '
      '  AND HC2.IDCARTEIRAINVEST(+)  = OPD.IDCARTEIRAINVEST '
      '  AND HC2.IDINVESTIMENTO(+)    = OPD.IDINVESTIMENTO '
      
        'ORDER BY OPO.DATAOPERACAO, CA.DESCCARTINVEST, OPO.NUMDOCUMENTO, ' +
        'PPO.PLANPRVCONTABPATRO, PPD.PLANPRVCONTABPATRO, IV.DESCINVESTIME' +
        'NTO ')
    Left = 456
    Top = 264
  end
  object CdsConsTransPlanosMT: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 264
    object CdsConsTransPlanosMTDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object CdsConsTransPlanosMTNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 20
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object CdsConsTransPlanosMTDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object CdsConsTransPlanosMTDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsConsTransPlanosMTPLANOORIG: TStringField
      DisplayLabel = 'Plano / Patro Origem'
      DisplayWidth = 35
      FieldName = 'PLANOORIG'
      Size = 113
    end
    object CdsConsTransPlanosMTPERCENTUAL: TFloatField
      DisplayLabel = 'Percent.'
      DisplayWidth = 7
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.00'
    end
    object CdsConsTransPlanosMTSALDOANTORIG: TFloatField
      DisplayLabel = 'Saldo Qtd. Anterior'
      DisplayWidth = 15
      FieldName = 'SALDOANTORIG'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTQTDTRANSFORIG: TFloatField
      DisplayLabel = 'Qtd. Transferida'
      DisplayWidth = 15
      FieldName = 'QTDTRANSFORIG'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTSALDOATUORIG: TFloatField
      DisplayLabel = 'Saldo Qtd. Após'
      DisplayWidth = 10
      FieldName = 'SALDOATUORIG'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTTIPOSALDO: TStringField
      DisplayLabel = 'Tipo de Conta'
      DisplayWidth = 12
      FieldName = 'TIPOSALDO'
      Size = 3
    end
    object CdsConsTransPlanosMTPLANODEST: TStringField
      DisplayLabel = 'Plano / Patro Destino'
      DisplayWidth = 35
      FieldName = 'PLANODEST'
      Size = 113
    end
    object CdsConsTransPlanosMTSALDOANTDEST: TFloatField
      DisplayLabel = 'Saldo Qtd. Anterior'
      DisplayWidth = 14
      FieldName = 'SALDOANTDEST'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTQTDTRANSFDEST: TFloatField
      DisplayLabel = 'Qtd. Recebida'
      DisplayWidth = 15
      FieldName = 'QTDTRANSFDEST'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTSALDOATUDEST: TFloatField
      DisplayLabel = 'Saldo Qtd. Após'
      DisplayWidth = 14
      FieldName = 'SALDOATUDEST'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object CdsConsTransPlanosMTIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 19
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object dsConsTransPlanosMT: TDataSource
    DataSet = CdsConsTransPlanosMT
    Left = 608
    Top = 264
  end
end
