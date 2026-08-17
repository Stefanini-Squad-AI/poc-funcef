inherited frmApuracaoMT: TfrmApuracaoMT
  Left = 104
  Top = 60
  HelpContext = 4390002
  Caption = 'Apuração de Indicadores'
  ClientHeight = 445
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 621
    Height = 359
    object Label8: TLabel
      Left = 16
      Top = 264
      Width = 104
      Height = 13
      Caption = 'Data da Apuração'
    end
    object Label10: TLabel
      Left = 16
      Top = 309
      Width = 69
      Height = 13
      Caption = 'Observação'
      FocusControl = DBEdit1
    end
    object pnlData: TPanel
      Left = 145
      Top = 260
      Width = 417
      Height = 49
      BevelOuter = bvNone
      TabOrder = 9
      object Label5: TLabel
        Left = 5
        Top = 5
        Width = 81
        Height = 13
        Caption = 'Valor Apurado'
      end
      object Label9: TLabel
        Left = 91
        Top = 5
        Width = 41
        Height = 13
        Caption = '( Data )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dbedtVlrDat: TCMDateTimePicker
        Left = 5
        Top = 21
        Width = 124
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'VLRAPURACAODAT'
        DataSource = ds
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
    end
    object pnlStr: TPanel
      Left = 145
      Top = 260
      Width = 417
      Height = 49
      BevelOuter = bvNone
      TabOrder = 7
      object Label1: TLabel
        Left = 5
        Top = 5
        Width = 81
        Height = 13
        Caption = 'Valor Apurado'
      end
      object Label2: TLabel
        Left = 91
        Top = 5
        Width = 58
        Height = 13
        Caption = '( Caracter )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dbedtVlrStr: TwwDBEdit
        Left = 5
        Top = 21
        Width = 404
        Height = 21
        TabStop = False
        DataField = 'VLRAPURACAOSTR'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlNum: TPanel
      Left = 145
      Top = 260
      Width = 417
      Height = 49
      BevelOuter = bvNone
      TabOrder = 8
      object Label3: TLabel
        Left = 5
        Top = 5
        Width = 81
        Height = 13
        Caption = 'Valor Apurado'
      end
      object Label4: TLabel
        Left = 91
        Top = 5
        Width = 63
        Height = 13
        Caption = '( Numérico )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object dbedtVlrNum: TDBRealEdit
        Left = 5
        Top = 21
        Width = 148
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '2,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRAPURACAONUM'
        DataSource = ds
      end
    end
    object dbrgTipo: TDBRadioGroup
      Left = 268
      Top = 184
      Width = 141
      Height = 65
      Caption = 'Tipo de Lançamento'
      DataField = 'TIPOLANCA'
      DataSource = ds
      Items.Strings = (
        'Previsto'
        'Realizado')
      TabOrder = 5
      Values.Strings = (
        'P'
        'R')
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 184
      Width = 245
      Height = 65
      Caption = 'Competência'
      TabOrder = 4
      object Label6: TLabel
        Left = 16
        Top = 16
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label7: TLabel
        Left = 168
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object dbcbMes: TwwDBComboBox
        Left = 16
        Top = 32
        Width = 145
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dbspnAno: TwwDBSpinEdit
        Left = 168
        Top = 32
        Width = 65
        Height = 21
        Increment = 1
        DataField = 'ANOCOMPETENCIA'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object cmdtApura: TCMDateTimePicker
      Left = 16
      Top = 281
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAAPURACAO'
      DataSource = ds
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
      TabOrder = 6
      OnExit = cmdtApuraExit
    end
    inline molIndicador1: TmolIndicador
      Left = 9
      Top = 50
      Width = 601
      inherited btnLimpaIndicador: TBitBtn
        Left = 568
      end
      inherited edtIndicador: TEdit
        Width = 537
      end
      inherited btnBuscaIndicador: TBitBtn
        Left = 544
        OnClick = molIndicador1btnBuscaIndicadorClick
      end
    end
    inline molGrpApuracao1: TmolGrpApuracao
      Left = 8
      Top = 94
      Width = 305
      TabOrder = 1
      inherited edtGrpApuracao: TEdit
        Width = 241
      end
      inherited btnBuscaGrpApuracao: TBitBtn
        Left = 248
        OnClick = molGrpApuracao1btnBuscaGrpApuracaoClick
      end
      inherited btnLimpaGrpApuracao: TBitBtn
        Left = 272
      end
    end
    inline molGrpApuracao2: TmolGrpApuracao
      Left = 305
      Top = 95
      Width = 304
      TabOrder = 2
      inherited Label5: TLabel
        Width = 131
        Caption = 'Subgrupo de Apuração'
      end
      inherited edtGrpApuracao: TEdit
        Width = 241
      end
      inherited btnBuscaGrpApuracao: TBitBtn
        Left = 248
        OnClick = molGrpApuracao2btnBuscaGrpApuracaoClick
      end
      inherited btnLimpaGrpApuracao: TBitBtn
        Left = 272
      end
    end
    inline molContratoLoja1: TmolContratoLoja
      Left = 9
      Top = 133
      Width = 601
      TabOrder = 3
      inherited edtContrato: TEdit
        Width = 537
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 544
        OnClick = molContratoLoja1btnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 568
      end
    end
    object dbrgTipoInclusao: TDBRadioGroup
      Left = 416
      Top = 184
      Width = 184
      Height = 65
      Caption = 'Forma de Inclusão'
      Columns = 2
      DataField = 'TIPOINCLUSAO'
      DataSource = ds
      Items.Strings = (
        'Manual'
        'Calculado'
        'Regra'
        'Importação')
      ReadOnly = True
      TabOrder = 10
      Values.Strings = (
        'M'
        'C'
        'R'
        'I')
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 324
      Width = 585
      Height = 21
      DataField = 'OBSERVACAO'
      DataSource = ds
      TabOrder = 11
    end
    inline molImovelouMestre1: TmolImovelouMestre
      Left = 9
      Top = 8
      Width = 600
      TabOrder = 12
      inherited lblImovelouMestre: TLabel
        Left = 9
        Top = 1
      end
      inherited edtImovel: TEdit
        Width = 537
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 542
        OnClick = molImovelouMestre1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 566
      end
    end
  end
  inherited Dock972: TDock97
    Width = 621
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 621
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 298
    Top = 65535
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 462
  end
  inherited ImlPadrao: TImageList
    Left = 256
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 416
  end
  inherited Cds: TCMClientDataSet
    Left = 508
    object CdsIDAPURACAO: TFloatField
      FieldName = 'IDAPURACAO'
    end
    object CdsIDGRPAPURACAO: TFloatField
      FieldName = 'IDGRPAPURACAO'
    end
    object CdsIDSUBGRPAPURACAO: TFloatField
      FieldName = 'IDSUBGRPAPURACAO'
    end
    object CdsIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object CdsIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object CdsANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object CdsDATAAPURACAO: TDateTimeField
      FieldName = 'DATAAPURACAO'
    end
    object CdsTIPOLANCA: TStringField
      FieldName = 'TIPOLANCA'
      FixedChar = True
      Size = 1
    end
    object CdsVLRAPURACAONUM: TFloatField
      FieldName = 'VLRAPURACAONUM'
    end
    object CdsVLRAPURACAOSTR: TStringField
      FieldName = 'VLRAPURACAOSTR'
      Size = 60
    end
    object CdsVLRAPURACAODAT: TDateTimeField
      FieldName = 'VLRAPURACAODAT'
    end
    object CdsDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
    end
    object CdsTIPOINCLUSAO: TStringField
      FieldName = 'TIPOINCLUSAO'
      FixedChar = True
      Size = 1
    end
    object CdsDSC_INDICADOR: TStringField
      FieldName = 'DSC_INDICADOR'
      Size = 60
    end
    object CdsDSC_GRPAPURACAO: TStringField
      FieldName = 'DSC_GRPAPURACAO'
      Size = 60
    end
    object CdsDSC_SUBGRPAPURACAO: TStringField
      FieldName = 'DSC_SUBGRPAPURACAO'
      Size = 60
    end
    object CdsNOME_EXTENSO: TStringField
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object CdsDSC_CONTRATO: TStringField
      FieldName = 'DSC_CONTRATO'
      Size = 83
    end
    object CdsTIPODADO: TStringField
      FieldName = 'TIPODADO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGGRPAPURACAO: TStringField
      FieldName = 'FLGGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGSUBGRPAPURACAO: TStringField
      FieldName = 'FLGSUBGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGCONTRATO: TStringField
      FieldName = 'FLGCONTRATO'
      FixedChar = True
      Size = 1
    end
    object CdsPERIODICIDADE: TStringField
      FieldName = 'PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object CdsFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      FixedChar = True
      Size = 1
    end
    object CdsIDGRPPADRAO: TFloatField
      FieldName = 'IDGRPPADRAO'
    end
    object CdsIDSUBGRPPADRAO: TFloatField
      FieldName = 'IDSUBGRPPADRAO'
    end
    object CdsDSC_GRPPADRAO: TStringField
      FieldName = 'DSC_GRPPADRAO'
      Size = 60
    end
    object CdsDSC_SUBGRPPADRAO: TStringField
      FieldName = 'DSC_SUBGRPPADRAO'
      Size = 60
    end
    object CdsOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object CdsIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO'
      'ID.DESCRICAO'
      'DECODE(ID.TIPODADO,'#39'N'#39','#39'NUMERICO'#39','#39'C'#39','#39'CARACTER'#39','#39'DATA'#39')'
      'DECODE(ID.TIPOVALOR,'#39'R'#39','#39'RECEITA'#39','#39'D'#39','#39'DESPESA'#39','#39'DESEMPENHO'#39')'
      'DECODE(A.TIPOLANCA,'#39'P'#39','#39'PREVISTO'#39','#39'REALIZADO'#39')'
      'A.DATAAPURACAO'
      'A.MESCOMPETENCIA'
      'A.ANOCOMPETENCIA'
      'A.DATAINCLUSAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'N'
      'D')
    Descricao.Strings = (
      'Nome do Mestre'
      'Nome do Imóvel'
      'Nr. do Contrato'
      'Nome do Contrato'
      'Indicador'
      'Tipo de Dado'
      'Tipo de Indicador'
      'Tipo de Lançamento'
      'Data da Apuração'
      'Mês de Competência'
      'Ano de Competência'
      'Data de Inclusão')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDAPURACAO A'
      'IMOVEL I'
      'IMOVEL IM'
      'INDINDICADOR ID'
      'INDCONTRATOLOJA CL')
    CamposChave.Strings = (
      'A.IDAPURACAO')
    Filtro.Strings = (
      'A.IDINDICADOR = ID.IDINDICADOR'
      'A.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'A.IDCONTRATO = CL.IDCONTRATO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '20'
      '30'
      '60'
      '1'
      '1'
      '1'
      '18'
      '10'
      '10'
      '18')
    Left = 344
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 568
    Top = 7
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.IDAPURACAO,     A.IDGRPAPURACAO,  A.IDSUBGRPAPURACAO,'
      
        '       A.IDCONTRATO,     A.IDINDICADOR,    A.IDIMOVEL, I.IDIMOVE' +
        'LMESTRE,'
      '       A.MESCOMPETENCIA, A.ANOCOMPETENCIA, A.DATAAPURACAO,'
      '       A.TIPOLANCA,      A.VLRAPURACAONUM, A.VLRAPURACAOSTR,'
      '       A.VLRAPURACAODAT, A.DATAINCLUSAO,   A.TIPOINCLUSAO,'
      '       I.TIPODADO,       I.FLGGRPAPURACAO, I.FLGSUBGRPAPURACAO,'
      '       I.FLGCONTRATO,    I.PERIODICIDADE,  A.FLGCONCILIADO,'
      '       I.IDGRPPADRAO,     I.IDSUBGRPPADRAO, A.OBSERVACAO,'
      '       IG.DESCRICAO AS DSC_GRPPADRAO,'
      '       IP.DESCRICAO AS DSC_SUBGRPPADRAO,'
      '       I.DESCRICAO  AS DSC_INDICADOR,'
      '       GR.DESCRICAO AS DSC_GRPAPURACAO,'
      '       SG.DESCRICAO AS DSC_SUBGRPAPURACAO,'
      '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOME_EXTENSO,'
      '       CL.NUMCONTRATO || '#39' - '#39' || CL.NOMCONTRATO AS DSC_CONTRATO'
      ''
      '  FROM INDAPURACAO A,'
      '       INDINDICADOR I,'
      '       INDGRPAPURACAO GR,'
      '       INDGRPAPURACAO SG,'
      '       INDGRPAPURACAO IG,'
      '       INDGRPAPURACAO IP,'
      '       INDCONTRATOLOJA CL,'
      '       IMOVEL I,'
      '       IMOVEL IM'
      ''
      ' WHERE A.IDCONTRATO = CL.IDCONTRATO(+)'
      '   AND A.IDINDICADOR = I.IDINDICADOR'
      '   AND A.IDGRPAPURACAO = GR.IDGRPAPURACAO(+)'
      '   AND A.IDSUBGRPAPURACAO = SG.IDGRPAPURACAO(+)'
      '   AND I.IDGRPPADRAO = IG.IDGRPAPURACAO(+)'
      '   AND I.IDSUBGRPPADRAO = IP.IDGRPAPURACAO(+)'
      '   AND A.IDIMOVEL = I.IDIMOVEL'
      '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 568
    Top = 39
  end
end
