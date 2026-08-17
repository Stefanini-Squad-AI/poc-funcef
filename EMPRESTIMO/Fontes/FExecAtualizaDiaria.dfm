inherited frmExecAtualizaDiaria: TfrmExecAtualizaDiaria
  Left = 27
  Top = 83
  HelpContext = 150120
  Caption = 'Atualização de Saldo Devedor'
  ClientHeight = 436
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 403
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 401
      Height = 24
      Caption = 'Atualização de Saldo Devedor [seleção]'
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
      Top = 33
      Width = 740
      Height = 370
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Bevel3: TBevel
          Left = 16
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 16
          Top = 66
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 66
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label6: TLabel
          Left = 16
          Top = 106
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 360
          Top = 106
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Panel1: TPanel
          Left = 361
          Top = 240
          Width = 361
          Height = 65
          TabOrder = 2
          object Label5: TLabel
            Left = 16
            Top = 14
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label3: TLabel
            Left = 128
            Top = 14
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object Label4: TLabel
            Left = 248
            Top = 14
            Width = 102
            Height = 13
            Caption = 'Data a considerar'
          end
          object edtDataInicial: TwwDBDateTimePicker
            Left = 16
            Top = 28
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
            OnExit = edtDataInicialExit
          end
          object edtDataFinal: TwwDBDateTimePicker
            Left = 128
            Top = 28
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
            OnExit = edtDataFinalExit
          end
          object edtDataConsiderada: TwwDBDateTimePicker
            Left = 248
            Top = 28
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = 14548991
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 80
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
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 80
          Width = 361
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
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object btnContinuar: TfcShapeBtn
          Left = 632
          Top = 328
          Width = 89
          Height = 29
          Caption = 'Continuar'
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
            B08887F88888888887F887FBBBBB0BBBB088878888887F8887887FBBBBBB00BB
            BB087F88FFFF77F888787FB00000000BBB087F877777777F88787FB000000000
            BB087F877777777788787FB00000000BBB087F877777777888787FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 120
          Width = 329
          Height = 185
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
        end
        object BitBtn2: TBitBtn
          Left = 303
          Top = 110
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 5
          OnClick = btnInvertePatroClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
        object BitBtn1: TBitBtn
          Left = 324
          Top = 110
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 6
          OnClick = btnMarcaTodosPatroClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object lstPlano: TCheckListBox
          Left = 360
          Top = 120
          Width = 361
          Height = 113
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 7
        end
        object BitBtn3: TBitBtn
          Left = 679
          Top = 110
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 8
          OnClick = btnInvertePlanoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
        object BitBtn4: TBitBtn
          Left = 700
          Top = 110
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 9
          OnClick = btnMarcaTodosPlanoClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 16
          Width = 721
          TabOrder = 10
          inherited edtNome: TEdit
            Width = 465
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 664
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 688
          end
        end
        object chkEstorna: TCheckBox
          Left = 16
          Top = 328
          Width = 297
          Height = 17
          Caption = 'Estorna cálculo efetuado anteriormente'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 11
        end
        object chkNotInArquivo: TCheckBox
          Left = 336
          Top = 344
          Width = 273
          Height = 17
          Caption = 'NÃO considerar matrículas do arquivo'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 12
          Visible = False
        end
        object chkInArquivo: TCheckBox
          Left = 336
          Top = 320
          Width = 273
          Height = 17
          Caption = 'Considerar APENAS matrículas do arquivo'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 13
          Visible = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object Bevel1: TBevel
          Left = 16
          Top = 312
          Width = 705
          Height = 3
          Shape = bsTopLine
        end
        object LblProcessado: TLabel
          Left = 16
          Top = 140
          Width = 88
          Height = 13
          Caption = 'Processados: 0'
        end
        object lblErro: TLabel
          Left = 16
          Top = 292
          Width = 119
          Height = 13
          Caption = 'Erros encontrados: 0'
        end
        object btnVoltar: TfcShapeBtn
          Left = 536
          Top = 328
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
          Width = 707
          Height = 105
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object memErro: TMemo
          Left = 16
          Top = 186
          Width = 707
          Height = 105
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 707
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
          Top = 160
          Width = 707
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
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 740
    Height = 0
    TabOrder = 2
    Visible = False
  end
  object qryContratosGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOEMPTMO,'
      ''
      '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO,'
      '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO,'
      ''
      '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA,'
      '   C.IDPESSOA, C.IDBENEF,'
      ''
      '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG,'
      '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG,'
      '   C.IDCBANCARIA,'
      ''
      '   C.DATAASSINATURA, C.DATASITUACAO,'
      '   C.DATACREDITO, C.DATAPRIMPARC,'
      '   C.DATACANC,'
      ''
      '   C.MOECODIGO, M.MOESIGLA,'
      ''
      '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS,'
      '   C.NUMPARCELAS,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC'
      ''
      'FROM'
      '   CONTRATOEMPTMO  C,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE'
      ''
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( C.IDPATRO            IN ( 1 ) )'
      '   AND ( C.IDPLANOPREV        IN ( 1 ) )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 584
    Top = 44
    object qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosGeracaoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratosGeracaoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratosGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratosGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratosGeracaoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratosGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratosGeracaoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratosGeracaoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratosGeracaoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratosGeracaoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratosGeracaoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratosGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratosGeracaoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosGeracaoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratosGeracaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratosGeracaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratosGeracaoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratosGeracaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratosGeracaoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratosGeracaoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratosGeracaoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratosGeracaoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object qryContratosGeracaoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryContratosGeracaoIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object qryContratosGeracaoIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object qryContratosGeracaoIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object qryContratosGeracaoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryContratosGeracaoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryContratosGeracaoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDHISTMOVEMPTMO'
      'FROM'
      '    HISTMOVEMPTMO'
      'WHERE'
      '    IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND HMETIPOMOV       = 5'
      'AND HMEDATAPREVISTA  = :PHMEDATAPREVISTA'
      'AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0)')
    ValidateWithMask = True
    Left = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryAuxIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryParcelasEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO               = 1,'
      '   HMEDATAESTORNO             = SYSDATE,'
      '   IDUSUARIOESTORNO           =:PIDUSUARIOESTORNO'
      'WHERE'
      
        '       ((:PIDCONTRATOEMPTMO   IS NULL) OR (IDCONTRATOEMPTMO = :P' +
        'IDCONTRATOEMPTMO))'
      '   AND HMEDATAATUALIZA        =:PHMEDATAATUALIZA'
      '   AND HMETIPOMOV             = 5'
      '   AND NVL(FLGESTORNADO, 0)   = 0')
    ValidateWithMask = True
    Left = 472
    Top = 40
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
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      HMEDATAPREVISTA,'
      '      HMESALDODEV'
      '   FROM'
      '      HISTMOVEMPTMO HST'
      'WHERE'
      '   HST.IDHISTMOVEMPTMO IN'
      '   (SELECT'
      '       MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '    FROM'
      '       HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '       ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE'
      '    WHERE'
      '        ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '    AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '    AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '    AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '    AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '    AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '    AND ( HME.HMEDATAATUALIZA    = (SELECT MAX(HMEDATAATUALIZA)'
      '                                    FROM   HISTMOVEMPTMO'
      
        '                                    WHERE  IDCONTRATOEMPTMO = :P' +
        'IDCONTRATOEMPTMO'
      
        '                                    AND    (FLGESTORNADO    = 0 ' +
        'OR FLGESTORNADO IS NULL)'
      
        '                                    AND    HMEDATAATUALIZA  <= :' +
        'PHMEDATAATUALIZA) )'
      '    GROUP BY HMETIPOMOV'
      '    )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 352
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
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qrySaldoAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoAntHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
  end
  object qryParcelasAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(SUM(HMEVLRPREVISTO), 0) AS TOTAL'
      'FROM'
      '    HISTMOVEMPTMO'
      'WHERE'
      '    IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      'AND HMEDATAPREVISTA <:PHMEDATAPREVISTA'
      'AND HMEDATAEFETIVA  IS NULL'
      'AND (HMECENTRALIZA  = 1 OR HMEDESTACADO = 1)'
      'AND (FLGESTORNADO   = 0 OR FLGESTORNADO IS NULL)'
      'AND (FLGSUSPENSAO   = 0 OR FLGSUSPENSAO IS NULL)'
      'AND HMETIPOMOV      = 1'
      'AND FLGBAIXADO      = 0'
      ' ')
    ValidateWithMask = True
    Left = 217
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasAbertoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryAtualizaSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.IDHISTMOVEMPTMO,'
      '    HME.HMEVLRPREVISTO,'
      '    ITC.ITCTRATASALDODEV'
      'FROM'
      '    HISTMOVEMPTMO HME,'
      '    CONTRATOEMPTMO CNT,'
      '    ITEMXTIPOCONTR ITC'
      'WHERE'
      '    HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO'
      'AND HME.HMEDATAATUALIZA   >= :PHMEDATAATUALIZA'
      'AND HME.HMETIPOMOV        IN (1,2,3,4,6,7,8)'
      'AND CNT.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO'
      'AND ITC.IDTIPOCONTREMPTMO  = CNT.IDTIPOCONTREMPTMO'
      'AND ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 249
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qryAtualizaSaldoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryAtualizaSaldoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryAtualizaSaldoITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
  end
  object qryUpdateSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTMOVEMPTMO'
      'SET    HMESALDODEV     = :PHMESALDODEV'
      'WHERE  IDHISTMOVEMPTMO = :PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 361
    Top = 40
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryRetornaValor: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 576
    Top = 152
  end
  object qryInsertHistMovEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVEMPTMO'
      '('
      
        '  IDHISTMOVEMPTMO  , IDITEMCENTRALIZA , IDITEMEMPTMO    , IDCONT' +
        'RATOEMPTMO,'
      
        '  HMEMESCOMPETENCIA, HMEANOCOMPETENCIA, IDREGRA         , IDRUBR' +
        'ICA     ,'
      
        '  HMEMESCOBRANCA   , HMEANOCOBRANCA   , HMEFORMACOBRANCA, HMESEQ' +
        'COBRANCA,'
      
        '  HMEDATAPREVISTA  , HMEDATAATUALIZA  , HMEDATA         , HMETXJ' +
        'UROS    ,'
      
        '  HMEPARCELA       , HMESALDODEV      , HMEVLREFETIVO   , HMEVLR' +
        'PREVISTO,'
      
        '  HMERECPAG        , HMETIPOMOV       , HMECENTRALIZA   , HMEORI' +
        'GEM     ,'
      
        '  HMEPRIORIDADE    , FLGENVIO         , FLGBAIXADO      , FLGDIV' +
        'ERGPEND, FLGTIPODIVERG,'
      
        '  HMENUMPARCELAS   , HMEDESTACADO     , HMEDATAVENCTO   , HMEDAT' +
        'AEFETIVA,'
      '  HMETIPOFOLHA, VERSAO, HMEDATARECEB'
      ')'
      'VALUES'
      '('
      
        ' SEQHISTMOVEMPTMO.NEXTVAL  , :PIDITEMCENTRALIZA , :PIDITEMEMPTMO' +
        '    , :PIDCONTRATOEMPTMO,'
      
        ' :PHMEMESCOMPETENCIA, :PHMEANOCOMPETENCIA, :PIDREGRA         , :' +
        'PIDRUBRICA       ,'
      
        ' :PHMEMESCOBRANCA   , :PHMEANOCOBRANCA   , :PHMEFORMACOBRANCA, :' +
        'PHMESEQCOBRANCA  ,'
      
        ' :PHMEDATAPREVISTA  , :PHMEDATAATUALIZA  , SYSDATE         , :PH' +
        'METXJUROS      ,'
      
        ' :PHMEPARCELA       , :PHMESALDODEV      , :PHMEVLREFETIVO   , :' +
        'PHMEVLRPREVISTO  ,'
      
        ' :PHMERECPAG        , :PHMETIPOMOV       , :PHMECENTRALIZA   , :' +
        'PHMEORIGEM       ,'
      
        ' :PHMEPRIORIDADE    , :PFLGENVIO         , :PFLGBAIXADO      , :' +
        'PFLGDIVERGPEND   , :PFLGTIPODIVERG,'
      
        ' :PHMENUMPARCELAS   , :PHMEDESTACADO     , :PHMEDATAVENCTO   , :' +
        'PHMEDATAEFETIVA,'
      ' :PHMETIPOFOLHA, :PVERSAO, :PHMEDATARECEB'
      ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDITEMCENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDREGRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMESEQCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMETXJUROS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMESALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLREFETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PHMEVLRPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMERECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMECENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPRIORIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPODIVERG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMENUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEDESTACADO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMETIPOFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVERSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATARECEB'
        ParamType = ptInput
      end>
  end
  object qryParcelasNaoPagas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV       IN (1, 6, 7) )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEVLRPREVISTO   > 0 )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
end
