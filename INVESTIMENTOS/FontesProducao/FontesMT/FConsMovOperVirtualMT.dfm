inherited FrmConsMovOperVirtualMT: TFrmConsMovOperVirtualMT
  Left = 187
  Top = 176
  HelpContext = 790569
  Caption = 'Consulta'
  ClientHeight = 421
  ClientWidth = 770
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 770
    Height = 382
    inherited bvlSepTit: TBevel
      Width = 768
    end
    inherited pnlTitulo: TPanel
      Width = 768
      inherited lbNomDescricao: TfcLabel
        Width = 524
        Caption = 'Movimentação das Operações da Carteira Gerencial'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 768
      Height = 92
      Align = alTop
      TabOrder = 1
      object Label6: TLabel
        Left = 14
        Top = 10
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label8: TLabel
        Left = 14
        Top = 48
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label2: TLabel
        Left = 133
        Top = 10
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label1: TLabel
        Left = 444
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label3: TLabel
        Left = 133
        Top = 48
        Width = 118
        Height = 13
        Caption = 'Plano/Patrocinadora'
      end
      object edDataIni: TCMDateTimePicker
        Left = 14
        Top = 24
        Width = 105
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
        Left = 14
        Top = 62
        Width = 105
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
        OnExit = edDataFimExit
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 133
        Top = 24
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos ')
        LookupTable = cdsCarteira
        LookupField = 'IDCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 444
        Top = 62
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
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 133
        Top = 62
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 137
      Width = 768
      Height = 244
      Align = alClient
      TabOrder = 2
      object grdConsulta: TwwDBGrid
        Left = 1
        Top = 1
        Width = 766
        Height = 242
        Selected.Strings = (
          'DATAHISTCAIXA'#9'10'#9'Data '
          'PLANPRVCONTABPATRO'#9'30'#9'Plano/Patrocinadora'
          'DESCCARTGERENC'#9'28'#9'Carteira Gerencial'
          'DESCTIPOOPERACAO'#9'24'#9'Tipo de Operação'
          'DESCINVESTIMENTO'#9'21'#9'Investimento'
          'VLRHISTCAIXA'#9'18'#9'Valor'
          'PRECOUNITOPERACAO'#9'18'#9'PU'
          'QTDEOPERACAO'#9'18'#9'Quatidade')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsMovOperVirtual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 770
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
    Left = 715
    Top = 3
  end
  object cdsCarteira: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 321
    Top = 269
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 321
    Top = 324
  end
  object cdsMovOperVirtual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 160
    object cdsMovOperVirtualDATAHISTCAIXA: TDateTimeField
      DisplayLabel = 'Data '
      DisplayWidth = 10
      FieldName = 'DATAHISTCAIXA'
    end
    object cdsMovOperVirtualPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object cdsMovOperVirtualDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira Gerencial'
      DisplayWidth = 28
      FieldName = 'DESCCARTGERENC'
      Size = 40
    end
    object cdsMovOperVirtualDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 24
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object cdsMovOperVirtualDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object cdsMovOperVirtualVLRHISTCAIXA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLRHISTCAIXA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object cdsMovOperVirtualPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 18
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###,#########0.000000000'
    end
    object cdsMovOperVirtualQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quatidade'
      DisplayWidth = 18
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###'
    end
    object cdsMovOperVirtualDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 19
      FieldName = 'DESCCAIXACOTA'
      Visible = False
      Size = 40
    end
  end
  object dsMovOperVirtual: TDataSource
    DataSet = cdsMovOperVirtual
    Left = 416
    Top = 160
  end
  object cdsEvCaixaCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 321
    Top = 213
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OP.DATAHISTCAIXA, OP.DESCTIPOOPERACAO, OP.DESCCAIXACOTA, ' +
        'OP.DESCCARTGERENC, OP.DESCINVESTIMENTO,'
      
        '       OP.QTDEOPERACAO, OP.PRECOUNITOPERACAO, OP.VLRHISTCAIXA, P' +
        'L.PLANPRVCONTABPATRO'
      
        'FROM ( (SELECT OI.DATAOPERACAO AS DATAHISTCAIXA, TP.DESCTIPOOPER' +
        'ACAO, EC.DESCCAIXACOTA,'
      
        '       CG.DESCCARTGERENC, IV.DESCINVESTIMENTO, OI.QTDEOPERACAO, ' +
        'OI.PRECOUNITOPERACAO,'
      '       OI.VLROPERACAO AS VLRHISTCAIXA, OI.IDPLANPREVCTBPATR'
      
        '       FROM OPERACAOINVEST OI, INVESTIMENTO IV, CARTEIRAGERENC C' +
        'G, TIPOOPERACAO TP, EVENTOCAIXACOTA  EC'
      
        '       WHERE OI.DATAOPERACAO BETWEEN TO_DATE('#39'01/11/2005'#39', '#39'DD/M' +
        'M/YYYY'#39') AND'
      
        '                                     TO_DATE('#39'01/12/2005'#39', '#39'DD/M' +
        'M/YYYY'#39')'
      '      AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      '      AND OI.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC'
      '      AND OI.IDTIPOINVEST          = TP.IDTIPOINVEST'
      '      AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '      AND OI.IDTIPOINVEST          = EC.IDTIPOINVEST(+)'
      '      AND OI.IDTIPOOPERACAO    = EC.IDTIPOOPERACAO(+)'
      '    )'
      '    UNION'
      
        '    (SELECT HC.DATAHISTCAIXA, TP.DESCTIPOOPERACAO, EC.DESCCAIXAC' +
        'OTA, CG.DESCCARTGERENC, '#39' '#39' AS DESCINVESTIMENTO,'
      
        '     0 AS QTDEOPERACAO, 0 AS PRECOUNITOPERACAO, HC.VLRHISTCAIXA,' +
        ' HC.IDPLANPREVCTBPATR'
      
        '     FROM  HISTCAIXA HC, CARTEIRAGERENC CG, CARTEIRAXEVENTO CE, ' +
        'TIPOOPERACAO TP, EVENTOCAIXACOTA EC'
      
        '     WHERE HC.DATAHISTCAIXA BETWEEN TO_DATE('#39'01/11/2005'#39', '#39'DD/MM' +
        '/YYYY'#39') AND'
      
        '                                    TO_DATE('#39'01/12/2005'#39', '#39'DD/MM' +
        '/YYYY'#39')'
      '      AND HC.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC'
      '      AND HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO'
      '      AND CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA'
      '      AND EC.IDTIPOINVEST          = TP.IDTIPOINVEST(+)'
      '      AND EC.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO(+)'
      '      AND HC.IDOPERACAOINVEST  NOT IN (SELECT IDOPERACAOINVEST'
      '                                       FROM OPERACAOINVEST OI'
      
        '                                       WHERE OI.IDOPERACAOINVEST' +
        ' = HC.IDOPERACAOINVEST)'
      '    )'
      ') OP,'
      '('
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ') PL'
      'WHERE'
      '   PL.IDPLANPREVCTBPATR = OP.IDPLANPREVCTBPATR'
      'ORDER BY DATAHISTCAIXA, DESCCARTGERENC, DESCCAIXACOTA'
      '')
    ClientDataSet = cdsMovOperVirtual
    Left = 417
    Top = 217
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 172
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ' ')
    ClientDataSet = cdsPlanoPrev
    Left = 601
    Top = 225
  end
end
