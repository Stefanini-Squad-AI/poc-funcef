inherited frmCancSaldamento: TfrmCancSaldamento
  Left = 443
  Top = 336
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Desfazer saldamento'
  ClientHeight = 195
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 490
    Height = 156
    Anchors = []
    object LblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 256
      Height = 36
      Caption = 'Desfazer saldamento '
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -29
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object Label2: TLabel
      Left = 16
      Top = 91
      Width = 33
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 50
      Width = 55
      Height = 13
      Caption = 'Matrícula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 16
      Top = 105
      Width = 425
      Height = 21
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtMatricula: TEdit
      Left = 16
      Top = 64
      Width = 97
      Height = 21
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object btnBuscaPart: TBitBtn
      Left = 117
      Top = 63
      Width = 24
      Height = 22
      Hint = 'Clique aqui para busca um associado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnBuscaPartClick
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
  end
  inherited Dock971: TDock97
    Top = 156
    Width = 490
    inherited tb97Fundo: TToolbar97
      Left = 318
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 149
      DockPos = 382
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 955
    Top = 51
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   1 AS EXISTE'
      'FROM'
      '   HSTCONTRIBPREV'
      'WHERE'
      '       IDPLANOPREV            =:PIDPLANOPREV'
      '   AND IDPESSJUR              =:PIDPESSJUR'
      '   AND IDPESSOA               =:PIDPESSOA'
      '   AND NVL(VALORRECEBIDO, 0)  > 0'
      '   AND NVL(FLGEVENTO, 0)      = 1')
    ValidateWithMask = True
    Left = 224
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
  end
  object MS_Part: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEP.MATRICULA'
      'PES.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DEPENTIT      DEP'
      'PESSOA        PES'
      'ELEGPATRO     ELG'
      'PESSOA        PPT'
      'PARTPREVPLAN  PPP'
      'SITPART       STP')
    CamposChave.Strings = (
      'DEP.IDPESSOA'
      'ELG.IDPESSJUR'
      'DEP.MATRICULA'
      'PES.NOME'
      'STP.FLGINTERNO'
      'DEP.IDTITULAR')
    Filtro.Strings = (
      'DEP.IDPESSOA    = PES.IDPESSOA'
      'DEP.IDTITULAR   = ELG.IDPESSOA '
      'PPT.IDPESSOA    = ELG.IDPESSJUR'
      'ELG.IDPESSOA    = PPP.IDPESSOA'
      'ELG.IDPESSJUR   = PPP.IDPESSJUR'
      'PPP.IDSITPART   = STP.IDSITPART ')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 152
    Top = 56
  end
  object qrySaldamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 224
    Top = 43
  end
  object MS_Part1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELP.MATRICULA'
      'PES.NOME'
      'PPP.INSCRICAONUMERO'
      'PPP.INSCRICAODATA'
      'PLP.NOME'
      'PPT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA        PES'
      'PESSOA        PPT'
      'PESSOAFISICA  PFI'
      'PLANPREV      PLP'
      'SITFUNC       STF'
      'SITPART       STP'
      'SITPLANOPREV  SPP'
      'PATRO         PTR'
      'ELEGPATRO     ELP'
      'PARTPREVPLAN  PPP'
      'EVENTOGERADOR EVG'
      'EVENTOSPREV   EVP')
    CamposChave.Strings = (
      'ELP.IDPESSOA'
      'ELP.IDPESSJUR'
      'PPP.IDPLANOPREV'
      'PES.NOME'
      'ELP.MATRICULA'
      'PPP.INSCRICAONUMERO'
      'PPP.INSCRICAODATA'
      'STP.FLGINTERNO')
    Filtro.Strings = (
      'PES.IDPESSOA         = PPP.IDPESSOA'
      'PFI.IDPESSOA         = PPP.IDPESSOA'
      'PPT.IDPESSOA         = ELP.IDPESSJUR'
      'PTR.IDPESSOA         = PPP.IDPESSJUR'
      'ELP.IDPESSJUR        = PPP.IDPESSJUR'
      'ELP.IDPESSOA         = PPP.IDPESSOA'
      'PLP.IDPLANOPREV      = PPP.IDPLANOPREV'
      'ELP.IDSITFUNC        = STF.IDSITFUNC'
      'PPP.IDSITPART        = STP.IDSITPART'
      'PPP.IDSITPLANOPREV   = SPP.IDSITPLANOPREV'
      '(PPP.FLGDESATIVADO   = 0 OR EVG.FLGINTERNO IN ('#39'CA'#39','#39'TP'#39') )'
      'EVP.IDPESSJUR        = PPP.IDPESSJUR'
      'EVP.IDPLANOPREV      = PPP.IDPLANOPREV'
      'EVP.IDPESSOA         = PPP.IDPESSOA'
      'EVP.SEQPROPOSTA      = PPP.SEQPROPOSTA'
      'EVG.IDEVENTOGERADOR  = EVP.IDEVENTOGERADOR'
      'PPP.IDPLANOPREV      = 74')
    Mascaras.Strings = (
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
      '15'
      '30'
      '30')
    OperComparador.Strings = (
      '1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 184
    Top = 56
  end
  object qryEVENTOSPREV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM EVENTOSPREV '
      'WHERE IDPESSOA                   = :IDPESSOA'
      '     AND  IDEVENTOGERADOR = 339')
    ValidateWithMask = True
    Left = 271
    Top = 57
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHSTCONTEVENTOSPR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONTRIBUICAOF, FLGASSOCIADA, IDPLANOPREVF'
      'FROM'
      '  HSTCONTEVENTOSPR'
      'WHERE'
      '  IDEVENTOSPREV = :IDEVENTOSPREV'
      ' ')
    ValidateWithMask = True
    Left = 343
    Top = 73
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object qryBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  BFT.IDPLANOPREV,    BFT.IDPLANOORIGEM, '
      '  BFT.IDPESSOA,       BFT.IDPESSJUR,      BFT.SEQPROPOSTA,'
      '  BFT.IDRESPONSAVEL,  BFT.IDTITULAR,      BFT.IDNUCLEOFAMILIAR'
      'FROM'
      '  BFCIARIOTITPLAN BFT,'
      '  BENEFBFCIARIO BF,'
      '  PROCESSOBENEF PR'
      'WHERE'
      '      ( BFT.IDPESSJUR      = 91008  )'
      '  AND ( BFT.IDTITULAR      = :IDTITULAR )'
      '  AND ( BFT.IDRESPONSAVEL  = :IDPESSOA )'
      '  AND ( BFT.SEQPROPOSTA    = 1      )'
      '  AND ( PR.IDEVENTOGERADOR = 339 )'
      ''
      '  AND ( PR.NUMEROPROCESSO  = BF.NUMEROPROCESSO )'
      ''
      '  AND ( BFT.IDPESSJUR      = BF.IDPESSJUR     )'
      '  AND ( BFT.IDPLANOPREV    = BF.IDPLANOPREV   )'
      '  AND ( BFT.IDPLANOORIGEM  = BF.IDPLANOORIGEM )'
      '  AND ( BFT.IDTITULAR      = BF.IDTITULAR     )'
      '  AND ( BFT.IDPESSOA       = BF.IDPESSOA      )'
      '  AND ( BFT.SEQPROPOSTA    = BF.SEQPROPOSTA   )'
      '  AND ( BFT.IDBENEFICIO    = BF.IDBENEFICIO   )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 343
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMOVBENEF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOVBENEF,     TIPOMOV,   IDBENEFICIO, DATAMOV, IDLOTEMOV,'
      '  NUMEROPROCESSO, DATAFINAL, DATAFINALANT'
      'FROM'
      '  MOVBENEF'
      'WHERE'
      '  IDTITULAR   = :IDTITULAR  AND'
      '  IDPESSOA    = :IDPESSOA   AND'
      '  TIPOMOV IN (1,4,7)        AND'
      '  DATAMOV = ( SELECT MAX( MOVIN.DATAMOV )'
      '              FROM  MOVBENEF MOVIN'
      '              WHERE MOVIN.IDTITULAR = MOVBENEF.IDTITULAR  AND'
      '                    MOVIN.IDPESSOA  = MOVBENEF.IDPESSOA )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 375
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHSTBENEFBFCIARIO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  IDBENEFICIO'
      'FROM'
      '  HSTBENEFBFCIARIO'
      'WHERE'
      '      IDPESSJUR = 91008'
      '  AND IDMOVBENEF = :IDMOVBENEF '
      '  AND IDPESSOA   = :IDPESSOA'
      '  AND IDTITULAR  = :IDTITULAR'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMOVBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryCONTRIBPREVPARTP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from CONTRIBPREVPARTP '
      'where IDPESSOA       = :IDPESSOA'
      '  AND IDPESSJUR      = 91008 '
      '/*  AND IDCONTRIBUICAO IN (633, 500)  */'
      '    ')
    ValidateWithMask = True
    Left = 374
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHSTCONTRIBPREV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM HSTCONTRIBPREV '
      'WHERE IDLOTE = :IDLOTE'
      '  AND IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 406
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPARTPREVPLAN: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARTPREVPLAN'
      'WHERE IDPESSOA   = :IDPESSOA'
      '      AND IDPESSJUR =  91008 ')
    ValidateWithMask = True
    Left = 303
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMOVBENEFLOTE: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  IDMOVBENEF, IDBENEFICIO, NUMEROPROCESSO, TIPOMOV, DATAFINAL, D' +
        'ATAFINALANT'
      'FROM'
      '  MOVBENEF'
      'WHERE'
      '      IDPESSOA    = :IDPESSOA'
      '  AND IDTITULAR   = :IDTITULAR'
      '  AND DATAMOV     = TO_DATE(:DATAMOV, '#39'DD/MM/YYY'#39')'
      '')
    ValidateWithMask = True
    Left = 440
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
  end
end
