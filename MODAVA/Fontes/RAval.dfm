inherited relAval: TrelAval
  Left = 11
  Top = 110
  Caption = 'Relatório de Avaliações'
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
          Width = 794
          Height = 1123
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AfterPreview = qrAfterPreview
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
          Page.PaperSize = A4
          Page.Values = (
            100
            2970
            100
            2100
            100
            100
            0)
          PrinterSettings.Copies = 1
          PrinterSettings.Duplex = False
          PrinterSettings.FirstPage = 0
          PrinterSettings.LastPage = 0
          PrinterSettings.OutputBin = First
          PrintIfEmpty = True
          SnapToGrid = True
          Units = MM
          Zoom = 100
          object PageFooterBand1: TQRBand
            Left = 38
            Top = 307
            Width = 718
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
              1899.70833333333)
            BandType = rbPageFooter
            object QRSysData1: TQRSysData
              Left = 662
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
                1751.54166666667
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
                865.1875
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
            Width = 718
            Height = 77
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
              203.729166666667
              1899.70833333333)
            BandType = rbPageHeader
            object qrlblNomeCli: TQRLabel
              Left = 268
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
                709.083333333333
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
            object QRLabel5: TQRLabel
              Left = 453
              Top = 57
              Width = 117
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1198.5625
                150.8125
                309.5625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Pontuação Máxima:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlMax: TQRLabel
              Left = 579
              Top = 57
              Width = 40
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1531.9375
                150.8125
                105.833333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlMax'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTitulo: TQRLabel
              Left = 300
              Top = 36
              Width = 117
              Height = 23
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                60.8541666666667
                793.75
                95.25
                309.5625)
              Alignment = taCenter
              AlignToBand = True
              AutoSize = True
              AutoStretch = False
              Caption = 'Relatório de '
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
            object QRLabel6: TQRLabel
              Left = 18
              Top = 57
              Width = 49
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                47.625
                150.8125
                129.645833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Período:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlDataIni: TQRLabel
              Left = 78
              Top = 57
              Width = 55
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                206.375
                150.8125
                145.520833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlDataIni'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlDataFim: TQRLabel
              Left = 171
              Top = 57
              Width = 64
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                452.4375
                150.8125
                169.333333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlDataFim'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrla: TQRLabel
              Left = 150
              Top = 57
              Width = 8
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                396.875
                150.8125
                21.1666666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'a'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrCabecalho: TQRBand
            Left = 38
            Top = 115
            Width = 718
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
              1899.70833333333)
            BandType = rbColumnHeader
            object QRLabel4: TQRLabel
              Left = 18
              Top = 12
              Width = 33
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                47.625
                31.75
                87.3125)
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
              Left = 339
              Top = 12
              Width = 34
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                896.9375
                31.75
                89.9583333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Cargo'
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
          object qrMestre: TQRBand
            Left = 38
            Top = 155
            Width = 718
            Height = 40
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = qrMestreBeforePrint
            Color = clSilver
            ForceNewColumn = False
            ForceNewPage = False
            Size.Values = (
              105.833333333333
              1899.70833333333)
            BandType = rbDetail
            object QRDBText1: TQRDBText
              Left = 18
              Top = 12
              Width = 40
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                47.625
                31.75
                105.833333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Color = clSilver
              DataSet = tblPessoal
              DataField = 'NOME'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText5: TQRDBText
              Left = 339
              Top = 12
              Width = 44
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                896.9375
                31.75
                116.416666666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Color = clSilver
              DataSet = tblCargo2
              DataField = 'TITULO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrsubdt: TQRSubDetail
            Left = 38
            Top = 215
            Width = 718
            Height = 40
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
              105.833333333333
              1899.70833333333)
            Master = qr
            DataSet = tblHstaval
            HeaderBand = qrbCabDet
            PrintBefore = False
            PrintIfEmpty = False
            object QRDBText2: TQRDBText
              Left = 75
              Top = 9
              Width = 69
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                198.4375
                23.8125
                182.5625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Color = clWhite
              DataSet = tblHstaval
              DataField = 'DATAREAL'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText3: TQRDBText
              Left = 417
              Top = 9
              Width = 75
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1103.3125
                23.8125
                198.4375)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblHstaval
              DataField = 'AVALIACAO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRDBText4: TQRDBText
              Left = 171
              Top = 9
              Width = 75
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                452.4375
                23.8125
                198.4375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Color = clWhite
              DataSet = tblHstaval
              DataField = 'AVALIADOR'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlPerc: TQRLabel
              Left = 525
              Top = 9
              Width = 42
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1389.0625
                23.8125
                111.125)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlPerc'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrbCabDet: TQRBand
            Left = 38
            Top = 195
            Width = 718
            Height = 20
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
            Font.Style = [fsBold]
            ForceNewColumn = False
            ForceNewPage = False
            ParentFont = False
            Size.Values = (
              52.9166666666667
              1899.70833333333)
            BandType = rbGroupHeader
            object QRLabel8: TQRLabel
              Left = 94
              Top = 2
              Width = 24
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                248.708333333333
                5.29166666666667
                63.5)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Data'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel10: TQRLabel
              Left = 171
              Top = 2
              Width = 52
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                452.4375
                5.29166666666667
                137.583333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Avaliador'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel12: TQRLabel
              Left = 441
              Top = 2
              Width = 52
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1166.8125
                5.29166666666667
                137.583333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Avaliação'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel13: TQRLabel
              Left = 509
              Top = 2
              Width = 73
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1346.72916666667
                5.29166666666667
                193.145833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = '% do Máximo'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
          end
          object qrbTotais: TQRBand
            Left = 38
            Top = 255
            Width = 718
            Height = 52
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
              137.583333333333
              1899.70833333333)
            BandType = rbSummary
            object QRLabel16: TQRLabel
              Left = 150
              Top = 30
              Width = 117
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                396.875
                79.375
                309.5625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total de Avaliações:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object QRLabel18: TQRLabel
              Left = 12
              Top = 30
              Width = 106
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                31.75
                79.375
                280.458333333333)
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
            object QRLabel17: TQRLabel
              Left = 327
              Top = 30
              Width = 99
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                865.1875
                79.375
                261.9375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Avaliação Média:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotPes: TQRLabel
              Left = 121
              Top = 30
              Width = 22
              Height = 17
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
            object qrlTotHst: TQRLabel
              Left = 274
              Top = 30
              Width = 25
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                724.958333333333
                79.375
                66.1458333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTotHst'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlMedAva: TQRLabel
              Left = 431
              Top = 30
              Width = 61
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1140.35416666667
                79.375
                161.395833333333)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlMedAva'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlPercTot: TQRLabel
              Left = 507
              Top = 30
              Width = 60
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1341.4375
                79.375
                158.75)
              Alignment = taRightJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlPercTot'
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
  object tblHstaval: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;CODTIPOAVAL;NUMSEQ'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTAVAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 129
    Top = 42
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
    Left = 213
    Top = 45
  end
end
