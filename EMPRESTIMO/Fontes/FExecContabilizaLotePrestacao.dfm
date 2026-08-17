inherited frmExecContabilizaLotePrestacao: TfrmExecContabilizaLotePrestacao
  Left = 100
  Top = 149
  HelpContext = 150044
  Caption = 'Contabilização de Prestações por Lote'
  ClientHeight = 442
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 409
    inherited pgcControle: TPageControl
      Width = 710
      Height = 376
      inherited TabSheet1: TTabSheet
        Caption = 'Contabilização de Amortizações por Lote [ seleção ]'
        object Label1: TLabel
          Left = 16
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 72
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
          Top = 72
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
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 609
          Height = 41
          inherited edtNome: TEdit
            Width = 369
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 104
          Width = 345
          Height = 233
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 201
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
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 104
          Width = 345
          Height = 153
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 129
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
        object Panel4: TPanel
          Left = 360
          Top = 328
          Width = 329
          Height = 89
          Color = clBtnShadow
          Enabled = False
          TabOrder = 5
          Visible = False
          object Label15: TLabel
            Left = 56
            Top = 13
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label6: TLabel
            Left = 54
            Top = 59
            Width = 127
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Lançamento: '
          end
          object cboMesOld: TComboBox
            Left = 56
            Top = 27
            Width = 161
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 216
            Top = 27
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object edtDataOld: TwwDBDateTimePicker
            Left = 184
            Top = 55
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
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object chkExibeContratos: TCheckBox
          Left = 32
          Top = 336
          Width = 313
          Height = 17
          Caption = 'Não exibir Contratos'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object gbxPeriodo: TGroupBox
          Left = 360
          Top = 260
          Width = 329
          Height = 61
          Caption = ' Período de Datas (Previstas) '
          TabOrder = 7
          object Label5: TLabel
            Left = 32
            Top = 28
            Width = 27
            Height = 13
            Caption = 'de:  '
          end
          object Label3: TLabel
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
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Contabilização de Amortizações por Lote [ Contratos ]'
        object lblTotContrato: TLabel
          Left = 32
          Top = 347
          Width = 98
          Height = 13
          Caption = '10.000 Contratos'
          Visible = False
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 672
          Height = 311
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'13'#9'Contrato'#9'F'
            'NOME'#9'44'#9'Mutuário'#9'F'
            'DESC_EVENTO'#9'20'#9'Evento'#9'F'
            'HMEDATAPREVISTA'#9'12'#9'Data'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsContratosAContabilizar
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
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos a Contabilizar'
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
        Caption = 'Contabilização de Amortizações por Lote [ resultado ]'
        ImageIndex = 2
        TabVisible = False
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 319
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
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
      Width = 710
      inherited fcLabel1: TfcLabel
        Width = 500
        Caption = 'Contabilização de Prestações por Lote [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 710
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150041
      end
    end
  end
  object qryContratosAContabilizar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CON.IDCONTRATOEMPTMO,'
      '   HME.DESC_EVENTO,'
      '   CON.NOME,'
      '   HME.HMEVLRPREVISTO,'
      '   HME.HMEDATAPREVISTA'
      ''
      'FROM'
      '   VW_MOVEP     HME,'
      '   VWCONTRATOEP CON'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND HME.EVENTO                = 2'
      ''
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      ''
      
        '   AND ( (:PIDCONTRATOEMPTMO     IS NULL) OR (CON.IDCONTRATOEMPT' +
        'MO   =:PIDCONTRATOEMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO         IS NULL) OR (CON.IDTIPOEMPTMO  ' +
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
      ''
      'ORDER BY'
      '   HMEDATAPREVISTA, IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 144
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
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
    object qryContratosAContabilizarIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosAContabilizarDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      Size = 18
    end
    object qryContratosAContabilizarNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratosAContabilizarHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryContratosAContabilizarHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
  end
  object dtsContratosAContabilizar: TwwDataSource
    DataSet = qryContratosAContabilizar
    Left = 144
    Top = 224
  end
end
