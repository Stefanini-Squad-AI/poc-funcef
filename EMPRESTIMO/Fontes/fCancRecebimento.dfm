inherited frmCancRecebimento: TfrmCancRecebimento
  Left = 85
  Top = 153
  HelpContext = 150017
  Caption = 'Desfazer Recebimento'
  ClientHeight = 448
  ClientWidth = 738
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 415
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 326
      Height = 24
      Caption = 'Desfazer Recebimento [seleção]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 37
      Width = 738
      Height = 378
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 376
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label7: TLabel
          Left = 16
          Top = 345
          Width = 111
          Height = 13
          Caption = 'Cód. Documento:   '
        end
        inline molListaPlano: TmolListaPlano
          Left = 368
          Top = 88
          Width = 353
          Height = 145
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 345
            Height = 121
          end
          inherited btnInvertePlano: TBitBtn
            Left = 311
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 332
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 345
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
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 376
          Top = 64
          Width = 345
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
        object btnContinuar: TfcShapeBtn
          Left = 632
          Top = 336
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object grbEnvio: TGroupBox
          Left = 16
          Top = 288
          Width = 705
          Height = 41
          Caption = ' Desfazer Recebimentos de '
          TabOrder = 8
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 0
          end
          object chkFolhaPatro: TCheckBox
            Left = 176
            Top = 17
            Width = 185
            Height = 17
            Caption = 'Folha da(s) Patrocinadora(s)'
            TabOrder = 1
          end
          object chkFinanceiroPag: TCheckBox
            Left = 384
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Financeiro (a Pagar)'
            TabOrder = 2
          end
          object chkFinanceiroRec: TCheckBox
            Left = 544
            Top = 17
            Width = 153
            Height = 17
            Caption = 'Financeiro (a Receber)'
            TabOrder = 3
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 721
          inherited edtNome: TEdit
            Width = 465
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 664
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 688
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 361
          Height = 153
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 345
            Height = 121
          end
          inherited btnInvertePatro: TBitBtn
            Left = 311
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 332
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        object grpDataRecebimento: TGroupBox
          Left = 496
          Top = 232
          Width = 225
          Height = 49
          Caption = ' Data de Recebimento entre: '
          TabOrder = 7
          object Label5: TLabel
            Left = 108
            Top = 24
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataRecebIni: TwwDBDateTimePicker
            Left = 8
            Top = 20
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
          object edtDataRecebFim: TwwDBDateTimePicker
            Left = 120
            Top = 20
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
        object grpDataVencto: TGroupBox
          Left = 16
          Top = 232
          Width = 225
          Height = 49
          Caption = ' Data de Vencimento entre: '
          TabOrder = 5
          object Label6: TLabel
            Left = 108
            Top = 24
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataVenctoIni: TwwDBDateTimePicker
            Left = 8
            Top = 20
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
          object edtDataVenctoFim: TwwDBDateTimePicker
            Left = 120
            Top = 20
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
        object grpDataEfetiva: TGroupBox
          Left = 256
          Top = 232
          Width = 225
          Height = 49
          Caption = ' Data Efetiva entre: '
          TabOrder = 6
          object Label4: TLabel
            Left = 108
            Top = 24
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataEfetivaIni: TwwDBDateTimePicker
            Left = 8
            Top = 20
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
          object edtDataEfetivaFim: TwwDBDateTimePicker
            Left = 120
            Top = 20
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
        object edtCodDocumento: TEdit
          Left = 120
          Top = 341
          Width = 121
          Height = 21
          Color = 12648447
          TabOrder = 9
          OnExit = edtCodDocumentoExit
          OnKeyPress = edtCodDocumentoKeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object Label3: TLabel
          Left = 404
          Top = 168
          Width = 193
          Height = 13
          Caption = 'Total de Recebimentos Desfeitos:'
        end
        object btnVoltar: TfcShapeBtn
          Left = 536
          Top = 336
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 705
          Height = 127
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object memErro: TMemo
          Left = 16
          Top = 224
          Width = 705
          Height = 97
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
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
          TabOrder = 2
        end
        object Panel4: TPanel
          Left = 16
          Top = 197
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Erros encontrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edtVlrDesfeito: TRealEdit
          Left = 600
          Top = 165
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 568
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
  object qryDesfazRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 169
    Top = 184
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 89
    Top = 168
  end
  object qryUpdateTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC'
      'SET'
      '   SITENVIO = DECODE(VALOR, VALORRECEBIDO, '#39'2'#39', '#39'1'#39')'
      'WHERE'
      '       IDDESCONTO =:PIDDESCONTO'
      '   AND IDTMPDESC  =:PIDTMPDESC')
    ValidateWithMask = True
    Left = 425
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDTMPDESC'
        ParamType = ptInput
      end>
  end
  object qryUpdateSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.FLGSITUACAO =:PFLGSITUACAO'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 532
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qrySituacaoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.FLGSITUACAO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 532
    Top = 15
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySituacaoContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdateParcelasSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO          = 1,'
      '   HMEDATAESTORNO        = SYSDATE,'
      '   HMEDATAESTORNOALT     = SYSDATE,'
      '   IDUSUARIOESTORNO      =:PIDUSUARIOESTORNO'
      'WHERE'
      '       IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '   AND HMEPARCELA        =:PHMEPARCELA'
      '   AND IDITEMEMPTMO      =:PIDITEMEMPTMO'
      '   AND HMESEQCOBRANCA    >:PHMESEQCOBRANCA'
      ''
      
        '   AND (:PHMEDATARECEBINI     IS NULL OR HMEDATARECEB    >=:PHME' +
        'DATARECEBINI)'
      
        '   AND (:PHMEDATARECEBFIM     IS NULL OR HMEDATARECEB    <=:PHME' +
        'DATARECEBFIM)'
      ''
      
        '   AND (:PHMEDATAVENCTOINI    IS NULL OR HMEDATAVENCTO   >=:PHME' +
        'DATAVENCTOINI)'
      
        '   AND (:PHMEDATAVENCTOFIM    IS NULL OR HMEDATAVENCTO   <=:PHME' +
        'DATAVENCTOFIM)'
      ''
      '   AND NVL(FLGESTORNADO,0) = 0'
      '   AND NVL(FLGABONADO,0)   = 0'
      '   AND NVL(FLGQUITADO,0)   = 0')
    ValidateWithMask = True
    Left = 425
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDITEMEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMESEQCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOFIM'
        ParamType = ptInput
      end>
  end
  object qryUpdateParcelaBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   HMEDATAEFETIVA             = NULL,'
      '   HMEVLREFETIVO              = NULL,'
      '   FLGBAIXADO                 = 0,'
      '   FLGDIVERGPEND              = NULL,'
      '   FLGTIPODIVERG              = NULL,'
      '   HMEDATARECEB               = NULL,'
      '   FLGRECEBIMENTO             = NULL'
      'WHERE'
      '       IDHISTMOVEMPTMO        =:PIDHISTMOVEMPTMO'
      '   AND IDCONTRATOEMPTMO       =:PIDCONTRATOEMPTMO'
      ''
      
        '   AND (:PHMEDATARECEBINI     IS NULL OR HMEDATARECEB    >=:PHME' +
        'DATARECEBINI)'
      
        '   AND (:PHMEDATARECEBFIM     IS NULL OR HMEDATARECEB    <=:PHME' +
        'DATARECEBFIM)'
      ''
      
        '   AND (:PHMEDATAVENCTOINI    IS NULL OR HMEDATAVENCTO   >=:PHME' +
        'DATAVENCTOINI)'
      
        '   AND (:PHMEDATAVENCTOFIM    IS NULL OR HMEDATAVENCTO   <=:PHME' +
        'DATAVENCTOFIM)'
      ''
      
        '   AND (:PHMEDATAEFETIVAINI   IS NULL OR HMEDATAEFETIVA  >=:PHME' +
        'DATAEFETIVAINI)'
      
        '   AND (:PHMEDATAEFETIVAFIM   IS NULL OR HMEDATAEFETIVA  <=:PHME' +
        'DATAEFETIVAFIM)')
    ValidateWithMask = True
    Left = 425
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAEFETIVAFIM'
        ParamType = ptInput
      end>
  end
end
