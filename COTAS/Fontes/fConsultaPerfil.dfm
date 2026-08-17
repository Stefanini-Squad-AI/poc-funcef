inherited frmConsultaPerfil: TfrmConsultaPerfil
  Left = 168
  Top = 119
  HelpContext = 545026
  Caption = 'Consulta de Perfil Cadastrado'
  ClientHeight = 472
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 177
    Width = 792
    Height = 256
    Color = clSilver
    inherited PagControle: TPageControl
      Width = 790
      Height = 254
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 323
          Align = alNone
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 244
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlCalCota: TPanel
            Left = 425
            Top = 0
            Width = 357
            Height = 244
            Align = alRight
            TabOrder = 0
            object trvCotas: TTreeView
              Left = 1
              Top = 28
              Width = 355
              Height = 215
              Align = alClient
              HideSelection = False
              Images = imgTreeView
              Indent = 19
              ReadOnly = True
              TabOrder = 0
              OnDblClick = trvCotasDblClick
            end
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 355
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Ativos a Calcular'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object pnlPerfil: TPanel
            Left = 0
            Top = 0
            Width = 356
            Height = 244
            Align = alLeft
            TabOrder = 1
            object trvPerfil: TTreeView
              Left = 1
              Top = 28
              Width = 354
              Height = 215
              Align = alClient
              HideSelection = False
              Images = imgTreeView
              Indent = 19
              ReadOnly = True
              TabOrder = 0
              OnDblClick = trvPerfilDblClick
            end
            object Panel3: TPanel
              Left = 1
              Top = 1
              Width = 354
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Perfil'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object pnlBotoes: TPanel
            Left = 356
            Top = 0
            Width = 69
            Height = 244
            Align = alClient
            TabOrder = 2
            object btPassaUm: TSpeedButton
              Left = 0
              Top = 0
              Width = 61
              Height = 61
              Anchors = [akLeft, akTop, akRight]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
                66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
                66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
                660878F888778888887887E666F66666608887F88878888887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              OnClick = btPassaUmClick
            end
            object btVoltaUm: TSpeedButton
              Left = 0
              Top = 61
              Width = 61
              Height = 61
              Anchors = [akLeft, akTop, akRight]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
                66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
                66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
                660878F888877F88887887E66666F666608887F88888788887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              OnClick = btVoltaUmClick
            end
            object btPassaTodos: TSpeedButton
              Left = 0
              Top = 122
              Width = 61
              Height = 61
              Anchors = [akLeft, akTop, akRight]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
                66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
                66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
                660878F877887788887887E6F666F666608887F87888788887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              OnClick = btPassaTodosClick
            end
            object btVoltaTodos: TSpeedButton
              Left = 0
              Top = 183
              Width = 61
              Height = 61
              Anchors = [akLeft, akTop, akRight]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
                66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
                66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
                660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              OnClick = btVoltaTodosClick
            end
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 121
          Align = alNone
          Caption = 'Resultados:'
          TextOptions.Alignment = taCenter
          Transparent = True
        end
        object PagControlAbas: TPageControl
          Left = 0
          Top = 0
          Width = 782
          Height = 244
          ActivePage = Pag1
          Align = alClient
          TabOrder = 0
          object Pag1: TTabSheet
            Caption = 'Total'
            object dbGrd: TwwDBGrid
              Left = 0
              Top = 0
              Width = 774
              Height = 216
              PictureMasks.Strings = (
                'VLRCOTA'#9'R$ ####,##'#9'T'#9'T')
              Selected.Strings = (
                'DATA'#9'11'#9'Data'
                'VLRPATRIMONIOINI'#9'20'#9'Valor Patrimonio Inicial'
                'VLRPATRIMONIOFIM'#9'20'#9'Valor Patrimonio Final'
                'QTDCOTAFIM'#9'17'#9'Qtd. Cotas'
                'VLRCOTA'#9'15'#9'Valor Cota'
                'VLRCOTIZADO'#9'15'#9'Valor Cotizado'
                'VLRRENTABILIZADO'#9'10'#9'Valor Rentabilizado')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmRelPerfilConsolidado.dsAtivosConsolidados
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = dbGrdCalcCellColors
              OnTitleButtonClick = dbGrdTitleButtonClick
              IndicatorColor = icBlack
              OnTopRowChanged = dbGrdTopRowChanged
            end
          end
          object Pag2: TTabSheet
            Caption = 'Ativos'
            ImageIndex = 1
            object dbGridTotalDiario: TwwDBGrid
              Left = 0
              Top = 0
              Width = 774
              Height = 216
              Selected.Strings = (
                'DATA'#9'11'#9'Data'
                'ATIVO'#9'40'#9'Ativo'
                'PLANO'#9'36'#9'Plano'
                'PATRO'#9'34'#9'Patro'
                'QTDCOTA'#9'15'#9'Qtd. Cotas'
                'VLRCOTA'#9'15'#9'Valor da Cota'
                'VLRCOTIZADO'#9'19'#9'Valor Cotizado'
                'VLRRENTABILIZADO'#9'19'#9'Valor Rentabilizado'
                'VLRPATRIMONIO'#9'17'#9'Valor Patrimônio'
                'ORIGEMATIVO'#9'50'#9'Origem')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dtmRelPerfilConsolidado.dsAtivosEspecif
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = dbGrdCalcCellColors
              OnTitleButtonClick = dbGridTotalDiarioTitleButtonClick
              IndicatorColor = icBlack
              OnTopRowChanged = dbGrdTopRowChanged
            end
          end
          object tshIndicadores: TTabSheet
            Caption = 'Indicadores'
            ImageIndex = 2
            object pnlValores: TPanel
              Left = 1
              Top = 40
              Width = 769
              Height = 58
              BevelInner = bvLowered
              BorderWidth = 3
              Color = clSilver
              TabOrder = 0
              object pnlIndJuros: TPanel
                Tag = 1
                Left = 345
                Top = 25
                Width = 128
                Height = 25
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = '0,0000 % '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object pnlPerSInd: TPanel
                Tag = 3
                Left = 600
                Top = 25
                Width = 159
                Height = 25
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = '0,0000 % '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object pnlTitPerSInd: TPanel
                Tag = 3
                Left = 600
                Top = 7
                Width = 158
                Height = 17
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = '% sobre Indicador '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object pnlNomeInd: TPanel
                Tag = 1
                Left = 7
                Top = 25
                Width = 237
                Height = 25
                Alignment = taLeftJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = ' Nenhum indicador foi informado'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
              object Panel9: TPanel
                Tag = 3
                Left = 7
                Top = 7
                Width = 237
                Height = 17
                Alignment = taLeftJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = ' Indicador'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
              end
              object Panel8: TPanel
                Tag = 3
                Left = 474
                Top = 7
                Width = 124
                Height = 17
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = 'Valorização da Cota '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
              end
              object pnlValorizacao: TPanel
                Tag = 1
                Left = 474
                Top = 25
                Width = 124
                Height = 25
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = '0,0000 % '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
              end
              object Panel6: TPanel
                Tag = 3
                Left = 345
                Top = 7
                Width = 128
                Height = 17
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = 'Indicador + Juros '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
              end
              object pnlTxJuros: TPanel
                Tag = 1
                Left = 245
                Top = 25
                Width = 99
                Height = 25
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = '0,0000 % '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
              end
              object Panel7: TPanel
                Tag = 3
                Left = 246
                Top = 7
                Width = 98
                Height = 17
                Alignment = taRightJustify
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Caption = 'Taxa de Juros '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
              end
            end
          end
          object pgCalculo: TTabSheet
            Caption = 'pgCalculo'
            ImageIndex = 3
            TabVisible = False
            object Button1: TButton
              Left = 184
              Top = 144
              Width = 75
              Height = 25
              Caption = 'Button1'
              TabOrder = 0
            end
          end
          object thsGrafico: TTabSheet
            Caption = 'Gráfico'
            ImageIndex = 4
            object dbGrafico: TDBChart
              Left = 0
              Top = 0
              Width = 774
              Height = 216
              BackWall.Brush.Color = clWhite
              PrintProportional = False
              Title.Text.Strings = (
                '')
              BottomAxis.AxisValuesFormat = 'dd/mm/yyyy'
              BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
              BottomAxis.ExactDateTime = False
              BottomAxis.Increment = 1.15740740740741E-5
              BottomAxis.LabelsSeparation = 15
              Chart3DPercent = 5
              LeftAxis.Axis.Color = clBlue
              LeftAxis.Axis.Width = 1
              LeftAxis.PositionPercent = -2
              Legend.ShadowSize = 2
              View3DOptions.Elevation = 351
              View3DOptions.HorizOffset = -2
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              Align = alClient
              TabOrder = 0
              object Series1: TLineSeries
                Marks.ArrowLength = 8
                Marks.Style = smsValue
                Marks.Visible = False
                DataSource = dtmRelPerfilConsolidado.CdsAtivosConsolidados
                SeriesColor = clRed
                XLabelsSource = 'DATA'
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.DateTime = True
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                XValues.ValueSource = 'DATA'
                YValues.DateTime = False
                YValues.Name = 'Y'
                YValues.Multiplier = 1
                YValues.Order = loNone
                YValues.ValueSource = 'VLRCOTA'
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 433
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 262
      DockPos = 408
      inherited sep1: TToolbarSep97
        Left = 524
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 173
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 175
      end
      object btRelatorio: TToolbarButton97 [4]
        Left = 83
        Top = 0
        Width = 90
        Height = 33
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = pmnRelatorio
        Caption = ' Relatório'
        Enabled = False
        Flat = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        ImageIndex = 3
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
      end
      inherited bbtnSair: TBitBtn
        Left = 362
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 443
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 281
        Visible = False
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 200
        Caption = 'Calcular'
        Enabled = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777700000000000000766444444444444406E6666666666
          66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
          66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
          EE60766666666666666777777777777777777777777777777777}
        NumGlyphs = 1
        OnClick = btnConfirmarClick
      end
    end
  end
  object Panel5: TPanel [2]
    Left = 0
    Top = 0
    Width = 792
    Height = 177
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object pnlConsulta: TPanel
      Left = 2
      Top = 2
      Width = 494
      Height = 173
      Align = alLeft
      TabOrder = 0
      object Label1: TLabel
        Left = 208
        Top = 124
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label7: TLabel
        Left = 208
        Top = 74
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 72
        Width = 177
        Height = 89
        Caption = ' Período '
        TabOrder = 0
        object Label12: TLabel
          Left = 28
          Top = 28
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Início:  '
        end
        object Label13: TLabel
          Left = 16
          Top = 60
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Término:  '
        end
        object edDtInicio: TCMDateTimePicker
          Left = 72
          Top = 24
          Width = 90
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
        end
        object edDtFim: TCMDateTimePicker
          Left = 72
          Top = 56
          Width = 90
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
        end
      end
      object cmbPlano: TCMDBLookupCombo
        Left = 208
        Top = 139
        Width = 269
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPLANO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = cmbPlanoEnter
      end
      object cmbPatro: TCMDBLookupCombo
        Left = 208
        Top = 88
        Width = 269
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsPatro
        LookupField = 'IDPATRO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbPatroCloseUp
        OnEnter = cmbPatroEnter
      end
      object GroupBox5: TGroupBox
        Left = 16
        Top = 4
        Width = 288
        Height = 61
        TabOrder = 4
        object Label14: TLabel
          Left = 9
          Top = 0
          Width = 106
          Height = 13
          Caption = ' Perfil Cadastrado '
        end
        object edPerfil: TwwDBEdit
          Left = 7
          Top = 28
          Width = 155
          Height = 21
          Color = clBtnFace
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object edTipo: TwwDBEdit
          Left = 173
          Top = 28
          Width = 79
          Height = 21
          Color = clBtnFace
          DataField = 'TIPOPERFIL'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object BitBtn1: TBitBtn
          Left = 254
          Top = 27
          Width = 26
          Height = 24
          Hint = 'Procurar Perfil...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btProcurarClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
            840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
            0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
            FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
            FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
            8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
            840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
            0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
            8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
            FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
            0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
            FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
            0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
            0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
            000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
      object rdPerfil: TRadioGroup
        Left = 310
        Top = 4
        Width = 166
        Height = 61
        Caption = ' SPC ou Origem '
        Columns = 2
        Items.Strings = (
          'SPC'
          'Origem')
        TabOrder = 5
        OnClick = rdPerfilClick
      end
      object CbxPlanoSPC: TCheckBox
        Left = 393
        Top = 120
        Width = 83
        Height = 17
        Caption = 'Plano SPC'
        TabOrder = 2
        OnClick = CbxPlanoSPCClick
      end
    end
    object pnlIndicador: TPanel
      Left = 496
      Top = 2
      Width = 294
      Height = 173
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 167
        Height = 13
        Caption = 'Regra de Cálculo - Indexador'
      end
      object Label3: TLabel
        Left = 16
        Top = 66
        Width = 141
        Height = 13
        Caption = 'Regra de Cálculo - Juros'
      end
      object Label4: TLabel
        Left = 16
        Top = 110
        Width = 53
        Height = 13
        Caption = 'Tx. Juros'
      end
      object Label5: TLabel
        Left = 98
        Top = 110
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object cmbRegraIndex: TCMDBLookupCombo
        Left = 16
        Top = 32
        Width = 265
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Descrição'#9'F')
        LookupTable = CdsRegraIndex
        LookupField = 'IDREGRA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboRegraJuros: TCMDBLookupCombo
        Left = 16
        Top = 80
        Width = 265
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Descrição'#9'F')
        LookupTable = CdsRegraJuros
        LookupField = 'IDREGRA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edTxJuros: TDBRealEdit
        Left = 16
        Top = 124
        Width = 52
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object sePercentual: TSpinEdit
        Left = 98
        Top = 124
        Width = 63
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 100
      end
      object btExecRegra: TBitBtn
        Left = 178
        Top = 119
        Width = 103
        Height = 25
        Caption = 'Ver índices'
        TabOrder = 4
        OnClick = btExecRegraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
          3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
          00007777777777777777330333333C333333337FFF3337F3333F370993333C33
          3399377773F337F33377330339333C3339333F7FF7FFF7FFF7FF770777977C77
          97777777777777777777330333933C339333337F3373F7F37333370333393C39
          3333377F333737F7333333033333999333333F7FFFFF777FFFFF770777777C77
          77777777777777777777330333333C330333337F333337FF7FF3370333333C00
          003C377F333337777737330333333C3303333F7FFFFFF7FF7FFF770777777777
          7777777777777777777733333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 931
    Top = 51
    TargetsData = (
      1
      2
      (
        ''
        'Items'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object CdsNoperfilCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 321
  end
  object CdsNoPerfilXativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 273
  end
  object imgTreeView: TImageList
    Left = 12
    Top = 24
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000084000000840000008400000084000000FF000000FF000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      0000000000000000000000000000000000008400000084000000FF0000008484
      8400FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      000000000000000000000000000000000000000000000000000084000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000008400
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FF0000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000008400000000000000000000000000000000000000000000000000
      000084000000FF00000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000084848400FF00000084000000840000000000000000000000000000000000
      000084000000FF00000000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000FF0000008400000084000000840000008400
      0000FF000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C60000000000000000000000000000000000000000000084
      A5000084A5000084A5000084A5000084A5000084A5000084A5000084A5000084
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF00FFFF
      FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF007B7B7B007B7B
      7B00000000007B7B7B007B7B7B0000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C6000000
      00000084A5000084A5000084A5000084A5000084A5000084A5000084A5000084
      A5000084A5000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF0000000000000000007B7B7B00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C600000000000084A5000084A5000084A5000084A5000084A5000084A5000084
      A5000084A5000084A50000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      00007B7B7B0000000000FFFFFF007B7B7B007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C600000000000084A5000084A5000084A5000084A5000084A5000084
      A5000084A5000084A5000084A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      0000000000007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C600000000000084A5000084A5000084A5000084A5000084
      A5000084A5000084A5000084A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C60042C6C600000000000084A5000084A5000084A5000084
      A5000084A5000084A5000084A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF00FFFF
      FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF007B7B7B007B7B
      7B00000000007B7B7B007B7B7B0000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C60042C6C60042C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF0000000000000000007B7B7B00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6
      C60042C6C60042C6C60000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      00007B7B7B0000000000FFFFFF007B7B7B007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6C60042C6
      C60042C6C60042C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF000000
      0000000000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042C6C60042C6
      C60042C6C60042C6C60042C6C60042C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C6000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042C6
      C60042C6C60042C6C60042C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF007B7B7B007B7B7B00000000007B7B7B007B7B7B007B7B
      7B000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C6000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042C6
      C60042C6C60042C6C60042C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00FFFFFF00000000000000
      00007B7B7B00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000008400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000FFFFFF007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C6000021E7000021E70000C6C60000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C60000000000000000000000000000000000000000000084
      A5000084A5000042E7000042E7000084A5000084A5000084A5000084A5000084
      A50000000000000000000000000000000000000000000000000000000000C6DE
      C600C6DEC600C6DEC6000021C600C6DEC600C6DEC600C6DEC600C6DEC600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C6000021C60000C6C60000C6C60000C6C60000C6C60000C6
      C60000000000000000000000000000000000000000000000000000C6C60000C6
      C6000021E7000021E7000021E7000021E70000C6C60000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000000C6C6000000
      00000042E7000042E7000042E7000042E7000084A5000084A5000084A5000084
      A5000084A500000000000000000000000000000000000000000000000000C6DE
      C600C6DEC6000021C6000021C6000021C600C6DEC600C6DEC600C6DEC600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C6000042C6000021C6000021C60000C6C60000C6C60000C6C60000C6
      C60000000000000000000000000000000000000000000000000000C6C6000021
      E7000021E7000021E7000021E7000021E7000021E70000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000000C6C6000042
      E7000042E7000042E7000042E7000042E7000042E7000084A5000084A5000084
      A5000084A5000084A5000000000000000000000000000000000000000000C6DE
      C6000021C6000021C600000000000021C600000000000000000000000000C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C6000042C6000042C600000000000021C60000000000000000000000000000C6
      C60000000000000000000000000000000000000000000000000000C6C6000021
      E7000021E7000021E7000021E7000021E7000021E70000C6C60000C6C60000C6
      C60000C6C60000C6C6000000000000000000000000000000000000C6C6000042
      E7000042E7000042E7000042E7000042E7000042E7000084A5000084A5000084
      A5000084A5000084A5000084A50000000000000000000000000000000000C6DE
      C6000021C600C6DEC600C6DEC6000021C6000021C600C6DEC600C6DEC600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C6000042C60000C6C60000C6C6000042C6000021C60000C6C60000C6C60000C6
      C6000000000000000000000000000000000000000000000000000021E7000021
      E7000021E70000C6C60000C6C6000021E7000021E7000021E70000C6C60000C6
      C60000C6C60000C6C600000000000000000000000000000000000042E7000042
      E7000042E70000C6C600000000000042E7000042E7000042E7000084A5000084
      A5000084A5000084A5000084A5000084A5000000000000000000000000000021
      C6000021C6000000000000000000000000000021C6000000000000000000C6DE
      C600000000000000000000000000000000000000000000000000000000000042
      C6000042C6000000000000000000000000000021C600000000000000000000C6
      C60000000000000000000000000000000000000000000021E7000021E7000021
      E70000C6C60000C6C60000C6C60000C6C6000021E7000021E7000021E70000C6
      C60000C6C60000C6C6000000000000000000000000000042E7000042E7000042
      E70000C6C60000C6C60000C6C600000000000042E7000042E7000042E7000084
      A5000084A5000084A5000084A5000084A5000000000000000000000000000021
      C600C6DEC600C6DEC600C6DEC600C6DEC6000021C6000021C600C6DEC600C6DE
      C600000000000000000000000000000000000000000000000000000000000042
      C60000C6C60000C6C60000C6C60000C6C6000042C6000021C60000C6C60000C6
      C600000000000000000000000000000000000021E7000021E7000021E70000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C6000021E7000021E7000021
      E70000C6C60000C6C60000000000000000000042E7000042E7000042E70000C6
      C60000C6C60000C6C60000C6C60000C6C600000000000042E7000042E7000042
      E70000000000000000000000000000000000000000000000000000000000C6DE
      C60000000000000000000000000000000000C6DEC6000021C600C6DEC600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C6000000000000000000000000000000000000C6C6000021C60000C6C60000C6
      C600000000000000000000000000000000000021E7000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C6000021
      E7000021E70000C6C60000000000000000000042E7000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C6000042E7000042
      E7000042E70000C6C6000000000000000000000000000000000000000000C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC6000021C600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C6000021C60000C6
      C60000000000000000000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C6000021E7000021E7000000000000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6
      C6000042E7000042E7000000000000000000000000000000000000000000C6DE
      C6000000000000000000000000000000000000000000000000000021C600C6DE
      C6000000000000000000000000000000000000000000000000000000000000C6
      C6000000000000000000000000000000000000000000000000000021C60000C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000021E7000021E70000000000000000000000000000C6C60000C6
      C60000C6C60000C6C60000C6C60000C6C6000000000000000000000000000000
      0000000000000042E7000042E70000000000000000000000000000000000C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC6000021
      C6000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C6000021
      C6000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C6000000000000000000000000000000
      000000000000000000000021E7000021E70000000000000000000000000000C6
      C60000C6C60000C6C60000C6C600000000000000000000000000000000000000
      000000000000000000000042E7000042E700000000000000000000000000C6DE
      C60000000000000000000000000000000000C6DEC600C6DEC600000000000000
      00000000000000000000000000000000000000000000000000000000000000C6
      C6000000000000000000000000000000000000C6C60000C6C600000000000000
      00000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C6000000000000000000000000000000
      00000000000000000000000000000021E70000000000000000000000000000C6
      C60000C6C60000C6C60000C6C600000000000000000000000000000000000000
      00000000000000000000000000000042E700000000000000000000000000C6DE
      C600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600C6DEC600000000000000
      00000000000000000000000000000000000000000000000000000000000000C6
      C60000C6C60000C6C60000C6C60000C6C60000C6C60000C6C600000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000084
      A50042C6C6000084A50042C6C6000084A50042C6C6000084A50042C6C6000084
      A50000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF000000
      00000084A50042C6C6000084A50042C6C6000084A50042C6C6000084A50042C6
      C6000084A500000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF00000000000084A50042C6C6000084A50042C6C6000084A50042C6C6000084
      A50042C6C6000084A5000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E7000000000000000000000000000000000000000000000000000000000000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000084A50042C6C6000084A50042C6C6000084A50042C6
      C6000084A50042C6C6000084A50000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF00000000000084A50042C6C6000084A50042C6C6000084
      A50042C6C6000084A50042C6C60000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E7000000000000000000000000000000000000000000000000000000000000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000084A50042C6C6000084A50042C6
      C6000084A50042C6C6000084A50000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E7000000000000000000000000000000000000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E70000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000000000000000000000000000000000000000000000000000E7E70000E7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7
      E7000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000000000E7
      E7000000000000000000000000000000000000E7E70000E7E700000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000000000000000E7
      E70000E7E70000E7E70000E7E70000E7E70000E7E70000E7E700000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F0FFFFFF00000000E03BFF9F00000000
      CF03FE1F00000000CFC3F81F00000000CFC3E00F00000000CF83E00F00000000
      E7FFC00700000000FFFF800700000000FFE7000300000000C1F3200100000000
      C3F3100000000000C3F3040100000000C0F3200700000000DC07801F00000000
      FF0FC1FF00000000FFFFFFFF00000000FFFFFFFFBFFF9FFFC001C00FBFFF9824
      80018007B049800980018003807F833F80018001B07F947F80018000B9FF99FF
      80018000BFFF982480018000B049800980018000807F833F80018001B07F947F
      80018001B9FF99FF80038003BFFF8247C07FC0FF048F008FC07FC0FF07FF33FF
      C07FC0FF07FF47FFFFFFFFFF9FFF9FFFFFFFFFFFFFFFFFFFC001C00FC007C007
      80018007C007C00780018003C007C00780018001C007C00780018000C007C007
      80018000C007C00780018000C007C00700010000C007C00700010001C007C007
      80018001C007C00780018001C007C007C07CC0FCC007C007C07EC0FEC01FC01F
      C07FC0FFC01FC01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C00FC007C007
      80018007C007C00780018003C007C00780018001C007C00780018000C007C007
      80018000C007C00780018000C007C00780018000C007C00780018001C007C007
      80018001C007C00780038003C007C007C07FC0FFC007C007C07FC0FFC01FC01F
      C07FC0FFC01FC01FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object CdsPerfilCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 275
    object CdsPerfilCotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
    object CdsPerfilCotaTIPOPERFIL: TStringField
      FieldName = 'TIPOPERFIL'
      OnGetText = CdsPerfilCotaTIPOPERFILGetText
      FixedChar = True
      Size = 1
    end
  end
  object ImlPadrao: TImageList
    Left = 976
    Top = 55
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.DESCRICAO'
      'DECODE(P.TIPOPERFIL,'#39'S'#39','#39'SPC'#39','#39'Origem'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Perfil')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PERFILCOTA P')
    CamposChave.Strings = (
      'P.IDPERFILCOTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '13')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 413
    Top = 11
  end
  object ds: TwwDataSource
    DataSet = CdsPerfilCota
    Left = 381
    Top = 332
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 272
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 272
  end
  object CdsCotaCotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 272
    object CdsCotaCotacaoATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 40
      FieldName = 'ATIVO'
      Size = 60
    end
    object CdsCotaCotacaoVLRPATRIMONIO: TFloatField
      DisplayLabel = 'Valor do Patrimônio'
      DisplayWidth = 20
      FieldName = 'VLRPATRIMONIO'
      currency = True
    end
    object CdsCotaCotacaoQTDCOTA: TFloatField
      DisplayLabel = 'Quant. Cotas'
      DisplayWidth = 15
      FieldName = 'QTDCOTA'
    end
    object CdsCotaCotacaoDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object CdsCotaCotacaoPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'PLANO'
      Size = 50
    end
  end
  object dsCotaCotacao: TwwDataSource
    DataSet = CdsCotaCotacao
    Left = 297
    Top = 340
  end
  object CdsAtivosAConsolidar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 304
  end
  object CdsRegraIndex: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 224
  end
  object CdsRegraJuros: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 288
  end
  object CdsEspecAtivos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 224
  end
  object regIndicadores: TRegraMT
    IdCalculo = 0
    DbConnectionType = cntBDE
    Left = 735
    Top = 25
  end
  object pmnRelatorio: TPopupMenu
    Left = 609
    Top = 168
    object smnuNormal: TMenuItem
      Caption = '&Normal'
      OnClick = smnuNormalClick
    end
    object smnuExpandido: TMenuItem
      Caption = '&Expandido'
      OnClick = smnuExpandidoClick
    end
  end
end
