inherited frmExecEnvioLoteSeguro: TfrmExecEnvioLoteSeguro
  Left = 69
  Top = 177
  HelpContext = 150107
  Caption = 'Envio de Concessões e Devoluções em Lote'
  ClientHeight = 422
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 389
    inherited pgcControle: TPageControl
      Width = 710
      Height = 356
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
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 345
          Height = 177
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 153
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
          Top = 272
          Width = 329
          Height = 57
          Caption = ' Período de Datas (p/ busca) '
          TabOrder = 5
          object Label5: TLabel
            Left = 32
            Top = 26
            Width = 27
            Height = 13
            Caption = 'de:  '
          end
          object Label6: TLabel
            Left = 174
            Top = 26
            Width = 27
            Height = 13
            Caption = 'até: '
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 56
            Top = 22
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
            Top = 22
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
      end
      object TabSheet3: TTabSheet [1]
        Caption = 'TabSheet3'
        ImageIndex = 2
        TabVisible = False
        object GroupBox1: TGroupBox
          Left = 168
          Top = 72
          Width = 361
          Height = 169
          Caption = ' Dados do Documento '
          TabOrder = 0
          object Label3: TLabel
            Left = 16
            Top = 26
            Width = 222
            Height = 13
            Caption = 'Conta de Caixa X Forma de Pagamento'
          end
          object Label4: TLabel
            Left = 224
            Top = 122
            Width = 99
            Height = 13
            Caption = 'Data Programada'
          end
          object Label15: TLabel
            Left = 16
            Top = 74
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 16
            Top = 40
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
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
            ShowMatchText = True
          end
          object edtDataVencto: TwwDBDateTimePicker
            Left = 224
            Top = 136
            Width = 121
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
          object DBcboTipoDoc: TwwDBLookupCombo
            Left = 16
            Top = 88
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
            LookupTable = dtmLookEmptmo.qryLookTipoDocPag
            LookupField = 'CODTIPDOC'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Envio de Concessões e Devoluções em Lote [ Contratos ]'
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 295
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
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
          TabOrder = 0
        end
      end
    end
    inherited Panel1: TPanel
      Width = 710
      inherited fcLabel1: TfcLabel
        Width = 378
        Caption = 'Envio de Seguros em Lote [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 710
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 979
    Top = 65531
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
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
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO')
    ValidateWithMask = True
    Left = 528
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
    Left = 600
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
  object qryUpdateDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   CODDOCUMENTOPROC =:PCODDOCUMENTO'
      'WHERE'
      '   IDHISTMOVEMPTMO  =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
end
