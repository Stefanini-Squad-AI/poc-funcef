inherited frmDivergContrib: TfrmDivergContrib
  Left = 525
  Top = 182
  HelpContext = 160052
  Caption = 'Tratamento de Divergência de Contribuição'
  ClientHeight = 488
  ClientWidth = 784
  FormStyle = fsNormal
  Menu = mnuprinc
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 320
    Top = 424
    Width = 39
    Height = 13
    Caption = 'Label2'
  end
  inherited pnlFundo: TPanel
    Width = 784
    Height = 449
    object Splitter1: TSplitter
      Left = 215
      Top = 1
      Width = 7
      Height = 447
      Cursor = crHSplit
    end
    object pnlDireita: TPanel
      Left = 222
      Top = 1
      Width = 561
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object pnlResult: TPanel
        Left = 0
        Top = 55
        Width = 561
        Height = 351
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Splitter2: TSplitter
          Left = 444
          Top = 1
          Width = 7
          Height = 349
          Cursor = crHSplit
          Align = alRight
        end
        object RichEdAdaptacao: TRichEdit
          Left = 176
          Top = 64
          Width = 185
          Height = 89
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          WordWrap = False
        end
        object Panel2: TPanel
          Left = 451
          Top = 1
          Width = 109
          Height = 349
          Align = alRight
          TabOrder = 1
          object bbtnVoltar: TBitBtn
            Left = 7
            Top = 15
            Width = 97
            Height = 38
            Caption = '&Voltar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnVoltarClick
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
              DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
              4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
              DD00DDDDDDDDDDDDDD00}
          end
          object bbtnSalvar: TBitBtn
            Left = 7
            Top = 59
            Width = 97
            Height = 38
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object BitBtn2: TBitBtn
            Left = 7
            Top = 103
            Width = 97
            Height = 38
            Hint = 'Imprime o texto ao lado na impressora Padrão'
            Caption = '&Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn2Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              0003377777777777777308888888888888807F33333333333337088888888888
              88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
              8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
              8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 443
          Height = 349
          Align = alClient
          TabOrder = 2
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 441
            Height = 347
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object pgctrlDivergencias: TPageControl
        Left = 0
        Top = 55
        Width = 561
        Height = 351
        ActivePage = tbsFiltro
        Align = alClient
        TabOrder = 1
        object tbsFiltro: TTabSheet
          Caption = 'Filtrar por ...'
          object pnlTabSheetFiltro: TPanel
            Left = 0
            Top = 0
            Width = 553
            Height = 323
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object pnlFiltroEsq: TPanel
              Left = 1
              Top = 1
              Width = 261
              Height = 321
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object pnlFiltro1: TPanel
                Left = 0
                Top = 0
                Width = 261
                Height = 28
                Align = alTop
                TabOrder = 0
                object chkPatro: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 97
                  Height = 17
                  Caption = 'Patrocinadora'
                  TabOrder = 0
                  OnClick = chkPatroClick
                end
              end
              object pnlFiltro2: TPanel
                Left = 0
                Top = 28
                Width = 261
                Height = 28
                Align = alTop
                TabOrder = 1
                object chkPlano: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 184
                  Height = 17
                  Caption = 'Plano Previdenciário'
                  TabOrder = 0
                  OnClick = chkPlanoClick
                end
              end
              object pnlFiltro3: TPanel
                Left = 0
                Top = 56
                Width = 261
                Height = 90
                Align = alTop
                TabOrder = 2
                object chkContrib: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 97
                  Height = 17
                  Caption = 'Contribuição'
                  TabOrder = 0
                  OnClick = chkContribClick
                end
              end
              object pnlFiltro4: TPanel
                Left = 0
                Top = 146
                Width = 261
                Height = 28
                Align = alTop
                TabOrder = 3
                object chkTempo: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 223
                  Height = 17
                  Caption = 'Tempo de Divergência (meses)'
                  TabOrder = 0
                  OnClick = chkTempoClick
                end
              end
              object pnlFiltro5: TPanel
                Left = 0
                Top = 202
                Width = 261
                Height = 28
                Align = alTop
                TabOrder = 5
                object chkParticipante: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 142
                  Height = 17
                  Caption = 'Participante'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object Panel1: TPanel
                Left = 0
                Top = 174
                Width = 261
                Height = 28
                Align = alTop
                Caption = 'Panel1'
                TabOrder = 4
                object chkValor: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 244
                  Height = 17
                  Caption = 'Valor de Divergência (recebido - esperado)'
                  TabOrder = 0
                  OnClick = chkValorClick
                end
              end
              object pnlFiltro6: TPanel
                Left = 0
                Top = 230
                Width = 261
                Height = 28
                Align = alTop
                Caption = 'pnlFiltro6'
                TabOrder = 6
                object chkSituacao: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 237
                  Height = 17
                  Caption = 'Situação do Participante na Fundação'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 258
                Width = 261
                Height = 28
                Align = alTop
                Caption = 'pnlFiltro6'
                TabOrder = 7
                object ChkTipoCobranca: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 237
                  Height = 17
                  Caption = 'Tipo de Cobrança'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object Panel6: TPanel
                Left = 0
                Top = 286
                Width = 261
                Height = 28
                Align = alTop
                Caption = 'pnlFiltro6'
                TabOrder = 8
                object ChkFormaPagamento: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 237
                  Height = 17
                  Caption = 'Forma de Pagamento'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object pnlFiltro8: TPanel
                Left = 0
                Top = 342
                Width = 261
                Height = 28
                Align = alTop
                Caption = 'pnlFiltro6'
                TabOrder = 9
                object chkDivTrat: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 247
                  Height = 17
                  Caption = 'Não visualizar divergências já tratadas'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object pnlMesRef: TPanel
                Left = 0
                Top = 314
                Width = 261
                Height = 28
                Align = alTop
                TabOrder = 10
                object chkMesRef: TCheckBox
                  Left = 12
                  Top = 7
                  Width = 163
                  Height = 17
                  Caption = 'Ano/Mês Referência'
                  TabOrder = 0
                  OnClick = chkMesRefClick
                end
              end
            end
            object pnlFiltroDir: TPanel
              Left = 262
              Top = 1
              Width = 290
              Height = 321
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object ConsPart1: TConsPart
                Left = 220
                Top = 336
                Width = 57
                Height = 33
                Caption = 'Consulta'
                Flat = True
                Glyph.Data = {
                  96010000424D9601000000000000760000002800000018000000180000000100
                  0400000000002001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00188888880FFF
                  F0FFF0FF073888888880FFFFFF0FFFF073808888880FFFFFFFF0FF07380F8888
                  80FFFF000000807380FF88880FF00000000007380FFF8880FF00000000000380
                  FF0F880FF00077FFF8877030FFF080FFF00E8FF888888700FFFF0FFF00EEF888
                  87477870F0FF80FF0EFF8888887477870F0F880F0EF88888888747870FF08880
                  0EF88888888748870FFF88880E888F8888787F870FFF88880E888FF8888F8F87
                  0FFF88880E788EFEFFF8F870FFFF888887E788FFEF8F87E0FFF08888807E7888
                  FF887E0FFF0888888807E777777EE0FFF0888888888007E7E7E00FFF08888888
                  88888000000FFFF088888888888888880FFFFF08888888888888888880FFF088
                  8888888888888888880F08888888888888888888888088888888}
                Visible = False
                OnClick = ConsPart1Click
                DataBaseName = 'BaseDados'
              end
              object pnlFiltroDir1: TPanel
                Left = 0
                Top = 0
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 0
                object dblkpcmbPatro: TwwDBLookupCombo
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Patrocinadora')
                  LookupTable = qryPatro
                  LookupField = 'IDPESSOA'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbPatroChange
                  OnCloseUp = dblkpcmbPatroCloseUp
                  OnExit = dblkpcmbPatroExit
                end
              end
              object pnlFiltroDir2: TPanel
                Left = 0
                Top = 28
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 1
                object dblkpcmbPlano: TwwDBLookupCombo
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Plano Previdenciário')
                  LookupTable = qryPlano
                  LookupField = 'IDPLANOPREV'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbPlanoChange
                  OnCloseUp = dblkpcmbPlanoCloseUp
                  OnExit = dblkpcmbPlanoExit
                end
              end
              object pnlFiltroDir3: TPanel
                Left = 0
                Top = 56
                Width = 290
                Height = 90
                Align = alTop
                TabOrder = 2
                object dblkpcmbContrib: TwwDBLookupCombo
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Contribuição Previdenciária')
                  LookupTable = qryContrib
                  LookupField = 'IDCONTRIBUICAO'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbContribChange
                  OnCloseUp = dblkpcmbContribCloseUp
                  OnExit = dblkpcmbContribExit
                end
                object chklstContrib: TCheckListBox
                  Left = 6
                  Top = 3
                  Width = 345
                  Height = 82
                  OnClickCheck = chklstContribClickCheck
                  Columns = 1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ItemHeight = 13
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object pnlFiltroDir4: TPanel
                Left = 0
                Top = 146
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 3
                object cmbFiltraTempo: TComboBox
                  Left = 6
                  Top = 4
                  Width = 130
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbFiltraTempoChange
                  Items.Strings = (
                    'é igual a'
                    'é maior que'
                    'é maior ou igual que'
                    'é menor que'
                    'é menor ou igual que'
                    'é diferente de')
                end
                object edTempo: TEdit
                  Left = 141
                  Top = 4
                  Width = 133
                  Height = 21
                  TabOrder = 1
                  OnExit = edTempoExit
                end
              end
              object pnlFiltroDir5: TPanel
                Left = 0
                Top = 174
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 4
                object cmbFiltraValor: TComboBox
                  Left = 6
                  Top = 4
                  Width = 130
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbFiltraValorChange
                  Items.Strings = (
                    'é igual a'
                    'é maior que'
                    'é maior ou igual que'
                    'é menor que'
                    'é menor ou igual que'
                    'é diferente de')
                end
                object edValor: TEdit
                  Left = 141
                  Top = 4
                  Width = 133
                  Height = 21
                  TabOrder = 1
                  OnExit = edValorExit
                end
              end
              object pnlFiltroDir6: TPanel
                Left = 0
                Top = 202
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 5
                object spbtnProcParticip: TSpeedButton
                  Left = 252
                  Top = 4
                  Width = 22
                  Height = 22
                  Hint = 'Procurar Participante'
                  Glyph.Data = {
                    4E010000424D4E01000000000000760000002800000012000000120000000100
                    040000000000D800000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                    FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                    0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                    870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                    FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                    0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                    DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = spbtnProcParticipClick
                end
                object edParticipante: TEdit
                  Left = 6
                  Top = 4
                  Width = 238
                  Height = 21
                  TabOrder = 0
                end
              end
              object pnlFiltroDirSit: TPanel
                Left = 0
                Top = 230
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 6
                object cmbSituacao: TComboBox
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  Items.Strings = (
                    'Ativos'
                    'Mantidos'
                    'Mantidos Parciais'
                    'Assistidos'
                    'Cancelados')
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 258
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 7
                object CbxTipoCobranca: TComboBox
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = CbxTipoCobrancaChange
                  Items.Strings = (
                    'Todos'
                    'Desconto em Folha'
                    'Cobrança Bancária'
                    'Cob. Incentivados')
                end
              end
              object Panel7: TPanel
                Left = 0
                Top = 286
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 8
                object DbLkcFormaPagamento: TwwDBLookupCombo
                  Left = 6
                  Top = 4
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'40'#9'Forma de Pagamento/Cobrança'#9'F')
                  LookupTable = QryFormaPagamento
                  LookupField = 'CODPORTFORMA'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = DbLkcFormaPagamentoChange
                end
              end
              object pnlFiltroMesRef: TPanel
                Left = 0
                Top = 314
                Width = 290
                Height = 28
                Align = alTop
                TabOrder = 9
                object cmbFiltraMesRef: TComboBox
                  Left = 6
                  Top = 4
                  Width = 130
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbFiltraMesRefChange
                  Items.Strings = (
                    'é igual a'
                    'é maior que'
                    'é maior ou igual que'
                    'é menor que'
                    'é menor ou igual que'
                    'é diferente de')
                end
                object edtMesRef: TEdit
                  Left = 141
                  Top = 4
                  Width = 133
                  Height = 21
                  TabOrder = 1
                  OnExit = edtMesRefExit
                end
              end
            end
          end
        end
        object tbsDivergencias: TTabSheet
          Caption = 'Divergências'
          object pnlDivergencia: TPanel
            Left = 0
            Top = 0
            Width = 553
            Height = 323
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object dbgrdDivergSintet: TwwDBGrid
              Left = 1
              Top = 1
              Width = 551
              Height = 321
              Hint = 'Clique com o botão da direita para visualizar opções'
              Selected.Strings = (
                'NOME'#9'50'#9'Contribuição'
                'VALORESPERADO'#9'15'#9'Valor ~Esperado'
                'VALORRECEBIDO'#9'15'#9'Valor ~Recebido'
                'QTDE'#9'5'#9'Qtde.'
                'PLANPREV'#9'25'#9'Plano Previdenciário'
                'PESSJUR'#9'25'#9'Patrocinadora')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDivergSintet
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 2
              TitleButtons = False
              OnMouseDown = dbgrdDivergSintetMouseDown
              IndicatorColor = icBlack
              object dbgrdDivergSintetIButton: TwwIButton
                Left = 0
                Top = 0
                Width = 23
                Height = 25
                Hint = 'Selecionar Todos'
                AllowAllUp = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333333333333333333333333333FFF3333333333333
                  00333333333333FF77F3333333333300903333333333FF773733333333330099
                  0333333333FF77337F3333333300999903333333FF7733337333333700999990
                  3333333777333337F3333333099999903333333373F333373333333330999903
                  33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                  333333F7737737F3333333709073003333333F77377377F33333370907333733
                  33333773773337333333309073333333333337F7733333333333370733333333
                  3333377733333333333333333333333333333333333333333333}
                NumGlyphs = 2
                OnClick = dbgrdDivergSintetIButtonClick
              end
            end
            object dbgrdDivergAnalit: TwwDBGrid
              Left = 1
              Top = 1
              Width = 551
              Height = 321
              Hint = 'Clique com o botão da direita para visualizar opções'
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnMultiSelectRecord = dbgrdDivergAnalitMultiSelectRecord
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDivergAnalit
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 2
              TitleButtons = True
              OnTitleButtonClick = dbgrdDivergAnalitTitleButtonClick
              OnMouseDown = dbgrdDivergAnalitMouseDown
              IndicatorColor = icBlack
              object dbgrdDivergAnalitIButton: TwwIButton
                Left = 0
                Top = 0
                Width = 23
                Height = 25
                Hint = 'Selecionar Todos'
                AllowAllUp = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333333333333333333333333333FFF3333333333333
                  00333333333333FF77F3333333333300903333333333FF773733333333330099
                  0333333333FF77337F3333333300999903333333FF7733337333333700999990
                  3333333777333337F3333333099999903333333373F333373333333330999903
                  33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                  333333F7737737F3333333709073003333333F77377377F33333370907333733
                  33333773773337333333309073333333333337F7733333333333370733333333
                  3333377733333333333333333333333333333333333333333333}
                NumGlyphs = 2
                OnClick = dbgrdDivergAnalitIButtonClick
              end
            end
          end
        end
      end
      object pnlDirTopo: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 55
        Align = alTop
        TabOrder = 0
        object lblModo: TLabel
          Left = 6
          Top = 3
          Width = 322
          Height = 28
          AutoSize = False
          Caption = 'lblModo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblTituloMesRef: TLabel
          Left = 323
          Top = 3
          Width = 209
          Height = 20
          Caption = 'Previsão de Recebimento Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 216
          Top = -8
          Width = 25
          Height = 25
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333FFF3333333333333707333333333333F777F3333333333370
            9033333333F33F7737F33333373337090733333337F3F7737733333330037090
            73333333377F7737733333333090090733333333373773773333333309999073
            333333337F333773333333330999903333333333733337F33333333099999903
            33333337F3333F7FF33333309999900733333337333FF7773333330999900333
            3333337F3FF7733333333309900333333333337FF77333333333309003333333
            333337F773333333333330033333333333333773333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          Visible = False
        end
        object SpeedButton2: TSpeedButton
          Left = 248
          Top = -8
          Width = 25
          Height = 25
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333333333333333333333333333FFF3333333333333
            00333333333333FF77F3333333333300903333333333FF773733333333330099
            0333333333FF77337F3333333300999903333333FF7733337333333700999990
            3333333777333337F3333333099999903333333373F333373333333330999903
            33333333F7F3337F33333333709999033333333F773FF3733333333709009033
            333333F7737737F3333333709073003333333F77377377F33333370907333733
            33333773773337333333309073333333333337F7733333333333370733333333
            3333377733333333333333333333333333333333333333333333}
          NumGlyphs = 2
          Visible = False
        end
        object lblRecPeriodo: TLabel
          Left = 547
          Top = 27
          Width = 9
          Height = 20
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cmbMesRef: TComboBox
          Left = 326
          Top = 27
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Text = 'cmbMesRef'
          OnChange = cmbMesRefChange
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro'
            'Contribuição sobre 13º')
        end
        object spedAnoRef: TSpinEdit
          Left = 476
          Top = 27
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 1998
          OnChange = spedAnoRefChange
        end
        object chkTodasDiverg: TCheckBox
          Left = 6
          Top = 33
          Width = 277
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Exibir todas as divergências ( apenas para individual )'
          TabOrder = 4
          OnClick = chkTodasDivergClick
        end
        object cmdtDataReceInicial: TCMDateTimePicker
          Left = 326
          Top = 27
          Width = 203
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 0
          UnboundDataType = wwDTEdtDate
          OnChange = cmdtDataReceInicialChange
        end
        object cmdtDataReceFinal: TCMDateTimePicker
          Left = 574
          Top = 27
          Width = 203
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 1
          UnboundDataType = wwDTEdtDate
          OnChange = cmdtDataReceFinalChange
        end
      end
      object pnlFiltroBottom: TPanel
        Left = 0
        Top = 406
        Width = 561
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Dock97Top: TDock97
          Left = 0
          Top = 0
          Width = 561
          Height = 40
          Background.Data = {
            760F0000424D760F0000000000007600000028000000800000003C0000000100
            040000000000000F000000000000000000001000000000000000000000008080
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777777171717777777777777177771777777777777777077F7FF7FFFF7
            77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
            777777777771717717777777777777777717777777777777777777777FFFFF7F
            7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
            77777777777777171777777777777777717777777777777777777777777FF7FF
            7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
            7777777777771771777777777777777771777777777777777777777777777FFF
            FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
            777777777777771777777777777777777777777777777777777777777777777F
            F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
            7777777777777777777777777777777777777777777777777777777777777771
            77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
            7777777777777177777777777777777777777777777777777777777777777777
            777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
            7777777777777777771777777777777777777777777777777777777777777777
            7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
            7777777777777717771777777777777777777777777777777777777777777777
            77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
            7777777777777771777777777777777777777777777777777777777777777777
            777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
            7777777777777777777777777777777777777777777777777777777777777777
            777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
            7777777777777777177777777777777777777777777777777777777777777777
            7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
            7777777777777777717777777777777777777777777777777777777777777777
            7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
            7777777777777777777771777777777777777777777777777777777777777777
            7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
            F7F7777777777777771777777777177777777777777777777777777777777777
            77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
            777F7F7777777777777177177771717777777777777777777777777777777777
            77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
            77777F7F77777777777717771777777777777777777777777777777777777777
            777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
            1777777777777777777771717717777177777777777777777777777777777777
            777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
            7777777777771777777777177771777777777777777777777777777777777777
            77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
            7777777777777777777771777777777777777777777777777777777777777777
            777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
            7777777777171777777717777777777777777777777777777777777777777777
            77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
            7777777777777177777771777777777777777777777777777777777777777777
            777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
            7777777777777777777771177777777777777777777777777777777777777777
            7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
            7777777777777777777771717777777777777777777777777777777777777777
            777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
            7777777777777777777777171777777777777777777777777777777777777777
            71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
            7777777777777777777777177777777777777777777777777777777777777717
            77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
            77777777777777777777777777777777777F7777777777777777777777777171
            7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
            771777777777777777777777777777777177F777777777777777777777777717
            171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
            7777777777777777777777777777777777777F77777777777777777777777777
            77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
            7177777177777777777777777777777777777FF7F77771777777777777777777
            1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
            7777777717777777777777777777777777777777777777777777777777777777
            717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
            7177777777777777777777777777777777771777777777777777777777777777
            77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
            777777F777777777777777777777777777777777717177717777777777777777
            77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
            171777F7F7777777777777177777777777777777777777777777777777777777
            777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
            7777777F77777777777777777777777777777777777777777777777777777777
            77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
            7717777F77777777777777717177777777777777777777777777777777777777
            7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
            777777777F777777777777777717777777777777777777777777777777777777
            777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
            7777777777777777777777771777777777777777777777777777777777777777
            77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
            7777777777777777777777777717177777777771777777777777777777777777
            7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
            7777777777777177777777777777777777777717177777777777777777777777
            77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
            7777777777717777777777777717177777777777777777777777777777777777
            777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
            777777777717171717777777777777777777777771777777777F777777777777
            777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
            77777777171777777777777777777777777777777777777777F7F77777777777
            77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
            7777777777171777777777777777777777777777777777777777777777777777
            777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
            7777777717177777777777777777777777777777777777777777777777777777
            77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
            7777777777171777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
            77777777777777777F7F77777717777777777777777777777777777771777777
            7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
            77777777777777777F7F7F777777777777777777777777777777771777777777
            77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
            777777777777777777FFF77F7777717777777777777777777777777777177777
            77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
            77F7777777777777777777F77777777777777777777777777777777777777777
            77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
            F77777777777777777777777F7F7777777777777777777777777777777777777
            777777777717777777777777777777777777717777777777777F7F7F7F77F77F
            77F77777777F77777717777777F7777777777777777777777777777777777777
            77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
            7F77F77777777F77777717777777777777777777777777777777777777777777
            7777777777771777777777777777777777777777777777777F77F7F7F777F777
            F77F777777777777771771777777771777777777777777777777777777777777
            777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
            F7F7777777777777777717171777777777777777777777777777777777777777
            77777777777771777777777777777177777777777771777777777777F777F777
            7777777777777777777171717177771777777777777777777777777777777777
            77777777777777777777777777777777777777777777777777777F7F7F7F7777
            F77F77F777777777777771771717177777777777777777777777777777777777
            7777777777777777777777777777777777777777777177777777}
          BoundLines = [blTop, blBottom]
          LimitToOneRow = True
          object tb97Atalho: TToolbar97
            Left = 4
            Top = 0
            Caption = 'Atalhos'
            CloseButton = False
            DefaultDock = Dock97Top
            DockableTo = [dpTop, dpBottom]
            DockPos = 5
            TabOrder = 0
            object sbtndiverganalit: TToolbarButton97
              Left = 142
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Diverg. Analíticas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
                77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0BBBBB
                BBB07F333F7F3FF33FF70FFF700B00BB00B07F3F777F77F377370F707F0BB0B0
                0BB07F77337F37F77337007EEE0BB0B0BBB077FFFF7F37F7F3370777770EE000
                EEE07777777F3777F3F7307EEE0E0E00E0E03773FF7F7377F73733707F0EE000
                0EE03337737F377773373333700EEE00EEE03333377F3377FF373333330EEEE0
                0EE03333337F33377F373333330EEEE00EE03333337F333773373333330EEEEE
                EEE03333337FFFFFFFF733333300000000003333337777777777}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtnDivergAnalitClick
            end
            object spbtnDivergSintet: TToolbarButton97
              Left = 8
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Diverg. Sintéticas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
                77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
                FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
                FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
                FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
                FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
                00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
                00333333337FFFFF773333333300000003333333337777777333}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtnDivergSintetClick
            end
            object sbtnFluxOper: TToolbarButton97
              Left = 276
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Limpa Filtros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnFluxOperClick
            end
            object ToolbarSep973: TToolbarSep97
              Left = 268
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object bbtnVerResultado: TToolbarButton97
              Left = 410
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Resultado'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00331111133333
                333333FFFFF33333333333222223332222233333333333444443333199933333
                333333388883333333333332AAA333AAA2333333333333CCC433333199933333
                1133333888833333FF333332AAA333AAA2333334433333CCC433339919933333
                99133388F883333388F333AA2AA333AA2A2333CC433333CC4C43339133933333
                3913338F33833333388F33A233A333A33A2333C4333333C33CC4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4339133333333
                3991338F33333333388F33A2333333333AA233C4333333333CC4339913333333
                99133388F333333388F333AA23333333AA2333CC43333333CC43333991333339
                913333388F3333388F33333AA233333AA233333CC433333CC433333399111119
                1333333388FFFFF8F3333333AA22222A23333333CC44444C4333333333999993
                33333333338888833333333333AAAAA33333333333CCCCC33333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 4
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = bbtnVerResultadoClick
            end
            object ToolbarSep972: TToolbarSep97
              Left = 134
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep974: TToolbarSep97
              Left = 402
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep975: TToolbarSep97
              Left = 536
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep976: TToolbarSep97
              Left = 0
              Top = 0
              Blank = True
              SizeHorz = 8
            end
          end
        end
      end
    end
    object pnlEsquerda: TPanel
      Left = 1
      Top = 1
      Width = 214
      Height = 447
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object trvModos: TTreeView
        Left = 0
        Top = 0
        Width = 214
        Height = 447
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Images = imModos
        Indent = 19
        ParentFont = False
        TabOrder = 0
        OnChange = trvModosChange
        OnCollapsing = trvModosCollapsing
        OnExpanding = trvModosExpanding
        Items.Data = {
          02000000320000000200000000000000FFFFFFFFFFFFFFFF0000000004000000
          19436F6E747269627569E7F5657320446976657267656E746573300000000000
          000001000000FFFFFFFFFFFFFFFF000000000000000017436F6E747269627569
          E7F56573204EE36F205061676173340000000000000002000000FFFFFFFFFFFF
          FFFF00000000000000001B436F6E747269627569E7F565732050616761732061
          204D656E6F72340000000000000003000000FFFFFFFFFFFFFFFF000000000000
          00001B436F6E747269627569E7F565732050616761732061204D61696F723600
          00000000000004000000FFFFFFFFFFFFFFFF00000000000000001D436F6E7472
          69627569E7F5657320506167617320656D2041747261736F3100000002000000
          08000000FFFFFFFFFFFFFFFF000000000200000018496E6164696D706C656E74
          65732028436F6E73756C746129320000000300000009000000FFFFFFFFFFFFFF
          FF000000000000000019496E6164696D706C656E746573205265676973747261
          646F7331000000030000000A000000FFFFFFFFFFFFFFFF000000000000000018
          496E6164696D706C656E7465732043616E63656C61646F73}
      end
    end
  end
  object tb97Param: TToolWindow97 [2]
    Left = 794
    Top = 450
    ActivateParent = False
    Caption = 'Parâmetros Padrão'
    ClientAreaHeight = 287
    ClientAreaWidth = 541
    DefaultDock = Dock97Top
    DockableTo = []
    DockPos = 0
    MinClientHeight = 25
    Resizable = False
    TabOrder = 2
    Visible = False
    object pnlTextoFluxOper: TPanel
      Left = 0
      Top = 0
      Width = 541
      Height = 287
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTextoFluxOper'
      TabOrder = 0
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 541
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object pnlparam: TPanel
        Left = 0
        Top = 4
        Width = 541
        Height = 283
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object grpbxvlraceite: TGroupBox
          Left = 2
          Top = 2
          Width = 537
          Height = 55
          Align = alTop
          Caption = 'Ignorar Diferença   '
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 20
            Top = 26
            Width = 149
            Height = 13
            Caption = 'Atraso / Devolução menor que:'
          end
          object SpeedButton20: TSpeedButton
            Left = 344
            Top = 17
            Width = 89
            Height = 28
            Caption = 'Atualizar'
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888800008888888888888888888800008888888888887788888800008877
              7777777077778888000080000000007000777888000080FFFFFFF07000007788
              000080F44F44F07000000778000080FFFFFFF07887000077000080F44444F078
              88870077000080FFFFFFF07888887007000080F44444F07888788007000080FF
              FFFFF07880788007000080F44FFFF07800770078000080FFFF00008000000788
              000080F44F0F088000078888000080FFFF008888007888880000800000088888
              8088888800008888888888888888888800008888888888888888888800008888
              88888888888888880000}
            OnClick = SpeedButton20Click
          end
          object SpeedButton3: TSpeedButton
            Left = 436
            Top = 17
            Width = 89
            Height = 28
            Caption = 'Valor'
            Glyph.Data = {
              56070000424D5607000000000000360400002800000028000000140000000100
              0800000000002003000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              03030303030303030303030303030303030303030303030303FFFFFFFFFFFFFF
              FFFF030303030303030303030000000000000000000303030303030303030303
              F8F8F8F8F8F8F8F8F8FF0303030303030303030300FBFFFBFFFBFFFB00030303
              03FFFFFFFFFFFFFFF8FF03FFFFFFFFFFF8FF0303000000000000000000FFF8F8
              F8F8F8FF00030303F8F8F8F8F8F8F8F8F8FFF8F8F8F8F803F8FF030007FF07FF
              07FF07FF00FBFFFBFFFBFFFB000303F8FF03030303030303F8FF030303FFFFFF
              F8FF0300FF07FF07FF07FF0700FF0707F8F8F8FF000303F8FF03030303030303
              F8FFFFFFF8F8F803F8FF030007FF07FF07FF0704040404FBFFFBFFFB000303F8
              FF030303030303F8F8F8F8FF03FFFFFFF8FF0300FF07FF07FF07FF07FC040407
              F8F8F8FF000303F8FF03030303030303F8F8F8FFF8F8F803F8FF030007FF07FF
              07FF070404FC04FBFFFBFFFB000303F8FF030303030303F8F8F8F8FF030303FF
              F8FF0300FF07FF07FF07040404FF04FFFFFFF8F8000303F8FF0303030303F8F8
              F8FFF8030303F8F8F803030007FF07FF0704040400FBFFFBFFFBF800030303F8
              FF03030303F8F8F8F8FFFFFFFFFFF8F803030300FF07FF070404040700000000
              00000003030303F8FF030303F8F8F803F8F8F8F8F8F8F8030303030007FF07FF
              070407FF07FF000303030303030303F8FF03030303F803030303F8FF03030303
              03030300FF07FF07FF07FF07FF07000303030303030303F8FF03030303030303
              0303F8FF030303030303030007FF07FF07FF07FF07FF000303030303030303F8
              FF0303FFFFFFFFFFFF03F8FF0303030303030300FF07040404040404FF070003
              03030303030303F803FFF8F8F8F8F8F8FFFFF80303030303030303030000FEFC
              FCFCFC04000003030303030303030303F8F803F8F8F8F8F8F8F8030303030303
              030303030303FEFCFCFCFC04030303030303030303030303030303F8F8F8F8F8
              030303030303030303030303030303FEFEFEFE03030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303}
            NumGlyphs = 2
            OnClick = SpeedButton3Click
          end
          object RealEdit1: TRealEdit
            Left = 208
            Top = 22
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            MaxLength = 17
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 57
          Width = 537
          Height = 193
          Cursor = crNo
          Align = alTop
          Caption = 'Geral  '
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object wwDBGrid1: TwwDBGrid
            Left = 2
            Top = 15
            Width = 533
            Height = 176
            Selected.Strings = (
              'DESCRICAO'#9'25'#9'Alterador'
              'NOMEREGRA'#9'25'#9'Regra de Cálculo'
              'FLGCOBRA'#9'10'#9'Cobra'
              'FLGATRASO'#9'10'#9'Cobra no Atraso'
              'FLGDEVOL'#9'10'#9'Cobra na Devolução')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsalteradorxcontrib
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object BitBtn1: TBitBtn
          Left = 459
          Top = 253
          Width = 80
          Height = 28
          Cancel = True
          Caption = '&Sair'
          TabOrder = 2
          OnClick = BitBtn1Click
          Glyph.Data = {
            F6010000424DF601000000000000760000002800000030000000100000000100
            0400000000008001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
            8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
            FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
            8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
            6087777770F8F0E6608777777066666668777777007770E660877777007770E6
            608777777066666668777777007770E660877777007770E66087777770666666
            68777788060770E760877788060770E76087777770666666687770000E6070E0
            608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
            608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
            687770000E6070E6608770000E6070E6608777777066666668777777060770E6
            60877777060770E66087777770666666687777770077770E608777770077770E
            60877777706666666877777770777770E087777770777770E087777770666666
            687777777000000000777777700000000077777770EEEEEEE877}
          NumGlyphs = 3
          Spacing = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 612
      DockPos = 623
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 175
      DockPos = 175
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object pnlProgresso: TPanel [4]
    Left = 264
    Top = 488
    Width = 424
    Height = 150
    BevelWidth = 3
    Caption = 'pnlProgresso'
    TabOrder = 3
    Visible = False
    object lblMsg2: TLabel
      Left = 84
      Top = 48
      Width = 316
      Height = 34
      AutoSize = False
      Caption = 'Tratando Divergências...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object gagProgresso: TGauge
      Left = 76
      Top = 84
      Width = 316
      Height = 22
      ForeColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Progress = 0
      ShowText = False
    end
    object imVerifica: TImage
      Left = 21
      Top = 48
      Width = 40
      Height = 36
      IncrementalDisplay = True
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000001000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777000000000000000222AA008877777700BBBBBBBBBBBBBBB0222AAA077
        77770BFBFBFBFBFBFBFBF02222AA07777777BFBFBFBFBFB0000002222AA08877
        7777FBFBFBFBFB0222222222AA0B08877777BFBFBFBFB0AAA222222AA0BFB088
        7777FBFF00000AAAAAA222AA0B0BFB087777BFFFF0A222AAAAA22AA0B0B0BF08
        7777FFFF0A222222AA22AA000B0B00088777FF00A2222222222AA070F0B0BFB0
        8777000A2222222222AA07770B0B0BF0777770AA222222222AA0777770B0B007
        77777700AA222222AA077777770707777777777700AA222AA088888888888877
        777777777700AA00000000000000088888887777777700B7B7B70FBFBFB7B000
        00007777777770FBFFFF0BFBFBFB7B7B7B7B7777777777000000BFBFBFFFB7B7
        B7B777777777707B7B7B0BFBFBFBFBFBFB7B7777777770BFBFFF0FFFFFFFBFBF
        BFB77777777777000000FBFFFFFBFFFBFBFB7777777770B7B7BF0FF0FFFFFFBF
        FFB77777777770FBFFFB0B0FFBFBFBFBFBFB7777777777000000BF0FBFFFFFFF
        FFBF77777777707B7BFB00FBFBFBFBFBFBFB7777777770BFBFFF00FFBFBF0000
        0000777777777700000000FBFBF077777777777777777777777770BFBF077777
        777777777777777777770BFBF0777777777777777777777777770FBF07777777
        777777777777777777770BF077777777777777777777777777770FB077777777
        7777}
      Transparent = True
    end
    object lblMsg1: TLabel
      Left = 28
      Top = 6
      Width = 376
      Height = 34
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btncancelaprogress: TBitBtn
      Left = 303
      Top = 114
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btncancelaprogressClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnlValidacao: TPanel [5]
    Left = 328
    Top = 712
    Width = 349
    Height = 77
    BevelWidth = 3
    TabOrder = 4
    Visible = False
    object lblValidacao: TLabel
      Left = 28
      Top = 13
      Width = 89
      Height = 13
      Caption = 'Validando Seleção'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object gagValidacao: TGauge
      Left = 24
      Top = 38
      Width = 301
      Height = 21
      ForeColor = clNavy
      Progress = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object imModos: TImageList
    Left = 9
    Top = 174
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0000000000FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000084848400848484008484840084848400848484008484
      84000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000084848400C6C6C600C6C6C600848484000000
      0000848484008484840000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600FFFFFF00C6C6C6008484
      84000000000084848400000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF801FFFFFFFFFFFFF
      0000FFFFFFFFE3FF0000E007FFFFC3FF0000C007C00FC1FF0000C0078007C00F
      0000C0078003F0030000C0078001F8030000C0078001F8038000C007800FF803
      8000C00F800FF803FC00E07F801FF803FC01E07FC0FFFC07FC03FFFFC0FFFC0F
      FC07FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO =:IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 98
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME'
      'FROM PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO P'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 12
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO,NOME'
      'FROM CONTRIBUICAO'
      
        'WHERE IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM PLANPREVP' +
        'ATRO PLP, PATRO P, CONTPREV CP'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA'
      '                      AND     CP.IDPLANOPREV = PLP.IDPLANOPREV )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 14
    Top = 386
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DEPENTIT.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'DEPENTIT')
    CamposChave.Strings = (
      'DEPENTIT.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA'
      'PARTPREVPLAN.SEQPROPOSTA'
      'DEPENTIT.IDTITULAR')
    Filtro.Strings = (
      'DEPENTIT.IDPESSOA = PESSOA.IDPESSOA '
      'DEPENTIT.IDTITULAR = elegpatro.idpessoa'
      'ELEGPATRO.IDPESSJUR = PATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA  = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 310
    Top = 409
  end
  object qryDivergSintet: TwwQuery
    AfterOpen = qryDivergSintetAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(H.VALORESPERADO) AS VALORESPERADO, SUM(H.VALORRECEBID' +
        'O) AS VALORRECEBIDO,'
      '       COUNT(H.NUMRECEBIMENTO) AS QTDE,'
      '       C.NOME, C.IDCONTRIBUICAO, PL.NOME PLANPREV,'
      '       PESSJUR.NOME PESSJUR'
      
        'FROM   CONTRIBUICAO C, HSTCONTRIBPREV H, PLANPREV PL, PESSOA PES' +
        'SJUR'
      'WHERE  (H.MESREFERENCIA = '#39'1998/12'#39' ) AND'
      '       (H.SITRECEBIMENTO = 3) AND '
      '       (H.IDPESSJUR = 3816) AND'
      
        '       ((H.VALORESPERADO < H.VALORRECEBIDO) OR (H.VALORESPERADO ' +
        '> H.VALORRECEBIDO)) AND                           '
      '       (H.IDPLANOPREV = 22) AND'
      '       (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      '       AND H.IDPESSJUR = PESSJUR.IDPESSOA'
      '       AND H.IDPLANOPREV = PL.IDPLANOPREV'
      'GROUP BY C.NOME, C.IDCONTRIBUICAO,PL.NOME ,'
      '       PESSJUR.NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 70
    Top = 324
  end
  object dsDivergSintet: TwwDataSource
    DataSet = qryDivergSintet
    Left = 70
    Top = 276
  end
  object qryDivergAnalit: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDivergAnalitAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   H.VALORESPERADO, TRUNC(MONTHS_BETWEEN(TO_DATE('#39'1997/01'#39', '#39'YYY' +
        'Y/MM'#39'), PF.DATANASC) / 12, 0) IDADEHOJE,'
      
        '   H.VALORRECEBIDO, C.NOME AS NOMECONTRIB, P.NOME AS NOMEPARTICI' +
        'P, EL.MATRICULA, C.IDCONTRIBUICAO,'
      
        '   CT.IDPLANOPREV, H.MESREFERENCIA, H.DATARECEBIMENTO, H.MESCOBR' +
        'ANCA, H.IDLOTE, H.FLGCALCRESERVA,'
      
        '   PP.IDPESSJUR, PP.IDPESSOA, H.CODDOCUMENTOPREV, PP.IDSITPART, ' +
        'PL.NOME PLANPREV,'
      
        '   PESSJUR.NOME PESSJUR, PP.SALPARTICIPACAO, PP.SEQPROPOSTA, CTP' +
        '.VALORBASE1, CTP.VALORBASE2,'
      '   CTP.VALORBASE3, H.FLGDEVOLUCAO, 0 as selecionado'
      '   , CTP.IDPLANOPREV --Helio - SOL Nº 253577/17460 PPM Nº 955546'
      ''
      'FROM'
      '   CONTRIBUICAO      C,'
      '   SITPLANOPREV      SP,'
      '   ELEGPATRO         EL,'
      '   PARTPREVPLAN      PP,'
      '   HSTCONTRIBPREV    H,'
      '   PESSOA            P,'
      '   CONTPREV          CT,'
      '   PLANPREV          PL,'
      '   PESSOA            PESSJUR,'
      '   CONTRIBPREVPARTP  CTP,'
      '   PESSOAFISICA      PF'
      ''
      'WHERE'
      '       (H.MESREFERENCIA    = '#39'1999/01'#39' )'
      '   AND (H.SITRECEBIMENTO   = 3)'
      '   AND (H.IDPESSOA         = PP.IDPESSOA)'
      '   AND (H.SEQPROPOSTA      = PP.SEQPROPOSTA)'
      '   AND (H.IDPESSJUR        = PP.IDPESSJUR)'
      '   AND (CTP.IDPESSOA       = PP.IDPESSOA)'
      '   AND PP.IDPESSOA         = PF.IDPESSOA'
      '   AND (CTP.SEQPROPOSTA    = PP.SEQPROPOSTA)'
      '   AND (H.IDPESSJUR        = CTP.IDPESSJUR )'
      '   AND (H.IDPLANOPREV      = CTP.IDPLANOPREV)'
      '   AND (CTP.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      '   AND (H.IDPLANOPREV      = PP.IDPLANOPREV)'
      '   AND (PP.IDSITPLANOPREV  = SP.IDSITPLANOPREV)'
      '   AND (EL.IDPESSOA        = PP.IDPESSOA)'
      '   AND (EL.IDPESSJUR       = PP.IDPESSJUR)'
      '   AND C.IDCONTRIBUICAO    = CT.IDCONTRIBUICAO'
      '   AND PP.IDPLANOPREV      = CT.IDPLANOPREV'
      '   AND PP.IDPLANOPREV      = PL.IDPLANOPREV'
      '   AND (P.IDPESSOA         = PP.IDPESSOA)'
      '   AND H.IDPESSJUR         = PESSJUR.IDPESSOA'
      '   AND H.IDPLANOPREV       = PL.IDPLANOPREV'
      ''
      'ORDER BY'
      '   P.NOME, C.NOME')
    UpdateObject = UpdateSQL1
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 150
    Top = 325
  end
  object dsDivergAnalit: TwwDataSource
    DataSet = qryDivergAnalit
    Left = 150
    Top = 276
  end
  object pmnu: TPopupMenu
    Left = 24
    Top = 118
    object ParmetrosPadro1: TMenuItem
      Caption = 'Parâmetros Padrão'
      OnClick = ParmetrosPadro1Click
    end
    object DadosdoParticipante1: TMenuItem
      Caption = 'Dados do Participante'
      OnClick = DadosdoParticipante1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmnuCobraProx: TMenuItem
      Caption = 'Cobrar Diferença via Interface'
      OnClick = pmnuCobraProxClick
    end
    object pmnuCobraImed: TMenuItem
      Caption = 'Cobrar Diferença via Cobrança Bancária'
      OnClick = pmnuCobraImedClick
    end
    object DescontarnoPrximoBenefcio1: TMenuItem
      Caption = 'Descontar no Próximo Benefício'
      OnClick = DescontarnoPrximoBenefcio1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object pmnuDevolveProx: TMenuItem
      Caption = 'Devolver Diferença via Interface'
      OnClick = pmnuDevolveProxClick
    end
    object pmnuDevolveImed: TMenuItem
      Caption = 'Devolver Diferença via Devolução Bancária'
      OnClick = pmnuDevolveImedClick
    end
    object AcrescentarnoPrximoBenefcio1: TMenuItem
      Caption = 'Acrescentar no Próximo Benefício'
      OnClick = AcrescentarnoPrximoBenefcio1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object pmnuAdiconarDif: TMenuItem
      Caption = 'Adicionar Diferença como Aporte'
      OnClick = pmnuAdiconarDifClick
    end
    object pmnuDevolveIgnora: TMenuItem
      Caption = 'Ignorar Diferença'
      OnClick = pmnuDevolveIgnoraClick
    end
    object pmnuRecalcularPatronais: TMenuItem
      Caption = 'Recalcular Patronais'
      OnClick = pmnuRecalcularPatronaisClick
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 355
    Top = 65533
  end
  object qryparam: TwwQuery
    BeforeOpen = qryparamBeforeOpen
    AfterOpen = qryparamAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'IDCONTRIBUICAO,'
      'PLANPREV.IDPLANOPREV,'
      'VLRACEITADIVERG,'
      'NOME PLANO '
      'FROM CONTPREV, PLANPREV'
      'WHERE CONTPREV.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'AND CONTPREV.IDCONTRIBUICAO = :IDCONT'
      'AND CONTPREV.IDPLANOPREV = :IDPLANO'
      '')
    ValidateWithMask = True
    Left = 146
    Top = 181
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end>
  end
  object dsparam: TwwDataSource
    AutoEdit = False
    DataSet = qryparam
    Left = 282
    Top = 101
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 13
    Top = 229
  end
  object qrybusca: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 70
    Top = 172
  end
  object RegCalculo: TRegra
    QueryIn = qryatraso
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 362
    Top = 77
  end
  object qryexecuta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 149
    Top = 129
  end
  object qryatraso: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 715
    Top = 65523
  end
  object qryalterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,PLACONTA, RECPAG, RECPAG, '
      '                         CODCENTROCUSTO,IDPESSOA, IDEMPRESA'
      '                         FROM TIPOALTERADOR '
      '                         WHERE CODALTERADOR =  :codalterador')
    ValidateWithMask = True
    Left = 69
    Top = 221
    ParamData = <
      item
        DataType = ftString
        Name = 'codalterador'
        ParamType = ptUnknown
      end>
  end
  object qryDivergSintetAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 146
    Top = 389
  end
  object qryalteradorxcontrib: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsparam
    SQL.Strings = (
      'SELECT'
      'IDPLANOPREV  ,'
      'IDCONTRIBUICAO,    '
      'TIPOALTERADOR.CODALTERADOR   ,        '
      'IDREGRACALCULO  ,    '
      'FLGCOBRA ,                   '
      'FLGATRASO ,                '
      'FLGDEVOL, REGRA.NOMEREGRA, TIPOALTERADOR.DESCRICAO  '
      'FROM ALTERADORXCONTRIB, REGRA, TIPOALTERADOR'
      'WHERE ALTERADORXCONTRIB.IDREGRACALCULO = REGRA.IDREGRA'
      'AND ALTERADORXCONTRIB.IDPLANOPREV = :IDPLANOPREV'
      'AND ALTERADORXCONTRIB.IDCONTRIBUICAO = :IDCONTRIBUICAO'
      'AND TIPOALTERADOR.CODALTERADOR = ALTERADORXCONTRIB.CODALTERADOR')
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0'
      'FLGATRASO;CheckBox;1;0'
      'FLGDEVOL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 325
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
  object dsalteradorxcontrib: TwwDataSource
    AutoEdit = False
    DataSet = qryalteradorxcontrib
    Left = 389
    Top = 104
  end
  object qryaltaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 842
    Top = 13
  end
  object mnuprinc: TMainMenu
    Left = 51
    Top = 8
    object GerarContribuies1: TMenuItem
      Caption = '&Tratamento de Divergências'
      object ParmetrosPadro2: TMenuItem
        Caption = '&Parâmetros Padrão'
        Enabled = False
        OnClick = ParmetrosPadro1Click
      end
      object DadosdoParticipante2: TMenuItem
        Caption = '&Dados do Participante'
        Enabled = False
        OnClick = DadosdoParticipante1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object CobrarDiferenanoProximoMs1: TMenuItem
        Caption = '&Cobrar Diferença via Interface'
        Enabled = False
        OnClick = pmnuCobraProxClick
      end
      object CobrarDiferenaImediatamente1: TMenuItem
        Caption = 'C&obrar Diferença via Cobrança Bancária'
        Enabled = False
        OnClick = pmnuCobraImedClick
      end
      object DescontarnoPrximoBenefcio2: TMenuItem
        Caption = 'D&escontar no Próximo Benefício'
        Enabled = False
        OnClick = DescontarnoPrximoBenefcio1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object DevolverDiferenanoPrximoMs1: TMenuItem
        Caption = 'De&volver Diferença via Interface'
        Enabled = False
        OnClick = pmnuDevolveProxClick
      end
      object DevolverDiferenaImediatamente1: TMenuItem
        Caption = 'Devolver Diferença via Cobrança Bancária'
        Enabled = False
        OnClick = pmnuDevolveImedClick
      end
      object AcrescentarnoPrximoBenefcio2: TMenuItem
        Caption = '&Acrescentar no Próximo Benefício'
        Enabled = False
        OnClick = AcrescentarnoPrximoBenefcio1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object AdicionarDiferenacomoAporte1: TMenuItem
        Caption = 'Adicionar Diferença como A&porte'
        Enabled = False
        OnClick = pmnuAdiconarDifClick
      end
      object IgnorarDiferena1: TMenuItem
        Caption = 'I&gnorar Diferença'
        Enabled = False
        OnClick = pmnuDevolveIgnoraClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object RegistrarInadimplncia2: TMenuItem
        Caption = '&Registrar Inadimplência'
        Enabled = False
      end
    end
    object ContribuiesnoRecebidasPeloInterface1: TMenuItem
      Caption = '&Outros Tratamentos'
      object Preparo1: TMenuItem
        Caption = '&Preparo de Contribuições não Recebidas Pelo Interface'
        OnClick = Preparo1Click
      end
      object VerificarParticipantesDevedores1: TMenuItem
        Caption = '&Verificar Participantes Devedores'
        OnClick = VerificarParticipantesDevedores1Click
      end
    end
  end
  object qrycontribaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 149
    Top = 229
  end
  object qryreservaxcontrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RC.IDPLANOPREV,RC.IDTIPORESERVA,RC.IDCONTRIBUICAO,'
      '       RC.IDREGRACALCULORE,RC.PERCENTUAL, RP.NOME NOMERESERVA,'
      
        '       RP.INDICEREAJUSTE, RPA.IDPESSOA , RPA.IDPESSJUR , RPA.SEQ' +
        'PROPOSTA ,'
      
        '       RPA.IDPLANOPREV , RPA.VALORRESERVA , EL.MATRICULA , PT.IN' +
        'SCRICAONUMERO,'
      '       P.NOME'
      'FROM   RESERVAXPLANO RP , RESERVAXCONTRIB RC, RESERVAPART RPA,'
      '       ELEGPATRO EL , PARTPREVPLAN PT, PESSOA P'
      'WHERE  RC.IDCONTRIBUICAO = :IDCONTRIBUICAO'
      'AND P.IDPESSOA = :IDPESSOA'
      'AND RPA.IDPESSOA = P.IDPESSOA'
      'AND RPA.IDPESSJUR = :IDPESSJUR'
      'AND RPA.SEQPROPOSTA = :SEQPROPOSTA'
      'AND RPA.FLGATIVO = 1'
      'AND RPA.IDPESSOA = PT.IDPESSOA'
      'AND EL.IDPESSOA = RPA.IDPESSOA'
      'AND PT.SEQPROPOSTA = RPA.SEQPROPOSTA'
      'AND EL.IDPESSJUR = RPA.IDPESSJUR'
      'AND PT.IDPESSJUR = RPA.IDPESSJUR'
      'AND PT.IDPLANOPREV = RPA.IDPLANOPREV'
      'AND RPA.IDPLANOPREV = RC.IDPLANOPREV'
      'AND RPA.IDTIPORESERVA = RC.IDTIPORESERVA'
      'AND RPA.IDTIPORESERVA = RP.IDTIPORESERVA'
      'AND RPA.IDPLANOPREV = RC.IDPLANOPREV'
      'AND RPA.IDTIPORESERVA = RC.IDTIPORESERVA'
      ' ')
    ValidateWithMask = True
    Left = 293
    Top = 65535
    ParamData = <
      item
        DataType = ftString
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdReservaPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RESERVAPART'
      'SET VALORRESERVA = :VALORRESERVA'
      ',   DATAREFERENCIASA= SYSDATE'
      'WHERE IDTIPORESERVA = :IDTIPORESERVA'
      'AND   IDPLANOPREV   = :IDPLANOPREV'
      'AND   IDPESSJUR     = :IDPESSJUR'
      'AND   IDPESSOA      = :IDPESSOA'
      'AND   SEQPROPOSTA   = :SEQPROPOSTA')
    ValidateWithMask = True
    Left = 69
    Top = 388
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDTIPORESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LC.PLACONTA, LC.CODSUBCONTA, LC.LACDEBCRE, LC.LACVALOR, L' +
        'C.LACVALHIST, LC.LACHIST1, LC.LACHIST2,'
      
        '                        LC.LACHIST3, LC.PLNCODIGO, LC.LACNUMLAN,' +
        ' LC.HITCODHIST, LC.IDPESSOA, LC.IDEMPRESA, LC.IDMODULO, '
      
        '                        LC.UNIDNEGOC, LC.IDUSUARIOINCLUSAO, LC.P' +
        'LANO, LC.LACTIPO, LC.LACNUMDOC, LC.LACHIST4, LC.LACHIST5, '
      
        '                        LC.LACTIPCONVOFICIAL, LC.LACVALOFICIAL, ' +
        'LC.LACTIPCONVGER, LC.LACVALGERENCIAL, '
      
        '                        LC.LACTIPCONVGEREN1, LC.LACVALGEREN1, LC' +
        '.LACTIPCONVGEREN2, LC.LACVALGEREN2, LC.LACATOUTMOEDA, '
      
        '                        LC.LACORIGEMAPLIC, LC.TIPCODIGO, LC.IDEL' +
        'EMDEMONSTRAT, LC.CODCENTROCUSTO, '
      
        '                        U.NOME,CC.NOME,CC.CODCENTROCUSTO, PL.PLN' +
        'DATDIA, -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV  , '#39' '#39' as PLACO' +
        'NTADEBITO'
      
        '                        FROM LANCAMENTO LC, UNIDNEGOCIO U, CENTC' +
        'UST CC, PLANILHA PL WHERE'
      '                        (LC.PLNCODIGO =  :plncodigo) AND'
      '                        (LC.PLNCODIGO = PL.PLNCODIGO) AND'
      
        '                        (CC.IDEMPRESA(+)      = LC.IDEMPRESA) AN' +
        'D'
      
        '                        (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUST' +
        'O) AND'
      
        '                        (LC.IDPESSOA          = U.IDPESSOA(+)) A' +
        'ND'
      '                        (LC.UNIDNEGOC         = U.UNIDNEGOC(+))'
      ' '
      ' ')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 88
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'plncodigo'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 20
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryContabilIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContabilPLACONTADEBITO: TStringField
      FieldName = 'PLACONTADEBITO'
      Size = 18
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLACONTA = :PLACONTA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALHIST = :LACVALHIST,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLNDATDIA = :PLNDATDIA'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLACONTA, CODSUBCONTA, LACDEBCRE, LACVALOR, LACVALHIST, LACHI' +
        'ST1, LACHIST2, '
      
        '   LACHIST3, PLNCODIGO, LACNUMLAN, HITCODHIST, IDPESSOA, IDEMPRE' +
        'SA, IDMODULO, '
      
        '   UNIDNEGOC, IDUSUARIOINCLUSAO, PLANO, LACTIPO, LACNUMDOC, LACH' +
        'IST4, LACHIST5, '
      
        '   LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGER, LACVALGERENC' +
        'IAL, LACTIPCONVGEREN1, '
      
        '   LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN2, LACATOUTMOEDA, ' +
        'LACORIGEMAPLIC, '
      '   TIPCODIGO, IDELEMDEMONSTRAT, CODCENTROCUSTO, PLNDATDIA)'
      'values'
      
        '  (:PLACONTA, :CODSUBCONTA, :LACDEBCRE, :LACVALOR, :LACVALHIST, ' +
        ':LACHIST1, '
      
        '   :LACHIST2, :LACHIST3, :PLNCODIGO, :LACNUMLAN, :HITCODHIST, :I' +
        'DPESSOA, '
      
        '   :IDEMPRESA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :PLANO' +
        ', :LACTIPO, '
      
        '   :LACNUMDOC, :LACHIST4, :LACHIST5, :LACTIPCONVOFICIAL, :LACVAL' +
        'OFICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLIC, :TIPCODIGO, '
      '   :IDELEMDEMONSTRAT, :CODCENTROCUSTO, :PLNDATDIA)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 177
    Top = 59
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 405
    Top = 325
  end
  object qryEnvioBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.NOMERESUM, P.NOME AS NOMEPARTICIP,'
      
        '       C.NOME,               HST.MESREFERENCIA,      HST.MESCOBR' +
        'ANCA,'
      '       HST.DATAPREVISAORECE,'
      
        '       HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECE' +
        'BIMENTO,'
      
        '       HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVO' +
        'LUCAO,'
      '       HST.IDMOTIVO,         HST.DATARECEBIMENTO,'
      '       HST.VALOROP1,'
      
        '       HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCU' +
        'MENTOPREV,'
      '       HST.VALORCALCULADO,     HST.FLGDESCFOLHA,'
      
        '       HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANO' +
        'PREV,'
      
        '       HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINI' +
        'CIO,'
      
        '       HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVEN' +
        'TO,'
      
        '       HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALC' +
        'RESERVA,'
      '       EL.MATRICULA,         CP.FLGPAGADOR,'
      
        '       CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICA' +
        'ONUMERO,'
      
        '       CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRE' +
        'CDES,'
      
        '       CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONT' +
        'AD,'
      
        '       C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTR' +
        'ORESPON,'
      '       PP.SALMANTIDO,        CP.UNIDNEGOC,'
      
        '       CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINI' +
        'CIO,'
      '       CPP.TIPCODIGO,        CPP.CODTIPDOC,'
      '       NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,'
      
        '       CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONT' +
        'AD13,'
      
        '       CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENT' +
        'ROCUSTOD13,'
      
        '       CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENT' +
        'RORESPON13,'
      
        '       CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPR' +
        'ECDES13,'
      
        '       CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORT' +
        'FORMA13,'
      '       CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,'
      
        '       CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADE' +
        'VOL,'
      
        '       PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINI' +
        'CIO,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, '#39 +
        '0'#39', '#39'Não'
      'enviada para cobrança'#39','
      
        '                                                               '#39 +
        '1'#39', '#39'Enviada'
      'e não recebida'#39','
      
        '                                                               '#39 +
        '2'#39','
      #39'Recebida corretamente'#39','
      
        '                                                               '#39 +
        '3'#39','
      #39'Recebida com divergência(NT)'#39','
      
        '                                                               '#39 +
        '4'#39','
      #39'Atrasada e já tratada'#39','
      
        '                                                               '#39 +
        '5'#39','
      #39'Divergência paga'#39','
      
        '                                                               '#39 +
        '6'#39','
      #39'Divergência enviada e não recebida'#39','
      
        '                                                               '#39 +
        '7'#39','
      #39'Financiada ou Renegociada'#39','
      
        '                                                               '#39 +
        '8'#39','
      #39'Cancelada'#39','
      
        '                                                               '#39 +
        '9'#39', '#39'Cobrada'
      'na Folha de Benefício'#39'),'
      
        '                                   DECODE( HST.SITRECEBIMENTO, '#39 +
        '0'#39', '#39'Não'
      'enviada para devolução'#39','
      
        '                                                               '#39 +
        '1'#39', '#39'Enviada'
      'e não efetivamente paga'#39','
      
        '                                                               '#39 +
        '2'#39', '#39'Paga'
      'corretamente'#39','
      
        '                                                               '#39 +
        '3'#39', '#39'Paga'
      'com divergência(NT)'#39','
      
        '                                                               '#39 +
        '7'#39','
      #39'Financiada ou Renegociada'#39','
      
        '                                                               '#39 +
        '8'#39','
      #39'Cancelada'#39','
      
        '                                                               '#39 +
        '9'#39', '#39'Paga na'
      'Folha de Benefício'#39')) AS NOMESITUACAO,'
      '       CP.IDREGRACALCULO,    SP.FLGINTERNO,'
      '       NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO,'
      
        '       --Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546 -- R' +
        'NG11'
      
        '       --NVL(CPP.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANPREV' +
        'CONTAB'
      
        '       NVL(HST.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANPREVCO' +
        'NTAB'
      '       --Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546'
      
        'FROM   PESSOA P, CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  S' +
        'ITPART SP,'
      
        '       ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP ' +
        'CPP,'
      '       HSTCONTRIBPREV HST'
      'WHERE  (HST.IDPESSOA    = :IDPESSOA )'
      'AND    (HST.IDPESSJUR   = :IDPESSJUR )'
      'AND    (HST.IDPLANOPREV = :IDPLANOPREV )'
      'AND    (HST.SEQPROPOSTA = :SEQPROPOSTA )'
      'AND    (HST.NUMRECEBIMENTO = :NUMRECEBIMENTO )'
      'AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)'
      'AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)'
      'AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)'
      'AND    (CPP.IDPESSOA       = HST.IDPESSOA)'
      'AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)'
      'AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)'
      'AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (PP.IDPESSOA        = CPP.IDPESSOA)'
      'AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)'
      'AND    (PT.IDPESSOA        = PP.IDPESSJUR)'
      'AND    (EL.IDPESSOA        = PP.IDPESSOA)'
      'AND    (EL.IDPESSJUR       = PP.IDPESSJUR)'
      'AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)'
      'AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)'
      'AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)'
      'AND    (PP.IDSITPART       = SP.IDSITPART)'
      'AND    (P.IDPESSOA         = PP.IDPESSOA)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 226
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMRECEBIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAcertaContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 724
    Top = 349
  end
  object qryNumRecebAEnviar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS NUMRECEBIMENTO FROM DUAL')
    UpdateObject = updNumRecebAEnviar
    ValidateWithMask = True
    Left = 462
    Top = 76
  end
  object updNumRecebAEnviar: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  NUMRECEBIMENTO = :NUMRECEBIMENTO'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (NUMRECEBIMENTO)'
      'values'
      '  (:NUMRECEBIMENTO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  NUMRECEBIMENTO = :OLD_NUMRECEBIMENTO')
    Left = 505
    Top = 202
  end
  object QryFormaPagamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PF.CODPORTFORMA, PF.DESCRICAO  '
      'FROM '
      '  PORTADORFORMA PF'
      'ORDER BY '
      '  PF.DESCRICAO')
    ValidateWithMask = True
    Left = 506
    Top = 426
  end
  object qrySitPartInterno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'AT'#39' AS FLGINTERNO, '#39'Ativo'#39'                        AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MA'#39' AS FLGINTERNO, '#39'Mantido'#39'                      AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MP'#39' AS FLGINTERNO, '#39'Mantido Parcial'#39'              AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MS'#39' AS FLGINTERNO, '#39'Manutenção de Saldo de Conta'#39' AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AS'#39' AS FLGINTERNO, '#39'Assistido'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'CA'#39' AS FLGINTERNO, '#39'Cancelado'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AE'#39' AS FLGINTERNO, '#39'Ativo Especial'#39'               AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'PN'#39' AS FLGINTERNO, '#39'Pendente'#39'                     AS DES' +
        'CRICAO FROM DUAL')
    ValidateWithMask = True
    Left = 598
    Top = 338
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  RECPAG = :RECPAG,'
      '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,'
      ' IDPESSJURCEDIDO = :IDPESSJURCEDIDO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      
        '   CODTIPRECDES, VALOR, RECPAG, IDPLANPREVCONTAB, IDPESSJURCEDID' +
        'O)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      
        '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :RECPAG, :IDPLANPREV' +
        'CONTAB, :IDPESSJURCEDIDO)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 378
    Top = 253
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.CODDOCUMENTO,D.PLANO,D.PLACONTA,L.PLNCODIGO ,L.NUMLANCT' +
        'O,'
      '       R.UNIDNEGOC,R.CODCENTRORESPON,R.CODTIPRECDES,R.VALOR,'
      
        '       -1.00 AS IDPESSJUR, -1.00 AS IDPLANOPREV, -1.00 AS IDCONT' +
        'RIBUICAO,'
      
        '       -1.00 AS FLGDEVOLUCAO, '#39'R'#39' AS RECPAG, -1.00 AS IDPLANPREV' +
        'CONTAB,'
      '       -1.00 AS IDPESSJURCEDIDO'
      'FROM   DOCUMENTO D , LANCTODOCUM L, RATEIODOCUM R'
      'WHERE  D.CODDOCUMENTO = :CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = L.CODDOCUMENTO'
      'AND    D.CODDOCUMENTO = R.CODDOCUMENTO'
      'ORDER BY D.PLANO,D.PLACONTA'
      ''
      ' ')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 278
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'coddocumento'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryDocumentosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDocumentosIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryDocumentosFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDocumentosRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDocumentosIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryDocumentosIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
    end
  end
  object qryPlanilhaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LDC.PLNCODIGO'
      ''
      'FROM'
      '   LANCTODOCUM LDC'
      ''
      'WHERE'
      '       LDC.CODDOCUMENTO           =:PCODDOCUMENTO'
      '   AND LTRIM(RTRIM(LDC.OPERACAO)) = '#39'2'#39)
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 624
    Top = 141
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryPlanilhaDocumentoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object UpdateSQL1: TUpdateSQL
    Left = 297
    Top = 315
  end
  object pdsg1: TppDesigner
    Caption = 'Modelo de Email'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    RAPInterface = [riNotebookTab]
    Report = TppTEnvioEmail
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 610
    Top = 88
  end
  object ppAuxEmail: TppBDEPipeline
    DataSource = dsEnvioEmail1
    OpenDataSource = False
    AutoCreateFields = False
    UserName = 'AuxEmail'
    Left = 672
    Top = 88
    object pplfAuxEmailppField1: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplfAuxEmailppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplfAuxEmailppField3: TppField
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplfAuxEmailppField4: TppField
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object pplfAuxEmailppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object pplfAuxEmailppField6: TppField
      FieldAlias = 'SOMAALTERADORES'
      FieldName = 'SOMAALTERADORES'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplfAuxEmailppField7: TppField
      FieldAlias = 'NOMECONTRIB'
      FieldName = 'NOMECONTRIB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplfAuxEmailppField8: TppField
      FieldAlias = 'NOMEPARTICIP'
      FieldName = 'NOMEPARTICIP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object TppTEnvioEmail: TppReport
    PageLimit = 1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Users\william.santana\Desktop\modelomail.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 728
    Top = 88
    Version = '7.04'
    mmColumnWidth = 0
    object phdrbnd1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 196321
      mmPrintPosition = 0
      object psystmvrbl1: TppSystemVariable
        UserName = 'psystmvrbl1'
        DisplayFormat = #39'Brasília, '#39'DD '#39'de'#39' MMMM '#39'de'#39' YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 106627
        mmTop = 33073
        mmWidth = 55838
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        Caption = 'GECAD/COARI '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39952
        mmTop = 33867
        mmWidth = 25665
        BandType = 0
      end
      object plbl2: TppLabel
        UserName = 'plbl2'
        Caption = 'Coordenação de Arrecadação e Institutos - COARI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 39688
        mmTop = 37835
        mmWidth = 83651
        BandType = 0
      end
      object pmg1: TppImage
        UserName = 'pmg1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D61676596290000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080055019F03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFC
          A28A2800AF14FF0082867ED647F628FD927C55F1021B48750D534E8E3B6D32DA
          6CF9535DCD22C716F0082514B6F600825518020906BDAEBC77F6F6FD93ADFF00
          6D8FD963C4FF000F66BD1A6DDEAB1C73E9F78CBB96D6EA171244CC3AEC2CBB5B
          1CED66C738AF77862597ACE30AF36FF77F690F69BFC1CCB9B6D6D6BDEDADB6D4
          E0CD7EB0F0755613F89CB2E5FF0015B4FC4FC2EB1FF82CCFED2765F114F890FC
          4DD52699A5123584B042DA7328627CBFB3ECD8AB82465406C63E6C8047EEA7EC
          19FB5227ED99FB27783FE227D963B0BCD6ED9D2FED6324A5BDD4323C3305C924
          2178D994124ED65CF35F8ADA7FFC1037F696BCF88474497C25A4DB592CA10EB7
          26B96A74FD8588F340573315E09DA22DE0632A322BF6CBF623FD972CBF632FD9
          7FC29F0EACAF1B513A0DBB9BABC29B3ED7732C8D34D201D97CC760A0E4840A09
          38CD7F4AFD21315C0D572BC2AE1E741E254D7F0392CA9F2BBA9F269BF2F2A96A
          B5B6973F32F0EE9E7D1C5D5798A9AA76FB77F8AEAD6E6D76BDDAD36F23D5A8A2
          8AFE4D3F5C0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
          800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
          800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803F323F
          68BFDB93F6E1F067C7DF1A691E0DF83E756F09699AD5DDAE8D7BFF0008A5DCFF
          006BB449996193CC59407DC814EE00039CD719FF000F0AFF008282FF00D10F3F
          F846DEFF00F1EAFD6AAE03E2F7ED41E0AF817AE69FA6F89B58FB0DE6A4BE6471
          AC124A523DDB7CC7D80ED5C82327AE0FA1AFD4AB78BFC3D95E0E33C7E4D838C6
          0A31739DE377A2BB6E495DBFC59F3587E08CD71F8974B058BAF394AED462AEED
          BE8926EC91F9A9FF000F0AFF008282FF00D10F3FF846DEFF00F1EAE2BC27FF00
          0712FC6DF843F14A4D1BE29FC3EF0EC91585C08754D3574FB9D2755B3E990049
          2305600E76BC7CF1C80735FB35637D0EA7650DCDBCB1CF6F708B2C5246C19245
          6190C08EA0839CD7E207FC1CADA15A699FB70785EEE08238AE352F06DB4974EA
          A019DD6F2F10337A9D8AAB9F4551DABF5BF0B339E18E32CE3FB131D9250A719C
          24D4A9F3269AB3DEF7D55ECD34D3B1F17C5982CD725C1FD7A863AA49C649352B
          35AF95BBF73F566F3FE0A01F0DACBF6355F8E8DABBB7825F4F1789855FB5BCA4
          ECFB184DD8FB479B98B6EEC0607E6DA3757E656BDFF070E7C76F8CFF001523D1
          BE177C3EF0E2A5F4ED1E9BA58D3AEB57D52E47501BCB91433050490918039E48
          19AF9EF50F176A327FC11174CD31AEA43663E335C4423EC117468A40BF4DF2BB
          63D4E7B57BAFFC1B35E1DB3BFF00DABFC75A94F0472DE69DE16D96D23004C224
          BA84395F42428191CE091D09AFA7C1785DC37C2B91E6D9F63F0CB192A152A469
          C66DF2A8C64A314D2D1B6DFBD2B6CBDD4B5BF955F8AB33CD71F83CBF0F53D8AA
          918B938EEDB4DBB7969A2FBEE7A2FF00C3C2BFE0A0BFF443CFFE11B7BFFC7A8F
          F87857FC1417FE8879FF00C236F7FF008F57EB1EA7A9DBE8BA6DC5E5DCD1DBDA
          DA44D34D2C8DB5224504B313D80009CD711F077F69BF05FC79D4B50B3F0CEADF
          6EB9D34079637824859909C6F50E0165CF191D0919C6467F03AFE33F0E50C453
          C256C93051A952FCB1775295B7E54E5776EB63F46A3C079B56A13C4D2C657953
          A76E69249A8DF6BBB595FA5CF847F659FDB73F6D8F1EFED13E0ED1BC79F088E8
          DE0ED4B538A0D5EFBFE115BBB6FB2DB93F33F98D2954C7A90457E9651457C971
          6711E1738C442B617054F0AA31B38D24D26EEDDDDDBD7A7A1E96539755C1D394
          2AD79556DDEF2B5D792B740A28A2BE50F5828A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A00F26F147EDCBF0B7C19E24BFD2353F147D9B51D32E1ED6E62FECDBB7F2E446
          2ACBB9622A7041E4122BCD7E267C1CF865FB7B788D3C55A3F8E5E16D16D56DB5
          058A2D8440ACEE1D9260AD1FDE6F9C82A40E9C1AFA625D02C67919DECAD1DDCE
          599A15249F53C57E6F7C7E8D7C15FB437C5DB4D21469B6B259BC4D0DB0F2D0A3
          CB6A5D7038C124F1D39AFC33C4FCCB1997E129ACF69D1C5616A4DAE450A94E49
          C6329C5F3FB59A76E5B3F755FD1D8FD97C3ACBF0B8EC54DE4D52AE1B130827CE
          E509C5A728C64B97D9C5AF8AEB576F91F5DE89FB6CFC19F877A2596816DE3043
          6DA25BC7630EDB1BB9C6C89022FEF1222ADC01C83835F92FFF00070C7C53D07E
          317ED4BE07D6FC397FFDA5A649E0F8E159BC8921CB2DFDE061B64556E3E95FAB
          5FF04EAF096963F655D0EECE9D646E6F67BA92E2530A979996E2440589193855
          51F415F983FF00072DDA4565FB64F82638628E241E0B84ED450A3FE3FAF7B0AF
          EB7FA1B62B39C6F1460B1F8C9D254AA61E52508539C5C79A09C5734AAC934968
          FDC577B58FC2FC7CC365584CBF1582C246ABAB4EAF2B9CE716A5CB26A4F95538
          B577AAF79F9DCF06BDFF00943169BFF65A6EFF00F4C56D5EE1FF0006F07C5CF0
          F7C16F8DDF11758F136A1FD9BA73E810DB89BC8966CC8D72A42ED8D59B90A79C
          638AF0FBDFF943169BFF0065A6EFFF004C56D5F47FFC1B31670DF7ED1FF11D27
          8A3990786A33B5D430CFDAA3E706BFB2BC4E55E5E1F67CB0D2519FB4A96724E5
          14FDA4374A516D79292F53F06E139515C49973C445B872C6EA2D26D72BD9B524
          9F9B4FD0FD33F10FED9BF063E29F87B50F0D5D78C516DB5EB692C2567B3BAB60
          A9221427CC7882A707AB1C0AE4FE187C27F867FF0004FEF105C78875AF1C3CD7
          5AEDA9B6B359612EDF676747244708767CB227CF80BC7BD6AFFC14A3C2BA62FE
          CC7797634FB25BAB4BEB630CAB0A878B73ED6C1032320906BE69FD9C2DD3C73F
          B57FC32B3D6546A76B069912243723CC4558ED659117078C2B8040E99AFF0018
          B8AF88B1983E25C3E0B1F42856C5A74951AAA3523187B59B83E687B49395AD75
          EF2B6EACCFF41B86B21C2E2F87EBE2F055EB52C2B551D6A4E5094A7ECE2A4B96
          7ECE2A37BD9FBAEFE87D97E0FF00DB77E1878F7C4F63A3693E27FB5EA5A94A20
          B687FB3AEE3F31CF41B9A20A3EA4815EAD5561D06C6DE55923B3B54743956585
          4107EB8AB55FBE6574F3185392CCAA4272BE8E109415BCD4AA546DDFADD7A1F8
          9E65530139A797D39C236D54E719BBF938C2165E567EA1451457A679A1451450
          0145145001451450014514500145145001451450014514500145145001451450
          0145145001451450014514500145145001451450014514500145145001451450
          014514500145145001451450015F9A9FB52FFC9CB7C5AFFAF61FFA32D6BF4AEB
          E28F8EDFB18FC40F1CFC6CF883AD69DA5DB4DA7EBF084B276BD850C877DB9E41
          6CAF11B75F4AFC5BC6ECA31D9865787A780A32AB2551B6A3172697B3A8AED2BE
          97697AB3F5CF07F35C1E0732AF531B5634E2E092726926FDA41DB5F24DFA23DA
          7FE09D5FF268DE19FF00AE979FFA572D7E5A7FC1CC9FF279DE0AFF00B12A1FFD
          2EBDAFD6AFD8E3E19EB1F07FF67AD13C3FAF4096DAA593DC34B1A4AB2AA87B89
          1D7E65241F95857C23FF0005B8FF008267FC5FFDB4FF00694F0CF893E1F68365
          AAE93A678662D36E259B54B7B5659D6EAE642BB6475246D910E40C73ED5FD5DF
          44ACC30D9263B2D9E715161D430CA32751A872CBD9C572BE6B59DF4B3D6E7E1D
          E38D29E63531EF00BDAF35794972FBD75CEDDD5AF756D6E7C0D7BFF2862D37FE
          CB4DDFFE98ADABE94FF8363BFE4E53E23FFD8B31FF00E954756EE7FE08F1F1E6
          4FF826B597C381E18D38F8B20F89971E247B5FED9B5D82C5F4A82DD64F337ECC
          F9A8C36E77719C62BDABFE087DFF0004DEF8B5FB13FC6AF19EB5F10F42B2D2B4
          FD67444B2B578753B7BB2F289D1C82237623E50793C57F5571D71AF0FE278333
          8C261F1B4A552A549B8C5548B9493A9169C527769A57D3A1F8CE45926634F3AC
          156A9426A318C536E2ECBDD7BBB687D65FF0529FF9354D53FEBF6D7FF468AF97
          3F646FF93C0F86FF00F60EFF00DB29ABEC6FDB5BE156B7F19FE025F683E1FB78
          EEB539EE6091237956205524058EE62074AF0AFD9EBF63AF1F7C3FFDA2BC17E2
          1D534BB6874BD1ACFC9BA916F627646FB2C91E0286C9F9980E2BFC81F10387F3
          3C4F1CE0F1B87C3CE74A2F0F7928B715CB564E576959596AFB2D4FEF9E07CF32
          EC3F0762F095EBC23524ABDA2E4949F3528A564DDDDDE8BBB3ECDA28A2BFA3CF
          C0428A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A00F806EFF00E0B41E38F14F
          ED67E3AF847E00FD9F6E7C75ADF822FEFADA4787C63159B5CC16B702069F6496
          BB501664F977B11BBA9C66BAFF008C1FF0556F14FECFF79F03F4CF1A7C199B41
          F11FC60D56E34DB9D325F13C723F87C477905BA485D2DD967DE93AC9B46CC7DD
          C9EA3E3DF817FB00EA7FB46FFC15F7E3843E30D3FE25F84FC2B737FAE6A165AD
          69427D2D6F1FFB4A3F2D16E5A328E8E8ECDB47DEDA08E057B87FC162FF00651F
          16F85FC37FB3AF8AFC05A17893C7763F03AEE3B7BAB3891AF751B8823366D1CD
          2328DEE4FD930EC10F326E3815FD478BE19E078E799764B0A305ED69294DF3D6
          4F9E5426E29D4759C17355E5F75422D3493972B69FE574734CF5E03138D7397B
          93B4572C3E1552377CBC9CDA42FAF33BAD6D7499F44FED21FF000515FF00867D
          FDB87E17FC19FF00843FFB5FFE1644713FF6C7F6B7D9FF00B3B7CF2458F23C96
          F331E5E7FD62E738ED93E7FF00B3D7FC169FC35F183F6E2F11FC12D7BC2E7C21
          7BA76AF7DA2691AB3EAE2EA1D5EEADAE1E211B21863F25A4084A0DCF96C26725
          73E0B7FAD78CFF00E0A35FF0569F83DE3BD07E167C44F05F853E1DD9C2FA9DEF
          8AF4A6D3C0F2E69A6600FCCA4B1754450C598E490A0123C97C13FF0004C2F12F
          ED5DF1C3F6AC9DF46F10785FC5BA4F89E7D6FC0FABDD5B4D6505DCE350BD731A
          4AC02B24ABE5E1D4FC8DE5BE700868CBF8038428E5EE8E7B6A35A386A6E72551
          C9D3AB52B4A0A6E2A6E2D28B8B946DF026EC9BB8F13C439C4F13CF80BCE0EAC9
          4538A4A508C149A4DC6FABBA4FBE97B1FA05F027FE0A9DA17C4BF097C74F10F8
          9BC3EDE11D0BE076AB3E9D7770BA88BE7D4D6369543A218A3D8EED18558F2D96
          900DDEBE3DA67FC177B549746F0F78BEFF00F67CF1E587C2BF11EA5FD9B6FE28
          FB68999DF7104A5BAC387C056C625F98A3AA92548AF9CFF63EFD923E2E7C70FF
          008277FED4DE18D53C3DE21D33C79E2DD674FD5228755B37B07D5E786E3ED332
          2F981549728C011F2EE65E82BD57E0E7FC1467E2E7C0FF00D92FE1E7C2AF067E
          CEFF001266F8A5E1C5B4F0FCE75CF0F4EBA1B246DE5B38991D1C33A8072E1510
          B162CCA39D715E1F70ED0C4E2A8E070B4F1538568537078874E34E9BA1093AAA
          4E576A551CBDE973C572DB97A134B88B32A94A8CEBD59524E1295FD9A9394BDA
          34A0D5BA452D159BBDEE7ADFED23FF00058CD77E127EDA23E0B7833E0E49F117
          5ABAB7B69F4E9E2F14269CD7FE75A0B9C047B6655DA84F25F9DBDB38AEC3C47F
          F0511F897F0A3F656F891F133E237C02BBF03BF8196C1AC34B9FC590DDFF006E
          8B8B9104844B1C07C9F2B721E51B76EC718CD7E7BFFC153FE04788FC67FF0005
          42BED77C53F0D7E2178AFC292E9DA67F6A8F09E9F3B79F20D3A3574B7B8313A6
          166E39078523AD7A27853E1CE9773FF049EFDA2BC23F0EBE12FC63F0ACF3DCE8
          F782CBC516ED7379AAC8F79086FB32470A1658D20CB000E3703C0AEBADE1F70B
          C729CA3134F0F07EDBEA9EDA5CF36EF52A42353DEFACC546E9D9A541D936D4A3
          A38E50E22CD5E33194E551AE4F6BC8AD15F0C64E3A7B36DD9ADDD457B59A7D7E
          B5FD953FE0A33F18FF0069EBFF0007EA29FB345FE8FE04F15C88DFF092FF00C2
          696F7315A5B3120CFE47D9D1DC0C1F97826BEC6AF847FE093BFF0004E1D23E18
          7C2BF85BF13751D5BE26D878C2DB4C925B8D0B51D51E3D36DE49639A0646B364
          0540590B05278600D7DDD5F86F88F0C968E73530B91538C6953728BE555356A7
          25ABA956AB95925EF45C62FF00951F75C352C74F051AB8F9372959EBCBB349FD
          98C2DADF4776BB857C67FB797FC158356FD8EFF6ADF097C26D0BE15C9F1075BF
          18E99697960C9E225D35A49EE2EEE2D92DC2B5BC8B9DD003B8B81F3E303193F6
          657E52FF00C15E3F666F10FED01FF0572F82D043A178C66F0ADEE93A3E9DA9EB
          3A35A4C174E46D5AF7CC6172A8C913A2386C9FBB904F15E8784D93E4F996772A
          39E454A8C69549D9CA515CD18DD7C32849FA292BEC73F176371986C0A9E05B53
          738AD127A3767BA6BE76D0FBA3F665FDA7FC7BF1134BF125F7C5BF8523E08D96
          8E6D458DC6A3E28B6D462D4CCA65120DCA9188BCB2918F9B3BBCE18C60E7D71B
          C7FA126B76DA636B7A48D4AF2213DBDA1BC8C4F3C64160EA99DCCB8527206300
          FA57C37FF050FF00D8566F83FF00F04A1F1DF813E1E0F1D78E6E2E357B3D64C5
          A85D36ADA9102E2D848136A8664548836D5048F9CF4CE3E7AF83D3F8CBE3EFFC
          152FE04F8EDBE177C48F0A685A37838E83773EB7A24B6F1ADC5B6997D1C8C1C0
          23CA3248AA8CFB4B1FE1078AF7F0DC0195E7984C4E7781AF1A3461EDAD049A5F
          BAA509C2CAA559D4FDEB72DE52B34EDA592F3EAF10E2F03569606BD3739CB92F
          276FB739296B18463EE24BA2BDF5EEFF0053B53FDA27E1FE8ABA635EF8EBC1D6
          835ABAFB169E66D6ADA317F71C7EE62CBFEF24F997E55C9E471CD5BF1DFC6AF0
          6FC2DD4F4DB2F13F8B7C33E1CBCD65FCAD3E0D535482CE5BE7C81B625918190E
          48185CF515F843E0AFD82357D4FF00E097FE33F116A1F0C7C5CDF1334DF1A5AD
          A695E66997AB7AB60D0C664096F8C347BD9896D8707BF15EE3F12BE126B7E17F
          DAEBE1C78D3E2FFC20F1FF00C5FF0004EB7F0AB48D3ED34FD3B4796FE6B4BE1A
          74314914AACCA22956E0CCEDB8865338600B0AFA1C5782F92D3C44A951CC653E
          475A2D28D3529CA9C6128AA77A9CAF994F7935F0CAC79D4B8DB1D2A6A73C328F
          37234EF26A2A4E49B97BB7D1C7A27BA3EFEFD86FFE0A3FA47ED73F043C65E3BD
          774AD3FE1D691E0DD7A7D16E25BED6D27B7658A2864F3DA578E258C1F371B483
          8DBD4E703D6FE0DFED3DF0EFF68692FA3F0378DBC33E2C974C0AD771E97A8477
          2F6E1B3B4BAA9240241009E0E0D7E3FF00C16F863E38F861FF000498F14E9179
          F03F58F165EDDFC540E748D674CD449D3ADCE9B1A2DE986DDA29665571E5839F
          2F7364824015B9FB287C08F1E685FF00053CD3F51F0DE95AFD9681E23F0A6A56
          916B367E0497C15A5B4ADA65CA227D9D502C416EA34019CEF778D5F9254D7467
          BE11E4337996270789F631A2EA3A4AEA506A94612716F9A52BCAEEDCD28BD2F1
          534A56CF01C61982585A55A973B9F2A93B352BC9B57B592B2B2BD935DDC5B57F
          D669FF0069DF86B6BE3F6F09CBF10FC0F1F8A565101D19B5EB55D404848013C8
          2FE66E248E36E7915E57FB77FF00C1416DBF625D47C336EFA1E8DE203AE45777
          172973E2CB1D167B38E111EC31C772419DA4676002950046DCE70A7F32BF66DF
          0CFC3AF867FB3D7FC2B5F88DFB30F8FF00C7FF001C1FC506E2F2D63D3AE6CAFA
          5B7DF84992FD0191211F74AA108EDF31383B87B1FEDC5E16D73E207EDD9ABE97
          AB7C1A3A2E9C7C396B0E9FE293E08B9F1CEA3AB31B78556CA359256B185FCC32
          C626640C8622C5B2F93CD86F0AB28C1E790C3E2653AB4231AADB9F2463554396
          2A74FD9D5755C1B9F32B45BB455B9D73F2EB578B3195B00EA524A336E295B99B
          8DEEDC65CD0E4BA51B3BB5BF476BFE937C33F8E9A5F8CFF67EF0F7C40D5EEF44
          D034FD5B48B7D4EF5CEB105D58E9AD246AD245F6C5222916372C9E60C2B15CF1
          9C569FC34F8CFE0FF8D3A6CF7BE0EF16786BC5B696AE239A7D1B5382FE2898E7
          0ACD133004E0F07D0D7E32F847F665F89BAE7FC120FC35A6CDE0BF185F69FE18
          F8A6FAB788FC349A7CF16A775A77D9E2512470B2876405DF3B54805F7F44623E
          84FD887E0BDDEBBFF056CBEF881F093E1FF897E187C19D3F40167ACC3AA68D36
          8D06AB33DBB2AC70C0E0648984521C0C0F2598E0BAEEF2F3CF0AB29C2E1B1F89
          A78DD68BAEE3651E45ECE5150A726E6E5CF554BF776BDEDD75B756078B31756A
          E1E9CA87C6A17DF9BDE4EF25EEA5CB0B7BDB7CB4BFE92F8DFC7BA1FC33F0D5CE
          B5E24D6B49F0FE8F67833DFEA5771DA5B419200DD24842AE490393D4D7CDFF00
          063FE0A77A6FC6FF00F8283789FE07E8FE1FB1BBD3341D246AD6DE2BB3D752EE
          DF52430DAC80242916D03FD271B84CC3E4CE39C0F1FF00F82FD7C2AF13FC42F0
          5FC22BFD37C27E22F1B785740F13B4FE23D27468A59A79E1658F6E563562A0A2
          CE824230A641FDEE7E6FFD953E06788758FDBB3E366B9F0CFE1678F3E187873C
          5FF0DB5A8FC216FABE93269AD677735BC11C6A1B73244CD72AEE8A24E1704606
          3070778799262B866B6718FAC9D49D2ABCA9B518D29C6A42316ED352949C79A4
          A2E2E2E0DBDD2B99D711E3A96690C161E168C670BE8DB9C5C5B76BC6C95ECAE9
          DEFEA7EB1683FB487C3BF14F8FA4F0A699E3DF05EA5E28859D1F47B5D6EDA6D4
          119012C0C0AE640540248DBC60D3BC7DFB467C3DF851E20B4D23C53E3CF06F86
          F55BFC7D9ACB55D6ADACEE2E32401B2391D59B2481C03C915F8AFE17FD9A352F
          17FECC3F07BC0DE02F839F123C25FB44E93E2F927D63C533787EEB4E8ECE0124
          E56592ED80015035B100E36181FB91BFD3BFE0A01FB3FDE786BF69BF8DDACF86
          F4EF88EDA9F89C4573268FAFFC2D5F11693E2175F9D4D8EA513CC624DCA0AEE8
          E229908C7E5C2FA32F073255994704F1F249AA9A38AE66E1521053F71CED4EA2
          939C1B5B45A938A7CCB9971A635E19D7FABA7671D53765CD17271F7946F28B49
          4927D744DE87EC5C52ACF12BA30747019594E4303D0835F05D8FFC1613E237C4
          3FDA2BE24FC3DF877FB39DDF8EEEBE1AEB377A55EDCC1E3486CCC890DD4B6EB3
          1492D70BBCC44ED0CDB738C9EA7E99FD826EBC4177FB1B7C396F14F87A3F0A6B
          C9A2C31DD6931DAB5A2D96DCAAA8858931E5029D9C6DCE3000C0FC79F18FECD7
          E1CD47F6EFF8F5A8FC5EF859FB41EB9A16A1E30D5A7D0A7F04E85BC4BBB51B86
          323BCC155A3642854A139CE7A62BC9F0CF83F26C5E3334C2E6F08D6787494359
          34E4AA72B6A34EB51E7BAD7F8964B5D6DAF5F146738DA5470B5707270551FBDB
          2B2E5BA4DCA13B6BFDDF23F663E1B7ED01703F67DD3BC6BF16348D37E0E5ECC6
          51A8E9DAC6BB6F2C3A5959E48E30D764471B7988A920E063CCC72466BA6F86FF
          00197C21F1934C9AFBC21E2BF0DF8AECED982CB71A3EA705F451139C06689980
          2707AFA1AFCAAFDAAFC26BF13FE1A7ECB97FA17C27F8CD7FF03BE1AEB52E95AE
          F87B59D10B6B2628E4B52259ADE12DBD1E212AAB9DAA70CB942E09EDA5F03FFC
          2DFF00845FB4C5B7ECF3FB3F78BBE14EA3ADE9105B43ADDD79FA4A788A249223
          2DA5AE9AC152177805C81E5839DE37156942D2C5786380961D629D6749D4A924
          FE054A847DBAA4A3539EB3A97517CF64E72E5B2F7BDE9A74B8A710AA3A5C9CCA
          315FCDCF51FB3E76E3CB051B5FDDDA2AF7DB489FA23E0AFDA33E1EFC4AF15DCE
          83E1DF1E78375FD72CD59A7D3B4DD6ADAEEEE00A704B451B97500F5C8E29DE2F
          FDA1FC01F0FAD2EAE35FF1CF83F4482C6E56CEE24D4359B6B64B79DB76D89CBB
          80AE763E14F276371C1AFC81F835F002EBC59FF0CBFA37C32F847F10BC0BF15B
          C23AC8B9F1AF892EF40B9D3618E05994CCF35C3802552A1B0A4F0AC63C7CDB6B
          A66FD80ADFE3478F7F6F0F12F8BBC07E23BCD5B47BBBED43C112BDADD422EAE1
          E5D4A412DB2A802E0931400001C624C63E615DF89F09721C3E225F58C7CE34E2
          95E3CB0752EF10A8276F69CBC93BFB48BBDF96EECEC9BE7A7C5F8FA94D7B3C3A
          7277D6F2E5FE1BA8D5F96F756E56B6BDB5EDFAD1E2DF8B3E16F0078423F10EBD
          E26F0FE8BA04AAAE9A95FEA30DB59BAB0CA912BB04208E41CF2299A07C62F08F
          8B3C107C4DA5F8A7C39A9F86C1C7F6ADAEA50CD639C818F3958A752075EA457E
          4AF8C7E06F89AD3E0B7EC57A978E7E1EF8D7C59F0DBC276D791F89F40B3D16E2
          EAE2CA56B9CAB5C5B85DDB594261580CAC6EBFC5839767FB38F8B6F3F661FDB2
          B59F07FC39F197867E1DF8CEF74C8FC27E1FB9D326B7BABA68B548A47786C883
          20458DBA85C00768276305CA9F84195BA3172C7DA4EAA8735A1C96789FABF2FC
          7CDED147F7D6B72F2E97B7BC5CB8C714A6ED87D1479AD77CDFC2F697F86DCB7F
          737BDFEE3F5C97F683F01BF8C8F87078D7C26DAF8B13AA7F670D5ADCDD0B4D9B
          FED1E5EEDDE56CF9B7E31B79CE39AE3BE30FED6F63A17ECE3ACF8FFE19C7E1BF
          8B474BB88ADA3B5D37C51696D6B71234D1C7221BC3BE28D9164DFB4F27007058
          57E5BF85FF00E09BFA76A5E2EFD8F3ED5F0DFC49147E2EB49FFE160BFD9EF977
          EC740A97473FE8E190B211F2654915CB69BFB3978F3C1BFB377ED97E0DD2BC11
          E33B6D0AE35FD25BC3FA6AE9374E9731C3ADC8035B82A4C816009965CE542924
          800D7AB85F08F877DAD3952C73A969D2E68D48C631945E25E1E7AC2AF35B4734
          934F935E64DDE3C95B8C332E4929E1F96F1959C5B6D3549548FC50B75B3BA6B9
          BA3B6BFACBE37FDB5B48F847FB2869DF11BC6B168BE18D6753D1C5F5B787AE7C
          456A0DCDE18B7AD94574C5639096C2F9806D03E62302BA3F813FB49E8BF177E0
          4E99E37BCD5FC19676D74365DBE97E228F53D3ACA6DD830FDACA44ACE32A08DA
          3E6381B8618FE63FC5FF00056BF0F847F660D0B55F84AA2CED7E1DD9C57FE31D
          53C0FA878AE5D0A651307B31A5AB080C8308489A3627CF53F2F979AF24F037EC
          E3F12BC3DFB0F7ED5FE189FC19E3756BBF117872E348B06F0FCF6A6EC0BEBB32
          CB05AA26D53E5884BAC6308020380A29D2F08F25C4E039FEB2A9D495682BEEBD
          9CEBFB0B47DF71B413537CD27534B49453526A7C618DA588B7B2728A83D367CD
          1A7CF77EEA7AFC3A251ED769A5FAC3FB4DFEDC76BF09FC385BE1F58F857E2AF8
          96C757B7D3B57D0EDFC6563A65C68F0CD0CD22CF297DF83988011950583920E1
          4D7A7FC4AF8F9E05F83135A47E31F1AF84FC2925FF0016CBACEAF6F60D71FEE0
          95D7774ED9AFCADFDAE7F6178BE1E7FC1233E0D8F057C3ED70F8DBC51E20D035
          9F1625B58DCDD6A335C0D2EF8C8F3A619E30924CCB8C2852F8C64F3ADFB65FC1
          19BC39FF000551F891E2EF8BBF0BFC65F137C01E26F07C9078524D1F469F5282
          D6E85B411C6988F88DD192E17920ABCC92E06430F370FE1B70FE3152A787C4BB
          47EB37B25EDAABA32A315151755D357739CA16B3E48BBF33F87AAA713661479A
          5529ABBF65D5F2414D4DDDB51E6D2C93BDD733D2CB7FD48D7FE2CF85BC29E065
          F146ABE26F0FE9BE1A68D651AB5D6A30C36251BEEB79CCC1307B1CE0D1F0E3E2
          DF857E31688DA9F847C4DE1FF1569C8E636BAD1F5186FA00C3AA97899973C1E3
          35F901E12FD8EFC716DFF04B9F87DA7FC48D1BE2E69377A478EA7D6BC3E745F0
          BC5E207F0F59C91C207DBB4D96E2297CA7984F22E15B6EE3B81F342B7D21FF00
          045CB1F1A7877E397C60B0D57C216CBE19B936F796FE30FF0084364F0ACFAD5C
          3331F2DADDD10B0C3C8C40188D81C12245AF233FF0BF2DC0E538CC76171EAB4F
          0F3946C9251946352305696B17269DECA5CDA34A325EF1D780E2AC4D7C5D1A15
          70EE11A914FBB4DC5CB55BA5A5AED5BBB4F43D4FFE0A47FF00054DBAFD80BE23
          781FC3565F0EDBC757BE378A46B7C6BA34D3148B2A46B1E0DBCA1B7171C92B8A
          EFFF00662FDA8BE28FC50D675B1F13FE094DF07344D26C7ED71EA97BE2AB6D4A
          2B860C0321091A79602E58B31C6057C63FF05F4F811E27F8D3FB4D7C0D8B46F0
          EF8A357D35565B7BFBBD26C669BEC4AF77002C6445611B05C904F4C67B5773FF
          00050CFF008275EB3F06FF00E09B9E38F0AFC26BEF1F78CE6D5F57B1D5357B4D
          57526D4EF67B48092C9000A0901C4521400922338CF43EC61F85F856B70FE4F4
          25C94F178D6E33A927524E36ADCBCDA568D38B50D94A9B52EF1DCE3AB9AE6D0C
          C31951734A8D049A8AE557F72F6F81C9DDF55256F3D8FB93E1BFED03E03F8CB7
          9756DE10F1BF847C57716209B98B47D62DEF9EDC02012E22762BC9039F515E2D
          FB74FF00C14DBC1DFB1E7C24D6F5DD26E7C35E3FF11787EFEDECAFFC3967E248
          2DEF6CFCD72BBE50AB2BC7B48E8D18CFA8AF8A3F612FD992E359FDAF7E0DF893
          C3F6BE33F0B5EF847478A3D65B4EF845278734964F2A4F3ADB50BC9F500D3DC3
          FCC9E724326F250E300EDF9475EFD9BF5BF0FF00EC99E26F036ADFB3FF00C4EB
          BF8CF65E2F37B2F8AD344B89ED858AA889A2128C993749B880AA55C3EFDFC015
          ED641E1070E4B3BF655F172AB4A0E8B9536B92569CE71973394A9BE44A09B943
          DEF7D5968B9B8B31E32CC96079E9D15094B9ED24F997BB18B5649495DB935696
          9EEBF97EE3F83BF6C2F05DC7ECFDE02F1EF8CBC43E17F87D078EF42B1D661B7D
          675B82DD223736F1CC61596531890A799B770519C670338AEDE3F8A7E1897C21
          6DE215F11E82DA0DE63ECFA90D4223673E738DB2EED8D9C1E87B1AFC6DF895FB
          39F8D748FDA23E02F887C6BE13D5EFFC1517C2AD06C2D25BDF025D78B2CB479E
          0D323596DAE74F8A589B78B83212AE783283B1B69224F1D7ECA7E2FF000E7FC1
          23BC5BA4683A57C57D6ED358F1ED96A5A6E93ACF82FF00B1EEADD7CA904D2DBD
          A45757520818F97F3308C65780724D79B88F083239BC3CA9661CAEBD482B72DE
          0A339CA2E2A57B73524939294AEF5D168DF4D3E31C7C7DA29E1AFC9193DECDB8
          C53BB5BDA57D2CBEFD6DFAE775FB4FFC36B3F0B6B5AE49F103C17FD8FE1CB836
          7AA5EAEB56CD069D381930CAC1C849703EE361BDAB0E3FDAF7C23E3FF835E31F
          157C33D6BC37F126E7C256335C35869DADC11ACB32C4D24704931CAC024DB80E
          E368E4F3B4D7C45FB7D7ECBBA4FECCBFB277C23F09F80BE0A5978AEC2F3575BB
          D6AF6E34BD47574D1AE9ADE0492FE6B4B79434D23856E24DC8046502FCE057CD
          FF00057E0378E7C2FF001CBF68C3A7F86FC572F873C53F0A35A834FB987C0D27
          866D35995ADA0F2D62D3E3409139757D9101BCF2792C49E4C8FC2EC8B30CBA79
          9D2C5C92526E0AA28A528C2A460D4942574E49B6973C256F854927336C7F1563
          F0F895859524EE95DC6F74DC5B4D5D6A968BE16BBB4F43F593E05FED571F8CFF
          00676B0F1EFC46B1D07E159B99E5827B6BEF135ADE5ADB6D95913FD317644C5C
          28381C8CE3A8AF45F02FC46F0F7C50D0C6A9E19D7B46F1169ACC505DE997B15D
          C058751BE362B91E99AFC94F861FB36EA775FF0004DDF8109E22D0FE2BF8675C
          F09F89754B98AEF4DF072EB70E97E6DEEE0D7B612CB14A54F971B2388DD70197
          04B807EA2FF823E5BF8BB45F12FC53B0D63C2169A7E84D7B05C59F88A3F0C3F8
          764D6643E66E536EE884AA83B87CA36172390CB8F1F8BBC3DCB70983C6E6182C
          42BD1AB38A824D45455574D28CA52973696925ED253B68D35EF3CF28E2EC655C
          C28602BD17CB3845F36F2BBA7CEDB492B6B78FC2A37D9A7EEAFB8A8A28AFC60F
          D1428A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A00F1987F619F08CDFB4F59FC5BD4F51F136B9E2AD25EE5F4A5BEBC436BA4FDA
          13CB916248E3462BE5FC8048CE1474E79AF66A28AEFC76678AC6727D6AA397B3
          8A8C6FB4629B6925B2576DE9D5B7BB661430B4A8F37B28A5CCEEFCDF77DDE897
          C828A28AE0370A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
          A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
          A2803FFFD9}
        mmHeight = 21960
        mmLeft = 42333
        mmTop = 0
        mmWidth = 104775
        BandType = 0
      end
      object plbl15: TppLabel
        UserName = 'plbl15'
        Caption = 'Ao (À) Senhor(a)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 21167
        mmTop = 52917
        mmWidth = 30692
        BandType = 0
      end
      object plbl16: TppLabel
        UserName = 'plbl16'
        Caption = 'Assunto: Contribuições não recolhidas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 21431
        mmTop = 71967
        mmWidth = 72496
        BandType = 0
      end
      object plbl17: TppLabel
        UserName = 'plbl17'
        Caption = 'Senhor(a) '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 21167
        mmTop = 86519
        mmWidth = 20108
        BandType = 0
      end
      object pmpar1: TppMemo
        UserName = 'pmpar1'
        Caption = 'pmadasd'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Lines.Strings = (
          
            '1.'#9'Identificamos em nosso sistema que não houve pagamento/quitaç' +
            'ão da sua '
          #9'contribuição previdenciária do (s) mês (es) de: ')
        Transparent = True
        mmHeight = 11113
        mmLeft = 21167
        mmTop = 99484
        mmWidth = 153723
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object plbl5: TppLabel
        UserName = 'plbl5'
        Caption = 'Mês'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 120386
        mmWidth = 6615
        BandType = 0
      end
      object plbl6: TppLabel
        UserName = 'plbl6'
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 120386
        mmWidth = 9790
        BandType = 0
      end
      object plbl7: TppLabel
        UserName = 'plbl7'
        Caption = 'Juros/Correção'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 113506
        mmTop = 122767
        mmWidth = 24077
        BandType = 0
      end
      object plbl8: TppLabel
        UserName = 'plbl8'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 91546
        mmTop = 120386
        mmWidth = 7938
        BandType = 0
      end
      object plbl9: TppLabel
        UserName = 'plbl9'
        Caption = 'Sub-Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 148961
        mmTop = 122502
        mmWidth = 14817
        BandType = 0
      end
      object plbl10: TppLabel
        UserName = 'plbl10'
        Caption = 'Referência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 125148
        mmWidth = 16933
        BandType = 0
      end
      object plbl11: TppLabel
        UserName = 'plbl11'
        Caption = 'Contribuição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53181
        mmTop = 125148
        mmWidth = 19844
        BandType = 0
      end
      object plbl12: TppLabel
        UserName = 'plbl12'
        Caption = 'Contribuição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 86254
        mmTop = 125148
        mmWidth = 19579
        BandType = 0
      end
      object pln1: TppLine
        UserName = 'pln1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 24342
        mmTop = 118532
        mmWidth = 1588
        BandType = 0
      end
      object pln2: TppLine
        UserName = 'pln2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 45244
        mmTop = 118532
        mmWidth = 1588
        BandType = 0
      end
      object pln3: TppLine
        UserName = 'pln3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 82550
        mmTop = 118532
        mmWidth = 1588
        BandType = 0
      end
      object pln4: TppLine
        UserName = 'pln4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 109802
        mmTop = 118532
        mmWidth = 1323
        BandType = 0
      end
      object pln5: TppLine
        UserName = 'pln5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 140759
        mmTop = 118534
        mmWidth = 1588
        BandType = 0
      end
      object pln7: TppLine
        UserName = 'pln7'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 24606
        mmTop = 118534
        mmWidth = 146315
        BandType = 0
      end
      object pln6: TppLine
        UserName = 'pln6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12171
        mmLeft = 170657
        mmTop = 118532
        mmWidth = 1588
        BandType = 0
      end
      object sub1: TppSubReport
        UserName = 'sub1'
        ExpandAll = True
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = False
        TraverseAllData = False
        DataPipelineName = 'ppAuxEmail'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 129117
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object pchldrprt1: TppChildReport
          AutoStop = False
          DataPipeline = ppAuxEmail
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 384
          Top = 240
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAuxEmail'
          object ptlbnd1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object pdtlbnd2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 12965
            mmPrintPosition = 0
            object pln10: TppLine
              UserName = 'pln10'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 170657
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object pln12: TppLine
              UserName = 'pln101'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 140759
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object pln15: TppLine
              UserName = 'pln15'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 24342
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object pln16: TppLine
              UserName = 'pln16'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 45244
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object pln17: TppLine
              UserName = 'pln17'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 82550
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object pln18: TppLine
              UserName = 'pln18'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 12965
              mmLeft = 109802
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object pln20: TppLine
              UserName = 'pln20'
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 24342
              mmTop = 0
              mmWidth = 146315
              BandType = 4
            end
            object pdbtxt3: TppDBText
              UserName = 'pdbtxt3'
              DataField = 'MESREFERENCIA'
              DataPipeline = ppAuxEmail
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAuxEmail'
              mmHeight = 4498
              mmLeft = 26458
              mmTop = 5292
              mmWidth = 17198
              BandType = 4
            end
            object pdbm1: TppDBMemo
              UserName = 'pdbm1'
              CharWrap = False
              DataField = 'NOMECONTRIB'
              DataPipeline = ppAuxEmail
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAuxEmail'
              mmHeight = 10848
              mmLeft = 47625
              mmTop = 1852
              mmWidth = 34131
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object pdbtxt4: TppDBText
              UserName = 'pdbtxt4'
              DataField = 'VALORESPERADO'
              DataPipeline = ppAuxEmail
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAuxEmail'
              mmHeight = 4498
              mmLeft = 87048
              mmTop = 5292
              mmWidth = 17198
              BandType = 4
            end
            object pdbtxt5: TppDBText
              UserName = 'pdbtxt5'
              DataField = 'SOMAALTERADORES'
              DataPipeline = ppAuxEmail
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAuxEmail'
              mmHeight = 4498
              mmLeft = 112448
              mmTop = 5292
              mmWidth = 24871
              BandType = 4
            end
            object pvrbl1: TppVariable
              UserName = 'pvrbl1'
              CalcOrder = 0
              DataType = dtDouble
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4498
              mmLeft = 151077
              mmTop = 5556
              mmWidth = 10583
              BandType = 4
            end
          end
          object psmrybnd1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 16669
            mmPrintPosition = 0
            object pln19: TppLine
              UserName = 'pln19'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6615
              mmLeft = 24342
              mmTop = 0
              mmWidth = 529
              BandType = 7
            end
            object pln11: TppLine
              UserName = 'pln11'
              Weight = 0.75
              mmHeight = 2381
              mmLeft = 24342
              mmTop = 0
              mmWidth = 146579
              BandType = 7
            end
            object plbl13: TppLabel
              UserName = 'plbl13'
              Caption = 'Total'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 76729
              mmTop = 1058
              mmWidth = 9260
              BandType = 7
            end
            object plbl14: TppLabel
              UserName = 'plbl14'
              Caption = 'R$'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 143404
              mmTop = 1588
              mmWidth = 5292
              BandType = 7
            end
            object pln13: TppLine
              UserName = 'pln102'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6615
              mmLeft = 140759
              mmTop = 0
              mmWidth = 529
              BandType = 7
            end
            object pln14: TppLine
              UserName = 'pln14'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6879
              mmLeft = 170657
              mmTop = 0
              mmWidth = 794
              BandType = 7
            end
            object pln8: TppLine
              UserName = 'pln8'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 24342
              mmTop = 6276
              mmWidth = 146315
              BandType = 7
            end
            object pvrbl2: TppVariable
              OnPrint = pvrbl2Print
              UserName = 'pvrbl2'
              CalcOrder = 0
              DataType = dtDouble
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              mmHeight = 4498
              mmLeft = 151077
              mmTop = 1058
              mmWidth = 10583
              BandType = 7
            end
          end
          object rcdmdl1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C
              707672626C314F6E43616C630B50726F6772616D54797065070B747450726F63
              656475726506536F75726365068270726F63656475726520707672626C314F6E
              43616C63287661722056616C75653A2056617269616E74293B0D0A626567696E
              0D0A0D0A202056616C7565203A3D20417578456D61696C5B27534F4D41414C54
              455241444F524553275D2B0D0A20417578456D61696C5B2756414C4F52455350
              455241444F275D200D0A656E643B0D0A0D436F6D706F6E656E744E616D650606
              707672626C31094576656E744E616D6506064F6E43616C63074576656E744944
              02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060C707672626C324F6E43616C630B50726F6772616D54797065070B747450
              726F63656475726506536F75726365065F70726F63656475726520707672626C
              324F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
              67696E0D0A0D0A202056616C7565203A3D2056616C7565202B20707672626C31
              2E56616C75650D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650606
              707672626C32094576656E744E616D6506064F6E43616C63074576656E744944
              02210000}
          end
        end
      end
      object pmpar2: TppMemo
        UserName = 'pmpar2'
        KeepTogether = True
        Caption = 'pmadasd'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Lines.Strings = (
          
            '2.'#9'Para regularizar a sua situação perante o plano, efetuaremos ' +
            'o lançamento '
          
            #9'do débito devidamente atualizado no valor de R$ <VALOR>, em sua' +
            ' conta '
          #9'bancária, no próximo dia <DATA>.                  '
          '')
        ShiftRelativeTo = sub1
        Stretch = True
        Transparent = True
        mmHeight = 15346
        mmLeft = 20902
        mmTop = 139700
        mmWidth = 153723
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pmpar3: TppMemo
        UserName = 'pmpar3'
        Caption = 'pmadasd'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Lines.Strings = (
          
            '3.'#9'Não havendo efetivação do débito, esse procedimento será repe' +
            'tido por até'
          
            #9'duas vezes consecutivas com a devida atualização dos valores, e' +
            'm '
          #9'decorrência do atraso no pagamento das contribuições.'
          '')
        ShiftRelativeTo = pmpar2
        Stretch = True
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 15610
        mmLeft = 20902
        mmTop = 158486
        mmWidth = 153723
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pmpar4: TppMemo
        UserName = 'pmpar4'
        Caption = 'pmadasd'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Lines.Strings = (
          
            '4.'#9'Ressaltamos que conforme prevê o regulamento, o não recolhime' +
            'nto de três '
          
            #9'contribuições sucessivas acarretará a inadimplência no seu plan' +
            'o de '
          #9'benefícios.  '
          ''
          '')
        ShiftRelativeTo = pmpar3
        Stretch = True
        Transparent = True
        mmHeight = 14023
        mmLeft = 20902
        mmTop = 177800
        mmWidth = 153723
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pdbtxt1: TppDBText
        UserName = 'pdbtxt1'
        AutoSize = True
        DataField = 'NOMEPARTICIP'
        DataPipeline = ppAuxEmail
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppAuxEmail'
        mmHeight = 4657
        mmLeft = 21167
        mmTop = 59531
        mmWidth = 29337
        BandType = 0
      end
      object pdbtxt2: TppDBText
        UserName = 'pdbtxt2'
        AutoSize = True
        DataField = 'NOMEPARTICIP'
        DataPipeline = ppAuxEmail
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppAuxEmail'
        mmHeight = 4498
        mmLeft = 42863
        mmTop = 86784
        mmWidth = 29104
        BandType = 0
      end
    end
    object pdtlbnd1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 5080
      mmHeight = 0
      mmPrintPosition = 0
    end
    object pftrbnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39688
      mmPrintPosition = 0
      object plbl3: TppLabel
        UserName = 'plbl3'
        Caption = 
          'SCN, Quadra 02, Bloco A, Ed. Corporate Financial Center, 12º e 1' +
          '3º andares - CEP 70712-900 - Brasília/DF'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = 12615680
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 26988
        mmWidth = 135996
        BandType = 8
      end
      object plbl4: TppLabel
        UserName = 'plbl4'
        Caption = 
          'Telefone Geral: (61) 3329 1700   Central de Atendimento: 0800 70' +
          '6 9000'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = 12615680
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 31750
        mmWidth = 91546
        BandType = 8
      end
      object pm5: TppMemo
        UserName = 'pm5'
        Caption = 'pm5'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Lines.Strings = (
          'Atenciosamente,'
          'Coordenação de Arrecadação e Institutos - COARI')
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 13229
        mmLeft = 20902
        mmTop = 0
        mmWidth = 91017
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryAuxEmail: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    ObjectView = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 725
    Top = 141
  end
  object dsEnvioEmail1: TwwDataSource
    DataSet = qryAuxEmail
    Left = 730
    Top = 184
  end
  object ppDivAnalit: TppBDEPipeline
    DataSource = dsDivergAnalit
    OpenDataSource = False
    UserName = 'DivAnalit'
    Left = 728
    Top = 232
    object pplfDivAnalitppField1: TppField
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField2: TppField
      FieldAlias = 'IDADEHOJE'
      FieldName = 'IDADEHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField3: TppField
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField4: TppField
      FieldAlias = 'NOMECONTRIB'
      FieldName = 'NOMECONTRIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField5: TppField
      FieldAlias = 'NOMEPARTICIP'
      FieldName = 'NOMEPARTICIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField7: TppField
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField8: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField9: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField10: TppField
      FieldAlias = 'DATARECEBIMENTO'
      FieldName = 'DATARECEBIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField11: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField12: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField13: TppField
      FieldAlias = 'FLGCALCRESERVA'
      FieldName = 'FLGCALCRESERVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField14: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField15: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField16: TppField
      FieldAlias = 'CODDOCUMENTOPREV'
      FieldName = 'CODDOCUMENTOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField17: TppField
      FieldAlias = 'IDSITPART'
      FieldName = 'IDSITPART'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField18: TppField
      FieldAlias = 'PLANPREV'
      FieldName = 'PLANPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField19: TppField
      FieldAlias = 'PESSJUR'
      FieldName = 'PESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField20: TppField
      FieldAlias = 'SALPARTICIPACAO'
      FieldName = 'SALPARTICIPACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField21: TppField
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField22: TppField
      FieldAlias = 'VALORBASE1'
      FieldName = 'VALORBASE1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField23: TppField
      FieldAlias = 'VALORBASE2'
      FieldName = 'VALORBASE2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField24: TppField
      FieldAlias = 'VALORBASE3'
      FieldName = 'VALORBASE3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField25: TppField
      FieldAlias = 'FLGDEVOLUCAO'
      FieldName = 'FLGDEVOLUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplfDivAnalitppField26: TppField
      FieldAlias = 'SELECIONADO'
      FieldName = 'SELECIONADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
  end
  object outlook: TOutlookApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 656
    Top = 216
  end
  object extr1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = False
    HTML.UseTextFileName = True
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf32bit
    Graphic.UseTextFileName = True
    Graphic.Visible = True
    Graphic.PixelsPerInch = 192
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 578
    Top = 88
  end
  object updRep: TUpdateSQL
    ModifySQL.Strings = (
      '    UPDATE REPORTS SET TEMPLATE = :TEMPLATE'
      '    WHERE IDREPORTS = 205323')
    InsertSQL.Strings = (
      'INSERT INTO REPORTS (NAME, IDREPORTS, DESCRIPTION, TEMPLATE)'
      ' VALUES (:NAME,:IDREPORTS,:DESCRIPTION, :TEMPLATE)')
    Left = 641
    Top = 275
  end
  object qryRep: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM REPORTS'
      'where IDREPORTS = 205323')
    UpdateObject = updRep
    ValidateWithMask = True
    Left = 685
    Top = 277
  end
  object qryFLGemail: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '*'
      ' FROM HSTCONTRIBPREV ')
    ValidateWithMask = True
    Left = 685
    Top = 325
    object strngfldFLGemailMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object strngfldFLGemailMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object fltfldFLGemailNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.NUMRECEBIMENTO'
    end
    object fltfldFLGemailIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDMOTIVO'
    end
    object fltfldFLGemailIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDPESSOA'
    end
    object fltfldFLGemailIDRETROATIVO: TFloatField
      FieldName = 'IDRETROATIVO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDRETROATIVO'
    end
    object fltfldFLGemailVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORESPERADO'
    end
    object fltfldFLGemailIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDPLANOPREV'
    end
    object fltfldFLGemailIDREGRAALIMRESER: TFloatField
      FieldName = 'IDREGRAALIMRESER'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDREGRAALIMRESER'
    end
    object fltfldFLGemailIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDREGRACALCULO'
    end
    object dtmfldFLGemailDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATARECEBIMENTO'
    end
    object fltfldFLGemailIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDCONTRIBUICAO'
    end
    object fltfldFLGemailVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORRECEBIDO'
    end
    object fltfldFLGemailQUANTCOTAS: TFloatField
      FieldName = 'QUANTCOTAS'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.QUANTCOTAS'
    end
    object dtmfldFLGemailDATAPREVISAORECE: TDateTimeField
      FieldName = 'DATAPREVISAORECE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATAPREVISAORECE'
    end
    object fltfldFLGemailCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODPORTFORMA'
    end
    object fltfldFLGemailPLNCODIGOPREV: TFloatField
      FieldName = 'PLNCODIGOPREV'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PLNCODIGOPREV'
    end
    object fltfldFLGemailVALORBASE1: TFloatField
      FieldName = 'VALORBASE1'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORBASE1'
    end
    object fltfldFLGemailCODDOCUMENTOPREV: TFloatField
      FieldName = 'CODDOCUMENTOPREV'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODDOCUMENTOPREV'
    end
    object fltfldFLGemailPLNCODIGOEFET: TFloatField
      FieldName = 'PLNCODIGOEFET'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PLNCODIGOEFET'
    end
    object fltfldFLGemailCODDOCUMENTOEFET: TFloatField
      FieldName = 'CODDOCUMENTOEFET'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODDOCUMENTOEFET'
    end
    object fltfldFLGemailVALORBASE2: TFloatField
      FieldName = 'VALORBASE2'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORBASE2'
    end
    object fltfldFLGemailFLGCALCRESERVA: TFloatField
      FieldName = 'FLGCALCRESERVA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGCALCRESERVA'
    end
    object fltfldFLGemailVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORCALCULADO'
    end
    object fltfldFLGemailVALOROP1: TFloatField
      FieldName = 'VALOROP1'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALOROP1'
    end
    object fltfldFLGemailVALOROP2: TFloatField
      FieldName = 'VALOROP2'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALOROP2'
    end
    object fltfldFLGemailVALOROP3: TFloatField
      FieldName = 'VALOROP3'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALOROP3'
    end
    object fltfldFLGemailFLGDESCFOLHA: TFloatField
      FieldName = 'FLGDESCFOLHA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGDESCFOLHA'
    end
    object strngfldFLGemailCODREFERENCIA: TStringField
      FieldName = 'CODREFERENCIA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODREFERENCIA'
      Size = 30
    end
    object fltfldFLGemailFATOR: TFloatField
      FieldName = 'FATOR'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FATOR'
    end
    object dtmfldFLGemailDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATAINICIO'
    end
    object dtmfldFLGemailDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATAFINAL'
    end
    object fltfldFLGemailIDHISTPROPOSTA: TFloatField
      FieldName = 'IDHISTPROPOSTA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDHISTPROPOSTA'
    end
    object strngfldFLGemailFLGSITFUNDACAO: TStringField
      FieldName = 'FLGSITFUNDACAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGSITFUNDACAO'
      FixedChar = True
      Size = 2
    end
    object fltfldFLGemailIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDLOTE'
    end
    object strngfldFLGemailSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.SITRECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object strngfldFLGemailTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.TIPO'
      FixedChar = True
      Size = 1
    end
    object fltfldFLGemailPARCELA: TFloatField
      FieldName = 'PARCELA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PARCELA'
    end
    object fltfldFLGemailSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.SEQPROPOSTA'
    end
    object fltfldFLGemailVLRTOTRETROATIVO: TFloatField
      FieldName = 'VLRTOTRETROATIVO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VLRTOTRETROATIVO'
    end
    object fltfldFLGemailVLRDIFRETROATIVO: TFloatField
      FieldName = 'VLRDIFRETROATIVO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VLRDIFRETROATIVO'
    end
    object fltfldFLGemailFLGAPORTE: TFloatField
      FieldName = 'FLGAPORTE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGAPORTE'
    end
    object dtmfldFLGemailDTCOBRANCA: TDateTimeField
      FieldName = 'DTCOBRANCA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DTCOBRANCA'
    end
    object fltfldFLGemailFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGDEVOLUCAO'
    end
    object fltfldFLGemailFLGDIVERGENTE: TFloatField
      FieldName = 'FLGDIVERGENTE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGDIVERGENTE'
    end
    object fltfldFLGemailFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGCONCESSAO'
    end
    object fltfldFLGemailFLGEVENTO: TFloatField
      FieldName = 'FLGEVENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGEVENTO'
    end
    object fltfldFLGemailFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FONTEPAGADORA'
    end
    object dtmfldFLGemailTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.TRGDTINCLUSAO'
    end
    object strngfldFLGemailTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.TRGUSERINCLUSAO'
      Size = 30
    end
    object dtmfldFLGemailDATAULTALIM: TDateTimeField
      FieldName = 'DATAULTALIM'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATAULTALIM'
    end
    object fltfldFLGemailPERCRESERVA: TFloatField
      FieldName = 'PERCRESERVA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PERCRESERVA'
    end
    object fltfldFLGemailIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDPESSJUR'
    end
    object dtmfldFLGemailDATAEMISSCOB: TDateTimeField
      FieldName = 'DATAEMISSCOB'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATAEMISSCOB'
    end
    object strngfldFLGemailMOTIVOCANCEL: TStringField
      FieldName = 'MOTIVOCANCEL'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.MOTIVOCANCEL'
      Size = 200
    end
    object strngfldFLGemailFLGINTEVENTO: TStringField
      FieldName = 'FLGINTEVENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGINTEVENTO'
      FixedChar = True
      Size = 2
    end
    object dtmfldFLGemailDATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DATACANCELAMENTO'
    end
    object strngfldFLGemailFLGDATAINDRESERV: TStringField
      FieldName = 'FLGDATAINDRESERV'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGDATAINDRESERV'
      FixedChar = True
      Size = 1
    end
    object fltfldFLGemailNUMRECPARCELA1: TFloatField
      FieldName = 'NUMRECPARCELA1'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.NUMRECPARCELA1'
    end
    object fltfldFLGemailNUMRECPARCELA2: TFloatField
      FieldName = 'NUMRECPARCELA2'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.NUMRECPARCELA2'
    end
    object fltfldFLGemailIDLANCIRRF: TFloatField
      FieldName = 'IDLANCIRRF'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDLANCIRRF'
    end
    object fltfldFLGemailOPTRATDIVERG: TFloatField
      FieldName = 'OPTRATDIVERG'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.OPTRATDIVERG'
    end
    object fltfldFLGemailPERCCALCULO: TFloatField
      FieldName = 'PERCCALCULO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PERCCALCULO'
    end
    object fltfldFLGemailVALORPARARESERVA: TFloatField
      FieldName = 'VALORPARARESERVA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.VALORPARARESERVA'
    end
    object fltfldFLGemailFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGMANUAL'
    end
    object strngfldFLGemailFOLHAORIGEM: TStringField
      FieldName = 'FOLHAORIGEM'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FOLHAORIGEM'
      FixedChar = True
      Size = 1
    end
    object fltfldFLGemailIDPARCELAMENTO: TFloatField
      FieldName = 'IDPARCELAMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDPARCELAMENTO'
    end
    object fltfldFLGemailIDMOVBENEF: TFloatField
      FieldName = 'IDMOVBENEF'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDMOVBENEF'
    end
    object fltfldFLGemailIDTIPORECURSO: TFloatField
      FieldName = 'IDTIPORECURSO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDTIPORECURSO'
    end
    object strngfldFLGemailORIGEMRECURSO: TStringField
      FieldName = 'ORIGEMRECURSO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.ORIGEMRECURSO'
      Size = 200
    end
    object fltfldFLGemailIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDTITULAR'
    end
    object fltfldFLGemailCODDOCUMENTOPGAPAGAR: TFloatField
      FieldName = 'CODDOCUMENTOPGAPAGAR'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODDOCUMENTOPGAPAGAR'
    end
    object fltfldFLGemailCODDOCUMENTOPGARECEBER: TFloatField
      FieldName = 'CODDOCUMENTOPGARECEBER'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CODDOCUMENTOPGARECEBER'
    end
    object fltfldFLGemailIDPORTABILIDADE: TFloatField
      FieldName = 'IDPORTABILIDADE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDPORTABILIDADE'
    end
    object fltfldFLGemailSALCONTRIB: TFloatField
      FieldName = 'SALCONTRIB'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.SALCONTRIB'
    end
    object dtmfldFLGemailTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.TRGDTALTERACAO'
    end
    object strngfldFLGemailTRGUSERALTERACAO: TStringField
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.TRGUSERALTERACAO'
      Size = 60
    end
    object fltfldFLGemailIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDRUBRICA'
    end
    object strngfldFLGemailNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.NUMBANCO'
      Size = 10
    end
    object strngfldFLGemailNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.NUMAGENCIA'
      Size = 15
    end
    object strngfldFLGemailCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.CONTACORRENTE'
      Size = 15
    end
    object fltfldFLGemailPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.PLNCODIGO'
    end
    object fltfldFLGemailIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.IDCONTRATOEMPTMO'
    end
    object fltfldFLGemailFLGIMPORTADO: TFloatField
      FieldName = 'FLGIMPORTADO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGIMPORTADO'
    end
    object strngfldFLGemailUSERINTEGRACAO: TStringField
      FieldName = 'USERINTEGRACAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.USERINTEGRACAO'
      Size = 30
    end
    object dtmfldFLGemailDTINTEGRACAO: TDateTimeField
      FieldName = 'DTINTEGRACAO'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DTINTEGRACAO'
    end
    object fltfldFLGemailFLGENVIOEMAIL: TFloatField
      FieldName = 'FLGENVIOEMAIL'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.FLGENVIOEMAIL'
    end
    object dtmfldFLGemailDTAENVIOEMAIL: TDateTimeField
      FieldName = 'DTAENVIOEMAIL'
      Origin = 'BASEDADOS.HSTCONTRIBPREV.DTAENVIOEMAIL'
    end
  end
  object cdsAuxEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 586
    Top = 272
    object strngfldAuxEmailIDPESSOA: TStringField
      FieldName = 'IDPESSOA'
    end
    object strngfldAuxEmailIDPESSJUR: TStringField
      FieldName = 'IDPESSJUR'
    end
    object strngfldAuxEmailIDPLANOPREV: TStringField
      FieldName = 'IDPLANOPREV'
    end
    object strngfldAuxEmailMATRICULA: TStringField
      FieldName = 'MATRICULA'
    end
    object strngfldAuxEmailMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
    end
    object strngfldAuxEmailMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
    end
    object strngfldAuxEmailIDMOTIVO: TStringField
      FieldName = 'IDMOTIVO'
    end
    object strngfldAuxEmailNUMRECEBIMENTO: TStringField
      FieldName = 'NUMRECEBIMENTO'
    end
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 390
    Top = 5
  end
  object MontaSelectPartbkp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSJUR      = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA       = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV    = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA    = 1'
      'ELEGPATRO.IDPESSOA          = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR         = PATRO.IDPESSOA'
      'ELEGPATRO.IDSITFUNC         = SITFUNC.IDSITFUNC'
      'PARTPREVPLAN.IDSITPART      = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA             = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 374
    Top = 409
  end
  object qryDivergencias: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 16
    Top = 444
  end
  object qryFiltroContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, NOME'
      '  FROM CONTRIBUICAO'
      ' ORDER BY NOME '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 176
  end
end
