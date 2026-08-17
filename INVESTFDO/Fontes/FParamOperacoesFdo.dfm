inherited frmParamOperacoesFdo: TfrmParamOperacoesFdo
  Left = 193
  Top = 126
  Caption = 'Consulta'
  ClientHeight = 299
  ClientWidth = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 431
    Height = 260
    inherited bvlSepTit: TBevel
      Width = 429
    end
    inherited pnlTitulo: TPanel
      Width = 429
      inherited lbNomDescricao: TfcLabel
        Width = 404
        Caption = 'Operações de Fundos de Investimentos'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 429
      Height = 214
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object lblDtaIni: TLabel
        Left = 18
        Top = 18
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object lblDtaFinal: TLabel
        Left = 159
        Top = 18
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object lblPlanoPatro: TLabel
        Left = 18
        Top = 65
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object lblFundoInvest: TLabel
        Left = 18
        Top = 109
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object lblTipoOper: TLabel
        Left = 18
        Top = 153
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object dbdDtaIni: TCMDateTimePicker
        Left = 18
        Top = 36
        Width = 130
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
      object dbDtaFinal: TCMDateTimePicker
        Left = 159
        Top = 36
        Width = 130
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
      object dblPlanoPatro: TwwDBLookupCombo
        Left = 18
        Top = 81
        Width = 356
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblFundoInvest: TwwDBLookupCombo
        Left = 18
        Top = 125
        Width = 356
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = qryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblTipoOper: TwwDBLookupCombo
        Left = 18
        Top = 169
        Width = 356
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Operação'#9'F')
        LookupTable = qryTipoOper
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 259
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 90
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      '  '#39'NULL'#39' AS DATAREFERENCIA'
      ''
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TPF'
      ''
      'WHERE'
      ''
      '  FUN.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST AND'
      
        '  (((:IDTIPOINVEST <> 0) AND (TPF.IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '    (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 64
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
    object qryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryFundoInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryFundoInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryFundoInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryFundoInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryFundoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryFundoInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qryFundoInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object qryFundoInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object qryFundoInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object qryFundoInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object qryFundoInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object qryFundoInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object qryFundoInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object qryFundoInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object qryFundoInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object qryFundoInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object qryFundoInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object qryFundoInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qryFundoInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object qryFundoInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object qryFundoInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryFundoInvestDATAREFERENCIA: TStringField
      FieldName = 'DATAREFERENCIA'
      Visible = False
      Size = 4
    end
  end
  object qryTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' *'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST = :IDTIPOINVESTUSU) AND'
      '   ((NATUREZAOPERACAO = '#39'R'#39') OR (IDTIPOOPERACAO = -43))'
      'ORDER BY'
      '  DESCTIPOOPERACAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVESTUSU'
        ParamType = ptUnknown
      end>
    object qryTipoOperDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryTipoOperCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
    object qryTipoOperNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object qryTipoOperFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
      Visible = False
    end
    object qryTipoOperFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperTIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperTIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperSTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryPlanoPatro: TwwQuery
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
    Left = 359
    Top = 160
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
