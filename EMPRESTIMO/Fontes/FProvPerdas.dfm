inherited frmProvPerdas: TfrmProvPerdas
  Left = 258
  Top = 111
  HelpContext = 150120
  Caption = 'Provisão para Perdas'
  ClientHeight = 452
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 419
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 316
      Height = 24
      Caption = 'Provisão para Perdas [seleção]'
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
      Top = 32
      Width = 740
      Height = 387
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
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
          LookupTable = qryTipoContr
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
          Top = 344
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
          TabOrder = 11
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 16
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
          end
        end
        object chkEstorna: TCheckBox
          Left = 24
          Top = 312
          Width = 297
          Height = 17
          Caption = 'Estornar cálculo efetuado anteriormente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object chkNotInArquivo: TCheckBox
          Left = 360
          Top = 336
          Width = 265
          Height = 17
          Caption = 'NÃO considerar matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object chkInArquivo: TCheckBox
          Left = 360
          Top = 312
          Width = 265
          Height = 17
          Caption = 'Considerar APENAS matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 96
          Width = 345
          Height = 193
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 169
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
          Top = 96
          Width = 377
          Height = 137
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 361
            Height = 113
          end
          inherited btnInvertePlano: TBitBtn
            Left = 327
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 348
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object Panel1: TPanel
          Left = 360
          Top = 232
          Width = 361
          Height = 65
          TabOrder = 5
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
            Left = 240
            Top = 14
            Width = 103
            Height = 13
            Caption = 'Data a Considerar'
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
            OnCloseUp = edtDataInicialCloseUp
            OnExit = edtDataInicialCloseUp
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
          end
          object edtDataConsiderada: TwwDBDateTimePicker
            Left = 240
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
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object chkCommit: TCheckBox
          Left = 360
          Top = 360
          Width = 273
          Height = 17
          Caption = 'Apenas SIMULAR, sem gravar parcelas'
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        object chkContratoBranco: TCheckBox
          Left = 24
          Top = 336
          Width = 297
          Height = 17
          Caption = 'Contrato não selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object btnVoltar: TfcShapeBtn
          Left = 536
          Top = 344
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
          Width = 345
          Height = 295
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
        object memErro: TMemo
          Left = 376
          Top = 34
          Width = 347
          Height = 295
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 4
          WordWrap = False
        end
        object Panel4: TPanel
          Left = 376
          Top = 8
          Width = 347
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
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 345
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 419
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
      '   TC.IDREGRAPRAZOSCONC,'
      ''
      '   I.DATAINSC,'
      '   SIT.IDSITPART, SIT.FLGINTERNO'
      ''
      'FROM'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO  C,'
      '   MOEDA           M,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      '   PARTPREVPLAN    PPP,'
      '   SITPART SIT'
      ''
      ''
      'WHERE'
      '       ( C.FLGSITUACAO        = '#39'A'#39' )'
      '   AND ( C.IDPATRO            IN ( 1 ) )'
      '   AND ( C.IDPLANOPREV        IN ( 1 ) )'
      '   AND ( TE.IDEMPRESAPROP     = 1 )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.IDINSCRICAOEMPTMO  = I.IDINSCRICAOEMPTMO )'
      '   AND ( C.MOECODIGO          = M.MOECODIGO(+) )'
      '   AND PPP.IDPESSOA          = C.IDBENEF'
      '   AND ( PPP.FLGDESATIVADO   = 0 )'
      '   AND ( PPP.IDSITPART       = SIT.IDSITPART )'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 592
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
    object qryContratosGeracaoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratosGeracaoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryContratosGeracaoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
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
    Left = 56
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
    Left = 265
    Top = 208
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
    Left = 273
    Top = 264
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
    Left = 72
    Top = 232
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
    Left = 184
    Top = 160
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
  object qryTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   TCE.IDREGRAELEG,'
      '   TCE.IDREGRARESERVA,'
      '   TCE.IDREGRAMARGEM,'
      '   TCE.IDREGRALIMITES,'
      ''
      '   TCE.IDREGRAJURCONC,'
      '   TCE.IDREGRAJURANTCONC,'
      '   TCE.IDREGRAPRAZOSCONC,'
      ''
      '   TCE.IDREGRASUSPCOBR,'
      '   TCE.IDREGRASLDDIA,'
      ''
      '   TCE.IDREGRASALBAS,'
      '   TCE.IDREGRADATACRED,'
      '   TCE.IDREGRAQUITADO,'
      ''
      '   TCE.FLGSITUACAO,'
      ''
      '   TCE.FLGSUSPENSAO,'
      '   TCE.FLGSEGURO,'
      ''
      '   TCE.TCEMAXCONTRATO,'
      '   TCE.TCEMAXINSCR,'
      '   TCE.TCEMAXPARC,'
      '   TCE.TCEMINPARC,'
      '   TCE.TCEMINQUIT,'
      '   TCE.TCEMINRENOVA,'
      ''
      '   TCE.IDREPORTS,'
      ''
      '   TCE.TCETRATAPARCATRAS,'
      '   TCE.TCETRATAPARCPARC,'
      ''
      '   TCE.MOECODIGO,'
      '   TCE.FLGCOBRJUDIC,'
      '   TCE.TCEMAXMESDEB,'
      '   TCE.NUMPARCDESCONTO,'
      ''
      '   TEP.IDTIPOEMPTMO,'
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.IDREGRAVLRMAX,'
      '   TCE.IDREGRAPRAZOMAX'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       ( TEP.IDEMPRESAPROP    =:PIDEMPRESAPROP )'
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TCE.IDTIPOEMPTMO     ' +
        ' =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TCE.IDTIPOCONTREMPTMO' +
        ' =:PIDTIPOCONTREMPTMO) )'
      '   AND ( TCE.IDTIPOEMPTMO     = TEP.IDTIPOEMPTMO )'
      ''
      'ORDER BY'
      '   TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 176
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
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
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryTipoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContrIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAJURCONC'
    end
    object qryTipoContrIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRALIMITES'
    end
    object qryTipoContrIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRASUSPCOBR'
    end
    object qryTipoContrIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRASLDDIA'
    end
    object qryTipoContrIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAJURANTCONC'
    end
    object qryTipoContrIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAELEG'
    end
    object qryTipoContrIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRARESERVA'
    end
    object qryTipoContrIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAMARGEM'
    end
    object qryTipoContrIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREGRAPRAZOSCONC'
    end
    object qryTipoContrFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoContrFLGSUSPENSAO: TStringField
      FieldName = 'FLGSUSPENSAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSUSPENSAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoContrFLGSEGURO: TStringField
      FieldName = 'FLGSEGURO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".FLGSEGURO'
      FixedChar = True
      Size = 1
    end
    object qryTipoContrTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXCONTRATO'
    end
    object qryTipoContrTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXINSCR'
    end
    object qryTipoContrTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMAXPARC'
    end
    object qryTipoContrTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMINPARC'
    end
    object qryTipoContrTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEMINQUIT'
    end
    object qryTipoContrIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDREPORTS'
    end
    object qryTipoContrTCETRATAPARCATRAS: TStringField
      FieldName = 'TCETRATAPARCATRAS'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCETRATAPARCATRAS'
      FixedChar = True
      Size = 1
    end
    object qryTipoContrTCETRATAPARCPARC: TStringField
      FieldName = 'TCETRATAPARCPARC'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCETRATAPARCPARC'
      FixedChar = True
      Size = 1
    end
    object qryTipoContrIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS."CM.TIPOEMPTMO".IDTIPOEMPTMO'
    end
    object qryTipoContrDESCTIPOEMPTMO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS."CM.TIPOEMPTMO".DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContrIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
    end
    object qryTipoContrTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryTipoContrMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryTipoContrIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
    end
    object qryTipoContrIDREGRAQUITADO: TFloatField
      FieldName = 'IDREGRAQUITADO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAQUITADO'
    end
    object qryTipoContrFLGCOBRJUDIC: TFloatField
      FieldName = 'FLGCOBRJUDIC'
    end
    object qryTipoContrTCEMAXMESDEB: TFloatField
      FieldName = 'TCEMAXMESDEB'
    end
    object qryTipoContrIDREGRAVLRMAX: TFloatField
      FieldName = 'IDREGRAVLRMAX'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAVLRMAX'
    end
    object qryTipoContrNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
    end
    object qryTipoContrIDREGRAPRAZOMAX: TFloatField
      FieldName = 'IDREGRAPRAZOMAX'
    end
  end
  object qryLog: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMODULO,'
      '   IDPESQUISA1,'
      '   IDPESQUISA2,'
      '   DESCPROCESSO,'
      '   DESCOPERACAO,'
      '   FLGTIPO,'
      '   TRGUSERINCLUSAO,'
      '   TRGDTINCLUSAO'
      'FROM'
      '   LOGEMPRESTIMO'
      'WHERE'
      '   IDMODULO = 15')
    ValidateWithMask = True
    Left = 344
    Top = 212
    object qryLogIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.IDMODULO'
    end
    object qryLogIDPESQUISA1: TFloatField
      FieldName = 'IDPESQUISA1'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.IDPESQUISA1'
    end
    object qryLogIDPESQUISA2: TFloatField
      FieldName = 'IDPESQUISA2'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.IDPESQUISA2'
    end
    object qryLogDESCPROCESSO: TStringField
      FieldName = 'DESCPROCESSO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.DESCPROCESSO'
      Size = 50
    end
    object qryLogDESCOPERACAO: TStringField
      FieldName = 'DESCOPERACAO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.DESCOPERACAO'
      Size = 200
    end
    object qryLogFLGTIPO: TFloatField
      FieldName = 'FLGTIPO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.FLGTIPO'
    end
    object qryLogTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLogTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.LOGEMPRESTIMO.TRGDTINCLUSAO'
    end
  end
  object qryLimpaLog: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   LOGEMPRESTIMO'
      'WHERE'
      '   IDMODULO = 15')
    ValidateWithMask = True
    Left = 432
    Top = 212
  end
end
