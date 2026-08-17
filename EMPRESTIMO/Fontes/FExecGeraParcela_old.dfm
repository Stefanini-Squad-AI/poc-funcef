inherited frmExecGeraParcela: TfrmExecGeraParcela
  Left = 17
  Top = 105
  Caption = 'Geração Mensal de Parcelas'
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
      Width = 384
      Height = 24
      Caption = 'Geração Mensal de Parcelas [seleção]'
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
      Left = 1
      Top = 32
      Width = 738
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
        object Label6: TLabel
          Left = 16
          Top = 98
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 360
          Top = 98
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Panel1: TPanel
          Left = 360
          Top = 232
          Width = 361
          Height = 65
          TabOrder = 9
          object Label15: TLabel
            Left = 16
            Top = 14
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label5: TLabel
            Left = 240
            Top = 14
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 28
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = DBspnAnoExit
          end
          object cboMes: TComboBox
            Left = 16
            Top = 28
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnExit = cboMesExit
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
          object edtDataLancamento: TwwDBDateTimePicker
            Left = 240
            Top = 28
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
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 1
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
          Top = 72
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
          LookupField = 'IDTipoContrEmptmo'
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
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 112
          Width = 329
          Height = 185
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
        end
        object BitBtn2: TBitBtn
          Left = 303
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 4
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
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 5
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
          Top = 112
          Width = 361
          Height = 105
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 6
        end
        object BitBtn3: TBitBtn
          Left = 679
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 7
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
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 8
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
        inline molContratoEmptmo1: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 545
          inherited Label1: TLabel
            Left = 112
          end
          inherited edtNome: TEdit
            Left = 112
            Width = 377
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 488
            OnClick = molContratoEmptmo1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 512
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
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
        object Total: TLabel
          Left = 48
          Top = 134
          Width = 158
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Parcelas geradas: '
        end
        object Label4: TLabel
          Left = 409
          Top = 134
          Width = 197
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total das Parcelas geradas: '
        end
        object Label8: TLabel
          Left = 18
          Top = 286
          Width = 188
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Parcelas NÃO geradas: '
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
        object edtNumResult: TRealEdit
          Left = 208
          Top = 130
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '         0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtNumErro: TRealEdit
          Left = 208
          Top = 282
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '         0')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object memErro: TMemo
          Left = 16
          Top = 186
          Width = 705
          Height = 95
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
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 705
          Height = 95
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas Geradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object Panel4: TPanel
          Left = 16
          Top = 160
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos com Parcelas NÃO Geradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object edtVlrTotParcela: TRealEdit
          Left = 608
          Top = 130
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 7
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
    Top = 403
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
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
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
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
      '   H.HMEPARCELA, H.HMENUMPARCELAS,'
      ''
      '   TC.IDREGRAJURCONC,'
      '   TC.IDREGRALIMITES,'
      '   TC.IDREGRASUSPCOBR,'
      '   TC.IDREGRASLDDIA,'
      '   TC.IDREGRAJURANTCONC,'
      '   TC.IDREGRAELEG,'
      '   TC.IDREGRARESERVA,'
      '   TC.IDREGRAMARGEM,'
      '   TC.IDREGRAPRAZOSCONC,'
      ''
      '   I.DATAINSC'
      ''
      'FROM'
      '   INSCRICAOEMPTMO I, CONTRATOEMPTMO C,'
      '   MOEDA M,'
      '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE,'
      ''
      '   ('
      '   SELECT'
      '      IDCONTRATOEMPTMO,'
      '      MAX(HMEPARCELA) AS HMEPARCELA,'
      '      MIN(HMENUMPARCELAS) AS HMENUMPARCELAS,'
      
        '      MAX( (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, '#39'0000'#39')))) ||' +
        ' (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, '#39'00'#39')))) ) AS ANOMESANT' +
        'ERIOR'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      '      HMETIPOMOV IN (0, 1)'
      '   GROUP BY'
      '      IDCONTRATOEMPTMO'
      '   ) H'
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( H.ANOMESANTERIOR     <:PANOMES )'
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TC.IDTIPOEMPTMO =:PID' +
        'TIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ':PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TC.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO) )'
      '   AND ( C.IDPATRO            IN (:PIDPATRO) )'
      '   AND ( C.IDPLANOPREV        IN (:PIDPLANOPREV) )'
      '   AND ( TE.IDEMPRESAPROP     =:PIDEMPRESAPROP )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDCONTRATOEMPTMO   = H.IDCONTRATOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )')
    ValidateWithMask = True
    Left = 608
    ParamData = <
      item
        DataType = ftString
        Name = 'PANOMES'
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
      end
      item
        DataType = ftString
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
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
    object qryContratosGeracaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
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
    object qryContratosGeracaoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
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
    object qryContratosGeracaoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryContratosGeracaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosGeracaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 608
    Top = 12
  end
  object qryMarcaContratoEncerrado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO C'
      'SET'
      '   C.FLGSITUACAO = '#39'E'#39
      'WHERE'
      '   ( C.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )')
    ValidateWithMask = True
    Left = 608
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '0'
      end>
    object FloatField1: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object FloatField3: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object FloatField4: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object FloatField5: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object FloatField6: TFloatField
      FieldName = 'IDPATRO'
    end
    object FloatField7: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object FloatField8: TFloatField
      FieldName = 'IDVERBA'
    end
    object FloatField9: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField10: TFloatField
      FieldName = 'IDBENEF'
    end
    object StringField1: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField11: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object FloatField12: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object FloatField13: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object FloatField14: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATACANC'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object FloatField15: TFloatField
      FieldName = 'IDMOTIVOCANC'
    end
    object FloatField16: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object FloatField17: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object FloatField18: TFloatField
      FieldName = 'TXJUROS'
    end
    object FloatField19: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object FloatField20: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object FloatField21: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object FloatField22: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object FloatField23: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object FloatField24: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object FloatField25: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object FloatField26: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object FloatField27: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object FloatField28: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object FloatField29: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
    object FloatField30: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryParcelasDivergentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(H.IDHISTMOVEMPTMO) AS ITENS_DIVERGENTES'
      ''
      'FROM'
      '   HISTMOVEMPTMO H'
      ''
      'WHERE'
      '       ( H.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( H.HMEPARCELA       <:PHMEPARCELA )'
      '   AND ( H.FLGDIVERGPEND    = 1 )')
    ValidateWithMask = True
    Left = 488
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
    object qryParcelasDivergentesITENS_DIVERGENTES: TFloatField
      FieldName = 'ITENS_DIVERGENTES'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
end
