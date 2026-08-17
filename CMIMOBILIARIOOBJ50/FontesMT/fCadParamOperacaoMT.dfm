inherited frmCadParamOperacaoMT: TfrmCadParamOperacaoMT
  Left = 338
  Top = 17
  HelpContext = 640097
  Caption = 'Parâmetros para Integração Financeira/Contábil [Operações]'
  ClientHeight = 448
  ClientWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 754
    Height = 362
    object Bevel2: TBevel
      Left = 8
      Top = 153
      Width = 737
      Height = 3
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 62
      Height = 13
      Caption = 'Descrição:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 53
      Width = 737
      Height = 3
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 399
      Top = 71
      Width = 60
      Height = 13
      Caption = 'Operação:'
    end
    object Label8: TLabel
      Left = 7
      Top = 71
      Width = 71
      Height = 13
      Caption = 'Tipo Imóvel:'
    end
    object Label9: TLabel
      Left = 24
      Top = 147
      Width = 72
      Height = 13
      Caption = ' Parâmetros '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 16
      Top = 304
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label4: TLabel
      Left = 384
      Top = 304
      Width = 153
      Height = 13
      Caption = 'Tipo de Operação Contábil'
    end
    object Label1: TLabel
      Left = 24
      Top = 46
      Width = 93
      Height = 13
      Caption = ' Filtro / Escopo '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBedtDescricao: TDBEdit
      Left = 81
      Top = 16
      Width = 456
      Height = 21
      DataField = 'DESCPADRLANCIMO'
      DataSource = ds
      TabOrder = 0
    end
    object DBchkIntegraContab: TDBCheckBox
      Left = 552
      Top = 18
      Width = 193
      Height = 17
      Caption = 'Gera Lançamentos Contábeis'
      DataField = 'FLGINTEGRACONTAB'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBcboTipoRecCusto: TwwDBLookupCombo
      Left = 459
      Top = 67
      Width = 277
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
      DataField = 'IDTIPOCUSTORECIMO'
      DataSource = ds
      LookupTable = CdsTipoCustoRecImov
      LookupField = 'IDTIPOCUSTORECIMO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboTipoImovel: TwwDBLookupCombo
      Left = 90
      Top = 67
      Width = 295
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL'#9'F')
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      LookupTable = CdsTipoImovel
      LookupField = 'CODTIPIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object grpContaResult: TGroupBox
      Left = 16
      Top = 235
      Width = 721
      Height = 57
      Caption = ' Conta Crédito '
      TabOrder = 4
      object Label25: TLabel
        Left = 176
        Top = 14
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label11: TLabel
        Left = 8
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label5: TLabel
        Left = 448
        Top = 14
        Width = 244
        Height = 13
        Caption = 'Sub-Conta - informada no imovel ou mestre'
        Enabled = False
        Visible = False
      end
      object btnBuscaContaResult: TBitBtn
        Left = 144
        Top = 28
        Width = 24
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 1
        OnClick = btnBuscaContaResultClick
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
      object DBcboCCResult: TwwDBLookupCombo
        Left = 176
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTORESULT'
        DataSource = ds
        LookupTable = CdsCentCustoResult
        LookupField = 'CODCENTROCUSTO'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBedtContaResult: TDBEdit
        Left = 8
        Top = 28
        Width = 137
        Height = 21
        DataField = 'CONTARESULT'
        DataSource = ds
        TabOrder = 0
        OnExit = DBedtContaResultExit
      end
      object DBcboSCResult: TwwDBLookupCombo
        Left = 448
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
        DataField = 'SUBCONTARESULT'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookSCResult
        LookupField = 'SUBCONTARESULT'
        Enabled = False
        TabOrder = 3
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpContaDebCre: TGroupBox
      Left = 16
      Top = 169
      Width = 721
      Height = 57
      Caption = ' Conta Débito '
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 39
        Height = 13
        Caption = 'Label2'
      end
      object Label10: TLabel
        Left = 176
        Top = 14
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label12: TLabel
        Left = 8
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label13: TLabel
        Left = 449
        Top = 13
        Width = 210
        Height = 13
        Caption = 'Sub-Conta - informada no fornecedor'
        Enabled = False
        Visible = False
      end
      object btnBuscaContaDebCre: TBitBtn
        Left = 144
        Top = 28
        Width = 24
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 1
        OnClick = btnBuscaContaDebCreClick
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
      object DBcboCCDebCre: TwwDBLookupCombo
        Left = 176
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTODEBCRE'
        DataSource = ds
        LookupTable = CdsCentCustoDebCre
        LookupField = 'CODCENTROCUSTO'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBedtContaDebCre: TDBEdit
        Left = 8
        Top = 28
        Width = 137
        Height = 21
        DataField = 'CONTADEBCRE'
        DataSource = ds
        TabOrder = 0
        OnExit = DBedtContaDebCreExit
      end
      object DBcboSCDebCre: TwwDBLookupCombo
        Left = 448
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
        DataField = 'SUBCONTADEBCRE'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookSCDebCre
        LookupField = 'SUBCONTADEBCRE'
        Enabled = False
        TabOrder = 3
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object DBcboUnidNegocio: TwwDBLookupCombo
      Left = 16
      Top = 318
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'NOME')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = CdsAtividadeProj
      LookupField = 'UNIDNEGOC'
      Style = csDropDownList
      DropDownCount = 6
      DropDownWidth = 8
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboTipOper: TwwDBLookupCombo
      Left = 384
      Top = 318
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'Descrição'#9'F')
      DataField = 'TIPCODIGO'
      DataSource = ds
      LookupTable = CdsTipOper
      LookupField = 'TIPCODIGO'
      Style = csDropDownList
      DropDownCount = 4
      DropDownWidth = 8
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    inline molContrato1: TmolContrato
      Left = 8
      Top = 119
      Width = 737
      Height = 30
      TabOrder = 8
      inherited Label2: TLabel
        Left = 1
        Top = 7
        Width = 53
        Caption = 'Contrato:'
      end
      inherited edtContrato: TEdit
        Left = 82
        Top = 5
        Width = 597
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 678
        Top = 5
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 702
        Top = 5
      end
    end
    inline molImovel1: TmolImovelouMestre
      Left = 7
      Top = 88
      Width = 737
      Height = 33
      TabOrder = 9
      inherited lblImovelouMestre: TLabel
        Left = 1
        Top = 11
        Width = 42
        Caption = 'Imóvel:'
      end
      inherited edtImovel: TEdit
        Left = 83
        Top = 8
        Width = 598
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 680
        Top = 8
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 704
        Top = 8
      end
    end
  end
  inherited Dock972: TDock97
    Width = 754
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 754
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    object CdsIDPADRLANCIMOVEL: TFloatField
      FieldName = 'IDPADRLANCIMOVEL'
    end
    object CdsUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object CdsSUBCONTARESULT: TFloatField
      FieldName = 'SUBCONTARESULT'
    end
    object CdsCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object CdsCENTROCUSTORESULT: TStringField
      FieldName = 'CENTROCUSTORESULT'
      FixedChar = True
      Size = 10
    end
    object CdsCENTROCUSTODEBCRE: TStringField
      FieldName = 'CENTROCUSTODEBCRE'
      FixedChar = True
      Size = 10
    end
    object CdsCONTADEBCRE: TStringField
      FieldName = 'CONTADEBCRE'
      FixedChar = True
      Size = 18
    end
    object CdsPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object CdsCONTARESULT: TStringField
      FieldName = 'CONTARESULT'
      FixedChar = True
      Size = 18
    end
    object CdsIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object CdsIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsFLGRESPPAGAMENTO: TStringField
      FieldName = 'FLGRESPPAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
    end
    object CdsFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
    end
    object CdsSUBCONTADEBCRE: TFloatField
      FieldName = 'SUBCONTADEBCRE'
    end
    object CdsDESCPADRLANCIMO: TStringField
      FieldName = 'DESCPADRLANCIMO'
      Size = 120
    end
    object CdsIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object CdsFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      FixedChar = True
      Size = 1
    end
    object CdsIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object CdsIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object CdsCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLI.DESCPADRLANCIMO'
      'TI.CODTIPIMOVEL'
      'TCR.DESCCUSTORECIMO'
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descricão'
      'Tipo de Imóvel'
      'Tipo de Despesa'
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Nº Contrato'
      'Nome Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOIMOVEL C'
      'PADRLANCIMOVEL PLI'
      'TIPOIMOVEL TI'
      'TIPOCUSTORECIMOV TCR')
    CamposChave.Strings = (
      'PLI.IDPADRLANCIMOVEL')
    Filtro.Strings = (
      'PLI.RECPAG = '#39'O'#39
      'PLI.IDIMOVEL = I.IDIMOVEL(+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'PLI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)'
      'PLI.CODTIPIMOVEL = TI.CODTIPIMOVEL(+)'
      'PLI.IDTIPOCUSTORECIMO = TCR.IDTIPOCUSTORECIMO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '10'
      '20'
      '30'
      '30'
      '10'
      '10'
      '30')
    ExibePergunta = False
    Left = 392
    Top = 0
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST, PLATIPO'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  1=2 '
      '  AND ( PLATIPO = '#39'A'#39')')
    ValidateWithMask = True
    Left = 672
    Top = 1
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 592
    Top = 1
  end
  object CdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 304
    Top = 87
    object CdsTipoImovelCODTIPIMOVEL: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsTipoImovelDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Tipo Imóvel'
      DisplayWidth = 25
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object CdsTipoCustoRecImov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 512
    Top = 88
    object CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsTipoCustoRecImovFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object CdsTipoCustoRecImovRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object CdsAtividadeProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 136
    Top = 356
    object CdsAtividadeProjUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object CdsAtividadeProjNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
  end
  object CdsTipOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 560
    Top = 359
    object CdsTipOperTIPDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Size = 25
    end
    object CdsTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  object CdsCentCustoDebCre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 384
    Top = 302
    object CdsCentCustoDebCreCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsCentCustoDebCreNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ' ')
    ValidateWithMask = True
    Left = 688
    Top = 136
    object qryVerificaContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryVerificaContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryVerificaContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
    object qryVerificaContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Size = 1
    end
  end
  object CdsPlanoConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 104
    Top = 294
    object CdsPlanoContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object CdsPlanoContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object CdsPlanoContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      FixedChar = True
      Size = 1
    end
    object CdsPlanoContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      FixedChar = True
      Size = 1
    end
    object CdsPlanoContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      FixedChar = True
      Size = 1
    end
  end
  object CdsCentCustoResult: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 384
    Top = 238
    object StringField1: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
end
