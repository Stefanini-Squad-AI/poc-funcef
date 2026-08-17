inherited frmExecTranfTipoImovel: TfrmExecTranfTipoImovel
  Left = 34
  Top = 148
  HelpContext = 640032
  BorderStyle = bsSingle
  Caption = 'Transferência de Tipo de Imóvel'
  ClientHeight = 433
  ClientWidth = 616
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 49
    Width = 616
    Height = 299
    object Label4: TLabel
      Left = 16
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Imóvel Mestre'
    end
    object Label5: TLabel
      Left = 16
      Top = 50
      Width = 38
      Height = 13
      Caption = 'Imóvel'
    end
    object Label7: TLabel
      Left = 16
      Top = 210
      Width = 137
      Height = 13
      Caption = 'Observações do Evento'
    end
    object Image1: TImage
      Left = 285
      Top = 154
      Width = 50
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D617036020000424D360200000000000076000000280000003200
        0000100000000100040000000000C00100000000000000000000100000000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777777777777777777777777777777777777777770000007777
        7777777777777777777777777777777777777777777777000000777777777777
        7777777777777777777777777777777777777700000077777777777777777777
        7777777777777777777777887777770000007777777777777777777777777777
        7777777777777008877777000000777777777777777777777777777777777777
        777770F08877770000007777788888888888888888888888888888888888880F
        0887770000007777000000000000000000000000000000000000000FF0887700
        000077770FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07770000007777
        000000000000000000000000000000000000000FF07777000000777777777777
        7777777777777777777777777777770F07777700000077777777777777777777
        7777777777777777777770F07777770000007777777777777777777777777777
        7777777777777007777777000000777777777777777777777777777777777777
        7777777777777700000077777777777777777777777777777777777777777777
        7777770000007777777777777777777777777777777777777777777777777700
        0000}
    end
    object TGroupBox
      Left = 16
      Top = 120
      Width = 257
      Height = 73
      Enabled = False
      TabOrder = 0
      object Label20: TLabel
        Left = 16
        Top = 18
        Width = 85
        Height = 13
        Caption = 'Tipo de Imóvel'
      end
      object edtTipoImovel: TEdit
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 344
      Top = 120
      Width = 257
      Height = 73
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 85
        Height = 13
        Caption = 'Tipo de Imóvel'
      end
      object DBcboTipoImovel: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOIMOVEL'#9'38'#9'DESCTIPOIMOVEL')
        LookupTable = qryLookTipoPara
        LookupField = 'CODTIPIMOVEL'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object Panel4: TPanel
      Left = 16
      Top = 104
      Width = 257
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'De'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 344
      Top = 104
      Width = 257
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Para'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtImovelMestre: TEdit
      Left = 16
      Top = 24
      Width = 561
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object edtImovel: TEdit
      Left = 16
      Top = 64
      Width = 561
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object btnBuscaImovel: TBitBtn
      Left = 576
      Top = 64
      Width = 24
      Height = 22
      Hint = 'Busca o Imóvel'
      TabOrder = 6
      OnClick = btnBuscaImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      NumGlyphs = 2
    end
    object btnBuscaMestre: TBitBtn
      Left = 576
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca o Imóvel Mestre'
      TabOrder = 7
      OnClick = btnBuscaMestreClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      NumGlyphs = 2
    end
    object memEvento: TMemo
      Left = 16
      Top = 224
      Width = 585
      Height = 57
      MaxLength = 2000
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 616
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Confirmar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  object pnlData: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 49
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 348
      Top = 18
      Width = 136
      Height = 13
      Caption = 'Data da Transferência: '
    end
    object edtDataTransf: TCMDateTimePicker
      Left = 488
      Top = 14
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 616
    Height = 52
    Align = alBottom
    TabOrder = 3
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 220
      Height = 13
      Caption = 'Processando transferência dos Bens...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 508
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 585
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object qryBemXImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IXBGRUPO,'
      '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,'
      '   I.CODTIPIMOVEL,'
      '   B.DESBEM AS NOME_BEM, B.IDGRUPO, B.IDCONJUNTO'
      'FROM'
      '   IMOVEL I, IMOVEL IM, BEM B,'
      '   IMOVELXBEM IXB'
      'WHERE'
      '   ( IXB.IDIMOVEL =:IMOVEL )'
      '   AND ( IXB.IDPESSOA =:EMPRESAPROP )'
      '   AND ( IXB.IDBEM = B.IDBEM )'
      '   AND ( IXB.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( B.BAIXATOTAL = '#39'N'#39' )'
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryBemXImovelIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'IMOVELXBEM.IDBEM'
    end
    object qryBemXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVELXBEM.IDIMOVEL'
    end
    object qryBemXImovelIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'IMOVELXBEM.IXBGRUPO'
      Size = 1
    end
    object qryBemXImovelIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BEM.IDGRUPO'
    end
    object qryBemXImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryBemXImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryBemXImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryBemXImovelNOME_BEM: TStringField
      FieldName = 'NOME_BEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
    object qryBemXImovelIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BEM.IDCONJUNTO'
    end
  end
  object qryLookTipoPara: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.CODTIPIMOVEL, T.DESCTIPOIMOVEL,'
      ''
      '   T.IDGRUPOTERRENO,'
      '   T.IDGRUPOEDIFICACAO,'
      '   T.IDGRUPOINST,'
      '   T.IDGRUPOELET,'
      '   T.IDGRUPOAR,'
      '   T.IDGRUPOUTILITARIO,'
      '   T.IDGRUPOMAQUINA,'
      '   T.IDGRUPOVEICULO,'
      '   T.IDGRUPOMOVEL'
      ''
      'FROM'
      '   TIPOIMOVEL T'
      ''
      'ORDER BY'
      '   T.DESCTIPOIMOVEL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 141
    Top = 17
    object StringField2: TStringField
      DisplayWidth = 38
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
    object StringField3: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'CODTIPIMOVEL'
      Origin = 'TIPOIMOVEL.CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryLookTipoParaIDGRUPOEDIFICACAO: TFloatField
      FieldName = 'IDGRUPOEDIFICACAO'
      Origin = 'TIPOIMOVEL.IDGRUPOEDIFICACAO'
      Visible = False
    end
    object qryLookTipoParaIDGRUPOTERRENO: TFloatField
      FieldName = 'IDGRUPOTERRENO'
      Origin = 'TIPOIMOVEL.IDGRUPOTERRENO'
      Visible = False
    end
    object qryLookTipoParaIDGRUPOINST: TFloatField
      FieldName = 'IDGRUPOINST'
      Origin = 'TIPOIMOVEL.IDGRUPOINST'
      Visible = False
    end
    object qryLookTipoParaIDGRUPOELET: TFloatField
      FieldName = 'IDGRUPOELET'
      Origin = 'TIPOIMOVEL.IDGRUPOELET'
      Visible = False
    end
    object qryLookTipoParaIDGRUPOAR: TFloatField
      FieldName = 'IDGRUPOAR'
    end
    object qryLookTipoParaIDGRUPOUTILITARIO: TFloatField
      FieldName = 'IDGRUPOUTILITARIO'
    end
    object qryLookTipoParaIDGRUPOMAQUINA: TFloatField
      FieldName = 'IDGRUPOMAQUINA'
    end
    object qryLookTipoParaIDGRUPOVEICULO: TFloatField
      FieldName = 'IDGRUPOVEICULO'
    end
    object qryLookTipoParaIDGRUPOMOVEL: TFloatField
      FieldName = 'IDGRUPOMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.IDGRUPOMOVEL'
    end
  end
  object qryBemXMestre: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IXB.IDBEM, IXB.IDIMOVEL, IXB.IXBGRUPO,'
      '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,'
      '   I.CODTIPIMOVEL,'
      '   B.DESBEM AS NOME_BEM, B.IDGRUPO, B.IDCONJUNTO'
      ''
      'FROM'
      '   IMOVELXBEM IXB, BEM B, IMOVEL I, IMOVEL IM'
      ''
      'WHERE'
      '   ( IM.IDIMOVEL =:MESTRE )'
      '   AND ( IXB.IDPESSOA =:EMPRESAPROP )'
      '   AND ( IM.IDIMOVEL = I.IDIMOVELMESTRE )'
      '   AND ( IXB.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( IXB.IDBEM = B.IDBEM )'
      '   AND ( B.BAIXATOTAL = '#39'N'#39' )'
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryBemXMestreIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'IMOVELXBEM.IDBEM'
    end
    object qryBemXMestreIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVELXBEM.IDIMOVEL'
    end
    object qryBemXMestreIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Origin = 'IMOVELXBEM.IXBGRUPO'
      Size = 1
    end
    object qryBemXMestreIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BEM.IDGRUPO'
    end
    object qryBemXMestreCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryBemXMestreNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryBemXMestreNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryBemXMestreNOME_BEM: TStringField
      FieldName = 'NOME_BEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
    object qryBemXMestreIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BEM.IDCONJUNTO'
    end
  end
  object qryTrocaTipoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      ''
      'SET'
      '   CODTIPIMOVEL =:TIPO'
      ''
      'WHERE'
      '   IDIMOVEL =:IMOVEL'
      ''
      'OR ( FLGTIPOIMOVEL = 2 AND IDIMOVELPAI = :IMOVEL )')
    ValidateWithMask = True
    Left = 245
    Top = 29
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryTrocaTipoMestre: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      ''
      'SET'
      '   CODTIPIMOVEL =:PCODTIPIMOVEL'
      ''
      'WHERE'
      '   ( IDIMOVELMESTRE =:PIDIMOVELMESTRE )')
    ValidateWithMask = True
    Left = 245
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end>
  end
  object qryImovelEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDIMOVEL'
      ''
      'FROM'
      '   IMOVEL'
      ''
      'WHERE'
      '   ( (:PIDIMOVEL IS NULL) OR (IDIMOVEL =:PIDIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (IDIMOVELMESTRE =:PIDIMOV' +
        'ELMESTRE) )'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 245
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end>
    object qryImovelEventoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.IDIMOVEL'
    end
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 277
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 261
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 247
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 232
  end
  object cdsLocalizacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 218
  end
end
