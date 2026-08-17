inherited frmCadFormula: TfrmCadFormula
  Left = 10
  Top = 55
  Width = 786
  Height = 504
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Formas de Cálculo'
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 770
    Height = 382
    BorderWidth = 2
    object pnlListaFormasCalc: TPanel
      Left = 2
      Top = 2
      Width = 181
      Height = 378
      Align = alLeft
      TabOrder = 0
      object fcOpcoes: TfcOutlookBar
        Left = 1
        Top = 1
        Width = 151
        Height = 376
        ActivePage = fcEspeciais
        Align = alClient
        Animation.Enabled = False
        Animation.Interval = 1
        Animation.Steps = 7
        AutoBold = False
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ButtonSize = 18
        ButtonClassName = 'TfcShapeBtn'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = loVertical
        Options = [cboAutoCreateOutlookList]
        PanelAlignment = paDynamic
        ShowButtons = True
        TabOrder = 0
        object fcFormulas: TfcShapeBtn
          Left = 0
          Top = 0
          Width = 147
          Height = 18
          Caption = 'Utilidades'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcNumeros: TfcShapeBtn
          Left = 0
          Top = 18
          Width = 147
          Height = 18
          Caption = 'Operadores e Sinais'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcMatematicas: TfcShapeBtn
          Left = 0
          Top = 36
          Width = 147
          Height = 18
          Caption = 'Financeiras'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 3
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcData: TfcShapeBtn
          Left = 0
          Top = 54
          Width = 147
          Height = 18
          Caption = 'Data'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcTabGenericaLonga: TfcShapeBtn
          Left = 0
          Top = 72
          Width = 147
          Height = 18
          Caption = 'Tabelas Genéricas/Longas'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 4
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcHistoricoRubricas: TfcShapeBtn
          Left = 0
          Top = 90
          Width = 147
          Height = 18
          Caption = 'Histórico de Rubricas'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 5
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcEspeciais: TfcShapeBtn
          Left = 0
          Top = 108
          Width = 147
          Height = 18
          Caption = 'Especiais'
          Color = clBtnFace
          DitherColor = clWhite
          Down = True
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 12
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 147
          Height = 0
          object fcOutlookBar1OutlookList2: TfcOutlookList
            Left = 0
            Top = 0
            Width = 147
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsItemHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphTop
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Dias Trabalhados'
                OnClick = fcOutlookBar1OutlookList2Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Total de Dias das Férias'
                OnClick = fcOutlookBar1OutlookList2Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Dias de Férias no Mês'
                OnClick = fcOutlookBar1OutlookList2Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Avos para Férias'
                OnClick = fcOutlookBar1OutlookList2Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Avos para 13º'
                OnClick = fcOutlookBar1OutlookList2Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Avos Perdidos'
                OnClick = fcOutlookBar1OutlookList2Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Valor Máximo'
                OnClick = fcOutlookBar1OutlookList2Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Valor Mínimo'
                OnClick = fcOutlookBar1OutlookList2Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Arredonda um Valor'
                OnClick = fcOutlookBar1OutlookList2Items30Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Trunca um Valor'
                OnClick = fcOutlookBar1OutlookList2Items35Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Registro Atual'
                OnClick = fcOutlookBar1OutlookList2Items29Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Total de Registros'
                OnClick = fcOutlookBar1OutlookList2Items34Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Salva um Valor'
                OnClick = fcOutlookBar1OutlookList2Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Recupera um Valor'
                OnClick = fcOutlookBar1OutlookList2Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Dependentes por Tipo e Idade'
                OnClick = fcOutlookBar1OutlookList2Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Comparação (SE)'
                OnClick = fcOutlookBar1OutlookList2Items9Click
              end>
            ItemSpacing = 2
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
          Width = 155
          Height = 0
          object fcLstNumeros: TfcOutlookList
            Left = 0
            Top = 0
            Width = 155
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsItemHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphLeft
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Soma (+)'
                OnClick = fcOutlookBar1OutlookList1Items4Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Subtração (-)'
                OnClick = fcOutlookBar1OutlookList1Items5Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Multiplicação (X)'
                OnClick = fcOutlookBar1OutlookList1Items3Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Divisão (/)'
                OnClick = fcOutlookBar1OutlookList1Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Expressão Aritmética (ARITM)'
                OnClick = fcLstNumerosItems4Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Raiz Quadrada (SQRT)'
                OnClick = fcOutlookBar1OutlookList1Items2Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Exponenciação (^)'
                OnClick = fcOutlookBar1OutlookList1Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Ponto e Vírgula (;)'
                OnClick = fcLstNumerosItems6lick
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Abre Parênteses ('
                OnClick = fcOutlookBar1OutlookList1Items7Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Fecha Parênteses )'
                OnClick = fcOutlookBar1OutlookList1Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Igual a (=)'
                OnClick = fcLstNumerosItems9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Diferente de (<>)'
                OnClick = fcLstNumerosItems10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Maior Que (>)'
                OnClick = fcLstNumerosItems11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Menor Que (<)'
                OnClick = fcLstNumerosItems12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Maior ou Igual a (>=)'
                OnClick = fcLstNumerosItems13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Menor ou Igual a (<=)'
                OnClick = fcLstNumerosItems14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Observações (&)'
                OnClick = fcLstNumerosItems16Click
              end>
            ItemSpacing = 4
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
          Width = 151
          Height = 0
          object fcOutlookBar1OutlookList6: TfcOutlookList
            Left = 0
            Top = 0
            Width = 151
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphTop
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Juros Compostos'
                OnClick = fcOutlookBar1OutlookList6Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Índice ou Moeda'
                OnClick = fcOutlookBar1OutlookList6Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Imposto de Renda (IRRF)'
                OnClick = fcOutlookBar1OutlookList6Items2Click
              end>
            ItemSpacing = 2
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
          Width = 151
          Height = 0
          object fcOutlookBar1OutlookList3: TfcOutlookList
            Left = 0
            Top = 0
            Width = 151
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphTop
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Extrai o Ano da Data'
                OnClick = fcOutlookBar1OutlookList3Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Extrai o Mês da Data'
                OnClick = fcOutlookBar1OutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Extrai o Dia da Data'
                OnClick = fcOutlookBar1OutlookList3Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna Último Dia do Mês'
                OnClick = fcOutlookBar1OutlookList3Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna Última Data do Mês'
                OnClick = fcOutlookBar1OutlookList3Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna a diferença de anos'
                OnClick = fcOutlookBar1OutlookList3Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna a diferença de meses'
                OnClick = fcOutlookBar1OutlookList3Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna a diferença de dias'
                OnClick = fcOutlookBar1OutlookList3Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Incrementa Data'
                OnClick = fcOutlookBar1OutlookList3Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna Data em Ano/Mês'
                OnClick = fcOutlookBar1OutlookList3Items30Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Retorna Data em AnoMês'
                OnClick = fcOutlookBar1OutlookList3Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Converte Data em Nº'
                OnClick = fcOutlookBar1OutlookList3Items12Click
              end>
            ItemSpacing = 2
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
          Width = 151
          Height = 0
          object fcOutlookBar1OutlookList7: TfcOutlookList
            Left = 0
            Top = 0
            Width = 151
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphTop
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Genérica'
                OnClick = fcOutlookBar1OutlookList7Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Longa'
                OnClick = fcOutlookBar1OutlookList7Items1Click
              end>
            ItemSpacing = 2
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
          Width = 151
          Height = 0
          object fcOpcoesOutlookList3: TfcOutlookList
            Left = 0
            Top = 0
            Width = 151
            Height = 0
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HotTrackStyle = hsIconHilite
            ItemHighlightColor = clWhite
            ItemHotTrackColor = clWhite
            ItemLayout = blGlyphTop
            ItemShadowColor = clWhite
            ItemSelectedDitherColor = clWhite
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Soma Valor no Período'
                OnClick = fcOpcoesOutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Apura Média no Período'
                OnClick = fcOpcoesOutlookList3Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Soma Quantidade no Período'
                OnClick = fcOpcoesOutlookList3Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Valor da Rubrica nesta Folha'
                OnClick = fcOpcoesOutlookList3Items4Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
        object OutlookPanel1: TfcOutlookPanel
          Left = 0
          Top = 126
          Width = 147
          Height = 246
          object fcOpcoesEspeciais: TfcOutlookList
            Left = 0
            Top = 0
            Width = 147
            Height = 246
            Align = alClient
            BorderStyle = bsNone
            ClickStyle = csClick
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
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Resultado da Avaliação'
                OnClick = fcOpcoesEspeciaisItems0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Quantidade de Pessoal'
                OnClick = fcOpcoesEspeciaisItems1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Salário Total do Pessoal'
                OnClick = fcOpcoesEspeciaisItems2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'Contribuição Previdenciária'
                OnClick = fcOpcoesEspeciaisItems3Click
              end>
            ItemSpacing = 2
            ItemsWidth = 0
            Layout = loVertical
            ScrollButtonsVisible = True
            ScrollInterval = 250
            Transparent = False
          end
        end
      end
      object Panel3: TPanel
        Left = 152
        Top = 1
        Width = 28
        Height = 376
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object bbtnApagarTodaExpressao: TBitBtn
          Left = 1
          Top = 26
          Width = 25
          Height = 25
          Hint = 'Apagar toda expressão'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnApagarTodaExpressaoClick
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
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303030303030303030303030303030303FF030303FF030303030303030303
            0303030303030303030303030303030303030303030303030303FF0303FFFFFF
            0303FF0303030303030303030303030303030303030303030303030303030303
            0303FFFFFFFFFFFFFFFFFFFF03030303030303030303030303030303030303FF
            FFFFFF03030303030303FFFFFFFFFFFFFFFFF801010103030303030303030303
            030303030303F8F8F8F8FFFF030303030303FFFFFFFFFFFFFFF8F9FDFD050103
            03030303030303030303030303F8FF0303F8F8FFFF0303030303FFFFFFFFFFFF
            FFF9FDF9FDFD050103030303030303030303030303F8FF030303F8F8FFFF0303
            0303FFFFFFFFFFFF03FDF9FFF9FDFD0500030303030303030303030303F8FF03
            030303F8F8FFFF030303FFFF03FFFFFF03F9FDFFFDF9FD000600030303030303
            0303030303F803FF030303F8F8F8FFFF0303FF030303FF030303F9FDFFFD0002
            0406000303030303030303030303F803FF03F8F8F8F8F8FFFF03FF0303030303
            030303F9FD00FA02020406000303030303030303030303F803F803F8F8F8F8F8
            FFFF0303030303030303030300FAFBFA020200F8000303030303030303030303
            F803FF03F8F8F8F8F8FF030303030303030303030300FAFBFA0004F8F8000303
            030303030303030303F803FF03F8F8F8F8F803030303030303030303030300FA
            0007FB04F8F8030303030303030303030303F803F80303F8F8F8030303030303
            030303030303030007FFFBFB04F803030303030303030303030303F803FF0303
            F8F8030303030303030303030303030300FFFFFBFB0403030303030303030303
            03030303F803FF0303F803030303030303030303030303030300FFFFFBFB0303
            03030303030303030303030303F803FF03030303030303030303030303030303
            030300FFFFFB03030303030303030303030303030303F8030303}
          NumGlyphs = 2
        end
        object bbtnApagarUltimoCaracter: TBitBtn
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Apagar o último caracter'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnApagarUltimoCaracterClick
          Glyph.Data = {
            36010000424D360100000000000076000000280000001E0000000C0000000100
            040000000000C000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777887777
            7777777778877777770077777008777777777777778777777700777700087777
            7777777777877777770077700008888888877777778888888800770000000000
            0087777777777777780070000000000000877777777777777800F00000000000
            008F7777777777777800FF0000000000008F77777777777778007FF00007FFFF
            FF77FF77777FFFFFF70077FF0008777777777FF7778777777700777FF0087777
            777777FF7787777777007777FFF777777777777FFF7777777700}
          NumGlyphs = 2
        end
      end
    end
    object Panel5: TPanel
      Left = 183
      Top = 2
      Width = 585
      Height = 378
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 583
        Height = 296
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 5
          Width = 44
          Height = 13
          Caption = 'Número'
        end
        object Label4: TLabel
          Left = 480
          Top = 5
          Width = 26
          Height = 13
          Caption = 'Tipo'
        end
        object sbtnCampos: TSpeedButton
          Left = 549
          Top = 43
          Width = 25
          Height = 25
          Hint = 'Campos e Tabelas'
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
            33333333373F33333333333330B03333333333337F7F33333333333330F03333
            333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
            333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
            333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
            3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
            33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
            33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
            03333337777777F7F33333330000000003333337777777773333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnCamposClick
        end
        object Label3: TLabel
          Left = 10
          Top = 57
          Width = 59
          Height = 13
          Caption = 'Expressão'
        end
        object Label1: TLabel
          Left = 77
          Top = 5
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descrição'
        end
        object dbedDescr: TwwDBEdit
          Left = 77
          Top = 19
          Width = 397
          Height = 21
          DataField = 'NOMEREGRA'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblckGrupo: TwwDBLookupCombo
          Left = 480
          Top = 19
          Width = 96
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCREGRA'#9'60'#9'DESCREGRA'#9'F')
          DataField = 'IDTIPOREGRA'
          DataSource = ds
          LookupTable = CdsGrupo
          LookupField = 'IDTIPOREGRA'
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dbedExpressao: TwwDBEdit
          Left = 10
          Top = 73
          Width = 564
          Height = 216
          AutoSelect = False
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'DESCRICAOREGRA'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = True
        end
        object dbedNumero: TwwDBEdit
          Left = 10
          Top = 19
          Width = 63
          Height = 21
          Color = clGray
          DataField = 'IDREGRA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbrgPublicada: TDBRadioGroup
          Left = 200
          Top = 40
          Width = 185
          Height = 30
          Caption = 'Publicada?'
          Columns = 2
          DataField = 'PUBLICADA'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
          Values.Strings = (
            '1'
            '0')
        end
      end
      object pnlTeclas: TPanel
        Left = 1
        Top = 297
        Width = 583
        Height = 80
        Align = alClient
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 0
        object memDescricao: TMemo
          Left = 1
          Top = 1
          Width = 581
          Height = 78
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 770
    inherited Toolbar971: TToolbar97
      object sbtnProcurarExpressao: TToolbarButton97
        Left = 240
        Top = 0
        Width = 151
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar por Expressão'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarExpressaoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 429
    Width = 770
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 619
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 431
      DockPos = 451
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
      end
    end
    object bbtnTestar: TBitBtn
      Left = 3
      Top = 2
      Width = 80
      Height = 33
      Hint = 'Testar a Execução de Formas de Cálculo'
      Caption = '&Testar'
      Default = True
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnTestarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object bbtnEnviarConteudo: TBitBtn
      Left = 82
      Top = 2
      Width = 80
      Height = 33
      Hint = 'Enviar o conteúdo da Forma de Cálculo via e-mail'
      Caption = '&Enviar'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnEnviarConteudoClick
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000024000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8118888888888888888778F800008888888888888191888888888888FFF7F78F
        0000888888888111119918888888888777778878000088888888819999999188
        88888887F8888887000080000000019999999188FFFFFFF7FFFFF88700008777
        7777711111991887777777777777F878000087888888888881918887FF888888
        8887F78800008738883338883118888778F88FFF88777F88000087B383000383
        87088887F78F7778F7887F88000087FF30FFB03887088887F87788877F887F88
        000087B80FBFFF0387088887F878888878F87F8800008780BFFFBFF037088887
        F7888888878F7F880000870FFFBFFFBF030888877888888888787F88000087FF
        BFFFBFFFB0088887FFFFFFFFFFF77F8800008777777777777708888777777777
        7777788800008888888888888888888888888888888888880000}
      NumGlyphs = 2
    end
  end
  object townProcExpressao: TToolWindow97 [3]
    Left = 124
    Top = 112
    Caption = 'Procurar Forma de Cálculo por Conteúdo na Expressão'
    CloseButton = False
    ClientAreaHeight = 275
    ClientAreaWidth = 539
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    Resizable = False
    ShowHint = False
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 15
      Top = 13
      Width = 63
      Height = 13
      Caption = 'Expressão:'
    end
    object bbtnFecharExpressao: TBitBtn
      Left = 435
      Top = 242
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      TabOrder = 0
      OnClick = bbtnFecharExpressaoClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
    end
    object dbgrProcExpressao: TwwDBGrid
      Left = 3
      Top = 40
      Width = 531
      Height = 197
      Selected.Strings = (
        'IDREGRA'#9'10'#9'Número'
        'NOMEREGRA'#9'60'#9'Descrição'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProcExpressao
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = bbtnOkExpressaoClick
      IndicatorColor = icBlack
    end
    object bbtnOkExpressao: TBitBtn
      Left = 327
      Top = 242
      Width = 99
      Height = 30
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 2
      OnClick = bbtnOkExpressaoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      NumGlyphs = 2
    end
    object edExpressao: TEdit
      Left = 83
      Top = 10
      Width = 339
      Height = 21
      TabOrder = 3
    end
    object bbtnProcExpressao: TBitBtn
      Left = 435
      Top = 5
      Width = 99
      Height = 30
      Caption = 'Procurar'
      TabOrder = 4
      OnClick = bbtnProcExpressaoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 446
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 712
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 632
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 418
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Forma de Cálculo'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA')
    Filtro.Strings = (
      'TIPOREGRA.IDTIPOREGRA = REGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '40')
    Left = 560
    Top = 1
  end
  object CdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 498
    Top = 1
  end
  object CdsProcExpressao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 402
    Top = 188
  end
  object dsProcExpressao: TwwDataSource
    AutoEdit = False
    DataSet = CdsProcExpressao
    Left = 500
    Top = 188
  end
end
