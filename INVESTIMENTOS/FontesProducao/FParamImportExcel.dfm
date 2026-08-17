inherited FrmParamImportExcel: TFrmParamImportExcel
  Left = 164
  Top = 99
  HelpContext = 790001
  Caption = 'Parâmetros da Importação Excel'
  ClientHeight = 369
  ClientWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 560
    Height = 283
    object Label3: TLabel
      Left = 17
      Top = 55
      Width = 100
      Height = 13
      Caption = 'Bolsa de Valores '
    end
    object Label4: TLabel
      Left = 263
      Top = 53
      Width = 197
      Height = 13
      Caption = 'Indique o Caminho para o Arquivo '
    end
    object Label5: TLabel
      Left = 17
      Top = 102
      Width = 100
      Height = 13
      Caption = 'Nome da Planilha'
    end
    object Label14: TLabel
      Left = 404
      Top = 101
      Width = 133
      Height = 13
      Caption = 'Primeira linha de dados'
      WordWrap = True
    end
    object SB1: TSpeedButton
      Left = 523
      Top = 68
      Width = 22
      Height = 23
      Hint = 'Buscar Arquivo '
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SB1Click
    end
    object Label1: TLabel
      Left = 170
      Top = 150
      Width = 105
      Height = 13
      Caption = 'Hora Limite 0-23 h'
    end
    object Label2: TLabel
      Left = 16
      Top = 149
      Width = 122
      Height = 13
      Caption = 'Periodicidade  0-23 h'
      WordWrap = True
    end
    object Label12: TLabel
      Left = 263
      Top = 102
      Width = 137
      Height = 13
      Caption = 'Data da Parametrização'
    end
    object Label15: TLabel
      Left = 17
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Nome do Parâmetro'
    end
    object Label16: TLabel
      Left = 368
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Tipo de Cotação'
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 200
      Width = 558
      Height = 82
      Align = alBottom
      Caption = ' Colunas Importadas '
      TabOrder = 11
      object Label13: TLabel
        Left = 498
        Top = 31
        Width = 42
        Height = 13
        Caption = 'Volume'
      end
      object Label11: TLabel
        Left = 334
        Top = 31
        Width = 35
        Height = 13
        Caption = 'Médio'
      end
      object Label10: TLabel
        Left = 416
        Top = 31
        Width = 42
        Height = 13
        Caption = 'Mínima'
      end
      object Label9: TLabel
        Left = 254
        Top = 31
        Width = 43
        Height = 13
        Caption = 'Máxima'
      end
      object Label6: TLabel
        Left = 8
        Top = 31
        Width = 73
        Height = 13
        Caption = 'Código Ação'
      end
      object Label7: TLabel
        Left = 92
        Top = 31
        Width = 49
        Height = 13
        Caption = 'Abertura'
      end
      object Label8: TLabel
        Left = 172
        Top = 31
        Width = 70
        Height = 13
        Caption = 'Fechamento'
      end
      object edtCodAcao: TwwDBEdit
        Left = 9
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODACAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtMax: TwwDBEdit
        Left = 254
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MAXIMA'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtMin: TwwDBEdit
        Left = 417
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MINIMA'
        DataSource = ds
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtMedio: TwwDBEdit
        Left = 335
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MEDIO'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtAbert: TwwDBEdit
        Left = 91
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ABERTURA'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtFecha: TwwDBEdit
        Left = 172
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FECHAMENTO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtVol: TwwDBEdit
        Left = 498
        Top = 46
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VOLUME'
        DataSource = ds
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object DbLkcBolsa: TwwDBLookupCombo
      Left = 17
      Top = 69
      Width = 232
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
      DataField = 'IDBOLSAVALORES'
      DataSource = ds
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object edtPlanilha: TwwDBEdit
      Left = 17
      Top = 118
      Width = 230
      Height = 21
      DataField = 'NOMEPLANILHA'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtlinha: TwwDBEdit
      Left = 404
      Top = 118
      Width = 141
      Height = 21
      DataField = 'PRIMEIRALINHA'
      DataSource = ds
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object chkAtualizaLink: TDBCheckBox
      Left = 283
      Top = 166
      Width = 99
      Height = 17
      Caption = 'Atualiza Link'
      DataField = 'ATUALIZALINK'
      DataSource = ds
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edtNomeParam: TwwDBEdit
      Left = 17
      Top = 24
      Width = 336
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEPARAM'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtDtCot: TCMDateTimePicker
      Left = 263
      Top = 118
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DTCOTACAO'
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
      TabOrder = 5
    end
    object edtArquivo: TwwDBEdit
      Left = 263
      Top = 69
      Width = 258
      Height = 21
      DataField = 'CAMINHO'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtHora: TMaskEdit
      Left = 170
      Top = 165
      Width = 76
      Height = 21
      EditMask = '!99:99;1; '
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
    end
    object edtPeriodicidade: TMaskEdit
      Left = 16
      Top = 165
      Width = 76
      Height = 21
      Color = clWhite
      EditMask = '!99:99;1; '
      MaxLength = 5
      TabOrder = 7
      Text = '  :  '
    end
    object dbckAtivo: TDBCheckBox
      Left = 404
      Top = 166
      Width = 113
      Height = 17
      Caption = 'Parâmetro Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 10
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbcTpCotacao: TwwDBComboBox
      Left = 368
      Top = 24
      Width = 177
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      ShowMatchText = True
      DataField = 'FLGTPCOTACAO'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Cotação de Ação'#9'C'
        'Beta de Ação'#9'B'
        'PU de Título'#9'P')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
      OnChange = dbcTpCotacaoChange
      OnExit = dbcTpCotacaoExit
    end
  end
  inherited Dock972: TDock97
    Width = 560
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 560
    inherited tb97Fundo: TToolbar97
      Left = 198
      DockPos = 198
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 29
      DockPos = 29
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 357
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.PARAMIMPORTEXCEL'
      'set'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  NOMEPARAM = :NOMEPARAM,'
      '  ATUALIZALINK = :ATUALIZALINK,'
      '  HORA = :HORA,'
      '  PERIODICIDADE = :PERIODICIDADE,'
      '  DTCOTACAO = :DTCOTACAO,'
      '  CAMINHO = :CAMINHO,'
      '  NOMEPLANILHA = :NOMEPLANILHA,'
      '  PRIMEIRALINHA = :PRIMEIRALINHA,'
      '  CODACAO = :CODACAO,'
      '  ABERTURA = :ABERTURA,'
      '  FECHAMENTO = :FECHAMENTO,'
      '  MAXIMA = :MAXIMA,'
      '  MINIMA = :MINIMA,'
      '  MEDIO = :MEDIO,'
      '  VOLUME = :VOLUME,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGTPCOTACAO = :FLGTPCOTACAO'
      'where'
      '  IDPARAMIMPEXCEL = :OLD_IDPARAMIMPEXCEL')
    InsertSQL.Strings = (
      'insert into CM.PARAMIMPORTEXCEL'
      
        '  (IDPARAMIMPEXCEL, IDBOLSAVALORES, NOMEPARAM, ATUALIZALINK, HOR' +
        'A, PERIODICIDADE, '
      
        '   DTCOTACAO, CAMINHO, NOMEPLANILHA, PRIMEIRALINHA, CODACAO, ABE' +
        'RTURA, '
      
        '   FECHAMENTO, MAXIMA, MINIMA, MEDIO, VOLUME, FLGATIVO, FLGTPCOT' +
        'ACAO)'
      'values'
      
        '  (:IDPARAMIMPEXCEL, :IDBOLSAVALORES, :NOMEPARAM, :ATUALIZALINK,' +
        ' :HORA, '
      
        '   :PERIODICIDADE, :DTCOTACAO, :CAMINHO, :NOMEPLANILHA, :PRIMEIR' +
        'ALINHA, '
      
        '   :CODACAO, :ABERTURA, :FECHAMENTO, :MAXIMA, :MINIMA, :MEDIO, :' +
        'VOLUME, '
      '   :FLGATIVO, :FLGTPCOTACAO)')
    DeleteSQL.Strings = (
      'delete from CM.PARAMIMPORTEXCEL'
      'where'
      '  IDPARAMIMPEXCEL = :OLD_IDPARAMIMPEXCEL')
    Left = 385
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BOLSAVALORES.SGLBOLSAVALORES'
      'PARAMIMPORTEXCEL.NOMEPARAM'
      'PARAMIMPORTEXCEL.DTCOTACAO'
      'PARAMIMPORTEXCEL.NOMEPLANILHA'
      'PARAMIMPORTEXCEL.PRIMEIRALINHA'
      'PARAMIMPORTEXCEL.CODACAO'
      'PARAMIMPORTEXCEL.ABERTURA'
      'PARAMIMPORTEXCEL.FECHAMENTO'
      'PARAMIMPORTEXCEL.MAXIMA'
      'PARAMIMPORTEXCEL.MINIMA'
      'PARAMIMPORTEXCEL.MEDIO'
      'PARAMIMPORTEXCEL.VOLUME'
      'PARAMIMPORTEXCEL.CAMINHO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Bolsa de Valores'
      'Nome do Parâmetro'
      'Data Cotação'
      'Planilha'
      'Primeira Linha'
      'Ação'
      'Abertura'
      'Fechamento'
      'Maxima'
      'Minima'
      'Medio'
      'Volume'
      'Caminho')
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
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMIMPORTEXCEL'
      'BOLSAVALORES')
    CamposChave.Strings = (
      'PARAMIMPORTEXCEL.IDPARAMIMPEXCEL')
    Filtro.Strings = (
      'PARAMIMPORTEXCEL.IDBOLSAVALORES=BOLSAVALORES.IDBOLSAVALORES(+)')
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
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '20'
      '10'
      '2'
      '2'
      '2'
      '2'
      '2'
      '2'
      '2'
      '40')
    Left = 293
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 281
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 265
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT  PAR.IDPARAMIMPEXCEL, PAR.IDBOLSAVALORES, PAR.NOMEPARAM, ' +
        'PAR.ATUALIZALINK, PAR.HORA,'
      
        #9'PAR.PERIODICIDADE, PAR.DTCOTACAO, PAR.CAMINHO, PAR.NOMEPLANILHA' +
        ', PAR.PRIMEIRALINHA, '
      
        #9'PAR.CODACAO, PAR.ABERTURA, PAR.FECHAMENTO, PAR.MAXIMA, PAR.MINI' +
        'MA, PAR.MEDIO, PAR.VOLUME, '
      #9'PAR.FLGATIVO, PAR.FLGTPCOTACAO'
      'FROM PARAMIMPORTEXCEL PAR'
      ' '
      ' ')
    Left = 413
    Top = 6
    object qryIDPARAMIMPEXCEL: TFloatField
      FieldName = 'IDPARAMIMPEXCEL'
      Origin = 'PARAMIMPORTEXCEL.IDPARAMIMPEXCEL'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'PARAMIMPORTEXCEL.IDBOLSAVALORES'
    end
    object qryNOMEPARAM: TStringField
      FieldName = 'NOMEPARAM'
      Origin = 'PARAMIMPORTEXCEL.NOMEPARAM'
      Size = 30
    end
    object qryATUALIZALINK: TStringField
      FieldName = 'ATUALIZALINK'
      Origin = 'PARAMIMPORTEXCEL.ATUALIZALINK'
      Size = 1
    end
    object qryHORA: TStringField
      FieldName = 'HORA'
      Origin = 'PARAMIMPORTEXCEL.HORA'
      Size = 5
    end
    object qryPERIODICIDADE: TStringField
      FieldName = 'PERIODICIDADE'
      Origin = 'PARAMIMPORTEXCEL.PERIODICIDADE'
      Size = 5
    end
    object qryDTCOTACAO: TDateTimeField
      FieldName = 'DTCOTACAO'
      Origin = 'PARAMIMPORTEXCEL.DTCOTACAO'
    end
    object qryCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Origin = 'PARAMIMPORTEXCEL.CAMINHO'
      Size = 40
    end
    object qryNOMEPLANILHA: TStringField
      FieldName = 'NOMEPLANILHA'
      Origin = 'PARAMIMPORTEXCEL.NOMEPLANILHA'
    end
    object qryPRIMEIRALINHA: TFloatField
      FieldName = 'PRIMEIRALINHA'
      Origin = 'PARAMIMPORTEXCEL.PRIMEIRALINHA'
    end
    object qryCODACAO: TStringField
      FieldName = 'CODACAO'
      Origin = 'PARAMIMPORTEXCEL.CODACAO'
      Size = 2
    end
    object qryABERTURA: TStringField
      FieldName = 'ABERTURA'
      Origin = 'PARAMIMPORTEXCEL.ABERTURA'
      Size = 2
    end
    object qryFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Origin = 'PARAMIMPORTEXCEL.FECHAMENTO'
      Size = 2
    end
    object qryMAXIMA: TStringField
      FieldName = 'MAXIMA'
      Origin = 'PARAMIMPORTEXCEL.MAXIMA'
      Size = 2
    end
    object qryMINIMA: TStringField
      FieldName = 'MINIMA'
      Origin = 'PARAMIMPORTEXCEL.MINIMA'
      Size = 2
    end
    object qryMEDIO: TStringField
      FieldName = 'MEDIO'
      Origin = 'PARAMIMPORTEXCEL.MEDIO'
      Size = 2
    end
    object qryVOLUME: TStringField
      FieldName = 'VOLUME'
      Origin = 'PARAMIMPORTEXCEL.VOLUME'
      Size = 2
    end
    object qryFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'PARAMIMPORTEXCEL.FLGATIVO'
      Size = 1
    end
    object qryFLGTPCOTACAO: TStringField
      FieldName = 'FLGTPCOTACAO'
      Origin = 'BASEDADOS.PARAMIMPORTEXCEL.FLGTPCOTACAO'
      FixedChar = True
      Size = 1
    end
  end
  object DsBolsaValores: TwwDataSource
    DataSet = QryBolsaValores
    Left = 204
    Top = 108
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES '
      ''
      'FROM BOLSAVALORES '
      ''
      'ORDER BY SGLBOLSAVALORES ')
    ValidateWithMask = True
    Left = 173
    Top = 108
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 'COTMECA.XLS'
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 510
    Top = 8
  end
  object QryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE FROM PARAMINVEST SET DATAULTIMPCOT = :DATAULTIMPCOT'
      ' ')
    ValidateWithMask = True
    Left = 461
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTIMPCOT'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
end
