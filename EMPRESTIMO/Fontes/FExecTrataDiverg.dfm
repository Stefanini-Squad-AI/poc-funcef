inherited frmExecTrataDiverg: TfrmExecTrataDiverg
  Left = 15
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Tratamento de Divergências'
  ClientHeight = 432
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 399
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 285
      Height = 24
      Caption = 'Tratamento de Divergências'
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
      Width = 763
      Height = 366
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label5: TLabel
          Left = 376
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label1: TLabel
          Left = 16
          Top = 98
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label7: TLabel
          Left = 16
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label8: TLabel
          Left = 376
          Top = 98
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 656
          Top = 320
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
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
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 376
          Top = 72
          Width = 369
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
        object DBcboPatro: TwwDBLookupCombo
          Left = 16
          Top = 112
          Width = 345
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'40'#9'Patrocinadora'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPatro
          LookupField = 'IDPESSOA'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molContratoEmptmo1: TmolContratoEmptmo
          Left = 8
          Top = 16
          Width = 537
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
            OnClick = molContratoEmptmo1btnLimpaContratoClick
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 72
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
        object DBcboPlano: TwwDBLookupCombo
          Left = 376
          Top = 112
          Width = 369
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano'#9'F')
          LookupTable = dtmLookEmptmo.qryLookPlanPrev
          LookupField = 'IDPLANOPREV'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object Panel2: TPanel
          Left = 16
          Top = 144
          Width = 345
          Height = 81
          TabOrder = 6
          object Label3: TLabel
            Left = 64
            Top = 14
            Width = 128
            Height = 13
            Caption = 'Mês/Ano de Cobrança'
          end
          object dbspAnoCob: TwwDBSpinEdit
            Left = 208
            Top = 28
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMesCobranca: TComboBox
            Left = 64
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
          object chkCobranca: TCheckBox
            Left = 72
            Top = 56
            Width = 193
            Height = 17
            Caption = 'Usa filtro por cobrança'
            TabOrder = 2
          end
        end
        object Panel5: TPanel
          Left = 376
          Top = 144
          Width = 369
          Height = 81
          TabOrder = 7
          object Label4: TLabel
            Left = 80
            Top = 14
            Width = 147
            Height = 13
            Caption = 'Mês/Ano de Competência'
          end
          object dbspAnoComp: TwwDBSpinEdit
            Left = 224
            Top = 28
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMesCompet: TComboBox
            Left = 80
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
          object chkCompetencia: TCheckBox
            Left = 88
            Top = 56
            Width = 193
            Height = 17
            Caption = 'Usa filtro por competência'
            TabOrder = 2
          end
        end
        object grpCompetencia: TGroupBox
          Left = 376
          Top = 232
          Width = 369
          Height = 73
          Caption = ' Competência dos itens de atualização gerados '
          TabOrder = 8
          object Label15: TLabel
            Left = 16
            Top = 26
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label2: TLabel
            Left = 240
            Top = 26
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 40
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMes: TComboBox
            Left = 16
            Top = 40
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
            TabOrder = 2
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object btnCancelaAltera: TfcShapeBtn
          Left = 560
          Top = 320
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancelaAlteraClick
        end
        object DBrdgDebito: TRadioGroup
          Left = 16
          Top = 280
          Width = 162
          Height = 71
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 2
          Items.Strings = (
            'Contas a Receber'
            'Folha de Pagamento'
            'Manter Forma Atual')
          ParentFont = False
          TabOrder = 2
          OnClick = DBrdgDebitoClick
        end
        object pnlCAR: TPanel
          Left = 192
          Top = 288
          Width = 297
          Height = 57
          BevelOuter = bvNone
          TabOrder = 3
          object Label30: TLabel
            Left = 0
            Top = 10
            Width = 231
            Height = 13
            Caption = 'Conta de Caixa x Forma de Recebimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 0
            Top = 24
            Width = 281
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
            LookupField = 'CODPORTFORMA'
            ParentFont = False
            TabOrder = 0
            Visible = False
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object btnContinuaEncerra: TfcShapeBtn
          Left = 656
          Top = 320
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
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaEncerraClick
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 16
          Top = 35
          Width = 729
          Height = 238
          Selected.Strings = (
            'FLGESCOLHA'#9'4'#9'Tratar'#9'F'
            'ITEDESCRICAO'#9'35'#9'Item'#9'F'
            'IDCONTRATOEMPTMO'#9'9'#9'Contrato'#9'F'
            'HMEPARCELA'#9'5'#9'Parc.'#9'F'
            'COMPETENCIA'#9'7'#9'Comp.'#9'F'
            'COBRANCA'#9'7'#9'Cobr.'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'HMEDATAPREVISTA'#9'10'#9'Previsão'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor Prev.'#9'F'
            'HMETXJUROS'#9'10'#9'Tx. Juros'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsHistMov
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel1: TPanel
          Left = 15
          Top = 8
          Width = 730
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens Divergentes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnInverteSelecao: TBitBtn
            Left = 675
            Top = 1
            Width = 27
            Height = 25
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnInverteSelecaoClick
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
          object btnMarcaTodos: TBitBtn
            Left = 702
            Top = 1
            Width = 27
            Height = 25
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnMarcaTodosClick
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
          object chkTodos: TCheckBox
            Left = 11
            Top = 5
            Width = 206
            Height = 17
            Caption = 'Processar TODOS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 16
          Top = 35
          Width = 729
          Height = 262
          Selected.Strings = (
            'EVENTO'#9'18'#9'Evento'#9'F'
            'ANOMES'#9'8'#9'Compet.'#9'F'
            'HMEPARCELA'#9'4'#9'Parc'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'IteDescricao'#9'36'#9'Item'#9'F'
            'HMEDATAPREVISTA'#9'11'#9'Data Vencto.'#9'F'
            'HMEVLRPREVISTO'#9'14'#9'Valor Previsto'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
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
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel4: TPanel
          Left = 15
          Top = 8
          Width = 730
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens Calculados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object btnConfirmar: TfcShapeBtn
          Left = 656
          Top = 320
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
            0400000000000001000000000000000000001000000010000000000000000000
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmarClick
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 560
          Top = 320
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn1Click
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 591
      DockPos = 610
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(CNT.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                         '#39'C'#39','#39'Cancelado'#39','
      '                         '#39'E'#39','#39'Encerrado'#39','
      '                         '#39'Q'#39','#39'Quitado'#39','
      '                         '#39'R'#39','#39'Refinanciado'#39','
      '                         '#39'S'#39','#39'Suspenso'#39','
      
        '                         '#39'K'#39','#39'Pendente de Quitação'#39') AS DESCSITC' +
        'ONTRATO,'
      ''
      '  SIT.IDSITPART,'
      '  SIT.DESCRICAO AS SITUACAO,'
      '  SIT.FLGINTERNO,'
      '  PLV.NOME      AS PLANOPREV,'
      '  JUR.NOME      AS PATRO,'
      '  ELP.MATRICULA,'
      '  TIT.NOME      AS TITULAR,'
      '  BEN.NOME      AS BENEFICIARIO,'
      ''
      '  TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      ''
      '  TEM.DESCTIPOEMPTMO,'
      '  INS.DATAINSC,'
      '  BAN.NOME AS BANCO,'
      '  CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      
        '  CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA      ' +
        ' , CNT.IDBENEF     ,'
      
        '  CNT.IDINSCRICAOEMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO       ' +
        ' , CNT.IDVERBA     ,'
      '  CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIA    , CNT.NUMPARCELAS ,'
      
        '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC  ' +
        ' , CNT.DATACANC    ,'
      
        '  CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATURA' +
        ' , CNT.DATAPRIMPARC,'
      
        '  CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS       ' +
        ' ,'
      
        '  CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG   ' +
        ' , CNT.MOECODIGO   ,'
      '  CNT.VLRSALBASE       , CNT.VLRMARGEM      , CNT.VLRMAXPERMIT,'
      ''
      '  MOE.MOESIGLA'
      ''
      'FROM'
      '   PESSOA          JUR,'
      '   PESSOA          TIT,'
      '   PESSOA          BEN,'
      '   PESSOA          BAN,'
      '   AGENCIABANCARIA AGB,'
      '   CONTABANCARIA   CTB,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   MOEDA           MOE,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM,'
      '   SITPART         SIT,'
      '   CONTRATOEMPTMO  CNT,'
      '   INSCRICAOEMPTMO INS,'
      '   PLANPREV        PLV'
      ''
      ''
      'WHERE'
      '   CNT.IDCONTRATOEMPTMO      = :PIDCONTRATOEMPTMO'
      '   AND PPP.FLGDESATIVADO     = 0'
      ''
      '   AND CNT.IDPATRO           = PPP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND PLV.IDPLANOPREV       = PPP.IDPLANOPREV'
      ''
      '   AND CNT.IDPATRO           = JUR.IDPESSOA'
      '   AND CNT.IDPESSOA          = ELP.IDPESSOA'
      '   AND CNT.IDPATRO           = ELP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = TIT.IDPESSOA'
      '   AND CNT.IDBENEF           = BEN.IDPESSOA'
      '   AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO(+)'
      '   AND INS.IDCBANCARIA       = CTB.IDCBANCARIA(+)'
      '   AND CTB.IDAGENCIA         = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO           = BAN.IDPESSOA(+)'
      '   AND CNT.MOECODIGO         = MOE.MOECODIGO(+)')
    ValidateWithMask = True
    Left = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDContratoEmptmo'
        ParamType = ptInput
      end>
    object qryINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
    end
    object qryVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
    end
    object qryVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
    end
    object qryMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 344
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 504
    Top = 24
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDESC' +
        'RICAO,'
      ' '#39'Atualização Débito'#39' AS EVENTO,'
      ' '#39'0000/00'#39' AS ANOMES,'
      ''
      
        ' HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANC' +
        'A ,'
      
        ' HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO ' +
        '  ,'
      
        ' HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV  ' +
        '  ,'
      ' HME.HMETXJUROS       , HME.HMEPARCELA'
      ''
      'FROM'
      ' HISTMOVEMPTMO HME'
      'WHERE'
      ' HME.IDCONTRATOEMPTMO = -1'
      ''
      ' '
      ' '
      '')
    UpdateObject = UpdHistMov
    ValidateWithMask = True
    Left = 504
    Top = 12
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovVirtualHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovVirtualHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      Alignment = taCenter
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryHistMovVirtualHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'0'#39' AS FLGESCOLHA,'
      ''
      
        '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRAN' +
        'CA ,'
      
        '  HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO' +
        '   ,'
      
        '  HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV ' +
        '   ,'
      
        '  HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEFORMACOBR' +
        'ANCA,'
      
        '  HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRAN' +
        'CA,'
      '  HME.HMEDATAATUALIZA  , HME.HMENUMPARCELAS   ,'
      
        '  TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOMPETEN' +
        'CIA AS COMPETENCIA,'
      
        '  TO_CHAR(HME.HMEMESCOBRANCA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOBRANCA AS' +
        ' COBRANCA,'
      ''
      
        '  CEP.IDPATRO          , CEP.IDPLANOPREV      , CEP.DATAASSINATU' +
        'RA,'
      ''
      '  PPP.IDSITPART,'
      ''
      '  STP.FLGINTERNO,'
      ''
      '  PES.NOME,'
      ''
      '  ITE.ITEDESCRICAO'
      ''
      'FROM'
      
        '   PESSOA PES, HISTMOVEMPTMO HME, PARTPREVPLAN PPP, CONTRATOEMPT' +
        'MO CEP,'
      
        '   SITPART STP, TIPOCONTREMPTMO TC, TIPOEMPTMO TE, ITEMEMPTMO IT' +
        'E'
      ''
      'WHERE'
      '       ( HME.FLGDIVERGPEND = 1 )'
      '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( TE.IDEMPRESAPROP      =:PIDEMPRESAPROP )'
      
        '   AND ( (:PIDTIPOEMPTMO       IS NULL) OR (TC.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDCONTRATOEMPTMO   IS NULL) OR (CEP.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO  IS NULL) OR (CEP.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDPATRO            IS NULL) OR (CEP.IDPATRO         ' +
        '  =:PIDPATRO) )'
      
        '   AND ( (:PIDPLANOPREV        IS NULL) OR (CEP.IDPLANOPREV     ' +
        '  =:PIDPLANOPREV) )'
      
        '   AND ( (:PIDPLANOPREV        IS NULL) OR (CEP.IDPLANOPREV     ' +
        '  =:PIDPLANOPREV) )'
      
        '   AND ( (:PHMEMESCOBRANCA     IS NULL) OR (HME.HMEMESCOBRANCA  ' +
        '  =:PHMEMESCOBRANCA) )'
      
        '   AND ( (:PHMEANOCOBRANCA     IS NULL) OR (HME.HMEANOCOBRANCA  ' +
        '  =:PHMEANOCOBRANCA) )'
      
        '   AND ( (:PHMEMESCOMPETENCIA  IS NULL) OR (HME.HMEMESCOMPETENCI' +
        'A =:PHMEMESCOMPETENCIA) )'
      
        '   AND ( (:PHMEANOCOMPETENCIA  IS NULL) OR (HME.HMEANOCOMPETENCI' +
        'A =:PHMEANOCOMPETENCIA) )'
      '   AND ( PPP.FLGDESATIVADO     = 0 )'
      '   AND ( PPP.SEQPROPOSTA       = 1 )'
      '   AND ( CEP.IDPLANOPREV       = PPP.IDPLANOPREV )'
      '   AND ( CEP.IDPATRO           = PPP.IDPESSJUR )'
      '   AND ( CEP.IDPESSOA          = PPP.IDPESSOA )'
      '   AND ( HME.IDCONTRATOEMPTMO  = CEP.IDCONTRATOEMPTMO )'
      '   AND ( PPP.IDSITPART         = STP.IDSITPART )'
      '   AND ( CEP.IDBENEF           = PES.IDPESSOA )'
      '   AND ( CEP.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO )'
      '   AND ( HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   HME.IDCONTRATOEMPTMO, HME.HMEPARCELA'
      ''
      ''
      '')
    UpdateObject = updHistMovVirtual
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 416
    Top = 48
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
        Name = 'PIDPATRO'
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
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
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
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
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
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end>
    object qryHistMovFLGESCOLHA: TStringField
      FieldName = 'FLGESCOLHA'
      OnChange = qryHistMovFLGESCOLHAChange
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
      ReadOnly = True
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
      ReadOnly = True
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
      ReadOnly = True
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
      ReadOnly = True
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      ReadOnly = True
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      ReadOnly = True
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      Alignment = taCenter
      FieldName = 'HMEDATAPREVISTA'
      ReadOnly = True
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      ReadOnly = True
      DisplayFormat = '###,###,###.00'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      ReadOnly = True
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      ReadOnly = True
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      ReadOnly = True
    end
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryHistMovIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryHistMovDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryHistMovIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryHistMovFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryHistMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 81
    end
    object qryHistMovCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 81
    end
  end
  object dtsHistMov: TwwDataSource
    DataSet = qryHistMov
    Left = 416
    Top = 12
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 504
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 648
  end
  object UpdHistMov: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEPARCELA = :HMEPARCELA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  HMEFORMACOBRANCA = :HMEFORMACOBRANCA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMEPRIORIDADE = :HMEPRIORIDADE,'
      '  HMECENTRALIZA = :HMECENTRALIZA,'
      '  IDITEMCENTRALIZA = :IDITEMCENTRALIZA,'
      '  HMEDATA = :HMEDATA,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEDATAEFETIVA = :HMEDATAEFETIVA,'
      '  HMEDATAATUALIZA = :HMEDATAATUALIZA,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMEANOCOBRANCA = :HMEANOCOBRANCA,'
      '  HMEMESCOBRANCA = :HMEMESCOBRANCA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMEVLREFETIVO = :HMEVLREFETIVO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  IDREGRA = :IDREGRA,'
      '  FLGSUSPENSAO = :FLGSUSPENSAO,'
      '  FLGESTORNADO = :FLGESTORNADO,'
      '  FLGBAIXADO = :FLGBAIXADO,'
      '  FLGABONADO = :FLGABONADO,'
      '  FLGENVIO = :FLGENVIO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  PLNCODIGOESTORNO = :PLNCODIGOESTORNO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  IDRATEIODOCUM = :IDRATEIODOCUM,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  HMERECPAG = :HMERECPAG,'
      '  HMEORIGEM = :HMEORIGEM,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  HMEDESTACADO = :HMEDESTACADO,'
      '  FLGDIVERGPEND = :FLGDIVERGPEND,'
      '  HMEANOSUSPENSAO = :HMEANOSUSPENSAO,'
      '  HMEMESSUSPENSAO = :HMEMESSUSPENSAO,'
      '  HMENUMPARCELAS = :HMENUMPARCELAS'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      '  (IDHISTMOVEMPTMO, IDCONTRATOEMPTMO, IDITEMEMPTMO, '
      'HMEPARCELA, HMETIPOMOV, '
      '   HMEFORMACOBRANCA, HMESEQCOBRANCA, HMEPRIORIDADE, '
      'HMECENTRALIZA, IDITEMCENTRALIZA, '
      '   HMEDATA, HMEDATAPREVISTA, HMEDATAEFETIVA, HMEDATAATUALIZA, '
      'HMEANOCOMPETENCIA, '
      '   HMEMESCOMPETENCIA, HMEANOCOBRANCA, HMEMESCOBRANCA, '
      'HMEVLRPREVISTO, HMEVLREFETIVO, '
      '   HMESALDODEV, HMETXJUROS, IDREGRA, FLGSUSPENSAO, '
      'FLGESTORNADO, FLGBAIXADO, '
      '   FLGABONADO, FLGENVIO, PLNCODIGO, PLNCODIGOESTORNO, '
      'CODDOCUMENTO, NUMLANCTO, '
      '   IDRATEIODOCUM, IDRUBRICA, HMERECPAG, HMEORIGEM, '
      'TRGDTINCLUSAO, TRGUSERINCLUSAO, '
      '   HMEDESTACADO, FLGDIVERGPEND, HMEANOSUSPENSAO, '
      'HMEMESSUSPENSAO, HMENUMPARCELAS)'
      'values'
      '  (:IDHISTMOVEMPTMO, :IDCONTRATOEMPTMO, :IDITEMEMPTMO, '
      ':HMEPARCELA, :HMETIPOMOV, '
      '   :HMEFORMACOBRANCA, :HMESEQCOBRANCA, :HMEPRIORIDADE, '
      ':HMECENTRALIZA, '
      
        '   :IDITEMCENTRALIZA, :HMEDATA, :HMEDATAPREVISTA, :HMEDATAEFETIV' +
        'A, '
      ':HMEDATAATUALIZA, '
      '   :HMEANOCOMPETENCIA, :HMEMESCOMPETENCIA, :HMEANOCOBRANCA, '
      ':HMEMESCOBRANCA, '
      '   :HMEVLRPREVISTO, :HMEVLREFETIVO, :HMESALDODEV, :HMETXJUROS, '
      ':IDREGRA, '
      '   :FLGSUSPENSAO, :FLGESTORNADO, :FLGBAIXADO, :FLGABONADO, '
      ':FLGENVIO, :PLNCODIGO, '
      
        '   :PLNCODIGOESTORNO, :CODDOCUMENTO, :NUMLANCTO, :IDRATEIODOCUM,' +
        ' '
      ':IDRUBRICA, '
      '   :HMERECPAG, :HMEORIGEM, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, '
      ':HMEDESTACADO, '
      '   :FLGDIVERGPEND, :HMEANOSUSPENSAO, :HMEMESSUSPENSAO, '
      ':HMENUMPARCELAS)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    Left = 416
  end
end
