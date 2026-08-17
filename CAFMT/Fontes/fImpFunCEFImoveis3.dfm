inherited frmImpFunCEFImoveis3: TfrmImpFunCEFImoveis3
  Left = 31
  Top = 195
  Caption = 'Importação dos Bens Imóveis da FunCEF'
  ClientHeight = 172
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 133
    object btnSelMov: TSpeedButton
      Left = 704
      Top = 32
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
      Left = 16
      Top = 16
      Width = 177
      Height = 13
      Caption = 'Histórico - Arquivo Texto SAF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 78
      Width = 734
      Height = 50
      Align = alBottom
      TabOrder = 0
      Visible = False
      object lblPlaca: TLabel
        Left = 8
        Top = 35
        Width = 13
        Height = 13
        Caption = '...'
      end
      object lblPasso: TLabel
        Left = 575
        Top = 35
        Width = 9
        Height = 14
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblStatus: TLabel
        Left = 7
        Top = 3
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object lblProgress: TLabel
        Left = 615
        Top = 3
        Width = 13
        Height = 13
        Caption = '...'
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 721
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 719
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
    object edArqDBMov: TEdit
      Left = 17
      Top = 32
      Width = 688
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object ckbClean: TCheckBox
      Left = 232
      Top = 55
      Width = 265
      Height = 17
      Caption = 'Eliminar o histórico anteriormente gerado'
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 133
    Width = 744
    inherited tb97Fundo: TToolbar97
      Left = 574
      DockPos = 639
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 136
      DockPos = 201
      inherited ToolbarSep971: TToolbarSep97
        Left = 145
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 273
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 148
        Width = 125
        Caption = '&Gerar Loader'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888F88888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
          08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
          F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
          FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
          78888787F7878FF77888888B8888777888888887888877788888888888888888
          8888888888888888888888888888888888888888888888888888}
      end
      inherited bbtnCancelar: TBitBtn
        Left = 276
        Width = 158
        Caption = '&Gerar Movimentação'
        Enabled = False
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F8888755555555508888878888888F878F887D555555F55
          508887F888F8878F87F887D58F55FFF55088878887F87778F78F7D558F5FFFFF
          55087F8887F77777887F7D558F555F8555087F8887F887F8887F7D558F555F85
          55087F88F7FFF7F8887F7D5FFFFF5F8555087F87777787F8887F7D55FFF55F85
          550878F877788788887887D55F555555508887F88788888887F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
      end
      object bbtnBatchMove: TBitBtn
        Left = 0
        Top = 0
        Width = 145
        Height = 33
        Caption = '&Converte Histórico'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnBatchMoveClick
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
        Spacing = 5
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 467
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
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
    Left = 376
    Top = 224
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
      '  ')
    ValidateWithMask = True
    Left = 432
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
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
      'WHERE (LTRIM(RTRIM(CODHIERARQ)) = :PIDCLASSE)'
      '  AND (ANASINT     = '#39'A'#39')'
      '   ')
    ValidateWithMask = True
    Left = 480
    Top = 224
    ParamData = <
      item
        DataType = ftString
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
    Left = 544
    Top = 224
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
  object qryFornec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA'
      'FROM EMPRESAFORN F, PESSOA P'
      'WHERE (F.IDFORCLI = P.IDPESSOA)'
      '  AND (LTRIM(RTRIM(P.NUMDOCUMENTO)) = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 680
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFornecIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
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
    Left = 552
    Top = 272
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
    Left = 488
    Top = 272
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
  object qryResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESPONSAVEL,FLGATIVOFIXO'
      'FROM RESPONSAVEL'
      'WHERE (IDRESPONSAVEL = :PIDRESP)')
    ValidateWithMask = True
    Left = 432
    Top = 272
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
  object qryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO, IDRESPONSAVEL, IDEMPRESA, CODCENTROCUSTO'
      'FROM LOCALIZACAO'
      'WHERE (IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (IDPESSOA      = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 376
    Top = 272
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
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDIASANO, IDPESSOA , MOEDAOFICIAL, MOEDAFISCAL'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA) ')
    ValidateWithMask = True
    Left = 616
    Top = 224
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
    Left = 616
    Top = 272
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
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 376
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 432
    Top = 320
    object FloatField1: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.CONJUNTO".IDPESSOA'
    end
    object FloatField3: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.CONJUNTO".IDRESPONSAVEL'
    end
    object FloatField4: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.CONJUNTO".IDLOCALIZACAO'
    end
    object FloatField5: TFloatField
      FieldName = 'DISPONIVEL'
      Origin = '"CM.CONJUNTO".DISPONIVEL'
    end
    object StringField1: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object FloatField6: TFloatField
      FieldName = 'ALUGADO'
      Origin = '"CM.CONJUNTO".ALUGADO'
    end
  end
  object opDlgDB: TOpenDialog
    Filter = 'Tabelas Paradox|*.DB|Planilhas Excel|*.xls|Arquivos Texto|*.txt'
    InitialDir = 'C:\'
    Title = 'Seleção do Arquivo de Importação'
    Left = 664
    Top = 16
  end
  object qryCMImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDPESSOA,IDIMOVELMESTRE,IDIMOVEL,IMOCODIGO,IMOAREA,'
      '       IMONOME,IMODATACOMPRA,IMOPERCENTRATEIO,CODTIPIMOVEL'
      'FROM IMOVEL'
      'WHERE (FLGTIPOIMOVEL = 1)'
      'ORDER BY IMOCODIGO, IDIMOVEL')
    UpdateObject = updCMImovel
    ValidateWithMask = True
    Left = 376
    Top = 86
    object qryCMImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'IMOVEL.IDPESSOA'
    end
    object qryCMImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
      Origin = 'IMOVEL.IDIMOVELMESTRE'
    end
    object qryCMImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVEL.IDIMOVEL'
    end
    object qryCMImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Origin = 'IMOVEL.IMOCODIGO'
      Size = 15
    end
    object qryCMImovelIMOAREA: TFloatField
      FieldName = 'IMOAREA'
      Origin = 'IMOVEL.IMOAREA'
    end
    object qryCMImovelIMONOME: TStringField
      FieldName = 'IMONOME'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryCMImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
      Origin = '"CM.IMOVEL".IMODATACOMPRA'
    end
    object qryCMImovelIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
      Origin = 'IMOVEL.IMOPERCENTRATEIO'
    end
    object qryCMImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
  end
  object scrRemImpBens: TCMSQLScript
    OnProgress = scrRemImpBensProgress
    Script.Strings = (
      'DELETE FROM TRANSFPLACA'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM TRANSFCONJUNTO'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM TRANSFGRUPO'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM BAIXABEM'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM REAVAL'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM REAVALREAVAL'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO)) ;'
      ''
      'DELETE FROM DEPRECIACAOREAVAL'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO));'
      ''
      'DELETE FROM DEPRECIACAOBEM'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO)) ;'
      ''
      'DELETE FROM VALORMOVIMENTACAO'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO)) ;'
      ''
      'DELETE FROM ACRESCIMOVALOR'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO)) ;'
      ''
      'DELETE FROM REAVALIACAO'
      'WHERE IDMOVIMENTACAO IN'
      '       (SELECT HM.IDMOVIMENTACAO'
      '        FROM HISTORICOMOVIMENTACAO HM, BEM B, GRUPO G'
      '        WHERE (G.FLGIMOVEL = 1)'
      '          AND (HM.IDBEM = B.IDBEM)'
      '          AND (B.IDGRUPO = G.IDGRUPO)) ;'
      ''
      'DELETE FROM HISTORICOMOVIMENTACAO HM'
      'WHERE (EXISTS (SELECT *'
      '               FROM  BEM B, GRUPO G'
      '               WHERE (G.FLGIMOVEL = 1)'
      '                 AND (HM.IDBEM = B.IDBEM)'
      '                 AND (B.IDGRUPO = G.IDGRUPO))) ;'
      ''
      'DELETE FROM IMOVELXBEM IB'
      'WHERE (EXISTS (SELECT *'
      '               FROM  BEM B, GRUPO G'
      '               WHERE (G.FLGIMOVEL = 1)'
      '                 AND (IB.IDBEM = B.IDBEM)'
      '                 AND (B.IDGRUPO = G.IDGRUPO))) ;'
      ''
      'DELETE FROM BEM'
      'WHERE (EXISTS (SELECT *'
      '               FROM BEM B,GRUPO G'
      '               WHERE (G.FLGIMOVEL = 1)'
      '                 AND (BEM.IDBEM = B.IDBEM)'
      '                 AND (BEM.IDGRUPO = G.IDGRUPO))) ;'
      ''
      'DELETE FROM RATEIODEPRECIACAO'
      
        'WHERE NOT (IDCONJUNTO IN (SELECT C.IDCONJUNTO FROM CONJUNTO C, B' +
        'EM B'
      '                          WHERE (C.IDCONJUNTO = B.IDCONJUNTO)));'
      ''
      'DELETE FROM CONJUNTO'
      
        'WHERE NOT (IDCONJUNTO IN (SELECT C.IDCONJUNTO FROM CONJUNTO C, B' +
        'EM B'
      '                          WHERE (C.IDCONJUNTO = B.IDCONJUNTO)));'
      '')
    Commit = ctAll
    DataBaseName = 'Basedados'
    OnScriptError = scrRemImpBensScriptError
    Left = 576
    Top = 16
  end
  object tblCad96: TwwTable
    DatabaseName = 'IMOVEIS'
    TableName = 'Cadastro96.DB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 504
    Top = 80
    object tblCad96CODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object tblCad96PARTE: TStringField
      FieldName = 'PARTE'
      Size = 21
    end
    object tblCad96VALORG: TFloatField
      FieldName = 'VALORG'
    end
    object tblCad96CMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object tblCad96DEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object tblCad96SLDREAVAL: TFloatField
      FieldName = 'SLDREAVAL'
    end
    object tblCad96VLCTB: TFloatField
      FieldName = 'VLCTB'
    end
    object tblCad96CODPAI: TStringField
      FieldName = 'CODPAI'
      Size = 8
    end
    object tblCad96IDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object tblCad96GRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 41
    end
    object tblCad96IMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 89
    end
    object tblCad96JUROS: TFloatField
      FieldName = 'JUROS'
    end
    object tblCad96DEPENCARG: TStringField
      FieldName = 'DEPENCARG'
      Size = 16
    end
  end
  object tblCad99: TwwTable
    DatabaseName = 'IMOVEIS'
    TableName = 'Cadastro99.DB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 560
    Top = 80
    object tblCad99CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object tblCad99PARTE: TStringField
      FieldName = 'PARTE'
      Size = 21
    end
    object tblCad99VALORG: TFloatField
      FieldName = 'VALORG'
    end
    object tblCad99CMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object tblCad99DEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object tblCad99SLDREAVAL: TFloatField
      FieldName = 'SLDREAVAL'
    end
    object tblCad99VALCTB: TFloatField
      FieldName = 'VALCTB'
    end
    object tblCad99CODPAI: TStringField
      FieldName = 'CODPAI'
      Size = 8
    end
    object tblCad99IDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object tblCad99GRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 35
    end
    object tblCad99IMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 72
    end
    object tblCad99CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 23
    end
    object tblCad99CMMES: TFloatField
      FieldName = 'CMMES'
    end
    object tblCad99DEPENCARG: TFloatField
      FieldName = 'DEPENCARG'
    end
    object tblCad99JUROS: TFloatField
      FieldName = 'JUROS'
    end
    object tblCad99CMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object tblCad99JUROSACUM: TFloatField
      FieldName = 'JUROSACUM'
    end
  end
  object tblReav99: TwwTable
    DatabaseName = 'IMOVEIS'
    TableName = 'Reaval1999.DB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 672
    Top = 80
    object tblReav99IMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 17
    end
    object tblReav99EDIFICACAO: TFloatField
      FieldName = 'EDIFICACAO'
    end
    object tblReav99INSTALACAO: TFloatField
      FieldName = 'INSTALACAO'
    end
    object tblReav99TERRENO: TFloatField
      FieldName = 'TERRENO'
    end
    object tblReav99SOMA: TFloatField
      FieldName = 'SOMA'
    end
    object tblReav99VU_EDIF: TFloatField
      FieldName = 'VU_EDIF'
    end
    object tblReav99VU_INST: TFloatField
      FieldName = 'VU_INST'
    end
    object tblReav99DATAREAVAL: TDateField
      FieldName = 'DATAREAVAL'
    end
  end
  object tblReav96: TwwTable
    DatabaseName = 'IMOVEIS'
    TableName = 'Reaval1996.DB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 616
    Top = 80
    object tblReav96IMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 17
    end
    object tblReav96EDIFICACAO: TFloatField
      FieldName = 'EDIFICACAO'
    end
    object tblReav96INSTALACAO: TFloatField
      FieldName = 'INSTALACAO'
    end
    object tblReav96TERRENO: TFloatField
      FieldName = 'TERRENO'
    end
    object tblReav96SOMA: TFloatField
      FieldName = 'SOMA'
    end
    object tblReav96VU_EDIF: TFloatField
      FieldName = 'VU_EDIF'
    end
    object tblReav96VU_INST: TFloatField
      FieldName = 'VU_INST'
    end
    object tblReav96DATAREAVAL: TDateField
      FieldName = 'DATAREAVAL'
    end
  end
  object updCMImovel: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVEL'
      'set'
      '  CODTIPIMOVEL = :CODTIPIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into IMOVEL'
      '  (CODTIPIMOVEL)'
      'values'
      '  (:CODTIPIMOVEL)')
    DeleteSQL.Strings = (
      'delete from IMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 376
    Top = 72
  end
  object dsHistorico: TwwDataSource
    AutoEdit = False
    DataSet = tblHistorico
    Left = 448
    Top = 86
  end
  object tblHistorico: TwwTable
    DatabaseName = 'IMOVEIS'
    Exclusive = True
    FieldDefs = <
      item
        Name = 'IMOVEL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ANOMES'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VALORG'
        DataType = ftCurrency
      end
      item
        Name = 'DEPACUM'
        DataType = ftCurrency
      end
      item
        Name = 'DEPMES'
        DataType = ftCurrency
      end
      item
        Name = 'AJUSTES'
        DataType = ftCurrency
      end
      item
        Name = 'RESIDUAL'
        DataType = ftCurrency
      end
      item
        Name = 'VLREAVAL'
        DataType = ftCurrency
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'DATAREAVAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'REAVALANT'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'tblHistoricoIndex1'
        Fields = 'IMOVEL;TIPO;ANOMES'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Historico'
        Fields = 'IMOVEL'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'Historico'
    StoreDefs = True
    TableName = 'Historico.DB'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 448
    Top = 72
    object tblHistoricoIMOVEL: TStringField
      DisplayWidth = 25
      FieldName = 'IMOVEL'
      Size = 25
    end
    object tblHistoricoTIPO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPO'
      Size = 25
    end
    object tblHistoricoANOMES: TStringField
      DisplayWidth = 10
      FieldName = 'ANOMES'
      Size = 10
    end
    object tblHistoricoVALORG: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORG'
    end
    object tblHistoricoDEPACUM: TFloatField
      DisplayWidth = 10
      FieldName = 'DEPACUM'
    end
    object tblHistoricoDEPMES: TFloatField
      DisplayWidth = 10
      FieldName = 'DEPMES'
    end
    object tblHistoricoAJUSTES: TFloatField
      DisplayWidth = 10
      FieldName = 'AJUSTES'
    end
    object tblHistoricoRESIDUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'RESIDUAL'
    end
    object tblHistoricoVLREAVAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLREAVAL'
    end
    object tblHistoricoVIDAUTIL: TFloatField
      DisplayWidth = 10
      FieldName = 'VIDAUTIL'
    end
    object tblHistoricoDATAREAVAL: TStringField
      DisplayWidth = 10
      FieldName = 'DATAREAVAL'
      Size = 10
    end
    object tblHistoricoREAVALANT: TFloatField
      DisplayWidth = 10
      FieldName = 'REAVALANT'
    end
  end
end
