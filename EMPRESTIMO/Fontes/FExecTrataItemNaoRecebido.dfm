inherited frmExecTrataItemNaoRecebido: TfrmExecTrataItemNaoRecebido
  Left = 207
  Top = 1
  HelpContext = 150028
  Caption = 'Tratamento de Itens não recebidos'
  ClientHeight = 633
  ClientWidth = 778
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 778
    Height = 600
    inherited Panel1: TPanel [0]
      Width = 778
      inherited fcLabel1: TfcLabel
        Width = 468
        Caption = 'Tratamento de Itens não recebidos [ seleção ] '
      end
    end
    inherited pgcControle: TPageControl [1]
      Width = 778
      Height = 567
      inherited TabSheet1: TTabSheet
        object Label1: TLabel
          Left = 16
          Top = 43
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 392
          Top = 43
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 1
          Width = 753
          Height = 41
          inherited Label1: TLabel
            Left = 216
          end
          inherited Label3: TLabel
            Left = 112
          end
          inherited edtNome: TEdit
            Left = 216
            Width = 481
            TabOrder = 2
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 696
            TabOrder = 3
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 720
            TabOrder = 4
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
          inherited edtMatricula: TEdit
            Left = 112
            Width = 105
            TabOrder = 1
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 57
          Width = 361
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
          OnChange = DBcboTipoEmptmoChange
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 392
          Top = 57
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnChange = DBcboTipoContratoChange
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 81
          Width = 378
          Height = 126
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Top = 15
            Width = 361
            Height = 105
          end
          inherited btnInvertePatro: TBitBtn
            Left = 327
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 348
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 384
          Top = 81
          Width = 377
          Height = 121
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Left = 10
            Top = 15
            Width = 361
            Height = 105
          end
          inherited btnInvertePlano: TBitBtn
            Left = 327
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 348
          end
        end
        inline molListaCodigosCNAB: TmolListaCodigosCNAB
          Left = 8
          Top = 202
          Width = 440
          Height = 174
          TabOrder = 14
          OnClick = molListaCodigosCNABClick
          inherited Label6: TLabel
            Top = 6
            Width = 146
            Caption = '(Código) - Retorno Débito'
          end
          inherited lstCodigosCNAB: TCheckListBox
            Top = 20
            Width = 386
            Height = 119
          end
          inherited btnInverteCodigosCNAB: TBitBtn
            Left = 350
            Hint = 'Seleciona todas os Códigos CNAB'
            OnClick = molListaCodigosCNABClick
          end
          inherited btnMarcaTodosCodigosCNAB: TBitBtn
            Left = 372
            OnClick = molListaCodigosCNABbtnMarcaTodosCodigosCNABClick
          end
          inherited edtSelCodigosCNAB: TEdit
            Top = 142
          end
          inherited btnSelCodigosCNAB: TBitBtn
            Top = 141
          end
        end
        object rdgFormaCobranca: TRadioGroup
          Left = 16
          Top = 510
          Width = 305
          Height = 33
          Caption = ' NOVA Forma de Cobrança '
          Columns = 2
          Items.Strings = (
            'Financeiro'
            'Folha')
          TabOrder = 11
          OnClick = rdgFormaCobrancaClick
        end
        object Panel2: TPanel
          Left = 496
          Top = 381
          Width = 257
          Height = 43
          TabOrder = 6
          object Label15: TLabel
            Left = 26
            Top = 2
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 186
            Top = 16
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 26
            Top = 16
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
          object chkCobranca: TCheckBox
            Left = 6
            Top = 15
            Width = 16
            Height = 17
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 425
          Width = 305
          Height = 83
          Caption = ' Tratar: '
          TabOrder = 7
          object chkBenef: TCheckBox
            Left = 13
            Top = 18
            Width = 217
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 0
          end
          object chkPatro: TCheckBox
            Left = 13
            Top = 38
            Width = 217
            Height = 17
            Caption = 'Folha(s) da(s) Patrocinadora(s)'
            TabOrder = 1
          end
          object chkFinanceiro: TCheckBox
            Left = 13
            Top = 59
            Width = 217
            Height = 17
            Caption = 'Financeiro'
            TabOrder = 2
          end
        end
        object Panel3: TPanel
          Left = 496
          Top = 430
          Width = 257
          Height = 43
          TabOrder = 9
          object Label3: TLabel
            Left = 70
            Top = 2
            Width = 110
            Height = 13
            Caption = 'Nova Data Vencto.'
          end
          object edtDataVencto: TwwDBDateTimePicker
            Left = 70
            Top = 16
            Width = 113
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
        object chkEnvio: TCheckBox
          Left = 609
          Top = 524
          Width = 145
          Height = 17
          Caption = 'NÃO executar envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object pnlCAR: TPanel
          Left = 337
          Top = 473
          Width = 421
          Height = 46
          BevelOuter = bvNone
          TabOrder = 10
          object Label30: TLabel
            Left = 0
            Top = 4
            Width = 271
            Height = 13
            Caption = 'Conta-Caixa x Forma Recebimento Diferenciada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = -16
            Top = 59
            Width = 361
            Height = 4
            Shape = bsTopLine
          end
          object btnAtribuiParametro: TSpeedButton
            Left = 395
            Top = 19
            Width = 23
            Height = 22
            Hint = 'Seleciona tipo de recebimento padrão'
            Enabled = False
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
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAtribuiParametroClick
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 0
            Top = 20
            Width = 385
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
            LookupField = 'CODPORTFORMA'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object pnlCompetencia: TPanel
          Left = 16
          Top = 381
          Width = 464
          Height = 43
          TabOrder = 5
          object lblCompetencia: TLabel
            Left = 29
            Top = 3
            Width = 168
            Height = 13
            Caption = 'Competência (mês/ano) entre'
          end
          object lblE: TLabel
            Left = 236
            Top = 20
            Width = 8
            Height = 13
            Caption = 'e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBspnAnoCompetencia: TwwDBSpinEdit
            Left = 165
            Top = 17
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesCompetencia: TComboBox
            Left = 29
            Top = 17
            Width = 135
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
          object cboMesCompetenciaFim: TComboBox
            Left = 251
            Top = 17
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
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
          object DBspnAnoCompetenciaFim: TwwDBSpinEdit
            Left = 390
            Top = 17
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object chkCompetencia: TCheckBox
            Left = 9
            Top = 16
            Width = 16
            Height = 17
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
        end
        object pnlDataVencimentoCompetencia: TPanel
          Left = 336
          Top = 430
          Width = 144
          Height = 43
          TabOrder = 8
          object lblDataVencimento: TLabel
            Left = 16
            Top = 2
            Width = 116
            Height = 13
            Caption = 'Data de Vencimento'
          end
          object edtDataVenctoCompetencia: TwwDBDateTimePicker
            Left = 16
            Top = 17
            Width = 113
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
        object chkCalcEncargo: TCheckBox
          Left = 339
          Top = 524
          Width = 145
          Height = 17
          Caption = 'Calcular Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object chkInArquivo: TCheckBox
          Left = 410
          Top = 342
          Width = 345
          Height = 17
          Caption = 'Considerar APENAS Contratos do arquivo CONTRATOAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          OnClick = chkInArquivoClick
        end
        object chkNotInArquivo: TCheckBox
          Left = 410
          Top = 362
          Width = 345
          Height = 17
          Caption = 'NÃO considerar Contratos do arquivo CONTRATOAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          OnClick = chkNotInArquivoClick
        end
      end
      inherited TabSheet2: TTabSheet
        object Label4: TLabel
          Left = 16
          Top = 500
          Width = 92
          Height = 13
          Caption = 'Total Contratos:'
        end
        object Label5: TLabel
          Left = 20
          Top = 524
          Width = 180
          Height = 13
          Caption = 'Valor total Contratos/Encargos:'
        end
        object Label6: TLabel
          Left = 348
          Top = 524
          Width = 84
          Height = 13
          Caption = 'Total de Itens:'
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens a Desviar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnInverteSelecao: TBitBtn
            Left = 715
            Top = 3
            Width = 25
            Height = 23
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
            Left = 740
            Top = 3
            Width = 25
            Height = 23
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
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 4
          Top = 27
          Width = 770
          Height = 466
          Selected.Strings = (
            'FLGESCOLHA'#9'2'#9#9'F'
            'IDCONTRATOEMPTMO'#9'15'#9'Contrato'#9'F'
            'MATRICULA'#9'15'#9'MATRICULA'#9'F'
            'EVENTO'#9'15'#9'Evento'#9'F'
            'ANOMES'#9'8'#9'Comp.'#9'F'
            'PARCELAALT'#9'3'#9'Par'#9'F'
            'PARCELA'#9'3'#9'ce'#9'F'
            'NUMPARCELAS'#9'3'#9'las'#9'F'
            'SEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'ITEDESCRICAO'#9'21'#9'Item'#9'F'
            'DATAVENCTO'#9'10'#9'Vencto.'#9'F'
            'VLRPREVISTO'#9'13'#9'Valor Prev.'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsDesvio
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
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          object DBgrdHistMovIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object edtQtdeContrato: TEdit
          Left = 216
          Top = 496
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object edtVlrTotContrato: TEdit
          Left = 216
          Top = 520
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object edtTotItens: TEdit
          Left = 443
          Top = 520
          Width = 121
          Height = 21
          TabOrder = 4
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
        TabVisible = False
        object pnlInformaFinal: TPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Item Desviado / Envio Executado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 0
          Top = 27
          Width = 770
          Height = 530
          Selected.Strings = (
            'CONTRATO'#9'15'#9'Contrato'#9'F'
            'MATRICULA'#9'13'#9'Matrícula'#9'F'
            'MESCOBRANCA'#9'8'#9'Mês Cobr.'#9'F'
            'PAR'#9'3'#9'Par'#9'F'
            'CE'#9'3'#9'ce'#9'F'
            'LAS'#9'3'#9'las'#9'F'
            'ITEM'#9'30'#9'Item'#9'F'
            'NOVOVENCTO'#9'12'#9'Novo Vencto.'#9'F'
            'VALOR'#9'11'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
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
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 600
    Width = 778
    inherited tb97Fundo: TToolbar97
      Left = 606
      DockPos = 671
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   0 AS FLGESCOLHA, '
      '   0 AS VERIFICADOCUMENTO, '
      '   HE.CODDOCUMENTO, '
      '   HME.IDHISTMOVEMPTMO, '
      '   HME.IDCONTRATOEMPTMO, '
      '   HME.IDITEMEMPTMO,'
      '   ITE.ITEDESCRICAO, '
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '
      '   TO_CHAR(HME.DATAPREVISTA,'#39'MM/YYYY'#39')AS ANOMES, '
      '   HME.SEQCOBRANCA,'
      '   HME.VLRPREVISTO,'
      
        '   sum(HME.VLRPREVISTO) over(order by NVL(DEP.MATRICULA, ELP.MAT' +
        'RICULA),HME.IDCONTRATOEMPTMO) as tot_previsto,'
      '   (select sum(hec.VLRPREVISTO) from hmeprestacao hpr'
      
        '   join hmeencargos hec on hec.idcontratoemptmo=hpr.idcontratoem' +
        'ptmo'
      '   where hpr.idcontratoemptmo=HME.IDCONTRATOEMPTMO'
      '   and hpr.parcela=hec.parcela'
      '   and hpr.parcela=HME.PARCELA) as VLR_ENCARGOS,'
      
        '   (select COUNT(1) from hmeprestacao hpr                       ' +
        '   '
      
        '   left join hmeencargos hec on hec.idcontratoemptmo=hpr.idcontr' +
        'atoemptmo  '
      '   and hec.parcela = hpr.parcela         '
      
        '   where hpr.idcontratoemptmo=HME.IDCONTRATOEMPTMO              ' +
        '               '
      
        '   and hpr.parcela=HME.PARCELA) as TOT_ITENS,                   ' +
        '            '
      '   HME.DATAVENCTO, '
      '   HME.PARCELA,'
      '   HME.PARCELAALT,'
      '   HME.NUMPARCELAS, '
      '   DOC.STATUS,                           '
      '   TMP.SITENVIO ,                        '
      
        '   (SELECT COUNT(1) FROM RECBTOPAGTO REC WHERE REC.CODDOCUMENTO ' +
        '= HE.CODDOCUMENTO) AS DOCBAIXADOeRECEBIDO, '
      '   '#39'Prestação'#39' AS EVENTO '
      'FROM '
      '   HMEPRESTACAO HME'
      
        '   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTR' +
        'ATOEMPTMO '
      
        '   JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.IDTIP' +
        'OCONTREMPTMO'
      '   JOIN TIPOEMPTMO TEP ON TEP.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO'
      '   JOIN DEPENTIT DEP ON  DEP.IDTITULAR = CON.IDPESSOA'
      '                     AND DEP.IDPESSOA = CON.IDBENEF'
      '   JOIN ELEGPATRO ELP ON ELP.IDPESSOA = CON.IDPESSOA'
      '   JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO'
      
        '   LEFT JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HME.IDHISTMOVEM' +
        'PTMO'
      '   LEFT JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = HE.CODDOCUMENTO'
      '   LEFT JOIN TMPDESC TMP ON TMP.IDTMPDESC = HE.IDTMPDESC')
    UpdateObject = UpdHistMov
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 514
    Top = 216
    object qryHistMovFLGESCOLHA: TFloatField
      FieldName = 'FLGESCOLHA'
    end
    object qryHistMovVERIFICADOCUMENTO: TFloatField
      FieldName = 'VERIFICADOCUMENTO'
    end
    object qryHistMovPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryHistMovANOMES: TStringField
      FieldName = 'ANOMES'
      Size = 9
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object qryHistMovSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryHistMovSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryHistMovDOCBAIXADOeRECEBIDO: TFloatField
      FieldName = 'DOCBAIXADOeRECEBIDO'
    end
    object qryHistMovSEQCOBRANCA: TFloatField
      FieldName = 'SEQCOBRANCA'
    end
    object qryMovVLRPREVISTO: TFloatField
      FieldName = 'VLRPREVISTO'
    end
    object qryHistMovDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryHistMovPARCELAALT: TFloatField
      FieldName = 'PARCELAALT'
    end
    object qryHistMovNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object fltfldMovtot_previsto: TFloatField
      FieldName = 'tot_previsto'
    end
    object fltfldHistMovNVL_ENCARGOS: TFloatField
      FieldName = 'VLR_ENCARGOS'
    end
    object fltfldHistMovTOT_ITENS: TFloatField
      FieldName = 'TOT_ITENS'
    end
    object qryHistMovDATAPREVISTA: TDateTimeField
      FieldName = 'DATAPREVISTA'
    end
    object qryHistMovTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryHistMovFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
    end
  end
  object dsDesvio: TDataSource
    DataSet = qryHistMov
    Left = 456
    Top = 194
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 264
    Top = 232
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
    Left = 232
    Top = 233
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0                                          AS CONTRATO,'
      '   '#39'123456789012345'#39' AS MATRICULA,'
      '   0 AS PAR,'
      '   0 AS CE,'
      '   0 AS LAS,'
      '   '#39'0000/00'#39' AS MESCOBRANCA,'
      '   hme.hmedatavencto AS NOVOVENCTO,'
      '   '#39'0123456789012345678901234567890123456789'#39' AS ITEM,'
      '   0 AS VALOR'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    ValidateWithMask = True
    Left = 280
    Top = 160
    object qryHistMovVirtualCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object qryHistMovVirtualMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 15
    end
    object qryHistMovVirtualPAR: TFloatField
      FieldName = 'PAR'
    end
    object qryHistMovVirtualCE: TFloatField
      FieldName = 'CE'
    end
    object qryHistMovVirtualLAS: TFloatField
      FieldName = 'LAS'
    end
    object qryHistMovVirtualMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualITEM: TStringField
      FieldName = 'ITEM'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryHistMovVirtualNOVOVENCTO: TDateTimeField
      FieldName = 'NOVOVENCTO'
    end
  end
  object UpdHistMov: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA,'
      '  VERIFICADOCUMENTO = :VERIFICADOCUMENTO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO'
      ' ')
    Left = 512
    Top = 184
  end
  object qryUpdateForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   HMEFORMACOBRANCA =:PHMEFORMACOBRANCA,'
      '   HMETIPOFOLHA     = NULL,'
      '   FLGDIVERGPEND    = 0,'
      '   FLGTIPODIVERG    = NULL,'
      '   HMEDATARECEB     = NULL,'
      '   CODDOCUMENTO     = NULL,'
      '   IDTMPDESC        = NULL,'
      '   HMEANOCOBRANCA   =:PHMEANOCOBRANCA,'
      '   HMEMESCOBRANCA   =:PHMEMESCOBRANCA,'
      '   HMEDATAVENCTO    =:PHMEDATAVENCTO,'
      '   HMEDATAENVIO     = NULL,'
      '   FLGENVIO         = 0'
      'WHERE'
      '       IDHISTMOVEMPTMO  =:PIDHISTMOVEMPTMO'
      '   AND IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 588
    Top = 159
    ParamData = <
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
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
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object sprcTratParcAtraso: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.SP_TRAT_PARCELAS_EM_ATRASO'
    ValidateWithMask = True
    Left = 696
    Top = 175
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PNUMCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PINARQUIVO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PNOTINARQUIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATACALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PNUMPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTrataParcelaEnviada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pFlgEntradaManual'
        ParamType = ptInput
      end>
  end
  object qryUpdateParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      ' HISTMOVEMPTMO H'
      ''
      'SET '
      '      H.HMEDATAVENCTO       = :PHMEDATAVENCTO,'
      '      H.HMEMESCOBRANCA      = :PHMEMESCOBRANCA,'
      '      H.HMEANOCOBRANCA      = :PHMEANOCOBRANCA,'
      '      H.FLGENVIO            = 0,'
      '      H.CODDOCUMENTO        = NULL,'
      '      H.IDTMPDESC           = NULL'
      ''
      'WHERE'
      '          H.IDCONTRATOEMPTMO    = :PIDCONTRATOEMPTMO'
      'AND   H.HMETIPOMOV          = 4'
      'AND   H.HMEDESTACADO        = 1'
      'AND   H.HMEPARCELA          = :PIDPARCELA'
      'AND   NVL(H.FLGABONADO,0)   = 0'
      'AND   NVL(H.FLGQUITADO,0)   = 0'
      'AND   NVL(H.FLGESTORNADO,0) = 0'
      'AND   H.HMEDATAEFETIVA      IS NULL'
      'AND   H.HMEVLREFETIVO       IS NULL')
    ValidateWithMask = True
    Left = 590
    Top = 207
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
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
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDPARCELA'
        ParamType = ptUnknown
      end>
  end
  object qryEncargos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '        FROM hmeencargos he'
      '        WHERE he.idcontratoemptmo = :PIDCONTRATOEMPTMO'
      '        AND   he.parcela = :PIDPARCELA'
      '        AND   he.vlrefetivo IS NULL'
      '        AND   he.dataefetiva IS NULL'
      '        AND   he.flgquitabonoestorno = 0'
      '        AND   he.FLGENTRADAMANUAL = 1')
    UpdateObject = UpdEncargos
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 426
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidcontratoemptmo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPARCELA'
        ParamType = ptUnknown
      end>
  end
  object qryCalculos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 389
    Top = 244
  end
  object UpdEncargos: TUpdateSQL
    InsertSQL.Strings = (
      ' INSERT INTO HMEENCARGOS (IDHISTMOVEMPTMO,'
      '        IDCONTRATOEMPTMO,'
      '        IDITEMEMPTMO,'
      '        PARCELA,'
      '        PARCELAALT,'
      '        NUMPARCELAS,'
      '        ORIGEM,'
      '        FORMACOBRANCA,'
      '        TIPOFOLHA,'
      '        SEQCOBRANCA,'
      '        NATUREZAITEM,'
      '        DATAPREVISTA,'
      '        DATAEFETIVA,'
      '        DATAVENCTO,'
      '        VLRPREVISTO,'
      '        VLREFETIVO,'
      '        SALDODEV,'
      '        FLGENVIO,'
      '        FLGBAIXADO,'
      '        FLGBAIXAMANUAL,'
      '        RECPAG,'
      '        IDRUBRICA,'
      '        DATARECEB,'
      '        FLGQUITABONOESTORNO,'
      '        DATAQUITABONOESTORNO,'
      '        VLRBASE,'
      '        FLGENTRADAMANUAL,'
      '        VERSAO,'
      '        TRGDTINCLUSAO,'
      '        TRGUSERINCLUSAO)'
      ' VALUES('
      '        :IDCONTRATOEMPTMO,'
      '        :IDITEMEMPTMO,'
      '        :PARCELA,'
      '        :PARCELAALT,'
      '        :NUMPARCELAS,'
      '        :ORIGEM,'
      '        :FORMACOBRANCA,'
      '        :TIPOFOLHA,'
      '        :SEQCOBRANCA,'
      '        :NATUREZAITEM,'
      '        :DATAPREVISTA,'
      '        :DATAEFETIVA,'
      '        :DATAVENCTO,'
      '        :VLRPREVISTO,'
      '        :VLREFETIVO,'
      '        :SALDODEV,'
      '        :FLGENVIO,'
      '        :FLGBAIXADO,'
      '        :FLGBAIXAMANUAL,'
      '        :RECPAG,'
      '        :IDRUBRICA,'
      '        :DATARECEB,'
      '        :FLGQUITABONOESTORNO,'
      '        :DATAQUITABONOESTORNO,'
      '        :VLRBASE,'
      '        :FLGENTRADAMANUAL,'
      '        :VERSAO,'
      '        :TRGDTINCLUSAO,'
      '        :TRGUSERINCLUSAO)')
    Left = 492
    Top = 140
  end
end
