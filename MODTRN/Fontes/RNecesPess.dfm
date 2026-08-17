inherited relNecesPess: TrelNecesPess
  Left = 149
  Top = 128
  Caption = 'Relatório das Necessidades de Treinamento por Pessoa'
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl [0]
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxCandidatos: TCheckBox
              Enabled = False
            end
          end
          inherited gbxSituacao: TGroupBox
            inherited cbxDemitidos: TCheckBox
              Enabled = False
            end
          end
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
          Left = -12
          Top = -3
          Width = 653
          Height = 845
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
          Page.Orientation = poPortrait
          Page.PaperSize = Letter
          Page.Values = (
            100
            2794
            100
            2159
            100
            100
            0)
          PrinterSettings.Copies = 1
          PrinterSettings.Duplex = False
          PrinterSettings.FirstPage = 0
          PrinterSettings.LastPage = 0
          PrinterSettings.OutputBin = First
          PrintIfEmpty = True
          ReportTitle = 'Necessidades de Treinamento por Pessoa'
          SnapToGrid = True
          Units = MM
          Zoom = 80
          object PageFooterBand1: TQRBand
            Left = 30
            Top = 225
            Width = 593
            Height = 32
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
              1961.22395833333)
            BandType = rbPageFooter
            object QRSysData1: TQRSysData
              Left = 548
              Top = 17
              Width = 45
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1812.39583333333
                56.2239583333333
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
              Left = 271
              Top = 17
              Width = 50
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                896.276041666667
                56.2239583333333
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
              Top = 17
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
                56.2239583333333
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
          end
          object PageHeaderBand1: TQRBand
            Left = 30
            Top = 30
            Width = 593
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
              1961.22395833333)
            BandType = rbPageHeader
            object qrlblNomeCli: TQRLabel
              Left = 224
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
                740.833333333333
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
              Left = 254
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
                840.052083333334
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
            Width = 593
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
              56.2239583333333
              1961.22395833333)
            BandType = rbColumnHeader
            object QRLabel4: TQRLabel
              Left = 0
              Top = 4
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
                13.2291666666667
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
              Left = 50
              Top = 4
              Width = 26
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                165.364583333333
                13.2291666666667
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
            object QRLabel7: TQRLabel
              Left = 255
              Top = 4
              Width = 52
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                843.359375
                13.2291666666667
                171.979166666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Cargo Atual'
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
            object QRLabel1: TQRLabel
              Left = 413
              Top = 4
              Width = 63
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1365.91145833333
                13.2291666666667
                208.359375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'C. Custo Atual'
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
            Top = 108
            Width = 593
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = DetailBand1BeforePrint
            Color = clSilver
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              105.833333333333
              1961.22395833333)
            BandType = rbDetail
            object QRDBText1: TQRDBText
              Left = 2
              Top = 9
              Width = 40
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                6.61458333333333
                29.765625
                132.291666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clSilver
              DataSet = tblPessoal
              DataField = 'MATRICULA'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText2: TQRDBText
              Left = 50
              Top = 9
              Width = 200
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                165.364583333333
                29.765625
                661.458333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clSilver
              DataSet = tblPessoal
              DataField = 'NOME'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText3: TQRDBText
              Left = 255
              Top = 9
              Width = 150
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                843.359375
                29.765625
                496.09375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clSilver
              DataSet = tblCargo2
              DataField = 'TITULO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText8: TQRDBText
              Left = 413
              Top = 9
              Width = 160
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1365.91145833333
                29.765625
                529.166666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clSilver
              DataSet = tblPessoal
              DataField = 'CENTROCUSTO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrsubdt: TQRSubDetail
            Left = 30
            Top = 156
            Width = 593
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = qrsubdtBeforePrint
            Color = clWhite
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              69.453125
              1961.22395833333)
            Master = qr
            DataSet = tblCurca
            HeaderBand = qrbCabDetal
            PrintBefore = False
            PrintIfEmpty = False
            object QRDBText4: TQRDBText
              Left = 24
              Top = 2
              Width = 211
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                79.375
                6.61458333333333
                697.838541666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblCurso
              DataField = 'DESCRICAO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText5: TQRDBText
              Left = 240
              Top = 2
              Width = 31
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                793.75
                6.61458333333333
                102.526041666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblCurso
              DataField = 'DUR_TEOR'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText6: TQRDBText
              Left = 285
              Top = 2
              Width = 34
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                942.578125
                6.61458333333333
                112.447916666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblCurso
              DataField = 'DUR_PRAT'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText7: TQRDBText
              Left = 368
              Top = 2
              Width = 56
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1217.08333333333
                6.61458333333333
                185.208333333333)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblCurso
              DataField = 'VALOR'
              Mask = '0.00'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlObserv: TQRLabel
              Left = 455
              Top = 2
              Width = 44
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1504.81770833333
                6.61458333333333
                145.520833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlObserv'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlDurTot: TQRLabel
              Left = 330
              Top = 2
              Width = 25
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1091.40625
                6.61458333333333
                82.6822916666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlDurTot'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrbCabDetal: TQRBand
            Left = 30
            Top = 140
            Width = 593
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Frame.Width = 0
            AlignToBottom = False
            Color = clWhite
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              52.9166666666667
              1961.22395833333)
            BandType = rbGroupHeader
            object QRLabel8: TQRLabel
              Left = 243
              Top = 2
              Width = 29
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                803.671875
                6.61458333333333
                95.9114583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Teoria'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel9: TQRLabel
              Left = 30
              Top = 2
              Width = 28
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                99.21875
                6.61458333333333
                92.6041666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Curso'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel10: TQRLabel
              Left = 288
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
                952.5
                6.61458333333333
                99.21875)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Prática'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel11: TQRLabel
              Left = 333
              Top = 2
              Width = 22
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1101.328125
                6.61458333333333
                72.7604166666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel12: TQRLabel
              Left = 394
              Top = 2
              Width = 27
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1303.07291666667
                6.61458333333333
                89.296875)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Custo'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel3: TQRLabel
              Left = 455
              Top = 2
              Width = 53
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1504.81770833333
                6.61458333333333
                175.286458333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Observação'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
          end
          object qrbTotais: TQRBand
            Left = 30
            Top = 177
            Width = 593
            Height = 48
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
              158.75
              1961.22395833333)
            BandType = rbSummary
            object QRLabel5: TQRLabel
              Left = 3
              Top = 30
              Width = 77
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                9.921875
                99.21875
                254.661458333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total de Cursos:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRLabel16: TQRLabel
              Left = 3
              Top = 6
              Width = 85
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                9.921875
                19.84375
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
              Left = 94
              Top = 6
              Width = 45
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                310.885416666667
                19.84375
                148.828125)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlTotPes'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotCur: TQRLabel
              Left = 94
              Top = 30
              Width = 45
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                310.885416666667
                99.21875
                148.828125)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlTotPes'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTeor: TQRLabel
              Left = 237
              Top = 15
              Width = 34
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                783.828125
                49.609375
                112.447916666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTeor'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlPrat: TQRLabel
              Left = 285
              Top = 15
              Width = 34
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                942.578125
                49.609375
                112.447916666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlPrat'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotHor: TQRLabel
              Left = 330
              Top = 14
              Width = 25
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1091.40625
                46.3020833333333
                82.6822916666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTotHor'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotCus: TQRLabel
              Left = 369
              Top = 14
              Width = 55
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                1220.390625
                46.3020833333333
                181.901041666667)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTotCus'
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
  inherited tblPessoal: TwwQuery
    Filtered = True
  end
  object ds2: TwwDataSource
    DataSet = tblCurca
    Left = 242
    Top = 288
  end
  object tblCurca: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO;IDCURSO'
    MasterFields = 'IDCARGO'
    MasterSource = ds3
    TableName = 'CM.CURSOREQ'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 290
    Top = 288
  end
  object tblHsttrn: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;IDCURSO;NUMSEQ'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTTRN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 341
    Top = 288
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = ds2
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 387
    Top = 288
  end
  object ds4: TwwDataSource
    DataSet = tblCurso
    Left = 435
    Top = 291
  end
  object tblCargo2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 513
    Top = 285
  end
  object ds3: TwwDataSource
    DataSet = tblCargo2
    Left = 561
    Top = 288
  end
end
