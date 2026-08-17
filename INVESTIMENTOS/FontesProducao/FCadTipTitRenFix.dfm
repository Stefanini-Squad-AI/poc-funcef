inherited FrmCadTipTitRenFix: TFrmCadTipTitRenFix
  Left = 151
  Top = 138
  Caption = 'Cadastro de Tipos de Título de Renda Fixa '
  ClientHeight = 262
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 490
    Height = 176
    object Label1: TLabel
      Left = 14
      Top = 12
      Width = 161
      Height = 13
      Caption = 'Descrição do Tipo de Título'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 406
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = DBEdit2
    end
    object Label22: TLabel
      Left = 14
      Top = 59
      Width = 141
      Height = 13
      Caption = 'Classe do Tipo de Título'
      FocusControl = DBEdit1
    end
    object DbLkcClasseTitulo: TwwDBLookupCombo
      Left = 14
      Top = 77
      Width = 387
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCLASSETIT'#9'40'#9'Classe do Titulo ')
      DataField = 'IDCLASSETIT'
      DataSource = ds
      LookupTable = QryClasseTitulo
      LookupField = 'IDCLASSETIT'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 31
      Width = 387
      Height = 21
      DataField = 'DESCTIPRENFIXA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 406
      Top = 31
      Width = 68
      Height = 21
      DataField = 'CODTIPRENFIXA'
      DataSource = ds
      TabOrder = 1
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 14
      Top = 103
      Width = 217
      Height = 46
      Columns = 2
      DataField = 'FLGPREPOS'
      DataSource = ds
      Items.Strings = (
        'Pré-fixado'
        'Pós-fixado')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
    end
  end
  inherited Dock971: TDock97
    Top = 223
    Width = 490
    inherited tb97Fundo: TToolbar97
      Left = 216
      DockPos = 216
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 48
      DockPos = 48
    end
  end
  inherited Dock972: TDock97
    Width = 490
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT  TIP.CODTIPRENFIXA,  TIP.DESCTIPRENFIXA,  TIP.IDMOEDAREG,' +
        '       TIP.IDREGRACALCAGIO,'
      
        '        TIP.FLGSERTITFIX,   TIP.FLGIDALTTITFIX,  TIP.FLGDTEMITIT' +
        'FIX,   TIP.FLGDTVENCTITFIX,'
      
        '        TIP.FLGINDREAJFIX,  TIP.FLGDTINIJURFIX,  TIP.FLGDTBASEIN' +
        'DFIX,  TIP.FLGJURFIX,'
      
        '        TIP.FLGCODTPTXJUR,  TIP.FLGPREMIOFIX,    TIP.FLGCODTPTXP' +
        'RE,    TIP.FLGVLRAGIOOPER,'
      
        '        TIP.FLGIDLOTEFIX,   TIP.FLGDTCOMPRALOTE, TIP.FLGQTDTITLO' +
        'TE,    TIP.FLGSLDTITLOTE,'
      
        '        TIP.FLGVLRCOMPLOTE, TIP.FLGINDSWAPFIX,   TIP.TRGDTINCLUS' +
        'AO,    TIP.TRGUSERINCLUSAO,'
      
        '        TIP.CODTIPTXJUROS,  TIP.FLGDIASCOMPRA,   TIP.FLGDIASVEND' +
        'A,     TIP.IDCLASSETIT,'
      
        '        TIP.FLGPU,  '#9'    TIP.DIASCOMPRA,      TIP.DIASVENDA,    ' +
        '    TIP.FLLGPRORATA,'
      
        '        TIP.FLGINTERPOLA,   TIP.IDCUSTODIANTE,'#9' TIP.FLGPERCINDEX' +
        ',     TIP.PERCINDEX,'
      
        '        TIP.FLGINSTFIN,     TIP.FLGCARENCIA,     TIP.FLGPERIODIC' +
        'IDADE, TIP.FLGANIVERSARIO,'
      
        '        TIP.IDTRATAIND,     TIP.NUMCASASDEC,     TIP.FLGDTINITR,' +
        '       TIP.FLGINDICE2,'
      '        TIP.FLGPROVISIONAIR,TIP.FLGAPURAIR, TIP.FLGPREPOS '
      ''
      'FROM CM.TIPOTITRENFIXA TIP'
      ''
      'ORDER BY TIP.DESCTIPRENFIXA')
    Left = 279
    object qryCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object qryDESCTIPRENFIXA: TStringField
      FieldName = 'DESCTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.DESCTIPRENFIXA'
      Size = 60
    end
    object qryIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'TIPOTITRENFIXA.IDCLASSETIT'
    end
    object qryIDMOEDAREG: TFloatField
      FieldName = 'IDMOEDAREG'
      Origin = 'TIPOTITRENFIXA.IDMOEDAREG'
    end
    object qryIDREGRACALCAGIO: TFloatField
      FieldName = 'IDREGRACALCAGIO'
      Origin = 'TIPOTITRENFIXA.IDREGRACALCAGIO'
    end
    object qryFLGSERTITFIX: TStringField
      FieldName = 'FLGSERTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGSERTITFIX'
      Size = 1
    end
    object qryFLGIDALTTITFIX: TStringField
      FieldName = 'FLGIDALTTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGIDALTTITFIX'
      Size = 1
    end
    object qryFLGDTEMITITFIX: TStringField
      FieldName = 'FLGDTEMITITFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTEMITITFIX'
      Size = 1
    end
    object qryFLGDTVENCTITFIX: TStringField
      FieldName = 'FLGDTVENCTITFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTVENCTITFIX'
      Size = 1
    end
    object qryFLGINDREAJFIX: TStringField
      FieldName = 'FLGINDREAJFIX'
      Origin = 'TIPOTITRENFIXA.FLGINDREAJFIX'
      Size = 1
    end
    object qryFLGDTINIJURFIX: TStringField
      FieldName = 'FLGDTINIJURFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTINIJURFIX'
      Size = 1
    end
    object qryFLGDTBASEINDFIX: TStringField
      FieldName = 'FLGDTBASEINDFIX'
      Origin = 'TIPOTITRENFIXA.FLGDTBASEINDFIX'
      Size = 1
    end
    object qryFLGJURFIX: TStringField
      FieldName = 'FLGJURFIX'
      Origin = 'TIPOTITRENFIXA.FLGJURFIX'
      Size = 1
    end
    object qryFLGCODTPTXJUR: TStringField
      FieldName = 'FLGCODTPTXJUR'
      Origin = 'TIPOTITRENFIXA.FLGCODTPTXJUR'
      Size = 1
    end
    object qryFLGPREMIOFIX: TStringField
      FieldName = 'FLGPREMIOFIX'
      Origin = 'TIPOTITRENFIXA.FLGPREMIOFIX'
      Size = 1
    end
    object qryCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TIPOTITRENFIXA.CODTIPTXJUROS'
    end
    object qryFLGCODTPTXPRE: TStringField
      FieldName = 'FLGCODTPTXPRE'
      Origin = 'TIPOTITRENFIXA.FLGCODTPTXPRE'
      Size = 1
    end
    object qryFLGVLRAGIOOPER: TStringField
      FieldName = 'FLGVLRAGIOOPER'
      Origin = 'TIPOTITRENFIXA.FLGVLRAGIOOPER'
      Size = 1
    end
    object qryFLGIDLOTEFIX: TStringField
      FieldName = 'FLGIDLOTEFIX'
      Origin = 'TIPOTITRENFIXA.FLGIDLOTEFIX'
      Size = 1
    end
    object qryFLGDTCOMPRALOTE: TStringField
      FieldName = 'FLGDTCOMPRALOTE'
      Origin = 'TIPOTITRENFIXA.FLGDTCOMPRALOTE'
      Size = 1
    end
    object qryFLGQTDTITLOTE: TStringField
      FieldName = 'FLGQTDTITLOTE'
      Origin = 'TIPOTITRENFIXA.FLGQTDTITLOTE'
      Size = 1
    end
    object qryFLGSLDTITLOTE: TStringField
      FieldName = 'FLGSLDTITLOTE'
      Origin = 'TIPOTITRENFIXA.FLGSLDTITLOTE'
      Size = 1
    end
    object qryFLGVLRCOMPLOTE: TStringField
      FieldName = 'FLGVLRCOMPLOTE'
      Origin = 'TIPOTITRENFIXA.FLGVLRCOMPLOTE'
      Size = 1
    end
    object qryFLGINDSWAPFIX: TStringField
      FieldName = 'FLGINDSWAPFIX'
      Origin = 'TIPOTITRENFIXA.FLGINDSWAPFIX'
      Size = 1
    end
    object qryFLGDIASCOMPRA: TStringField
      FieldName = 'FLGDIASCOMPRA'
      Origin = 'TIPOTITRENFIXA.FLGDIASCOMPRA'
      Size = 1
    end
    object qryFLGDIASVENDA: TStringField
      FieldName = 'FLGDIASVENDA'
      Origin = 'TIPOTITRENFIXA.FLGDIASVENDA'
      Size = 1
    end
    object qryFLGPU: TFloatField
      FieldName = 'FLGPU'
      Origin = 'TIPOTITRENFIXA.FLGPU'
    end
    object qryDIASCOMPRA: TFloatField
      FieldName = 'DIASCOMPRA'
      Origin = 'TIPOTITRENFIXA.DIASCOMPRA'
    end
    object qryDIASVENDA: TFloatField
      FieldName = 'DIASVENDA'
      Origin = 'TIPOTITRENFIXA.DIASVENDA'
    end
    object qryFLLGPRORATA: TStringField
      FieldName = 'FLLGPRORATA'
      Origin = 'TIPOTITRENFIXA.FLLGPRORATA'
      Size = 1
    end
    object qryFLGINTERPOLA: TStringField
      FieldName = 'FLGINTERPOLA'
      Origin = 'TIPOTITRENFIXA.FLGINTERPOLA'
      Size = 1
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryFLGPERCINDEX: TStringField
      FieldName = 'FLGPERCINDEX'
      Origin = 'TIPOTITRENFIXA.FLGPERCINDEX'
      Size = 1
    end
    object qryFLGINSTFIN: TStringField
      FieldName = 'FLGINSTFIN'
      Origin = 'TIPOTITRENFIXA.FLGINSTFIN'
      Size = 1
    end
    object qryFLGCARENCIA: TStringField
      FieldName = 'FLGCARENCIA'
      Size = 1
    end
    object qryFLGPERIODICIDADE: TStringField
      FieldName = 'FLGPERIODICIDADE'
      Size = 1
    end
    object qryFLGANIVERSARIO: TStringField
      FieldName = 'FLGANIVERSARIO'
      Size = 1
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'TIPOTITRENFIXA.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'TIPOTITRENFIXA.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
      Origin = 'TIPOTITRENFIXA.PERCINDEX'
    end
    object qryIDTRATAIND: TFloatField
      FieldName = 'IDTRATAIND'
      Origin = 'TIPOTITRENFIXA.IDTRATAIND'
    end
    object qryNUMCASASDEC: TFloatField
      FieldName = 'NUMCASASDEC'
      Origin = 'TIPOTITRENFIXA.NUMCASASDEC'
    end
    object qryFLGINDICE2: TStringField
      FieldName = 'FLGINDICE2'
      Origin = 'TIPOTITRENFIXA.FLGINDICE2'
      Size = 1
    end
    object qryFLGDTINITR: TStringField
      FieldName = 'FLGDTINITR'
      Origin = 'TIPOTITRENFIXA.FLGDTINITR'
      Size = 1
    end
    object qryFLGPROVISIONAIR: TStringField
      FieldName = 'FLGPROVISIONAIR'
      Origin = 'TIPOTITRENFIXA.FLGPROVISIONAIR'
      Size = 1
    end
    object qryFLGAPURAIR: TStringField
      FieldName = 'FLGAPURAIR'
      Origin = 'TIPOTITRENFIXA.FLGAPURAIR'
      Size = 1
    end
    object qryFLGPREPOS: TFloatField
      FieldName = 'FLGPREPOS'
      Origin = 'TIPOTITRENFIXA.FLGPREPOS'
    end
  end
  inherited ds: TwwDataSource
    Left = 309
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TIPOTITRENFIXA'
      'set'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  DESCTIPRENFIXA = :DESCTIPRENFIXA,'
      '  IDMOEDAREG = :IDMOEDAREG,'
      '  IDREGRACALCAGIO = :IDREGRACALCAGIO,'
      '  FLGSERTITFIX = :FLGSERTITFIX,'
      '  FLGIDALTTITFIX = :FLGIDALTTITFIX,'
      '  FLGDTEMITITFIX = :FLGDTEMITITFIX,'
      '  FLGDTVENCTITFIX = :FLGDTVENCTITFIX,'
      '  FLGINDREAJFIX = :FLGINDREAJFIX,'
      '  FLGDTINIJURFIX = :FLGDTINIJURFIX,'
      '  FLGDTBASEINDFIX = :FLGDTBASEINDFIX,'
      '  FLGJURFIX = :FLGJURFIX,'
      '  FLGCODTPTXJUR = :FLGCODTPTXJUR,'
      '  FLGPREMIOFIX = :FLGPREMIOFIX,'
      '  FLGCODTPTXPRE = :FLGCODTPTXPRE,'
      '  FLGVLRAGIOOPER = :FLGVLRAGIOOPER,'
      '  FLGIDLOTEFIX = :FLGIDLOTEFIX,'
      '  FLGDTCOMPRALOTE = :FLGDTCOMPRALOTE,'
      '  FLGQTDTITLOTE = :FLGQTDTITLOTE,'
      '  FLGSLDTITLOTE = :FLGSLDTITLOTE,'
      '  FLGVLRCOMPLOTE = :FLGVLRCOMPLOTE,'
      '  FLGINDSWAPFIX = :FLGINDSWAPFIX,'
      '  CODTIPTXJUROS = :CODTIPTXJUROS,'
      '  FLGDIASCOMPRA = :FLGDIASCOMPRA,'
      '  FLGDIASVENDA = :FLGDIASVENDA,'
      '  IDCLASSETIT = :IDCLASSETIT,'
      '  FLGPU = :FLGPU,'
      '  DIASCOMPRA = :DIASCOMPRA,'
      '  DIASVENDA = :DIASVENDA,'
      '  FLLGPRORATA = :FLLGPRORATA,'
      '  FLGINTERPOLA = :FLGINTERPOLA,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGPERCINDEX = :FLGPERCINDEX,'
      '  PERCINDEX = :PERCINDEX,'
      '  FLGINSTFIN = :FLGINSTFIN,'
      '  FLGCARENCIA = :FLGCARENCIA,'
      '  FLGPERIODICIDADE = :FLGPERIODICIDADE,'
      '  FLGANIVERSARIO = :FLGANIVERSARIO,'
      '  IDTRATAIND = :IDTRATAIND,'
      '  NUMCASASDEC = :NUMCASASDEC,'
      '  FLGDTINITR = :FLGDTINITR,'
      '  FLGINDICE2 = :FLGINDICE2,'
      '  FLGPREPOS = :FLGPREPOS'
      'where'
      '  CODTIPRENFIXA = :OLD_CODTIPRENFIXA')
    InsertSQL.Strings = (
      'insert into CM.TIPOTITRENFIXA'
      
        '  (CODTIPRENFIXA, DESCTIPRENFIXA, IDMOEDAREG, IDREGRACALCAGIO, F' +
        'LGSERTITFIX, '
      
        '   FLGIDALTTITFIX, FLGDTEMITITFIX, FLGDTVENCTITFIX, FLGINDREAJFI' +
        'X, FLGDTINIJURFIX, '
      
        '   FLGDTBASEINDFIX, FLGJURFIX, FLGCODTPTXJUR, FLGPREMIOFIX, FLGC' +
        'ODTPTXPRE, '
      
        '   FLGVLRAGIOOPER, FLGIDLOTEFIX, FLGDTCOMPRALOTE, FLGQTDTITLOTE,' +
        ' FLGSLDTITLOTE, '
      
        '   FLGVLRCOMPLOTE, FLGINDSWAPFIX, CODTIPTXJUROS, FLGDIASCOMPRA, ' +
        'FLGDIASVENDA, '
      
        '   IDCLASSETIT, FLGPU, DIASCOMPRA, DIASVENDA, FLLGPRORATA, FLGIN' +
        'TERPOLA, '
      
        '   IDCUSTODIANTE, FLGPERCINDEX, PERCINDEX, FLGINSTFIN, FLGCARENC' +
        'IA, FLGPERIODICIDADE, '
      
        '   FLGANIVERSARIO, IDTRATAIND, NUMCASASDEC, FLGDTINITR, FLGINDIC' +
        'E2, FLGPREPOS)'
      'values'
      
        '  (:CODTIPRENFIXA, :DESCTIPRENFIXA, :IDMOEDAREG, :IDREGRACALCAGI' +
        'O, :FLGSERTITFIX, '
      
        '   :FLGIDALTTITFIX, :FLGDTEMITITFIX, :FLGDTVENCTITFIX, :FLGINDRE' +
        'AJFIX, '
      
        '   :FLGDTINIJURFIX, :FLGDTBASEINDFIX, :FLGJURFIX, :FLGCODTPTXJUR' +
        ', :FLGPREMIOFIX, '
      
        '   :FLGCODTPTXPRE, :FLGVLRAGIOOPER, :FLGIDLOTEFIX, :FLGDTCOMPRAL' +
        'OTE, :FLGQTDTITLOTE, '
      
        '   :FLGSLDTITLOTE, :FLGVLRCOMPLOTE, :FLGINDSWAPFIX, :CODTIPTXJUR' +
        'OS, :FLGDIASCOMPRA, '
      
        '   :FLGDIASVENDA, :IDCLASSETIT, :FLGPU, :DIASCOMPRA, :DIASVENDA,' +
        ' :FLLGPRORATA, '
      
        '   :FLGINTERPOLA, :IDCUSTODIANTE, :FLGPERCINDEX, :PERCINDEX, :FL' +
        'GINSTFIN, '
      
        '   :FLGCARENCIA, :FLGPERIODICIDADE, :FLGANIVERSARIO, :IDTRATAIND' +
        ', :NUMCASASDEC, '
      '   :FLGDTINITR, :FLGINDICE2, :FLGPREPOS)')
    DeleteSQL.Strings = (
      'delete from CM.TIPOTITRENFIXA'
      'where'
      '  CODTIPRENFIXA = :OLD_CODTIPRENFIXA')
    Left = 249
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOTITRENFIXA.DESCTIPRENFIXA'
      'TIPOTITRENFIXA.CODTIPRENFIXA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição do tipo de Titulo '
      'Código')
    Tabelas.Strings = (
      'TIPOTITRENFIXA')
    CamposChave.Strings = (
      'TIPOTITRENFIXA.CODTIPRENFIXA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '70'
      '15')
    Left = 373
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 342
    Top = 8
  end
  object QryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDREGRA, NOMEREGRA '
      ''
      'FROM CM.REGRA'
      ''
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 408
    Top = 9
  end
  object QryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC  '
      ''
      'FROM MOEDA '
      ''
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 438
    Top = 9
  end
  object QryClasseTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCLASSETIT, DESCCLASSETIT'
      'FROM CM.CLASSETITRENFIX'
      'ORDER BY DESCCLASSETIT')
    ValidateWithMask = True
    Left = 375
    Top = 165
  end
  object QryTipoJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPTXJUROS, DESCTIPJUROS'
      'FROM TIPOJUROS '
      'ORDER BY DESCTIPJUROS')
    ValidateWithMask = True
    Left = 310
    Top = 165
    object QryTipoJurosDESCTIPJUROS: TStringField
      DisplayLabel = 'Tipo de Juros '
      DisplayWidth = 40
      FieldName = 'DESCTIPJUROS'
      Origin = 'TIPOJUROS.DESCTIPJUROS'
      Size = 60
    end
    object QryTipoJurosCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TIPOJUROS.CODTIPTXJUROS'
      Visible = False
    end
  end
  object QryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIANTE, SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE'
      ''
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 343
    Top = 165
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 40
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryTrataIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  TRA.IDTRATAIND, TRA.DESCTRATAIND, TRA.CODTRATAIND'
      'FROM CM.TRATAINDICE TRA'
      'ORDER BY TRA.DESCTRATAIND')
    ValidateWithMask = True
    Left = 407
    Top = 165
  end
  object qryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGPROVISIONAIRRF'
      'FROM'
      '   PARAMINVEST')
    ValidateWithMask = True
    Left = 433
    Top = 106
  end
end
A
