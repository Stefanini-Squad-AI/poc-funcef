inherited frmImpFCRT: TfrmImpFCRT
  Left = 160
  Top = 180
  Caption = 'ImportaÁ„o dos Bens e MovimentaÁıes - FCRT'
  ClientHeight = 231
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 192
    object fcLabel1: TfcLabel
      Left = 16
      Top = 76
      Width = 28
      Height = 13
      Caption = 'Bens'
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
    end
    object bbtnSelArqBens: TSpeedButton
      Left = 449
      Top = 92
      Width = 24
      Height = 24
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
      OnClick = bbtnSelArqBensClick
    end
    object Label7: TLabel
      Left = 16
      Top = 20
      Width = 105
      Height = 13
      Caption = 'Pasta de Trabalho'
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 138
      Width = 478
      Height = 49
      Align = alBottom
      TabOrder = 1
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object lblPlaca: TLabel
        Left = 375
        Top = 4
        Width = 93
        Height = 13
        Caption = 'Placa 00000000'
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 462
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 460
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object bbtnSelPasta: TBitBtn
      Left = 449
      Top = 36
      Width = 24
      Height = 24
      TabOrder = 0
      OnClick = bbtnSelPastaClick
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
    object edSelDir: TEdit
      Left = 16
      Top = 36
      Width = 433
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
      OnChange = edSelDirChange
    end
    object eNomeArqBens: TEdit
      Left = 16
      Top = 92
      Width = 433
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 192
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 318
      DockPos = 569
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 131
      DockPos = 382
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Caption = '&Estornar'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 635
    Top = 507
  end
  object qryConjunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONJUNTO,IDPESSOA,IDRESPONSAVEL,IDLOCALIZACAO,'
      '       DISPONIVEL,DESCCONJUNTO,ALUGADO'
      'FROM  CONJUNTO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (DESCCONJUNTO  = :PDESCCONJ)'
      '')
    ValidateWithMask = True
    Left = 352
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESCCONJ'
        ParamType = ptUnknown
      end>
    object qryConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
    end
    object qryConjuntoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.CONJUNTO".IDPESSOA'
    end
    object qryConjuntoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.CONJUNTO".IDRESPONSAVEL'
    end
    object qryConjuntoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.CONJUNTO".IDLOCALIZACAO'
    end
    object qryConjuntoDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
      Origin = '"CM.CONJUNTO".DISPONIVEL'
    end
    object qryConjuntoDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object qryConjuntoALUGADO: TFloatField
      FieldName = 'ALUGADO'
      Origin = '"CM.CONJUNTO".ALUGADO'
    end
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,CLASSE,DEPRECIACAO AS TAXADEP'
      'FROM GRUPO'
      'WHERE (IDGRUPO = :PIDGRUPO)'
      '  AND (TIPO    = '#39'A'#39')'
      '  '
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryGrupoTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CLASSEDEBEM'
      'WHERE (IDCLASSEBEM = :PIDCLASSE)'
      '  AND (ANASINT     = '#39'A'#39')'
      '   ')
    ValidateWithMask = True
    Left = 464
    Top = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCLASSE'
        ParamType = ptUnknown
      end>
    object qryClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Size = 15
    end
    object qryClasseANASINT: TStringField
      FieldName = 'ANASINT'
      Size = 1
    end
    object qryClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryClasseIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITUACAO,DESCSITUACAO'
      'FROM SITUACAO'
      'WHERE (IDSITUACAO = :PIDSITUACAO)'
      '')
    ValidateWithMask = True
    Left = 520
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end>
    object qrySituacaoIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = 'SITUACAO.IDSITUACAO'
    end
    object qrySituacaoDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Origin = 'SITUACAO.DESCSITUACAO'
      Size = 45
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDIASANO, IDPESSOA , MOEDAOFICIAL, MOEDAFISCAL'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA) ')
    ValidateWithMask = True
    Left = 592
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
      Origin = '"CM.PARAMETROSCAFMANUT".NUMDIASANO'
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARAMETROSCAFMANUT".IDPESSOA'
    end
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = '"CM.PARAMETROSCAFMANUT".MOEDAOFICIAL'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = '"CM.PARAMETROSCAFMANUT".MOEDAFISCAL'
    end
  end
  object qryFornec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA'
      'FROM EMPRESAFORN F, PESSOA P'
      'WHERE (F.IDFORCLI = :PIDFORNSERV)'
      '  AND (P.IDPESSOA = F.IDFORCLI)  '
      ''
      ' ')
    ValidateWithMask = True
    Left = 656
    Top = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFORNSERV'
        ParamType = ptUnknown
      end>
    object qryFornecIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
  end
  object qryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO, IDRESPONSAVEL, IDEMPRESA, CODCENTROCUSTO'
      'FROM LOCALIZACAO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (IDPESSOA      = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 352
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLocalIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'LOCALIZACAO.IDLOCALIZACAO'
    end
    object qryLocalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'LOCALIZACAO.IDRESPONSAVEL'
    end
    object qryLocalIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'LOCALIZACAO.IDEMPRESA'
    end
    object qryLocalCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LOCALIZACAO.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESPONSAVEL,FLGATIVOFIXO'
      'FROM RESPONSAVEL'
      'WHERE (IDRESPONSAVEL = :PIDRESP)')
    ValidateWithMask = True
    Left = 408
    Top = 416
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryRespIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'RESPONSAVEL.IDRESPONSAVEL'
    end
    object qryRespFLGATIVOFIXO: TFloatField
      FieldName = 'FLGATIVOFIXO'
      Origin = 'RESPONSAVEL.FLGATIVOFIXO'
    end
  end
  object qryInsConjunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONJUNTO(IDCONJUNTO,'
      '                     IDPESSOA,'
      '                     IDRESPONSAVEL,'
      '                     IDLOCALIZACAO,'
      '                     DISPONIVEL,'
      '                     DESCCONJUNTO,'
      '                     ALUGADO)'
      '              VALUES (:IDCONJUNTO,'
      '                      :IDPESSOA,'
      '                      :IDRESPONSAVEL,'
      '                      :IDLOCALIZACAO,'
      '                      :DISPONIVEL,'
      '                      :DESCCONJUNTO,'
      '                      :ALUGADO)')
    ValidateWithMask = True
    Left = 248
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPONIVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALUGADO'
        ParamType = ptUnknown
      end>
  end
  object qryInsRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RATEIODEPRECIACAO'
      '           (IDCONJUNTO,'
      '            IDEMPRESA,'
      '            DTAINICIO,'
      '            CODCENTROCUSTO,'
      '            PARTICIPACAO)'
      'VALUES     (:IDCONJUNTO,'
      '            :IDEMPRESA,'
      '            :DTAINICIO,'
      '            :CODCENTROCUSTO,'
      '            :PARTICIPACAO)'
      '')
    ValidateWithMask = True
    Left = 248
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARTICIPACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 352
    Top = 464
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
  end
  object qryInsBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BEM (IDBEM,'
      '                 IDPESSOA,'
      '                 IDCONJUNTO,'
      '                 IDGRUPO,'
      '                 IDMODULO,'
      '                 IDCLASSEBEM,'
      '                 IDSITUACAO,'
      '                 IDFORNSERV,'
      '                 REGISTRO,'
      '                 CONTROLE,'
      '                 PLACA,'
      '                 DESBEM,'
      '                 DATAINICIODEP,'
      '                 DATAULTDEP,'
      '                 DTAINCLUSAO,'
      '                 TAXADEP,'
      '                 VALHISTORICO,'
      '                 VALORG,'
      '                 CMBEM,'
      '                 VALFIS,'
      '                 VALGER,'
      '                 VALDEPINI,'
      '                 DEPLANC,'
      '                 CMDEP,'
      '                 DEPFIS,'
      '                 DEPGER,'
      '                 BAIXATOTAL,'
      '                 PROPBAIXA,'
      '                 FLGDEPREC,'
      '                 IDNOTA,'
      '                 COMPLNOTA,'
      '                 DTANOTA,'
      '                 NUMSERIE,'
      '                 IDOPCIONAL,'
      '                 PROCESSOAQUIS)'
      'VALUES          (:PIDBEM,'
      '                 :PIDPESSOA,'
      '                 :PIDCONJUNTO,'
      '                 :PIDGRUPO,'
      '                 :PIDMODULO,'
      '                 :PIDCLASSEBEM,'
      '                 :PIDSITUACAO,'
      '                 :PIDFORNSERV,'
      '                 :PREGISTRO,'
      '                 :PCONTROLE,'
      '                 :PPLACA,'
      '                 :PDESBEM,'
      '                 :PDATAINICIODEP,'
      '                 :PDATAULTDEP,'
      '                 :PDTAINCLUSAO,'
      '                 :PTAXADEP,'
      '                 :PVALHISTORICO,'
      '                 :PVALORG,'
      '                 :PCMBEM,'
      '                 :PVALFIS,'
      '                 :PVALGER,'
      '                 :PVALDEPINI,'
      '                 :PDEPLANC,'
      '                 :PCMDEP,'
      '                 :PDEPFIS,'
      '                 :PDEPGER,'
      '                 :PBAIXATOTAL,'
      '                 :PPROPBAIXA,'
      '                 :PFLGDEPREC,'
      '                 :PIDNOTA,'
      '                 :PCOMPLNOTA,'
      '                 :PDTANOTA,'
      '                 :PNUMSERIE,'
      '                 :PIDOPCIONAL,'
      '                 :PPROCESSOAQUIS)'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORNSERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PREGISTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONTROLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDTAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALDEPINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPROPBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOMPLNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDTANOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDOPCIONAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPROCESSOAQUIS'
        ParamType = ptUnknown
      end>
  end
  object qryInsDeprecBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOBEM (IDMOVIMENTACAO,'
      '                            DATAULTDEP)'
      '                   VALUES  (:PIDMOVIMENTACAO,'
      '                            :PDATAULTDEP)'
      '')
    ValidateWithMask = True
    Left = 40
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.VALORG, B.CMBEM, B.DEPLANC, B.CMDEP,'
      '       B.TAXADEP, B.IDBEM, B.IDPESSOA, B.DTAINCLUSAO,'
      '       B.VALHISTORICO, B.FLGDEPREC, B.DATAULTDEP,'
      '       B.PLACA,B.IDOPCIONAL,B.DATAINICIODEP,B.BAIXATOTAL,'
      '       B.VALFIS,B.PROPBAIXA'
      'FROM BEM B, GRUPO G'
      'WHERE (G.FLGIMOVEL  = 0)'
      '  AND (B.PROCESSOAQUIS = '#39'CARGA FCRT'#39')'
      '  AND (B.IDPESSOA   = :PIDPESSOA)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      'ORDER BY B.IDOPCIONAL'
      ' ')
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBemVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'BEM.VALORG'
    end
    object qryBemCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BEM.CMBEM'
    end
    object qryBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BEM.DEPLANC'
    end
    object qryBemCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = 'BEM.CMDEP'
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'BEM.TAXADEP'
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Origin = 'BEM.DTAINCLUSAO'
    end
    object qryBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Origin = 'BEM.VALHISTORICO'
    end
    object qryBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = 'BEM.FLGDEPREC'
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BEM.DATAULTDEP'
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Origin = 'BEM.IDOPCIONAL'
      Size = 30
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Origin = 'BEM.DATAINICIODEP'
    end
    object qryBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      Origin = 'BEM.BAIXATOTAL'
      Size = 1
    end
    object qryBemVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = 'BEM.VALFIS'
    end
    object qryBemPROPBAIXA: TFloatField
      FieldName = 'PROPBAIXA'
      Origin = 'BASEDADOS.BEM.PROPBAIXA'
    end
  end
  object updBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  TAXADEP = :TAXADEP,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  IDOPCIONAL = :IDOPCIONAL,'
      '  BAIXATOTAL = :BAIXATOTAL,'
      '  VALFIS = :VALFIS,'
      '  PROPBAIXA = :PROPBAIXA'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into BEM'
      
        '  (VALORG, CMBEM, DEPLANC, CMDEP, TAXADEP, VALHISTORICO, FLGDEPR' +
        'EC, DATAULTDEP, '
      '   IDOPCIONAL, BAIXATOTAL, VALFIS, PROPBAIXA)'
      'values'
      
        '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP, :TAXADEP, :VALHISTORICO, :' +
        'FLGDEPREC, '
      '   :DATAULTDEP, :IDOPCIONAL, :BAIXATOTAL, :VALFIS, :PROPBAIXA)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 40
    Top = 304
  end
  object qryInsDeprecReaval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOREAVAL (IDMOVIMENTACAO,'
      '                               IDREAVALIACAO,'
      '                               DATAULTDEP)'
      '                      VALUES  (:PIDMOVIMENTACAO,'
      '                               :PIDREAVALIACAO,'
      '                               :PDATAULTDEP)'
      '                               ')
    ValidateWithMask = True
    Left = 144
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryInsReavaliacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALIACAO'
      
        '  (IDREAVALIACAO, IDBEM, IDPESSOA, IDMOVIMENTACAO, DATAREAVALIAC' +
        'AO,'
      
        '   VALORG, CMBEM, VALFIS, VALGER, TAXADEP, DEPLANC, CMDEP, DEPFI' +
        'S, DEPGER,'
      '   DATAULTDEP, FLGDEPREC, FLGULTREAVAL)'
      'values'
      
        '  (:IDREAVALIACAO, :IDBEM, :IDPESSOA, :IDMOVIMENTACAO, :DATAREAV' +
        'ALIACAO,'
      
        '   :VALORG, :CMBEM, :VALFIS, :VALGER, :TAXADEP, :DEPLANC, :CMDEP' +
        ', :DEPFIS,'
      '   :DEPGER, :DATAULTDEP, :FLGDEPREC, :FLGULTREAVAL)')
    ValidateWithMask = True
    Left = 144
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'DEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'DEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGULTREAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryConjNovo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONJUNTO'
      'FROM  CONJUNTO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (IDRESPONSAVEL = :PIDRESP)'
      '  ')
    ValidateWithMask = True
    Left = 464
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryConjNovoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,CODSUBCONTA'
      'FROM SUBCONTA'
      'WHERE (IDPESSOA    = :PIDPESSOA)'
      '  AND (CODSUBCONTA = :PIDSUBCONTA)'
      '')
    ValidateWithMask = True
    Left = 528
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSUBCONTA'
        ParamType = ptUnknown
      end>
    object qrySubContaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'SUBCONTA.IDPESSOA'
    end
    object qrySubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CM.MOECODIGO,CM.COTDATA,CM.COTVALOR,CM.COTMESREF,M.FLGPER' +
        'CVALOR AS TIPO'
      'FROM COTACAOMOEDA CM, MOEDA M'
      'WHERE (CM.MOECODIGO = :MOECODIGO)'
      '  AND (CM.COTDATA >= :PERIODOINI)'
      '  AND (CM.COTDATA <= :PERIODOFIM)'
      '  AND (CM.MOECODIGO = M.MOECODIGO)'
      'ORDER BY CM.COTDATA'
      '')
    ValidateWithMask = True
    Left = 592
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PERIODOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PERIODOFIM'
        ParamType = ptUnknown
      end>
    object qryCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACAOMOEDA.MOECODIGO'
    end
    object qryCotacaoCOTDATA: TDateTimeField
      FieldName = 'COTDATA'
      Origin = 'COTACAOMOEDA.COTDATA'
    end
    object qryCotacaoCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoCOTMESREF: TStringField
      FieldName = 'COTMESREF'
      Origin = 'COTACAOMOEDA.COTMESREF'
      Size = 6
    end
    object qryCotacaoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'MOEDA.FLGPERCVALOR'
      Size = 1
    end
  end
  object opDlgTxt: TOpenDialog
    Filter = 'Arquivos Excel|*.xls|Texto separados por espaÁos|*.txt'
    InitialDir = 'C:\'
    Title = 'SeleÁ„o do Arquivo de ImportaÁ„o'
    Left = 344
    Top = 80
  end
  object tblSaldos: TwwTable
    DatabaseName = 'CAF'
    IndexFiles.Strings = (
      'Saldos.MDX')
    IndexName = 'PLACA'
    TableName = 'Saldos.DBF'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 288
    Top = 24
    object tblSaldosENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Size = 3
    end
    object tblSaldosPLACA: TStringField
      FieldName = 'PLACA'
      Size = 12
    end
    object tblSaldosDATASALDO: TDateField
      FieldName = 'DATASALDO'
    end
    object tblSaldosVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object tblSaldosCMBEMMES: TFloatField
      FieldName = 'CMBEMMES'
    end
    object tblSaldosDEPMES: TFloatField
      FieldName = 'DEPMES'
    end
    object tblSaldosDEPACUM: TFloatField
      FieldName = 'DEPACUM'
    end
    object tblSaldosCMDEPMES: TFloatField
      FieldName = 'CMDEPMES'
    end
    object tblSaldosVALFIS: TFloatField
      FieldName = 'VALFIS'
    end
    object tblSaldosDEPFIS: TFloatField
      FieldName = 'DEPFIS'
    end
    object tblSaldosDEPFISMES: TFloatField
      FieldName = 'DEPFISMES'
    end
    object tblSaldosVIDAUTIL: TSmallintField
      FieldName = 'VIDAUTIL'
    end
  end
  object pSelDir: TProcuraDirDlg
    Caption = 'Selecione a pasta de trabalho'
    Directory = 
      #4'1ƒ'#5#4'1ƒ'#5'\'#0#0#0'‡%'#6'@®Õø'#7'\Œø'#7'\Œø'#7' '#0#0#0'∞#'#6'@®Õø'#7#0#0#0#0#0#0#0#0'4'#0#0#0#23#0#0#0'Ã,'#2'@'#0#0#0#0 +
      #0#0#0#0#0#0#0#0'êŒø'#7'êŒø'#7#20#0#0#0'  qr'#8#0#0'ß'#0#0#0'HÈ'#5'@'#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #8#1#1#0#0#0#0#0#0#0#0#0#0#1#0#2#2#0#1#0'ˇˇˇˇ'#0#0#0#0#0#0#0#0#0#0#0#0'ﬁ'#2#0#0'ä'#22#0#0#0#0#0#0#0#0#0#0'C`'#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'òﬁh'#0'DjZ'#1#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #4'1ƒ'#5
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Left = 344
    Top = 24
  end
  object qryEstornaValMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM VALORMOVIMENTACAO'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'VALORMOVIMENTACAO.IDMOVIMENTACAO'
    end
    object FloatField2: TFloatField
      FieldName = 'VALOFI'
      Origin = 'VALORMOVIMENTACAO.VALOFI'
    end
    object FloatField3: TFloatField
      FieldName = 'VALGER'
      Origin = 'VALORMOVIMENTACAO.VALGER'
    end
    object FloatField4: TFloatField
      FieldName = 'VALFIS'
      Origin = 'VALORMOVIMENTACAO.VALFIS'
    end
  end
  object qryEstornaDepBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DEPRECIACAOBEM'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
end
