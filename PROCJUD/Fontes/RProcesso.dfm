inherited relProcesso: TrelProcesso
  Left = 174
  Top = 152
  Caption = 'Relatório de Processos'
  ClientHeight = 353
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 314
  end
  inherited Dock971: TDock97
    Top = 314
  end
  object pnSelecao: TPanel [2]
    Left = 0
    Top = 0
    Width = 588
    Height = 314
    Align = alClient
    TabOrder = 2
    object pnResult: TPanel
      Left = 1
      Top = 1
      Width = 586
      Height = 312
      Align = alClient
      TabOrder = 0
      object qr: TQuickRep
        Left = 0
        Top = 6
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AfterPreview = qrAfterPreview
        BeforePrint = qrBeforePrint
        DataSet = frmSelRelProc2.qryProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100
          2100
          100
          2970
          100
          100
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = First
        PrintIfEmpty = False
        ReportTitle = 'Relação de Processos'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object PageFooterBand1: TQRBand
          Left = 38
          Top = 321
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333
            2770.1875)
          BandType = rbPageFooter
          object QRSysData1: TQRSysData
            Left = 991
            Top = 21
            Width = 56
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2622.02083333333
              55.5625
              148.166666666667)
            Alignment = taRightJustify
            AlignToBand = True
            AutoSize = True
            Color = clWhite
            Data = qrsDateTime
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 8
          end
          object QRSysData2: TQRSysData
            Left = -24
            Top = 21
            Width = 63
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1301.75
              55.5625
              166.6875)
            Alignment = taCenter
            AlignToBand = True
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'Pág. '
            Transparent = False
            FontSize = 8
          end
          object qrlblIdent: TQRLabel
            Left = 0
            Top = 21
            Width = 159
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              0
              55.5625
              420.6875)
            Alignment = taLeftJustify
            AlignToBand = True
            AutoSize = True
            AutoStretch = False
            Caption = 'Sistema-Versão-Nome do Objeto'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
        end
        object PageHeaderBand1: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 56
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            148.166666666667
            2770.1875)
          BandType = rbPageHeader
          object qrlblNomeCli: TQRLabel
            Left = 433
            Top = 6
            Width = 181
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.8541666666667
              1145.64583333333
              15.875
              478.895833333333)
            Alignment = taCenter
            AlignToBand = True
            AutoSize = True
            AutoStretch = False
            Caption = 'NOME DO CLIENTE'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 14
          end
          object QRSysData3: TQRSysData
            Left = 476
            Top = 33
            Width = 94
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              1259.41666666667
              87.3125
              248.708333333333)
            Alignment = taCenter
            AlignToBand = True
            AutoSize = True
            Color = clWhite
            Data = qrsReportTitle
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            FontSize = 12
          end
        end
        object ColumnHeaderBand1: TQRBand
          Left = 38
          Top = 94
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            105.833333333333
            2770.1875)
          BandType = rbColumnHeader
          object QRLabel4: TQRLabel
            Left = 11
            Top = 24
            Width = 45
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              29.1041666666667
              63.5
              119.0625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Número'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlReqLitis: TQRLabel
            Left = 95
            Top = 24
            Width = 71
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              251.354166666667
              63.5
              187.854166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Contra-Parte'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel5: TQRLabel
            Left = 616
            Top = 24
            Width = 55
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1629.83333333333
              63.5
              145.520833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data Notif.'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlVal1: TQRLabel
            Left = 726
            Top = 12
            Width = 31
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1920.875
              31.75
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Risco'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel7: TQRLabel
            Left = 680
            Top = 24
            Width = 18
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1799.16666666667
              63.5
              47.625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Sit.'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlVal3: TQRLabel
            Left = 795
            Top = 12
            Width = 31
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2103.4375
              31.75
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Risco'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlTitReal: TQRLabel
            Left = 850
            Top = 24
            Width = 56
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2248.95833333333
              63.5
              148.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Valor Real'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlTitEcon2: TQRLabel
            Left = 984
            Top = 12
            Width = 54
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2603.5
              31.75
              142.875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Economia'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlTitEcon1: TQRLabel
            Left = 924
            Top = 12
            Width = 54
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2444.75
              31.75
              142.875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Economia'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlSig4: TQRLabel
            Left = 924
            Top = 24
            Width = 54
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2444.75
              63.5
              142.875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 's/Máximo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlSig5: TQRLabel
            Left = 983
            Top = 24
            Width = 58
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2600.85416666667
              63.5
              153.458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 's/Provável'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel10: TQRLabel
            Left = 508
            Top = 24
            Width = 81
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1344.08333333333
              63.5
              214.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Somos a Parte'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlVal4: TQRLabel
            Left = 788
            Top = 24
            Width = 48
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2084.91666666667
              63.5
              127)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Provável'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlVal2: TQRLabel
            Left = 721
            Top = 24
            Width = 44
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1907.64583333333
              63.5
              116.416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Máximo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel16: TQRLabel
            Left = 68
            Top = 24
            Width = 14
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              179.916666666667
              63.5
              37.0416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'UF'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlNumVara: TQRLabel
            Left = 963
            Top = 24
            Width = 40
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2547.9375
              63.5
              105.833333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nº Vara'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object qrlVaraJust: TQRLabel
            Left = 705
            Top = 24
            Width = 85
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1865.3125
              63.5
              224.895833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Vara de Justiça'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
        end
        object DetailBand1: TQRBand
          Left = 38
          Top = 134
          Width = 1047
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AfterPrint = DetailBand1AfterPrint
          AlignToBottom = False
          BeforePrint = DetailBand1BeforePrint
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            52.9166666666667
            2770.1875)
          BandType = rbDetail
          object qrdbNumJCJ: TQRDBText
            Left = 0
            Top = 2
            Width = 58
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              0
              5.29166666666667
              153.458333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = frmSelRelProc2.qryProcesso
            DataField = 'PROCJCJNUM'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText2: TQRDBText
            Left = 95
            Top = 2
            Width = 395
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              251.354166666667
              5.29166666666667
              1045.10416666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = frmSelRelProc2.qryProcesso
            DataField = 'NOME'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText3: TQRDBText
            Left = 616
            Top = 2
            Width = 53
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1629.83333333333
              5.29166666666667
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = frmSelRelProc2.qryProcesso
            DataField = 'DATANOTIF'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlSit: TQRLabel
            Left = 680
            Top = 2
            Width = 15
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1799.16666666667
              5.29166666666667
              39.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Sit.'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlCustoAtual: TQRLabel
            Left = 776
            Top = 2
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2053.16666666667
              5.29166666666667
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlCustoAtual'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlCustoMax: TQRLabel
            Left = 706
            Top = 2
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1867.95833333333
              5.29166666666667
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlCustoMax'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlValorReal: TQRLabel
            Left = 846
            Top = 2
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2238.375
              5.29166666666667
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlValorReal'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlEconomia2: TQRLabel
            Left = 982
            Top = 2
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2598.20833333333
              5.29166666666667
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEconomia2'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlEconomia1: TQRLabel
            Left = 916
            Top = 2
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2423.58333333333
              5.29166666666667
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEconomia1'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrdbUF: TQRDBText
            Left = 67
            Top = 2
            Width = 15
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              177.270833333333
              5.29166666666667
              39.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryUnidade
            DataField = 'NOME'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrlAtiva: TQRLabel
            Left = 524
            Top = 2
            Width = 23
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1386.41666666667
              5.29166666666667
              60.8541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ativa'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrdbVaraJust: TQRDBText
            Left = 704
            Top = 2
            Width = 53
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1862.66666666667
              5.29166666666667
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = frmSelRelProc2.qryProcesso
            DataField = 'NOMEVARA'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object qrdbNumJust: TQRDBText
            Left = 964
            Top = 2
            Width = 86
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2550.58333333333
              5.29166666666667
              227.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = frmSelRelProc2.qryProcesso
            DataField = 'NUMVARAJUSTICA'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
        end
        object QRBand1: TQRBand
          Left = 38
          Top = 282
          Width = 1047
          Height = 39
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = QRBand1BeforePrint
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            103.1875
            2770.1875)
          BandType = rbSummary
          object QRLabel8: TQRLabel
            Left = 114
            Top = 12
            Width = 90
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              301.625
              31.75
              238.125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Total de Processos:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlCustoTotal: TQRLabel
            Left = 576
            Top = 12
            Width = 56
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1524
              31.75
              148.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Custo Total:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotProc: TQRLabel
            Left = 246
            Top = 12
            Width = 43
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              650.875
              31.75
              113.770833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrlTotProc'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotCus: TQRLabel
            Left = 706
            Top = 12
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1867.95833333333
              31.75
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlTotCus'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotAtual: TQRLabel
            Left = 776
            Top = 12
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2053.16666666667
              31.75
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlTotCus'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotReal: TQRLabel
            Left = 846
            Top = 12
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2238.375
              31.75
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlTotReal'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotEcon2: TQRLabel
            Left = 982
            Top = 12
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2598.20833333333
              31.75
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlTotEcon2'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlTotEcon1: TQRLabel
            Left = 916
            Top = 12
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              2423.58333333333
              31.75
              166.6875)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlTotEcon1'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object QRChildBand1: TQRChildBand
          Left = 38
          Top = 361
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333
            2770.1875)
        end
        object qrsbLitis: TQRSubDetail
          Left = 38
          Top = 172
          Width = 1047
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            44.9791666666667
            2770.1875)
          Master = qr
          DataSet = qryLitis
          HeaderBand = qrCabLitis
          PrintBefore = False
          PrintIfEmpty = True
          object QRDBText9: TQRDBText
            Left = 95
            Top = 2
            Width = 215
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              251.354166666667
              5.29166666666667
              568.854166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryLitis
            DataField = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrdbSitLitis: TQRDBText
            Left = 315
            Top = 2
            Width = 250
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              833.4375
              6.61458333333333
              661.458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryLitis
            DataField = 'SITUACAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrsdEtapa: TQRSubDetail
          Left = 38
          Top = 207
          Width = 1047
          Height = 18
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = qrsdEtapaBeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            47.625
            2770.1875)
          Master = qr
          DataSet = qryEtapa
          HeaderBand = qrCabEtapa
          PrintBefore = False
          PrintIfEmpty = False
          object QRDBText5: TQRDBText
            Left = 315
            Top = 2
            Width = 61
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              833.4375
              5.29166666666667
              161.395833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryEtapa
            DataField = 'DATAREALOCOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRDBText6: TQRDBText
            Left = 95
            Top = 2
            Width = 215
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              251.354166666667
              5.29166666666667
              568.854166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryEtapa
            DataField = 'ETAPA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRDBText7: TQRDBText
            Left = 448
            Top = 2
            Width = 163
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1185.33333333333
              5.29166666666667
              431.270833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryEtapa
            DataField = 'ASSUNTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrchObserv: TQRChildBand
          Left = 38
          Top = 225
          Width = 1047
          Height = 21
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            55.5625
            2770.1875)
          ParentBand = qrsdEtapa
          object QRDBText8: TQRDBText
            Left = 95
            Top = 2
            Width = 515
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              251.354166666667
              5.29166666666667
              1362.60416666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryEtapa
            DataField = 'OBSERVETAPA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrsdObjeto: TQRSubDetail
          Left = 38
          Top = 264
          Width = 1047
          Height = 18
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = qrsdObjetoBeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            47.625
            2770.1875)
          Master = qr
          DataSet = qryObjeto
          HeaderBand = qrCabObjeto
          PrintBefore = False
          PrintIfEmpty = False
          object QRDBText12: TQRDBText
            Left = 95
            Top = 2
            Width = 514
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              251.354166666667
              5.29166666666667
              1359.95833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = qryObjeto
            DataField = 'OBJETO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlCustoMaxObj: TQRLabel
            Left = 706
            Top = 2
            Width = 62
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              1868.61979166667
              6.61458333333333
              165.364583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlCustoMax'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlCustoAtualObj: TQRLabel
            Left = 776
            Top = 2
            Width = 62
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              2053.828125
              6.61458333333333
              165.364583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlCustoAtual'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlValorRealObj: TQRLabel
            Left = 846
            Top = 2
            Width = 62
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              2239.03645833333
              6.61458333333333
              165.364583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlValorReal'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlEconomia1Obj: TQRLabel
            Left = 916
            Top = 2
            Width = 62
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              2424.24479166667
              6.61458333333333
              165.364583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEconomia1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlEconomia2Obj: TQRLabel
            Left = 982
            Top = 2
            Width = 62
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              46.3020833333333
              2599.53125
              6.61458333333333
              165.364583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEconomia2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrCabLitis: TQRBand
          Left = 38
          Top = 154
          Width = 1047
          Height = 18
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            47.625
            2770.1875)
          BandType = rbGroupHeader
          object QRLabel1: TQRLabel
            Left = 95
            Top = 5
            Width = 105
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              251.354166666667
              13.2291666666667
              277.8125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nome do Litisconsorte'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object qrlSitLitis: TQRLabel
            Left = 316
            Top = 5
            Width = 118
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              836.083333333333
              13.2291666666667
              312.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Situação do Litisconsorte'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrCabEtapa: TQRBand
          Left = 38
          Top = 189
          Width = 1047
          Height = 18
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            47.625
            2770.1875)
          BandType = rbGroupHeader
          object QRLabel3: TQRLabel
            Left = 95
            Top = 5
            Width = 134
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              251.354166666667
              13.2291666666667
              354.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Tipo de Etapa ou Andamento'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRLabel6: TQRLabel
            Left = 315
            Top = 5
            Width = 21
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              833.4375
              13.2291666666667
              55.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRLabel9: TQRLabel
            Left = 448
            Top = 5
            Width = 88
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1185.33333333333
              13.2291666666667
              232.833333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Assunto Resumido'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object qrCabObjeto: TQRBand
          Left = 38
          Top = 246
          Width = 1047
          Height = 18
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            47.625
            2770.1875)
          BandType = rbGroupHeader
          object QRLabel11: TQRLabel
            Left = 95
            Top = 5
            Width = 69
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              251.354166666667
              13.2291666666667
              182.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Tipo de Objeto'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
      end
    end
  end
  object ds2: TwwDataSource
    DataSet = frmSelRelProc2.qryProcesso
    Left = 149
    Top = 75
  end
  object qryEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmSelRelProc2.ds
    SQL.Strings = (
      'SELECT E.NUMSEQ,'
      '  T.DESCRICAO AS ETAPA,'
      '  T.VALORHONOR,'
      '  E.DATAREALOCOR,'
      '  E.ASSUNTO,'
      '  E.NUMPROCTRAB,'
      '  E.CODTIPORECURSO,'
      '  E.VALORREC,'
      '  E.OBSERVETAPA,'
      '  E.IDIMAGEM'
      'FROM ETAPAPROCTRAB E, TIPORECTRAB T'
      'WHERE E.NUMPROCTRAB = :NUMPROCTRAB'
      'AND       T.CODTIPORECURSO = E.CODTIPORECURSO'
      'ORDER  BY  E.DATAREALOCOR')
    ValidateWithMask = True
    Left = 475
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
    object qryEtapaNUMSEQ: TFloatField
      DisplayLabel = 'Num.Seq.'
      DisplayWidth = 8
      FieldName = 'NUMSEQ'
      Origin = 'ETAPAPROCTRAB.NUMSEQ'
    end
    object qryEtapaETAPA: TStringField
      DisplayLabel = 'Tipo de Etapa'
      DisplayWidth = 37
      FieldName = 'ETAPA'
      Origin = 'TIPORECTRAB.DESCRICAO'
      Size = 40
    end
    object qryEtapaDATAREALOCOR: TDateTimeField
      DisplayLabel = 'Data e Hora'
      DisplayWidth = 17
      FieldName = 'DATAREALOCOR'
      Origin = 'ETAPAPROCTRAB.DATAREALOCOR'
    end
    object qryEtapaASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 40
      FieldName = 'ASSUNTO'
      Origin = 'ETAPAPROCTRAB.ASSUNTO'
      Size = 40
    end
    object qryEtapaVALORHONOR: TFloatField
      FieldName = 'VALORHONOR'
      Origin = 'TIPORECTRAB.VALORHONOR'
      Visible = False
    end
    object qryEtapaNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Origin = 'ETAPAPROCTRAB.NUMPROCTRAB'
      Visible = False
    end
    object qryEtapaCODTIPORECURSO: TFloatField
      FieldName = 'CODTIPORECURSO'
      Origin = 'ETAPAPROCTRAB.CODTIPORECURSO'
      Visible = False
    end
    object qryEtapaVALORREC: TFloatField
      FieldName = 'VALORREC'
      Origin = 'ETAPAPROCTRAB.VALORREC'
      Visible = False
    end
    object qryEtapaOBSERVETAPA: TMemoField
      FieldName = 'OBSERVETAPA'
      Origin = 'ETAPAPROCTRAB.OBSERVETAPA'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
    object qryEtapaIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'ETAPAPROCTRAB.IDIMAGEM'
      Visible = False
    end
  end
  object qryUnidade: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds2
    SQL.Strings = (
      'Select rtrim(CODESTADO) || '#39' '#39' || NOMEESTADO as NOME '
      'from ESTADO '
      'where (IDESTADO = :IdEstado) ')
    ValidateWithMask = True
    Left = 98
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEstado'
        ParamType = ptUnknown
      end>
  end
  object qryLitis: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmSelRelProc2.ds
    SQL.Strings = (
      'SELECT DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS NOME, '
      'DECODE(C.IDMOTIVO,NULL,'#39'Normal'#39', M.DESCRICAO) AS SITUACAO,'
      'C.IDPESSOA, C.NUMPROCTRAB, C.IDMOTIVO '
      'FROM PESSOA P, COPARTPROCTRAB C, MOTIVO M'
      'WHERE C.NUMPROCTRAB = :NumProcTrab'
      'AND       C.IDPESSOA           = P.IDPESSOA'
      'AND       C.IDMOTIVO           = M.IDMOTIVO(+)')
    ValidateWithMask = True
    Left = 319
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object qryObjeto: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmSelRelProc2.ds
    SQL.Strings = (
      'SELECT O.NUMPROCTRAB,'
      '       O.CODTIPOOBJETO,'
      '       O.VALORRECL,'
      '       O.PERCPROB,'
      '       O.VALORSENTENCA,'
      '       O.INDVALOR,'
      '       O.DATAINICIO,'
      '       O.DATAFINAL,'
      '       T.DESCRICAO AS OBJETO'
      'FROM OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE O.NUMPROCTRAB = :NUMPROCTRAB'
      'AND   O.CODTIPOOBJETO = T.CODTIPOOBJETO'
      'ORDER  BY  UPPER(T.DESCRICAO)')
    ValidateWithMask = True
    Left = 203
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object QRTextFilter: TQRTextFilter
    Left = 236
    Top = 126
  end
end
