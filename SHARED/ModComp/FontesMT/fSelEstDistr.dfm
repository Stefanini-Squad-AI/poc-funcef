inherited frmSelEstDistr: TfrmSelEstDistr
  Left = 85
  Top = 108
  HelpContext = 7190031
  Caption = 'Estatística da Distribuição de Objetos Reclamados nos Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnResult: TPanel
      object pgctrlGrafico: TPageControl
        Left = 1
        Top = 1
        Width = 617
        Height = 372
        ActivePage = tbshQuantidade
        Align = alClient
        TabOrder = 0
        object tbshQuantidade: TTabSheet
          Caption = 'Quantidade'
          object Chart1: TChartfx
            Left = 0
            Top = 0
            Width = 609
            Height = 344
            Align = alClient
            TabOrder = 0
            ControlData = {
              F13E00008E2300006000000000000105550200FFFFFFFF320032002800280002
              00000000000000080001000000000000000000000000000000020000FFFF00C0
              C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
              2008000060080000000800000008000000080000000800000008000000080000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000F0
              3F02000400000000000000000000000000000059400000000000000000000000
              000000000000000000}
          end
        end
        object tbshCusto: TTabSheet
          Caption = 'Custo'
          ImageIndex = 1
          object Chart2: TChartfx
            Left = 0
            Top = 0
            Width = 604
            Height = 334
            Align = alClient
            TabOrder = 0
            ControlData = {
              6D3E0000852200006000000000000105550200FFFFFFFF320032002800280002
              00000000000000080001000000000000000000000000000000020000FFFF00C0
              C0C000C0C0C000FFFFFF00FF1FFF1F0000000000010000000000000000080000
              2008000060080000000800000008000000080000000800000008000000080000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000F0
              3F02000400000000000000000000000000000059400000000000000000000000
              000000000000000000}
          end
        end
      end
    end
    inherited pgctrlPrincipal: TPageControl
      ActivePage = tbshGrafico
      object tbshGrafico: TTabSheet [0]
        Caption = 'Gráfico'
        ImageIndex = 5
        object rgValor: TRadioGroup
          Left = 40
          Top = 42
          Width = 360
          Height = 46
          Caption = 'Valores'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Reclamados'
            'Estimados ou Reais')
          TabOrder = 0
        end
        object rgDistrib: TRadioGroup
          Left = 40
          Top = 96
          Width = 360
          Height = 36
          Caption = 'Considerar'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'A Selecionar')
          TabOrder = 1
          OnClick = rgDistribClick
        end
        object gbxDistrib: TGroupBox
          Left = 40
          Top = 132
          Width = 360
          Height = 175
          Caption = 'Distribuição'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Visible = False
          object dblcDistrib: TwwDBLookupCombo
            Left = 30
            Top = 35
            Width = 295
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'TITULO')
            Style = csDropDownList
            MaxLength = 5
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcDistribCloseUp
          end
          object lstDistrib: TListBox
            Left = 30
            Top = 61
            Width = 295
            Height = 108
            Color = clMaroon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            Sorted = True
            TabOrder = 1
            OnKeyDown = lstDistribKeyDown
          end
          object cbxDemais: TCheckBox
            Left = 30
            Top = 15
            Width = 292
            Height = 17
            Caption = 'Inclui Não Selecionados como '#39'Demais Itens'#39
            TabOrder = 2
          end
          object lstCodDistrib: TListBox
            Left = 33
            Top = 132
            Width = 40
            Height = 30
            Color = clMaroon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
        end
        object rgDistribPor: TRadioGroup
          Left = 414
          Top = 42
          Width = 150
          Height = 262
          Caption = 'Distribuição Por'
          ItemIndex = 0
          Items.Strings = (
            'Cargos'
            'Estabelecimentos'
            'Segmentos'
            'Sindicatos'
            'Centros de Custo')
          TabOrder = 3
          OnClick = rgDistribPorClick
        end
      end
    end
  end
  object CdsDistrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 203
    Top = 240
  end
  object CdsObj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 255
    Top = 240
  end
end
