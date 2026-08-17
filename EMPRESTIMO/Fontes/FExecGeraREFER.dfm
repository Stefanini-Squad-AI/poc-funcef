inherited frmExecGeraREFER: TfrmExecGeraREFER
  Tag = 9999
  Left = 53
  Top = 136
  Caption = 'REFER - Geração de Inscrições em Empréstimos'
  ClientHeight = 436
  ClientWidth = 738
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 403
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 591
      Height = 24
      Caption = 'REFER - Geração de Inscrições em Empréstimos [seleção]'
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
      Width = 736
      Height = 370
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Bevel3: TBevel
          Left = 16
          Top = 316
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label6: TLabel
          Left = 16
          Top = 50
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 360
          Top = 50
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Label1: TLabel
          Left = 16
          Top = 270
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 270
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 260
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label31: TLabel
          Left = 16
          Top = 214
          Width = 154
          Height = 13
          Caption = 'Conta-Caixa x Forma Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 360
          Top = 176
          Width = 361
          Height = 73
          TabOrder = 6
          object Label5: TLabel
            Left = 74
            Top = 12
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Inscrição:'
          end
          object Label4: TLabel
            Left = 77
            Top = 44
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Validade:'
          end
          object edtDataInscricao: TwwDBDateTimePicker
            Left = 184
            Top = 8
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
          object edtDataValidade: TwwDBDateTimePicker
            Left = 184
            Top = 40
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
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 64
          Width = 329
          Height = 137
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
        end
        object BitBtn2: TBitBtn
          Left = 303
          Top = 54
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 1
          OnClick = BitBtn2Click
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
          Top = 54
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 2
          OnClick = BitBtn1Click
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
          Top = 64
          Width = 361
          Height = 105
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 3
        end
        object BitBtn3: TBitBtn
          Left = 679
          Top = 54
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 4
          OnClick = BitBtn3Click
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
          Top = 54
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 5
          OnClick = BitBtn4Click
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 284
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
          TabOrder = 8
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
          Top = 284
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
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molParticipante: TmolParticipante
          Left = 8
          Top = 6
          Width = 713
          TabOrder = 10
          inherited Label1: TLabel
            Left = 176
          end
          inherited Label2: TLabel
            Left = 96
          end
          inherited btnBuscaPart: TBitBtn
            Left = 664
          end
          inherited btnLimpaPart: TBitBtn
            Left = 688
          end
          inherited edtMatricula: TEdit
            Width = 89
          end
          inherited edtInscricao: TEdit
            Left = 96
            Width = 81
          end
          inherited edtNome: TEdit
            Left = 176
            Width = 489
          end
        end
        object DBcboCCaixaxFPagto: TwwDBLookupCombo
          Left = 16
          Top = 228
          Width = 329
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPortadorFormaP
          LookupField = 'CODPORTFORMA'
          ParentFont = False
          TabOrder = 11
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object chkGeraArquivo: TCheckBox
          Left = 16
          Top = 328
          Width = 193
          Height = 17
          Caption = 'Gerar somente arquivo texto'
          TabOrder = 12
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
          Left = 479
          Top = 134
          Width = 167
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Inscrições geradas: '
        end
        object Label3: TLabel
          Left = 449
          Top = 286
          Width = 197
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Inscrições NÃO geradas: '
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
          Width = 705
          Height = 95
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Inscrições Geradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
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
          ScrollBars = ssBoth
          TabOrder = 4
        end
        object Panel2: TPanel
          Left = 16
          Top = 160
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Inscrições NÃO Geradas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object edtNumResult: TRealEdit
          Left = 648
          Top = 130
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtNumErro: TRealEdit
          Left = 648
          Top = 282
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 421
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
  object qryInsertInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO INSCRICAOEMPTMO'
      '('
      'IDINSCRICAOEMPTMO,'
      'IDPESSOA,'
      'IDBENEF,'
      'IDPATRO,'
      'IDPLANOPREV,'
      'IDTIPOCONTREMPTMO,'
      'VLRSOLIC,'
      'NUMPARCELAS,'
      'IDCBANCARIA,'
      'FLGPENDENTE,'
      'FLGSITUACAO,'
      'FLGFORMAREC,'
      'FLGFORMAPAG,'
      'CODFORMAPAG,'
      'PORTFORMAPAG,'
      'PORTFORMAREC,'
      'DATAINSC,'
      'DATAVALIDADE,'
      'MOECODIGO,'
      'VLRMARGEM,'
      'VLRMAXPERMIT'
      ')'
      'VALUES'
      '('
      ':PIDINSCRICAOEMPTMO,'
      ':PIDPESSOA,'
      ':PIDBENEF,'
      ':PIDPATRO,'
      ':PIDPLANOPREV,'
      ':PIDTIPOCONTREMPTMO,'
      ':PVLRSOLIC,'
      ':PNUMPARCELAS,'
      ':PIDCBANCARIA,'
      ':PFLGPENDENTE,'
      ':PFLGSITUACAO,'
      ':PFLGFORMAREC,'
      ':PFLGFORMAPAG,'
      ':PCODFORMAPAG,'
      ':PPORTFORMAPAG,'
      ':PPORTFORMAREC,'
      ':PDATAINSC,'
      ':PDATAVALIDADE,'
      ':PMOECODIGO,'
      ':PVLRMARGEM,'
      ':PVLRMAXPERMIT'
      ')'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 616
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLRSOLIC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAPAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAREC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINSC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMOECODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRMARGEM'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRMAXPERMIT'
        ParamType = ptInput
      end>
  end
  object qryParticipantesGeracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PPP.IDPESSOA,'
      '   PPP.IDPESSJUR AS IDPATRO,'
      '   PPP.IDPLANOPREV,'
      '   PPP.IDSITPART,'
      '   C.IDCBANCARIA,'
      ''
      '   P.NOME,'
      ''
      '   ST.FLGINTERNO'
      ''
      'FROM'
      '  PESSOA P,'
      '  PARTPREVPLAN PPP,'
      '  SITPART ST,'
      '  PLANPREV PL,'
      '  CONTABANCARIA C'
      ''
      'WHERE'
      '  ( PPP.SEQPROPOSTA = 1 )'
      '  AND ( PPP.FLGDESATIVADO = 0 )'
      '  AND ( ST.FLGINTERNO <> '#39'CA'#39' )'
      '  AND ( PPP.IDPESSOA = P.IDPESSOA )'
      '  AND ( PPP.IDSITPART = ST.IDSITPART )'
      '  AND ( C.IDPESSOA = PPP.IDPESSOA )'
      '  and ( C.FLGCONTAPREF = 1 )'
      '  AND ( PL.IDPLANOPREV = PPP.IDPLANOPREV )'
      ''
      '')
    ValidateWithMask = True
    Left = 528
    Top = 92
    object qryParticipantesGeracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSOA'
    end
    object qryParticipantesGeracaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSJUR'
    end
    object qryParticipantesGeracaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPLANOPREV'
    end
    object qryParticipantesGeracaoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDSITPART'
    end
    object qryParticipantesGeracaoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.CONTABANCARIA.IDCBANCARIA'
    end
    object qryParticipantesGeracaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryParticipantesGeracaoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
  end
  object qryInsertCentral: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO INSCRICAOLOTE'
      '('
      'IDINSCRICAOEMPTMO,'
      'VALORLIQUIDO1,'
      'VALORLIQUIDO2,'
      'VALORLIQUIDO3,'
      'PRESTACAO1,'
      'PRESTACAO2,'
      'PRESTACAO3,'
      'CQM1,'
      'CQM2,'
      'CQM3,'
      'IOF1,'
      'IOF2,'
      'IOF3,'
      'CPMF1,'
      'CPMF2,'
      'CPMF3,'
      'TXADM1,'
      'TXADM2,'
      'TXADM3,'
      'VALORBRUTO1,'
      'VALORBRUTO2,'
      'VALORBRUTO3,'
      'OPCAO'
      ')'
      'VALUES'
      '('
      ':PIDINSCRICAO,'
      ':PVALOR1,'
      ':PVALOR2,'
      ':PVALOR3,'
      ':PPRESTACAO1,'
      ':PPRESTACAO2,'
      ':PPRESTACAO3,'
      ':PCQM1,'
      ':PCQM2,'
      ':PCQM3,'
      ':PIOF1,'
      ':PIOF2,'
      ':PIOF3,'
      ':PCPMF1,'
      ':PCPMF2,'
      ':PCPMF3,'
      ':PTXADM1,'
      ':PTXADM2,'
      ':PTXADM3,'
      ':PVALORBRUTO1,'
      ':PVALORBRUTO2,'
      ':PVALORBRUTO3,'
      'NULL'
      ')')
    ValidateWithMask = True
    Left = 616
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOR1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOR2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOR3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PPRESTACAO1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PPRESTACAO2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PPRESTACAO3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCQM1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCQM2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCQM3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PIOF1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PIOF2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PIOF3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCPMF1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCPMF2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PCPMF3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PTXADM1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PTXADM2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PTXADM3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORBRUTO1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORBRUTO2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORBRUTO3'
        ParamType = ptInput
      end>
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PPP.IDPESSOA,'
      '   PPP.IDPESSJUR AS IDPATRO,'
      '   PPP.IDPLANOPREV,'
      '   PPP.IDSITPART,'
      '   C.IDCBANCARIA,'
      ''
      '   P.NOME,'
      ''
      '   ST.FLGINTERNO'
      ''
      'FROM'
      '  PESSOA P,'
      '  PARTPREVPLAN PPP,'
      '  SITPART ST,'
      '  PLANPREV PL,'
      '  CONTABANCARIA C'
      ''
      'WHERE'
      '  ( PPP.SEQPROPOSTA = 1 )'
      '  AND ( PPP.FLGDESATIVADO = 0 )'
      '  AND ( ST.FLGINTERNO <> '#39'CA'#39' )'
      '  AND ( PPP.IDPESSOA = P.IDPESSOA )'
      '  AND ( PPP.IDSITPART = ST.IDSITPART )'
      '  AND ( C.IDPESSOA = PPP.IDPESSOA )'
      '  and ( C.FLGCONTAPREF = 1 )'
      '  AND ( PL.IDPLANOPREV = PPP.IDPLANOPREV )'
      ' ')
    ValidateWithMask = True
    Left = 424
    Top = 164
    object qryBeneficiarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSOA'
    end
    object qryBeneficiarioIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPESSJUR'
    end
    object qryBeneficiarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDPLANOPREV'
    end
    object qryBeneficiarioIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = 'BASEDADOS.PARTPREVPLAN.IDSITPART'
    end
    object qryBeneficiarioIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.CONTABANCARIA.IDCBANCARIA'
    end
    object qryBeneficiarioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBeneficiarioFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.SITPART.FLGINTERNO'
      FixedChar = True
      Size = 2
    end
  end
  object qryGeraArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    INL.IDINSCRICAOEMPTMO,'
      '    BCO.NUMBANCO,'
      '    BAN.NOME AS NOMEBANCO,'
      '    AGB.NUMAGENCIA,'
      '    AGC.NOME AS NOMEAGENCIA,'
      '    CTB.CONTACORRENTE,'
      '    PES.NOME,'
      '    CPF.NUMDOCUMENTO AS CPF,'
      '    IDT.NUMDOCUMENTO AS IDENTIDADE,'
      '    ENDPESS.LOGRADOURO,'
      '    ENDPESS.NUMERO,'
      '    ENDPESS.COMPLEMENTO,'
      '    ENDPESS.BAIRRO,'
      '    ENDPESS.CIDADE,'
      '    ENDPESS.CEP,'
      '    C.NOME AS NOMECIDADE,'
      '    E.CODESTADO,'
      '    E.NOMEESTADO,'
      '    INL.VALORLIQUIDO1,'
      '    INL.VALORLIQUIDO2,'
      '    INL.VALORLIQUIDO3,'
      '    INL.PRESTACAO1,'
      '    INL.PRESTACAO2,'
      '    INL.PRESTACAO3,'
      '    INL.CQM1,'
      '    INL.CQM2,'
      '    INL.CQM3,'
      '    INL.IOF1,'
      '    INL.IOF2,'
      '    INL.IOF3,'
      '    INL.CPMF1,'
      '    INL.CPMF2,'
      '    INL.CPMF3,'
      '    INL.TXADM1,'
      '    INL.TXADM2,'
      '    INL.TXADM3,'
      '    INL.VALORBRUTO1,'
      '    INL.VALORBRUTO2,'
      '    INL.VALORBRUTO3,'
      '    INL.OPCAO'
      'FROM'
      '    INSCRICAOLOTE   INL,'
      '    INSCRICAOEMPTMO INS,'
      '    PESSOA          PES,'
      '    PESSOA          BAN,'
      '    PESSOA          AGC,'
      '    BANCO           BCO,'
      '    AGENCIABANCARIA AGB,'
      '    CONTABANCARIA   CTB,'
      '    DOCPESSOA       CPF,'
      '    DOCPESSOA       IDT,'
      '    ENDPESS            ,'
      '    CIDADES C          ,'
      '    ESTADO E           ,'
      '    PAIS P'
      'WHERE'
      '    INS.IDINSCRICAOEMPTMO = INL.IDINSCRICAOEMPTMO'
      'AND CTB.IDPESSOA          = INS.IDBENEF'
      'AND CTB.IDAGENCIA         = AGB.IDPESSOA'
      'AND AGB.IDBANCO           = BAN.IDPESSOA'
      'AND CPF.IDPESSOA          = INS.IDBENEF'
      'AND IDT.IDPESSOA          = INS.IDBENEF'
      'AND CPF.IDDOCUMENTO       = 2'
      'AND IDT.IDDOCUMENTO       = 11'
      'AND E.IDPAIS              = P.IDPAIS(+)'
      'AND E.IDESTADO(+)         = C.IDESTADO'
      'AND C.IDCIDADES(+)        = ENDPESS.IDCIDADES'
      'AND ENDPESS.IDPESSOA      = INS.IDBENEF'
      'ORDER BY INL.IDINSCRICAOEMPTMO, INL.OPCAO'
      '')
    ValidateWithMask = True
    Left = 112
    Top = 120
    object qryGeraArquivoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryGeraArquivoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryGeraArquivoNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object qryGeraArquivoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryGeraArquivoNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qryGeraArquivoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryGeraArquivoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryGeraArquivoCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object qryGeraArquivoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      FixedChar = True
      Size = 18
    end
    object qryGeraArquivoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryGeraArquivoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryGeraArquivoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryGeraArquivoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryGeraArquivoCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object qryGeraArquivoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryGeraArquivoNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object qryGeraArquivoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryGeraArquivoVALORLIQUIDO1: TFloatField
      FieldName = 'VALORLIQUIDO1'
    end
    object qryGeraArquivoVALORLIQUIDO2: TFloatField
      FieldName = 'VALORLIQUIDO2'
    end
    object qryGeraArquivoVALORLIQUIDO3: TFloatField
      FieldName = 'VALORLIQUIDO3'
    end
    object qryGeraArquivoPRESTACAO1: TFloatField
      FieldName = 'PRESTACAO1'
    end
    object qryGeraArquivoPRESTACAO2: TFloatField
      FieldName = 'PRESTACAO2'
    end
    object qryGeraArquivoPRESTACAO3: TFloatField
      FieldName = 'PRESTACAO3'
    end
    object qryGeraArquivoCQM1: TFloatField
      FieldName = 'CQM1'
    end
    object qryGeraArquivoCQM2: TFloatField
      FieldName = 'CQM2'
    end
    object qryGeraArquivoCQM3: TFloatField
      FieldName = 'CQM3'
    end
    object qryGeraArquivoIOF1: TFloatField
      FieldName = 'IOF1'
    end
    object qryGeraArquivoIOF2: TFloatField
      FieldName = 'IOF2'
    end
    object qryGeraArquivoIOF3: TFloatField
      FieldName = 'IOF3'
    end
    object qryGeraArquivoCPMF1: TFloatField
      FieldName = 'CPMF1'
    end
    object qryGeraArquivoCPMF2: TFloatField
      FieldName = 'CPMF2'
    end
    object qryGeraArquivoCPMF3: TFloatField
      FieldName = 'CPMF3'
    end
    object qryGeraArquivoTXADM1: TFloatField
      FieldName = 'TXADM1'
    end
    object qryGeraArquivoTXADM2: TFloatField
      FieldName = 'TXADM2'
    end
    object qryGeraArquivoTXADM3: TFloatField
      FieldName = 'TXADM3'
    end
    object qryGeraArquivoVALORBRUTO1: TFloatField
      FieldName = 'VALORBRUTO1'
    end
    object qryGeraArquivoVALORBRUTO2: TFloatField
      FieldName = 'VALORBRUTO2'
    end
    object qryGeraArquivoVALORBRUTO3: TFloatField
      FieldName = 'VALORBRUTO3'
    end
    object qryGeraArquivoOPCAO: TFloatField
      FieldName = 'OPCAO'
    end
    object qryGeraArquivoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
  end
end
