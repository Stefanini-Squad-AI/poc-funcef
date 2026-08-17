inherited cfgRelCartaCobrEP: TcfgRelCartaCobrEP
  Left = 136
  Top = 155
  HelpContext = 150081
  Caption = 'Emissão de Carta de Cobranca'
  ClientHeight = 519
  ClientWidth = 634
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 16
    Top = 18
    Width = 170
    Height = 13
    Caption = 'Modelo da Carta de Cobrança'
  end
  inherited pnlFundo: TPanel
    Width = 634
    Height = 486
    object pgcControle: TPageControl
      Left = 0
      Top = 0
      Width = 634
      Height = 486
      ActivePage = tbsSelecao
      Align = alClient
      TabHeight = 17
      TabOrder = 0
      object tbsSelecao: TTabSheet
        Caption = 'Seleção / Emissão'
        object Label1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label3: TLabel
          Left = 320
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label4: TLabel
          Left = 16
          Top = 238
          Width = 109
          Height = 13
          Caption = 'Situação do Titular'
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 609
          TabStop = True
          inherited edtNome: TEdit
            Width = 369
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 320
          Top = 64
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Height = 149
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 312
          Top = 88
          Height = 127
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Height = 105
          end
        end
        object Panel1: TPanel
          Left = 320
          Top = 216
          Width = 289
          Height = 57
          TabOrder = 5
          object Label5: TLabel
            Left = 16
            Top = 10
            Width = 112
            Height = 13
            Caption = 'Data de Referência'
          end
          object edtDataRef: TwwDBDateTimePicker
            Left = 16
            Top = 24
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object chkFolha: TCheckBox
            Left = 144
            Top = 8
            Width = 137
            Height = 17
            Caption = 'Folha(s)'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkFinanceiro: TCheckBox
            Left = 144
            Top = 31
            Width = 137
            Height = 17
            Caption = 'Financeiro'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object DBcboSitPart: TwwDBLookupCombo
          Left = 16
          Top = 252
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookSitPart
          LookupField = 'IDSITPART'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 280
          Width = 593
          Height = 65
          Caption = ' Carta '
          TabOrder = 7
          object Label6: TLabel
            Left = 472
            Top = 18
            Width = 80
            Height = 13
            Caption = 'Data da Carta'
          end
          object Label7: TLabel
            Left = 16
            Top = 18
            Width = 170
            Height = 13
            Caption = 'Modelo da Carta de Cobrança'
          end
          object DBcboModeloCarta: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 377
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MODELOCARTA'#9'60'#9'MODELOCARTA')
            LookupTable = qryTemplate
            LookupField = 'IDCARTACOBRANCA'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object memReports: TMemo
            Left = 248
            Top = 32
            Width = 113
            Height = 21
            TabStop = False
            Color = clAqua
            Lines.Strings = (
              'memReports')
            TabOrder = 1
            Visible = False
            WordWrap = False
          end
          object edtDataCarta: TwwDBDateTimePicker
            Left = 472
            Top = 32
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 352
          Width = 593
          Height = 89
          Caption = ' Atendimento '
          TabOrder = 8
          object Label8: TLabel
            Left = 16
            Top = 18
            Width = 118
            Height = 13
            Caption = 'Tipo de Atendimento'
          end
          object Label9: TLabel
            Left = 304
            Top = 18
            Width = 138
            Height = 13
            Caption = 'Assunto do Atendimento'
          end
          object DBcboTipoAtend: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            LookupTable = qryTipoAtend
            LookupField = 'IDTIPOATEND'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object chkAtendimento: TCheckBox
            Left = 24
            Top = 64
            Width = 369
            Height = 17
            Caption = 'Criar atendimento PENDENTE para cada carta impressa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object DBcboAssunto: TwwDBLookupCombo
            Left = 304
            Top = 32
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            LookupTable = qryAssunto
            LookupField = 'IDASSUNTO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object chkParcelasAberto: TCheckBox
          Left = 320
          Top = 467
          Width = 289
          Height = 18
          Caption = 'Exibir apenas Contratos com Itens em aberto'
          Checked = True
          Color = clGray
          ParentColor = False
          State = cbChecked
          TabOrder = 9
          Visible = False
        end
        object chkSaldoDevedor: TCheckBox
          Left = 320
          Top = 488
          Width = 289
          Height = 17
          Caption = 'Exibir apenas Contratos COM saldo devedor'
          Color = clGray
          ParentColor = False
          TabOrder = 10
          Visible = False
        end
        object chkSaldoZERO: TCheckBox
          Left = 320
          Top = 508
          Width = 289
          Height = 17
          Caption = 'Exibir apenas Contratos SEM saldo devedor'
          Color = clGray
          ParentColor = False
          TabOrder = 11
          Visible = False
        end
        object chkParcMes: TCheckBox
          Left = 320
          Top = 532
          Width = 273
          Height = 16
          Caption = 'Somente parcelas do mês de referência'
          Color = clGray
          ParentColor = False
          TabOrder = 12
          Visible = False
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 593
          Height = 231
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Atendimentos Registrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object memErro: TMemo
          Left = 16
          Top = 306
          Width = 593
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object Panel2: TPanel
          Left = 16
          Top = 280
          Width = 593
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Atendimentos NÃO Registrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 486
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 382
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object pplConsulta: TppBDEPipeline
    DataSource = dsDados
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplConsulta'
    Left = 48
    Top = 136
  end
  object rptImprime: TppReport
    AutoStop = False
    DataPipeline = pplConsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rptImprime'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 48
    Top = 120
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplConsulta'
    object RpImprimeHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RpImprimeFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dsDados: TwwDataSource
    DataSet = qryDados
    Left = 112
    Top = 136
  end
  object ds: TwwDataSource
    DataSet = qryTemplate
    Left = 176
    Top = 136
  end
  object qryTemplate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA,'
      '   MODELOCARTA,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   FLGTIPOCARTA = '#39'E'#39
      'ORDER BY'
      '   MODELOCARTA')
    ValidateWithMask = True
    Left = 176
    Top = 120
    object qryTemplateIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryTemplateMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryTemplateIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryTemplateORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryTemplateFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 248
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
  object qryAssunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDASSUNTO,'
      '   IDTIPOPROCESSO,'
      '   IDGRUPOASSUNTO,'
      '   IDCONFIGRUBS,'
      '   NOME,'
      '   IDPLANOPREV'
      'FROM'
      '   ASSUNTO'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 520
    Top = 376
    object qryAssuntoNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.ASSUNTO.NOME'
      Size = 60
    end
    object qryAssuntoIDASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTO'
      Origin = 'BASEDADOS.ASSUNTO.IDASSUNTO'
      Visible = False
    end
    object qryAssuntoIDTIPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'BASEDADOS.ASSUNTO.IDTIPOPROCESSO'
      Visible = False
    end
    object qryAssuntoIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Origin = 'BASEDADOS.ASSUNTO.IDGRUPOASSUNTO'
      Visible = False
    end
    object qryAssuntoIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.ASSUNTO.IDCONFIGRUBS'
      Visible = False
    end
    object qryAssuntoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.ASSUNTO.IDPLANOPREV'
      Visible = False
    end
  end
  object qryDados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF,'
      '   CON.IDPATRO,'
      '   PTI.NOME AS NOME_TITULAR,'
      '   PBF.NOME AS NOME_BENEF,'
      
        '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'Pensionista' +
        #39') AS SIT_PART,'
      '   DEP.MATRICULA AS MATRICULA,'
      '   ELP.MATRICULA AS MATRICULA_TIT,'
      '   PPP.INSCRICAONUMERO,'
      ''
      '   TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39') AS DATA_CARTA,'
      ''
      '   EDP.LOGRADOURO,'
      '   CID.NOME AS CIDADE,'
      '   EST.CODESTADO,'
      '   EDP.NUMERO,'
      '   EDP.COMPLEMENTO,'
      '   EDP.BAIRRO,'
      '   EDP.CEP,'
      ''
      
        '   SLD.HMEDATAATUALIZA, SLD.HMESALDODEV, SLD.HMEPARCELA, SLD.HME' +
        'NUMPARCELAS,'
      '   TCE.TCEDESCRICAO,'
      '   (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) AS DEVE,'
      
        '   (NVL(SLD.HMESALDODEV, 0) + (NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR' +
        '_PAG.VLR_PAG, 0))) AS TOTAL_DEV'
      'FROM'
      '   PESSOA          PBF,'
      '   PESSOA          PTI,'
      '   CONTRATOEMPTMO  CON,'
      '   DEPENTIT        DEP,'
      '   ELEGPATRO       ELP,'
      '   PARTPREVPLAN    PPP,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP,'
      '   PATRO           PTR,'
      '   PLANPREV        PLP,'
      '   SITPART         SIT,'
      '   ENDPESS         EDP,'
      '   CIDADES         CID,'
      '   ESTADO          EST,'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.' +
        'HMENUMPARCELAS'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             CON.FLGSITUACAO         <> '#39'C'#39
      '         AND CON.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      
        '         AND CON.IDPATRO              IN (42904, 1, 42908, 2113,' +
        ' 2002, 42906, 2003, 42902, 42905, 42907)'
      '         AND CON.IDPLANOPREV          IN (4, 6, 7)'
      '         AND ITC.ITCTRATASALDODEV    <> 0'
      
        '         AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORN' +
        'ADO = 0) )'
      '         AND ( HME.HMEDATAATUALIZA    <='
      '               ('
      '               SELECT'
      
        '                  DECODE(MAX(H.HMEDATAATUALIZA), NULL, TO_DATE(:' +
        'PDATA, '#39'DD/MM/YYYY'#39'),'
      
        '                                                       MAX(H.HME' +
        'DATAATUALIZA))'
      '               FROM'
      '                  HISTMOVEMPTMO   H,'
      '                  CONTRATOEMPTMO  C,'
      '                  ITEMXTIPOCONTR  IT'
      '               WHERE'
      
        '                      C.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPT' +
        'MO'
      
        '                  AND H.HMEDATAATUALIZA    <= TO_DATE(:PDATA, '#39'D' +
        'D/MM/YYYY'#39')'
      '                  AND IT.ITCTRATASALDODEV  <> 0'
      '                  AND HME.HMEANOCOMPETENCIA = 2003'
      '                  AND HME.HMEMESCOMPETENCIA = 05'
      
        '                  AND ( H.FLGESTORNADO      = 0 OR H.FLGESTORNAD' +
        'O IS NULL )'
      '                  AND H.IDCONTRATOEMPTMO    = C.IDCONTRATOEMPTMO'
      
        '                  AND C.IDTIPOCONTREMPTMO   = IT.IDTIPOCONTREMPT' +
        'MO'
      '                  AND H.IDITEMEMPTMO        = IT.IDITEMEMPTMO'
      '               )'
      '             )'
      
        '         AND ( (RTRIM(LTRIM(HME.HMEANOCOMPETENCIA))) || (RTRIM(L' +
        'TRIM(HME.HMEMESCOMPETENCIA))) ) <= 200305'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) MAX'
      '   WHERE'
      '          ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '   ) SLD,'
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'LR_DEV'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO       <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      '      AND HME.HMESEQCOBRANCA     = 1'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        ')'
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PAR_DEV,'
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      SUM(DECODE(FLGQUITADO, 1, NVL(HME.HMEVLRPREVISTO, 0),'
      
        '                                DECODE(FLGABONADO, 1, NVL(HME.HM' +
        'EVLRPREVISTO, 0),'
      
        '                                                      NVL(HME.HM' +
        'EVLREFETIVO, 0)))) AS VLR_PAG'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          CON.FLGSITUACAO       <> '#39'C'#39
      '      AND CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '      AND CON.IDPATRO            IN (42904, 1, 42908, 2113, 2002' +
        ', 42906, 2003, 42902, 42905, 42907)'
      '      AND CON.IDPLANOPREV        IN (4, 6, 7)'
      '      AND HME.HMETIPOMOV         IN (1, 2, 3, 4, 7)'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND HME.HMEDATAPREVISTA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        ')'
      '      AND ('
      
        '          (HME.HMEDATAEFETIVA    <= TO_DATE(:PDATA, '#39'DD/MM/YYYY'#39 +
        '))'
      
        '       OR ( (HME.FLGQUITADO = 1) AND (HME.HMEDATAQUITABONO <= TO' +
        '_DATE(:PDATA, '#39'DD/MM/YYYY'#39')) )'
      
        '       OR ( (HME.FLGABONADO = 1) AND (HME.HMEDATAQUITABONO <= TO' +
        '_DATE(:PDATA, '#39'DD/MM/YYYY'#39')) )'
      '          )'
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PAR_PAG'
      'WHERE'
      '       CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      
        '   AND ( (SLD.HMESALDODEV     > 0) OR ((NVL(PAR_DEV.VLR_DEV, 0) ' +
        '- NVL(PAR_PAG.VLR_PAG, 0)) > 0) )'
      '   AND CON.FLGSITUACAO       <> '#39'C'#39
      '   AND ((NVL(PAR_DEV.VLR_DEV, 0) - NVL(PAR_PAG.VLR_PAG, 0)) > 0)'
      '   AND CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO   = PAR_DEV.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO   = PAR_PAG.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDPESSOA           = PTI.IDPESSOA'
      '   AND CON.IDPESSOA           = ELP.IDPESSOA'
      '   AND CON.IDPATRO            = PTR.IDPESSOA'
      '   AND CON.IDBENEF            = PBF.IDPESSOA'
      '   AND CON.IDPESSOA           = PPP.IDPESSOA'
      '   AND CON.IDPATRO            = PPP.IDPESSJUR'
      '   AND CON.IDPLANOPREV        = PLP.IDPLANOPREV'
      '   AND ELP.IDPESSOA           = PPP.IDPESSOA'
      '   AND ELP.IDPESSJUR          = PPP.IDPESSJUR'
      '   AND PTR.IDPESSOA           = ELP.IDPESSJUR'
      '   AND CON.IDBENEF            = PBF.IDPESSOA'
      '   AND PTI.IDPESSOA           = ELP.IDPESSOA'
      '   AND PTI.IDPESSOA           = PPP.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      '   AND ELP.IDPESSOA           = DEP.IDTITULAR'
      '   AND CON.IDBENEF            = DEP.IDPESSOA'
      '   AND CON.IDPESSOA           = DEP.IDTITULAR'
      '   AND PPP.IDSITPART          = SIT.IDSITPART'
      '   AND CON.IDBENEF            = EDP.IDPESSOA(+)'
      '   AND EDP.IDCIDADES          = CID.IDCIDADES(+)'
      '   AND CID.IDESTADO           = EST.IDESTADO(+)'
      '   AND PPP.FLGDESATIVADO      = 0'
      ''
      'ORDER BY'
      '   PBF.NOME, CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
        Value = '28/02/2003'
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '325227'
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryDadosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDadosNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryDadosNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object qryDadosSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryDadosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryDadosMATRICULA_TIT: TStringField
      FieldName = 'MATRICULA_TIT'
      Size = 13
    end
    object qryDadosINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryDadosCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryDadosHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryDadosHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryDadosHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryDadosHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryDadosTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryDadosDEVE: TFloatField
      FieldName = 'DEVE'
    end
    object qryDadosTOTAL_DEV: TFloatField
      FieldName = 'TOTAL_DEV'
    end
    object qryDadosDATA_CARTA: TDateTimeField
      FieldName = 'DATA_CARTA'
    end
    object qryDadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDadosIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryDadosIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object qryTipoAtend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOATEND,'
      '   NOME'
      'FROM'
      '   TIPOATEND'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 240
    Top = 376
    object qryTipoAtendNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOATEND.NOME'
      Size = 60
    end
    object qryTipoAtendIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.TIPOATEND.IDTIPOATEND'
      Visible = False
    end
  end
  object qryGeraAtend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ATEND'
      '('
      'IDATEND,'
      'IDTIPOATEND,'
      'IDTITULAR,'
      'IDBENEFICIARIO,'
      'IDPESSJUR,'
      'DATA,'
      'DATAINICIO,'
      'CODATENDENTE,'
      'CODATEND,'
      'STATUS'
      ')'
      'VALUES'
      '('
      ':PIDATEND,'
      ':PIDTIPOATEND,'
      ':PIDTITULAR,'
      ':PIDBENEFICIARIO,'
      ':PIDPESSJUR,'
      ':PDATA,'
      ':PDATAINICIO,'
      ':PCODATENDENTE,'
      ':PCODATEND,'
      ':PSTATUS'
      ')')
    ValidateWithMask = True
    Left = 424
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDATEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOATEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODATENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODATEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSTATUS'
        ParamType = ptInput
      end>
  end
  object qryGeraAssuntoXAtend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ASSUNTOXATEND'
      '('
      'IDASSUNTOXATEND,'
      'IDASSUNTO,'
      'IDATEND'
      ')'
      'VALUES'
      '('
      ':PIDASSUNTOXATEND,'
      ':PIDASSUNTO,'
      ':PIDATEND'
      ')')
    ValidateWithMask = True
    Left = 424
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDASSUNTOXATEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDASSUNTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDATEND'
        ParamType = ptInput
      end>
  end
end
