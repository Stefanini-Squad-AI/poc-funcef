inherited frmCadFormulas: TfrmCadFormulas
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  HelpContext = 450012
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Formulas'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 467
    object Panel4: TPanel
      Left = 5
      Top = 5
      Width = 203
      Height = 457
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object fcOpcoes: TfcOutlookBar
        Left = 1
        Top = 1
        Width = 173
        Height = 455
        ActivePage = fcFormulas
        Align = alClient
        Animation.Enabled = True
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
        object fcNumeros: TfcShapeBtn
          Left = 0
          Top = 0
          Width = 169
          Height = 18
          Caption = 'Números'
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
        object fcFormulas: TfcShapeBtn
          Left = 0
          Top = 18
          Width = 169
          Height = 18
          Caption = 'Fórmulas'
          Color = clBtnFace
          DitherColor = clWhite
          Down = True
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcMatematicas: TfcShapeBtn
          Left = 0
          Top = 289
          Width = 169
          Height = 18
          Caption = 'Financeiras'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 5
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcData: TfcShapeBtn
          Left = 0
          Top = 307
          Width = 169
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
        object fcINSS: TfcShapeBtn
          Left = 0
          Top = 325
          Width = 169
          Height = 18
          Caption = 'Impostos'
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
        object fcSalarios: TfcShapeBtn
          Left = 0
          Top = 343
          Width = 169
          Height = 18
          Caption = 'Salários/Contribuições'
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
        object fcTabGenericaLonga: TfcShapeBtn
          Left = 0
          Top = 361
          Width = 169
          Height = 18
          Caption = 'Tab.Genérica/Longa'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 6
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcCargoseFuncoes: TfcShapeBtn
          Left = 0
          Top = 379
          Width = 169
          Height = 18
          Caption = 'Evolução Funcional'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          NumGlyphs = 0
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 7
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcHistoricoRubricas: TfcShapeBtn
          Left = 0
          Top = 397
          Width = 169
          Height = 18
          Caption = 'Histórico de Rubricas'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 8
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object fcContagemTempos: TfcShapeBtn
          Left = 0
          Top = 415
          Width = 169
          Height = 18
          Caption = 'Contagem de Tempos'
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
          TabOrder = 9
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object OpInvestimento: TfcShapeBtn
          Left = 0
          Top = 433
          Width = 169
          Height = 18
          Caption = 'Investimento'
          Color = clBtnFace
          DitherColor = clWhite
          GroupIndex = 1
          ParentClipping = False
          RoundRectBias = 25
          ShadeColors.Btn3DLight = 14671839
          ShadeColors.BtnHighlight = 15724527
          ShadeColors.BtnShadow = 6316128
          ShadeColors.BtnBlack = 3158064
          ShadeStyle = fbsHighlight
          TabOrder = 20
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object TfcOutlookPanel
          Left = 0
          Top = 0
          Width = 148
          Height = 0
          object fcLstNumeros: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
            ItemHighlightColor = clBtnFace
            ItemHotTrackColor = clBtnShadow
            ItemLayout = blGlyphLeft
            ItemShadowColor = clBtnText
            ItemSelectedDitherColor = clBtnHighlight
            Items = <
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ARITM'
                OnClick = fcOutlookBar1OutlookList1Items0Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ELEVAÇÃO (^)'
                OnClick = fcOutlookBar1OutlookList1Items1Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RAIZ (SQRT)'
                OnClick = fcOutlookBar1OutlookList1Items2Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MULTIPLICAÇÃO (X)'
                OnClick = fcOutlookBar1OutlookList1Items3Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMA (+)'
                OnClick = fcOutlookBar1OutlookList1Items4Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SUBTRAÇÃO (-)'
                OnClick = fcOutlookBar1OutlookList1Items5Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIVISÃO (/)'
                OnClick = fcOutlookBar1OutlookList1Items6Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = '('
                OnClick = fcOutlookBar1OutlookList1Items7Click
              end
              item
                ImageIndex = -1
                Selected = False
                Separation = 10
                Tag = 0
                Text = ')'
                OnClick = fcOutlookBar1OutlookList1Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ATUARIAL'
                OnClick = fcLstNumerosItems9Click
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
          Top = 36
          Width = 169
          Height = 253
          object fcOutlookBar1OutlookList2: TfcOutlookList
            Left = 0
            Top = 0
            Width = 169
            Height = 253
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
                Text = 'ALINHA'
                OnClick = fcOutlookBar1OutlookList2Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAX'
                OnClick = fcOutlookBar1OutlookList2Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CAMPOSDESC'
                OnClick = fcOutlookBar1OutlookList2Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONCAT'
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXISTECAMPO'
                OnClick = fcOutlookBar1OutlookList2Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EXTRAIR'
                OnClick = fcOutlookBar1OutlookList2Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FORMATAR'
                OnClick = fcOutlookBar1OutlookList2Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'GH'
                OnClick = fcOutlookBar1OutlookList2Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MAXIMO'
                OnClick = fcOutlookBar1OutlookList2Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MINIMO'
                OnClick = fcOutlookBar1OutlookList2Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NIVEL'
                OnClick = fcOutlookBar1OutlookList2Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'REGATU'
                OnClick = fcOutlookBar1OutlookList2Items29Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ROUND'
                OnClick = fcOutlookBar1OutlookList2Items30Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TABBIO'
                OnClick = fcOutlookBar1OutlookList2Items33Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTREGS'
                OnClick = fcOutlookBar1OutlookList2Items34Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TRUNC'
                OnClick = fcOutlookBar1OutlookList2Items35Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITPESSOA'
                OnClick = fcOutlookBar1OutlookList2Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VERCONCEDIDO'
                OnClick = fcOutlookBar1OutlookList2Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITINTERNA'
                OnClick = fcOutlookBar1OutlookList2Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SITBENEFICIO'
                OnClick = fcOutlookBar1OutlookList2Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARCANTEP'
                OnClick = fcOutlookBar1OutlookList2Items20Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRBENEFICIO'
                OnClick = fcOutlookBar1OutlookList2Items21Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAMATRICULA'
                OnClick = fcOutlookBar1OutlookList2Items22Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORRESERVA'
                OnClick = fcOutlookBar1OutlookList2Items23Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PLANOANTERIOR'
                OnClick = fcOutlookBar1OutlookList2Items24Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAPERCENTUAL'
                OnClick = fcOutlookBar1OutlookList2Items25Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DADOSPATROANT'
                OnClick = fcOutlookBar1OutlookList2Items26Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMABENEFICIOS'
                OnClick = fcOutlookBar1OutlookList2Items27Click
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
          Width = 93
          Height = 0
          object fcOutlookBar1OutlookList6: TfcOutlookList
            Left = 0
            Top = 0
            Width = 93
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
                Text = 'FV'
                OnClick = fcOutlookBar1OutlookList6Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NPMT'
                OnClick = fcOutlookBar1OutlookList6Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PMT'
                OnClick = fcOutlookBar1OutlookList6Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PV'
                OnClick = fcOutlookBar1OutlookList6Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RATE'
                OnClick = fcOutlookBar1OutlookList6Items4Click
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
          Width = 93
          Height = 0
          object fcOutlookBar1OutlookList3: TfcOutlookList
            Left = 0
            Top = 0
            Width = 93
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
                Text = 'ANO'
                OnClick = fcOutlookBar1OutlookList3Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONVERTEDATA'
                OnClick = fcDataCONVERTEDATA
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DATAREF'
                OnClick = fcOutlookBar1OutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIA'
                OnClick = fcOutlookBar1OutlookList3Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASDOMES'
                OnClick = fcOutlookBar1OutlookList3Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASFINAIS'
                OnClick = fcOutlookBar1OutlookList3Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIASINICIAIS'
                OnClick = fcOutlookBar1OutlookList3Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIAFINAL'
                OnClick = fcOutlookBar1OutlookList3Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIAINICIAL'
                OnClick = fcOutlookBar1OutlookList3Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFANOS'
                OnClick = fcOutlookBar1OutlookList3Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFDIAS'
                OnClick = fcOutlookBar1OutlookList3Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'DIFMESES'
                OnClick = fcOutlookBar1OutlookList3Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EANO'
                OnClick = fcOutlookBar1OutlookList3Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EDIA'
                OnClick = fcOutlookBar1OutlookList3Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'EMES'
                OnClick = fcOutlookBar1OutlookList3Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'HOJE'
                OnClick = fcOutlookBar1OutlookList3Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MES'
                OnClick = fcOutlookBar1OutlookList3Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PARADATA'
                OnClick = fcOutlookBar1OutlookList3Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SEMANA'
                OnClick = fcOutlookBar1OutlookList3Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FERIADO'
                OnClick = fcOutlookBar1OutlookList3Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ENTREDATAS'
                OnClick = fcOutlookBar1OutlookList3Items20Click
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
          Width = 169
          Height = 0
          object fcOutlookBar1OutlookList4: TfcOutlookList
            Left = 0
            Top = 0
            Width = 169
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
                Text = 'FILTRAINSS'
                OnClick = fcOutlookBar1OutlookList4Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'IRRF'
                OnClick = fcOutlookBar1OutlookList4Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDIAINSS'
                OnClick = fcOutlookBar1OutlookList4Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMINSS'
                OnClick = fcOutlookBar1OutlookList4Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SBINSS'
                OnClick = fcOutlookBar1OutlookList4Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SORTINSS'
                OnClick = fcOutlookBar1OutlookList4Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'REAJUSTAINSS'
                OnClick = fcOutlookBar1OutlookList4Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRCALCINSS'
                OnClick = fcOutlookBar1OutlookList4Items7Click
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
          Width = 148
          Height = 0
          object fcOutlookBar1OutlookList5: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
                Text = 'CP'
                OnClick = fcOutlookBar1OutlookList5Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CORREÇÃO'
                OnClick = fcOutlookBar1OutlookList5Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'INDICE'
                OnClick = fcOutlookBar1OutlookList5Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MED'
                OnClick = fcOutlookBar1OutlookList5Items11Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMCONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMOCORCONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NP'
                OnClick = fcOutlookBar1OutlookList5Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMSALARIOS'
                OnClick = fcOutlookBar1OutlookList5Items5Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPBENEF'
                OnClick = fcOutlookBar1OutlookList5Items13Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPCONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items6Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'OPPATRO'
                OnClick = fcOutlookBar1OutlookList5Items7Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PR2'
                OnClick = fcOutlookBar1OutlookList5Items8Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PRO'
                OnClick = fcOutlookBar1OutlookList5Items9Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SALCONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items12Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VEROPCONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items10Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'RUBRINDIV'
                OnClick = fcOutlookBar1OutlookList5Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FREQSALARIO'
                OnClick = fcOutlookBar1OutlookList5Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CPASSIST'
                OnClick = fcOpcoesCPASSIST
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMARUBRICA'
                OnClick = fcOutlookBar1OutlookList5Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDIARUBRICA'
                OnClick = fcOutlookBar1OutlookList5Items19Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CALCULASALPART'
                OnClick = fcOutlookBar1OutlookList5Items20Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORSRB'
                OnClick = fcOutlookBar1OutlookList5Items21Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMACONTRIB'
                OnClick = fcOutlookBar1OutlookList5Items22Click
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
          Width = 93
          Height = 0
          object fcOutlookBar1OutlookList7: TfcOutlookList
            Left = 0
            Top = 0
            Width = 93
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
                Text = 'TABGENERICA'
                OnClick = fcOutlookBar1OutlookList7Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CONSULTA'
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
          Width = 148
          Height = 0
          object fcOpcoesOutlookList1: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
                Text = 'ADICIONALDIA'
                OnClick = fcEvolFuncADICIONALDIA
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'ADICIONALMES'
                OnClick = fcEvolFuncADICIONALMES
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAPCS'
                OnClick = fcEvolFuncBUSCAPCS
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CFPESSOA'
                OnClick = fcEvolFuncCFPESSOA
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'GRUPOPESSOA'
                OnClick = fcEvolFuncGRUPOPESSOA
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MAIORCF'
                OnClick = fcEvolFuncMAIORCF
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NIVELPESSOA'
                OnClick = fcEvolFuncNIVELPESSOA
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMDIASADICIONAL'
                OnClick = fcEvolFuncNUMDIASADICIONAL
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMDIASPERCADICIONAL'
                OnClick = fcOpcoesNUMDIASPERCADICIONAL
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PERCENTUALFUNCAO'
                OnClick = fcEvolFuncPERCENTUALFUNCAO
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TOTALCFMES'
                OnClick = fcEvolFuncTOTALCFMES
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VALORCF'
                OnClick = fcEvolFuncVALORCF
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VERFUNCAOPCC'
                OnClick = fcEvolFuncVERFUNCAOPCC
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCAFUNCAOADICCOMP'
                OnClick = fcEvolFuncBUSCAFUNCAOADICCOMP
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'QTDMINUTOS'
                OnClick = fcOpcoesOutlookList1Items14Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CFPBC'
                OnClick = fcOpcoesOutlookList1Items15Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'FUNDATAFINAL'
                OnClick = fcOpcoesOutlookList1Items16Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'PERCFUNPBC'
                OnClick = fcOpcoesOutlookList1Items17Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRCF'
                OnClick = fcOpcoesOutlookList1Items18Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'BUSCADETCALCULO'
                OnClick = fcOpcoesOutlookList1Items19Click
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
          Width = 148
          Height = 0
          object fcOpcoesOutlookList3: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
                Text = 'CMDIB'
                OnClick = fcOpcoesOutlookList3Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'CMMES'
                OnClick = fcOpcoesOutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'MEDPERCRUB'
                OnClick = fcOpcoesOutlookList3Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'NUMOCORRUB'
                OnClick = fcOpcoesOutlookList3Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRCF'
                OnClick = fcOpcoesOutlookList3Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRFAIXA'
                OnClick = fcOpcoesOutlookList3Items4Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'VLRRUBMES'
                OnClick = fcOpcoesOutlookList3Items0Click
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
          Width = 148
          Height = 0
          object fcOpcoesOutlookList4: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
                Text = 'TEMPOPATRO'
                OnClick = fcOpcoesOutlookList4Items0Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOPLANO'
                OnClick = fcOpcoesOutlookList4Items1Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOAFAST'
                OnClick = fcOpcoesOutlookList4Items2Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'TEMPOFUNDACAO'
                OnClick = fcOpcoesOutlookList4Items3Click
              end
              item
                ImageIndex = 0
                Selected = False
                Separation = 10
                Tag = 0
                Text = 'SOMADIASBENEF'
                OnClick = fcOpcoesOutlookList4Items4Click
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
          Width = 148
          Height = 0
          object fcOpcoesOutlookList2: TfcOutlookList
            Left = 0
            Top = 0
            Width = 148
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
                Text = 'COTACAORENFIX'
                OnClick = fcOpcoesOutlookList2Items0Click
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
      object Panel3: TPanel
        Left = 174
        Top = 1
        Width = 28
        Height = 455
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object BitBtn21: TBitBtn
          Left = 1
          Top = 26
          Width = 25
          Height = 25
          Hint = 'Apaga a expressão toda'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtn21Click
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
        object btnApagarUltimo: TBitBtn
          Left = 1
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Apaga o último caracter'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnApagarUltimoClick
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
      Left = 208
      Top = 5
      Width = 587
      Height = 457
      Align = alRight
      Caption = 'Panel4'
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 585
        Height = 114
        Align = alTop
        BevelOuter = bvLowered
        BevelWidth = 2
        TabOrder = 1
        object lblFormula: TLabel
          Left = 169
          Top = 3
          Width = 178
          Height = 23
          Caption = 'Código da Formula'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        object Label2: TLabel
          Left = 10
          Top = 5
          Width = 187
          Height = 13
          Caption = 'Número     Descrição da Fórmula'
        end
        object Label4: TLabel
          Left = 360
          Top = 5
          Width = 101
          Height = 13
          Caption = 'Grupo da Fórmula'
        end
        object sbtncampos: TSpeedButton
          Left = 553
          Top = 56
          Width = 25
          Height = 25
          Hint = 'Campos e Variáveis'
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
          OnClick = sbtncamposClick
        end
        object Label3: TLabel
          Left = 10
          Top = 41
          Width = 59
          Height = 13
          Caption = 'Expressão'
        end
        object DBEdtDescrcao: TwwDBEdit
          Left = 73
          Top = 19
          Width = 278
          Height = 21
          DataField = 'DESCRICAOFORMULA'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblckcombogrupo: TwwDBLookupCombo
          Left = 360
          Top = 19
          Width = 219
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCGRUPOFORMULA'#9'40'#9'DESCGRUPOFORMULA')
          DataField = 'CODGRUPOFORMULA'
          DataSource = ds
          LookupTable = QryGrupo
          LookupField = 'CODGRUPOFORMULA'
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object dedMemo: TwwDBEdit
          Left = 10
          Top = 57
          Width = 540
          Height = 47
          AutoSelect = False
          AutoSize = False
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'EXPRESSAOFORMULA'
          DataSource = ds
          ParentCtl3D = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = True
        end
        object DBEdtIDFormula: TwwDBEdit
          Left = 10
          Top = 19
          Width = 63
          Height = 21
          Color = clBtnFace
          DataField = 'IDFORMULA'
          DataSource = ds
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnChange = DBEdtIDFormulaChange
        end
      end
      object pnlTeclas: TPanel
        Left = 1
        Top = 115
        Width = 585
        Height = 341
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnlTeclas'
        Enabled = False
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 583
          Height = 339
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = 'Panel1'
          TabOrder = 0
          object Label5: TLabel
            Left = 48
            Top = 40
            Width = 130
            Height = 13
            Caption = 'CODGRUPOFORMULA'
          end
          object Label6: TLabel
            Left = 104
            Top = 56
            Width = 33
            Height = 13
            Caption = 'grupo'
          end
          object memDesc: TMemo
            Left = 1
            Top = 1
            Width = 581
            Height = 337
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 800
    object Label1: TLabel [0]
      Left = 315
      Top = 2
      Width = 489
      Height = 40
      Align = alTop
      Caption = 
        'Atenção: Para otimizar as suas Regras não esqueça de usar os "Co' +
        'ringas";                     @ no caso de Variaveis e  # no caso' +
        ' de Palavras Literais.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = '`'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 244
      TabOrder = 1
      object sbtnCopiar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Procura de formulas, campos, variaveis'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      
        '   IDFORMULA, CODGRUPOFORMULA, EXPRESSAOFORMULA, DESCRICAOFORMUL' +
        'A,'
      '   EXPRESSAOREAL'
      'FROM'
      '   FORMULA'
      'WHERE'
      '   IDFORMULA = :ID')
    Left = 90
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FORMULA'
      'set'
      '  IDFORMULA = :IDFORMULA,'
      '  CODGRUPOFORMULA = :CODGRUPOFORMULA,'
      '  EXPRESSAOFORMULA = :EXPRESSAOFORMULA,'
      '  DESCRICAOFORMULA = :DESCRICAOFORMULA,'
      '  EXPRESSAOREAL = :EXPRESSAOREAL'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    InsertSQL.Strings = (
      'insert into FORMULA'
      
        '  (IDFORMULA, CODGRUPOFORMULA, EXPRESSAOFORMULA, DESCRICAOFORMUL' +
        'A, EXPRESSAOREAL)'
      'values'
      
        '  (:IDFORMULA, :CODGRUPOFORMULA, :EXPRESSAOFORMULA, :DESCRICAOFO' +
        'RMULA, '
      '   :EXPRESSAOREAL)')
    DeleteSQL.Strings = (
      'delete from FORMULA'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    Left = 155
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FORMULA.IDFORMULA'
      'FORMULA.DESCRICAOFORMULA'
      'GRPFORMULA.DESCGRUPOFORMULA'
      'FORMULA.EXPRESSAOREAL')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da formula'
      'Descrição da Formula'
      'Grupo da formula'
      'Expressão real')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FORMULA'
      'GRPFORMULA')
    CamposChave.Strings = (
      'FORMULA.IDFORMULA')
    Filtro.Strings = (
      'FORMULA.CODGRUPOFORMULA=GRPFORMULA.CODGRUPOFORMULA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '40'
      '255')
    Left = 405
  end
  inherited ds: TwwDataSource
    Left = 123
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 57
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryGrupo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODGRUPOFORMULA, DESCGRUPOFORMULA'
      'FROM'
      '   GRPFORMULA'
      'ORDER BY'
      '   DESCGRUPOFORMULA'
      '')
    ValidateWithMask = True
    Left = 472
    Top = 177
  end
  object dsGrupo: TwwDataSource
    DataSet = QryGrupo
    Left = 504
    Top = 177
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 177
  end
  object ImageList1: TImageList
    Left = 624
    Top = 175
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
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
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007C007C007C000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000001002FF03
      1002FF031002FF03000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFC0070000FFFFFFFFDFF70000
      BCFFEFFFD51700005AFFEFFFDFF70000EBFFD7FFD5570000F7CFD7FFDFF70000
      F7AFD7FFD5570000EBE7D3FFDFF70000AD77BBFFD5570000DEEBBBFFDFF70000
      FFEBBBFFD0170000FFEBFDFDD0170000FFDDFDFDD0170000FFDDFE01DFF70000
      FFFFFFFFDFF70000FFFFFFFFC007000000000000000000000000000000000000
      000000000000}
  end
  object Regra1: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 417
    Top = 101
  end
end
