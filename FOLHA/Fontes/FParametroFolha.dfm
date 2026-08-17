inherited FrmParametroFolha: TFrmParametroFolha
  Left = 119
  Top = 86
  HelpContext = 230005
  Caption = 'Parametros Globais do Sistema'
  ClientHeight = 686
  ClientWidth = 1364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1364
    Height = 647
    object fcOutlookBar: TfcOutlookBar
      Left = 1
      Top = 1
      Width = 180
      Height = 645
      ActivePage = btnRubricas
      Align = alLeft
      Animation.Enabled = False
      Animation.Interval = 1
      Animation.Steps = 7
      AutoBold = True
      BevelOuter = bvNone
      BorderStyle = bsSingle
      ButtonSize = 23
      ButtonClassName = 'TfcShapeBtn'
      Layout = loVertical
      Options = [cboAutoCreateOutlookList]
      PanelAlignment = paDynamic
      ShowButtons = True
      TabOrder = 0
      object btnGerais: TfcShapeBtn
        Left = 0
        Top = 0
        Width = 176
        Height = 23
        Action = actGerais
        Caption = 'Gerais'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
      end
      object btnContraCheque: TfcShapeBtn
        Left = 0
        Top = 23
        Width = 176
        Height = 23
        Action = actContacheque
        Caption = 'Contracheque'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        NumGlyphs = 0
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 1
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
      end
      object btnAdiantBenef: TfcShapeBtn
        Left = 0
        Top = 46
        Width = 176
        Height = 23
        Action = actAdiantamento
        Caption = 'Adiantamento de Benefícios'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        NumGlyphs = 0
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Visible = False
      end
      object btnMotivos: TfcShapeBtn
        Left = 0
        Top = 69
        Width = 176
        Height = 23
        Action = actMotivos
        Caption = 'Motivos Padrão'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 3
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
      end
      object btnProcessoPreparo: TfcShapeBtn
        Left = 0
        Top = 92
        Width = 176
        Height = 23
        Caption = 'Processo Preparo'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 4
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnProcessopreviaClick
      end
      object btnProcessoprevia: TfcShapeBtn
        Left = 0
        Top = 115
        Width = 176
        Height = 23
        Caption = 'Processo Prévia'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 5
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnProcessopreviaClick
      end
      object btnProcessoEfetivacao: TfcShapeBtn
        Left = 0
        Top = 138
        Width = 176
        Height = 23
        Caption = 'Processo Efetivação'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 6
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnProcessopreviaClick
      end
      object btnRubricas: TfcShapeBtn
        Left = 0
        Top = 161
        Width = 176
        Height = 23
        Action = actRubricas
        Caption = 'Rubricas'
        Color = clBtnFace
        DitherColor = clWhite
        Down = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 7
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
      end
      object btnConvenios: TfcShapeBtn
        Left = 0
        Top = 618
        Width = 176
        Height = 23
        Caption = 'Convênios Externos'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 1
        ParentClipping = False
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 16
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnProcessopreviaClick
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListGerais: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListContraCheque: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListAdiantamento: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListMotivos: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListPreparo: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <
            item
              Action = actPreparo
              ImageIndex = 0
              Selected = True
              Separation = 10
              Tag = 0
              Text = 'Benefícios'
            end
            item
              Action = actContribuicoes
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Contribuições'
            end>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListPrevia: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <
            item
              Action = actPrevia
              ImageIndex = 0
              Selected = True
              Separation = 10
              Tag = 0
              Text = 'Prévia'
            end
            item
              Action = actCorrecao
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Correção Monetária'
            end
            item
              Action = actArredondamento
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Arredondamento'
            end
            item
              Action = actIRRF
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Imposto de Renda '
            end
            item
              Action = actpensao
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Pensão Alimentícia'
            end
            item
              Action = actSalfam
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Salário Familia'
            end
            item
              Action = actCPMF
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'CPMF'
            end>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListEfetivacao: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <
            item
              Action = actEfetivacao
              ImageIndex = 0
              Selected = True
              Separation = 10
              Tag = 0
              Text = 'Efetivação'
            end
            item
              Action = actContabilidade
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Contabilidade'
            end
            item
              Action = actCPagar
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Contas a Pagar'
            end>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 184
        Width = 176
        Height = 434
        object fcOutlookListRubricas: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 434
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
      object TfcOutlookPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 0
        object fcOutlookListConvenios: TfcOutlookList
          Left = 0
          Top = 0
          Width = 176
          Height = 0
          Align = alClient
          BorderStyle = bsNone
          ClickStyle = csSelect
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackStyle = hsIconHilite
          ItemHighlightColor = clBtnFace
          ItemHotTrackColor = clBtnShadow
          ItemLayout = blGlyphTop
          ItemShadowColor = clBtnText
          ItemSelectedDitherColor = clBackground
          Items = <
            item
              Action = actImportacao
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Importação de Arquivos'
            end
            item
              Action = actConvenios
              ImageIndex = 0
              Selected = False
              Separation = 10
              Tag = 0
              Text = 'Fechamento de Convenios'
            end>
          ItemSpacing = 20
          ItemsWidth = 0
          Layout = loVertical
          ScrollButtonsVisible = True
          ScrollInterval = 250
          Transparent = False
        end
      end
    end
    object ntbPai: TNotebook
      Left = 181
      Top = 1
      Width = 1182
      Height = 645
      Align = alClient
      PageIndex = 10
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'Gerais'
        object GrpCalcAutDeIR: TGroupBox
          Left = 0
          Top = 42
          Width = 1182
          Height = 98
          Align = alTop
          TabOrder = 0
          object Label10: TLabel
            Left = 8
            Top = 35
            Width = 552
            Height = 13
            Caption = 
              'Atenção : A utilização desta opção implica em que o Cadastro de ' +
              'Dependentes deverá estar com'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 68
            Top = 50
            Width = 487
            Height = 13
            Caption = 
              'as datas de inicio de dependencia de IRRF,  Salario Familia e In' +
              'validez devidamente '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 69
            Top = 63
            Width = 487
            Height = 13
            Caption = 
              'preenchidas. Caso o seu Cadastro de Dependentes não satisfaça es' +
              'tas condições é  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 70
            Top = 79
            Width = 218
            Height = 13
            Caption = 'aconselhável NÃO utilizar esta opção.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ChkNumDepIR: TCheckBox
            Left = 6
            Top = 15
            Width = 487
            Height = 18
            Caption = 
              'Utiliza atualização automática de número de dependentes de IR e ' +
              'Salário Família'
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 140
          Width = 1182
          Height = 38
          Align = alTop
          Caption = 'Integração Contábil-Financeira'
          TabOrder = 1
          object cbxIntegraCont: TCheckBox
            Left = 10
            Top = 16
            Width = 211
            Height = 17
            Caption = 'Integração com a Contabilidade'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbxIntegraFinanc: TCheckBox
            Left = 378
            Top = 15
            Width = 191
            Height = 17
            Caption = 'Integração com o Financeiro'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object GroupBox13: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 42
          Align = alTop
          Caption = 'Regra de verificação de Folha de Benefícios'
          TabOrder = 2
          object dblcRegraVerificacao: TwwDBLookupCombo
            Left = 5
            Top = 15
            Width = 566
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'40'#9'Regra'#9'F'
              'IDREGRA'#9'10'#9'Número'#9'F')
            DataField = 'IDREGRAVERIFFOLHA'
            DataSource = ds
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox15: TGroupBox
          Left = 0
          Top = 178
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 3
          Visible = False
          object chkTestaRegra: TCheckBox
            Left = 7
            Top = 11
            Width = 267
            Height = 17
            Caption = 'Executar teste de Regras na Implantação'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object GroupBox46: TGroupBox
          Left = 0
          Top = 211
          Width = 1182
          Height = 47
          Align = alTop
          Caption = 
            'Quantidade Máxima de Lotes de Manutenção Abertos Simultaneamente' +
            ' por Mês :'
          TabOrder = 4
          object spnLotes: TSpinEdit
            Left = 8
            Top = 15
            Width = 70
            Height = 26
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxValue = 10
            MinValue = 1
            ParentFont = False
            TabOrder = 0
            Value = 1
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 258
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 5
          object chkrubacjud: TCheckBox
            Left = 7
            Top = 11
            Width = 562
            Height = 17
            Caption = 
              'Utilizar Rubricas Previdenciárias específicas para as Ações Judi' +
              'ciais julgadas ganhas'
            TabOrder = 0
          end
        end
        object GroupBox40: TGroupBox
          Left = 0
          Top = 291
          Width = 1182
          Height = 45
          Align = alTop
          Caption = 
            'Seguindo a Parametrização Contábil Atual a Folha está efetuando ' +
            'lançamentos do tipo :'
          TabOrder = 6
          object lblcontab: TLabel
            Left = 6
            Top = 19
            Width = 568
            Height = 20
            AutoSize = False
            Caption = '   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox65: TGroupBox
          Left = 0
          Top = 338
          Width = 1182
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Situação para Habilitação de Benefícios do INSS'
          TabOrder = 7
          object dbcbIRRFRRA: TwwDBLookupCombo
            Left = 5
            Top = 14
            Width = 566
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
            LookupTable = qryIRRFRRA
            LookupField = 'IDSITHABILITACAO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbcbIRRFRRAChange
          end
        end
        object grp1: TGroupBox
          Left = 0
          Top = 453
          Width = 1182
          Height = 66
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Mês de adiantamento do Abono'
          TabOrder = 8
          object lblABFund: TLabel
            Left = 13
            Top = 20
            Width = 57
            Height = 13
            Caption = 'Fundação'
          end
          object lblABINSS: TLabel
            Left = 192
            Top = 20
            Width = 30
            Height = 13
            Caption = 'INSS'
          end
          object dblcAdtAbonoFund: TwwDBLookupCombo
            Left = 13
            Top = 34
            Width = 152
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MES'#9'9'#9'MES'#9'F')
            DataField = 'MESADIANTABONOFUND'
            DataSource = ds
            LookupTable = qryMes
            LookupField = 'NumMes'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbcbIRRFRRAChange
          end
          object dblcAdtAbonoINSS: TwwDBLookupCombo
            Left = 192
            Top = 34
            Width = 152
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MES'#9'9'#9'MES'#9'F')
            DataField = 'MESADIANTABONOINSS'
            DataSource = ds
            LookupTable = qryMes
            LookupField = 'NumMes'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbcbIRRFRRAChange
          end
        end
        object GroupBox64: TGroupBox
          Left = 0
          Top = 385
          Width = 1182
          Height = 66
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Mês do Abono'
          TabOrder = 9
          object Label33: TLabel
            Left = 13
            Top = 20
            Width = 57
            Height = 13
            Caption = 'Fundação'
          end
          object Label34: TLabel
            Left = 192
            Top = 20
            Width = 30
            Height = 13
            Caption = 'INSS'
          end
          object dblcAbonoFund: TwwDBLookupCombo
            Left = 13
            Top = 34
            Width = 152
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MES'#9'9'#9'MES'#9'F')
            DataField = 'MESABONOFUND'
            DataSource = ds
            LookupTable = qryMes
            LookupField = 'NumMes'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbcbIRRFRRAChange
          end
          object dblcAbonoINSS: TwwDBLookupCombo
            Left = 192
            Top = 34
            Width = 152
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MES'#9'9'#9'MES'#9'F')
            DataField = 'MESABONOINSS'
            DataSource = ds
            LookupTable = qryMes
            LookupField = 'NumMes'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dbcbIRRFRRAChange
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Contracheque'
        object lblSeparador: TLabel
          Left = 0
          Top = 261
          Width = 1182
          Height = 16
          Align = alTop
          Caption = '   Texto separador para emissão de dois contracheques por página'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
        object Label17: TLabel
          Left = 0
          Top = 82
          Width = 1182
          Height = 16
          Align = alTop
          Caption = 
            '   Texto a ser inserido no final do arquivo texto de contrachequ' +
            'e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label15: TLabel
          Left = 0
          Top = 0
          Width = 1182
          Height = 16
          Align = alTop
          Caption = 
            '   Texto a ser inserido no ínicio do arquivo texto de contracheq' +
            'ue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object mmSeparador: TMemo
          Left = 0
          Top = 277
          Width = 1182
          Height = 59
          Align = alTop
          Lines.Strings = (
            'mmSeparador')
          TabOrder = 4
        end
        object rgOpcao: TRadioGroup
          Left = 0
          Top = 209
          Width = 1182
          Height = 52
          Align = alTop
          Caption = 
            'Quantidade de Contracheques por página na geração do arquivo tex' +
            'to '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Um Contracheque por Página'
            'Dois Contracheques por Página')
          TabOrder = 3
        end
        object dbmmRodape: TDBMemo
          Left = 0
          Top = 98
          Width = 1182
          Height = 66
          Align = alTop
          DataField = 'RODAPEARQCC'
          DataSource = ds
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object dbmmCabec: TDBMemo
          Left = 0
          Top = 16
          Width = 1182
          Height = 66
          Align = alTop
          DataField = 'CABECARQCC'
          DataSource = ds
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object rgCodRubrica: TRadioGroup
          Left = 0
          Top = 164
          Width = 1182
          Height = 45
          Align = alTop
          Caption = 'Utilizar Código e Descrição das Rubricas :'
          Columns = 2
          Items.Strings = (
            'Interno'
            'Externo')
          TabOrder = 2
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Adiantamento'
        object GroupBox16: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Rubrica de Crédito de Adiantamento de Benefícios'
          TabOrder = 0
          object dblcCredAdiantamento: TwwDBLookupCombo
            Left = 4
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'IDPROVENTO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBCREDADIANT'
            DataSource = ds
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox17: TGroupBox
          Left = 0
          Top = 43
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Rubrica de compensação de Adiantamento de Benefícios'
          TabOrder = 1
          object cmbAdiantBenef: TwwDBLookupCombo
            Left = 4
            Top = 16
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'IDPROVENTO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBADIANT'
            DataSource = ds
            LookupTable = qryDescontos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox62: TGroupBox
          Left = 0
          Top = 129
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 
            'Rubrica de compensação de Adiantamento de Benefícios isento de I' +
            'R'
          TabOrder = 2
          object cmbAdiantBenefIsento: TwwDBLookupCombo
            Left = 4
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'IDPROVENTO'#9'10'#9'Código'#9'F')
            LookupTable = qryDescontosIsento
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox63: TGroupBox
          Left = 0
          Top = 86
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Rubrica de Crédito de Adiantamento de Benefícios isento de IR'
          TabOrder = 3
          object dblcCredAdiantamentoIsento: TwwDBLookupCombo
            Left = 4
            Top = 16
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'IDPROVENTO'#9'10'#9'Código'#9'F')
            LookupTable = qryProventosIsento
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Motivos'
        object GroupBox18: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 42
          Align = alTop
          Caption = 'Para Geração da Folha de Beneficios Normal'
          TabOrder = 0
          object cmbMotFolhaNormal: TwwDBLookupCombo
            Left = 7
            Top = 16
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            DataField = 'IDMOTIVOFOLHABEN'
            DataSource = ds
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Options = [loColLines]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox19: TGroupBox
          Left = 0
          Top = 42
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Para Geração da Folha de Beneficios de Abono'
          TabOrder = 1
          object cmbMotFolhaAbono: TwwDBLookupCombo
            Left = 8
            Top = 17
            Width = 566
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Motivo')
            DataField = 'IDMOTIVOABONO'
            DataSource = ds
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Options = [loColLines]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox20: TGroupBox
          Left = 0
          Top = 85
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Para Cobrança de Devolução de Benefício'
          TabOrder = 2
          object cmbMotDevBenef: TwwDBLookupCombo
            Left = 6
            Top = 16
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Motivo')
            DataField = 'IDMOTIVODEVOLBEN'
            DataSource = ds
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Options = [loColLines]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox21: TGroupBox
          Left = 0
          Top = 128
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Para Geração da Folha de Adiantamento de Benefício'
          TabOrder = 3
          object cmbMotFolhaAdiantBenef: TwwDBLookupCombo
            Left = 5
            Top = 16
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Motivo')
            DataField = 'IDMOTIVOADIANT'
            DataSource = ds
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Options = [loColLines]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Preparo'
        object GroupBox22: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 35
          Align = alTop
          TabOrder = 0
          Visible = False
          object DBCheckBox1: TDBCheckBox
            Left = 6
            Top = 12
            Width = 539
            Height = 17
            Caption = 
              'Recalcular benefício na Fundação se houver reajuste no INSS ou n' +
              'a Patrocinadora'
            DataField = 'FLGRECALCULOSRBMES'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox23: TGroupBox
          Left = 0
          Top = 35
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 1
          object DBCheckBox2: TDBCheckBox
            Left = 5
            Top = 14
            Width = 388
            Height = 17
            Caption = 'Executar no Preparo a Regra de Beneficio Minimo mensalmente'
            DataField = 'FLGEXECRGBMINMES'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object grbReajustaCancelado: TGroupBox
          Left = 0
          Top = 118
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 3
          object chkReajustaCancelado: TCheckBox
            Left = 5
            Top = 14
            Width = 556
            Height = 17
            Hint = 
              'Executa, no Abono Anual, as regras de reajuste, para os benefíci' +
              'os cancelados ao longo do ano.'
            Caption = 'Reajusta Benefícios Cancelados no Abono'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object grbPreparaBenefDesativado: TGroupBox
          Left = 0
          Top = 156
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 4
          object chkPreparaBenefDesativado: TCheckBox
            Left = 5
            Top = 14
            Width = 564
            Height = 17
            Hint = 'Prepara Benefícios de Plano Desativado'
            Caption = 'Prepara Benefícios de Plano Desativado'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object grbCancelaFilho: TGroupBox
          Left = 0
          Top = 194
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 5
          object chkCancelaFilho: TCheckBox
            Left = 5
            Top = 14
            Width = 532
            Height = 17
            Caption = 'Efetua Cancelamento Automático de Filho'
            TabOrder = 0
          end
        end
        object grbReajusteEmLote: TGroupBox
          Left = 0
          Top = 308
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 6
          Visible = False
          object chkReajusteEmLote: TCheckBox
            Left = 5
            Top = 14
            Width = 556
            Height = 17
            Caption = 'Reajusta em Lotes'
            TabOrder = 0
          end
        end
        object grbCalSalVirtMensalmente: TGroupBox
          Left = 0
          Top = 232
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 7
          object chkCalcSalVirtMensalmente: TCheckBox
            Left = 5
            Top = 14
            Width = 308
            Height = 17
            Caption = 'Não faz cálculo do salário virtual todo mês'
            TabOrder = 0
          end
        end
        object grbCalculaDifBenefCotas: TGroupBox
          Left = 0
          Top = 270
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 8
          Visible = False
          object chkCalculaDifBenefCotas: TCheckBox
            Left = 5
            Top = 14
            Width = 550
            Height = 17
            Caption = 'Calcula Diferenças de Benefícios em Cotas Pagos'
            TabOrder = 0
          end
        end
        object gboxInibeMsgDetalhada: TGroupBox
          Left = 0
          Top = 346
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 9
          object cboxInibeMsgDetalhada: TCheckBox
            Left = 5
            Top = 14
            Width = 556
            Height = 17
            Caption = 
              'Inibe mensagens detalhadas (individualizadas) quando ocorre reaj' +
              'uste de benefício'
            TabOrder = 0
          end
        end
        object gboxBuscaAbonoAnteriorPago: TGroupBox
          Left = 0
          Top = 384
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 10
          object cboxBuscaAbonoAnteriorPago: TCheckBox
            Left = 5
            Top = 14
            Width = 599
            Height = 17
            Caption = 
              'No preparo de abono buscar benefícios e contribuições processada' +
              's no ano (benefício temporário)'
            TabOrder = 0
          end
        end
        object GroupBox24: TGroupBox
          Left = 0
          Top = 73
          Width = 1182
          Height = 45
          Align = alTop
          Caption = 'Regra de Cálculo do Valor do Benefício Mínimo'
          TabOrder = 2
          object dblcRegraBenefMin: TwwDBLookupCombo
            Left = 5
            Top = 17
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'40'#9'Regra'#9'F'
              'IDREGRA'#9'10'#9'Número'#9'F')
            DataField = 'VLRBENEFMIN'
            DataSource = ds
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object gboxPreparoRetidoMensal: TGroupBox
          Left = 0
          Top = 422
          Width = 1182
          Height = 63
          Align = alTop
          TabOrder = 11
          object lblPreparoRetidoMensal: TLabel
            Left = 13
            Top = 13
            Width = 327
            Height = 43
            AutoSize = False
            Caption = 
              'Controla Preparo Mensal de Benefícios Retidos (estas opções prep' +
              'aram os históricos de benefícios e de contribuição sem lançar pa' +
              'ra a Prévia de Pagamento)'
            WordWrap = True
          end
          object cboxPreparoRetidoMensal: TComboBox
            Left = 349
            Top = 24
            Width = 329
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Items.Strings = (
              'Não Preparar'
              'Preparar Benefícios exceto Temporários'
              'Preparar Todos os Benefícios')
          end
        end
        object gboxPreparoRetidoAbono: TGroupBox
          Left = 0
          Top = 485
          Width = 1182
          Height = 74
          Align = alTop
          TabOrder = 12
          object Label32: TLabel
            Left = 13
            Top = 13
            Width = 308
            Height = 55
            AutoSize = False
            Caption = 
              'Controla Preparo de Abono de Benefícios Retidos (estas opções pr' +
              'eparam os históricos de benefícios e de contribuição proporciona' +
              'l a data da retenção e lança para a Prévia de Pagamento)'
            WordWrap = True
          end
          object cboxPreparoRetidoAbono: TComboBox
            Left = 349
            Top = 30
            Width = 329
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Items.Strings = (
              'Não Preparar'
              'Preparar Benefícios exceto Recadastramento'
              'Preparar Todos os Benefícios')
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Beneficios'
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Contribuicoes'
        object rdgEnvioContribManut: TRadioGroup
          Left = 0
          Top = 0
          Width = 1182
          Height = 99
          Align = alTop
          Caption = 
            ' Controle do Envio das Contribuições para a Prévia da Folha de M' +
            'anutenção '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Não Enviar Contribuição'
            
              'Enviar Contribuição com o Mês de Cobrança igual ao Mês de Pagame' +
              'nto da Folha'
            
              'Enviar Contribuição com o Mês de Cobrança menor ou igual ao Mês ' +
              'de Pagamento da Folha ')
          ParentFont = False
          TabOrder = 0
        end
        object rdgEnvioContribConc: TRadioGroup
          Left = 0
          Top = 99
          Width = 1182
          Height = 99
          Align = alTop
          Caption = 
            ' Controle do Envio das Contribuições para a Prévia da Folha de C' +
            'oncessão '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Não Enviar Contribuição'
            
              'Enviar Contribuição com o Mês de Cobrança igual ao Mês de Pagame' +
              'nto da Folha'
            
              'Enviar Contribuição com o Mês de Cobrança menor ou igual ao Mês ' +
              'de Pagamento da Folha ')
          ParentFont = False
          TabOrder = 1
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Previa'
        object GroupBox26: TGroupBox
          Left = 0
          Top = 42
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 1
          Visible = False
          object DBCheckBox7: TDBCheckBox
            Left = 6
            Top = 11
            Width = 237
            Height = 17
            Caption = 'Agrega o cálculo da suplementação'
            DataField = 'FLGCALCJUNTO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox51: TGroupBox
          Left = 0
          Top = 75
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 2
          object cboxEstruturaCalculo: TCheckBox
            Left = 5
            Top = 11
            Width = 324
            Height = 17
            Caption = 'Processa Estruturas de Cálculo ativas'
            TabOrder = 0
          end
        end
        object GroupBox53: TGroupBox
          Left = 0
          Top = 108
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 3
          object cboxNegativaBase: TCheckBox
            Left = 5
            Top = 11
            Width = 540
            Height = 17
            Caption = 
              'Zera bases de cálculo para Pensão Alimentícia, quando torna-se n' +
              'egativa.'
            TabOrder = 0
          end
        end
        object grbMensErroValorRegra: TGroupBox
          Left = 0
          Top = 141
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 4
          object chkMensErroValorRegra: TCheckBox
            Left = 5
            Top = 11
            Width = 484
            Height = 17
            Caption = 'Não Exibir Mensagem de Regra caso o Valor Retorne Zero'
            TabOrder = 0
          end
        end
        object grbTrataLoteIndependente: TGroupBox
          Left = 0
          Top = 174
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 5
          object chkTrataLoteIndependente: TCheckBox
            Left = 5
            Top = 11
            Width = 566
            Height = 17
            Caption = 'Trata Lotes Independentes na Folha de Abono Anual'
            TabOrder = 0
          end
        end
        object grbCalculaIrResgateIsento: TGroupBox
          Left = 0
          Top = 207
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 6
          object chkCalculaIrResgateIsento: TCheckBox
            Left = 5
            Top = 11
            Width = 538
            Height = 17
            Caption = 'Calcula IR Sobre Resgate para Recebedor com Isenção'
            TabOrder = 0
          end
        end
        object grbRecalculaBenefCotas: TGroupBox
          Left = 0
          Top = 240
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 7
          Visible = False
          object chkRecalculaBenefCotas: TCheckBox
            Left = 5
            Top = 11
            Width = 550
            Height = 17
            Caption = 'Recalcula Valor do Benefício em Cotas'
            TabOrder = 0
          end
        end
        object grbCalcPensAlimAntPrevia: TGroupBox
          Left = 0
          Top = 273
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 8
          object chkCalcPensAlimAntPrevia: TCheckBox
            Left = 5
            Top = 11
            Width = 570
            Height = 17
            Caption = 
              'Executar automaticamente a atualização de pensão alimentícia ant' +
              'es de executar a prévia.'
            TabOrder = 0
          end
        end
        object gboxPgtoFavOutros: TGroupBox
          Left = 0
          Top = 306
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 9
          object cboxPgtoFavOutros: TCheckBox
            Left = 5
            Top = 11
            Width = 569
            Height = 17
            Hint = 
              'Selecione esta opção se desejar efetuar o pagamento para qualque' +
              'r favorecido, mesmo que não seja consignatário de PA.'
            Caption = 
              'Processa pagamentos de qualquer Favorecido de Rubrica Individual' +
              '.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object GroupBox57: TGroupBox
          Left = 0
          Top = 339
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 10
          object cboxNaoRecalculaIRPagPendente: TCheckBox
            Left = 5
            Top = 11
            Width = 564
            Height = 17
            Hint = 
              'Selecione esta opção se não deseja calcular o IR na Prévia de Pa' +
              'gamento Pendente'
            Caption = 'Não recalcula IRRF na Prévia de Pagamento Pendente'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object GroupBox58: TGroupBox
          Left = 0
          Top = 372
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 11
          object Label29: TLabel
            Left = 6
            Top = 13
            Width = 448
            Height = 13
            Caption = 
              'Limite máximo (inclusive) para pagamento em folha extra das rubr' +
              'icas lançadas'
          end
          object dbrMaxLimitePgto: TDBRealEdit
            Left = 466
            Top = 10
            Width = 102
            Height = 18
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object gboxBuscaAdiantamentoPA: TGroupBox
          Left = 0
          Top = 405
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 12
          object cboxBuscaAdiantamentoPA: TCheckBox
            Left = 5
            Top = 11
            Width = 564
            Height = 17
            Caption = 
              'Busca adiantamentos de Pensão Alimentícia na Folha de Abono Anua' +
              'l'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
        end
        object gboxMargemDesconto: TGroupBox
          Left = 0
          Top = 438
          Width = 1182
          Height = 46
          Align = alTop
          Caption = ' Margem de Desconto '
          TabOrder = 13
          object lblValorMargemDesconto: TLabel
            Left = 294
            Top = 22
            Width = 99
            Height = 13
            Caption = 'Valor Percentual '
          end
          object lblTipoMargemDesconto: TLabel
            Left = 13
            Top = 22
            Width = 26
            Height = 13
            Caption = 'Tipo'
          end
          object Label9: TLabel
            Left = 545
            Top = 22
            Width = 18
            Height = 13
            Caption = ' % '
          end
          object dbredValorMargemdesconto: TDBRealEdit
            Left = 401
            Top = 18
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cbboxTipoMargemDesconto: TComboBox
            Left = 50
            Top = 18
            Width = 217
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Nenhum'
              'sobre Valor Bruto Total'
              'sobre Valor Líquido Legal')
          end
        end
        object pnlComp1: TPanel
          Left = 0
          Top = 0
          Width = 1182
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBRadioGroup1: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 203
            Height = 42
            Align = alLeft
            Caption = 'Décimos de Centavos'
            Columns = 2
            DataField = 'FLGCALCULOVALORES'
            DataSource = ds
            Items.Strings = (
              'Arredonda'
              'Trunca')
            TabOrder = 0
            Values.Strings = (
              '1'
              '0')
          end
          object GroupBox25: TGroupBox
            Left = 203
            Top = 33
            Width = 561
            Height = 36
            TabOrder = 1
            Visible = False
            object DbChBxUsaFolhaResg: TDBCheckBox
              Left = 7
              Top = 11
              Width = 304
              Height = 17
              Caption = 'Usa Folha de Resgate de Reseva em separado'
              DataField = 'FLGUSAFOLHARESG'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object gboxRateioPlanoRubrica: TGroupBox
            Left = 511
            Top = 0
            Width = 671
            Height = 42
            Hint = 'Marque a opção de Rateio de Rubricas por Plano na Prévia Normal'
            Align = alClient
            Caption = ' Rateio de Rubricas por Plano '
            TabOrder = 2
            object Label12: TLabel
              Left = 13
              Top = 19
              Width = 26
              Height = 13
              Caption = 'Tipo'
            end
            object cbboxRateioPlanoRubrica: TComboBox
              Left = 46
              Top = 15
              Width = 607
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Não faz Rateio por Plano'
                'Fazer Rateio por Plano')
            end
          end
          object gboxParcelas: TGroupBox
            Left = 203
            Top = 0
            Width = 308
            Height = 42
            Align = alLeft
            Caption = ' Controle de Parcela de Rubrica na Prévia Normal '
            TabOrder = 3
            object lblFormaParcela: TLabel
              Left = 13
              Top = 19
              Width = 35
              Height = 13
              Caption = 'Forma'
            end
            object cbboxTipoParcela: TComboBox
              Left = 56
              Top = 15
              Width = 217
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Pelo Prazo Restante'
                'Pela Parcela Corrente')
            end
          end
        end
        object gboxForcaDataRIndiv: TGroupBox
          Left = 0
          Top = 484
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 14
          object cboxForcaDataRIndiv: TCheckBox
            Left = 5
            Top = 11
            Width = 604
            Height = 17
            Hint = 
              'Esta opção é válida para todos os tipos de rubrica individual, p' +
              'ermanentes ou não.'
            Caption = 
              'Processa as rubricas individuais com data final em mês posterior' +
              ' ao mês da data de pagamento'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object gboxMesRefRIndiv: TGroupBox
          Left = 0
          Top = 517
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 15
          object cboxMesRefRIndiv: TCheckBox
            Left = 5
            Top = 11
            Width = 636
            Height = 17
            Hint = 'Esta opção é válida apenas para Rubrica Individuais parceladas.'
            Caption = 
              'Sempre atribuir o mês referência informado no cadastro da Rubric' +
              'a Individual, no processamento da Prévia.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object gboxRecebedorDuplicado: TGroupBox
          Left = 0
          Top = 550
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 16
          object cboxRecebedorDuplicado: TCheckBox
            Left = 5
            Top = 11
            Width = 636
            Height = 17
            Hint = 'Esta opção é válida apenas para Rubrica Individuais parceladas.'
            Caption = 
              'Permitir que seja verificado se existe mais de um recebedor por ' +
              'pessoa em um lote'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Correcao'
        object GroupBox4: TGroupBox
          Left = 0
          Top = 166
          Width = 1182
          Height = 59
          Align = alTop
          TabOrder = 0
          object DbChBxCorrigeBenef: TDBCheckBox
            Left = 7
            Top = 13
            Width = 266
            Height = 17
            Caption = 'Calcula correção monetária dos atrasados'
            DataField = 'FLGCORRIGEBENEF'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cboxCorrigeReservaMes: TCheckBox
            Left = 7
            Top = 33
            Width = 574
            Height = 17
            Caption = 
              'Executa regra de correção monetária no mês de pagamento para Fol' +
              'ha de Resgate de Reserva'
            TabOrder = 1
          end
        end
        object GroupBox27: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Rubrica de Correção Monetária (Positiva) de Benefício'
          TabOrder = 1
          Visible = False
          object cmbCMPosBenef: TwwDBLookupCombo
            Left = 4
            Top = 16
            Width = 570
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBCMBENEF'
            DataSource = ds
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox28: TGroupBox
          Left = 0
          Top = 43
          Width = 1182
          Height = 42
          Align = alTop
          Caption = 'Rubrica de Correção Monetária (Negativa) da Contribuição'
          TabOrder = 2
          Visible = False
          object cmbCMNegContrib: TwwDBLookupCombo
            Left = 5
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBCMCONT'
            DataSource = ds
            LookupTable = qryDescontos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox29: TGroupBox
          Left = 0
          Top = 85
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Rubrica da Correção Monetária (Negativa) de Beneficio'
          TabOrder = 3
          Visible = False
          object cmbCMNegBenef: TwwDBLookupCombo
            Left = 4
            Top = 15
            Width = 568
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBAJCMBENEF'
            DataSource = ds
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox30: TGroupBox
          Left = 0
          Top = 126
          Width = 1182
          Height = 40
          Align = alTop
          Caption = 'Rubrica de Correção Monetária (Positiva) de Contribuição'
          TabOrder = 4
          Visible = False
          object cmbCMPosContrib: TwwDBLookupCombo
            Left = 4
            Top = 14
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBAJCMCONT'
            DataSource = ds
            LookupTable = qryDescontos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Arredondamento'
        object GroupBox31: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Rubrica correspondente ao Arredondamento'
          TabOrder = 0
          object cmbArredonda: TwwDBLookupCombo
            Left = 5
            Top = 15
            Width = 570
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBARRED'
            DataSource = ds
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox32: TGroupBox
          Left = 0
          Top = 41
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Rubrica correspondente ao Arredondamento do Mês Anterior'
          TabOrder = 1
          object cmbArredMesAnt: TwwDBLookupCombo
            Left = 6
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBARREDMESANT'
            DataSource = ds
            LookupTable = qryDescontos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox33: TGroupBox
          Left = 0
          Top = 82
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Valor do Arredondondamento caso Conta Salário'
          TabOrder = 2
          object DBRealEdit1: TDBRealEdit
            Left = 435
            Top = 13
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRARREDSALARIO'
            DataSource = ds
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'IRRF'
        object Label5: TLabel
          Left = 8
          Top = 1
          Width = 138
          Height = 13
          Caption = 'Rubrica IRRF Fundação'
        end
        object Label39: TLabel
          Left = 8
          Top = 35
          Width = 111
          Height = 13
          Caption = 'Rubrica IRRF INSS'
        end
        object Label40: TLabel
          Left = 8
          Top = 137
          Width = 261
          Height = 13
          Caption = 'Rubrica para IRRF de Abono Anual Fundação'
        end
        object Label42_desativado: TLabel
          Left = 304
          Top = 474
          Width = 227
          Height = 13
          Caption = 'Rubrica para IRRF de pensão por morte'
          Visible = False
        end
        object Label43_desativado: TLabel
          Left = 304
          Top = 515
          Width = 236
          Height = 13
          Caption = 'Rubrica para IRRF de pensão alimentícia'
          Visible = False
        end
        object Label11: TLabel
          Left = 8
          Top = 380
          Width = 212
          Height = 13
          Caption = 'Rubrica para Compensação de IRRF '
        end
        object Label7: TLabel
          Left = 8
          Top = 69
          Width = 245
          Height = 13
          Caption = 'Rubrica para Dedução de Dependente I.R.'
        end
        object Label8: TLabel
          Left = 8
          Top = 103
          Width = 191
          Height = 13
          Caption = 'Rubrica para Dedução por Idade '
        end
        object Label50: TLabel
          Left = 8
          Top = 276
          Width = 229
          Height = 13
          Caption = 'Rubrica de IR para Resgate de Reserva'
        end
        object Label14: TLabel
          Left = 8
          Top = 172
          Width = 238
          Height = 13
          Caption = 'Rubrica para IRRF INSS de Abono Anual '
        end
        object Label20: TLabel
          Left = 8
          Top = 206
          Width = 261
          Height = 13
          Caption = 'Rubrica para Dedução de Dep. I.R. de Abono'
        end
        object Label21: TLabel
          Left = 8
          Top = 242
          Width = 245
          Height = 13
          Caption = 'Rubrica para Dedução por Idade de Abono'
        end
        object Label27: TLabel
          Left = 8
          Top = 311
          Width = 272
          Height = 13
          Caption = 'Rubrica para Dedução de Dep. I.R. de Resgate'
        end
        object Label28: TLabel
          Left = 8
          Top = 345
          Width = 256
          Height = 13
          Caption = 'Rubrica para Dedução por Idade de Resgate'
        end
        object Label41_desativado: TLabel
          Left = 304
          Top = 431
          Width = 251
          Height = 13
          Caption = 'Rubrica para IRRF de residentes no exterior'
          Visible = False
        end
        object cmbIRRF: TwwDBLookupCombo
          Left = 8
          Top = 13
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
          DataField = 'IDRUBIRRF'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRRF_INSS: TwwDBLookupCombo
          Left = 8
          Top = 47
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFINSS'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRRFAbono: TwwDBLookupCombo
          Left = 8
          Top = 150
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFABONO'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRRF_Pensao_desativado: TwwDBLookupCombo
          Left = 304
          Top = 486
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFPENSAO'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 16
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRRF_PA_desativado: TwwDBLookupCombo
          Left = 304
          Top = 527
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFPENALIM'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 17
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRRF_Comp: TwwDBLookupCombo
          Left = 8
          Top = 392
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFCOMPIR'
          DataSource = ds
          LookupTable = qryRubricaEspecial
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubDescDepIR: TwwDBLookupCombo
          Left = 8
          Top = 82
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBDESCDEP'
          DataSource = ds
          LookupTable = qryRubricaEspecial
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubDescIdadeIR: TwwDBLookupCombo
          Left = 8
          Top = 115
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBDESCIDADE'
          DataSource = ds
          LookupTable = qryRubricaEspecial
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbIRResgReserva: TwwDBLookupCombo
          Left = 8
          Top = 289
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDRUBIRRFRESG'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object GroupBox3: TGroupBox
          Left = 301
          Top = 12
          Width = 284
          Height = 92
          TabOrder = 12
          object Label3: TLabel
            Left = 10
            Top = 11
            Width = 231
            Height = 13
            Caption = 'Valor Mínimo para recolhimento de IRRF'
          end
          object Label6: TLabel
            Left = 10
            Top = 27
            Width = 60
            Height = 13
            Caption = '(Inclusive)'
          end
          object dbVlrMinIRRF: TDBRealEdit
            Left = 10
            Top = 44
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '10,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLMINIRFF'
            DataSource = ds
          end
          object cboxFlgVlIrMiniAbono: TDBCheckBox
            Left = 10
            Top = 69
            Width = 144
            Height = 17
            Caption = 'Incide sobre Abono'
            DataField = 'IDCONTRACHEQUE'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object cmbIRRFINSSAbono: TwwDBLookupCombo
          Left = 8
          Top = 184
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object GroupBox55: TGroupBox
          Left = 301
          Top = 104
          Width = 284
          Height = 121
          TabOrder = 13
          object Label1: TLabel
            Left = 32
            Top = 10
            Width = 240
            Height = 29
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 
              'Consolidar cálculo de IRRF considerando todos os pagamentos real' +
              'izados no mês'
            WordWrap = True
          end
          object Label16: TLabel
            Left = 10
            Top = 40
            Width = 257
            Height = 13
            Caption = 'Rubrica Informativa da Base de IRRF no mês'
          end
          object Label18: TLabel
            Left = 10
            Top = 80
            Width = 258
            Height = 13
            Caption = 'Rubrica Informativa do Valor de IRRF no mês'
          end
          object dblcIdRubBaseMensalIRRF: TwwDBLookupCombo
            Left = 10
            Top = 53
            Width = 264
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            LookupTable = qryRubricaEspecial
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object dblcIdRubValorMensalIRRF: TwwDBLookupCombo
            Left = 10
            Top = 93
            Width = 264
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            LookupTable = qryRubricaEspecial
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboxFlgBaseMensalIRRF: TCheckBox
            Left = 12
            Top = 16
            Width = 18
            Height = 17
            TabOrder = 2
            OnClick = cboxFlgBaseMensalIRRFClick
          end
        end
        object cmbRubDescDepIRAbono: TwwDBLookupCombo
          Left = 8
          Top = 219
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          LookupTable = qryRubDescDepIRAbono
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubDescIdadeIRAbono: TwwDBLookupCombo
          Left = 8
          Top = 254
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          LookupTable = qryRubDescIdadeIRAbono
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubDescDepIRResgate: TwwDBLookupCombo
          Left = 8
          Top = 323
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          LookupTable = qryRubDescDepIRResgate
          LookupField = 'IDPROVENTO'
          ParentFont = False
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubDescIdadeIRResgate: TwwDBLookupCombo
          Left = 8
          Top = 358
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          LookupTable = qryRubDescIdadeIRResgate
          LookupField = 'IDPROVENTO'
          ParentFont = False
          TabOrder = 10
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object GroupBox59: TGroupBox
          Left = 301
          Top = 225
          Width = 285
          Height = 68
          TabOrder = 14
          object Label30: TLabel
            Left = 7
            Top = 11
            Width = 251
            Height = 26
            Caption = 
              'Valor a ser deduzido da base de cálculo do IR, para a natureza d' +
              'e rendimento 0561'
            WordWrap = True
          end
          object dbrValorDeduzBase: TDBRealEdit
            Left = 9
            Top = 41
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataSource = ds
          end
        end
        object GroupBox14: TGroupBox
          Left = 301
          Top = 295
          Width = 285
          Height = 125
          Caption = ' Tributação Regressiva '
          TabOrder = 15
          object lblRubricaIRRFResgateTribRegressiva: TLabel
            Left = 5
            Top = 84
            Width = 184
            Height = 13
            Caption = 'Rubrica para resgate de reserva'
          end
          object lblRubricaIRRFVitalicioTribRegressiva: TLabel
            Left = 5
            Top = 14
            Width = 182
            Height = 13
            Caption = 'Rubrica para benefício vitalício'
          end
          object lblRubricaIRRFAbonoTribRegressiva: TLabel
            Left = 5
            Top = 49
            Width = 239
            Height = 13
            Caption = 'Rubrica para abono de benefício vitalício'
          end
          object cmbRubricaIRRFResgateTribRegressiva: TwwDBLookupCombo
            Left = 5
            Top = 97
            Width = 275
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryRubIRRegressiva
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cmbRubricaIRRFVitalicioTribRegressiva: TwwDBLookupCombo
            Left = 5
            Top = 27
            Width = 275
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryRubIRRegressiva
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cmbRubricaIRRFAbonoTribRegressiva: TwwDBLookupCombo
            Left = 5
            Top = 62
            Width = 275
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryRubIRRegressiva
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object grbRRA: TGroupBox
          Left = 597
          Top = 12
          Width = 316
          Height = 101
          Caption = 'RRA'
          TabOrder = 18
          object Label31: TLabel
            Left = 13
            Top = 17
            Width = 157
            Height = 13
            Caption = 'Rubrica IRRF - RRA - INSS'
          end
          object lblRRAIRRFFund: TLabel
            Left = 13
            Top = 55
            Width = 184
            Height = 13
            Caption = 'Rubrica IRRF - RRA - Fundação'
          end
          object cboRRA: TwwDBLookupCombo
            Left = 13
            Top = 31
            Width = 264
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpRRAINSS
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboRRAFund: TwwDBLookupCombo
            Left = 13
            Top = 69
            Width = 264
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpRRAFund
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object grpIrTotal: TGroupBox
          Left = 597
          Top = 118
          Width = 316
          Height = 102
          Caption = 'IR Total'
          TabOrder = 19
          object lblIRComp: TLabel
            Left = 13
            Top = 16
            Width = 287
            Height = 13
            Caption = 'Rubrica IRRF - IR Total - IR Complementar Normal'
          end
          object Label35: TLabel
            Left = 13
            Top = 56
            Width = 284
            Height = 13
            Caption = 'Rubrica IRRF - IR Total - IR Complementar Abono'
          end
          object cboIRComp: TwwDBLookupCombo
            Left = 13
            Top = 30
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRComp
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboIRCompAB: TwwDBLookupCombo
            Left = 13
            Top = 70
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRCompAB
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox66: TGroupBox
          Left = 596
          Top = 225
          Width = 316
          Height = 143
          Caption = 'IR Informativo - Ação Judicial Ganha'
          TabOrder = 20
          object Label36: TLabel
            Left = 13
            Top = 59
            Width = 213
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Normal'
          end
          object Label37: TLabel
            Left = 13
            Top = 99
            Width = 210
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Abono'
          end
          object Label38: TLabel
            Left = 13
            Top = 18
            Width = 196
            Height = 13
            Caption = 'Regra vinculada ao IR Informativo'
          end
          object cboIRInformativoAJ: TwwDBLookupCombo
            Left = 13
            Top = 73
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRInfo
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboIRInformativoAJAb: TwwDBLookupCombo
            Left = 13
            Top = 113
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRInfoAb
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboRegraAcao: TwwDBLookupCombo
            Left = 13
            Top = 33
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Nome Regra'#9'F')
            LookupTable = qryLkpRegraIrAcao
            LookupField = 'IDREGRA'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRegraCombobox
          end
        end
        object grpIrSimples: TGroupBox
          Left = 596
          Top = 373
          Width = 316
          Height = 249
          TabOrder = 21
          object lblIRSimples: TLabel
            Left = 13
            Top = 90
            Width = 213
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Normal'
          end
          object lblIRSimplesAB: TLabel
            Left = 13
            Top = 128
            Width = 210
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Abono'
          end
          object Label43: TLabel
            Left = 12
            Top = 24
            Width = 186
            Height = 13
            Caption = 'Valor para Dedução Simplificada'
          end
          object lblIRSimplesINSS: TLabel
            Left = 13
            Top = 168
            Width = 246
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Normal INSS'
          end
          object lblIRSimplesInssAB: TLabel
            Left = 13
            Top = 206
            Width = 243
            Height = 13
            Caption = 'Rubrica IRRF - IR Informativo Abono INSS'
          end
          object cboIRSimples: TwwDBLookupCombo
            Left = 13
            Top = 105
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRSimples
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboIRSimplesAB: TwwDBLookupCombo
            Left = 13
            Top = 142
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRSimplesAB
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object dbFlgDescSimples: TCheckBox
            Left = 12
            Top = -1
            Width = 288
            Height = 17
            Caption = 'Aplica Desconto Simplificado na Base de IRRF'
            TabOrder = 0
          end
          object dbrDeducaoDescSimples: TDBRealEdit
            Left = 204
            Top = 21
            Width = 93
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataSource = ds
          end
          object grpDescSimplesAbate: TGroupBox
            Left = 13
            Top = 44
            Width = 288
            Height = 42
            Caption = ' Considerar itens na apuração dos descontos '
            TabOrder = 4
            object dbFlgDescSimplesIdade: TCheckBox
              Left = 163
              Top = 20
              Width = 112
              Height = 17
              Caption = 'Idade (65 anos)'
              TabOrder = 0
            end
            object dbFlgDescSimplesDepend: TCheckBox
              Left = 23
              Top = 20
              Width = 112
              Height = 17
              Caption = 'Dependentes IR'
              TabOrder = 1
            end
          end
          object cboIRSimplesINSS: TwwDBLookupCombo
            Left = 13
            Top = 183
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRSimplesInss
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
          object cboIRSimplesInssAB: TwwDBLookupCombo
            Left = 13
            Top = 220
            Width = 288
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryLkpIRSimplesInssAB
            LookupField = 'IDPROVENTO'
            ParentFont = False
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox67: TGroupBox
          Left = 9
          Top = 421
          Width = 279
          Height = 44
          Caption = ' IRRF de residentes no exterior '
          TabOrder = 22
          object dbFlgNovoIRExt: TCheckBox
            Left = 10
            Top = 19
            Width = 263
            Height = 17
            Caption = 'Aplicar mesmo cálculo da IRRF Nacional'
            TabOrder = 0
          end
        end
        object cmbIRRFExterior_desativado: TwwDBLookupCombo
          Left = 304
          Top = 445
          Width = 280
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          DataField = 'IDRUBIRRFEXT'
          DataSource = ds
          LookupTable = qryDescontos
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 23
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Pensao'
        object Label22: TLabel
          Left = 3
          Top = 46
          Width = 307
          Height = 13
          Caption = 'Rubrica de Provento da Pensão Alimentícia de Abono'
        end
        object Label26: TLabel
          Left = 3
          Top = 83
          Width = 310
          Height = 13
          Caption = 'Rubrica de Desconto da Pensão Alimentícia de Abono'
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Cadastramento de Pensão Alimentícia'
          TabOrder = 0
          object DBCheckBox3: TDBCheckBox
            Left = 9
            Top = 16
            Width = 304
            Height = 17
            Caption = 'Obriga informar o Alimentado'
            DataField = 'FLGOBRIGAALMENTDO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object cmbRubConsigCredAbono: TwwDBLookupCombo
          Left = 3
          Top = 58
          Width = 576
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          LookupTable = qryRubConsigCredAbono
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
        object cmbRubConsigDescAbono: TwwDBLookupCombo
          Left = 3
          Top = 95
          Width = 576
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F'
            'CODIGO'#9'10'#9'Código'#9'F')
          LookupTable = qryRubConsigDescAbono
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = AtribuiRubricaCombobox
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'CPMF'
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 42
          Align = alTop
          Caption = 
            'Rubrica correspondente ao Valor do Provento da CPMF da Pensão Al' +
            'imentícia sobre o  INSS'
          TabOrder = 0
          object cmbVlr_CPMF_PA_INSS: TwwDBLookupCombo
            Left = 5
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox34: TGroupBox
          Left = 0
          Top = 42
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 
            'Rubrica correspondente ao Valor do Desconto da CPMF da Pensão Al' +
            'imentícia sobre o  INSS'
          TabOrder = 1
          object cmbVlr_CPMF_PA_INSS_DESC: TwwDBLookupCombo
            Left = 6
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            LookupTable = qryDescontos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox35: TGroupBox
          Left = 0
          Top = 85
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Rubrica correspondente ao Valor do CPMF do INSS'
          TabOrder = 2
          object cmbVlrCPMF_INSS: TwwDBLookupCombo
            Left = 6
            Top = 14
            Width = 570
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'CODIGO'#9'10'#9'Código'#9'F')
            DataField = 'IDRUBRICACPMF'
            DataSource = ds
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox36: TGroupBox
          Left = 0
          Top = 126
          Width = 1182
          Height = 39
          Align = alTop
          Caption = 'Índice da CPMF'
          TabOrder = 3
          object dbredIndiceCPMF: TDBRealEdit
            Left = 436
            Top = 11
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,003814')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCCPMF'
            DataSource = ds
          end
        end
        object GroupBox52: TGroupBox
          Left = 0
          Top = 165
          Width = 1182
          Height = 41
          Align = alTop
          Caption = 'Limite do Valor Bruto do INSS para Restituição de CPMF '
          TabOrder = 4
          object redBrutoINSSCPMF: TRealEdit
            Left = 436
            Top = 11
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Efetivacao'
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 32
          Align = alTop
          TabOrder = 0
          object cbxApaga: TCheckBox
            Left = 6
            Top = 11
            Width = 386
            Height = 17
            Caption = 'Apaga os Cálculos da Folha Após a Efetivação'
            TabOrder = 0
          end
        end
        object GroupBox37: TGroupBox
          Left = 0
          Top = 32
          Width = 1182
          Height = 30
          Align = alTop
          TabOrder = 1
          object cbxVerifica: TCheckBox
            Left = 8
            Top = 9
            Width = 447
            Height = 17
            Caption = 
              'Não fazer a verificação dos parâmetros financeiros antes da Efet' +
              'ivação'
            TabOrder = 0
          end
        end
        object grbConfimaNoFinal: TGroupBox
          Left = 0
          Top = 62
          Width = 1182
          Height = 30
          Align = alTop
          TabOrder = 2
          object chkConfirmaNoFinal: TCheckBox
            Left = 8
            Top = 9
            Width = 545
            Height = 17
            Caption = 'Pede Confirmação ao Final do Processo de Efetivação'
            TabOrder = 0
          end
        end
        object grbAbreDOCTED: TGroupBox
          Left = 0
          Top = 92
          Width = 1182
          Height = 63
          Align = alTop
          TabOrder = 3
          object cboxAbreDocAlt: TCheckBox
            Left = 8
            Top = 12
            Width = 545
            Height = 17
            Hint = 'Este parâmetro é utilizado na geração da Prévia  de Pagamento'
            Caption = 
              'Abre documentos para Contas Caixas x Forma de Pagamento alternat' +
              'ivo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = cboxAbreDocAltClick
          end
          object cboxAgrupaArqDocAlt: TCheckBox
            Left = 8
            Top = 30
            Width = 545
            Height = 30
            Hint = 'Este parâmetro é utilizado na geração da Prévia  de Pagamento'
            Caption = 
              'Agrupa arquivos eletrônicos por Contas Caixa x Forma de Pagament' +
              'o'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object gboxAbateTodasReservasRegra: TGroupBox
          Left = 0
          Top = 155
          Width = 1182
          Height = 32
          Align = alTop
          TabOrder = 4
          object cboxAbateTodasReservasRegra: TCheckBox
            Left = 6
            Top = 11
            Width = 704
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 
              'Efetua abatimento das reservas para TODAS que tiverem regra para' +
              'metrizada e APENAS estas'
            TabOrder = 0
          end
        end
        object GroupBox61: TGroupBox
          Left = 0
          Top = 187
          Width = 1182
          Height = 32
          Align = alTop
          TabOrder = 5
          object cboxEfetuaProvisaoAbono: TCheckBox
            Left = 6
            Top = 11
            Width = 704
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 
              'Contabiliza a provisão de abono anual para os benefícios pagos e' +
              'm versão normal'
            TabOrder = 0
          end
        end
        object gboxDesativacaoAutomaticaRubricaIndiv: TGroupBox
          Left = 0
          Top = 219
          Width = 1182
          Height = 108
          Align = alTop
          TabOrder = 6
          object lblDesativacaoAutomaticaRubricaIndiv: TLabel
            Left = 11
            Top = 18
            Width = 165
            Height = 26
            Caption = 'Desativação Automática da Rubrica Individual encerrada'
            WordWrap = True
          end
          object cboxDesativacaoAutomaticaRubricaIndiv: TComboBox
            Left = 11
            Top = 52
            Width = 263
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Nenhuma'
              'Individual (para cada pessoa processada)'
              'Geral (para qualquer registro na situação)')
          end
          object mmDesativacaoAutomaticaRubricaIndiv: TMemo
            Left = 280
            Top = 10
            Width = 896
            Height = 93
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = 12910591
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            Lines.Strings = (
              'Condições que definem o encerramento da '
              'Rubrica Individual e '
              'podem '
              'ser '
              'desativadas:'
              '    (a) data final atingida;'
              '    (b) número de parcelas atingido;'
              '    (c) saldo total atingido'
              'Obs: este processo pode melhorar o tempo de '
              'processamento da '
              'Prévia.')
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Contabilidade'
        object grpDebito: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 122
          Align = alTop
          Caption = 'Conta a Débito (para rubricas não parametrizadas)'
          TabOrder = 0
          object Label19: TLabel
            Left = 9
            Top = 40
            Width = 292
            Height = 13
            Caption = 'Centro de Custo (para rubricas não parametrizadas)'
          end
          object cmbCCusto: TwwDBLookupCombo
            Left = 6
            Top = 55
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
              'NOME'#9'30'#9'NOME')
            LookupTable = dtmIntegracao.qryCCusto
            LookupField = 'NOME'
            Enabled = False
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object GroupBox9: TGroupBox
            Left = 5
            Top = 77
            Width = 571
            Height = 39
            Caption = 'Descrição do Centro de Custo'
            TabOrder = 1
            object lbDescricaoCCusto: TLabel
              Left = 6
              Top = 17
              Width = 559
              Height = 13
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object dblkContaDebito: TwwDBLookupCombo
            Left = 6
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PLACONTA'#9'18'#9'PLACONTA'#9'F'
              'PLANOME'#9'40'#9'PLANOME'#9'F')
            LookupTable = qryContaDebito
            LookupField = 'PLACONTA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object grpCredito: TGroupBox
          Left = 0
          Top = 122
          Width = 1182
          Height = 128
          Align = alTop
          Caption = 'Conta a Crédito (para rubricas não parametrizadas)'
          TabOrder = 1
          object lbCcusto1: TLabel
            Left = 9
            Top = 42
            Width = 292
            Height = 13
            Caption = 'Centro de Custo (para rubricas não parametrizadas)'
          end
          object cmbCCusto1: TwwDBLookupCombo
            Left = 8
            Top = 57
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
              'NOME'#9'30'#9'NOME')
            LookupTable = dtmIntegracao.qryCCusto
            LookupField = 'NOME'
            Enabled = False
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object grbGrCcusto1: TGroupBox
            Left = 7
            Top = 82
            Width = 567
            Height = 39
            Caption = 'Descrição do Centro de Custo'
            TabOrder = 1
            object lbDescricaoCCusto1: TLabel
              Left = 6
              Top = 17
              Width = 554
              Height = 13
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object dblkContacredito: TwwDBLookupCombo
            Left = 8
            Top = 15
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PLACONTA'#9'18'#9'PLACONTA'#9'F'
              'PLANOME'#9'40'#9'PLANOME'#9'F')
            LookupTable = qryContaCredito
            LookupField = 'PLACONTA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 250
          Width = 1182
          Height = 47
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Panel2'
          TabOrder = 2
          object Label13: TLabel
            Left = 8
            Top = 3
            Width = 255
            Height = 13
            Caption = 'Subconta (para rubricas não parametrizadas)'
          end
          object dblkSubconta: TwwDBLookupCombo
            Left = 7
            Top = 18
            Width = 567
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'Descrição')
            LookupTable = dtmIntegracao.qrySubConta
            LookupField = 'CODSUBCONTA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Cpagar'
        object pnlGlobContab: TPanel
          Left = 0
          Top = 49
          Width = 1182
          Height = 139
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object lblcentrespon: TLabel
            Left = 5
            Top = 6
            Width = 360
            Height = 13
            Caption = 'Centro de Responsabilidade (para rubricas não parametrizadas)'
          end
          object lbAtividade: TLabel
            Left = 5
            Top = 49
            Width = 308
            Height = 13
            Caption = 'Atividade / Projeto (para rubricas não parametrizadas)'
          end
          object lblContasCaixas: TLabel
            Left = 8
            Top = 94
            Width = 395
            Height = 13
            Caption = 
              'Contas Caixas x Forma de Pagto (somente quando obriga Favorecido' +
              ')'
          end
          object cmbcentrespon: TwwDBLookupCombo
            Left = 5
            Top = 23
            Width = 559
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            LookupTable = dtmIntegracao.qrycentrespon
            LookupField = 'NOME'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object lkcmbDescAtividade: TwwDBLookupCombo
            Left = 5
            Top = 65
            Width = 559
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'Descrição')
            LookupTable = dtmIntegracao.qryAtividade
            LookupField = 'NOME'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblkpcmbPortForma: TwwDBLookupCombo
            Left = 8
            Top = 110
            Width = 559
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            LookupTable = dtmIntegracao.qryformapag
            LookupField = 'DESCRICAO'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 188
          Width = 1182
          Height = 46
          Align = alTop
          Caption = 
            ' Tipo de Desembolso para desconto no Contas a Pagar da Folha (pa' +
            'ra rubricas não parametrizadas)'
          TabOrder = 1
          object dblkRecdes: TwwDBLookupCombo
            Left = 8
            Top = 18
            Width = 560
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            LookupTable = qryCodRecDes
            LookupField = 'CODTIPRECDES'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object GroupBox11: TGroupBox
          Left = 0
          Top = 234
          Width = 1182
          Height = 46
          Align = alTop
          Caption = ' Tipo de Desembolso para Contas a Pagar do Favorecido '
          TabOrder = 2
          object dblkRecdesFav: TwwDBLookupCombo
            Left = 8
            Top = 18
            Width = 561
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F')
            LookupTable = qryCodRecDesfav
            LookupField = 'CODTIPRECDES'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object rdgUsaCPMF: TRadioGroup
          Left = 0
          Top = 280
          Width = 1182
          Height = 101
          Align = alTop
          Caption = 'O Sistema de Contas a Pagar está calculando a CPMF ?'
          Items.Strings = (
            'Não'
            'Sim')
          TabOrder = 3
          OnClick = rdgUsaCPMFClick
        end
        object GroupBox54: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 49
          Align = alTop
          Caption = ' Portador Forma para pagamento à Patrocinadora '
          TabOrder = 4
          object dblkPortFormaPatro: TwwDBLookupCombo
            Left = 11
            Top = 17
            Width = 559
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO')
            DataField = 'CODPORTFORMAPATRO'
            DataSource = ds
            LookupTable = qryPortFormaPatro
            LookupField = 'CODPORTFORMA'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object GroupBox8: TGroupBox
          Left = 85
          Top = 295
          Width = 477
          Height = 41
          Caption = 'Programa'
          TabOrder = 5
          object dblPrograma: TwwDBLookupCombo
            Left = 8
            Top = 13
            Width = 463
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA'#9'F')
            LookupTable = qryPrograma
            LookupField = 'DESCPROGRAMA'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object GroupBox12: TGroupBox
          Left = 85
          Top = 336
          Width = 477
          Height = 41
          Caption = 'Centro de Custo'
          TabOrder = 6
          object cmbccusto2: TwwDBLookupCombo
            Left = 8
            Top = 15
            Width = 462
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME'#9'F')
            LookupTable = dtmIntegracao.qryCCusto
            LookupField = 'NOME'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object gboxCentroResponPadrao: TGroupBox
          Left = 0
          Top = 381
          Width = 1182
          Height = 46
          Align = alTop
          Caption = ' Centro de responsabilidade Padrão '
          TabOrder = 7
          object dblcCentroResponPadrao: TwwDBLookupCombo
            Left = 7
            Top = 18
            Width = 386
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            LookupTable = dtmIntegracao.qrycentrespon
            LookupField = 'NOME'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object mmCentroResponPadrao: TMemo
            Left = 398
            Top = 8
            Width = 382
            Height = 34
            Color = 12910591
            Lines.Strings = (
              'Caso informado, irá sobrepor a parametrização das rubricas na'
              'geração dos documentos a pagar da Efetivação de versão.')
            TabOrder = 1
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Rubricas'
        object GroupBox38: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 0
          object cbxUsaCodRubExtInt: TCheckBox
            Left = 6
            Top = 10
            Width = 292
            Height = 17
            Caption = 'Exibe Código e Descrição Externos da Rubrica'
            TabOrder = 0
          end
        end
        object GroupBox39: TGroupBox
          Left = 0
          Top = 33
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 1
          object DBCheckBox5: TDBCheckBox
            Left = 6
            Top = 11
            Width = 263
            Height = 17
            Caption = 'Utiliza Verificação de Prazo nas Rubricas'
            DataField = 'FLGUSAPRAZORUB'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox41: TGroupBox
          Left = 0
          Top = 66
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 2
          object DBCheckBox8: TDBCheckBox
            Left = 5
            Top = 11
            Width = 316
            Height = 17
            Caption = 'Visualiza apenas Rubricas da Folha de Benefícios'
            DataField = 'FLGVERRUBFOLBEN'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox42: TGroupBox
          Left = 0
          Top = 99
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 3
          Visible = False
          object DBCheckBox10: TDBCheckBox
            Left = 5
            Top = 12
            Width = 399
            Height = 17
            Caption = 
              'Permite Lançar Rubricas Individuais para Assistidos e Pensionist' +
              'as'
            DataField = 'FLGVERATIVOS'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox43: TGroupBox
          Left = 0
          Top = 132
          Width = 1182
          Height = 33
          Align = alTop
          TabOrder = 4
          object ChkFlgEstadoRub: TCheckBox
            Left = 5
            Top = 11
            Width = 268
            Height = 17
            Caption = 'Utiliza Verificação do Estado da Rubrica'
            TabOrder = 0
          end
        end
        object GroupBox44: TGroupBox
          Left = 0
          Top = 197
          Width = 1182
          Height = 32
          Align = alTop
          TabOrder = 5
          object ChkUsaRegraxRub: TCheckBox
            Left = 5
            Top = 11
            Width = 324
            Height = 17
            Caption = 'Utiliza Verificação de Rubricas Associadas a Regras'
            TabOrder = 0
          end
        end
        object GroupBox45: TGroupBox
          Left = 0
          Top = 229
          Width = 1182
          Height = 47
          Align = alTop
          Caption = 'Grupo de Regras da Folha de Benefícios'
          TabOrder = 6
          object dblkGrupoRegra: TwwDBLookupCombo
            Left = 6
            Top = 17
            Width = 571
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'Grupo Regra'#9'F')
            LookupTable = qryGrupoRegra
            LookupField = 'IDGRUPOREGRA'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblkGrupoRegraChange
            OnExit = dblkGrupoRegraExit
          end
        end
        object grpAgrupaPorRubrica: TGroupBox
          Left = 0
          Top = 165
          Width = 1182
          Height = 32
          Align = alTop
          TabOrder = 7
          object ChkAgrupaRubrica: TCheckBox
            Left = 5
            Top = 11
            Width = 324
            Height = 17
            Caption = 'Utiliza Agrupamento por Rubricas em Demonstrativos'
            TabOrder = 0
          end
        end
        object gboxTipoRegra: TGroupBox
          Left = 0
          Top = 276
          Width = 1182
          Height = 92
          Align = alTop
          Caption = ' Controle por Tipo de Regra '
          TabOrder = 8
          object lblTipoRegraPadrao: TLabel
            Left = 16
            Top = 65
            Width = 108
            Height = 13
            Hint = 
              'Para este tipo de regra não é realizada a verificação de cadastr' +
              'amento de outras regras do mesmo tipo'
            Caption = 'Tipo Regra Padrão'
            ParentShowHint = False
            ShowHint = True
          end
          object cboxAcessoTipoRegra: TCheckBox
            Left = 11
            Top = 17
            Width = 342
            Height = 17
            Hint = 
              'No Cadastramento de Regras faz controle de acesso dos usuários p' +
              'or Tipo de Regra do Grupo de Regra definido'
            Caption = 'Faz controle de acesso dos usuários por Tipo de Regra'
            TabOrder = 0
          end
          object cboxControleTipoRegra: TCheckBox
            Left = 11
            Top = 38
            Width = 358
            Height = 17
            Hint = 
              'No cadastramento de regras faz verificação se existem regras não' +
              ' cadastradas do mesmo Tipo de Regra do Grupo de Regra definido'
            Caption = 'Faz verificação de outras regras do mesmo Tipo de Regra'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object dblcTipoRegraPadrao: TwwDBLookupCombo
            Left = 134
            Top = 61
            Width = 1028
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCREGRA'#9'60'#9'Descrição'#9'F'
              'IDTIPOREGRA'#9'10'#9'Código'#9'F')
            LookupTable = qryTipoRegra
            LookupField = 'IDTIPOREGRA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Salfam'
        object GroupBox47: TGroupBox
          Left = 0
          Top = 42
          Width = 1182
          Height = 37
          Align = alTop
          Caption = 'Valor do Salário Familia'
          TabOrder = 0
          Visible = False
          object dbrValSalfam: TDBRealEdit
            Left = 433
            Top = 10
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox48: TGroupBox
          Left = 0
          Top = 79
          Width = 1182
          Height = 37
          Align = alTop
          Caption = 'Valor da Remuneração-Teto'
          TabOrder = 1
          Visible = False
          object dbrTetoSalfam: TDBRealEdit
            Left = 433
            Top = 10
            Width = 138
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox49: TGroupBox
          Left = 0
          Top = 116
          Width = 1182
          Height = 43
          Align = alTop
          Caption = 'Rubrica de Crédito do Salário Família'
          TabOrder = 2
          object dblcSalFam: TwwDBLookupCombo
            Left = 4
            Top = 15
            Width = 569
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F'
              'IDPROVENTO'#9'10'#9'IDPROVENTO'#9'F')
            LookupTable = qryProventos
            LookupField = 'IDPROVENTO'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRubricaCombobox
          end
        end
        object GroupBox56: TGroupBox
          Left = 0
          Top = 0
          Width = 1182
          Height = 42
          Align = alTop
          Caption = 'Regra de Cálculo do Salário Família'
          TabOrder = 3
          object dblcRegraSalFam: TwwDBLookupCombo
            Left = 5
            Top = 15
            Width = 566
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'40'#9'Regra'#9'F'
              'IDREGRA'#9'10'#9'Número'#9'F')
            LookupTable = qryRegra
            LookupField = 'IDREGRA'
            Options = [loColLines, loRowLines, loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = AtribuiRegraCombobox
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Importacao'
        object GroupBox50: TGroupBox
          Left = 0
          Top = 0
          Width = 784
          Height = 50
          Align = alTop
          Caption = 'Máscara de Matrícula Utilizada na Importação de Arquivos'
          TabOrder = 0
          object Label2: TLabel
            Left = 7
            Top = 14
            Width = 294
            Height = 13
            Caption = 'Se a sua Matricula possuir Digito Verificador, utilize'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 7
            Top = 30
            Width = 283
            Height = 13
            Caption = 'o caracter de '#39'-'#39' para separá-lo da parte principal.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object mkeMascara: TMaskEdit
            Left = 614
            Top = 17
            Width = 161
            Height = 24
            Anchors = [akTop, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 13
            ParentFont = False
            TabOrder = 0
          end
        end
        object gboxMatricula: TGroupBox
          Left = 0
          Top = 50
          Width = 784
          Height = 38
          Align = alTop
          TabOrder = 1
          object cboxMatriculaCompleta: TCheckBox
            Left = 5
            Top = 14
            Width = 550
            Height = 17
            Caption = 
              'Considerar a matrícula completa na importação de arquivos de con' +
              'vênio'
            TabOrder = 0
          end
        end
        object GroupBox60: TGroupBox
          Left = 0
          Top = 88
          Width = 784
          Height = 38
          Align = alTop
          TabOrder = 2
          object cboxMatriculaDependente: TCheckBox
            Left = 5
            Top = 14
            Width = 550
            Height = 17
            Caption = 'Dependente tem matrícula própria'
            TabOrder = 0
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Convenios'
        object rdgConvenios: TRadioGroup
          Left = 0
          Top = 0
          Width = 1182
          Height = 47
          Align = alTop
          Caption = 'Geração de Documentos no Contas a Pagar :'
          Columns = 2
          Items.Strings = (
            'Por Convenio'
            'Por Favorecido')
          TabOrder = 0
        end
        object grbTipoDocPagtoConv: TGroupBox
          Left = 0
          Top = 47
          Width = 1182
          Height = 47
          Align = alTop
          Caption = 'Tipo de Documento para Pagamento de Convênio'
          TabOrder = 1
          object dblkTipoDocPagtoConv: TwwDBLookupCombo
            Left = 8
            Top = 18
            Width = 1154
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryTipoDocConvP
            LookupField = 'CODTIPDOC'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object grbTipoDocConvR: TGroupBox
          Left = 0
          Top = 94
          Width = 1182
          Height = 47
          Align = alTop
          Caption = 'Tipo do Documento para Recebimento de Convênio'
          TabOrder = 2
          object dblkTipoDocConvR: TwwDBLookupCombo
            Left = 8
            Top = 18
            Width = 1154
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            LookupTable = qryTipoDocConvR
            LookupField = 'CODTIPDOC'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object gboxGeraAlteradoresCAPConvenio: TGroupBox
          Left = 0
          Top = 141
          Width = 1182
          Height = 38
          Align = alTop
          TabOrder = 3
          object cboxGeraAlteradoresCAPConvenio: TCheckBox
            Left = 5
            Top = 14
            Width = 599
            Height = 17
            Caption = 
              'Gera alteradores vinculados ao favorecido, no fechamento de conv' +
              'ênios.'
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 647
    Width = 1364
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 131
    Top = 319
    TargetsData = (
      1
      6
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object alPrincipal: TActionList
    Left = 51
    Top = 319
    object actGerais: TAction
      Caption = 'Gerais'
      OnExecute = actGeraisExecute
    end
    object actContacheque: TAction
      Tag = 1
      Caption = 'Contra-Cheque'
      OnExecute = actContachequeExecute
    end
    object actAdiantamento: TAction
      Tag = 2
      Caption = 'Adiantamento de Benefícios'
      OnExecute = actAdiantamentoExecute
    end
    object actMotivos: TAction
      Tag = 3
      Caption = 'Motivos Padrão'
      OnExecute = actMotivosExecute
    end
    object actBeneficios: TAction
      Tag = 5
      Caption = 'Benefícios'
      OnExecute = actBeneficiosExecute
    end
    object actContribuicoes: TAction
      Tag = 6
      Caption = 'Contribuições'
      OnExecute = actContribuicoesExecute
    end
    object actPreparo: TAction
      Tag = 4
      Caption = 'Preparo'
      OnExecute = actPreparoExecute
    end
    object actPrevia: TAction
      Tag = 7
      Caption = 'Prévia'
      OnExecute = actPreviaExecute
    end
    object actCorrecao: TAction
      Tag = 8
      Caption = 'Correção Monetária'
      OnExecute = actCorrecaoExecute
    end
    object actArredondamento: TAction
      Tag = 9
      Caption = 'Arredondamento'
      OnExecute = actArredondamentoExecute
    end
    object actIRRF: TAction
      Tag = 10
      Caption = 'Imposto de Renda '
      OnExecute = actIRRFExecute
    end
    object actpensao: TAction
      Tag = 11
      Caption = 'Pensão Alimentícia'
      OnExecute = actpensaoExecute
    end
    object actCPMF: TAction
      Tag = 12
      Caption = 'CPMF'
      OnExecute = actCPMFExecute
    end
    object actEfetivacao: TAction
      Tag = 13
      Caption = 'Efetivação'
      OnExecute = actEfetivacaoExecute
    end
    object actRubricas: TAction
      Tag = 16
      Caption = 'Rubricas'
      OnExecute = actRubricasExecute
    end
    object actContabilidade: TAction
      Tag = 14
      Caption = 'Contabilidade'
      OnExecute = actContabilidadeExecute
    end
    object actCPagar: TAction
      Tag = 15
      Caption = 'Contas a Pagar'
      OnExecute = actCPagarExecute
    end
    object actSalfam: TAction
      Caption = 'Salário Familia'
      OnExecute = actSalfamExecute
    end
    object actImportacao: TAction
      Caption = 'Importação de Arquivos'
      OnExecute = actImportacaoExecute
    end
    object actConvenios: TAction
      Caption = 'Fechamento de Convenios'
      OnExecute = actConveniosExecute
    end
  end
  object msTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo (A/S)')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 35
    Top = 431
  end
  object PrintDialog1: TPrintDialog
    Left = 7
    Top = 431
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ControlType.Strings = (
      'FLGIRRF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 98
    Top = 69
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO)' +
        ' AS CODIGO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO' +
        ') AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 1'
      'AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND P.IDFUNDACAO = :PIDFUNDACAO'
      
        'ORDER BY DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRIC' +
        'AO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 82
    Top = 347
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object dsRecdes: TDataSource
    DataSet = qryCodRecDes
    Left = 790
    Top = 454
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO,DESCRICAO'
      'FROM     MOTIVO'
      'ORDER BY UPPER(DESCRICAO)'
      ' ')
    ValidateWithMask = True
    Left = 38
    Top = 389
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 25
    Top = 347
  end
  object qryCodRecDesfav: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES,'
      '  RECPAG,'
      '  TRIM(CODTIPRECDES)||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      ''
      'FROM TIPORECEBDESEMB'
      'WHERE PLANO = :PIDPLANO'
      '  AND IDPESSOA = :PIDFUNDACAO'
      ''
      'ORDER BY'
      '  CODTIPRECDES')
    Left = 10
    Top = 389
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object QryTipoAgreg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'T.CODTIPOCUSTAGREG, T.DESCCUSTAGREG'
      'FROM'#9'TIPOAGRE T'
      'WHERE IDPESSOA = :PIDFUNDACAO'
      'ORDER BY'#9'T.DESCCUSTAGREG'
      #9
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 54
    Top = 461
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryCodRecDes: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES,'
      '  RECPAG,'
      '  TRIM(CODTIPRECDES)||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      ''
      'FROM TIPORECEBDESEMB'
      'WHERE PLANO = :PIDPLANO'
      '  AND IDPESSOA = :PIDFUNDACAO'
      ''
      'ORDER BY'
      '  CODTIPRECDES'
      ''
      ' ')
    Left = 114
    Top = 211
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsRecDesFav: TDataSource
    DataSet = qryCodRecDesfav
    Left = 818
    Top = 454
  end
  object dsContaCredito: TDataSource
    DataSet = qryContaCredito
    Left = 902
    Top = 454
  end
  object qryContaCredito: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME'
      'FROM PLANOCONTA'
      'WHERE PLANO = :PIDPLANO'
      'ORDER BY PLACONTA   '
      ' ')
    Left = 122
    Top = 441
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANO'
        ParamType = ptUnknown
      end>
  end
  object dsContaDebito: TDataSource
    DataSet = qryContaDebito
    Left = 846
    Top = 454
  end
  object qryRecDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsRecDesemb
    SQL.Strings = (
      'SELECT CODTIPRECDES,'#9'DESCRICAO'
      'FROM TIPORECEBDESEMB'
      'WHERE RECPAG = '#39'P'#39
      'AND IDPESSOA = :PIDFUNDACAO')
    ValidateWithMask = True
    Left = 98
    Top = 285
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      ' ')
    ValidateWithMask = True
    Left = 30
    Top = 211
  end
  object qryContaDebito: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACONTA, PLANOME'
      'FROM PLANOCONTA'
      'WHERE PLANO = :PIDPLANO'
      'ORDER BY PLACONTA   '
      ' ')
    Left = 86
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANO'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaEspecial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO)' +
        ' AS CODIGO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO' +
        ') AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 2'
      'AND P.FLGESPECIAL IN (1, 2)'
      'AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND IDFUNDACAO = :PIDFUNDACAO'
      
        'ORDER BY DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRIC' +
        'AO)'
      '')
    ValidateWithMask = True
    Left = 28
    Top = 283
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO)' +
        ' AS CODIGO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO' +
        ') AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 0'
      'AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND P.IDFUNDACAO = :PIDFUNDACAO'
      
        'ORDER BY DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRIC' +
        'AO) '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 62
    Top = 419
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object dsRecDesemb: TwwDataSource
    Left = 874
    Top = 454
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA'
      'FROM REGRA'
      'ORDER BY UPPER(NOMEREGRA)')
    ValidateWithMask = True
    Left = 18
    Top = 475
  end
  object qry: TwwQuery
    CachedUpdates = True
    BeforePost = qryBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FLGIMPCERTIF,      IDMOTIVOFORNCOMI,  IDMOTIVODIVERG,    ' +
        'IDRUBDESCDEP,'
      
        '       IDREGRACALCINSS,   FLGINTCONTBASS,    IDRUBARRED,        ' +
        'IDRUBDESCIDADE,'
      
        '       IDMOTIVOCONTRIBP,  FLGINTCPAGAR,      IDRUBARREDMESANT,  ' +
        'IDRUBIRRFPROVJUD,'
      
        '       IDRUBIRRF,         FLGINTCRECEBER,    IDTIPOAGRECPMF,    ' +
        'IDRUBIRRFCOMPIR,'
      
        '       IDPESSOA,          FLGINTCPAGARPREV,  IDRUBRICACPMF,     ' +
        'VLMINIRFF,'
      
        '       CODALTDESPDESCFO,  FLGINTCRECEBERPR,  FLGUSAFOLHARESG,   ' +
        'FLGVLIRMINABONO,'
      
        '       CODALTIRCOM,       IDMOTIVOABONO,     FLGTRATAPREVIAPA,  ' +
        'FLGRECALCULOSRBMES,'
      
        '       DATAULTDVR,        IDRUBQUITAEMPREST, FLGCALCULOVALORES, ' +
        'FLGEXECRGBMINMES,'
      
        '       PRAZODVR,          IDRUBQUITAPREV,    FLGCORRIGEBENEF,   ' +
        'IDRUBCREDADIANT,'
      
        '       FLGINTCONTAB,      IDRUBQUITAASSIST,  VLRARREDSALARIO,   ' +
        'CABECARQCC,'
      
        '       MARGEMDESCONTOS,   IDDOCUMENTO,       IDRUBIRRFRESG,     ' +
        'RODAPEARQCC,'
      
        '       MASCTIPORESERVA,   IDRUBIRRFINSS,     VLRBENEFMIN,       ' +
        'FLGOBRIGAALMENTDO,'
      
        '       FLGMULTIFUNDACAO,  IDRUBIRRFABONO,    IDRUBCMBENEF,      ' +
        'FLGUSACODRUBEXT,'
      
        '       IDMOTIVOEMPRESTI,  IDRUBIRRFEXT,      IDRUBCMCONT,       ' +
        'FLGUSAPRAZORUB,'
      
        '       IDMOTIVOCONTRIBA,  IDRUBIRRFPENSAO,   IDRUBAJCMBENEF,    ' +
        'FLGUSABENEFXRUB,'
      
        '       IDMOTIVOATRASOAS,  IDMOTIVODEVOLBEN,  IDRUBAJCMCONT,     ' +
        'FLGVERRUBFOLBEN,'
      
        '       IDMOTIVODEVOLAS,   IDCONTRACHEQUE,    IDMOTDEVOLNAOIDEN, ' +
        'FLGVERATIVOS,'
      
        '       IDMOTIVOFINANCAS,  IDRUBADIANT,       FLGCALCJUNTO,      ' +
        'IDRUBPENSAO,'
      
        '       IDMOTIVOFOLHABEN,  IDMOTIVOADIANT,    PERCCPMF,          ' +
        'IDGRINSTR,'
      
        '       IDMOTIVOFORNPAG,   IDRUBIRRFPENALIM,  IDREGRAVERIFFOLHA, ' +
        'IDRUBPALIMINSS,'
      
        '       CODPORTFORMAPATRO, IDFUNDACAO, MESADIANTABONOFUND, MESADI' +
        'ANTABONOINSS,'
      '       MESABONOFUND, MESABONOINSS'
      ' FROM PARAMAPREV'
      'WHERE IDFUNDACAO = :PIDFUNDACAO'
      ' '
      ' ')
    UpdateObject = updQry
    PictureMasks.Strings = (
      
        'MARGEMDESCONTOS'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,' +
        '-]#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 96
    Top = 389
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryFLGIMPCERTIF: TFloatField
      FieldName = 'FLGIMPCERTIF'
      Origin = 'BASEDADOS.PARAMAPREV.FLGIMPCERTIF'
    end
    object qryIDREGRACALCINSS: TFloatField
      FieldName = 'IDREGRACALCINSS'
      Origin = 'BASEDADOS.PARAMAPREV.IDREGRACALCINSS'
    end
    object qryIDMOTIVOCONTRIBP: TFloatField
      FieldName = 'IDMOTIVOCONTRIBP'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOCONTRIBP'
    end
    object qryIDRUBIRRF: TFloatField
      FieldName = 'IDRUBIRRF'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRF'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMAPREV.IDPESSOA'
    end
    object qryCODALTDESPDESCFO: TFloatField
      FieldName = 'CODALTDESPDESCFO'
      Origin = 'BASEDADOS.PARAMAPREV.CODALTDESPDESCFO'
    end
    object qryCODALTIRCOM: TFloatField
      FieldName = 'CODALTIRCOM'
      Origin = 'BASEDADOS.PARAMAPREV.CODALTIRCOM'
    end
    object qryDATAULTDVR: TDateTimeField
      FieldName = 'DATAULTDVR'
      Origin = 'BASEDADOS.PARAMAPREV.DATAULTDVR'
    end
    object qryPRAZODVR: TFloatField
      FieldName = 'PRAZODVR'
      Origin = 'BASEDADOS.PARAMAPREV.PRAZODVR'
    end
    object qryFLGINTCONTAB: TFloatField
      FieldName = 'FLGINTCONTAB'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCONTAB'
    end
    object qryMARGEMDESCONTOS: TFloatField
      FieldName = 'MARGEMDESCONTOS'
      Origin = 'BASEDADOS.PARAMAPREV.MARGEMDESCONTOS'
    end
    object qryMASCTIPORESERVA: TStringField
      FieldName = 'MASCTIPORESERVA'
      Origin = 'BASEDADOS.PARAMAPREV.MASCTIPORESERVA'
      FixedChar = True
      Size = 12
    end
    object qryFLGMULTIFUNDACAO: TFloatField
      FieldName = 'FLGMULTIFUNDACAO'
      Origin = 'BASEDADOS.PARAMAPREV.FLGMULTIFUNDACAO'
    end
    object qryIDMOTIVOEMPRESTI: TFloatField
      FieldName = 'IDMOTIVOEMPRESTI'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOEMPRESTI'
    end
    object qryIDMOTIVOCONTRIBA: TFloatField
      FieldName = 'IDMOTIVOCONTRIBA'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOCONTRIBA'
    end
    object qryIDMOTIVOATRASOAS: TFloatField
      FieldName = 'IDMOTIVOATRASOAS'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOATRASOAS'
    end
    object qryIDMOTIVODEVOLAS: TFloatField
      FieldName = 'IDMOTIVODEVOLAS'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVODEVOLAS'
    end
    object qryIDMOTIVOFINANCAS: TFloatField
      FieldName = 'IDMOTIVOFINANCAS'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOFINANCAS'
    end
    object qryIDMOTIVOFOLHABEN: TFloatField
      FieldName = 'IDMOTIVOFOLHABEN'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOFOLHABEN'
    end
    object qryIDMOTIVOFORNPAG: TFloatField
      FieldName = 'IDMOTIVOFORNPAG'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOFORNPAG'
    end
    object qryIDMOTIVOFORNCOMI: TFloatField
      FieldName = 'IDMOTIVOFORNCOMI'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOFORNCOMI'
    end
    object qryFLGINTCONTBASS: TFloatField
      FieldName = 'FLGINTCONTBASS'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCONTBASS'
    end
    object qryFLGINTCPAGAR: TFloatField
      FieldName = 'FLGINTCPAGAR'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCPAGAR'
    end
    object qryFLGINTCRECEBER: TFloatField
      FieldName = 'FLGINTCRECEBER'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCRECEBER'
    end
    object qryFLGINTCPAGARPREV: TFloatField
      FieldName = 'FLGINTCPAGARPREV'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCPAGARPREV'
    end
    object qryFLGINTCRECEBERPR: TFloatField
      FieldName = 'FLGINTCRECEBERPR'
      Origin = 'BASEDADOS.PARAMAPREV.FLGINTCRECEBERPR'
    end
    object qryIDMOTIVOABONO: TFloatField
      FieldName = 'IDMOTIVOABONO'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOABONO'
    end
    object qryIDRUBQUITAEMPREST: TFloatField
      FieldName = 'IDRUBQUITAEMPREST'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBQUITAEMPREST'
    end
    object qryIDRUBQUITAPREV: TFloatField
      FieldName = 'IDRUBQUITAPREV'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBQUITAPREV'
    end
    object qryIDRUBQUITAASSIST: TFloatField
      FieldName = 'IDRUBQUITAASSIST'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBQUITAASSIST'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.PARAMAPREV.IDDOCUMENTO'
    end
    object qryIDRUBIRRFINSS: TFloatField
      FieldName = 'IDRUBIRRFINSS'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFINSS'
    end
    object qryIDRUBIRRFABONO: TFloatField
      FieldName = 'IDRUBIRRFABONO'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFABONO'
    end
    object qryIDRUBIRRFEXT: TFloatField
      FieldName = 'IDRUBIRRFEXT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFEXT'
    end
    object qryIDRUBIRRFPENSAO: TFloatField
      FieldName = 'IDRUBIRRFPENSAO'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFPENSAO'
    end
    object qryIDMOTIVODEVOLBEN: TFloatField
      FieldName = 'IDMOTIVODEVOLBEN'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVODEVOLBEN'
    end
    object qryIDCONTRACHEQUE: TFloatField
      FieldName = 'IDCONTRACHEQUE'
      Origin = 'BASEDADOS.PARAMAPREV.IDCONTRACHEQUE'
    end
    object qryIDRUBADIANT: TFloatField
      FieldName = 'IDRUBADIANT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBADIANT'
    end
    object qryIDMOTIVOADIANT: TFloatField
      FieldName = 'IDMOTIVOADIANT'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVOADIANT'
    end
    object qryIDRUBIRRFPENALIM: TFloatField
      FieldName = 'IDRUBIRRFPENALIM'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFPENALIM'
    end
    object qryIDMOTIVODIVERG: TFloatField
      FieldName = 'IDMOTIVODIVERG'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTIVODIVERG'
    end
    object qryIDRUBARRED: TFloatField
      FieldName = 'IDRUBARRED'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBARRED'
    end
    object qryIDRUBARREDMESANT: TFloatField
      FieldName = 'IDRUBARREDMESANT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBARREDMESANT'
    end
    object qryIDTIPOAGRECPMF: TFloatField
      FieldName = 'IDTIPOAGRECPMF'
      Origin = 'BASEDADOS.PARAMAPREV.IDTIPOAGRECPMF'
    end
    object qryIDRUBRICACPMF: TFloatField
      FieldName = 'IDRUBRICACPMF'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBRICACPMF'
    end
    object qryFLGUSAFOLHARESG: TFloatField
      FieldName = 'FLGUSAFOLHARESG'
      Origin = 'BASEDADOS.PARAMAPREV.FLGUSAFOLHARESG'
    end
    object qryFLGTRATAPREVIAPA: TFloatField
      FieldName = 'FLGTRATAPREVIAPA'
      Origin = 'BASEDADOS.PARAMAPREV.FLGTRATAPREVIAPA'
    end
    object qryFLGCALCULOVALORES: TFloatField
      FieldName = 'FLGCALCULOVALORES'
      Origin = 'BASEDADOS.PARAMAPREV.FLGCALCULOVALORES'
    end
    object qryFLGCORRIGEBENEF: TFloatField
      FieldName = 'FLGCORRIGEBENEF'
      Origin = 'BASEDADOS.PARAMAPREV.FLGCORRIGEBENEF'
    end
    object qryVLRARREDSALARIO: TFloatField
      FieldName = 'VLRARREDSALARIO'
      Origin = 'BASEDADOS.PARAMAPREV.VLRARREDSALARIO'
    end
    object qryIDRUBIRRFRESG: TFloatField
      FieldName = 'IDRUBIRRFRESG'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFRESG'
    end
    object qryVLRBENEFMIN: TFloatField
      FieldName = 'VLRBENEFMIN'
      Origin = 'BASEDADOS.PARAMAPREV.VLRBENEFMIN'
    end
    object qryIDRUBCMBENEF: TFloatField
      FieldName = 'IDRUBCMBENEF'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBCMBENEF'
    end
    object qryIDRUBCMCONT: TFloatField
      FieldName = 'IDRUBCMCONT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBCMCONT'
    end
    object qryIDRUBAJCMBENEF: TFloatField
      FieldName = 'IDRUBAJCMBENEF'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBAJCMBENEF'
    end
    object qryIDRUBAJCMCONT: TFloatField
      FieldName = 'IDRUBAJCMCONT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBAJCMCONT'
    end
    object qryIDMOTDEVOLNAOIDEN: TFloatField
      FieldName = 'IDMOTDEVOLNAOIDEN'
      Origin = 'BASEDADOS.PARAMAPREV.IDMOTDEVOLNAOIDEN'
    end
    object qryFLGCALCJUNTO: TFloatField
      FieldName = 'FLGCALCJUNTO'
      Origin = 'BASEDADOS.PARAMAPREV.FLGCALCJUNTO'
    end
    object qryPERCCPMF: TFloatField
      FieldName = 'PERCCPMF'
      Origin = 'BASEDADOS.PARAMAPREV.PERCCPMF'
    end
    object qryIDREGRAVERIFFOLHA: TFloatField
      FieldName = 'IDREGRAVERIFFOLHA'
      Origin = 'BASEDADOS.PARAMAPREV.IDREGRAVERIFFOLHA'
    end
    object qryIDRUBDESCDEP: TFloatField
      FieldName = 'IDRUBDESCDEP'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBDESCDEP'
    end
    object qryIDRUBDESCIDADE: TFloatField
      FieldName = 'IDRUBDESCIDADE'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBDESCIDADE'
    end
    object qryIDRUBIRRFPROVJUD: TFloatField
      FieldName = 'IDRUBIRRFPROVJUD'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFPROVJUD'
    end
    object qryIDRUBIRRFCOMPIR: TFloatField
      FieldName = 'IDRUBIRRFCOMPIR'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBIRRFCOMPIR'
    end
    object qryVLMINIRFF: TFloatField
      FieldName = 'VLMINIRFF'
      Origin = 'BASEDADOS.PARAMAPREV.VLMINIRFF'
    end
    object qryFLGVLIRMINABONO: TFloatField
      FieldName = 'FLGVLIRMINABONO'
      Origin = 'BASEDADOS.PARAMAPREV.FLGVLIRMINABONO'
    end
    object qryFLGRECALCULOSRBMES: TFloatField
      FieldName = 'FLGRECALCULOSRBMES'
      Origin = 'BASEDADOS.PARAMAPREV.FLGRECALCULOSRBMES'
    end
    object qryFLGEXECRGBMINMES: TFloatField
      FieldName = 'FLGEXECRGBMINMES'
      Origin = 'BASEDADOS.PARAMAPREV.FLGEXECRGBMINMES'
    end
    object qryIDRUBCREDADIANT: TFloatField
      FieldName = 'IDRUBCREDADIANT'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBCREDADIANT'
    end
    object qryCABECARQCC: TStringField
      FieldName = 'CABECARQCC'
      Origin = 'BASEDADOS.PARAMAPREV.CABECARQCC'
      Size = 200
    end
    object qryRODAPEARQCC: TStringField
      FieldName = 'RODAPEARQCC'
      Origin = 'BASEDADOS.PARAMAPREV.RODAPEARQCC'
      Size = 200
    end
    object qryFLGOBRIGAALMENTDO: TFloatField
      FieldName = 'FLGOBRIGAALMENTDO'
      Origin = 'BASEDADOS.PARAMAPREV.FLGOBRIGAALMENTDO'
    end
    object qryFLGUSACODRUBEXT: TFloatField
      FieldName = 'FLGUSACODRUBEXT'
      Origin = 'BASEDADOS.PARAMAPREV.FLGUSACODRUBEXT'
    end
    object qryFLGUSAPRAZORUB: TFloatField
      FieldName = 'FLGUSAPRAZORUB'
      Origin = 'BASEDADOS.PARAMAPREV.FLGUSAPRAZORUB'
    end
    object qryFLGUSABENEFXRUB: TFloatField
      FieldName = 'FLGUSABENEFXRUB'
      Origin = 'BASEDADOS.PARAMAPREV.FLGUSABENEFXRUB'
    end
    object qryFLGVERRUBFOLBEN: TFloatField
      FieldName = 'FLGVERRUBFOLBEN'
      Origin = 'BASEDADOS.PARAMAPREV.FLGVERRUBFOLBEN'
    end
    object qryFLGVERATIVOS: TFloatField
      FieldName = 'FLGVERATIVOS'
      Origin = 'BASEDADOS.PARAMAPREV.FLGVERATIVOS'
    end
    object qryIDRUBPENSAO: TFloatField
      FieldName = 'IDRUBPENSAO'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBPENSAO'
    end
    object qryIDRUBPALIMINSS: TFloatField
      FieldName = 'IDRUBPALIMINSS'
      Origin = 'BASEDADOS.PARAMAPREV.IDRUBPALIMINSS'
    end
    object qryIDGRINSTR: TFloatField
      FieldName = 'IDGRINSTR'
      Origin = 'BASEDADOS.PARAMAPREV.IDGRINSTR'
    end
    object qryCODPORTFORMAPATRO: TFloatField
      FieldName = 'CODPORTFORMAPATRO'
      Origin = 'BASEDADOS.PARAMAPREV.CODPORTFORMAPATRO'
    end
    object qryMESADIANTABONOFUND: TStringField
      FieldName = 'MESADIANTABONOFUND'
      Origin = 'BASEDADOS.PARAMAPREV.MESADIANTABONOFUND'
      FixedChar = True
      Size = 2
    end
    object qryMESADIANTABONOINSS: TStringField
      FieldName = 'MESADIANTABONOINSS'
      Origin = 'BASEDADOS.PARAMAPREV.MESADIANTABONOINSS'
      FixedChar = True
      Size = 2
    end
    object qryMESABONOFUND: TStringField
      FieldName = 'MESABONOFUND'
      Origin = 'BASEDADOS.PARAMAPREV.MESABONOFUND'
      FixedChar = True
      Size = 2
    end
    object qryMESABONOINSS: TStringField
      FieldName = 'MESABONOINSS'
      Origin = 'BASEDADOS.PARAMAPREV.MESABONOINSS'
      FixedChar = True
      Size = 2
    end
    object qryIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 150
    Top = 389
  end
  object updQry: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMAPREV'
      'set'
      '  IDREGRACALCINSS = :IDREGRACALCINSS,'
      '  IDRUBIRRF = :IDRUBIRRF,'
      '  MARGEMDESCONTOS = :MARGEMDESCONTOS,'
      '  IDMOTIVOFOLHABEN = :IDMOTIVOFOLHABEN,'
      '  IDMOTIVOABONO = :IDMOTIVOABONO,'
      '  IDRUBPENSAO = :IDRUBPENSAO,'
      '  IDRUBIRRFINSS = :IDRUBIRRFINSS,'
      '  IDRUBIRRFABONO = :IDRUBIRRFABONO,'
      '  IDRUBIRRFEXT = :IDRUBIRRFEXT,'
      '  IDRUBIRRFPENSAO = :IDRUBIRRFPENSAO,'
      '  IDMOTIVODEVOLBEN = :IDMOTIVODEVOLBEN,'
      '  IDRUBADIANT = :IDRUBADIANT,'
      '  IDMOTIVOADIANT = :IDMOTIVOADIANT,'
      '  IDRUBIRRFPENALIM = :IDRUBIRRFPENALIM,'
      '  IDRUBARRED = :IDRUBARRED,'
      '  IDRUBARREDMESANT = :IDRUBARREDMESANT,'
      '  IDRUBRICACPMF = :IDRUBRICACPMF,'
      '  FLGUSAFOLHARESG = :FLGUSAFOLHARESG,'
      '  FLGCALCULOVALORES = :FLGCALCULOVALORES,'
      '  FLGCORRIGEBENEF = :FLGCORRIGEBENEF,'
      '  VLRARREDSALARIO = :VLRARREDSALARIO,'
      '  IDRUBIRRFRESG = :IDRUBIRRFRESG,'
      '  VLRBENEFMIN = :VLRBENEFMIN,'
      '  IDRUBCMBENEF = :IDRUBCMBENEF,'
      '  IDRUBCMCONT = :IDRUBCMCONT,'
      '  IDRUBAJCMBENEF = :IDRUBAJCMBENEF,'
      '  IDRUBAJCMCONT = :IDRUBAJCMCONT,'
      '  IDMOTDEVOLNAOIDEN = :IDMOTDEVOLNAOIDEN,'
      '  FLGCALCJUNTO = :FLGCALCJUNTO,'
      '  PERCCPMF = :PERCCPMF,'
      '  IDREGRAVERIFFOLHA = :IDREGRAVERIFFOLHA,'
      '  IDRUBDESCDEP = :IDRUBDESCDEP,'
      '  IDRUBDESCIDADE = :IDRUBDESCIDADE,'
      '  IDRUBIRRFPROVJUD = :IDRUBIRRFPROVJUD,'
      '  IDRUBPALIMINSS = :IDRUBPALIMINSS,'
      '  IDRUBIRRFCOMPIR = :IDRUBIRRFCOMPIR,'
      '  VLMINIRFF = :VLMINIRFF,'
      '  FLGVLIRMINABONO = :FLGVLIRMINABONO,'
      '  FLGRECALCULOSRBMES = :FLGRECALCULOSRBMES,'
      '  FLGEXECRGBMINMES = :FLGEXECRGBMINMES,'
      '  IDRUBCREDADIANT = :IDRUBCREDADIANT,'
      '  CABECARQCC = :CABECARQCC,'
      '  RODAPEARQCC = :RODAPEARQCC,'
      '  FLGOBRIGAALMENTDO = :FLGOBRIGAALMENTDO,'
      '  FLGUSACODRUBEXT = :FLGUSACODRUBEXT,'
      '  FLGUSAPRAZORUB = :FLGUSAPRAZORUB,'
      '  FLGUSABENEFXRUB = :FLGUSABENEFXRUB,'
      '  FLGVERRUBFOLBEN = :FLGVERRUBFOLBEN,'
      '  FLGVERATIVOS = :FLGVERATIVOS,'
      '  CODPORTFORMAPATRO = :CODPORTFORMAPATRO,'
      '  MESADIANTABONOFUND = :MESADIANTABONOFUND,'
      '  MESADIANTABONOINSS = :MESADIANTABONOINSS,'
      '  MESABONOFUND = :MESABONOFUND,'
      '  MESABONOINSS = :MESABONOINSS'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    Left = 122
    Top = 389
  end
  object qryGrupoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GRU.IDGRUPOREGRA, GRU.DESCRICAO'
      'FROM GRUPOREGRA GRU'
      'ORDER BY GRU.DESCRICAO')
    ValidateWithMask = True
    Left = 94
    Top = 491
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROGRAMA,'
      '  CODPROGRAMA,'
      '  DESCPROGRAMA'
      ''
      'FROM PROGRAMA'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 58
    Top = 211
  end
  object qryTipoDocConvP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC, DESCRICAO'
      'FROM TIPODOCRECPAG'
      'WHERE RECPAG = '#39'P'#39
      ' ')
    ValidateWithMask = True
    Left = 90
    Top = 441
  end
  object qryTipoDocConvR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC, DESCRICAO'
      'FROM TIPODOCRECPAG'
      'WHERE RECPAG = '#39'R'#39
      ' ')
    ValidateWithMask = True
    Left = 142
    Top = 445
  end
  object qryTipoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOREGRA, DESCREGRA'
      'FROM TIPOREGRA'
      'WHERE IDGRUPOREGRA = :IDGRUPOREGRA'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 142
    Top = 483
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOREGRA'
        ParamType = ptUnknown
        Value = '2'
      end>
  end
  object qryPortFormaPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODPORTFORMA,'
      '  DESCRICAO'
      ''
      'FROM'
      '  PORTADORFORMA'
      ''
      'WHERE IDEMPRESA = :PIDFUNDACAO'
      '  AND RECPAG    = '#39'P'#39
      ' '
      ' ')
    ValidateWithMask = True
    Left = 54
    Top = 379
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRubDescDepIRAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO,'
      
        '  DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO) AS C' +
        'ODIGO,'
      
        '  DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO) AS ' +
        'DESCRICAO'
      ''
      'FROM'
      '  PROVDESC P'
      ''
      'WHERE'
      '  P.FLGDESCONTO     = 2      AND'
      '  P.FLGESPECIAL    IN (1, 2) AND'
      '  P.FLGTPRUBRICA LIKE '#39'%B%'#39'  AND'
      '  P.IDFUNDACAO      = :PIDFUNDACAO'
      ''
      'ORDER BY'
      '  DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO)')
    ValidateWithMask = True
    Left = 705
    Top = 189
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object qryRubDescIdadeIRAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO,'
      
        '  DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO) AS C' +
        'ODIGO,'
      
        '  DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO) AS ' +
        'DESCRICAO'
      ''
      'FROM'
      '  PROVDESC P'
      ''
      'WHERE'
      '  P.FLGDESCONTO     = 2      AND'
      '  P.FLGESPECIAL    IN (1, 2) AND'
      '  P.FLGTPRUBRICA LIKE '#39'%B%'#39'  AND'
      '  P.IDFUNDACAO      = :PIDFUNDACAO'
      ''
      'ORDER BY'
      '  DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO)')
    ValidateWithMask = True
    Left = 721
    Top = 37
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object qryRubConsigCredAbono: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 726
    Top = 91
  end
  object qryRubConsigDescAbono: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 1173
    Top = 285
  end
  object qryRubDescIdadeIRResgate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,'
      '  CODPROVDESC,  '
      '  DESCRICAO,'
      '  DESCRPROVDESC'
      ''
      'FROM '
      '  PROVDESC '
      ''
      'WHERE '
      '  FLGDESCONTO = 2 AND'
      '  FLGTPRUBRICA LIKE '#39'%B%'#39
      ''
      'ORDER BY '
      '  DESCRICAO '
      ' ')
    ValidateWithMask = True
    Left = 710
    Top = 251
  end
  object qryRubDescDepIRResgate: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPROVENTO, '
      '  CODPROVDESC,  '
      '  DESCRICAO, '
      '  DESCRPROVDESC'
      ''
      'FROM '
      '  PROVDESC '
      ''
      'WHERE '
      '  FLGDESCONTO = 2 AND'
      '  FLGTPRUBRICA LIKE '#39'%B%'#39
      ''
      'ORDER BY '
      '  DESCRICAO ')
    ValidateWithMask = True
    Left = 957
    Top = 461
  end
  object qryRubIRRegressiva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPROVENTO,'
      '  P.CODPROVDESC,'
      '  P.IDPROVENTO AS CODIGO,'
      '  P.DESCRICAO AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 1'
      '  AND 1 = 2'
      '  AND P.FLGESPECIAL = 0'
      '  AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 1009
    Top = 461
  end
  object qryDescontosIsento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO)' +
        ' AS CODIGO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO' +
        ') AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 1'
      'AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND P.IDFUNDACAO = :PIDFUNDACAO'
      
        'ORDER BY DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRIC' +
        'AO)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 138
    Top = 351
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object qryProventosIsento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.CODPROVDESC, P.IDPROVENTO)' +
        ' AS CODIGO,'
      
        '       DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRICAO' +
        ') AS DESCRICAO'
      'FROM PROVDESC P'
      'WHERE P.FLGDESCONTO = 0'
      'AND P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'AND P.IDFUNDACAO = :PIDFUNDACAO'
      
        'ORDER BY DECODE(:PFLGUSACODRUBEXT, 1, P.DESCRPROVDESC, P.DESCRIC' +
        'AO) '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 110
    Top = 351
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGUSACODRUBEXT'
        ParamType = ptUnknown
      end>
  end
  object qryIRRFRRA: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM SITHABILITACAOINSS WHERE FLGHABILITACAOINSS = 1'
      ' ')
    ValidateWithMask = True
    Left = 789
    Top = 409
    object qryIRRFRRADESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITHABILITACAOINSS.DESCRICAO'
      Size = 40
    end
    object qryIRRFRRAIDSITHABILITACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITHABILITACAO'
      Origin = 'BASEDADOS.SITHABILITACAOINSS.IDSITHABILITACAO'
      Visible = False
    end
    object qryIRRFRRAFLGHABILITACAOINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGHABILITACAOINSS'
      Origin = 'BASEDADOS.SITHABILITACAOINSS.FLGHABILITACAOINSS'
      Visible = False
    end
  end
  object dsIRRFRRA: TwwDataSource
    DataSet = qryIRRFRRA
    Left = 829
    Top = 409
  end
  object qryLkpRRAINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   AND (P.FLGRRA = 1)'
      '   AND (FLGESTADORUB <> 2)   '
      '   AND (P.CODFONTEPAGADORA = 2)')
    ValidateWithMask = True
    Left = 1129
    Top = 145
  end
  object qryLkpRRAFund: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE (P.FLGTPRUBRICA like '#39'%B%'#39')'
      '   AND (P.FLGRRA = 1)'
      '   AND (FLGESTADORUB <> 2)   '
      '   AND (P.CODFONTEPAGADORA = 1)')
    ValidateWithMask = True
    Left = 1137
    Top = 185
  end
  object qryMes: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '#39'01'#39' as NumMes, '#39'Janeiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'02'#39' as NumMes, '#39'Fevereiro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'03'#39' as NumMes, '#39'Março'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'04'#39' as NumMes, '#39'Abril'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'05'#39' as NumMes, '#39'Maio'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'06'#39' as NumMes, '#39'Junho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'07'#39' as NumMes, '#39'Julho'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'08'#39' as NumMes, '#39'Agosto'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'09'#39' as NumMes, '#39'Setembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'10'#39' as NumMes, '#39'Outubro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'11'#39' as NumMes, '#39'Novembro'#39' as Mes'
      'from    dual'
      'union'
      'select '#39'12'#39' as NumMes, '#39'Dezembro'#39' as Mes'
      'from    dual')
    Left = 64
    Top = 280
  end
  object qryLkpIRComp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      'WHERE P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 1141
    Top = 229
  end
  object qryLkpIRCompAB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      'WHERE P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 1125
    Top = 269
  end
  object qryLkpIRInfoAb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      'WHERE P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 1121
    Top = 357
  end
  object qryLkpIRInfo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      'WHERE P.FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY P.DESCRICAO')
    ValidateWithMask = True
    Left = 1121
    Top = 325
  end
  object qryLkpRegraIrAcao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDREGRA,'
      '       R.NOMEREGRA'
      '  FROM REGRA R'
      'ORDER BY R.NOMEREGRA')
    ValidateWithMask = True
    Left = 1121
    Top = 389
  end
  object qryLkpIRSimples: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE P.FLGDESCONTO = 2'
      'ORDER BY P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 1249
    Top = 365
  end
  object qryLkpIRSimplesAB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE P.FLGDESCONTO = 2'
      'ORDER BY P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 1249
    Top = 421
  end
  object qryLkpIRSimplesInss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE P.FLGDESCONTO = 2'
      'ORDER BY P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 1249
    Top = 485
  end
  object qryLkpIRSimplesInssAB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO,'
      '       P.DESCRICAO,'
      '       P.CODPROVDESC'
      '  FROM PROVDESC P'
      ' WHERE P.FLGDESCONTO = 2'
      'ORDER BY P.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 1249
    Top = 541
  end
end
