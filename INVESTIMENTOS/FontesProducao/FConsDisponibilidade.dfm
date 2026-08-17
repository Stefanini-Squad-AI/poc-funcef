inherited frmConsDisponibilidade: TfrmConsDisponibilidade
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 553
  ClientWidth = 790
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 514
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 512
      Align = alClient
      TabOrder = 0
      object bvlSepTit: TBevel
        Left = 1
        Top = 43
        Width = 786
        Height = 3
        Align = alTop
        Shape = bsBottomLine
      end
      object PgcSaldos: TPageControl
        Left = 1
        Top = 107
        Width = 786
        Height = 404
        ActivePage = tbsAnalitica
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        OnChange = PgcSaldosChange
        object tbsSintetica: TTabSheet
          Caption = 'Disponibilidade &Consolidada    '
          object dbgConsolidado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 778
            Height = 376
            Hint = 'Clique com o botão direito para Fixar Colunas'
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            Color = clWhite
            DataSource = DmRelDisponibilidade.dsSintetica
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnDrawDataCell = dbgConsolidadoDrawDataCell
            IndicatorColor = icYellow
          end
        end
        object tbsAnalitica: TTabSheet
          Caption = 'Disponibilidade &Analítica      '
          object pnlTotais: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 37
            Align = alTop
            Caption = ' '
            TabOrder = 0
            object DBEdit1: TDBEdit
              Left = 8
              Top = 8
              Width = 329
              Height = 21
              Color = 8404992
              DataField = 'NOMEPLANOPATRO'
              DataSource = DmRelDisponibilidade.dsSintetica
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 37
            Width = 778
            Height = 339
            Align = alClient
            TabOrder = 1
            object dbgAnalitico: TwwDBGrid
              Left = 1
              Top = 1
              Width = 776
              Height = 337
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'NODOCUMENTO'#9'11'#9'Nº do~Documento'
                'NOMEFORCLI'#9'52'#9'Cliente / Fornecedor'
                'VALORARECEBER'#9'19'#9'Recebimento'
                'VALORAPAGAR'#9'19'#9'Pagamento')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DmRelDisponibilidade.dsAnalitica
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clMaroon
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnDrawDataCell = dbgAnaliticoDrawDataCell
              IndicatorColor = icYellow
            end
          end
        end
        object tbsGrafico: TTabSheet
          Caption = '&Gráfico                            '
          ImageIndex = 2
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 770
            Height = 368
            Align = alClient
            TabOrder = 0
            object grfGrafico: TDBChart
              Left = 1
              Top = 1
              Width = 768
              Height = 366
              AnimatedZoom = True
              BackWall.Brush.Color = clWhite
              Gradient.EndColor = 8454143
              Gradient.Visible = True
              MarginBottom = 0
              MarginLeft = 1
              MarginRight = 1
              MarginTop = 2
              Title.Text.Strings = (
                '')
              Title.Visible = False
              BottomAxis.Visible = False
              Chart3DPercent = 25
              LeftAxis.Visible = False
              Legend.Alignment = laBottom
              Legend.TextStyle = ltsPlain
              RightAxis.AxisValuesFormat = 'R$ #,##0.00'
              RightAxis.ExactDateTime = False
              RightAxis.Increment = 1000
              RightAxis.LabelStyle = talValue
              TopAxis.Title.Caption = 'Disponibilidade'
              View3DOptions.Elevation = 339
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DOptions.VertOffset = 2
              View3DOptions.Zoom = 99
              View3DOptions.ZoomText = False
              Align = alClient
              BevelOuter = bvLowered
              BorderStyle = bsSingle
              TabOrder = 0
              object Series1: TBarSeries
                ColorEachPoint = True
                Marks.ArrowLength = 8
                Marks.Font.Charset = DEFAULT_CHARSET
                Marks.Font.Color = clBlack
                Marks.Font.Height = -9
                Marks.Font.Name = 'Arial'
                Marks.Font.Style = []
                Marks.Style = smsPercent
                Marks.Visible = True
                DataSource = DmRelDisponibilidade.qrySintetica
                SeriesColor = clRed
                Title = 'Disponibilidade de Investimentos'
                ValueFormat = ' R$ #,##0.00'
                VertAxis = aRightAxis
                XLabelsSource = 'NOMEPLANOPATRO'
                BarStyle = bsRectGradient
                XValues.DateTime = False
                XValues.Name = 'X'
                XValues.Multiplier = 1
                XValues.Order = loAscending
                YValues.DateTime = False
                YValues.Name = 'Bar'
                YValues.Multiplier = 1
                YValues.Order = loNone
                YValues.ValueSource = 'SALDODIA'
              end
            end
          end
        end
      end
      object pnlTitulo: TPanel
        Left = 1
        Top = 1
        Width = 786
        Height = 42
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblTitulo: TfcLabel
          Left = 1
          Top = 1
          Width = 784
          Height = 40
          Align = alClient
          Caption = '  Disponibilidade de Investimentos'
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
          TextOptions.VAlignment = vaVCenter
        end
      end
      object pnlDados: TPanel
        Left = 1
        Top = 46
        Width = 786
        Height = 61
        Align = alTop
        TabOrder = 2
        object Label1: TLabel
          Left = 15
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Data de Referência'
        end
        object Label2: TLabel
          Left = 184
          Top = 8
          Width = 166
          Height = 13
          Caption = 'Periodicidade de Atualização'
        end
        object Animate: TAnimate
          Left = 368
          Top = 4
          Width = 305
          Height = 53
          Active = False
          AutoSize = False
          Color = clBtnFace
          CommonAVI = aviCopyFiles
          ParentColor = False
          StopFrame = 34
          Visible = False
        end
        object edtDataRef: TCMDateTimePicker
          Left = 15
          Top = 24
          Width = 113
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
        end
        object edtIntervalo: TdxTimeEdit
          Left = 184
          Top = 24
          Width = 165
          Style.BorderStyle = xbs3D
          TabOrder = 1
          Alignment = taCenter
          StoredValues = 5
        end
        object bbtnIniciar: TBitBtn
          Left = 687
          Top = 4
          Width = 89
          Height = 53
          Anchors = [akTop, akRight, akBottom]
          Caption = '&Iniciar'
          Default = True
          TabOrder = 2
          OnClick = bbtnIniciarClick
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
        object lblAtualizando: TStaticText
          Left = 433
          Top = 40
          Width = 177
          Height = 17
          Caption = 'Aguarde, Atualizando Dados...'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
          Visible = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 539
      DockPos = 900
      inherited sep1: TToolbarSep97
        Left = 164
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 166
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bbtnImprimirClick
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 419
    Top = 3
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 478
    Top = 3
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EP.IDPESSOA'
      'FROM PESSOA PE, EMPRESAPROP EP '
      'WHERE (EP.IDPESSOA = PE.IDPESSOA)')
    ValidateWithMask = True
    Left = 533
    Top = 3
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.EMPRESAPROP.IDPESSOA'
    end
  end
end
