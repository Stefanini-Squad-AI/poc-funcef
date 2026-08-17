inherited FrmImportaCotacoesBeta: TFrmImportaCotacoesBeta
  Left = 365
  Top = 178
  HelpContext = 790007
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Importar Cotações Beta'
  ClientHeight = 160
  ClientWidth = 351
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 16
    Top = 152
    Width = 100
    Height = 13
    Caption = 'Nome da Planilha'
  end
  inherited Dock971: TDock97 [1]
    Top = 121
    Width = 351
    inherited tb97Fundo: TToolbar97
      Left = 178
      DockPos = 178
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 9
      DockPos = 9
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 351
    Height = 121
    object Label3: TLabel
      Left = 24
      Top = 22
      Width = 101
      Height = 13
      Caption = 'Data da Cotação '
    end
    object LbProcesso: TLabel
      Left = 26
      Top = 70
      Width = 25
      Height = 13
      Caption = '      '
    end
    object DateEdit1: TCMDateTimePicker
      Left = 24
      Top = 38
      Width = 113
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
      Left = 1
      Top = 99
      Width = 349
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 331
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryCotacoes: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 238
    Top = 15
  end
  object DsCotacoes: TwwDataSource
    DataSet = QryCotacoes
    Left = 238
    Top = 63
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 294
    Top = 15
  end
  object DsAux: TwwDataSource
    DataSet = QryAux
    Left = 294
    Top = 71
  end
  object QryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPARAMIMPEXCEL, IDBOLSAVALORES, NOMEPARAM,  ATUALIZALINK' +
        ', HORA, PERIODICIDADE,'
      
        'DTCOTACAO, NOMEPLANILHA, PRIMEIRALINHA, CODACAO, ABERTURA, CAMIN' +
        'HO,'
      'FECHAMENTO, MAXIMA, MINIMA, MEDIO, VOLUME'
      ''
      'FROM PARAMIMPORTEXCEL'
      ''
      'WHERE FLGTPCOTACAO = '#39'B'#39
      ''
      'ORDER BY NOMEPARAM'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 15
    object QryParamNOMEPARAM: TStringField
      DisplayLabel = 'Parametro de Importação'
      DisplayWidth = 40
      FieldName = 'NOMEPARAM'
      Origin = '"CM.PARAMIMPORTEXCEL".NOMEPARAM'
      Size = 30
    end
    object QryParamIDBOLSAVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = '"CM.PARAMIMPORTEXCEL".IDBOLSAVALORES'
      Visible = False
    end
    object QryParamATUALIZALINK: TStringField
      DisplayWidth = 1
      FieldName = 'ATUALIZALINK'
      Origin = '"CM.PARAMIMPORTEXCEL".ATUALIZALINK'
      Visible = False
      Size = 1
    end
    object QryParamHORA: TStringField
      DisplayWidth = 5
      FieldName = 'HORA'
      Origin = '"CM.PARAMIMPORTEXCEL".HORA'
      Visible = False
      Size = 5
    end
    object QryParamPERIODICIDADE: TStringField
      DisplayWidth = 5
      FieldName = 'PERIODICIDADE'
      Origin = '"CM.PARAMIMPORTEXCEL".PERIODICIDADE'
      Visible = False
      Size = 5
    end
    object QryParamDTCOTACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTCOTACAO'
      Origin = '"CM.PARAMIMPORTEXCEL".DTCOTACAO'
      Visible = False
    end
    object QryParamNOMEPLANILHA: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEPLANILHA'
      Origin = '"CM.PARAMIMPORTEXCEL".NOMEPLANILHA'
      Visible = False
    end
    object QryParamPRIMEIRALINHA: TFloatField
      DisplayWidth = 10
      FieldName = 'PRIMEIRALINHA'
      Origin = '"CM.PARAMIMPORTEXCEL".PRIMEIRALINHA'
      Visible = False
    end
    object QryParamCODACAO: TStringField
      DisplayWidth = 2
      FieldName = 'CODACAO'
      Origin = '"CM.PARAMIMPORTEXCEL".CODACAO'
      Visible = False
      Size = 2
    end
    object QryParamABERTURA: TStringField
      DisplayWidth = 2
      FieldName = 'ABERTURA'
      Origin = '"CM.PARAMIMPORTEXCEL".ABERTURA'
      Visible = False
      Size = 2
    end
    object QryParamCAMINHO: TStringField
      DisplayWidth = 40
      FieldName = 'CAMINHO'
      Origin = '"CM.PARAMIMPORTEXCEL".CAMINHO'
      Visible = False
      Size = 40
    end
    object QryParamFECHAMENTO: TStringField
      DisplayWidth = 2
      FieldName = 'FECHAMENTO'
      Origin = '"CM.PARAMIMPORTEXCEL".FECHAMENTO'
      Visible = False
      Size = 2
    end
    object QryParamMAXIMA: TStringField
      DisplayWidth = 2
      FieldName = 'MAXIMA'
      Origin = '"CM.PARAMIMPORTEXCEL".MAXIMA'
      Visible = False
      Size = 2
    end
    object QryParamMINIMA: TStringField
      DisplayWidth = 2
      FieldName = 'MINIMA'
      Origin = '"CM.PARAMIMPORTEXCEL".MINIMA'
      Visible = False
      Size = 2
    end
    object QryParamMEDIO: TStringField
      DisplayWidth = 2
      FieldName = 'MEDIO'
      Origin = '"CM.PARAMIMPORTEXCEL".MEDIO'
      Visible = False
      Size = 2
    end
    object QryParamVOLUME: TStringField
      DisplayWidth = 2
      FieldName = 'VOLUME'
      Origin = '"CM.PARAMIMPORTEXCEL".VOLUME'
      Visible = False
      Size = 2
    end
    object QryParamIDPARAMIMPEXCEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARAMIMPEXCEL'
      Origin = 'BASEDADOS.PARAMIMPORTEXCEL.IDPARAMIMPEXCEL'
      Visible = False
    end
  end
  object QryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTIMPCOT = :DATAULTIMPCOT'
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 64
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
  object qryDelCotacoes: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 40
    Top = 63
  end
end
