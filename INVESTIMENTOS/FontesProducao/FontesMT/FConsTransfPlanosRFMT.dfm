inherited frmConsTransfPlanosRFMT: TfrmConsTransfPlanosRFMT
  Left = 188
  Top = 231
  HelpContext = 790532
  Caption = 'frmConsTransfPlanosRFMT'
  ClientHeight = 558
  ClientWidth = 884
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 884
    Height = 519
    inherited bvlSepTit: TBevel
      Width = 882
    end
    inherited pnlTitulo: TPanel
      Width = 882
      inherited lbNomDescricao: TfcLabel
        Width = 272
        Caption = 'Transferência entre Planos'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 882
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
      object lblPlanoPatroOrigem: TLabel
        Left = 128
        Top = 8
        Width = 187
        Height = 13
        Caption = 'Plano / Patrocinadora de Origem'
      end
      object lblInvestimento: TLabel
        Left = 128
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblClasse: TLabel
        Left = 376
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Classe'
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
        Top = 63
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
      end
      object dblkPlanPatroO: TwwDBLookupCombo
        Left = 128
        Top = 23
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPatroO
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 128
        Top = 63
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
        LookupTable = cdsInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkClasseTit: TwwDBLookupCombo
        Left = 376
        Top = 23
        Width = 240
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Classe'#9'F')
        LookupTable = CdsClasseTit
        LookupField = 'IDCLASSETIT'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 137
      Width = 882
      Height = 381
      Align = alClient
      TabOrder = 2
      object grdConsulta: TwwDBGrid
        Left = 1
        Top = 1
        Width = 880
        Height = 379
        Selected.Strings = (
          'DATAOPERACAO'#9'11'#9'Data'
          'BOLETA'#9'13'#9'Boleta'
          'PLANOPATROORIG'#9'40'#9'Plano de Origem'
          'PLANOPATRODEST'#9'40'#9'Plano de Destino'
          'DESCCLASSETIT'#9'40'#9'Classe'
          'DESCINVESTIMENTO'#9'40'#9'Investimento'
          'QTDEOPERACAO'#9'20'#9'Quantidade Transferida'
          'PERCTRANSF'#9'10'#9'Percentual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsConsTransPlanosRFMT
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
  end
  inherited Dock971: TDock97
    Top = 519
    Width = 884
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
  object cdsPlanoPatroO: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 180
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 124
  end
  object dsConsTransPlanosRFMT: TDataSource
    DataSet = CdsConsTransPlanosRFMT
    Left = 496
    Top = 400
  end
  object CdsConsTransPlanosRFMT: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 344
    object CdsConsTransPlanosRFMTDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
    end
    object CdsConsTransPlanosRFMTBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 13
      FieldName = 'BOLETA'
      Size = 30
    end
    object CdsConsTransPlanosRFMTPLANOPATROORIG: TStringField
      DisplayLabel = 'Plano de Origem'
      DisplayWidth = 40
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object CdsConsTransPlanosRFMTPLANOPATRODEST: TStringField
      DisplayLabel = 'Plano de Destino'
      DisplayWidth = 40
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object CdsConsTransPlanosRFMTDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 40
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object CdsConsTransPlanosRFMTDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsConsTransPlanosRFMTQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade Transferida'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '#,##0.000000000'
    end
    object CdsConsTransPlanosRFMTPERCTRANSF: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCTRANSF'
      DisplayFormat = '#,##.00'
    end
    object CdsConsTransPlanosRFMTVENCOPERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'VENCOPERACAO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object CdsConsTransPlanosRFMTVLROPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      Visible = False
    end
    object CdsConsTransPlanosRFMTIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object CdsConsTransPlanosRFMTIDPLANPREVCTBPATR_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR_1'
      Visible = False
    end
    object CdsConsTransPlanosRFMTIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object CdsConsTransPlanosRFMTIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object sprConsTransPlanosRFMT: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OP.BOLETA, PPO.PLANOPATROORIG, PPD.PLANOPATRODEST, CL.DES' +
        'CCLASSETIT, IV.DESCINVESTIMENTO,'
      
        '       OP.DATAOPERACAO, OP.VENCOPERACAO, OP.QTDEOPERACAO, OP.VLR' +
        'OPERACAO, '
      
        '       PPO.IDPLANPREVCTBPATR, PPD.IDPLANPREVCTBPATR, IV.IDCLASSE' +
        'TIT, OP.IDINVESTIMENTO, op.PERCTRANSF '
      
        'FROM OPERRENFIX OP, OPERRENFIX OD, INVESTIMENTO IV, CLASSETITREN' +
        'FIX CL, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.I' +
        'DPLANPREVCTBPATR '
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L '
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) '
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.I' +
        'DPLANPREVCTBPATR '
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L '
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) '
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD '
      
        'WHERE OP.DATAOPERACAO BETWEEN TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39')' +
        ' AND TO_DATE('#39'30/11/2006'#39','#39'DD/MM/YYYY'#39') '
      '  AND OP.IDTIPOOPERACAO = -97 '
      '  AND OP.BOLETA = OD.BOLETA '
      '  AND OD.IDTIPOOPERACAO <> -97 '
      '  AND OD.IDOPERRENFIXORIG = OP.IDOPERRENFIXAPLIC '
      '  AND OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR '
      '  AND OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATR '
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO '
      '  AND IV.IDCLASSETIT = CL.IDCLASSETIT '
      'ORDER BY OP.DATAOPERACAO, OP.BOLETA'
      ' ')
    ClientDataSet = CdsConsTransPlanosRFMT
    Left = 496
    Top = 288
  end
  object CdsClasseTit: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 229
  end
end
