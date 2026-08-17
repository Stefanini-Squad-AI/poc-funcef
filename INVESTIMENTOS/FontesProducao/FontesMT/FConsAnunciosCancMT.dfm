inherited frmConsAnunciosCancMT: TfrmConsAnunciosCancMT
  Left = 475
  Top = 202
  HelpContext = 790551
  Caption = 'frmConsAnunciosCancMT'
  ClientHeight = 528
  ClientWidth = 828
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 828
    Height = 489
    inherited bvlSepTit: TBevel
      Width = 826
    end
    inherited pnlTitulo: TPanel
      Width = 826
      inherited lbNomDescricao: TfcLabel
        Width = 221
        Caption = 'Anúncios Cancelados'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 826
      Height = 146
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 340
        Top = 51
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblTipoOper: TLabel
        Left = 19
        Top = 51
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object lblDtIni: TLabel
        Left = 19
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object lblDtFim: TLabel
        Left = 177
        Top = 6
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label6: TLabel
        Left = 340
        Top = 5
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object Label7: TLabel
        Left = 19
        Top = 98
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
        FocusControl = dblSegmentacao
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 340
        Top = 67
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento')
        LookupTable = cdsInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblTipoOper: TwwDBLookupCombo
        Left = 19
        Top = 67
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Operação'#9'F')
        LookupTable = CdsTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edDataIni: TCMDateTimePicker
        Left = 19
        Top = 20
        Width = 136
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
      object edDataFim: TCMDateTimePicker
        Left = 177
        Top = 20
        Width = 136
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
        TabOrder = 1
      end
      object dblPlanPatro: TwwDBLookupCombo
        Left = 340
        Top = 20
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object ChBxConsolidadoInvest: TCheckBox
        Left = 354
        Top = 114
        Width = 193
        Height = 17
        Caption = 'Consolidado por Investimento'
        TabOrder = 5
        OnClick = ChBxConsolidadoInvestClick
      end
      object dblSegmentacao: TwwDBLookupCombo
        Left = 19
        Top = 114
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'50'#9'Segmentação'#9'F')
        LookupTable = cdsSegmentacao
        LookupField = 'IDSEGMENTACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 191
      Width = 826
      Height = 297
      Align = alClient
      TabOrder = 2
      object grdConsulta: TwwDBGrid
        Left = 1
        Top = 1
        Width = 824
        Height = 295
        PictureMasks.Strings = (
          'SALDOCC'#9'#.###.###.###.###'#9'T'#9'T'
          'SALDOCCI'#9'#.###.###.###.###'#9'T'#9'T')
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'
          'DESCCARTINVEST'#9'35'#9'Carteira'
          'DESCTIPOOPERACAO'#9'31'#9'Operação'
          'BOLETA'#9'12'#9'Boleta'
          'DESCINVESTIMENTO'#9'24'#9'Investimento'
          'DATAEX'#9'12'#9'Data EX'
          'DATAPREVISTA'#9'12'#9'Data Prevista'
          'DATABASE'#9'12'#9'Data Base'
          'DATAOPERACAO'#9'15'#9'Data Cancelamento'
          'QTDPREVISTA'#9'17'#9'Quantidade'
          'VALORPREVISTO'#9'16'#9'Valor Previsto'
          'QTDRECEBIDA'#9'16'#9'Valor Recebido'
          'QTDCANCELADA'#9'16'#9'Valor Cancelado')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAnunciosCanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
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
        OnUpdateFooter = grdConsultaUpdateFooter
      end
    end
  end
  inherited Dock971: TDock97
    Top = 489
    Width = 828
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
    Left = 683
    Top = 11
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 681
    Top = 116
  end
  object dsAnunciosCanc: TDataSource
    DataSet = cdsAnunciosCanc
    Left = 686
    Top = 281
  end
  object cdsAnunciosCanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsAnunciosCancAfterOpen
    AfterScroll = cdsAnunciosCancAfterScroll
    Left = 688
    Top = 225
    object cdsAnunciosCancPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object cdsAnunciosCancDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 35
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object cdsAnunciosCancDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 31
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object cdsAnunciosCancBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'BOLETA'
      Size = 30
    end
    object cdsAnunciosCancDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 24
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object cdsAnunciosCancDATAEX: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 12
      FieldName = 'DATAEX'
    end
    object cdsAnunciosCancDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREVISTA'
    end
    object cdsAnunciosCancDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 12
      FieldName = 'DATABASE'
    end
    object cdsAnunciosCancDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Cancelamento'
      DisplayWidth = 15
      FieldName = 'DATAOPERACAO'
    end
    object cdsAnunciosCancQTDPREVISTA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 17
      FieldName = 'QTDPREVISTA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object cdsAnunciosCancVALORPREVISTO: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 16
      FieldName = 'VALORPREVISTO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object cdsAnunciosCancQTDRECEBIDA: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 16
      FieldName = 'QTDRECEBIDA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object cdsAnunciosCancQTDCANCELADA: TFloatField
      DisplayLabel = 'Valor Cancelado'
      DisplayWidth = 16
      FieldName = 'QTDCANCELADA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object cdsAnunciosCancCONTA: TStringField
      DisplayWidth = 12
      FieldName = 'CONTA'
      Visible = False
      Size = 12
    end
    object cdsAnunciosCancVLROPERACAO: TFloatField
      DisplayWidth = 13
      FieldName = 'VLROPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object cdsAnunciosCancDESCMOTBLOQ: TStringField
      DisplayWidth = 27
      FieldName = 'DESCMOTBLOQ'
      Visible = False
      Size = 30
    end
    object cdsAnunciosCancPRECOUNITOPERACAO: TFloatField
      DisplayWidth = 19
      FieldName = 'PRECOUNITOPERACAO'
      Visible = False
    end
    object cdsAnunciosCancSIGLAMOTBLOQ: TStringField
      DisplayWidth = 13
      FieldName = 'SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
    object cdsAnunciosCancGRUPO: TStringField
      FieldName = 'GRUPO'
      Visible = False
      Size = 108
    end
    object cdsAnunciosCancCOR: TStringField
      FieldName = 'COR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object sprAnunciosCanc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO AS BOLETA, PP.PLANPRVCONTABPATRO, TP.DESC' +
        'TIPOOPERACAO,                                            '
      
        '       IV.DESCINVESTIMENTO, CI.DESCCARTINVEST, MB.SIGLAMOTBLOQ, ' +
        'MB.DESCMOTBLOQ,                   '
      
        '       CAN.DATAOPERACAO,                                        ' +
        '                                  '
      
        '       OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREVISTA, OD.DAT' +
        'AEX AS DATABASE,                  '
      
        '       DECODE(OI.IDTIPOOPERACAO, -70, '#39'Comum'#39', '#39'Investimento'#39') A' +
        'S CONTA,                      '
      
        '       NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,                   ' +
        '                                  '
      
        '       NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,                  ' +
        '                                  '
      
        '       NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,                  ' +
        '                                  '
      
        '       NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,                 ' +
        '                                  '
      
        '       OI.PRECOUNITOPERACAO,                                    ' +
        '                                  '
      
        '       NVL(OI.VLROPERACAO,0) - NVL(REC.QTDEOPERACAO,0) - NVL(CAN' +
        '.QTDEOPERACAO,0) AS VLROPERACAO,  '
      
        '       (PP.PLANPRVCONTABPATRO || substr(OD.DATAEX, 0, 10) || TP.' +
        'DESCTIPOOPERACAO || OI.IDOPERACAODIREITO) AS GRUPO,             ' +
        '          '
      
        '       '#39'0'#39' AS COR                                               ' +
        '                                '
      
        'FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPO' +
        'OPERACAO TP,                      '
      
        '     INVESTIMENTO IV, CARTEIRAINVEST CI, MOTIVOBLOQUEIO MB, VWPL' +
        'ANPREVCTBPATR PP,                                      '
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO                           '
      
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                  ' +
        '                                  '
      
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                    ' +
        '                                  '
      
        '        AND OI1.IDTIPOOPERACAO IN (PI1.IDTIPOOPERDIRDIV, PI1.IDT' +
        'IPOOPERDIRDIV + 10000,            '
      
        '                                   PI1.IDTIPOOPERDIRJUR, PI1.IDT' +
        'IPOOPERDIRJUR + 10000,            '
      
        '                                   PI1.IDTIPOOPERDIRMUL, PI1.IDT' +
        'IPOOPERDIRMUL + 10000)            '
      
        '        AND (OI1.DATAOPERACAO <= TO_DATE('#39'01/09/2006'#39', '#39'DD/MM/YY' +
        'YY'#39')) '
      
        '      GROUP BY IDOPERACAOORIGEM) REC,                           ' +
        '                                  '
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO, OI1.DATAOPERACAO         '
      
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                  ' +
        '                                  '
      
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                    ' +
        '                                  '
      
        '        AND OI1.IDTIPOOPERACAO IN (-170, -10170)                ' +
        '                                  '
      
        '        AND (OI1.DATAOPERACAO BETWEEN TO_DATE('#39'01/09/2006'#39', '#39'DD/' +
        'MM/YYYY'#39') AND  '
      
        '                                      TO_DATE('#39'01/09/2006'#39', '#39'DD/' +
        'MM/YYYY'#39')) '
      
        '      GROUP BY OI1.IDOPERACAOORIGEM, OI1.DATAOPERACAO) CAN      ' +
        '                                  '
      
        'WHERE OI.IDCARTEIRAGERENC IS NULL                               ' +
        '                                  '
      
        '  AND OI.IDTIPOOPERACAO IN (-70, -10070)                        ' +
        '                                  '
      
        '  AND OI.ORIGDEST IS NOT NULL                                   ' +
        '                                    '
      
        '  AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERDI' +
        'RJUR, PI.IDTIPOOPERDIRMUL)        '
      
        '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO               ' +
        '                                  '
      
        '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                     ' +
        '                                  '
      
        '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO                     ' +
        '                                  '
      
        '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST                 ' +
        '                                  '
      
        '  AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)              ' +
        '                                  '
      '  AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)  '
      
        '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR               ' +
        '                              '
      
        '  AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM                ' +
        '                                  '
      
        'ORDER BY PP.PLANPRVCONTABPATRO, OD.DATAEX, TP.DESCTIPOOPERACAO, ' +
        'OI.IDOPERACAODIREITO, OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO '
      ' ')
    Left = 685
    Top = 169
  end
  object CdsTipoOperacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 681
    Top = 68
  end
  object cdsTotais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 232
    object cdsTotaisBOLETA: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object cdsTotaisDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object cdsTotaisDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object cdsTotaisDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object cdsTotaisSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object cdsTotaisDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object cdsTotaisDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object cdsTotaisDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object cdsTotaisDATAPREVISTA: TDateTimeField
      FieldName = 'DATAPREVISTA'
    end
    object cdsTotaisDATABASE: TDateTimeField
      FieldName = 'DATABASE'
    end
    object cdsTotaisCONTA: TStringField
      FieldName = 'CONTA'
      Size = 12
    end
    object cdsTotaisQTDPREVISTA: TFloatField
      FieldName = 'QTDPREVISTA'
    end
    object cdsTotaisVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object cdsTotaisQTDRECEBIDA: TFloatField
      FieldName = 'QTDRECEBIDA'
    end
    object cdsTotaisQTDCANCELADA: TFloatField
      FieldName = 'QTDCANCELADA'
    end
    object cdsTotaisPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object cdsTotaisVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object cdsTotaisGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 108
    end
  end
  object cdsPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 57
  end
  object cdsSegmentacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 297
  end
end
