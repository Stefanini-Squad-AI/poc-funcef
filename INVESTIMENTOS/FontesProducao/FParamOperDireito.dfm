inherited frmParamOperDireito: TfrmParamOperDireito
  Left = 461
  Top = 228
  Caption = 'Operações de Direito'
  ClientHeight = 275
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 236
    object Label2: TLabel
      Left = 40
      Top = 100
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object Label1: TLabel
      Left = 38
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object Label5: TLabel
      Left = 39
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Status'
    end
    object dblEmissor: TwwDBLookupCombo
      Left = 38
      Top = 28
      Width = 251
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAEMISSOR'#9'15'#9'Emissor')
      LookupTable = qryEmissor
      LookupField = 'IDEMISSOR'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblTipoOperacao: TwwDBLookupCombo
      Left = 40
      Top = 116
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação')
      LookupTable = qryTipoOperacao
      LookupField = 'IDTIPOOPERACAO'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object GroupBox1: TGroupBox
      Left = 40
      Top = 151
      Width = 249
      Height = 57
      Caption = 'Período'
      TabOrder = 3
      object Label3: TLabel
        Left = 16
        Top = 13
        Width = 17
        Height = 13
        Caption = 'De'
      end
      object Label4: TLabel
        Left = 136
        Top = 13
        Width = 20
        Height = 13
        Caption = 'Até'
      end
      object dbdInicio: TCMDateTimePicker
        Left = 16
        Top = 29
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
      object dbdFim: TCMDateTimePicker
        Left = 136
        Top = 29
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
    end
    object cbxStatus: TwwDBComboBox
      Left = 39
      Top = 72
      Width = 250
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = True
      AutoDropDown = True
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Efetuado'#9'S'
        'Não Efetuado'#9'N')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '
      '   IDTIPOOPERACAO,'
      '   DESCTIPOOPERACAO'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '    IDTIPOINVEST = 2  AND'
      '    FLGOPDIREITO = '#39'S'#39
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 52
    Top = 72
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDEMISSOR,'
      '  SIGLAEMISSOR'
      'FROM'
      '  EMISSOR'
      'ORDER BY'
      '  SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 52
    Top = 24
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryBuscaSaldosOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DtmRelatorio.dtsOperDireito
    SQL.Strings = (
      'SELECT'
      '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRAINVEST) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (IDCUSTODIANTE =:IDCUSTODIANTE) AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE' +
        ' IS NULL)) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE' +
        ') AND'
      
        '        '#9'          (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) A' +
        'ND'
      
        '                        ((H2.DATAMOVCUSTOD  <  :DATAEX) OR      ' +
        '   '
      
        '                        ((H2.DATAMOVCUSTOD  =  :DATAEX) AND     ' +
        '          '
      
        '                        (H2.IDCUSTODIA    <  :IDCUSTODIANTE)))))' +
        ' AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O) AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE)' +
        ' AND'
      #9'         (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                         (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD)' +
        ' AND '
      '                         ((H3.DATAMOVCUSTOD < :DATAEX) OR'
      
        '                          (H3.IDCUSTODIA    <  :IDCUSTODIANTE)))' +
        ') '
      'ORDER BY'
      '   DATAMOVCUSTOD DESC, IDCUSTODIA DESC')
    ValidateWithMask = True
    Left = 141
    Top = 28
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
    object qryBuscaSaldosOrigemIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object qryBuscaSaldosOrigemSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qryBuscaSaldosOrigemSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
  end
  object qryAcoesxBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   QTDELOTE'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE'
      '   IDACAO = :IDINVESTIMENTO')
    ValidateWithMask = True
    Left = 125
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryAcoesxBolsaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'BASEDADOS.ACOESXBOLSA.QTDELOTE'
    end
  end
  object qryInvestSaldo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM OPERACAOINVEST'
      'WHERE IDINVESTIMENTO IN (:IDINVESTIMENTO)AND'
      'IDTIPOOPERACAO = 29'
      'ORDER BY IDOPERACAODIREITO'
      '  ')
    ValidateWithMask = True
    Left = 92
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryInvestSaldoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryInvestSaldoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryInvestSaldoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInvestSaldoIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryInvestSaldoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryInvestSaldoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryInvestSaldoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryInvestSaldoIDINVESTDEST: TFloatField
      FieldName = 'IDINVESTDEST'
    end
    object qryInvestSaldoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryInvestSaldoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryInvestSaldoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryInvestSaldoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryInvestSaldoIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object qryInvestSaldoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryInvestSaldoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryInvestSaldoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryInvestSaldoPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryInvestSaldoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryInvestSaldoDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryInvestSaldoVLROPERACAOOM: TFloatField
      FieldName = 'VLROPERACAOOM'
    end
    object qryInvestSaldoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryInvestSaldoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryInvestSaldoIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object qryInvestSaldoIDCARTORIDEST: TFloatField
      FieldName = 'IDCARTORIDEST'
    end
    object qryInvestSaldoFLGCUSTODIA: TStringField
      FieldName = 'FLGCUSTODIA'
      Size = 1
    end
    object qryInvestSaldoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryInvestSaldoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryInvestSaldoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryInvestSaldoDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object qryInvestSaldoDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object qryInvestSaldoDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryInvestSaldoINVORIGEM: TFloatField
      FieldName = 'INVORIGEM'
    end
    object qryInvestSaldoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryInvestSaldoPARIDADE: TFloatField
      FieldName = 'PARIDADE'
    end
    object qryInvestSaldoPRZBOLSA: TDateTimeField
      FieldName = 'PRZBOLSA'
    end
    object qryInvestSaldoPRZEMPRESA: TDateTimeField
      FieldName = 'PRZEMPRESA'
    end
    object qryInvestSaldoATADECISAO: TDateTimeField
      FieldName = 'ATADECISAO'
    end
    object qryInvestSaldoFORMAPAGREC: TStringField
      FieldName = 'FORMAPAGREC'
      Size = 30
    end
    object qryInvestSaldoDIVPORACAO: TFloatField
      FieldName = 'DIVPORACAO'
    end
    object qryInvestSaldoINIPAGTO: TDateTimeField
      FieldName = 'INIPAGTO'
    end
    object qryInvestSaldoJUROSCAP: TStringField
      FieldName = 'JUROSCAP'
      Size = 1
    end
    object qryInvestSaldoIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
    end
    object qryInvestSaldoIDCUSTDEST: TFloatField
      FieldName = 'IDCUSTDEST'
    end
    object qryInvestSaldoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryInvestSaldoFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Size = 1
    end
    object qryInvestSaldoFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Size = 1
    end
    object qryInvestSaldoIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
    end
    object qryInvestSaldoDATALIQOPER: TDateTimeField
      FieldName = 'DATALIQOPER'
    end
    object qryInvestSaldoVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryInvestSaldoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
  end
end
