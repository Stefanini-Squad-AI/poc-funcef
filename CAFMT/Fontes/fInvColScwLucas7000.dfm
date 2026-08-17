inherited frmInvColScwLucas7000: TfrmInvColScwLucas7000
  Left = 226
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Coletor de Dados SCW Lucas 7000'
  ClientHeight = 175
  ClientWidth = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 136
    object btnSelMov: TSpeedButton
      Left = 308
      Top = 96
      Width = 22
      Height = 21
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = btnSelMovClick
    end
    object Label1: TLabel
      Left = 9
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object pnlOperacao: TPanel
      Left = 5
      Top = 5
      Width = 329
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object rdgpOper: TRadioGroup
        Left = 0
        Top = -1
        Width = 329
        Height = 70
        Caption = 'Operação'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Transmissão'
          'Recepção')
        TabOrder = 0
      end
    end
    object edNomeArq: TEdit
      Left = 8
      Top = 96
      Width = 300
      Height = 21
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 136
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 160
      Top = 40
      Width = 185
      Height = 105
      Caption = 'GroupBox1'
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, CDPORTA, CDVELOC, CDPATH, DIGMASCPLACA'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDEMPRESA)')
    Params.Data = {010001000A504944454D50524553410006080000000000000000000000}
    UpdateObject = updParam
    ValidateWithMask = True
    Left = 144
    Top = 240
    object qryParamCDPORTA: TFloatField
      FieldName = 'CDPORTA'
      Origin = 'PARAMETROSCAFMANUT.CDPORTA'
    end
    object qryParamCDVELOC: TStringField
      FieldName = 'CDVELOC'
      Origin = 'PARAMETROSCAFMANUT.CDVELOC'
      Size = 6
    end
    object qryParamIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMETROSCAFMANUT.IDPESSOA'
    end
    object qryParamCDPATH: TStringField
      FieldName = 'CDPATH'
      Size = 128
    end
    object qryParamDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
  end
  object updParam: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMETROSCAFMANUT'
      'set'
      '  CDPORTA = :CDPORTA,'
      '  CDVELOC = :CDVELOC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMETROSCAFMANUT'
      '  (CDPORTA, CDVELOC)'
      'values'
      '  (:CDPORTA, :CDVELOC)')
    DeleteSQL.Strings = (
      'delete from PARAMETROSCAFMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 200
    Top = 240
  end
  object qryBuscaConjunto: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDCONJUNTO'
      'FROM CONJUNTO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (IDPESSOA      = :PIDEMPRESA)')
    Params.Data = {
      01000200085049444C4F43414C000304000000000000000A504944454D505245
      53410006080000000000000000000000}
    ValidateWithMask = True
    Left = 272
    Top = 240
    object qryBuscaConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
    end
  end
  object qryBuscaBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDINVENTARIOBENS, IDEMPRESA, IIBPLACA, IIBLOCALATUAL, IIB' +
        'CONJUNTOATUAL,'
      
        '       IIBFLGPLACA, IIBLOCALNOVO, IIBCONJUNTONOVO, IIBFLGSITFISI' +
        'CA'
      'FROM ITENSINVBENS'
      'WHERE (IDINVENTARIOBENS = :IDINVENTARIOBENS)'
      '  AND (IDEMPRESA = :IDEMPRESA)'
      '  AND (IIBPLACA = :IIBPLACA)')
    Params.Data = {
      01000300104944494E56454E544152494F42454E530006080000000000000000
      000000094944454D505245534100060800000000000000000000000849494250
      4C4143410006080000000000000000000000}
    ValidateWithMask = True
    Left = 360
    Top = 240
    object qryBuscaBemIDINVENTARIOBENS: TFloatField
      FieldName = 'IDINVENTARIOBENS'
      Origin = '"CM.ITENSINVBENS".IDINVENTARIOBENS'
    end
    object qryBuscaBemIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.ITENSINVBENS".IDEMPRESA'
    end
    object qryBuscaBemIIBPLACA: TFloatField
      FieldName = 'IIBPLACA'
      Origin = '"CM.ITENSINVBENS".IIBPLACA'
    end
    object qryBuscaBemIIBLOCALATUAL: TFloatField
      FieldName = 'IIBLOCALATUAL'
      Origin = '"CM.ITENSINVBENS".IIBLOCALATUAL'
    end
    object qryBuscaBemIIBCONJUNTOATUAL: TFloatField
      FieldName = 'IIBCONJUNTOATUAL'
      Origin = '"CM.ITENSINVBENS".IIBCONJUNTOATUAL'
    end
    object qryBuscaBemIIBFLGPLACA: TFloatField
      FieldName = 'IIBFLGPLACA'
      Origin = '"CM.ITENSINVBENS".IIBFLGPLACA'
    end
    object qryBuscaBemIIBLOCALNOVO: TFloatField
      FieldName = 'IIBLOCALNOVO'
      Origin = '"CM.ITENSINVBENS".IIBLOCALNOVO'
    end
    object qryBuscaBemIIBCONJUNTONOVO: TFloatField
      FieldName = 'IIBCONJUNTONOVO'
      Origin = '"CM.ITENSINVBENS".IIBCONJUNTONOVO'
    end
    object qryBuscaBemIIBFLGSITFISICA: TFloatField
      FieldName = 'IIBFLGSITFISICA'
      Origin = '"CM.ITENSINVBENS".IIBFLGSITFISICA'
    end
  end
  object qryLancResult: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'update ITENSINVBENS'
      'set'
      '  IIBFLGPLACA = :IIBFLGPLACA,'
      '  IIBLOCALNOVO = :IIBLOCALNOVO,'
      '  IIBCONJUNTONOVO = :IIBCONJUNTONOVO,'
      '  IIBFLGSITFISICA = :IIBFLGSITFISICA'
      'where'
      '  IDINVENTARIOBENS = :IDINVENTARIOBENS and'
      '  IDEMPRESA = :IDEMPRESA and'
      '  IIBPLACA = :IIBPLACA')
    Params.Data = {
      010007000B494942464C47504C414341000304000000000000000C4949424C4F
      43414C4E4F564F00060800000000000000000000000F494942434F4E4A554E54
      4F4E4F564F00060800000000000000000000000F494942464C47534954464953
      49434100030400000000000000104944494E56454E544152494F42454E530006
      080000000000000000000000094944454D505245534100060800000000000000
      0000000008494942504C4143410006080000000000000000000000}
    ValidateWithMask = True
    Left = 440
    Top = 240
  end
  object opDlgTxt: TOpenDialog
    Title = 'Seleção do Arquivo de Importação'
    Left = 280
    Top = 24
  end
  object qryBuscaLocal: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'WHERE (LTRIM(RTRIM(CODCENTROCUSTO)) = :PCCUSTO)'
      '  AND (IDEMPRESA = :PIDEMPRESA)')
    Params.Data = {
      01000200075043435553544F00010200300000000A504944454D505245534100
      06080000000000000000000000}
    ValidateWithMask = True
    Left = 272
    Top = 296
    object qryBuscaLocalIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
  end
end
