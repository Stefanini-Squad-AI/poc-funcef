inherited FrmConsSldQtdCotasInteg: TFrmConsSldQtdCotasInteg
  Left = 216
  Top = 173
  HelpContext = 790518
  Caption = 'Consulta'
  ClientHeight = 435
  ClientWidth = 776
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 776
    Height = 396
    inherited bvlSepTit: TBevel
      Width = 774
    end
    inherited pnlTitulo: TPanel
      Width = 774
      inherited lbNomDescricao: TfcLabel
        Width = 441
        Caption = 'Saldo da Quantidade de Cotas a Integralizar'
      end
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 774
      Height = 92
      Align = alTop
      TabOrder = 1
      object LblDtaRef: TLabel
        Left = 14
        Top = 7
        Width = 74
        Height = 13
        Caption = 'Data de Ref.'
      end
      object lbTipoFundo: TLabel
        Left = 467
        Top = 7
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFundoInvest: TLabel
        Left = 14
        Top = 49
        Width = 136
        Height = 13
        Caption = 'Fundo de Investimentos'
      end
      object lbTipoCota: TLabel
        Left = 467
        Top = 49
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
        Visible = False
      end
      object lblPlanoPatro: TLabel
        Left = 115
        Top = 7
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
        FocusControl = dblPlanPrevCtbPatr
      end
      object dDataRef: TCMDateTimePicker
        Left = 14
        Top = 22
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
        OnExit = dDataRefExit
      end
      object dblTipoFundo: TwwDBLookupCombo
        Left = 467
        Top = 22
        Width = 253
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblTipoFundoExit
      end
      object dblFundoInvest: TwwDBLookupCombo
        Left = 14
        Top = 64
        Width = 443
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblTipoCota: TwwDBLookupCombo
        Left = 467
        Top = 64
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'20'#9'Tipo de Cota'#9'F')
        DataField = 'IDTIPOCOTA'
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 4
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 115
        Top = 22
        Width = 342
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object DbGMovFdoNormal: TwwDBGrid
      Left = 1
      Top = 137
      Width = 774
      Height = 258
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clWhite
      DataSource = DmRelSldQtdCotasInteg.DsSldQtdCotasIntegAn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DbGMovFdoNormalCalcCellColors
      IndicatorColor = icYellow
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 556
      DockPos = 556
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 302
      DockPos = 302
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 11
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOFUNDOINVEST,'
      '   IDTIPOINVEST,'
      '   DESCTIPOFUNDOINV,'
      '   DATAULTFECH'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0)) '
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 382
    Top = 219
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryTipoFundoDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
  end
  object QryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.STAEXCLUSI' +
        'VO      ,'
      
        '  FUN.PZOCARENCIA       , FUN.PZOANIVERSARIO    , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.STAPROVISI' +
        'ONAIR   ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.DTAINIPROC        , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      '  TFI.IDTIPOINVEST'
      'FROM'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY' +
        #39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,'
      '  TIPOFUNDOINVEST TFI'
      'WHERE'
      '      (((:IDTIPOFUNDOINVEST IS NOT NULL)      AND'
      '     (TFI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST ))  OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )'
      '  AND TFI.IDTIPOINVEST      =:IDTIPOINVEST'
      '  AND FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST'
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
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
      ' ')
    ValidateWithMask = True
    Left = 305
    Top = 219
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryFundoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryFundoInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Visible = False
    end
    object QryFundoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryFundoInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object QryFundoInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDTIPOCOTA,'
      '     DESCTIPOCOTA'
      'FROM'
      '     TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ' ')
    ValidateWithMask = True
    Left = 219
    Top = 219
    object QryTipoCotaDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object QryTipoCotaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 121
    Top = 218
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
end
