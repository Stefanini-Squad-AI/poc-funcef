inherited frmPotencAval: TfrmPotencAval
  Left = 19
  Top = 104
  Caption = 'Evolução do Desempenho e Simulação de Potencial'
  ClientHeight = 433
  ClientWidth = 746
  Constraints.MinHeight = 460
  Constraints.MinWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 109
    Width = 746
    Height = 285
    object pnlGrafico: TPanel
      Left = 233
      Top = 5
      Width = 508
      Height = 275
      Align = alClient
      TabOrder = 2
    end
    object Chart1: TChartfx
      Left = 233
      Top = 5
      Width = 508
      Height = 275
      Align = alClient
      TabOrder = 0
      Visible = False
      ControlData = {
        813400006C1C00006000000000000102550200FFFFFFFF320032002800280002
        00000000000000080001000000000000000000000000000000020000FFFF00C0
        C0C000C0C0C000FFFFFF00FF03F7010000000000010000000000000000080000
        2008000060080000000800000008000000080000000800000008000000080000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000F0
        3F02000400000000000000000000000000000059400000000000000000000000
        000000000000000000}
    end
    object pnlGrid: TPanel
      Left = 5
      Top = 5
      Width = 228
      Height = 275
      Align = alLeft
      TabOrder = 1
      object dbgrAval: TwwDBGrid
        Left = 1
        Top = 1
        Width = 226
        Height = 273
        Selected.Strings = (
          'DATAREAL'#9'10'#9'Data Real'
          'AVALIACAO'#9'10'#9'Avaliação'
          'POTENCIAL'#9'10'#9'Potencial')
        IniAttributes.Delimiter = ';;'
        TitleColor = clGray
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icYellow
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 498
      DockPos = 584
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
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
        NumGlyphs = 2
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 746
    Height = 109
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object sbtnProcurar: TSpeedButton
      Left = 411
      Top = 22
      Width = 70
      Height = 70
      Hint = 'Procurar por registro|'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object gbxFaixaData: TGroupBox
      Left = 486
      Top = 6
      Width = 253
      Height = 46
      Caption = 'Faixa de Datas'
      TabOrder = 0
      object Label3: TLabel
        Left = 123
        Top = 21
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object EdData1: TCMDateTimePicker
        Left = 9
        Top = 15
        Width = 100
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
      object EdData2: TCMDateTimePicker
        Left = 144
        Top = 15
        Width = 100
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
    object GroupBox1: TGroupBox
      Left = 9
      Top = 6
      Width = 397
      Height = 97
      Caption = 'Matrícula, Nome, Situação e Cargo'
      TabOrder = 1
      object dbedMatric: TDBEdit
        Left = 8
        Top = 15
        Width = 100
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 8
        Top = 41
        Width = 381
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedSit: TDBEdit
        Left = 141
        Top = 15
        Width = 248
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = dsSit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCargo: TDBEdit
        Left = 8
        Top = 67
        Width = 381
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = dsCar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object gbxPotenc: TGroupBox
      Left = 486
      Top = 57
      Width = 253
      Height = 46
      Caption = 'Potencial Para'
      TabOrder = 2
      object dblcGrupo: TwwDBLookupCombo
        Left = 9
        Top = 15
        Width = 235
        Height = 21
        Hint = 'Informe Gropo Funcional Desejado'
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCGRPFUNC'#9'40'#9'DESCGRPFUNC')
        LookupTable = qryGrupo
        LookupField = 'CODGRPFUNC'
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 51
    Top = 155
  end
  object ds: TwwDataSource
    DataSet = tblPessoal
    Left = 132
    Top = 132
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds3
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 183
    Top = 129
  end
  object tblFuncio: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    TableName = 'CM.FUNCIONARIO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 255
    Top = 129
  end
  object ds2: TwwDataSource
    DataSet = qryAval
    Left = 432
    Top = 129
  end
  object qryAval: TwwQuery
    AutoCalcFields = False
    OnCalcFields = qryAvalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select HSTAVAL.* '
      'from TIPOAVAL,HSTAVAL where HSTAVAL.IDPESSOA =:IdPessoa '
      ' and HSTAVAL.CODTIPOAVAL = TIPOAVAL.CODTIPOAVAL '
      ' and TIPOAVAL.FLGTIPOAVAL < 2'
      ' and HSTAVAL.DATAREAL >= :Data1'
      ' and HSTAVAL.DATAREAL <= :Data2'
      ' order by HSTAVAL.DATAREAL')
    ValidateWithMask = True
    Left = 483
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    object qryAvalDATAREAL: TDateTimeField
      DisplayLabel = 'Data Real'
      DisplayWidth = 10
      FieldName = 'DATAREAL'
      Origin = 'HSTAVAL.DATAREAL'
    end
    object qryAvalAVALIACAO: TFloatField
      DisplayLabel = 'Avaliação'
      DisplayWidth = 10
      FieldName = 'AVALIACAO'
      Origin = 'HSTAVAL.AVALIACAO'
    end
    object qryAvalPOTENCIAL: TIntegerField
      DisplayLabel = 'Potencial'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'POTENCIAL'
      Calculated = True
    end
    object qryAvalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'HSTAVAL.IDPESSOA'
      Visible = False
    end
    object qryAvalCODTIPOAVAL: TFloatField
      FieldName = 'CODTIPOAVAL'
      Origin = 'HSTAVAL.CODTIPOAVAL'
      Visible = False
    end
    object qryAvalNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Origin = 'HSTAVAL.NUMSEQ'
      Visible = False
    end
  end
  object tblSitFunc: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDSITFUNC'
    MasterFields = 'IDSITFUNC'
    MasterSource = ds3
    TableName = 'CM.SITFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 252
    Top = 183
  end
  object ds3: TwwDataSource
    DataSet = tblFuncio
    Left = 252
    Top = 72
  end
  object dsSit: TwwDataSource
    DataSet = tblSitFunc
    Left = 192
    Top = 186
  end
  object dsCar: TwwDataSource
    DataSet = tblCargo
    Left = 339
    Top = 195
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds3
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 399
    Top = 192
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODGRPFUNC, DESCGRPFUNC from GRUPFUNC'
      'order by DESCGRPFUNC')
    ValidateWithMask = True
    Left = 557
    Top = 133
  end
  object qryDesemp: TwwQuery
    AutoCalcFields = False
    OnCalcFields = qryAvalCalcFields
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 480
    Top = 195
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregados'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 647
    Top = 131
  end
end
