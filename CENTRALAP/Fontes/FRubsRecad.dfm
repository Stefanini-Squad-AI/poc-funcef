inherited frmRubsRecad: TfrmRubsRecad
  Left = 105
  Top = 202
  HelpContext = 190008
  Caption = 'Rubs de Recadastramento'
  ClientHeight = 305
  ClientWidth = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 583
    Height = 266
    object Label2: TLabel
      Left = 24
      Top = 165
      Width = 60
      Height = 13
      Caption = 'A partir de'
    end
    object Bevel2: TBevel
      Left = 16
      Top = 29
      Width = 258
      Height = 129
    end
    object Label4: TLabel
      Left = 24
      Top = 45
      Width = 105
      Height = 13
      Caption = 'Benefício/Servico'
    end
    object Label1: TLabel
      Left = 24
      Top = 99
      Width = 90
      Height = 13
      Caption = 'Modelo de RUB'
    end
    object Label6: TLabel
      Left = 32
      Top = 22
      Width = 37
      Height = 13
      Caption = 'Titular'
    end
    object Bevel3: TBevel
      Left = 310
      Top = 29
      Width = 258
      Height = 129
    end
    object Label3: TLabel
      Left = 317
      Top = 99
      Width = 90
      Height = 13
      Caption = 'Modelo de RUB'
    end
    object Label5: TLabel
      Left = 317
      Top = 45
      Width = 105
      Height = 13
      Caption = 'Benefício/Servico'
    end
    object Label7: TLabel
      Left = 328
      Top = 22
      Width = 70
      Height = 13
      Caption = 'Dependente'
    end
    object DTPaPartir: TCMDateTimePicker
      Left = 25
      Top = 181
      Width = 121
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
    object DBLkBenefServicoDepend: TwwDBLookupCombo
      Left = 319
      Top = 64
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryBenefServicoDepend
      LookupField = 'NOME'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DBLkBenefServicoTitularChange
    end
    object DBLkBenefServicoTitular: TwwDBLookupCombo
      Left = 25
      Top = 64
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryBenefServicoTitular
      LookupField = 'IDSERVICOS'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DBLkBenefServicoTitularChange
    end
    object DBLKConfigRubTitular: TwwDBLookupCombo
      Left = 25
      Top = 115
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRUB'#9'60'#9'DESCRUB'#9'F')
      LookupTable = qryConfigRubTitular
      LookupField = 'IDCONFIGRUBS'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DBLkBenefServicoTitularChange
    end
    object DBLKConfigRubDepend: TwwDBLookupCombo
      Left = 319
      Top = 115
      Width = 241
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRUB'#9'60'#9'DESCRUB'#9'F')
      LookupTable = qryConfigRubDepend
      LookupField = 'IDCONFIGRUBS'
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = DBLkBenefServicoTitularChange
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 231
      Width = 552
      Height = 20
      Min = 0
      Max = 100
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 266
    Width = 583
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 427
    Top = 179
  end
  object qryBENEFBFCIARIO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      'DISTINCT B.IDPESSOA, B.IDTITULAR, '
      '          B.IDPESSJUR, B.IDBENEFICIO, BN.NOME, '
      '          B.IDSITBENEFICIO, S.DESCRICAO,'
      '          BNP.IDPLANOPREV, B.DATAEMISSAORECAD'
      
        'FROM BENEFBFCIARIO B, BENEFICIO BN, SITBENEFICIO S, BENEFPLANPRE' +
        'V BNP'
      'WHERE 1=2'
      '')
    ValidateWithMask = True
    Left = 248
    Top = 192
    object qryBENEFBFCIARIOIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
    end
    object qryBENEFBFCIARIOIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDTITULAR'
    end
    object qryBENEFBFCIARIOIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
    end
    object qryBENEFBFCIARIOIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFPLANPREV.IDPLANOPREV'
    end
    object qryBENEFBFCIARIODATAEMISSAORECAD: TDateTimeField
      FieldName = 'DATAEMISSAORECAD'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAEMISSAORECAD'
    end
  end
  object qryConfigRubTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONFIGRUBS, DESCRUB'
      'FROM CONFIGRUBS '
      ''
      'ORDER BY DESCRUB')
    ValidateWithMask = True
    Left = 104
    Top = 80
    object qryConfigRubTitularDESCRUB: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.CONFIGRUBS.DESCRUB'
      Size = 60
    end
    object qryConfigRubTitularIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.CONFIGRUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object QryRubxBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  IDRUBXBENEFICIO,'
      '  IDPESSJUR, '
      '  IDPESSOA, '
      '  IDPLANOPREV, '
      '  IDBENEFICIO, '
      '  IDRUBS, '
      '  IDSITBENEF,'
      '  IDTITULAR'
      'from RUBXBENEFICIO'
      'where 1=2')
    UpdateObject = UpdQryRubxBenef
    ValidateWithMask = True
    Left = 141
    Top = 188
    object QryRubxBenefIDRUBXBENEFICIO: TFloatField
      FieldName = 'IDRUBXBENEFICIO'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDRUBXBENEFICIO'
    end
    object QryRubxBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSJUR'
    end
    object QryRubxBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSOA'
    end
    object QryRubxBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPLANOPREV'
    end
    object QryRubxBenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDBENEFICIO'
    end
    object QryRubxBenefIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDRUBS'
    end
    object QryRubxBenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDSITBENEF'
    end
    object QryRubxBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
  end
  object QryDocAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TP.IDDOCUMENTO , TP.NOMEDOCUMENTO'
      'FROM'
      '   TIPODOCXBENEF TB, DOCUMENTOS TP'
      'WHERE'
      '   (TB.IDBENEFICIO = :IDBENEFICIO) AND'
      '   (TB.IDDOCUMENTO = TP.IDDOCUMENTO)')
    ValidateWithMask = True
    Left = 213
    Top = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end>
    object QryDocAssocIDDOCUMENTO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object QryDocAssocNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
  end
  object UpdQryRubxBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBXBENEFICIO'
      'set'
      '  IDRUBXBENEFICIO = :IDRUBXBENEFICIO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDRUBS = :IDRUBS,'
      '  IDSITBENEF = :IDSITBENEF,'
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDRUBXBENEFICIO = :OLD_IDRUBXBENEFICIO')
    InsertSQL.Strings = (
      'insert into RUBXBENEFICIO'
      
        '  (IDRUBXBENEFICIO, IDPESSJUR, IDPESSOA, IDPLANOPREV, IDBENEFICI' +
        'O, '
      'IDRUBS, '
      '   IDSITBENEF, IDTITULAR)'
      'values'
      
        '  (:IDRUBXBENEFICIO, :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :IDBEN' +
        'EFICIO, '
      '   :IDRUBS, :IDSITBENEF, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from RUBXBENEFICIO'
      'where'
      '  IDRUBXBENEFICIO = :OLD_IDRUBXBENEFICIO')
    Left = 64
    Top = 200
  end
  object UpdRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBS'
      'set'
      '  IDRUBS = :IDRUBS,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  IDASSUNTOXATEND = :IDASSUNTOXATEND,'
      '  IDHISTLANCTO = :IDHISTLANCTO,'
      '  IDHISTBAIXA = :IDHISTBAIXA,'
      '  IDCANCELAMENTO = :IDCANCELAMENTO,'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  DATAGERACAO = :DATAGERACAO'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    InsertSQL.Strings = (
      'insert into RUBS'
      
        '  (IDRUBS, FLGSTATUS, IDASSUNTOXATEND, IDHISTLANCTO, IDHISTBAIXA' +
        ', '
      'IDCANCELAMENTO, '
      '   IDCONFIGRUBS, DATAGERACAO)'
      'values'
      
        '  (:IDRUBS, :FLGSTATUS, :IDASSUNTOXATEND, :IDHISTLANCTO, :IDHIST' +
        'BAIXA, '
      '   :IDCANCELAMENTO, :IDCONFIGRUBS, :DATAGERACAO)')
    DeleteSQL.Strings = (
      'delete from RUBS'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    Left = 320
    Top = 144
  end
  object qryRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  IDRUBS, '
      '  FLGSTATUS,'
      '  IDASSUNTOXATEND,'
      '  IDHISTLANCTO, '
      '  IDHISTBAIXA,'
      '  IDCANCELAMENTO,'
      '  IDCONFIGRUBS,'
      '  DATAGERACAO'
      'from  RUBS'
      'where 1=2'
      '')
    UpdateObject = UpdRubs
    ValidateWithMask = True
    Left = 280
    Top = 96
    object qryRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBS.IDRUBS'
    end
    object qryRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.RUBS.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryRubsIDASSUNTOXATEND: TFloatField
      FieldName = 'IDASSUNTOXATEND'
      Origin = 'BASEDADOS.RUBS.IDASSUNTOXATEND'
    end
    object qryRubsIDHISTLANCTO: TFloatField
      FieldName = 'IDHISTLANCTO'
      Origin = 'BASEDADOS.RUBS.IDHISTLANCTO'
    end
    object qryRubsIDHISTBAIXA: TFloatField
      FieldName = 'IDHISTBAIXA'
      Origin = 'BASEDADOS.RUBS.IDHISTBAIXA'
    end
    object qryRubsIDCANCELAMENTO: TFloatField
      FieldName = 'IDCANCELAMENTO'
      Origin = 'BASEDADOS.RUBS.IDCANCELAMENTO'
    end
    object qryRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryRubsDATAGERACAO: TDateTimeField
      FieldName = 'DATAGERACAO'
      Origin = 'BASEDADOS.RUBS.DATAGERACAO'
    end
  end
  object qryHistRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  IDHISTMOVRUBS, '
      '  IDRUBS, '
      '  FLGSTATUS, '
      '  HISTORICO, '
      '  DATAMOV'
      'from  HISTMOVRUBS'
      'where 1=2')
    UpdateObject = UpdHistRubs
    ValidateWithMask = True
    Left = 480
    Top = 152
    object qryHistRubsIDHISTMOVRUBS: TFloatField
      FieldName = 'IDHISTMOVRUBS'
      Origin = 'BASEDADOS.HISTMOVRUBS.IDHISTMOVRUBS'
    end
    object qryHistRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.HISTMOVRUBS.IDRUBS'
    end
    object qryHistRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.HISTMOVRUBS.FLGSTATUS'
      Size = 2
    end
    object qryHistRubsHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HISTMOVRUBS.HISTORICO'
      BlobType = ftMemo
      Size = 1000
    end
    object qryHistRubsDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
      Origin = 'BASEDADOS.HISTMOVRUBS.DATAMOV'
    end
  end
  object UpdHistRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  IDHISTMOVRUBS = :IDHISTMOVRUBS,'
      '  IDRUBS = :IDRUBS,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  HISTORICO = :HISTORICO,'
      '  DATAMOV = :DATAMOV'
      'where'
      '  IDHISTMOVRUBS = :OLD_IDHISTMOVRUBS')
    InsertSQL.Strings = (
      'insert into HISTMOVRUBS'
      '  (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, HISTORICO, DATAMOV)'
      'values'
      '  (:IDHISTMOVRUBS, :IDRUBS, :FLGSTATUS, :HISTORICO, :DATAMOV)')
    DeleteSQL.Strings = (
      'delete from HISTMOVRUBS'
      'where'
      '  IDHISTMOVRUBS = :OLD_IDHISTMOVRUBS')
    Left = 336
    Top = 200
  end
  object UpdqryTipoDocXrub: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCXRUB'
      'set'
      '  IDRUBXBENEFICIO = :IDRUBXBENEFICIO,'
      '  IDTIPODOCXRUB = :IDTIPODOCXRUB,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  DATARECEB = :DATARECEB,'
      '  FLGRECEBIDO = :FLGRECEBIDO'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    InsertSQL.Strings = (
      'insert into TIPODOCXRUB'
      '  (IDRUBXBENEFICIO, IDTIPODOCXRUB, IDDOCUMENTO, DATARECEB, '
      'FLGRECEBIDO)'
      'values'
      '  (:IDRUBXBENEFICIO, :IDTIPODOCXRUB, :IDDOCUMENTO, :DATARECEB, '
      ':FLGRECEBIDO)')
    DeleteSQL.Strings = (
      'delete from TIPODOCXRUB'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    Left = 272
    Top = 24
  end
  object qryTipodocXrub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '    IDRUBXBENEFICIO,'
      '    IDTIPODOCXRUB, '
      '    IDDOCUMENTO,'
      '    DATARECEB,'
      '    FLGRECEBIDO'
      'from TIPODOCXRUB'
      'where 1=2')
    UpdateObject = UpdqryTipoDocXrub
    ValidateWithMask = True
    Left = 496
    Top = 184
    object qryTipodocXrubIDRUBXBENEFICIO: TFloatField
      FieldName = 'IDRUBXBENEFICIO'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDRUBXBENEFICIO'
    end
    object qryTipodocXrubIDTIPODOCXRUB: TFloatField
      FieldName = 'IDTIPODOCXRUB'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDTIPODOCXRUB'
    end
    object qryTipodocXrubIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDDOCUMENTO'
    end
    object qryTipodocXrubDATARECEB: TDateTimeField
      FieldName = 'DATARECEB'
      Origin = 'BASEDADOS.TIPODOCXRUB.DATARECEB'
    end
    object qryTipodocXrubFLGRECEBIDO: TStringField
      FieldName = 'FLGRECEBIDO'
      Origin = 'BASEDADOS.TIPODOCXRUB.FLGRECEBIDO'
      FixedChar = True
      Size = 1
    end
  end
  object qryBenefServicoTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDSERVICOS,'
      '   NOME,'
      '   IDREGRA '
      'FROM SERVICO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 168
    Top = 8
    object qryBenefServicoTitularNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.SERVICO.NOME'
      Size = 60
    end
    object qryBenefServicoTitularIDSERVICOS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSERVICOS'
      Origin = 'BASEDADOS.SERVICO.IDSERVICOS'
      Visible = False
    end
    object qryBenefServicoTitularIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.SERVICO.IDREGRA'
      Visible = False
    end
  end
  object qryBenefServicoDepend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDSERVICOS,'
      '   NOME,'
      '   IDREGRA '
      'FROM SERVICO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 473
    Top = 3
    object qryBenefServicoDependNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.SERVICO.NOME'
      Size = 60
    end
    object qryBenefServicoDependIDSERVICOS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSERVICOS'
      Origin = 'BASEDADOS.SERVICO.IDSERVICOS'
      Visible = False
    end
    object qryBenefServicoDependIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.SERVICO.IDREGRA'
      Visible = False
    end
  end
  object qryConfigRubDepend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONFIGRUBS, DESCRUB'
      'FROM CONFIGRUBS '
      ''
      'ORDER BY DESCRUB')
    ValidateWithMask = True
    Left = 462
    Top = 48
    object qryConfigRubDependDESCRUB: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.CONFIGRUBS.DESCRUB'
      Size = 60
    end
    object qryConfigRubDependIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.CONFIGRUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object qryCheckRubs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RB.IDPESSOA,'
      '  R.IDRUBS,'
      '  R.DATAGERACAO'
      'FROM RUBS R, RUBXBENEFICIO RB'
      'WHERE R.IDRUBS = RB.IDRUBS AND'
      '      R.DATAGERACAO IS NOT NULL AND'
      '      RB.IDPLANOPREV IS NULL AND'
      '      RB.IDPESSJUR IS NULL')
    ValidateWithMask = True
    Left = 392
    Top = 136
    object qryCheckRubsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSOA'
    end
    object qryCheckRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBS.IDRUBS'
    end
    object qryCheckRubsDATAGERACAO: TDateTimeField
      FieldName = 'DATAGERACAO'
      Origin = 'BASEDADOS.RUBS.DATAGERACAO'
    end
  end
end
