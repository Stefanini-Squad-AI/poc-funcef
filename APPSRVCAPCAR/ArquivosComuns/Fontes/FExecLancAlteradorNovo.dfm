inherited frmExecLancAlteradorNovo: TfrmExecLancAlteradorNovo
  Left = 19
  Top = 77
  HelpContext = 640021
  BorderStyle = bsSingle
  Caption = 'Lançamento de Acréscimos e Descontos'
  ClientHeight = 430
  ClientWidth = 760
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 397
    object Label2: TLabel
      Left = 128
      Top = 160
      Width = 103
      Height = 13
      Caption = 'Tipo de Alterador '
    end
    object Label12: TLabel
      Left = 640
      Top = 160
      Width = 101
      Height = 13
      Caption = 'Data Lançamento'
    end
    object Label1: TLabel
      Left = 504
      Top = 160
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Bevel1: TBevel
      Left = 16
      Top = 150
      Width = 729
      Height = 3
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 24
      Top = 126
      Width = 73
      Height = 13
      Caption = 'Documento: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 464
      Top = 126
      Width = 54
      Height = 13
      Caption = 'Planilha: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 624
      Top = 122
      Width = 16
      Height = 20
      Caption = ' / '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 208
      Top = 122
      Width = 16
      Height = 20
      Caption = ' / '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 128
      Top = 200
      Width = 79
      Height = 13
      Caption = 'Observações '
    end
    object DBgrdReajuste: TwwDBGrid
      Left = 16
      Top = 34
      Width = 728
      Height = 81
      Selected.Strings = (
        'IMOVEL_EXTENSO'#9'35'#9'Imovel'
        'CONTRATO_EXTENSO'#9'30'#9'Contrato'
        'DESCCUSTORECIMO'#9'25'#9'Descrição'
        'VALOR_LANC'#9'12'#9'Valor'
        'MESCOMPETENCIA'#9'4'#9'Mês'
        'ANOCOMPETENCIA'#9'5'#9'Ano')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBgrdReajusteCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdReajusteTopRowChanged
    end
    object rdgAcreDesc: TRadioGroup
      Left = 16
      Top = 159
      Width = 97
      Height = 76
      ItemIndex = 0
      Items.Strings = (
        'Acréscimo'
        'Desconto')
      TabOrder = 6
      OnClick = rdgAcreDescClick
    end
    object DBcboAlterador: TwwDBLookupCombo
      Left = 128
      Top = 176
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'DESCRICAO')
      LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
      LookupField = 'CODALTERADOR'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      OnCloseUp = DBcboAlteradorCloseUp
    end
    object DBgrdAlteradoresLanc: TwwDBGrid
      Left = 16
      Top = 290
      Width = 729
      Height = 100
      Selected.Strings = (
        'DATALANCTO'#9'12'#9'Data'
        'DESCRICAO'#9'32'#9'Tipo do Alterador'
        'VALOR'#9'19'#9'Valor'
        'HISTORICOCOMPL'#9'33'#9'Histórico')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsAlteradoresLanc
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 12
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DBgrdAlteradoresLancCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdAlteradoresLancTopRowChanged
    end
    object edtDataLancamento: TCMDateTimePicker
      Left = 640
      Top = 176
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
      TabOrder = 9
    end
    object edtValor: TEditNum
      Left = 504
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 8
      IntDigits = 0
      Signal = False
      DecDigits = 2
      Numeric = False
      Alignment = taRightJustify
    end
    object chkContabiliza: TCheckBox
      Left = 128
      Top = 243
      Width = 329
      Height = 17
      Caption = 'NÃO Contabilizar valor do Alterador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object DBEdit13: TDBEdit
      Left = 520
      Top = 122
      Width = 105
      Height = 21
      DataField = 'PLNPLANIL'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit14: TDBEdit
      Left = 96
      Top = 122
      Width = 113
      Height = 21
      DataField = 'CODDOCUMENTO'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit15: TDBEdit
      Left = 640
      Top = 122
      Width = 105
      Height = 21
      DataField = 'PLNCODIGO'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit1: TDBEdit
      Left = 224
      Top = 122
      Width = 145
      Height = 21
      DataField = 'NODOCUMENTO'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 16
      Top = 8
      Width = 729
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Lançamentos associados ao Documento'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      object btnProcurar: TBitBtn
        Left = 1
        Top = 1
        Width = 88
        Height = 25
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        OnClick = btnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Margin = 6
        NumGlyphs = 2
      end
    end
    object Panel1: TPanel
      Left = 16
      Top = 265
      Width = 729
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Alteradores do Documento'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 1
        Width = 81
        Height = 25
        Caption = 'Aplicar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        Margin = 6
        NumGlyphs = 2
      end
      object btnExcluiAlterador: TBitBtn
        Left = 81
        Top = 1
        Width = 81
        Height = 25
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = btnExcluiAlteradorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        Margin = 6
        NumGlyphs = 2
      end
    end
    object edtObs: TEdit
      Left = 128
      Top = 216
      Width = 617
      Height = 21
      MaxLength = 60
      TabOrder = 13
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 605
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAlteradoresLanc: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO,'
      ''
      '   D.NODOCUMENTO'
      ''
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO')
    ValidateWithMask = True
    Left = 504
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATALANCTO'
      Origin = 'LANCTODOCUM.DATALANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 32
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 19
      FieldName = 'VALOR'
      Origin = 'LANCTODOCUM.VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 33
      FieldName = 'HISTORICOCOMPL'
      Origin = 'LANCTODOCUM.HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'LANCTODOCUM.CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'LANCTODOCUM.CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'LANCTODOCUM.VALOROUTRAMOEDA'
      Visible = False
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'LANCTODOCUM.DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'LANCTODOCUM.OPERACAO'
      Visible = False
      Size = 2
    end
    object qryAlteradoresLancNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
  end
  object dsAlteradoresLanc: TwwDataSource
    DataSet = qryAlteradoresLanc
    Left = 408
    Top = 360
  end
  object ds: TwwDataSource
    DataSet = dtmLancImovel.qryLancImovel
    Left = 312
    Top = 360
  end
end
