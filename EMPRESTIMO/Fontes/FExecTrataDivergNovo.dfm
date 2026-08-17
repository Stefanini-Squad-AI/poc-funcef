inherited frmExecTrataDivergNovo: TfrmExecTrataDivergNovo
  Left = 69
  Top = 72
  HelpContext = 150027
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Tratamento de Divergências'
  ClientHeight = 450
  ClientWidth = 788
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    Height = 417
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
      Width = 788
      Height = 384
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label5: TLabel
          Left = 400
          Top = 90
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label1: TLabel
          Left = 16
          Top = 130
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label7: TLabel
          Left = 16
          Top = 90
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label8: TLabel
          Left = 400
          Top = 130
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 672
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
          TabOrder = 14
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 400
          Top = 104
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
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTipoContrEmptmo'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboPatro: TwwDBLookupCombo
          Left = 16
          Top = 144
          Width = 369
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
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 369
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboPlano: TwwDBLookupCombo
          Left = 400
          Top = 144
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
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object Panel2: TPanel
          Left = 400
          Top = 176
          Width = 369
          Height = 57
          TabOrder = 7
          object Label3: TLabel
            Left = 112
            Top = 10
            Width = 128
            Height = 13
            Caption = 'Mês/Ano de Cobrança'
          end
          object chkCobranca: TCheckBox
            Left = 16
            Top = 26
            Width = 105
            Height = 17
            Caption = 'aplicar filtro:   '
            TabOrder = 0
          end
          object dbspAnoCob: TwwDBSpinEdit
            Left = 256
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMesCobranca: TComboBox
            Left = 112
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
        end
        object Panel5: TPanel
          Left = 16
          Top = 176
          Width = 369
          Height = 57
          TabOrder = 6
          object Label4: TLabel
            Left = 112
            Top = 10
            Width = 147
            Height = 13
            Caption = 'Mês/Ano de Competência'
          end
          object chkCompetencia: TCheckBox
            Left = 16
            Top = 26
            Width = 105
            Height = 17
            Caption = 'aplicar filtro:   '
            TabOrder = 0
          end
          object dbspAnoComp: TwwDBSpinEdit
            Left = 256
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMesCompet: TComboBox
            Left = 112
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
        end
        object grpCompetencia: TGroupBox
          Left = 424
          Top = 240
          Width = 345
          Height = 89
          Caption = ' Competência dos itens de atualização gerados '
          TabOrder = 9
          object Label15: TLabel
            Left = 16
            Top = 18
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label2: TLabel
            Left = 232
            Top = 18
            Width = 76
            Height = 13
            Caption = 'Data Vencto.'
          end
          object Label6: TLabel
            Left = 102
            Top = 64
            Width = 127
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Lançamento: '
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 152
            Top = 32
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = cboMesExit
          end
          object cboMes: TComboBox
            Left = 16
            Top = 32
            Width = 137
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
          object edtDataVencto: TwwDBDateTimePicker
            Left = 232
            Top = 32
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
          object edtDataLancto: TwwDBDateTimePicker
            Left = 232
            Top = 60
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
            TabOrder = 3
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 240
          Width = 393
          Height = 89
          Caption = ' Itens a Tratar: '
          TabOrder = 8
          object chkRecebInesperado: TCheckBox
            Left = 8
            Top = 64
            Width = 177
            Height = 17
            Caption = 'Recebimentos inesperados'
            TabOrder = 4
          end
          object chkRecebidoMenor: TCheckBox
            Left = 8
            Top = 16
            Width = 177
            Height = 17
            Caption = 'Valores recebidos a menor'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkRecebidoMaior: TCheckBox
            Left = 8
            Top = 40
            Width = 169
            Height = 17
            Caption = 'Valores recebidos a maior'
            TabOrder = 2
          end
          object chkDivergData: TCheckBox
            Left = 192
            Top = 64
            Width = 153
            Height = 17
            Caption = 'Divergência de datas'
            TabOrder = 5
          end
          object chkValorEmAberto: TCheckBox
            Left = 192
            Top = 16
            Width = 193
            Height = 17
            Caption = 'Valores AINDA não recebidos'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkNaoSeraoPagos: TCheckBox
            Left = 192
            Top = 40
            Width = 185
            Height = 17
            Caption = 'Valores não recebidos'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
        end
        inline molMutuario: TmolMutuario
          Left = 8
          Top = 8
          Width = 689
          Height = 41
          Visible = False
          inherited btnBuscaPart: TBitBtn
            Left = 632
            OnClick = molMutuariobtnBuscaPartClick
          end
          inherited btnLimpaPart: TBitBtn
            Left = 656
            OnClick = molMutuariobtnLimpaPartClick
          end
          inherited edtNome: TEdit
            Width = 433
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 48
          Width = 689
          Height = 41
          TabOrder = 1
          inherited edtNome: TEdit
            Width = 433
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 632
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 656
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        object chkNAOContabiliza: TCheckBox
          Left = 7
          Top = 336
          Width = 305
          Height = 17
          Caption = 'Apenas tratar divergências, SEM contabilização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object chkNAOGera: TCheckBox
          Left = 384
          Top = 380
          Width = 385
          Height = 17
          Caption = 'Apenas contabilizar Itens de encargos já gerados'
          Color = clGray
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 15
          Visible = False
        end
        object chkMarcaDivergentes: TCheckBox
          Left = 7
          Top = 358
          Width = 385
          Height = 17
          Caption = 'Marca todos os itens em aberto como Divergentes'
          Checked = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 11
        end
        object chkInArquivo: TCheckBox
          Left = 315
          Top = 336
          Width = 265
          Height = 17
          Caption = 'Considerar APENAS matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object chkNotInArquivo: TCheckBox
          Left = 315
          Top = 358
          Width = 265
          Height = 17
          Caption = 'NÃO considerar matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object btEfetiva: TButton
          Left = 592
          Top = 346
          Width = 75
          Height = 25
          Caption = 'Efetiva'
          Enabled = False
          TabOrder = 16
          OnClick = btEfetivaClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object lblQuantItens: TLabel
          Left = 688
          Top = 296
          Width = 87
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '100.000 Itens'
        end
        object btnCancelaAltera: TfcShapeBtn
          Left = 576
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancelaAlteraClick
        end
        object DBrdgDebito: TRadioGroup
          Left = 16
          Top = 296
          Width = 161
          Height = 73
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
          Left = 400
          Top = 296
          Width = 289
          Height = 41
          BevelOuter = bvNone
          TabOrder = 3
          object Label30: TLabel
            Left = 8
            Top = 2
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
            Left = 8
            Top = 16
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
        object DBgrdHistMov: TwwDBGrid
          Left = 2
          Top = 30
          Width = 781
          Height = 259
          ControlType.Strings = (
            'FLGESCOLHA;CheckBox;1;0')
          Selected.Strings = (
            'FLGESCOLHA'#9'2'#9' '#9'F'
            'IDCONTRATOEMPTMO'#9'29'#9'Contrato'#9'F'
            'MATRICULA'#9'23'#9'Matricula'#9'F'
            'CONCAT_PARCELAS'#9'15'#9'Parcelas'#9'F'
            'HMEVLRPREVISTO'#9'27'#9'Valor Previsto'#9'F'
            'HMEVLREFETIVO'#9'23'#9'Valor Efetivo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsHistMov
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
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel1: TPanel
          Left = 2
          Top = 4
          Width = 781
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
            Left = 729
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
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
            Left = 754
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
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
            Left = 16
            Top = 6
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
          object bbtnParcela: TBitBtn
            Left = 606
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Seleciona Parcelas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnParcelaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
              00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
              00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
              F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
              FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
              0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
              0033333337FFFFFF773333333000000003333333377777777333}
            NumGlyphs = 2
          end
          object bbtnEncargos: TBitBtn
            Left = 631
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Seleciona Encargos'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Visible = False
            OnClick = bbtnEncargosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
              333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
              300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
              333337F373F773333333303330033333333337F3377333333333303333333333
              333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
              333337777F337F33333330330BB00333333337F373F773333333303330033333
              333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
              333377777F77377733330BBB0333333333337F337F33333333330BB003333333
              333373F773333333333330033333333333333773333333333333}
            NumGlyphs = 2
          end
          object btnPrestacaoNao: TBitBtn
            Left = 667
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Desmarca registros com mesmo nº de parcela que o registro atual'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnPrestacaoNaoClick
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              0000888888888888000088891888198800008889918199880000888899199888
              0000888889918888000088881999188800008881998991880000888998889988
              0000888888888888000088888888888800008888888888880000}
          end
          object btnPrestacaoSim: TBitBtn
            Left = 692
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Marca registros com mesmo nº de parcela que o registro atual'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnPrestacaoSimClick
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              0000888888888888000088884888888800008882248888880000882222488888
              0000882282248888000088288822488800008888888224880000888888882288
              0000888888888288000088888888888800008888888888880000}
          end
        end
        object rgOpcoes: TRadioGroup
          Left = 192
          Top = 296
          Width = 201
          Height = 73
          Caption = ' Opções '
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Calcular Encargos'
            'Ignorar (datas)'
            'Apenas atualizar vencimento')
          TabOrder = 5
        end
        object btnContinuaEncerra: TfcShapeBtn
          Left = 672
          Top = 344
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaEncerraClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 32
          Top = 31
          Width = 729
          Height = 302
          Selected.Strings = (
            'IDCONTRATOEMPTMO'#9'10'#9'Contrato'#9'F'
            'HMEPARCELA'#9'4'#9'Parc'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'EVENTO'#9'18'#9'Evento'#9'F'
            'IteDescricao'#9'27'#9'Item'#9'F'
            'ANOMES'#9'8'#9'Compet.'#9'F'
            'HMEDATAPREVISTA'#9'11'#9'Data Vencto.'#9'F'
            'HMEVLRPREVISTO'#9'12'#9'Valor Previsto'#9'F')
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
          OnCalcCellColors = DBgrdHistMovVirtualCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel4: TPanel
          Left = 31
          Top = 4
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
        object fcShapeBtn1: TfcShapeBtn
          Left = 576
          Top = 344
          Width = 89
          Height = 29
          Caption = 'Cancelar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          Visible = False
          OnClick = fcShapeBtn1Click
        end
        object btnConfirmar: TfcShapeBtn
          Left = 672
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmarClick
        end
      end
    end
    object chkNaoCommit: TCheckBox
      Left = 680
      Top = 8
      Width = 97
      Height = 17
      Caption = 'NÃO Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 610
      DockPos = 610
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  object chkParcDifer: TCheckBox [2]
    Left = 496
    Top = 8
    Width = 153
    Height = 17
    Caption = 'Só parcelas diferentes'
    Checked = True
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    State = cbChecked
    TabOrder = 2
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
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
      '  SIT.IDSITPART,'
      '  SIT.DESCRICAO AS SITUACAO,'
      '  SIT.FLGINTERNO,'
      '  PLV.NOME      AS PLANOPREV,'
      '  JUR.NOME      AS PATRO,'
      '  ELP.MATRICULA,'
      '  TIT.NOME      AS TITULAR,'
      '  BEN.NOME      AS BENEFICIARIO,'
      '  TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      '  TEM.DESCTIPOEMPTMO,'
      '  INS.DATAINSC,'
      '  BAN.NOME AS BANCO,'
      '  CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      
        '  CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA      ' +
        ' , CNT.IDBENEF     ,'
      
        '  CNT.IDINSCRICAOEMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO       ' +
        ' , CNT.IDVERBA     ,'
      
        '  CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIADEB , CNT.NUMPARCELAS   ' +
        ' , CNT.IDCBANCARIA ,'
      
        '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC  ' +
        ' , CNT.DATACANC    ,'
      
        '  CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATURA' +
        ' , CNT.DATAPRIMPARC,'
      
        '  CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS       ' +
        ' ,'
      
        '  CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG   ' +
        ' , CNT.MOECODIGO   ,'
      
        '  CNT.VLRSALBASE       , CNT.VLRMARGEM      , CNT.VLRMAXPERMIT  ' +
        ' , CNT.IDPLANOORIGEM,'
      '  MOE.MOESIGLA,'
      
        '  CNT.MOECODIGO        , CNT.IDTIPOSUSPEMPTMO, CNT.DATAINICIOSUS' +
        'P, CNT.DATAFIMSUSP,'
      '  CNT.ANOSUSPENSAO     , CNT.MESSUSPENSAO    ,'
      '  TSE.TSEDESCRICAO'
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
      '   PLANPREV        PLV,'
      '   TIPOSUSPEMPTMO  TSE'
      'WHERE'
      '       CNT.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '   AND cnt.idplanoprev       = ppp.idplanoprev'
      '   AND ppp.idplanoprev       = plv.idplanoprev'
      '   AND CNT.IDPATRO           = PPP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = PPP.IDPESSOA'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
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
      '   AND CNT.MOECODIGO         = MOE.MOECODIGO(+)'
      '   AND CNT.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+)')
    ValidateWithMask = True
    Left = 304
    Top = 24
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
    object qryMOECODIGO_1: TFloatField
      FieldName = 'MOECODIGO_1'
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
    object qryTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
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
    Left = 560
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
      ' PREPARAHISTMOVEMPTMO HME'
      'WHERE'
      ' HME.IDCONTRATOEMPTMO = -1'
      ''
      ' '
      ' '
      ''
      ' ')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 560
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
      '  0 AS FLGESCOLHA,'
      '  HME.IDCONTRATOEMPTMO,'
      '  DECODE(NVL(PEP.FLGEXCEPCIONAL, 0), 0, ( '
      
        '                                         TO_CHAR(NVL(HME.HMEPARC' +
        'ELA, 0),      '#39'00'#39') || '#39' / '#39' || '
      
        '                                         TO_CHAR(NVL(HME.HMENUMP' +
        'ARCELAS, 0),  '#39'00'#39') '
      '                                         ), '
      '                                      1, ( '
      
        '                                         TO_CHAR(NVL(HME.HMEPARC' +
        'ELAALT, 0),   '#39'00'#39') || '#39' / '#39' || '
      
        '                                         TO_CHAR(NVL(HME.HMEPARC' +
        'ELA, 0),      '#39'00'#39') || '#39' / '#39' || '
      
        '                                         TO_CHAR(NVL(HME.HMENUMP' +
        'ARCELAS, 0),  '#39'00'#39') '
      '                                         ) '
      '         ) AS CONCAT_PARCELAS, '
      '  NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'
      '  NVL(HME.HMEVLRPREVISTO,0) AS HMEVLRPREVISTO,'
      '  NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO,'
      '  HME.HMEPARCELA '
      'FROM'
      '   PESSOA          PES,'
      '   PARTPREVPLAN    PPP,'
      '   CONTRATOEMPTMO  CON,'
      '   ELEGPATRO       ELP, '
      '   DEPENTIT        DEP, '
      '   SITPART         STP, '
      '   PARAMEMPTMO     PEP, '
      '   TIPOCONTREMPTMO TC,  '
      '   TIPOEMPTMO      TE,  '
      '   ('
      '    SELECT '
      '        HME.IDCONTRATOEMPTMO,  '
      '        HME.HMEPARCELA,'
      '        HME.HMEPARCELAALT,'
      '        HME.HMENUMPARCELAS,'
      '        SUM(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO,'
      '        SUM(HME.HMEVLREFETIVO)  AS HMEVLREFETIVO'
      '    FROM'
      '        PREPARAHISTMOVEMPTMO   HME,'
      '        CONTRATOEMPTMO  CON,'
      '        TIPOSUSPEMPTMO  TSE'
      '    WHERE'
      '        HME.FLGDIVERGPEND        = 1'
      
        '    AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       =' +
        ' 1 )'
      
        '    AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, '#39'0000'#39'))) || LT' +
        'RIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39'))) ) < '#39'200707'#39
      '    AND NVL(HME.FLGESTORNADO, 0) = 0'
      '    AND NVL(HME.FLGABONADO, 0)   = 0'
      '    AND NVL(HME.FLGQUITADO, 0)   = 0'
      '    AND ( HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) )'
      '    AND ( HME.FLGTIPODIVERG IN (1,6) )'
      '    AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '    AND CON.FLGSITUACAO          NOT IN ('#39'C'#39', '#39'Q'#39' )'
      '    AND HME.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+)'
      '    AND ('
      '         NVL(HME.FLGSUSPENSAO, 0) = 0 OR'
      
        '         (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO,' +
        ' 0) = 1)'
      '        )'
      '    AND CON.IDCONTRATOEMPTMO    = -1'
      '    GROUP BY'
      '        HME.IDCONTRATOEMPTMO,'
      '        HME.HMEPARCELA,'
      '        HME.HMEPARCELAALT,'
      '        HME.HMEPARCELA,'
      '        HME.HMENUMPARCELAS'
      '   ) HME'
      'WHERE'
      '       PEP.IDEMPRESAPROP       = 1'
      '   AND TE.IDEMPRESAPROP        = 1'
      '   AND CON.IDPATRO             = PPP.IDPESSJUR'
      '   AND CON.IDPESSOA            = PPP.IDPESSOA'
      '   AND PPP.FLGDESATIVADO       = 0'
      '   AND PPP.IDSITPART           = STP.IDSITPART'
      '   AND CON.IDBENEF             = PES.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO'
      '   AND CON.IDPATRO             = ELP.IDPESSJUR'
      '   AND CON.IDPESSOA            = ELP.IDPESSOA'
      '   AND CON.IDPESSOA            = DEP.IDTITULAR'
      '   AND CON.IDBENEF             = DEP.IDPESSOA'
      '   AND HME.IDCONTRATOEMPTMO    = CON.IDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO         NOT IN ('#39'C'#39', '#39'Q'#39' )'
      '   AND CON.IDCONTRATOEMPTMO    = -1'
      'ORDER BY'
      '   MATRICULA, HME.IDCONTRATOEMPTMO, HME.HMEPARCELA'
      ''
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 472
  end
  object dtsHistMov: TwwDataSource
    AutoEdit = False
    DataSet = cdsHistMov
    Left = 400
    Top = 24
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update PREPARAHISTMOVEMPTMO'
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
      'insert into PREPARAHISTMOVEMPTMO'
      
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
      'delete from PREPARAHISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 560
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 640
  end
  object cdsHistMov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvHistMov'
    Left = 400
    Top = 12
    object cdsHistMovFLGESCOLHA: TFloatField
      FieldName = 'FLGESCOLHA'
    end
    object cdsHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object cdsHistMovCONCAT_PARCELAS: TStringField
      FieldName = 'CONCAT_PARCELAS'
      Size = 15
    end
    object cdsHistMovMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object cdsHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
  end
  object prvHistMov: TDataSetProvider
    DataSet = qryHistMov
    Constraints = True
    Left = 400
  end
  object qryItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.IDITEMEMPTMO,'
      '   DECODE(HME.HMETIPOMOV, -2, -2,'
      '                          -1, -1,'
      '                           0,  0,'
      '                           1,  2,'
      '                           2,  6,'
      '                           3,  9,'
      '                           4,  7,'
      '                           5,  1,'
      '                           6,  3,'
      '                           7,  4,'
      '                           8,  5,'
      '                               8'
      '         ) AS ORDENACAO,'
      
        '   HME.HMETIPOMOV, HME.HMEORIGEM,  HME.HMESEQCOBRANCA, HME.IDITE' +
        'MCENTRALIZA,'
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      
        '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.HMEPRIORIDADE, HME.H' +
        'MERECPAG,'
      
        '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HME' +
        'DATAATUALIZA, HME.HMEDATAVENCTO,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRA' +
        'NCA, HME.HMEMESCOBRANCA,'
      
        '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.H' +
        'METXJUROS, HME.IDREGRA,'
      '   HME.HMEFORMACOBRANCA, HME.IDRUBRICA,'
      '   NVL(HME.FLGENVIO, 1)       AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO,'
      '   NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO,'
      '   NVL(HME.FLGABONADO, 0)     AS FLGABONADO,'
      '   NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND,'
      '   NVL(HME.FLGTIPODIVERG, 0 ) AS FLGTIPODIVERG,'
      '   DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0,'
      
        '                                       NVL(NVL(HME.IDTIPOSUSPEMP' +
        'TMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0))'
      '         ) AS FLGSUSPENSAO,'
      '   ITE.ITEDESCRICAO,'
      '   HME.CODDOCUMENTO,'
      '   HME.PLNCODIGO,'
      '   HME.PLNCODIGOESTORNO'
      'FROM'
      '   PREPARAHISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMEMPTMO     ITE'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMEPARCELA         =:PHMEPARCELA )'
      '   AND ('
      '         (:PTODOS = 1)          OR'
      '         (:PTODOS = 0 AND ROWNUM  = 1)'
      '       )'
      '   AND ('
      '         (:PABONODIVERG         = 1)  OR'
      '         (NVL(HME.FLGABONADO, 0)    = 0)'
      '       )'
      '   AND ( ITE.IDITEMEMPTMO       > 0 )'
      '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) )'
      '   AND ( NVL(HME.FLGESTORNADO, 0)   = 0 )'
      '   AND ( NVL(HME.FLGQUITADO, 0)     = 0 )'
      '   AND ( NVL(HME.FLGBAIXADO, 1)     = 0 )'
      '   AND ( NVL(HME.FLGDIVERGPEND, 0)  = 1 )'
      '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 56
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
      end
      item
        DataType = ftInteger
        Name = 'PTODOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PTODOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONODIVERG'
        ParamType = ptInput
      end>
    object qryItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryItensHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryItensHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryItensHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryItensHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
    end
    object qryItensHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryItensHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryItensHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryItensHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryItensHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryItensHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryItensHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryItensHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryItensFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryItensFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryItensFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryItensFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryItensFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryItensIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryItensORDENACAO: TFloatField
      FieldName = 'ORDENACAO'
    end
    object qryItensHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryItensFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryItensCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryItensPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryItensHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryItensIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryItensHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryItensHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryItensIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
  end
  object SP_EFETIVA: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_EFETIVADIVERGENCIA'
    Left = 720
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'ERRO'
        ParamType = ptOutput
      end>
  end
end
