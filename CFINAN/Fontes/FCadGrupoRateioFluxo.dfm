inherited FrmCadGrupoRateioFluxo: TFrmCadGrupoRateioFluxo
  Left = 781
  Top = 221
  Caption = 'Padrões de Rateio para Movimentações dos Fluxos Orçados'
  ClientHeight = 553
  ClientWidth = 753
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 467
    inherited pnlMestre: TPanel
      Width = 751
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Nome do Grupo'
      end
      object Label3: TLabel
        Left = 631
        Top = 10
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Rateio'
      end
      object lblQuantImoveis: TLabel
        Left = 632
        Top = 45
        Width = 77
        Height = 13
        Caption = '000 Rateio(s)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object DBedtNomeGrupo: TDBEdit
        Left = 16
        Top = 24
        Width = 409
        Height = 21
        DataField = 'GRRFDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object edtTotalRateio: TDBRealEdit
        Left = 631
        Top = 24
        Width = 73
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '      0,0000')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
      end
      object dbRGTipoRateio: TDBRadioGroup
        Left = 435
        Top = 9
        Width = 185
        Height = 37
        Caption = 'Tipo de Rateio'
        Columns = 2
        DataField = 'tiporateio'
        DataSource = ds
        Items.Strings = (
          'Percentual'
          'Valor')
        TabOrder = 2
        Values.Strings = (
          'P'
          'V')
        OnChange = dbRGTipoRateioChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 751
      Height = 405
      Tabs.Strings = (
        'Rateio')
      inherited pgctrlDetalhe: TPageControl
        Width = 653
        Height = 346
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 645
            Height = 318
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 645
            Height = 318
            object lblUnidNegoc: TLabel
              Left = 16
              Top = 8
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object lblCentroRespon: TLabel
              Left = 16
              Top = 48
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lblTipoRD: TLabel
              Left = 16
              Top = 168
              Width = 196
              Height = 13
              Caption = 'Tipo de Recebimento/Desembolso'
            end
            object Label2: TLabel
              Left = 328
              Top = 128
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object Label6: TLabel
              Left = 16
              Top = 128
              Width = 84
              Height = 13
              Caption = 'Linha do Fluxo'
            end
            object lblMoeda: TLabel
              Left = 328
              Top = 168
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label7: TLabel
              Left = 328
              Top = 8
              Width = 142
              Height = 13
              Caption = 'Critério para Segregação'
            end
            object Label19: TLabel
              Left = 328
              Top = 88
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object Label18: TLabel
              Left = 328
              Top = 48
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label8: TLabel
              Left = 16
              Top = 88
              Width = 83
              Height = 13
              Caption = 'Fluxo de caixa'
            end
            object Label10: TLabel
              Left = 394
              Top = 255
              Width = 129
              Height = 13
              Caption = 'Percentual de Rateio: '
            end
            object Label4: TLabel
              Left = 600
              Top = 251
              Width = 16
              Height = 20
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 16
              Top = 206
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label5: TLabel
              Left = 328
              Top = 205
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 16
              Top = 24
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'#9'F')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = cdsUnidNeg
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcUnidNegocCloseUp
            end
            object dblcCentroRespon: TwwDBLookupCombo
              Left = 16
              Top = 64
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDet
              LookupTable = cdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblcCentroResponChange
              OnDropDown = dblcCentroResponDropDown
              OnCloseUp = dblcCentroResponCloseUp
            end
            object dblcTipoDocurmento: TwwDBLookupCombo
              Left = 328
              Top = 144
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'F')
              DataField = 'CODTIPDOC'
              DataSource = dsDet
              LookupTable = cdsTipoDoc
              LookupField = 'CODTIPDOC'
              Options = [loTitles]
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcTipoDocurmentoCloseUp
              OnEnter = dblcTipoDocurmentoEnter
            end
            object dblcTipoRD: TwwDBLookupCombo
              Left = 16
              Top = 184
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'F'
                'RECPAG'#9'1'#9'Rec/Pag'#9'F'
                'CODTIPRECDES'#9'15'#9'Código'#9'F')
              DataField = 'CODTIPRECDES'
              DataSource = dsDet
              LookupTable = cdsTipoRecDes
              LookupField = 'CODTIPRECDES'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcTipoRDCloseUp
              OnEnter = dblcTipoRDEnter
            end
            object dblcLinhasFluxo: TwwDBLookupCombo
              Left = 16
              Top = 144
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'F')
              DataField = 'CODLINHAFLUXO'
              DataSource = dsDet
              LookupTable = cdsLinhaFluxo
              LookupField = 'CODLINHAFLUXO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcLinhasFluxoCloseUp
              OnEnter = dblcLinhasFluxoEnter
            end
            object dblcMoeda: TwwDBLookupCombo
              Left = 328
              Top = 184
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Descrição'#9'F')
              DataField = 'MOECODIGO'
              DataSource = dsDet
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcMoedaCloseUp
            end
            object dblcSegregaCriter: TwwDBLookupCombo
              Left = 328
              Top = 24
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'F')
              DataField = 'IDSEGREGACRITER'
              DataSource = dsDet
              LookupTable = cdsSegregaCriter
              LookupField = 'IDSEGREGACRITER'
              Options = [loTitles]
              TabOrder = 6
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcSegregaCriterCloseUp
            end
            object dblcPlanoPrev: TwwDBLookupCombo
              Left = 328
              Top = 104
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'#9'F')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = cdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              TabOrder = 8
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcPlanoPrevCloseUp
            end
            object dblcPatrocinador: TwwDBLookupCombo
              Left = 328
              Top = 64
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'30'#9'Descrição'#9'F')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = cdsPatrocinador
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              TabOrder = 7
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcPatrocinadorCloseUp
            end
            object cboFluxoCaixa: TDBLookupComboBox
              Left = 16
              Top = 104
              Width = 288
              Height = 21
              DataField = 'IDFLUXOCAIXA'
              DataSource = dsDet
              DropDownRows = 8
              KeyField = 'IDFLUXOCAIXA'
              ListField = 'DESCRICAO'
              ListSource = dsFluxoCaixa
              TabOrder = 2
              OnCloseUp = cboFluxoCaixaCloseUp
              OnDropDown = cboFluxoCaixaDropDown
            end
            object dbedtPercent: TDBRealEdit
              Left = 524
              Top = 251
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              TabOrder = 12
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCENTRATEIO'
              DataSource = dsDet
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 16
              Top = 220
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
              DataField = 'IDPROGRAMA'
              DataSource = dsDet
              LookupTable = cdsPrograma
              LookupField = 'IDPROGRAMA'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcProgramaCloseUp
            end
            object dblcCentroCusto: TwwDBLookupCombo
              Left = 328
              Top = 221
              Width = 288
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              TabOrder = 11
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblcCentroResponChange
              OnDropDown = dblcCentroResponDropDown
              OnCloseUp = dblcCentroResponCloseUp
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 743
      end
      inherited Dock974: TDock97
        Left = 657
        Height = 346
      end
    end
  end
  inherited Dock972: TDock97
    Width = 753
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 15
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 328
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 56
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 356
    Top = 8
  end
  inherited Cds: TCMClientDataSet
    Left = 300
    Top = 8
    object CdsIDGRUPORATEIOFLUXO: TFloatField
      FieldName = 'IDGRUPORATEIOFLUXO'
    end
    object CdsGRRFDESCRICAO: TStringField
      FieldName = 'GRRFDESCRICAO'
      Size = 60
    end
    object Cdstiporateio: TStringField
      FieldName = 'tiporateio'
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPORATEIOFLUXO.GRRFDESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPORATEIOFLUXO')
    CamposChave.Strings = (
      'GRUPORATEIOFLUXO.IDGRUPORATEIOFLUXO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    ApenasLetraENum.Strings = (
      'N')
    ComparaMaiuscula.Strings = (
      '')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 228
    Top = 11
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 528
    Top = 8
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 500
    Top = 8
  end
  object sqlCds: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDGRUPORATEIOFLUXO, GRRFDESCRICAO, TIPORATEIO '
      'FROM '
      '  GRUPORATEIOFLUXO'
      'ORDER BY '
      '  GRRFDESCRICAO   '
      '')
    ClientDataSet = Cds
    Left = 272
    Top = 8
  end
  object cdsLinhaFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 319
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 363
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 239
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 279
  end
  object cdsSegregaCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 203
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 239
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 203
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 359
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 400
    Top = 331
  end
  object CdsFluxoCaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 279
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsDetBeforePost
    AfterPost = CdsDetAfterPost
    Left = 472
    Top = 8
    object CdsDetUNIDNEGOC: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object CdsDetUNIDNEGOCIO: TStringField
      DisplayLabel = 'Ativ. / Projeto'
      DisplayWidth = 15
      FieldName = 'UNIDNEGOCIO'
      Size = 25
    end
    object CdsDetCODCENTRORESPON: TStringField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsDetCENTRORESPON: TStringField
      DisplayLabel = 'C.Responsabilidade'
      DisplayWidth = 20
      FieldName = 'CENTRORESPON'
      FixedChar = True
      Size = 30
    end
    object CdsDetIDFLUXOCAIXA: TFloatField
      Tag = 7
      FieldName = 'IDFLUXOCAIXA'
      Visible = False
    end
    object CdsDetFLUXOCAIXA: TStringField
      DisplayLabel = 'Fluxo de caixa'
      DisplayWidth = 20
      FieldName = 'FLUXOCAIXA'
      Size = 60
    end
    object CdsDetCODLINHAFLUXO: TFloatField
      Tag = 8
      FieldName = 'CODLINHAFLUXO'
      Visible = False
    end
    object CdsDetLINHADEFLUXO: TStringField
      DisplayLabel = 'Linha do Fluxo'
      DisplayWidth = 20
      FieldName = 'LINHADEFLUXO'
      Size = 60
    end
    object CdsDetRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsDetCODTIPRECDES: TStringField
      Tag = 8
      DisplayLabel = 'Tipo Desembolso'
      DisplayWidth = 12
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object CdsDetTIPODESEMBOLSO: TStringField
      DisplayLabel = 'Tipo Desembolso'
      DisplayWidth = 15
      FieldName = 'TIPODESEMBOLSO'
      Size = 35
    end
    object CdsDetIDSEGREGACRITER: TFloatField
      Tag = 8
      FieldName = 'IDSEGREGACRITER'
      Visible = False
    end
    object CdsDetSEGREGACRITER: TStringField
      DisplayLabel = 'Critério para Segregação'
      DisplayWidth = 20
      FieldName = 'SEGREGACRITER'
      Size = 60
    end
    object CdsDetIDPATRO: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsDetPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsDetIDPLANOPREV: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object CdsDetPLANPREV: TStringField
      DisplayLabel = 'Plano Prev.'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Size = 50
    end
    object CdsDetCODTIPDOC: TFloatField
      Tag = 8
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object CdsDetTIPODOCUMENTO: TStringField
      DisplayLabel = 'Tipo de Documento'
      DisplayWidth = 20
      FieldName = 'TIPODOCUMENTO'
      Size = 35
    end
    object CdsDetMOECODIGO: TFloatField
      Tag = 8
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object CdsDetMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
    end
    object CdsDetIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object CdsDetPROGRAMA: TStringField
      FieldName = 'PROGRAMA'
      Size = 25
    end
    object CdsDetCENTROCUSTO: TStringField
      DisplayLabel = 'C.Custo'
      DisplayWidth = 20
      FieldName = 'CENTROCUSTO'
      FixedChar = True
      Size = 30
    end
    object CdsDetCODCENTROCUSTO: TStringField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsDetPERCENTRATEIO: TFloatField
      DisplayLabel = ' % '
      DisplayWidth = 10
      FieldName = 'PERCENTRATEIO'
      DisplayFormat = '#0.0000'
      EditFormat = '#0'
    end
    object CdsDetIDPADRAORATEIOFLUXO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPADRAORATEIOFLUXO'
      Visible = False
    end
    object CdsDetIDGRUPORATEIOFLUXO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPORATEIOFLUXO'
      Visible = False
    end
    object CdsDetIDEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESAPROP'
      Visible = False
    end
  end
  object sqlCdsDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PDR.IDPADRAORATEIOFLUXO,'
      '  PDR.IDGRUPORATEIOFLUXO,                                '
      '  PDR.IDEMPRESAPROP,                                     '
      '  PDR.UNIDNEGOC, UND.NOME AS UNIDNEGOCIO,'
      '  PDR.CODCENTRORESPON, CRE.NOME AS CENTRORESPON,         '
      '  PDR.IDFLUXOCAIXA, FLC.DESCRICAO AS FLUXOCAIXA,         '
      '  PDR.CODLINHAFLUXO, FLX.DESCRICAO AS LINHADEFLUXO,'
      '  PDR.RECPAG,                                            '
      '  PDR.CODTIPRECDES, TRD.DESCRICAO AS TIPODESEMBOLSO,'
      '  PDR.IDSEGREGACRITER, SCR.DESCRICAO AS SEGREGACRITER,'
      '  PDR.IDPATRO, PTR.NOME AS PATRO,'
      '  PDR.IDPLANOPREV, PLP.NOME AS PLANPREV,'
      '  PDR.CODTIPDOC, TRP.DESCRICAO AS TIPODOCUMENTO,'
      '  PDR.MOECODIGO, MOE.MOEDESC AS MOEDA,'
      '  PDR.IDPROGRAMA,'
      '  PRG.DESCPROGRAMA AS PROGRAMA,'
      '  PDR.PERCENTRATEIO'
      'FROM'
      '  PADRAORATEIOFLUXO PDR,'
      '  UNIDNEGOCIO UND,'
      '  CENTRESPON CRE,'
      '  FLUXOCAIXA FLC,'
      '  PESSOA PTR,'
      '  PLANPREVCONTABIL PLP,'
      '  TIPODOCRECPAG TRP,'
      '  MOEDA MOE,'
      '  TIPORECEBDESEMB TRD,'
      '  MONTAFLUXO FLX,'
      '  SEGREGACRITER SCR,'
      '  PROGRAMA PRG'
      'WHERE'
      '      PDR.IDEMPRESAPROP = 1'
      '  AND PDR.RECPAG = '#39'P'#39
      '  AND PDR.IDEMPRESAPROP = UND.IDPESSOA'
      '  AND PDR.UNIDNEGOC = UND.UNIDNEGOC'
      '  AND PDR.IDEMPRESAPROP = CRE.IDPESSOA'
      '  AND PDR.CODCENTRORESPON = CRE.CODCENTRORESPON'
      '  AND PDR.IDFLUXOCAIXA = FLC.IDFLUXOCAIXA'
      '  AND PDR.IDSEGREGACRITER = SCR.IDSEGREGACRITER'
      '  AND PDR.IDPATRO = PTR.IDPESSOA'
      '  AND PDR.IDPLANOPREV = PLP.IDPLANOPREV'
      '  AND PDR.CODTIPDOC = TRP.CODTIPDOC'
      '  AND PDR.MOECODIGO = MOE.MOECODIGO'
      '  AND PDR.IDEMPRESAPROP = TRD.IDPESSOA'
      '  AND PDR.RECPAG = TRD.RECPAG'
      '  AND PDR.CODTIPRECDES = TRD.CODTIPRECDES'
      '  AND PDR.CODLINHAFLUXO = FLX.CODLINHAFLUXO'
      '  AND PDR.IDPROGRAMA = PRG.IDPROGRAMA'
      ' '
      ' ')
    ClientDataSet = CdsDet
    Left = 444
    Top = 8
  end
  object dsFluxoCaixa: TDataSource
    DataSet = CdsFluxoCaixa
    Left = 196
    Top = 279
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 400
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 416
    Top = 407
  end
end
