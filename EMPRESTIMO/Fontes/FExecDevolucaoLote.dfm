inherited frmExecDevolucaoLote: TfrmExecDevolucaoLote
  Left = 85
  Top = 112
  HelpContext = 150015
  ClientHeight = 420
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 387
    inherited pgcControle: TPageControl
      Width = 710
      Height = 354
      inherited TabSheet1: TTabSheet
        Caption = 'Devolução de Valores em Lote - Financeiro [ Seleção ]'
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
        object Label4: TLabel
          Left = 360
          Top = 234
          Width = 181
          Height = 13
          Caption = 'Situação do Participante Titular'
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 104
          Width = 337
          Height = 129
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 105
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
          Height = 129
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 105
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
        object Panel2: TPanel
          Left = 360
          Top = 280
          Width = 329
          Height = 49
          TabOrder = 6
          object Label5: TLabel
            Left = 48
            Top = 20
            Width = 124
            Height = 13
            Caption = 'Data de Vencimento: '
          end
          object edtDataIni: TwwDBDateTimePicker
            Left = 176
            Top = 16
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
        object chkDiverg: TCheckBox
          Left = 16
          Top = 296
          Width = 321
          Height = 17
          Caption = 'Devolver apenas Itens SEM divergência'
          TabOrder = 5
        end
        object DBcboSitPart: TwwDBLookupCombo
          Left = 360
          Top = 248
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
          LookupTable = dtmLookEmptmo.qryLookSitPart
          LookupField = 'IDSITPART'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object gbFormaRecDif: TGroupBox
          Left = 16
          Top = 232
          Width = 329
          Height = 49
          Caption = ' Forma de Pagamento Diferenciada '
          TabOrder = 8
          object btnAtribuiParametro: TSpeedButton
            Left = 302
            Top = 17
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            OnClick = btnAtribuiParametroClick
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 7
            Top = 18
            Width = 294
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
            LookupField = 'CODPORTFORMA'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Devolução de Valores em Lote - Financeiro  [ Itens ]'
        object Label6: TLabel
          Left = 120
          Top = 284
          Width = 95
          Height = 13
          Caption = 'Itens a Devolver'
        end
        object Panel3: TPanel
          Left = 360
          Top = 280
          Width = 329
          Height = 49
          TabOrder = 0
          object Label3: TLabel
            Left = 32
            Top = 20
            Width = 158
            Height = 13
            Caption = 'Nova Data de Vencimento: '
          end
          object edtDataVenc: TwwDBDateTimePicker
            Left = 192
            Top = 16
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
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 672
          Height = 231
          Selected.Strings = (
            'FLGESCOLHA'#9'2'#9' '#9'F'
            'IDCONTRATOEMPTMO'#9'10'#9'Contrato'#9'F'
            'NOME'#9'35'#9'Mutuário'#9'F'
            'ITEDESCRICAO'#9'21'#9'Item'#9'F'
            'HMEPARCELA'#9'5'#9'Parcela'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor'#9'F'
            'HMEDATAVENCTO'#9'12'#9'Data Vencto'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsHistMovVirtual
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens a Devolver'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object chkTodos: TCheckBox
            Left = 11
            Top = 5
            Width = 206
            Height = 17
            Caption = 'Processar TODOS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object edtQuantidade: TEdit
          Left = 48
          Top = 280
          Width = 65
          Height = 21
          TabOrder = 3
        end
      end
    end
    inherited Panel1: TPanel
      Width = 710
      inherited fcLabel1: TfcLabel
        Width = 545
        Caption = 'Devolução de Valores em Lote - Financeiro [ Seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 710
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 3
  end
  object qryUpdatePag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      ''
      'SET'
      '   HME.HMERECPAG = '#39'P'#39
      ''
      'WHERE'
      
        '       ( HME.HMETIPOMOV      IN (1, 2, 3, 4) AND HME.HMEVLRPREVI' +
        'STO < 0 )'
      '   AND ( HME.FLGENVIO         = 0 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      
        '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO          =' +
        ' 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR HME.IDCONTRATOEMPTMO  =' +
        ':PIDCONTRATOEMPTMO )'
      
        '   AND ( HME.FLGESTORNADO     IS NULL OR HME.FLGESTORNADO      =' +
        ' 0 )'
      
        '   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO        =' +
        ' 0 )'
      
        '   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO        =' +
        ' 0 )')
    ValidateWithMask = True
    Left = 392
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      ''
      'SET'
      '   HME.HMERECPAG = '#39'R'#39
      ''
      'WHERE'
      
        '       ( HME.HMETIPOMOV       IN (1, 2, 3, 4) AND HME.HMEVLRPREV' +
        'ISTO >= 0 )'
      '   AND ( HME.FLGENVIO         = 0 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      
        '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO          =' +
        ' 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR HME.IDCONTRATOEMPTMO  =' +
        ':PIDCONTRATOEMPTMO )'
      
        '   AND ( HME.FLGESTORNADO     IS NULL OR HME.FLGESTORNADO      =' +
        ' 0 )'
      
        '   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO        =' +
        ' 0 )'
      
        '   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO        =' +
        ' 0 )')
    ValidateWithMask = True
    Left = 392
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA,'
      '  IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO and'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      '  (FLGESCOLHA, IDHISTMOVEMPTMO, IDCONTRATOEMPTMO)'
      'values'
      '  (:FLGESCOLHA, :IDHISTMOVEMPTMO, :IDCONTRATOEMPTMO)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO and'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 488
    Top = 192
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   0 AS FLGESCOLHA,'
      ''
      '   CON.NOME,'
      ''
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO,'
      '   HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA,'
      '   NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,'
      '   HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO,'
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV,'
      ''
      '   (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39'))))'
      '   || '#39'/'#39' ||'
      
        '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) AS ANO' +
        'MESCOMPETENCIA,'
      ''
      '   ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV,'
      '   CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA,'
      
        '   CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCB' +
        'ANCARIA,'
      '   CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   VWCONTRATOEP    CON,'
      '   ITEMXTIPOCONTR  ITC,'
      '   ITEMEMPTMO      IRC'
      ''
      'WHERE'
      '       ( HME.HMERECPAG          = '#39'P'#39' )'
      '   AND ( HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) )'
      '   AND ( HME.FLGENVIO           = 0 )'
      '   AND ( HME.FLGBAIXADO         = 0 )'
      '   AND ( HME.HMEVLREFETIVO      IS NULL )'
      '   AND ( HME.HMEDATAEFETIVA     IS NULL )'
      '   AND ( HME.CODDOCUMENTO       IS NULL )'
      ''
      
        '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = ' +
        '1 )'
      
        '   AND ( HME.FLGESTORNADO       IS NULL OR HME.FLGESTORNADO   = ' +
        '0 )'
      
        '   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO     = ' +
        '0 )'
      
        '   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO     = ' +
        '0 )'
      ''
      '   AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      ''
      '   AND ( CON.IDEMPRESAPROP      =  0  )'
      '   AND ( CON.IDCONTRATOEMPTMO   =  -1  )'
      
        '   AND ( HME.FLGDIVERGPEND      IS NULL OR HME.FLGDIVERGPEND  = ' +
        '0 )'
      ''
      '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  )'
      '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO       = IRC.IDITEMEMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      
        '   HME.HMEDATAVENCTO, CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.' +
        'IDITEMEMPTMO')
    UpdateObject = updHistMovVirtual
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 488
    Top = 180
    object qryHistMovVirtualFLGESCOLHA: TFloatField
      FieldName = 'FLGESCOLHA'
    end
    object qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovVirtualHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovVirtualIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#.00;(#,#.00)'
      EditFormat = '#,#.00;(#,#.00)'
    end
    object qryHistMovVirtualHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovVirtualHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovVirtualHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovVirtualANOMESCOMPETENCIA: TStringField
      FieldName = 'ANOMESCOMPETENCIA'
      Size = 9
    end
    object qryHistMovVirtualCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryHistMovVirtualITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
    object qryHistMovVirtualIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryHistMovVirtualIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryHistMovVirtualIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryHistMovVirtualIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryHistMovVirtualCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryHistMovVirtualPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryHistMovVirtualPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryHistMovVirtualIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryHistMovVirtualIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovVirtualFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryHistMovVirtualNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dtsHistMovVirtual: TwwDataSource
    DataSet = qryHistMovVirtual
    Left = 488
    Top = 168
  end
  object qryUpdateDevolucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGENVIO             = 0,'
      '   HMEFORMACOBRANCA     = '#39'C'#39','
      '   IDTMPDESC            = NULL,'
      '   HMETIPOFOLHA         = NULL,'
      '   FLGSUSPENSAO         = NULL,'
      '   HMEANOSUSPENSAO      = NULL,'
      '   HMEMESSUSPENSAO      = NULL,'
      '   HMEDATAVENCTO        =:PHMEDATAVENCTO,'
      '   HMEANOCOBRANCA       =:PHMEANOCOBRANCA,'
      '   HMEMESCOBRANCA       =:PHMEMESCOBRANCA,'
      '   FLGDIVERGPEND        = 0,'
      '   FLGDIVERGTRAT        = 1'
      'WHERE'
      '       IDHISTMOVEMPTMO  =:PIDHISTMOVEMPTMO'
      '   AND IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 268
    Top = 199
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
