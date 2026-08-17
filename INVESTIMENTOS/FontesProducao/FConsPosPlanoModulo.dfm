inherited frmConsPosPlanoModulo: TfrmConsPosPlanoModulo
  Left = 25
  Top = 95
  Caption = 'frmConsPosPlanoModulo'
  ClientHeight = 456
  ClientWidth = 766
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 417
    inherited bvlSepTit: TBevel
      Width = 764
    end
    object PageControl1: TPageControl [1]
      Left = 1
      Top = 97
      Width = 764
      Height = 319
      ActivePage = tbsDados
      Align = alClient
      TabOrder = 2
      object tbsDados: TTabSheet
        Caption = 'Dados'
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 756
          Height = 291
          Selected.Strings = (
            'PLANPRVCONTABPATRO'#9'60'#9'Plano'
            'DESCTIPOINVEST'#9'60'#9'Carteira'
            'DESCINVESTIMENTO'#9'60'#9'Investimento'
            'SLDINV'#9'18'#9'Saldo do Investimento'
            'SLDPLANO'#9'22'#9'Saldo do Plano'
            'PERCPLANO'#9'17'#9'Percentual s/ o Plano'
            'SLDTPINVEST'#9'19'#9'Saldo da Carteira'
            'PERCTPINV'#9'19'#9'Percentual s/ a Carteira')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DmRelPosPlanoModulo.dsPosicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = wwDBGrid1CalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = wwDBGrid1TopRowChanged
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Gráficos'
        ImageIndex = 1
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 756
          Height = 291
          ActivePage = tbsPercPlano
          Align = alClient
          Style = tsFlatButtons
          TabOrder = 0
          object tbsPercPlano: TTabSheet
            Caption = 'Percentuais por Planos'
            object DBChart1: TDBChart
              Left = 0
              Top = 0
              Width = 748
              Height = 260
              AllowPanning = pmNone
              AllowZoom = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Pen.Visible = False
              Gradient.EndColor = 8454143
              MarginBottom = 0
              MarginLeft = 0
              MarginRight = 0
              MarginTop = 0
              Title.Text.Strings = (
                '')
              Title.Visible = False
              AxisVisible = False
              ClipPoints = False
              Frame.Visible = False
              Legend.Alignment = laBottom
              Legend.TextStyle = ltsRightValue
              TopAxis.Visible = False
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DWalls = False
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 0
              object Series1: TPieSeries
                Marks.ArrowLength = 20
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                DataSource = DmRelPosPlanoModulo.qryPercPlano
                SeriesColor = clRed
                ValueFormat = 'R$ #,##0.###'
                XLabelsSource = 'PLANPRVCONTABPATRO'
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loNone
                PieValues.ValueSource = 'SALDO'
              end
            end
          end
          object tbsPercCart: TTabSheet
            Caption = 'Percentuais por Carteira'
            ImageIndex = 1
            object DBChart2: TDBChart
              Left = 0
              Top = 0
              Width = 748
              Height = 260
              AllowPanning = pmNone
              AllowZoom = False
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Pen.Visible = False
              Gradient.EndColor = 8454143
              MarginBottom = 0
              MarginLeft = 0
              MarginRight = 0
              MarginTop = 0
              Title.Text.Strings = (
                '')
              Title.Visible = False
              AxisVisible = False
              ClipPoints = False
              Frame.Visible = False
              Legend.Alignment = laBottom
              Legend.TextStyle = ltsRightValue
              TopAxis.Visible = False
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DWalls = False
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 0
              object PieSeries1: TPieSeries
                Marks.ArrowLength = 20
                Marks.Style = smsLabelPercent
                Marks.Visible = True
                DataSource = DmRelPosPlanoModulo.qryPercCarteira
                SeriesColor = clRed
                ValueFormat = 'R$ #,##0.###'
                XLabelsSource = 'DESCTIPOINVEST'
                OtherSlice.Text = 'Other'
                PieValues.DateTime = False
                PieValues.Name = 'Pie'
                PieValues.Multiplier = 1
                PieValues.Order = loNone
                PieValues.ValueSource = 'SALDO'
              end
            end
          end
        end
      end
    end
    inherited pnlTitulo: TPanel
      Width = 764
      inherited lbNomDescricao: TfcLabel
        Width = 287
        Caption = 'Posição por Plano e Carteira'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 764
      Height = 52
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 19
        Top = 7
        Width = 93
        Height = 13
        Caption = 'Data Movimento'
      end
      object edData: TCMDateTimePicker
        Left = 18
        Top = 22
        Width = 127
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
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 766
    inherited tb97Fundo: TToolbar97
      Left = 539
      DockPos = 539
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 286
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 635
    Top = 11
  end
end
