inherited frmProcOperBMF: TfrmProcOperBMF
  Left = 299
  Top = 179
  HelpContext = 790262
  Caption = 'Cálculo'
  ClientHeight = 238
  ClientWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 354
    Height = 199
    inherited bvlSepTit: TBevel
      Width = 352
    end
    object Label2: TLabel [1]
      Left = 18
      Top = 20
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
    end
    object Label1: TLabel [2]
      Left = 24
      Top = 70
      Width = 80
      Height = 13
      Caption = 'Processa Dia:'
    end
    inherited pnlTitulo: TPanel
      Width = 352
      TabOrder = 3
      inherited lbNomDescricao: TfcLabel
        Width = 314
        Caption = 'Processa Operações de BM&&F '
      end
    end
    object edDataRef: TCMDateTimePicker
      Left = 125
      Top = 64
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
    object ProgressBar1: TProgressBar
      Left = 24
      Top = 98
      Width = 305
      Height = 22
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 1
      Top = 167
      Width = 352
      Height = 31
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object Label10: TLabel
        Left = 16
        Top = 6
        Width = 6
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DkBtCancelaRubrica: TPanel
        Left = 405
        Top = 1
        Width = 167
        Height = 29
        Caption = 'DkBtCancelaRubrica'
        TabOrder = 0
        Visible = False
        object BtCancelaRubrica: TSpeedButton
          Left = 2
          Top = 2
          Width = 163
          Height = 25
          Caption = 'Cancelar Rubricas'
          Glyph.Data = {
            8A050000424D8A05000000000000360400002800000011000000110000000100
            0800000000005401000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0003030303F8F8
            0303030303030303030303000000030303F90101F80303030303F9F803030300
            0000030303F9010101F8030303F90101F80303000000030303F901010101F803
            F901010101F80300000003030303F901010101F80101010101F8030000000303
            030303F90101010101010101F80303000000030303030303F9010101010101F8
            030303000000030303030303030101010101F803030303000000030303030303
            03F901010101F803030303000000030303030303F90101010101F80303030300
            00000303030303F9010101F8010101F803030300000003030303F9010101F803
            F9010101F8030300000003030303F90101F8030303F9010101F8030000000303
            030303F9010303030303F90101010300000003030303030303030303030303F9
            01F9030000000303030303030303030303030303030303000000030303030303
            0303030303030303030303000000}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 354
    inherited tb97Fundo: TToolbar97
      Left = 182
      DockPos = 201
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 13
      DockPos = 32
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 499
    Top = 163
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryVerOrdAutorizadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDORDMOVINV'
      'FROM'
      '  ORDMOVINV '
      'WHERE'
      '  (IDTIPOINVEST = 8) AND'
      '  (STATMOVINV IS NULL) AND'
      '  (DATAORDMOVINV LIKE TO_DATE(:STRDATA,'#39'DD/MM/YYYY'#39') ) ')
    ValidateWithMask = True
    Left = 197
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'STRDATA'
        ParamType = ptUnknown
      end>
    object QryVerOrdAutorizadasIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
  end
  object QryBuscaOrdem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  O.IDORDMOVINV,'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  O.QTDEORDMOVINV,'
      '  O.QTDEORDENADA,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.IDCARTEIRAINVEST,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  O.OBSMOVINV,'
      '  I.DESCINVESTIMENTO,'
      '  O.IDCARTEIRAGERENC,'
      '  O.IDPLANPREVCTBPATR'
      'FROM'
      '  ORDMOVINV O,  INVESTIMENTO I'
      'WHERE'
      '  (O.IDTIPOINVEST= 8) AND'
      '  (O.STATMOVINV = '#39'A'#39') AND'
      '  (O.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR) AND'
      '  (O.DATAORDMOVINV LIKE TO_DATE(:STRDATA,'#39'DD/MM/YYYY'#39') ) AND'
      '  (O.IDINVESTIMENTO  = I.IDINVESTIMENTO)'
      ''
      '')
    UpdateObject = updBuscaOrdem
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 202
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STRDATA'
        ParamType = ptUnknown
      end>
    object QryBuscaOrdemIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryBuscaOrdemIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBuscaOrdemPUORDMOVINV: TFloatField
      FieldName = 'PUORDMOVINV'
    end
    object QryBuscaOrdemQTDEORDMOVINV: TFloatField
      FieldName = 'QTDEORDMOVINV'
    end
    object QryBuscaOrdemQTDEORDENADA: TFloatField
      FieldName = 'QTDEORDENADA'
    end
    object QryBuscaOrdemNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
    object QryBuscaOrdemSTATMOVINV: TStringField
      FieldName = 'STATMOVINV'
      Size = 1
    end
    object QryBuscaOrdemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryBuscaOrdemIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryBuscaOrdemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaOrdemIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaOrdemIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryBuscaOrdemIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryBuscaOrdemDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaOrdemIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object QryBuscaOrdemOBSMOVINV: TStringField
      FieldName = 'OBSMOVINV'
      Size = 200
    end
    object QryBuscaOrdemIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object QryInvestimento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDMOEDACONTAB,'
      '     DESCINVESTIMENTO,'
      '     IDEMISSOR'
      'FROM '
      '     INVESTIMENTO'
      'WHERE'
      '     IDINVESTIMENTO = :IDINVESTIMENTO')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 138
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
  end
  object QryTipoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '     IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERACAO' +
        ','
      
        '     TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERACAO' +
        ','
      '     FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      'FROM '
      '     TIPOOPERACAO'
      'WHERE '
      '      IDTIPOOPERACAO = :IDTIPOOPERACAO')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 50
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object QryTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
    object QryTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
    end
    object QryTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object QryTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object QryTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'TIPOOPERACAO.FLGTRATAIR'
      Size = 1
    end
  end
  object QryInsertOperInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCORRETVALORES, MOECODIGO, IDMODULO, EMPRE' +
        'SAPROP,'
      
        '   IDINVESTIMENTO, IDCARTEIRAINVEST, IDTIPOINVEST, IDTIPOOPERACA' +
        'O, DATAOPERACAO,'
      
        '   NUMDOCUMENTO, QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, D' +
        'ATAVENCOPER, '
      
        '   IDFORCLI, IDLOTE, IDCUSTODIANTE, VLRIR, FLGSTATUSFECHBOL, FLG' +
        'STATUSORDMOV, '
      '   IDORDMOVINV,IDPLANPREVCTBPATR,IDCARTEIRAGERENC)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDCORRETVALORES, :MOECODIGO, :IDMODULO, :' +
        'EMPRESAPROP,'
      
        '   :IDINVESTIMENTO, :IDCARTEIRAINVEST, :IDTIPOINVEST, :IDTIPOOPE' +
        'RACAO,'
      
        '   :DATAOPERACAO, :NUMDOCUMENTO, :QTDEOPERACAO, :PRECOUNITOPERAC' +
        'AO, :VLROPERACAO,'
      
        '   :DATAVENCOPER, :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :VLRIR, :F' +
        'LGSTATUSFECHBOL,'
      
        '   :FLGSTATUSORDMOV, :IDORDMOVINV, :IDPLANPREVCTBPATR, :IDCARTEI' +
        'RAGERENC)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 21
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLRIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 7
    Top = 149
  end
  object QryBuscaBoletas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '       IDLOTE,DATAOPERACAO,IDINVESTIMENTO,'
      '       FLGSTATUSFECHBOL,IDFORCLI'
      'FROM '
      '       OPERACAOINVEST '
      'WHERE '
      '      (FLGSTATUSFECHBOL = '#39'L'#39' ) AND '
      '      (IDTIPOINVEST=8) AND '
      '      (DATAOPERACAO = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39' ))')
    ValidateWithMask = True
    Left = 120
    Top = 145
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object QryBuscaBoletasDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object QryBuscaBoletasIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'OPERACAOINVEST.FLGSTATUSFECHBOL'
      Size = 1
    end
    object QryBuscaBoletasIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDFORCLI'
    end
    object QryBuscaBoletasIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
  end
  object qryBuscaOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       OP.IDOPERACAOINVEST, OP.IDCUSTODIANTE,  OP.IDCORRETVALORE' +
        'S,'
      '       OP.MOECODIGO,        OP.IDMODULO,       OP.EMPRESAPROP,'
      '       OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.IDTIPOINVEST,'
      '       OP.IDTIPOOPERACAO,   OP.IDINSTFIN,      OP.DATAOPERACAO,'
      
        '       OP.NUMDOCUMENTO,     OP.QTDEOPERACAO,   OP.PRECOUNITOPERA' +
        'CAO,'
      '       OP.VLROPERACAO,      OP.DATAVENCOPER,   OP.IDFORCLI,'
      
        '       OP.IDORDMOVINV,      OP.IDLOTE,         OP.FLGSTATUSFECHB' +
        'OL,'
      '       OP.FLGSTATUSORDMOV,  OP.IDCARTEIRAGERENC,'
      '       IV.DESCINVESTIMENTO,'
      
        '       TP.DESCTIPOOPERACAO,TP.VENCIMENTO,TP.TIPCREDOR, TP.NATURE' +
        'ZAOPERACAO,TP.FLGTRATAIR,'
      
        '       PA.PESOCONTRATO,PA.VALORCONTRATO,PA.TOBN,PA.TOBD, PA.TXRE' +
        'GISTRO,'
      '       PA.TXBOLSA, PA.TOBMINN,PA.TOBMIND,'
      '       TC.DESCTIPOCTINVEST,'
      '       CT1.VLRAJUSTED0,CT2.VLRAJUSTED1,CT1.IDTIPOCONTRINVEST,'
      '       TV.DESCTPINVESTIDOR,'
      
        '       PB.DATAVIGENCIA,PB.PERCTOBN,PB.PERCTOBD,PB.PERCLIQ,PB.PER' +
        'CTXREG,'
      '       PB.PERCTXBOLSA,PB.PERCDEVN,PB.PERCDEVD,'
      '       SR.DATAVENCIMENTO,'
      '       DT1.DATA1,'
      '       DT2.DATA2'
      'FROM'
      
        '        OPERACAOINVEST OP, INVESTIMENTO IV, TIPOOPERACAO TP, PAR' +
        'AMCONTRATOBMF PA,SERIESBMF SR,'
      
        '        TIPOCONTRINVEST TC, TIPOINVESTIDOR TV, PARAMBMF PB, PARA' +
        'MINVEST PI,'
      '       (SELECT'
      '               CB1.VLRAJUSTE AS VLRAJUSTED0,'
      '               CB1.IDTIPOCONTRINVEST AS IDTIPOCONTRINVEST'
      '        FROM'
      '               COTACAOBMF CB1'
      '         WHERE'
      
        '               (CB1.DATACOTACAOBMF = TO_DATE(:dDataAtu,'#39'DD/MM/YY' +
        'YY'#39') ) AND'
      '               (CB1.IDINVESTIMENTO = :iIdInvestimento) ) CT1,'
      '       (SELECT'
      '               CB2.VLRAJUSTE AS VLRAJUSTED1'
      '        FROM'
      '               COTACAOBMF CB2'
      '         WHERE'
      
        '               (CB2.DATACOTACAOBMF = TO_DATE(:dDataAnt,'#39'DD/MM/YY' +
        'YY'#39') ) AND'
      '               (CB2.IDINVESTIMENTO = :iIdInvestimento) ) CT2,'
      
        '        (SELECT MAX(DATAVIGENCIA) AS DATA1 FROM PARAMBMF WHERE I' +
        'DTIPOINVESTIDOR = :iIdTipoInvestidor) DT1,'
      
        '        (SELECT MAX(DATAVIGENCIA) AS DATA2 FROM PARAMCONTRATOBMF' +
        ' WHERE IDTIPOCONTRINVEST = IDTIPOCONTRINVEST) DT2'
      'WHERE'
      '        (OP.FLGSTATUSFECHBOL <> '#39'P'#39') AND'
      '        (OP.IDINVESTIMENTO = :iIdInvestimento) AND'
      '        (OP.IDLOTE = :sBoleta) AND'
      
        '        (OP.DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') )  AN' +
        'D'
      '        (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '        (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '        (OP.IDINVESTIMENTO = SR.IDINVESTIMENTO) AND'
      '        (SR.IDTIPOCONTRINVEST=PA.IDTIPOCONTRINVEST)AND'
      '        (SR.IDTIPOCONTRINVEST=TC.IDTIPOCONTRINVEST) AND'
      '        (PI.IDTIPOINVESTIDOR = TV.IDTIPOINVESTIDOR) AND'
      '        (TV.IDTIPOINVESTIDOR = PB.IDTIPOINVESTIDOR) AND'
      '        (PB.DATAVIGENCIA = DT1.DATA1) AND'
      '        (PA.DATAVIGENCIA = DT2.DATA2)'
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
    Left = 47
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdTipoInvestidor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object qryBuscaOperacoesIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaOperacoesIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryBuscaOperacoesIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryBuscaOperacoesMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryBuscaOperacoesIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryBuscaOperacoesEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaOperacoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaOperacoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryBuscaOperacoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaOperacoesIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object qryBuscaOperacoesDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaOperacoesNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaOperacoesQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBuscaOperacoesPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaOperacoesVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBuscaOperacoesDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaOperacoesIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryBuscaOperacoesIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object qryBuscaOperacoesIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaOperacoesFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Size = 1
    end
    object qryBuscaOperacoesFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Size = 1
    end
    object qryBuscaOperacoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaOperacoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaOperacoesVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryBuscaOperacoesTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object qryBuscaOperacoesNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object qryBuscaOperacoesFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
    object qryBuscaOperacoesPESOCONTRATO: TFloatField
      FieldName = 'PESOCONTRATO'
    end
    object qryBuscaOperacoesVALORCONTRATO: TFloatField
      FieldName = 'VALORCONTRATO'
    end
    object qryBuscaOperacoesTOBN: TFloatField
      FieldName = 'TOBN'
    end
    object qryBuscaOperacoesTOBD: TFloatField
      FieldName = 'TOBD'
    end
    object qryBuscaOperacoesTXREGISTRO: TFloatField
      FieldName = 'TXREGISTRO'
    end
    object qryBuscaOperacoesTXBOLSA: TFloatField
      FieldName = 'TXBOLSA'
    end
    object qryBuscaOperacoesTOBMINN: TFloatField
      FieldName = 'TOBMINN'
    end
    object qryBuscaOperacoesTOBMIND: TFloatField
      FieldName = 'TOBMIND'
    end
    object qryBuscaOperacoesVLRAJUSTED1: TFloatField
      FieldName = 'VLRAJUSTED1'
    end
    object qryBuscaOperacoesDESCTIPOCTINVEST: TStringField
      FieldName = 'DESCTIPOCTINVEST'
      Size = 60
    end
    object qryBuscaOperacoesIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
    end
    object qryBuscaOperacoesDESCTPINVESTIDOR: TStringField
      FieldName = 'DESCTPINVESTIDOR'
      Size = 60
    end
    object qryBuscaOperacoesDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
    object qryBuscaOperacoesPERCTOBN: TFloatField
      FieldName = 'PERCTOBN'
    end
    object qryBuscaOperacoesPERCTOBD: TFloatField
      FieldName = 'PERCTOBD'
    end
    object qryBuscaOperacoesPERCLIQ: TFloatField
      FieldName = 'PERCLIQ'
    end
    object qryBuscaOperacoesPERCTXREG: TFloatField
      FieldName = 'PERCTXREG'
    end
    object qryBuscaOperacoesPERCTXBOLSA: TFloatField
      FieldName = 'PERCTXBOLSA'
    end
    object qryBuscaOperacoesPERCDEVN: TFloatField
      FieldName = 'PERCDEVN'
    end
    object qryBuscaOperacoesPERCDEVD: TFloatField
      FieldName = 'PERCDEVD'
    end
    object qryBuscaOperacoesDATA1: TDateTimeField
      FieldName = 'DATA1'
    end
    object qryBuscaOperacoesDATA2: TDateTimeField
      FieldName = 'DATA2'
    end
    object qryBuscaOperacoesVLRAJUSTED0: TFloatField
      FieldName = 'VLRAJUSTED0'
    end
    object qryBuscaOperacoesDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
  end
  object QryDespesasOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '      IDDESPOPERINVEST, EMPRESAPROP, IDFORCLI, IDOPERACAOINVEST,' +
        ' IDTIPOINVEST,'
      '      IDTIPOOPERACAO, VLRDESPOPER, IDTIPODESPINVEST,'
      '      DATAVENCDESPOPER, DATAOPERACAO'
      'FROM'
      '   DESPOPERINVEST'
      'WHERE'
      '   IDOPERACAOINVEST = :IDOPERACAOINVEST'
      'ORDER BY IDTIPODESPINVEST')
    ValidateWithMask = True
    Left = 196
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'DESPOPERINVEST.IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'DESPOPERINVEST.EMPRESAPROP'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'DESPOPERINVEST.IDFORCLI'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'DESPOPERINVEST.IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'DESPOPERINVEST.IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'DESPOPERINVEST.IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      Origin = 'DESPOPERINVEST.VLRDESPOPER'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'DESPOPERINVEST.IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = 'DESPOPERINVEST.DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = 'DESPOPERINVEST.IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = 'DESPOPERINVEST.IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'DESPOPERINVEST.FLGCALCDIARIO'
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'DESPOPERINVEST.DATAOPERACAO'
    end
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOL.IDBOLETA'
      ''
      'FROM CM.BOLETA BOL'
      ''
      'WHERE BOL.IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 270
    Top = 65531
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object QryBoletaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BOLETA.IDBOLETA'
      Size = 30
    end
  end
  object dsBuscaOrdem: TDataSource
    DataSet = QryBuscaOrdem
    Left = 272
    Top = 136
  end
  object updBuscaOrdem: TUpdateSQL
    ModifySQL.Strings = (
      'update ORDMOVINV'
      'set'
      '  STATMOVINV = :STATMOVINV'
      'where'
      '  IDORDMOVINV = :OLD_IDORDMOVINV')
    DeleteSQL.Strings = (
      '')
    Left = 200
    Top = 56
  end
  object QryDespInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TP.IDTIPODESPINVEST,'
      '   TP.DESCTIPODESPINV'
      'FROM '
      '   TIPODESPINVEST TP,'
      '   DESPESASXTIPOOPER DP'
      'WHERE '
      '   DP.IDTIPOOPERACAO  = :pIDTIPOOPERACAO AND'
      '   DP.IDTIPODESPINVEST = TP.IDTIPODESPINVEST')
    ValidateWithMask = True
    Left = 47
    Top = 157
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryDespInvestIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object QryDespInvestDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
  end
  object QryInsertDespInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESPOPERINVEST('
      
        '   IDDESPOPERINVEST,IDFORCLI,IDOPERACAOINVEST,EMPRESAPROP,IDTIPO' +
        'INVEST,IDTIPOOPERACAO,'
      
        '   VLRDESPOPER,IDTIPODESPINVEST,DATAVENCDESPOPER,FLGCALCDIARIO,D' +
        'ATAOPERACAO)'
      'VALUES ('
      
        '   :pIDDESPOPERINVEST,:pIDFORCLI,:pIDOPERACAOINVEST,:pEMPRESAPRO' +
        'P,:pIDTIPOINVEST,:pIDTIPOOPERACAO,'
      
        '   :pVLRDESPOPER,:pIDTIPODESPINVEST,:pDATAVENCDESPOPER,:pFLGCALC' +
        'DIARIO,:pDATAOPERACAO )'
      ' ')
    ValidateWithMask = True
    Left = 119
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDDESPOPERINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVLRDESPOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTIPODESPINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAVENCDESPOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFLGCALCDIARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      OPERACAOINVEST'
      'SET FLGSTATUSFECHBOL = :pFLGSTATUSFECHBOL'
      'WHERE'
      '      IDOPERACAOINVEST = :pIDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 119
    Top = 93
    ParamData = <
      item
        DataType = ftString
        Name = 'pFLGSTATUSFECHBOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaCotacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CT1.VLRAJUSTEDO,CT2.VLRAJUSTED1,CT1.IDTIPOCONTRINVEST,'
      '       DT1.DATA1,'
      '       DT2.DATA2,'
      '       IV.DESCINVESTIMENTO'
      'FROM'
      '       INVESTIMENTO IV,'
      '       (SELECT'
      '               CB1.VLRAJUSTE AS VLRAJUSTEDO,'
      '               CB1.IDTIPOCONTRINVEST AS IDTIPOCONTRINVEST'
      '        FROM'
      '               COTACAOBMF CB1'
      '         WHERE'
      
        '               (CB1.DATACOTACAOBMF = TO_DATE(:dDataAtu,'#39'DD/MM/YY' +
        'YY'#39') ) AND'
      '               (CB1.IDINVESTIMENTO = :iIdInvestimento) ) CT1,'
      '       (SELECT'
      '               CB2.VLRAJUSTE AS VLRAJUSTED1'
      '        FROM'
      '               COTACAOBMF CB2'
      '         WHERE'
      
        '               (CB2.DATACOTACAOBMF = TO_DATE(:dDataAnt,'#39'DD/MM/YY' +
        'YY'#39') ) AND'
      '               (CB2.IDINVESTIMENTO = :iIdInvestimento) ) CT2,'
      
        '        (SELECT MAX(DATAVIGENCIA) AS DATA1 FROM PARAMBMF WHERE I' +
        'DTIPOINVESTIDOR = :iIdTipoInvestidor) DT1,'
      
        '        (SELECT MAX(DATAVIGENCIA) AS DATA2 FROM PARAMCONTRATOBMF' +
        ' WHERE IDTIPOCONTRINVEST = IDTIPOCONTRINVEST) DT2'
      'WHERE'
      '        IDINVESTIMENTO = :iIdInvestimento'
      '')
    ValidateWithMask = True
    Left = 47
    Top = 210
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dDataAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdTipoInvestidor'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end>
    object QryBuscaCotacoesVLRAJUSTEDO: TFloatField
      FieldName = 'VLRAJUSTEDO'
    end
    object QryBuscaCotacoesVLRAJUSTED1: TFloatField
      FieldName = 'VLRAJUSTED1'
    end
    object QryBuscaCotacoesIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
    end
    object QryBuscaCotacoesDATA1: TDateTimeField
      FieldName = 'DATA1'
    end
    object QryBuscaCotacoesDATA2: TDateTimeField
      FieldName = 'DATA2'
    end
    object QryBuscaCotacoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
  end
  object QryBuscaSaldoDiaAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       SUM ( DECODE(NATURMOVCARTINV,'#39'D'#39',0,QTDEMOVINVCART) ) AS Q' +
        'TDCOMPRADA,'
      
        '       ABS(SUM ( DECODE(NATURMOVCARTINV,'#39'A'#39',0,QTDEMOVINVCART) ) ' +
        ') AS QTDVENDIDA'
      'FROM'
      '       HISTCARTINV HI'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      '       (HI.IDTIPOOPERACAO NOT IN(-10,-11)) AND'
      '       (HI.IDLOTE = :IdLote ) AND'
      '       (HI.IDINVESTIMENTO = :IdInvestimento) AND'
      '       (HI.DATAMOVCARTINV < TO_DATE(:dDataAtu, '#39'DD/MM/YYYY'#39'))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object QryBuscaSaldoDiaAntQTDCOMPRADA: TFloatField
      FieldName = 'QTDCOMPRADA'
    end
    object QryBuscaSaldoDiaAntQTDVENDIDA: TFloatField
      FieldName = 'QTDVENDIDA'
    end
  end
  object QryBoletasCalculadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       NUMDOCUMENTO, DATAOPERACAO,IDINVESTIMENTO,'
      '       FLGSTATUSFECHBOL,IDFORCLI'
      'FROM '
      '       OPERACAOINVEST '
      'WHERE '
      '      (FLGSTATUSFECHBOL IN ('#39'P'#39','#39'F'#39' )) AND '
      '      (IDTIPOINVEST=8) AND '
      '      (DATAOPERACAO = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39' ))'
      ''
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 41
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object QryBoletasCalculadasNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object QryBoletasCalculadasDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryBoletasCalculadasIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBoletasCalculadasFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object QryBoletasCalculadasIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
  end
  object updOrdMovInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      ORDMOVINV'
      'SET '
      '      STATMOVINV = '#39'A'#39
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (IDLOTE = :sIDLOTE ) AND'
      '      (DATAORDMOVINV = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 343
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'sIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object FloatField2: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'OPERACAOINVEST.IDCORRETVALORES'
    end
    object FloatField3: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'OPERACAOINVEST.MOECODIGO'
    end
    object FloatField4: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'OPERACAOINVEST.IDMODULO'
    end
    object FloatField5: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'OPERACAOINVEST.EMPRESAPROP'
    end
    object FloatField6: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object FloatField7: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object FloatField8: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object FloatField9: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object FloatField10: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object FloatField11: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object FloatField12: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'OPERACAOINVEST.DATAVENCOPER'
    end
    object FloatField13: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OPERACAOINVEST.IDFORCLI'
    end
    object StringField1: TStringField
      FieldName = 'IDLOTE'
      Origin = 'OPERACAOINVEST.IDLOTE'
      Size = 10
    end
    object FloatField14: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object StringField2: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'OPERACAOINVEST.FLGSTATUSFECHBOL'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Origin = 'OPERACAOINVEST.FLGSTATUSORDMOV'
      Size = 1
    end
    object FloatField15: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'OPERACAOINVEST.IDOPERACAOORIGEM'
    end
  end
  object QryDelHistcartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '      HISTCARTINV'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      
        '      ( (TIPMOVCARTINV IN ('#39'DOP'#39','#39'ATU'#39'))  OR (TIPMOVCARTINV ='#39'OP' +
        'E'#39' AND IDTIPOOPERACAO IN(-10,-11)) )AND'
      '      (IDLOTE = :sIdLote)  AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 351
    Top = 149
    ParamData = <
      item
        DataType = ftString
        Name = 'sIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object FloatField46: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object FloatField47: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'OPERACAOINVEST.IDCORRETVALORES'
    end
    object FloatField48: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'OPERACAOINVEST.MOECODIGO'
    end
    object FloatField49: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'OPERACAOINVEST.IDMODULO'
    end
    object FloatField50: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'OPERACAOINVEST.EMPRESAPROP'
    end
    object FloatField51: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object FloatField52: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object FloatField53: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object FloatField54: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object FloatField55: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object FloatField56: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object FloatField57: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'OPERACAOINVEST.DATAVENCOPER'
    end
    object FloatField58: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OPERACAOINVEST.IDFORCLI'
    end
    object StringField10: TStringField
      FieldName = 'IDLOTE'
      Origin = 'OPERACAOINVEST.IDLOTE'
      Size = 10
    end
    object FloatField59: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object StringField11: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'OPERACAOINVEST.FLGSTATUSFECHBOL'
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Origin = 'OPERACAOINVEST.FLGSTATUSORDMOV'
      Size = 1
    end
    object FloatField60: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'OPERACAOINVEST.IDOPERACAOORIGEM'
    end
  end
  object QryUpdOperInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      OPERACAOINVEST'
      'SET'
      '      FLGSTATUSFECHBOL = '#39'L'#39
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (IDLOTE = :sIDLOTE ) AND'
      '      (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 319
    Top = 53
    ParamData = <
      item
        DataType = ftString
        Name = 'sIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object FloatField16: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOINVEST.IDOPERACAOINVEST'
    end
    object FloatField17: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'OPERACAOINVEST.IDCORRETVALORES'
    end
    object FloatField18: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'OPERACAOINVEST.MOECODIGO'
    end
    object FloatField19: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'OPERACAOINVEST.IDMODULO'
    end
    object FloatField20: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'OPERACAOINVEST.EMPRESAPROP'
    end
    object FloatField21: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'OPERACAOINVEST.IDINVESTIMENTO'
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object FloatField23: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERACAOINVEST.IDTIPOINVEST'
    end
    object FloatField24: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERACAOINVEST.IDTIPOOPERACAO'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object FloatField25: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object FloatField26: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object FloatField27: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'OPERACAOINVEST.DATAVENCOPER'
    end
    object FloatField28: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'OPERACAOINVEST.IDFORCLI'
    end
    object StringField4: TStringField
      FieldName = 'IDLOTE'
      Origin = 'OPERACAOINVEST.IDLOTE'
      Size = 10
    end
    object FloatField29: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'OPERACAOINVEST.IDCUSTODIANTE'
    end
    object StringField5: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'OPERACAOINVEST.FLGSTATUSFECHBOL'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Origin = 'OPERACAOINVEST.FLGSTATUSORDMOV'
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'OPERACAOINVEST.IDOPERACAOORIGEM'
    end
  end
  object QryPesoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      PA.PESOCONTRATO,PA.VALORCONTRATO'
      'FROM '
      '      PARAMCONTRATOBMF PA,'
      '      INVESTIMENTO IV,'
      '      SERIESBMF SR'
      'WHERE'
      '      (IV.IDINVESTIMENTO = :iInvestimento) AND'
      '      (IV.IDINVESTIMENTO = SR.IDINVESTIMENTO) AND'
      '      (SR.IDTIPOCONTRINVEST = PA.IDTIPOCONTRINVEST)'
      ''
      '')
    ValidateWithMask = True
    Left = 414
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iInvestimento'
        ParamType = ptUnknown
      end>
    object QryPesoContratoPESOCONTRATO: TFloatField
      FieldName = 'PESOCONTRATO'
      Origin = 'BASEDADOS.PARAMCONTRATOBMF.PESOCONTRATO'
    end
    object QryPesoContratoVALORCONTRATO: TFloatField
      FieldName = 'VALORCONTRATO'
      Origin = 'BASEDADOS.PARAMCONTRATOBMF.VALORCONTRATO'
    end
  end
  object OperacoesComSaldoDiaAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       HH.IDHISTCARTINV,HH.IDLOTE,'
      
        '       HH.IDINVESTIMENTO,HH.IDCARTEIRAINVEST ,HH.IDCARTEIRAGEREN' +
        'C'
      'FROM'
      '      HISTCARTINV HH,'
      '      ('
      '        SELECT'
      
        '               IDLOTE,IDINVESTIMENTO,MAX(HI.IDHISTCARTINV) AS ID' +
        'HISTCARTINV'
      '        FROM'
      '               HISTCARTINV HI'
      '        WHERE'
      '               (HI.IDTIPOINVEST = 8) AND'
      '               (HI.TIPMOVCARTINV IN ('#39'OPE'#39','#39'INI'#39') )  AND'
      
        '               (HI.DATAMOVCARTINV = TO_DATE(:dDataAnt, '#39'DD/MM/YY' +
        'YY'#39'))'
      '        GROUP BY'
      '               IDLOTE,IDINVESTIMENTO'
      '      ) HHH'
      'WHERE'
      '      HH.IDHISTCARTINV = HHH.IDHISTCARTINV'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataAnt'
        ParamType = ptUnknown
      end>
    object OperacoesComSaldoDiaAntIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object OperacoesComSaldoDiaAntIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object OperacoesComSaldoDiaAntIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object OperacoesComSaldoDiaAntIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object OperacoesComSaldoDiaAntIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
  end
  object QryBuscaPuAjuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       VLRAJUSTE'
      'FROM'
      '       COTACAOBMF'
      'WHERE'
      '       (DATACOTACAOBMF = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39') ) AND'
      '       (IDINVESTIMENTO = :iIdInvestimento)'
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 424
    Top = 131
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdInvestimento'
        ParamType = ptUnknown
      end>
    object QryBuscaPuAjusteVLRAJUSTE: TFloatField
      FieldName = 'VLRAJUSTE'
    end
  end
  object QryBuscaIdForCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       IDFORCLI,IDCORRETVALORES,IDCUSTODIANTE,MOECODIGO,'
      '       NUMDOCUMENTO,IDCARTEIRAINVEST'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      '       IDLOTE = :sIdLote'
      'ORDER BY DATAOPERACAO DESC ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 424
    Top = 187
    ParamData = <
      item
        DataType = ftString
        Name = 'sIdLote'
        ParamType = ptUnknown
      end>
    object QryBuscaIdForCliIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDFORCLI'
    end
    object QryBuscaIdForCliIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCORRETVALORES'
    end
    object QryBuscaIdForCliIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
    end
    object QryBuscaIdForCliMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.OPERACAOINVEST.MOECODIGO'
    end
    object QryBuscaIdForCliNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object QryBuscaIdForCliIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
  end
  object QryBuscaIdOrdMovInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       MAX(IDORDMOVINV) AS IDORDMOVINV'
      'FROM'
      '       ORDMOVINV'
      'WHERE'
      '       (IDLOTE = :sIdLote) AND'
      '       (DATAORDMOVINV <= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 48
    Top = 59
    ParamData = <
      item
        DataType = ftString
        Name = 'sIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object QryBuscaIdOrdMovInvIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
      Origin = 'BASEDADOS.ORDMOVINV.IDORDMOVINV'
    end
  end
  object QryDelOperInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '      OPERACAOINVEST'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (IDTIPOOPERACAO IN (-10,-11)) AND'
      '      (IDLOTE = :sIdLote)  AND'
      '      (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 351
    Top = 205
    ParamData = <
      item
        DataType = ftString
        Name = 'sIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
  end
  object QrySelDespOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOINVEST'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '      (NUMDOCUMENTO = :sIdLote)'
      '')
    ValidateWithMask = True
    Left = 495
    Top = 109
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sIdLote'
        ParamType = ptUnknown
      end>
    object QrySelDespOperIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
  end
  object QryDelDespOperInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '      DESPOPERINVEST'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDOPERACAOINVEST = :iIdOperacaoInvest)')
    ValidateWithMask = True
    Left = 351
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdOperacaoInvest'
        ParamType = ptUnknown
      end>
  end
  object qrySelAjusteDoDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE'
      'FROM'
      '      OPERACAOINVEST'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (IDINVESTIMENTO = :IdInvestimento) AND'
      '      (IDTIPOOPERACAO IN (-10,-11)) AND'
      '      (IDLOTE = :IdLote)  AND'
      '      (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 271
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdInvestimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object qrySelAjusteDoDiaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
  end
  object qryMercado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      IDMERCADO'
      'FROM'
      '      MERCADO'
      'WHERE'
      '       IDTIPOINVEST = 8')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 496
    Top = 3
    object qryMercadoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.MERCADO.IDMERCADO'
    end
  end
  object qryCarteiraInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV,IDPATROCINADORA '
      'FROM '
      '   CARTEIRAINVEST'
      'WHERE'
      '   IDCARTEIRAINVEST = :IdCarteiraInvest'
      '')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 120
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdCarteiraInvest'
        ParamType = ptUnknown
      end>
    object qryCarteiraInvestIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPLANOPREV'
    end
    object qryCarteiraInvestIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPATROCINADORA'
    end
  end
  object qryAcumulaAjustes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(X.VLRAJUSTACUM) AS VLRAJUSTACUM,'
      '    SUM(X.VLRCPMFAPU) AS VLRCPMFAPU'
      'FROM'
      '('
      'SELECT'
      
        '     SUM ( DECODE(HI.NATURMOVCARTINV,'#39'D'#39',(HI.VLRMOVCARTINV*-1),H' +
        'I.VLRMOVCARTINV) ) AS VLRAJUSTACUM,'
      '     0 AS VLRCPMFAPU'
      'FROM'
      '     HISTCARTINV HI'
      'WHERE'
      '     (HI.IDTIPOINVEST= 8) AND'
      '     ('
      '      (HI.IDTIPOOPERACAO IN (-10,-11)) OR'
      '      ('
      
        '       (HI.TIPMOVCARTINV = '#39'DOP'#39') AND ( (HI.HISTMOVCARTINV LIKE ' +
        #39'%Ajuste Normal%'#39') or'
      
        '                                        (HI.HISTMOVCARTINV LIKE ' +
        #39'%AJUSTE NORMAL%'#39') )'
      '      )'
      '     ) AND'
      '     (HI.DATAMOVCARTINV <= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '     (HI.IDLOTE = :IdLote)'
      ''
      'UNION'
      ''
      'SELECT'
      '     0 AS VLRAJUSTACUM,'
      '     SUM (VLRCPMFAPU)  AS VLRCPMFAPU'
      'FROM'
      '     HISTCARTINV HI'
      'WHERE'
      '     (HI.IDTIPOINVEST= 8) AND'
      '     (HI.IDTIPOOPERACAO > 0 ) AND'
      '     (HI.DATAMOVCARTINV <= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '     (HI.IDLOTE = :IdLote)'
      ') X'
      '')
    ValidateWithMask = True
    Left = 119
    Top = 245
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end>
    object qryAcumulaAjustesVLRAJUSTACUM: TFloatField
      FieldName = 'VLRAJUSTACUM'
    end
    object qryAcumulaAjustesVLRCPMFAPU: TFloatField
      FieldName = 'VLRCPMFAPU'
    end
  end
  object UpdHistCartInvCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      HISTCARTINV'
      'SET'
      '      VLRCPMFPROV = :VLRCPMFPROV,'
      '      VLRCPMFAPU = :VLRCPMFAPU'
      'WHERE'
      '      (IDTIPOINVEST = 8) AND'
      '      (DATAMOVCARTINV = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      '      (IDOPERACAOINVEST = :IDOPERACAOINVEST) AND'
      '      (TIPMOVCARTINV = '#39'OPE'#39') '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 495
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRCPMFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRCPMFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaBoletasDiaAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       DISTINCT HI.IDLOTE,HI.IDINVESTIMENTO,HI.IDCARTEIRAINVEST,' +
        'HI.IDCARTEIRAGERENC,'
      '       SR.DATAVENCIMENTO'
      'FROM'
      '       HISTCARTINV HI, SERIESBMF SR'
      'WHERE'
      '       (HI.IDTIPOINVEST = 8) AND'
      '       (HI.NATURMOVCARTINV <> '#39'E'#39') AND'
      
        '       (HI.DATAMOVCARTINV = TO_DATE(:dDataAnt, '#39'DD/MM/YYYY'#39')) AN' +
        'D'
      '       (HI.IDINVESTIMENTO = SR.IDINVESTIMENTO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 242
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataAnt'
        ParamType = ptUnknown
      end>
    object QryBuscaBoletasDiaAntIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaBoletasDiaAntIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBuscaBoletasDiaAntIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaBoletasDiaAntDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
  end
  object BuscaCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCORRETVALORES'
      'FROM '
      '     OPERACAOINVEST'
      'WHERE'
      '     (DATAOPERACAO = :dDataRef) AND'
      '     (IDLOTE = :IdLote)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 352
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end>
    object BuscaCorretoraIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCORRETVALORES'
    end
  end
  object QryInsOrdMovInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Insert into ORDMOVINV'
      
        '  (IDORDMOVINV,IDCORRETVALORES,IDTIPOINVEST,IDINVESTIMENTO,IDTIP' +
        'OOPERACAO,PUORDMOVINV,'
      
        '   OBSMOVINV,DATAORDMOVINV,QTDEORDMOVINV,NUMDOCMOVINV,STATMOVINV' +
        ',IDUSUARIO,OBSAUTMOV,'
      
        '   IDCARTEIRAINVEST,IDLOTE,QTDEORDENADA,DATAAUTORIZACAO,IDBOLSAV' +
        'ALORES,IDCUSTODIANTE,'
      '   IDPLANPREVCTBPATR)'
      'Values'
      
        '  (:IDORDMOVINV,:IDCORRETVALORES,:IDTIPOINVEST,:IDINVESTIMENTO,:' +
        'IDTIPOOPERACAO,:PUORDMOVINV,'
      
        '   :OBSMOVINV,:DATAORDMOVINV,:QTDEORDMOVINV,:NUMDOCMOVINV,:STATM' +
        'OVINV,:IDUSUARIO,:OBSAUTMOV,'
      
        '   :IDCARTEIRAINVEST,:IDLOTE,:QTDEORDENADA,:DATAAUTORIZACAO,:IDB' +
        'OLSAVALORES,:IDCUSTODIANTE,'
      '   :IDPLANPREVCTBPATR)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 424
    Top = 245
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PUORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QTDEORDMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMDOCMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATMOVINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSAUTMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QTDEORDENADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAAUTORIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaTpOperBMF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '     IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERACAO' +
        ','
      
        '     TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERACAO' +
        ','
      '     FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      'FROM '
      '     TIPOOPERACAO'
      'WHERE '
      '      (IDTIPOINVEST = 8) AND'
      '      (IDTIPOOPERACAO > 0) AND'
      '      (NATUREZAOPERACAO = :NATUREZAOPERACAO)')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 266
    Top = 289
    ParamData = <
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaOrdemVencto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  O.IDLOTE,'
      '  O.OBSAUTMOV'
      'FROM'
      '  ORDMOVINV O'
      'WHERE'
      '  (O.IDTIPOINVEST= 8) AND'
      '  (O.DATAORDMOVINV = TO_DATE(:STRDATA,'#39'DD/MM/YYYY'#39') ) AND'
      '  (O.IDLOTE = :IdLote)'
      ' '
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 42
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'STRDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdLote'
        ParamType = ptUnknown
      end>
    object QryBuscaOrdemVenctoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaOrdemVenctoOBSAUTMOV: TStringField
      FieldName = 'OBSAUTMOV'
      Size = 200
    end
  end
  object qryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTFECHBMF = :DATAULTFECHBMF')
    ValidateWithMask = True
    Left = 45
    Top = 18
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAULTFECHBMF'
        ParamType = ptUnknown
      end>
  end
end
