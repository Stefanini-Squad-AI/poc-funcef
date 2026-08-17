inherited relTreinMapa: TrelTreinMapa
  Left = 151
  Top = 136
  Caption = 'Relatório Mapa de Treinamento por Treinando'
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxLotacao: TGroupBox [2]
          end
          inherited rgSelSindi: TRadioGroup [3]
          end
          inherited gbxEstab: TGroupBox [4]
          end
          inherited gbxCargo: TGroupBox [5]
          end
          inherited rgSelRamo: TRadioGroup [6]
          end
          inherited gbxSindi: TGroupBox [7]
          end
        end
      end
      inherited pnResult: TPanel [1]
        object qr: TQuickRep
          Left = 0
          Top = 0
          Width = 898
          Height = 635
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          BeforePrint = qrBeforePrint
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
          OnNeedData = qrNeedData
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
          PrintIfEmpty = True
          ReportTitle = 'Mapa de Treinamento por Treinando'
          SnapToGrid = True
          Units = MM
          Zoom = 80
          object PageHeaderBand1: TQRBand
            Left = 30
            Top = 30
            Width = 838
            Height = 61
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
              201.744791666667
              2771.51041666667)
            BandType = rbPageHeader
            object qrlblNomeCli: TQRLabel
              Left = 346
              Top = 7
              Width = 145
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                62.8385416666667
                1144.32291666667
                23.1510416666667
                479.557291666667)
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
            object qrlblTitRel: TQRSysData
              Left = 377
              Top = 29
              Width = 84
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                62.8385416666667
                1246.84895833333
                95.9114583333333
                277.8125)
              Alignment = taCenter
              AlignToBand = True
              AutoSize = True
              Color = clWhite
              Data = qrsReportTitle
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = False
              FontSize = 14
            end
          end
          object ColumnHeaderBand1: TQRBand
            Left = 30
            Top = 91
            Width = 838
            Height = 30
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ForceNewColumn = False
            ForceNewPage = False
            ParentFont = False
            Size.Values = (
              99.21875
              2771.51041666667)
            BandType = rbColumnHeader
            object QRLabel4: TQRLabel
              Left = 0
              Top = 16
              Width = 41
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                0
                52.9166666666667
                135.598958333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Matrícula'
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
            object QRLabel6: TQRLabel
              Left = 55
              Top = 16
              Width = 26
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                181.901041666667
                52.9166666666667
                85.9895833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Nome'
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
            object QRLabel3: TQRLabel
              Left = 126
              Top = 2
              Width = 40
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                416.71875
                6.61458333333333
                132.291666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Período: '
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
            object qrlabDatIni: TQRLabel
              Left = 183
              Top = 2
              Width = 25
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                605.234375
                6.61458333333333
                82.6822916666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'DatIni'
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
              Left = 242
              Top = 2
              Width = 6
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                800.364583333333
                6.61458333333333
                19.84375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'a'
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
            object qrlabDatFim: TQRLabel
              Left = 266
              Top = 2
              Width = 30
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                879.739583333333
                6.61458333333333
                99.21875)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'DatFim'
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
            object qrlCurso1: TQRLabel
              Left = 244
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                806.979166666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso1'
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
            object qrlCurso2: TQRLabel
              Left = 304
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1005.41666666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso2'
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
            object qrlCurso3: TQRLabel
              Left = 364
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1203.85416666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso3'
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
            object qrlCurso4: TQRLabel
              Left = 424
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1402.29166666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso4'
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
            object qrlCurso5: TQRLabel
              Left = 484
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1600.72916666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso5'
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
            object qrlCurso6: TQRLabel
              Left = 544
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1799.16666666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso6'
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
            object qrlCurso7: TQRLabel
              Left = 604
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1997.60416666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso7'
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
            object qrlCurso8: TQRLabel
              Left = 664
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2196.04166666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso8'
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
            object qrlCurso9: TQRLabel
              Left = 724
              Top = 16
              Width = 33
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2394.47916666667
                52.9166666666667
                109.140625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso9'
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
            object qrlCurso10: TQRLabel
              Left = 784
              Top = 16
              Width = 38
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2592.91666666667
                52.9166666666667
                125.677083333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso10'
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
            Left = 30
            Top = 121
            Width = 838
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = DetailBand1BeforePrint
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ForceNewColumn = False
            ForceNewPage = False
            ParentFont = False
            Size.Values = (
              66.1458333333333
              2771.51041666667)
            BandType = rbDetail
            object QRDBText1: TQRDBText
              Left = 2
              Top = 4
              Width = 47
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                6.61458333333333
                13.2291666666667
                155.442708333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblPessoal
              DataField = 'MATRICULA'
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRDBText2: TQRDBText
              Left = 55
              Top = 4
              Width = 176
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                181.901041666667
                13.2291666666667
                582.083333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblPessoal
              DataField = 'NOME'
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult1: TQRLabel
              Left = 244
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                806.979166666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso1'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult2: TQRLabel
              Left = 304
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1005.41666666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso2'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult3: TQRLabel
              Left = 364
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1203.85416666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso3'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult4: TQRLabel
              Left = 424
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1402.29166666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso4'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult5: TQRLabel
              Left = 484
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1600.72916666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso5'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult6: TQRLabel
              Left = 544
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1799.16666666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso6'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult7: TQRLabel
              Left = 604
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1997.60416666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso7'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult8: TQRLabel
              Left = 664
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2196.04166666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso8'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult9: TQRLabel
              Left = 724
              Top = 4
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2394.47916666667
                13.2291666666667
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso9'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlResult10: TQRLabel
              Left = 784
              Top = 4
              Width = 34
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2592.91666666667
                13.2291666666667
                112.447916666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso10'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
          end
          object PageFooterBand1: TQRBand
            Left = 30
            Top = 183
            Width = 838
            Height = 58
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
              191.822916666667
              2771.51041666667)
            BandType = rbPageFooter
            object QRSysData1: TQRSysData
              Left = 793
              Top = 42
              Width = 45
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                2622.68229166667
                138.90625
                148.828125)
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
              Left = 394
              Top = 42
              Width = 50
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1303.07291666667
                138.90625
                165.364583333333)
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
              Top = 42
              Width = 127
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                0
                138.90625
                420.026041666667)
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
            object QRLabel1: TQRLabel
              Left = 0
              Top = 5
              Width = 793
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                0
                16.5364583333333
                2622.68229166667)
              Alignment = taLeftJustify
              AlignToBand = True
              AutoSize = False
              AutoStretch = False
              Caption = 
                'Legenda: R = Realizado Programado   N = Realizado Não Programado' +
                '   P = Programado (com ou sem data de témino agendada)   Em Bran' +
                'co = Não Realizado e Não Programado'
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
          object qrbTotais: TQRBand
            Left = 30
            Top = 141
            Width = 838
            Height = 42
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Frame.Width = 0
            AlignToBottom = False
            BeforePrint = qrbTotaisBeforePrint
            Color = clWhite
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              138.90625
              2771.51041666667)
            BandType = rbSummary
            object QRLabel18: TQRLabel
              Left = 10
              Top = 24
              Width = 85
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                33.0729166666667
                79.375
                281.119791666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total de Pessoas:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotPes: TQRLabel
              Left = 97
              Top = 24
              Width = 18
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                320.807291666667
                79.375
                59.53125)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTotPes'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
  end
  inherited tblSindic: TwwQuery
    Left = 339
    Top = 270
  end
  inherited tblProfis: TwwQuery
    Top = 270
  end
  inherited qryGrauInstr: TwwQuery
    Top = 49
  end
  object ds2: TwwDataSource
    DataSet = tblHsttrn
    Left = 242
    Top = 288
  end
  object tblHsttrn: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTTRN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 287
    Top = 288
    object tblHsttrnTOT_CUSTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOT_CUSTO'
      DisplayFormat = '0.00'
      Currency = False
      Calculated = True
    end
    object tblHsttrnIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tblHsttrnIDCURSO: TFloatField
      FieldName = 'IDCURSO'
      Required = True
    end
    object tblHsttrnDATREINI: TDateTimeField
      FieldName = 'DATREINI'
      Required = True
    end
    object tblHsttrnDATREFIM: TDateTimeField
      FieldName = 'DATREFIM'
    end
    object tblHsttrnDATPLINI: TDateTimeField
      FieldName = 'DATPLINI'
    end
    object tblHsttrnDATPLFIM: TDateTimeField
      FieldName = 'DATPLFIM'
    end
    object tblHsttrnDUR_TEOR: TFloatField
      FieldName = 'DUR_TEOR'
    end
    object tblHsttrnDUR_PRAT: TFloatField
      FieldName = 'DUR_PRAT'
    end
    object tblHsttrnDUR_TOT: TFloatField
      FieldName = 'DUR_TOT'
    end
    object tblHsttrnFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Required = True
    end
    object tblHsttrnFLGAVALCURS: TFloatField
      FieldName = 'FLGAVALCURS'
      Required = True
    end
    object tblHsttrnAVALCURSO: TFloatField
      FieldName = 'AVALCURSO'
    end
    object tblHsttrnFLGAVALTEOR: TFloatField
      FieldName = 'FLGAVALTEOR'
      Required = True
    end
    object tblHsttrnAVALTEOR: TFloatField
      FieldName = 'AVALTEOR'
    end
    object tblHsttrnFLGAVALPRAT: TFloatField
      FieldName = 'FLGAVALPRAT'
      Required = True
    end
    object tblHsttrnAVALPRAT: TFloatField
      FieldName = 'AVALPRAT'
    end
    object tblHsttrnDESP_VIAG: TFloatField
      FieldName = 'DESP_VIAG'
    end
    object tblHsttrnDESP_ESTAD: TFloatField
      FieldName = 'DESP_ESTAD'
    end
    object tblHsttrnDESP_OUTR: TFloatField
      FieldName = 'DESP_OUTR'
    end
    object tblHsttrnIDENTIDINSTR: TFloatField
      FieldName = 'IDENTIDINSTR'
    end
    object tblHsttrnNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object dsTrn: TwwDataSource
    DataSet = tblHsttrn
    Left = 424
    Top = 49
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 533
    Top = 221
  end
  object qryPacote: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 357
    Top = 213
  end
end
