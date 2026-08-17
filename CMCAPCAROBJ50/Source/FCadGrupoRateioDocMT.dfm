inherited frmCadGrupoRateioDocMT: TfrmCadGrupoRateioDocMT
  Left = 32
  Top = 78
  Caption = 'Cadastro de Grupos de Rateio'
  ClientHeight = 450
  ClientWidth = 739
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 739
    Height = 364
    inherited pnlMestre: TPanel
      Width = 737
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Nome do Grupo'
      end
      object Label3: TLabel
        Left = 440
        Top = 10
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Rateio'
      end
      object lblQuantImoveis: TLabel
        Left = 441
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
      object Label4: TLabel
        Left = 517
        Top = 24
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
      object DBedtNomeGrupo: TDBEdit
        Left = 16
        Top = 24
        Width = 409
        Height = 21
        DataField = 'GRRDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object edtTotalRateio: TDBRealEdit
        Left = 440
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 737
      Height = 302
      Tabs.Strings = (
        'Rateio')
      inherited pgctrlDetalhe: TPageControl
        Width = 639
        Height = 243
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 631
            Height = 215
            Selected.Strings = (
              'PERCENTRATEIO'#9'10'#9' % '
              'UNIDNEGOCIO'#9'15'#9'Ativ. / Projeto'
              'CENTROCUSTO'#9'15'#9'C.Custo'
              'CENTRORESPON'#9'20'#9'C.Responsabilidade'#9'F'
              'TIPODESEMBOLSO'#9'15'#9'Tipo Desembolso'
              'DESCPROGRAMA'#9'15'#9'Programa'
              'PATRO'#9'25'#9'Patrocinadora'
              'PLANPREV'#9'25'#9'Plano Prev.')
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 631
            Height = 215
            object Label10: TLabel
              Left = 374
              Top = 150
              Width = 129
              Height = 13
              Caption = 'Percentual de Rateio: '
            end
            object lblUnidNegoc: TLabel
              Left = 16
              Top = 10
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object lblCentroRespon: TLabel
              Left = 16
              Top = 50
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lblTipoRD: TLabel
              Left = 16
              Top = 90
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object Label6: TLabel
              Left = 16
              Top = 130
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label13: TLabel
              Left = 312
              Top = 10
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label11: TLabel
              Left = 312
              Top = 50
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object Label12: TLabel
              Left = 312
              Top = 90
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label2: TLabel
              Left = 580
              Top = 147
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
            object dbedtPercent: TDBRealEdit
              Left = 504
              Top = 147
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCENTRATEIO'
              DataSource = dsDet
            end
            object DBcboUnidNegoc: TwwDBLookupCombo
              Left = 16
              Top = 24
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNETIPO'#9'1'#9'T'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = cdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboUnidNegocCloseUp
            end
            object DBcboCentroRespon: TwwDBLookupCombo
              Left = 16
              Top = 64
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'CODCENTRORESPON'#9'10'#9'Código')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDet
              LookupTable = CdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboCentroResponCloseUp
            end
            object DBcboTipoRD: TwwDBLookupCombo
              Left = 16
              Top = 104
              Width = 281
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              DataField = 'CODTIPRECDES'
              DataSource = dsDet
              LookupTable = CdsTipoRD
              LookupField = 'CODTIPRECDES'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboTipoRDCloseUp
            end
            object DBcboCentCusto: TwwDBLookupCombo
              Left = 16
              Top = 144
              Width = 281
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboCentCustoCloseUp
            end
            object DBcboPrograma: TCMDBLookupCombo
              Left = 312
              Top = 24
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Descrição')
              DataField = 'IDPROGRAMA'
              DataSource = dsDet
              LookupTable = CdsProgramaPrev
              LookupField = 'IDPROGRAMA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboProgramaCloseUp
            end
            object DBcboPlano: TCMDBLookupCombo
              Left = 312
              Top = 64
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Plano Previdenciário')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = CdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboPlanoCloseUp
            end
            object DBcboPatro: TCMDBLookupCombo
              Left = 312
              Top = 104
              Width = 282
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = CdsPatroPrev
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DBcboPatroCloseUp
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 729
      end
      inherited Dock974: TDock97
        Left = 643
        Height = 243
      end
    end
  end
  inherited Dock972: TDock97
    Width = 739
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 739
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 994
    Top = 65535
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 408
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 944
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 456
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 376
    Top = 0
    object CdsIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
    end
    object CdsIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object CdsGRRDESCRICAO: TStringField
      FieldName = 'GRRDESCRICAO'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPORATEIO.GRRDESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPORATEIO')
    CamposChave.Strings = (
      'GRUPORATEIO.IDGRUPORATEIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 264
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 616
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 568
    Top = 0
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsDetBeforePost
    AfterPost = CdsDetAfterPost
    Left = 528
    object CdsDetPERCENTRATEIO: TFloatField
      DisplayLabel = ' % '
      DisplayWidth = 10
      FieldName = 'PERCENTRATEIO'
      DisplayFormat = '#0.0000'
      EditFormat = '#0'
    end
    object CdsDetUNIDNEGOCIO: TStringField
      DisplayLabel = 'Ativ. / Projeto'
      DisplayWidth = 15
      FieldName = 'UNIDNEGOCIO'
      Size = 25
    end
    object CdsDetCENTROCUSTO: TStringField
      DisplayLabel = 'C.Custo'
      DisplayWidth = 15
      FieldName = 'CENTROCUSTO'
      Size = 30
    end
    object CdsDetCENTRORESPON: TStringField
      DisplayLabel = 'C.Responsabilidade'
      DisplayWidth = 20
      FieldName = 'CENTRORESPON'
      FixedChar = True
      Size = 30
    end
    object CdsDetTIPODESEMBOLSO: TStringField
      DisplayLabel = 'Tipo Desembolso'
      DisplayWidth = 15
      FieldName = 'TIPODESEMBOLSO'
      Size = 35
    end
    object CdsDetDESCPROGRAMA: TStringField
      DisplayLabel = 'Programa'
      DisplayWidth = 15
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDetPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsDetPLANPREV: TStringField
      DisplayLabel = 'Plano Prev.'
      DisplayWidth = 25
      FieldName = 'PLANPREV'
      Size = 50
    end
    object CdsDetCODCENTROCUSTO: TStringField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsDetCODCENTRORESPON: TStringField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object CdsDetCODTIPRECDES: TStringField
      Tag = 7
      DisplayLabel = 'Tipo Desembolso'
      DisplayWidth = 12
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object CdsDetIDEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESAPROP'
      Visible = False
    end
    object CdsDetIDGRUPORATEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPORATEIO'
      Visible = False
    end
    object CdsDetIDPADRRATEIODOC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPADRRATEIODOC'
      Visible = False
    end
    object CdsDetIDPATRO: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsDetIDPLANOPREV: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object CdsDetIDPROGRAMA: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object CdsDetRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsDetUNIDNEGOC: TFloatField
      Tag = 7
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
  end
  object sqlProgramaPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PR.IDPROGRAMA,'
      '   PR.CODPROGRAMA, PR.DESCPROGRAMA'
      ''
      'FROM'
      '   PROGRAMA PR'
      ''
      'ORDER BY'
      '   PR.DESCPROGRAMA')
    ClientDataSet = CdsProgramaPrev
    Left = 456
    Top = 208
  end
  object CdsProgramaPrev: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 208
    Data = {
      120100009619E0BD010000001800000003000400000003000000AB000A494450
      524F4752414D4108000400000000000B434F4450524F4752414D410100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020002000C4445534350524F4752414D41010049000000010005574944
      5448020002003C0002000D44454641554C545F4F524445520200820001000000
      0300044C43494404000100090800000000000000000000184001340E41444D49
      4E49535452415449564F0000000000000000104001320C415353495354454E43
      49414C0000000000000000144001330D494E56455354494D454E544F53000000
      0000000000084001310C505245564944454E4349414C}
  end
  object sqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CC.CODCENTROCUSTO, CC.NOME'
      ''
      'FROM'
      '   CENTCUST CC'
      ''
      'WHERE'
      '       ( CC.IDEMPRESA      =:PIDEMPRESA )'
      '   AND ( CC.STATUSGRUPOCDC = '#39'A'#39' )'
      '   AND ( CC.ATIVO          = '#39'S'#39' )'
      ''
      'ORDER BY'
      '   CC.NOME')
    ClientDataSet = CdsCentroCusto
    Left = 160
    Top = 328
  end
  object CdsCentroCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 328
    Data = {
      B10000009619E0BD01000000180000000200030000000300000093000E434F44
      43454E54524F435553544F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00044E4F4D4501004900
      00000100055749445448020002001E0002000D44454641554C545F4F52444552
      02008200010000000200044C4349440400010009080000000003313436034449
      410000033133350344494600000331323703444953}
  end
  object sqlUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOC, NOME, UNECODIGO, UNETIPO'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '      ( IDPESSOA =:PIDPESSOA)'
      '  AND ( UNETIPO  = '#39'A'#39' )'
      'ORDER BY'
      '   UNECODIGO, UNETIPO')
    ClientDataSet = cdsUnidNegoc
    Left = 160
    Top = 208
  end
  object cdsUnidNegoc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 208
    Data = {
      FC0000009619E0BD010000001800000004000200000003000000BE0009554E49
      444E45474F430800040000000000044E4F4D4501004900000001000557494454
      4802000200190009554E45434F4449474F010049000000010005574944544802
      0002000A0007554E455449504F01004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200010002000D44454641
      554C545F4F52444552020082000200000003000400044C434944040001000908
      00000000000000000000F0BF104174697669646164652050616472E36F013001
      4100000000000000001440104154495649444144452050414452C34F01310141}
  end
  object sqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       ( IDPESSOA        =:PIDPESSOA )'
      '   AND ( ANALITICOSINTET = '#39'A'#39' )'
      'ORDER BY'
      '   NOME')
    ClientDataSet = CdsCentroRespon
    Left = 160
    Top = 248
  end
  object CdsCentroRespon: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 248
    Data = {
      BD0200009619E0BD010000001800000002001600000003000000AC000F434F44
      43454E54524F524553504F4E0100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00044E4F4D45010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002001E0002000D44454641554C545F4F5244455202008200010000
      000200044C43494404000100090800000000033134330C20494E464F524DC154
      494341000003313133134153534553534F524941204A5552494449434100000A
      393939393939393939391A432E20526573706F6E736162696C69646164652050
      616472E36F0000033132351643454E5452414C204445204154454E44494D454E
      544F00000331313212434F4D554E494341C7C34F20534F4349414C0000013113
      44495245544F52494120455845435554495641000003313434084641524DC143
      49410000033134350E474552CA4E434941202D204449410000033133340E4745
      52CA4E434941202D204449460000033131340E474552CA4E434941202D204449
      500000033132360E474552CA4E434941202D20444953000001390650414452C3
      4F000003313431145345C7C34F2041444D494E49535452415449564100000331
      3333195345C7C34F20434F4E54524F4C4520444520494E564553542E00000331
      3233105345C7C34F20444520415455C1524941000003313231135345C7C34F20
      44452042454E4546CD43494F53000003313232115345C7C34F20444520434144
      415354524F000003313332175345C7C34F20444520434F4E5441422E2045204F
      52C72E000003313331135345C7C34F204445205445534F555241524941000003
      313432115345C7C34F20494D4F42494C49C15249410000033131311053454352
      45544152494120474552414C0000033132340E5345525649C74F20534F434941
      4C}
  end
  object CdsPatroPrev: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 288
    Data = {
      B40000009619E0BD010000001800000002000300000003000000690008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C0002000D44454641554C545F4F5244455202008200010000000200
      044C4349440400010009080000000000000000E06DE8401242524153494C2054
      454C45434F4D20532F41000000000000806DE8400C43454C554C415220435254
      200000000000000000F03F0C46554E444143414F20435254}
  end
  object sqlPatroPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PT.IDPESSOA, P.NOME'
      'FROM'
      '   PESSOA P,'
      '   PATRO  PT'
      ''
      'WHERE'
      '   ( P.IDPESSOA = PT.IDPESSOA )'
      ''
      'ORDER BY'
      '   P.NOME')
    ClientDataSet = CdsPatroPrev
    Left = 456
    Top = 288
  end
  object sqlPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   NVL(ATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   NOME')
    ClientDataSet = CdsPlanoPrev
    Left = 456
    Top = 248
  end
  object CdsPlanoPrev: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 248
    Data = {
      200100009619E0BD0100000018000000020006000000030000006C000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      44544802000200320002000D44454641554C545F4F5244455202008200010000
      000200044C43494404000100090800000000000000000000004012504C414E4F
      20415353495354454E4349414C000000000000008040400D504C414E4F204272
      5450524556000000000000000010400D504C414E4F2042525450524556000000
      000000000030401F504C414E4F2044452042454E4546CD43494F5320414C5445
      524E415449564F000000000000000008401C504C414E4F2044452042454E4546
      CD43494F532046554E4441444F520000000000000000F03F0B504C414E4F20DA
      4E49434F}
  end
  object sqlTipoRD: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '            ( IDPESSOA = :PIDPESSOA )'
      '   AND ( RECPAG     = '#39'P'#39' )'
      '   AND ( ANASINT    = '#39'A'#39' )'
      '   AND ( ATIVO         = '#39'S'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ClientDataSet = CdsTipoRD
    Left = 160
    Top = 288
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 288
  end
  object sqlCds: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPORATEIO, IDMODULO, GRRDESCRICAO'
      'FROM'
      '   GRUPORATEIO'
      'ORDER BY'
      '   GRRDESCRICAO')
    ClientDataSet = Cds
    Left = 376
    Top = 64
  end
  object sqlCdsDet: TCMSqlParams
    SQL.Strings = (
      '   SELECT                                             '
      '     PDR.IDPADRRATEIODOC, '
      '     PDR.IDGRUPORATEIO,                                      '
      '     PDR.IDPROGRAMA, PGR.DESCPROGRAMA,'
      '     PDR.IDEMPRESAPROP,                                      '
      '     PDR.RECPAG,                                             '
      '     PDR.CODTIPRECDES, TRD.DESCRICAO AS TIPODESEMBOLSO       ,'
      '     PDR.CODCENTROCUSTO, CCU.NOME AS CENTROCUSTO             ,'
      '     PDR.CODCENTRORESPON, CRE.NOME AS CENTRORESPON           ,'
      '     PDR.UNIDNEGOC, UND.NOME AS UNIDNEGOCIO                  ,'
      '     PDR.IDPATRO, PTR.NOME AS PATRO                          ,'
      '     PDR.IDPLANOPREV, PLP.NOME AS PLANPREV                   ,'
      '     PDR.PERCENTRATEIo'
      '   FROM                                                      '
      '     PESSOA            PTR,                                  '
      '     PADRAORATEIODOC   PDR,                                  '
      '     TIPORECEBDESEMB   TRD,                                  '
      '     CENTCUST          CCU,                                  '
      '     CENTRESPON        CRE,                                  '
      '     PLANPREV          PLP,                                  '
      '     UNIDNEGOCIO       UND,                                  '
      '     PROGRAMA          PGR                                   '
      '   WHERE                                                     '
      '         PDR.IDEMPRESAPROP   = 1'
      '     AND PDR.IDPATRO         = PTR.IDPESSOA                  '
      '     AND PDR.RECPAG          = '#39'P'#39
      '     AND PDR.IDEMPRESAPROP   = TRD.IDPESSOA'
      '     AND PDR.CODTIPRECDES    = TRD.CODTIPRECDES'
      '     AND PDR.IDEMPRESAPROP   = CCU.IDEMPRESA'
      '     AND PDR.CODCENTROCUSTO  = CCU.CODCENTROCUSTO'
      '     AND PDR.IDEMPRESAPROP   = CRE.IDPESSOA'
      '     AND PDR.CODCENTRORESPON = CRE.CODCENTRORESPON'
      '     AND PDR.UNIDNEGOC       = UND.UNIDNEGOC'
      '     AND PDR.IDPLANOPREV     = PLP.IDPLANOPREV'
      '     AND PDR.IDPROGRAMA      = PGR.IDPROGRAMA ')
    ClientDataSet = CdsDet
    Left = 568
    Top = 64
  end
end
