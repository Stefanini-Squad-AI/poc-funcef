inherited frmExecEnvioLoteConcessao: TfrmExecEnvioLoteConcessao
  Left = 197
  Top = 83
  HelpContext = 150011
  Caption = 'Envio de Concessões e Devoluções em Lote'
  ClientHeight = 444
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 411
    inherited pgcControle: TPageControl
      Width = 744
      Height = 378
      inherited TabSheet1: TTabSheet
        Caption = 'Envio de Concessões e Devoluções em Lote [ seleção ]'
        object Label1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label3: TLabel
          Left = 16
          Top = 238
          Width = 222
          Height = 13
          Caption = 'Conta de Caixa X Forma de Pagamento'
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 345
          Height = 145
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 360
          Top = 268
          Width = 329
          Height = 61
          Caption = ' Período de Datas (de Crédito) '
          TabOrder = 7
          object Label5: TLabel
            Left = 32
            Top = 28
            Width = 27
            Height = 13
            Caption = 'de:  '
          end
          object Label6: TLabel
            Left = 174
            Top = 28
            Width = 27
            Height = 13
            Caption = 'até: '
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 56
            Top = 24
            Width = 97
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
          object edtDataFim: TwwDBDateTimePicker
            Left = 200
            Top = 24
            Width = 97
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
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 329
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
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
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
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 609
          Height = 41
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 88
          Width = 345
          Height = 177
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 153
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object DBcboPortadorForma: TwwDBLookupCombo
          Left = 16
          Top = 252
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
          LookupField = 'CODPORTFORMA'
          ParentFont = False
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = DBcboPortadorFormaExit
        end
        object rdgEnvio: TRadioGroup
          Left = 16
          Top = 280
          Width = 329
          Height = 49
          Caption = ' Enviar: '
          Columns = 2
          ItemIndex = 2
          Items.Strings = (
            'Apenas Concessões'
            'Apenas Devoluções'
            'Ambos')
          TabOrder = 6
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Envio de Concessões e Devoluções em Lote [ Contratos ]'
        object lblTotContrato: TLabel
          Left = 24
          Top = 340
          Width = 98
          Height = 13
          Caption = '10.000 Contratos'
          Visible = False
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 15
          Top = 34
          Width = 674
          Height = 303
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'16'#9'Contrato'#9'F'
            'MATRICULA'#9'12'#9'Matrícula'#9'F'
            'NOME'#9'31'#9'Mutuário'#9'F'
            'DESC_EVENTO'#9'17'#9'Evento'#9'F'
            'HMEDATAPREVISTA'#9'10'#9'Data'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor'#9'F'
            'DESCRICAO'#9'40'#9'Conta de Caixa X Forma de Pagamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsContratosAEnviar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovTopRowChanged
        end
        object Panel3: TPanel
          Left = 15
          Top = 8
          Width = 674
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Concessões e Devoluções a Enviar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Envio de Concessões e Devoluções em Lote [ resultado ]'
        ImageIndex = 2
        TabVisible = False
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 303
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    inherited Panel1: TPanel
      Width = 744
      inherited fcLabel1: TfcLabel
        Width = 563
        Caption = 'Envio de Concessões e Devoluções em Lote [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 744
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65531
  end
  object qryContratosAEnviar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ''
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      
        '   CON.IDPESSOA, CON.IDBENEF, CON.IDPLANOPREV, CON.IDPLANOORIGEM' +
        ','
      '   HME.HMETIPOMOV,'
      ''
      '   DECODE(HME.HMETIPOMOV,'
      '          0, '#39'Concessão/Renovação'#39','
      '          1, '#39'Prestação '#39','
      '          2, '#39'Amortização/Refinanciamento'#39','
      '          3, '#39'Quitação'#39','
      '          4, '#39'Atualização de Débito'#39','
      '          5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '          6, '#39'Importação/Migração'#39','
      '          7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '          8, '#39'Ajustes (Saldo Devedor)'#39
      '         ) AS DESC_EVENTO,'
      ''
      '   PES.NOME,'
      '   HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAPREVISTA,'
      '   PFO.DESCRICAO'
      'FROM'
      '   PESSOA          PES,'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   DEPENTIT        DEP,'
      '   PORTADORFORMA   PFO,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND HME.HMETIPOMOV            IN (0, 1, 3, 6, 7)'
      ''
      '   AND HME.FLGENVIO              = 0'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.CODDOCUMENTO          IS NULL'
      ''
      '   AND HME.HMEFORMACOBRANCA      = '#39'C'#39
      '   AND HME.HMERECPAG             = '#39'P'#39
      ''
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      ''
      
        '   AND ( (:PIDCONTRATOEMPTMO     IS NULL) OR (CON.IDCONTRATOEMPT' +
        'MO   =:PIDCONTRATOEMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO         IS NULL) OR (TCE.IDTIPOEMPTMO  ' +
        '     =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO    IS NULL) OR (CON.IDTIPOCONTREMP' +
        'TMO  =:PIDTIPOCONTREMPTMO) )'
      ''
      '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1 )'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDBENEF               = PES.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      '   AND CON.PORTFORMAPAG          = PFO.CODPORTFORMA'
      ''
      'ORDER BY'
      '   HME.HMEDATAPREVISTA, CON.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = 2
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
        Value = 37802d
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
        Value = 37802d
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryContratosAEnviarIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosAEnviarNOME: TStringField
      DisplayLabel = 'Mutuário'
      DisplayWidth = 37
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratosAEnviarDESC_EVENTO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 13
      FieldName = 'DESC_EVENTO'
      Size = 18
    end
    object qryContratosAEnviarHMEDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryContratosAEnviarHMEVLRPREVISTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00'
    end
    object qryContratosAEnviarDESCRICAO: TStringField
      DisplayLabel = 'Conta de Caixa X Forma de Pagamento'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryContratosAEnviarIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosAEnviarIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosAEnviarIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosAEnviarIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryContratosAEnviarHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryContratosAEnviarMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
  end
  object dtsContratosAEnviar: TwwDataSource
    DataSet = qryContratosAEnviar
    Left = 192
    Top = 112
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CON.PORTFORMAPAG, PFO.DESCRICAO'
      ''
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP,'
      '   PORTADORFORMA   PFO'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.DATACREDITO           =:PDATACREDITO'
      ''
      
        '   AND ( (:PIDCONTRATOEMPTMO     IS NULL) OR (CON.IDCONTRATOEMPT' +
        'MO   =:PIDCONTRATOEMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO         IS NULL) OR (TCE.IDTIPOEMPTMO  ' +
        '     =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO    IS NULL) OR (CON.IDTIPOCONTREMP' +
        'TMO  =:PIDTIPOCONTREMPTMO) )'
      ''
      '   AND CON.PORTFORMAPAG          = PFO.CODPORTFORMA'
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      ''
      '   AND EXISTS( SELECT *'
      '               FROM   HISTMOVEMPTMO'
      '               WHERE  HMETIPOMOV           = 0'
      '               AND    HMEPARCELA           = 0'
      '               AND    FLGENVIO             = 0'
      '               AND    FLGBAIXADO           = 0'
      '               AND    HMEFORMACOBRANCA     = '#39'C'#39
      '               AND    HMERECPAG            = '#39'P'#39
      '               AND    HMEVLREFETIVO        IS NULL'
      '               AND    HMEDATAEFETIVA       IS NULL'
      '               AND    CODDOCUMENTO         IS NULL'
      '               AND    HMEDATAPREVISTA      = CON.DATACREDITO'
      
        '               AND    (HMECENTRALIZA       = 1 OR HMEDESTACADO =' +
        ' 1)'
      '               AND    NVL(FLGESTORNADO, 0) = 0'
      '               AND    NVL(FLGQUITADO, 0)   = 0'
      '               AND    NVL(FLGABONADO, 0)   = 0'
      
        '               AND    IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTM' +
        'O )')
    ValidateWithMask = True
    Left = 312
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryPortFormaPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.PORTFORMAPAG'
    end
    object qryPortFormaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
  end
  object qryTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO'
      ''
      'FROM'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.DATACREDITO           =:PDATACREDITO'
      ''
      
        '   AND ( (:PIDCONTRATOEMPTMO     IS NULL) OR (CON.IDCONTRATOEMPT' +
        'MO   =:PIDCONTRATOEMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO         IS NULL) OR (TCE.IDTIPOEMPTMO  ' +
        '     =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO    IS NULL) OR (CON.IDTIPOCONTREMP' +
        'TMO  =:PIDTIPOCONTREMPTMO) )'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 448
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATACREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTipoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
end
