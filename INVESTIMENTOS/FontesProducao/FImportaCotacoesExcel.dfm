inherited FrmImportaCotacoesExcel: TFrmImportaCotacoesExcel
  Left = 330
  Top = 168
  HelpContext = 790270
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Operação'
  ClientHeight = 422
  ClientWidth = 348
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 16
    Top = 152
    Width = 100
    Height = 13
    Caption = 'Nome da Planilha'
  end
  inherited pnlFundo: TPanel
    Width = 348
    Height = 383
    OnEnter = pnlFundoEnter
    inherited bvlSepTit: TBevel
      Width = 346
    end
    object Label1: TLabel [1]
      Left = 17
      Top = 98
      Width = 197
      Height = 13
      Caption = 'Indique o Caminho para o Arquivo '
    end
    object SB1: TSpeedButton [2]
      Left = 307
      Top = 113
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
    object Label2: TLabel [3]
      Left = 17
      Top = 56
      Width = 100
      Height = 13
      Caption = 'Bolsa de Valores '
    end
    object Label5: TLabel [4]
      Left = 17
      Top = 144
      Width = 100
      Height = 13
      Caption = 'Nome da Planilha'
    end
    object Label14: TLabel [5]
      Left = 196
      Top = 144
      Width = 133
      Height = 13
      Caption = 'Primeira linha de dados'
    end
    object LbProcesso: TLabel [6]
      Left = 17
      Top = 345
      Width = 5
      Height = 13
    end
    object Label3: TLabel [7]
      Left = 224
      Top = 54
      Width = 101
      Height = 13
      Caption = 'Data da Cotação '
    end
    inherited pnlTitulo: TPanel
      Width = 346
      TabOrder = 15
      inherited lbNomDescricao: TfcLabel
        Width = 225
        Caption = 'Importa cotação Excel'
      end
    end
    object grpColunas: TGroupBox
      Left = 17
      Top = 217
      Width = 312
      Height = 124
      Caption = ' Colunas Importadas '
      TabOrder = 11
      object Label13: TLabel
        Left = 192
        Top = 100
        Width = 42
        Height = 13
        Caption = 'Volume'
      end
      object Label11: TLabel
        Left = 192
        Top = 74
        Width = 35
        Height = 13
        Caption = 'Médio'
      end
      object Label10: TLabel
        Left = 192
        Top = 47
        Width = 42
        Height = 13
        Caption = 'Mínima'
      end
      object Label9: TLabel
        Left = 192
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Máxima'
      end
      object Label6: TLabel
        Left = 24
        Top = 20
        Width = 73
        Height = 13
        Caption = 'Código Ação'
      end
      object Label7: TLabel
        Left = 24
        Top = 47
        Width = 49
        Height = 13
        Caption = 'Abertura'
      end
      object Label8: TLabel
        Left = 24
        Top = 74
        Width = 70
        Height = 13
        Caption = 'Fechamento'
      end
    end
    object edtArquivo: TEdit
      Left = 17
      Top = 114
      Width = 289
      Height = 21
      TabOrder = 1
    end
    object DbLkcBolsa: TwwDBLookupCombo
      Left = 17
      Top = 70
      Width = 200
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
      LookupTable = QryBolsaValores
      LookupField = 'IDBOLSAVALORES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = DbLkcBolsaExit
    end
    object edtPlanilha: TEdit
      Left = 17
      Top = 160
      Width = 158
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edtCodAcao: TEdit
      Left = 126
      Top = 235
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 4
    end
    object edtAbert: TEdit
      Left = 126
      Top = 261
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 5
    end
    object edtMax: TEdit
      Left = 272
      Top = 235
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 7
    end
    object edtMin: TEdit
      Left = 272
      Top = 261
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 8
    end
    object edtMedio: TEdit
      Left = 272
      Top = 287
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 9
    end
    object edtVolume: TEdit
      Left = 272
      Top = 313
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 10
    end
    object edtFecha: TEdit
      Left = 126
      Top = 287
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 6
    end
    object edtlinha: TEdit
      Left = 196
      Top = 161
      Width = 132
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object ChBxVisualiza: TCheckBox
      Left = 17
      Top = 192
      Width = 176
      Height = 17
      Caption = 'Visualizar Comunicação '
      TabOrder = 12
    end
    object prgAndamento: TProgressBar
      Left = 1
      Top = 361
      Width = 346
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 13
    end
    object dteDataImportacao: TCMDateTimePicker
      Left = 224
      Top = 70
      Width = 106
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
      TabOrder = 14
    end
  end
  inherited Dock971: TDock97
    Top = 383
    Width = 348
    inherited tb97Fundo: TToolbar97
      Left = 176
      DockPos = 178
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 7
      DockPos = 9
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object OpenDialog1: TOpenDialog
    FileName = 'COTMECA.XLS'
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 86
    Top = 20
  end
  object QryCotacoes: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 42
    Top = 143
  end
  object DsCotacoes: TwwDataSource
    DataSet = QryCotacoes
    Left = 114
    Top = 143
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 42
    Top = 191
  end
  object DsAux: TwwDataSource
    DataSet = QryAux
    Left = 114
    Top = 191
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
    Left = 42
    Top = 97
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
  object DsBolsaValores: TwwDataSource
    DataSet = QryBolsaValores
    Left = 114
    Top = 97
  end
  object QryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBOLSAVALORES, NOMEPARAM,  ATUALIZALINK, HORA, PERIODICI' +
        'DADE,'
      
        'DTCOTACAO, NOMEPLANILHA, PRIMEIRALINHA, CODACAO, ABERTURA, CAMIN' +
        'HO,'
      'FECHAMENTO, MAXIMA, MINIMA, MEDIO, VOLUME'
      ''
      'FROM PARAMIMPORTEXCEL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 9
    object QryParamIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'PARAMIMPORTEXCEL.IDBOLSAVALORES'
    end
    object QryParamNOMEPARAM: TStringField
      FieldName = 'NOMEPARAM'
      Origin = 'PARAMIMPORTEXCEL.NOMEPARAM'
      Size = 30
    end
    object QryParamATUALIZALINK: TStringField
      FieldName = 'ATUALIZALINK'
      Origin = 'PARAMIMPORTEXCEL.ATUALIZALINK'
      Size = 1
    end
    object QryParamHORA: TStringField
      FieldName = 'HORA'
      Origin = 'PARAMIMPORTEXCEL.HORA'
      Size = 5
    end
    object QryParamPERIODICIDADE: TStringField
      FieldName = 'PERIODICIDADE'
      Origin = 'PARAMIMPORTEXCEL.PERIODICIDADE'
      Size = 5
    end
    object QryParamDTCOTACAO: TDateTimeField
      FieldName = 'DTCOTACAO'
      Origin = 'PARAMIMPORTEXCEL.DTCOTACAO'
    end
    object QryParamNOMEPLANILHA: TStringField
      FieldName = 'NOMEPLANILHA'
      Origin = 'PARAMIMPORTEXCEL.NOMEPLANILHA'
    end
    object QryParamPRIMEIRALINHA: TFloatField
      FieldName = 'PRIMEIRALINHA'
      Origin = 'PARAMIMPORTEXCEL.PRIMEIRALINHA'
    end
    object QryParamCODACAO: TStringField
      FieldName = 'CODACAO'
      Origin = 'PARAMIMPORTEXCEL.CODACAO'
      Size = 2
    end
    object QryParamABERTURA: TStringField
      FieldName = 'ABERTURA'
      Origin = 'PARAMIMPORTEXCEL.ABERTURA'
      Size = 2
    end
    object QryParamCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Origin = 'PARAMIMPORTEXCEL.CAMINHO'
      Size = 40
    end
    object QryParamFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Origin = 'PARAMIMPORTEXCEL.FECHAMENTO'
      Size = 2
    end
    object QryParamMAXIMA: TStringField
      FieldName = 'MAXIMA'
      Origin = 'PARAMIMPORTEXCEL.MAXIMA'
      Size = 2
    end
    object QryParamMINIMA: TStringField
      FieldName = 'MINIMA'
      Origin = 'PARAMIMPORTEXCEL.MINIMA'
      Size = 2
    end
    object QryParamMEDIO: TStringField
      FieldName = 'MEDIO'
      Origin = 'PARAMIMPORTEXCEL.MEDIO'
      Size = 2
    end
    object QryParamVOLUME: TStringField
      FieldName = 'VOLUME'
      Origin = 'PARAMIMPORTEXCEL.VOLUME'
      Size = 2
    end
  end
  object QryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTIMPCOT = :DATAULTIMPCOT'
      ' ')
    ValidateWithMask = True
    Left = 269
    Top = 72
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
