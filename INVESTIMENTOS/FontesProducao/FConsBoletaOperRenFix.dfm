inherited frmConsBoletaOperRenFix: TfrmConsBoletaOperRenFix
  Left = 222
  Top = 127
  HelpContext = 790526
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 324
  ClientWidth = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 285
    inherited bvlSepTit: TBevel
      Width = 356
    end
    object Label3: TLabel [1]
      Left = 20
      Top = 216
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label4: TLabel [2]
      Left = 20
      Top = 176
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object Label5: TLabel [3]
      Left = 21
      Top = 96
      Width = 126
      Height = 13
      Caption = 'Plano / Patrocinadora'
    end
    object Label1: TLabel [4]
      Left = 21
      Top = 56
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label2: TLabel [5]
      Left = 176
      Top = 80
      Width = 8
      Height = 13
      Caption = 'a'
    end
    object lblClasseTit: TLabel [6]
      Left = 21
      Top = 137
      Width = 94
      Height = 13
      Caption = 'Classe do Título'
    end
    inherited pnlTitulo: TPanel
      Width = 356
      TabOrder = 2
      inherited lbNomDescricao: TfcLabel
        Width = 211
        Caption = 'Boletas de Operação'
      end
    end
    object dblkEmissor: TwwDBLookupCombo
      Left = 20
      Top = 192
      Width = 319
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
      LookupTable = qryEmissor
      LookupField = 'IDEMISSOR'
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkEmissorCloseUp
      OnExit = dblkEmissorExit
    end
    object dblPlanPrevCtbPatr: TwwDBLookupCombo
      Left = 20
      Top = 112
      Width = 319
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora'#9'F')
      LookupTable = qryPlanPrevCtbPatr
      LookupField = 'IDPLANPREVCTBPATR'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblPlanPrevCtbPatrCloseUp
      OnExit = dblPlanPrevCtbPatrExit
    end
    object dtDataInicio: TCMDateTimePicker
      Left = 20
      Top = 72
      Width = 135
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
      OnExit = dtDataInicioExit
    end
    object dtDataFim: TCMDateTimePicker
      Left = 205
      Top = 72
      Width = 133
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
      OnExit = dtDataFimExit
    end
    object dblkClasseTit: TwwDBLookupCombo
      Left = 20
      Top = 152
      Width = 319
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCLASSETIT'#9'30'#9'Classe do Título'#9'F')
      LookupTable = qryClasseTit
      LookupField = 'IDCLASSETIT'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkClasseTitCloseUp
      OnExit = dblkClasseTitExit
    end
    object dblkInvestimento: TwwDBLookupCombo
      Left = 20
      Top = 230
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Investimento'#9'F'
        'QTDEOPERACAO'#9'10'#9'Quantidade'#9'F'
        'PUOPERACAO'#9'10'#9'PU Operação'#9'F'
        'VLROPERACAO'#9'10'#9'Valor Operação'#9'F'
        'VENCOPERACAO'#9'18'#9'Vencimento'#9'F'
        'BOLETA'#9'20'#9'Boleta'#9'F')
      LookupTable = qryInvestimento
      LookupField = 'IDOPERRENFIXAPLIC'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 5
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 193
      inherited sep1: TToolbarSep97
        Left = 246
      end
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnSair: TBitBtn
        Left = 81
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        TabOrder = 2
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 0
        OnClick = bbtnImprimirClick
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
      Left = 0
      DockPos = 24
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 59
    Top = 11
  end
  object qryPlanPrevCtbPatr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO,'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 193
    Top = 99
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanPrevCtbPatrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanPrevCtbPatrIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT (IV.DESCINVESTIMENTO || '#39' - '#39' || OP.DATAOPERACAO) AS DESC' +
        'INVESTIMENTO,'
      
        '       OP.QTDEOPERACAO, OP.PUOPERACAO, OP.VLROPERACAO, OP.VENCOP' +
        'ERACAO,'
      '       OP.IDOPERRENFIXAPLIC, OP.IDINVESTIMENTO, OP.BOLETA'
      'FROM  OPERRENFIX OP,'
      '      (SELECT IV1.IDINVESTIMENTO, IV1.DESCINVESTIMENTO'
      '       FROM INVESTIMENTO IV1'
      '       WHERE (IV1.IDTIPOINVEST = 1)'
      
        '         AND ((:IDEMISSOR IS NULL) OR  (IV1.IDEMISSOR = :IDEMISS' +
        'OR))'
      
        '         AND ((:IDCLASSETIT IS NULL) OR (IV1.IDCLASSETIT = :IDCL' +
        'ASSETIT))) IV'
      'WHERE OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      
        '  AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND' +
        ' TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        'ORDER BY IV.DESCINVESTIMENTO, OP.DATAOPERACAO, OP.IDOPERRENFIXAP' +
        'LIC'
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
      ' ')
    ValidateWithMask = True
    Left = 193
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 71
    end
    object qryInvestimentoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEOPERACAO'
    end
    object qryInvestimentoPUOPERACAO: TFloatField
      DisplayLabel = 'PU Operação'
      DisplayWidth = 10
      FieldName = 'PUOPERACAO'
    end
    object qryInvestimentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Operação'
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
    end
    object qryInvestimentoVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'VENCOPERACAO'
    end
    object qryInvestimentoBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 20
      FieldName = 'BOLETA'
      Size = 30
    end
    object qryInvestimentoIDOPERRENFIXAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERRENFIXAPLIC'
      Visible = False
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE EM.IDEMISSOR = IV.IDEMISSOR AND'
      '      IV.IDTIPOINVEST = 1'
      'ORDER BY SIGLAEMISSOR'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 193
    Top = 59
    object qryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.IDEMISSOR'
    end
    object qryEmissorSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
  end
  object qryClasseTit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCLASSETIT, DESCCLASSETIT'
      'FROM CLASSETITRENFIX'
      'WHERE (FLGATIVA = '#39'S'#39') OR (FLGATIVA IS NULL)'
      'ORDER BY DESCCLASSETIT'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 84
    Top = 99
    object qryClasseTitIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
    end
    object qryClasseTitDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
  end
end
