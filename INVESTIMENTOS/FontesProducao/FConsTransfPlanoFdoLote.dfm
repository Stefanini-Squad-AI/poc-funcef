inherited FrmConsTransfPlanoFdoLote: TFrmConsTransfPlanoFdoLote
  Left = 232
  Top = 280
  HelpContext = 790506
  Caption = 'Consulta'
  ClientHeight = 513
  ClientWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 474
    inherited bvlSepTit: TBevel
      Width = 775
    end
    inherited pnlTitulo: TPanel
      Width = 775
      inherited lbNomDescricao: TfcLabel
        Width = 489
        Caption = 'Transferências entre Planos por Lote de Fundos'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 775
      Height = 88
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object lblPlanoPatroOrigem: TLabel
        Left = 337
        Top = 6
        Width = 187
        Height = 13
        Caption = 'Plano / Patrocinadora de Origem'
      end
      object lblFundo: TLabel
        Left = 117
        Top = 48
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object lblClasse: TLabel
        Left = 117
        Top = 6
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
      end
      object lblTipoCota: TLabel
        Left = 595
        Top = 48
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
        Visible = False
      end
      object Label6: TLabel
        Left = 7
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label8: TLabel
        Left = 7
        Top = 48
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object dblkPlanPatroOrig: TwwDBLookupCombo
        Left = 337
        Top = 20
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = QryPlanoPatroOrigem
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkFundoInvest: TwwDBLookupCombo
        Left = 117
        Top = 62
        Width = 470
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'DESCFUNDOINVEST'#9'F')
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkTipoFundo: TwwDBLookupCombo
        Left = 117
        Top = 20
        Width = 216
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'DESCTIPOFUNDOINV'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblkTipoFundoExit
      end
      object dblkTipoCota: TwwDBLookupCombo
        Left = 595
        Top = 62
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'20'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loColLines, loRowLines]
        TabOrder = 5
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object edDataIni: TCMDateTimePicker
        Left = 7
        Top = 20
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
        Left = 7
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
    end
    object Panel1: TPanel
      Left = 1
      Top = 133
      Width = 775
      Height = 340
      Align = alClient
      TabOrder = 2
      object dbGrd: TwwDBGrid
        Left = 1
        Top = 1
        Width = 773
        Height = 338
        Selected.Strings = (
          'DATAOPERACAO'#9'10'#9'Data da Operação'
          'IDLOTE'#9'10'#9'Lote'
          'DESCFUNDOINVEST'#9'35'#9'Fundo de Investimentos'
          'PLANOPATROORIG'#9'29'#9'Plano Origem'
          'PLANOPATRODEST'#9'29'#9'Plano Destino'
          'DATAAPLICACAO'#9'10'#9'Data de Aplicação'
          'QTDOPERACAO'#9'22'#9'Quantidade Transf.'
          'VLROPERACAO'#9'18'#9'Valor Transf.'
          'PERCENTUAL'#9'12'#9'%'
          'DESCTIPOFUNDOINV'#9'40'#9'Tipo de Fundo'
          'DESCTIPOCOTA'#9'30'#9'Tipo de Cota')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmTransfPlanoLoteFDO.DsTransfPlanoLoteFDO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
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
    Top = 474
    Width = 777
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
    Left = 723
    Top = 3
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object QryTipoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOCOTA, IDTIPOCOTA FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA')
    ValidateWithMask = True
    Left = 314
    Top = 156
  end
  object QryPlanoPatroOrigem: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
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
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 402
    Top = 157
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM   TIPOFUNDOINVEST'
      'WHERE'
      '    (IDTIPOFUNDOINVEST > 0)'
      'AND (IDTIPOINVEST      = :IDTIPOINVEST)'
      ''
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 197
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object QryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.MOECODIGO ' +
        '        , FUN.IDCARTEIRAINVEST  ,'
      
        '  FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO         , FUN.STAEXCLUSI' +
        'VO      , FUN.PZOCARENCIA       ,'
      
        '  FUN.PZOCOTAPLIC       , FUN.PZOCOTRESG        , FUN.PZOLIQAPLI' +
        'C       , FUN.PZOLIQRESG        ,'
      
        '  FUN.PZOANIVERSARIO    , FUN.QTDDECQTD         , FUN.QTDDECVALO' +
        'R       , FUN.STAFUNDO          ,'
      
        '  FUN.PZOAMORTIZACAO    , FUN.PERCTXPERFORM     , FUN.PERCTXADM ' +
        '        , FUN.CODFUNCETIP       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        , FUN.DTAINIPROC        ,'
      '  FUN.IDGESTORCARTEIRA'
      'FROM'
      ' (SELECT'
      
        '     IDFUNDOINVEST     , DESCFUNDOINVEST   , MOECODIGO         ,' +
        ' IDCARTEIRAINVEST  ,'
      
        '     IDTIPOFUNDOINVEST , CNPJFUNDO         , STAEXCLUSIVO      ,' +
        ' PZOCARENCIA       ,'
      
        '     PZOCOTAPLIC       , PZOCOTRESG        , PZOLIQAPLIC       ,' +
        ' PZOLIQRESG        ,'
      
        '     PZOANIVERSARIO    , QTDDECQTD         , QTDDECVALOR       ,' +
        ' STAFUNDO          ,'
      
        '     PZOAMORTIZACAO    , PERCTXPERFORM     , PERCTXADM         ,' +
        ' CODFUNCETIP       ,'
      
        '     STAPROVISIONAIR   , STAPROVISIONAIOF  , CONTRCETIP        ,' +
        ' DTAINIPROC        ,'
      '     IDGESTORCARTEIRA'
      '  FROM HISTFUNDOINVEST'
      
        '  WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:' +
        'MI:SS'#39') IN'
      
        '        (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/MM' +
        '/YYYY, HH24:MI:SS'#39')'
      '         FROM HISTFUNDOINVEST'
      '         WHERE   (IDFUNDOINVEST > 0)'
      
        '          AND    (DTAVIGENCIA < TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')+1' +
        ')'
      
        '          AND (((:IDTIPOFUNDOINVEST IS NULL)         AND (IDTIPO' +
        'FUNDOINVEST > 0)) OR'
      
        '               ((:IDTIPOFUNDOINVEST IS NOT NULL)     AND (IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST)))'
      '         GROUP BY IDFUNDOINVEST))) FUN,'
      '  TIPOFUNDOINVEST TFI'
      'WHERE'
      
        '     (((:IDTIPOFUNDOINVEST IS NULL)         AND (TFI.IDTIPOFUNDO' +
        'INVEST > 0)) OR'
      
        '      ((:IDTIPOFUNDOINVEST IS NOT NULL)     AND (TFI.IDTIPOFUNDO' +
        'INVEST = :IDTIPOFUNDOINVEST)))'
      'AND (TFI.IDTIPOINVEST      = :IDTIPOINVEST)'
      'AND (FUN.IDFUNDOINVEST     > 0)'
      'AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 243
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOFUNDOINVEST, IDTIPOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM   TIPOFUNDOINVEST'
      'WHERE'
      '    (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)'
      'AND (IDTIPOINVEST      = :IDTIPOINVEST)'
      ''
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 666
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
end
