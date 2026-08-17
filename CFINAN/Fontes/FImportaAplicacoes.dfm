inherited frmImportaAplicacoes: TfrmImportaAplicacoes
  Left = 95
  Top = 273
  HelpContext = 90003
  Caption = 'Importação de Aplicações'
  ClientHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 223
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 102
      Height = 13
      Caption = 'Nome do Arquivo:'
    end
    object lblLog: TLabel
      Left = 8
      Top = 64
      Width = 22
      Height = 13
      Caption = 'Log'
    end
    object edNomeArq: TEdit
      Left = 8
      Top = 32
      Width = 393
      Height = 21
      TabOrder = 0
    end
    object bbtnProcurar: TBitBtn
      Left = 408
      Top = 27
      Width = 107
      Height = 31
      Caption = '&Procurar'
      TabOrder = 1
      OnClick = bbtnProcurarClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
        1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
        1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
        1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
        00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
        FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
        FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
        104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
        1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object rchedErros: TRichEdit
      Left = 5
      Top = 80
      Width = 518
      Height = 138
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 2
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 223
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 227
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  object OpenDialogImportacaoAplicacao: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto|*.txt'
    InitialDir = 'C:'
    Title = 'Importação de Aplicação'
    Left = 218
    Top = 10
  end
  object qryAplicacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   Aplicacoes'
      'WHERE'
      '   (1=2)')
    UpdateObject = updAplicacoes
    ValidateWithMask = True
    Left = 32
    Top = 96
    object qryAplicacoesCODLANCAPLIC: TFloatField
      FieldName = 'CODLANCAPLIC'
      Origin = 'BASEDADOS.APLICACOES.CODLANCAPLIC'
    end
    object qryAplicacoesTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'BASEDADOS.APLICACOES.TIPOAPLICACAO'
    end
    object qryAplicacoesMOEDACOTA: TFloatField
      FieldName = 'MOEDACOTA'
      Origin = 'BASEDADOS.APLICACOES.MOEDACOTA'
    end
    object qryAplicacoesVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.APLICACOES.VALOR'
    end
    object qryAplicacoesPRAZORESGATE: TFloatField
      FieldName = 'PRAZORESGATE'
      Origin = 'BASEDADOS.APLICACOES.PRAZORESGATE'
    end
    object qryAplicacoesJUROSPREVISTOS: TFloatField
      FieldName = 'JUROSPREVISTOS'
      Origin = 'BASEDADOS.APLICACOES.JUROSPREVISTOS'
    end
    object qryAplicacoesDATAPREVRESGATE: TDateTimeField
      FieldName = 'DATAPREVRESGATE'
      Origin = 'BASEDADOS.APLICACOES.DATAPREVRESGATE'
    end
    object qryAplicacoesDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'BASEDADOS.APLICACOES.DATALANCAMENTO'
    end
    object qryAplicacoesNUMCOTAS: TFloatField
      FieldName = 'NUMCOTAS'
      Origin = 'BASEDADOS.APLICACOES.NUMCOTAS'
    end
    object qryAplicacoesVLRRESGPREV: TFloatField
      FieldName = 'VLRRESGPREV'
      Origin = 'BASEDADOS.APLICACOES.VLRRESGPREV'
    end
    object qryAplicacoesPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
      Origin = 'BASEDADOS.APLICACOES.PERCUSTO'
    end
    object qryAplicacoesPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
      Origin = 'BASEDADOS.APLICACOES.PERCUSTOREND'
    end
    object qryAplicacoesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.APLICACOES.IDPESSOA'
    end
    object qryAplicacoesAPLICRESGATEJUROS: TStringField
      FieldName = 'APLICRESGATEJUROS'
      Origin = 'BASEDADOS.APLICACOES.APLICRESGATEJUROS'
      FixedChar = True
      Size = 1
    end
    object qryAplicacoesCONTAAPLICACAO: TFloatField
      FieldName = 'CONTAAPLICACAO'
      Origin = 'BASEDADOS.APLICACOES.CONTAAPLICACAO'
    end
  end
  object updAplicacoes: TUpdateSQL
    ModifySQL.Strings = (
      'update Aplicacoes'
      'set'
      '  CODLANCAPLIC = :CODLANCAPLIC,'
      '  TIPOAPLICACAO = :TIPOAPLICACAO,'
      '  MOEDACOTA = :MOEDACOTA,'
      '  APLICRESGATEJUROS = :APLICRESGATEJUROS,'
      '  VALOR = :VALOR,'
      '  CONTAAPLICACAO = :CONTAAPLICACAO,'
      '  PRAZORESGATE = :PRAZORESGATE,'
      '  JUROSPREVISTOS = :JUROSPREVISTOS,'
      '  DATAPREVRESGATE = :DATAPREVRESGATE,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  NUMCOTAS = :NUMCOTAS,'
      '  IDPESSOA = :IDPESSOA,'
      '  VLRRESGPREV = :VLRRESGPREV,'
      '  PERCUSTO = :PERCUSTO,'
      '  PERCUSTOREND = :PERCUSTOREND'
      'where'
      '  CODLANCAPLIC = :OLD_CODLANCAPLIC')
    InsertSQL.Strings = (
      'insert into Aplicacoes'
      
        '  (CODLANCAPLIC, TIPOAPLICACAO, MOEDACOTA, APLICRESGATEJUROS, VA' +
        'LOR, CONTAAPLICACAO, '
      
        '   PRAZORESGATE, JUROSPREVISTOS, DATAPREVRESGATE, DATALANCAMENTO' +
        ', NUMCOTAS, '
      '   IDPESSOA, VLRRESGPREV, PERCUSTO, PERCUSTOREND)'
      'values'
      
        '  (:CODLANCAPLIC, :TIPOAPLICACAO, :MOEDACOTA, :APLICRESGATEJUROS' +
        ', :VALOR, '
      
        '   :CONTAAPLICACAO, :PRAZORESGATE, :JUROSPREVISTOS, :DATAPREVRES' +
        'GATE, :DATALANCAMENTO, '
      '   :NUMCOTAS, :IDPESSOA, :VLRRESGPREV, :PERCUSTO, :PERCUSTOREND)')
    DeleteSQL.Strings = (
      'delete from Aplicacoes'
      'where'
      '  CODLANCAPLIC = :OLD_CODLANCAPLIC')
    Left = 112
    Top = 96
  end
  object qryTiposAplicacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   TIPOAPLICACAO'
      'WHERE'
      '   (IDPESSOA = :IDPessoa) AND'
      '   (RTRIM(UPPER(CODCORRESP)) = RTRIM(UPPER(:TipoAplicacao)))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TipoAplicacao'
        ParamType = ptInput
      end>
    object qryTiposAplicacaoTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
    end
  end
  object qryMoedas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO,'
      '   MOEDESC'
      'FROM'
      '   MOEDA'
      'WHERE'
      '   (UPPER(RTRIM(MOEDESC)) = UPPER(RTRIM(:Moeda)))'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'Moeda'
        ParamType = ptInput
      end>
    object qryMoedasMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryMoedasMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
  end
end
