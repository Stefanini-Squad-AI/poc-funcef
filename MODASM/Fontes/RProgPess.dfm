inherited relProgPess: TrelProgPess
  Left = 152
  Top = 154
  Caption = 'Relatório de Programação de Exames ou Testes por Pessoa'
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
          Left = -3
          Top = 0
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
          ReportTitle = 'Programação de Exames ou Testes por Pessoa'
          SnapToGrid = True
          Units = MM
          Zoom = 80
          object PageHeaderBand1: TQRBand
            Left = 30
            Top = 30
            Width = 593
            Height = 76
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
              251.354166666667
              1961.22395833333)
            BandType = rbPageHeader
            object QRLabel3: TQRLabel
              Left = 207
              Top = 62
              Width = 40
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                684.609375
                205.052083333333
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
              Left = 264
              Top = 62
              Width = 25
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                873.125
                205.052083333333
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
              Left = 323
              Top = 62
              Width = 6
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1068.25520833333
                205.052083333333
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
              Left = 347
              Top = 62
              Width = 30
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1147.63020833333
                205.052083333333
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
            object qrlblNomeCli: TQRLabel
              Left = 224
              Top = 7
              Width = 145
              Height = 18
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                59.53125
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
            object QRSysData3: TQRSysData
              Left = 254
              Top = 32
              Width = 84
              Height = 18
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                59.53125
                840.052083333333
                105.833333333333
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
          object qrCabecalho: TQRBand
            Left = 30
            Top = 106
            Width = 593
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
              59.53125
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
              Left = 76
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
                251.354166666667
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
              Left = 302
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
                998.802083333333
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
          end
          object DetailBand1: TQRBand
            Left = 30
            Top = 124
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
            object QRDBText2: TQRDBText
              Left = 74
              Top = 10
              Width = 32
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                244.739583333333
                33.0729166666667
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
            object QRDBText3: TQRDBText
              Left = 302
              Top = 12
              Width = 35
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                998.802083333333
                39.6875
                115.755208333333)
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
            object QRDBText5: TQRDBText
              Left = 2
              Top = 10
              Width = 59
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                6.61458333333333
                33.0729166666667
                195.130208333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Color = clSilver
              DataSet = tblPessoal
              DataField = 'MATRICULA'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrsubdt: TQRSubDetail
            Left = 30
            Top = 172
            Width = 593
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AlignToBottom = False
            BeforePrint = qrsubdtBeforePrint
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
              105.833333333333
              1961.22395833333)
            Master = qr
            DataSet = tblPeriodo
            HeaderBand = qrbCabDet
            PrintBefore = False
            PrintIfEmpty = False
            object QRDBText4: TQRDBText
              Left = 29
              Top = 10
              Width = 74
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                95.9114583333333
                33.0729166666667
                244.739583333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Color = clWhite
              DataSet = tblOcorr
              DataField = 'DESCRTIPOOCMED'
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlDatPlan: TQRLabel
              Left = 332
              Top = 9
              Width = 39
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1098.02083333333
                29.765625
                128.984375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlDatPlan'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object qrlObserv: TQRLabel
              Left = 498
              Top = 9
              Width = 39
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1647.03125
                29.765625
                128.984375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlObserv'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
          end
          object PageFooterBand1: TQRBand
            Left = 30
            Top = 246
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
          object qrbCabDet: TQRBand
            Left = 30
            Top = 156
            Width = 593
            Height = 16
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
              1961.22395833333)
            BandType = rbGroupHeader
            object QRLabel9: TQRLabel
              Left = 29
              Top = 2
              Width = 106
              Height = 12
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                95.9114583333333
                6.61458333333333
                350.572916666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Tipo de Exame ou Teste'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel10: TQRLabel
              Left = 333
              Top = 2
              Width = 63
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
                208.359375)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Data Planejada'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
            object QRLabel15: TQRLabel
              Left = 498
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
                1647.03125
                6.61458333333333
                175.286458333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Observação'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 8
            end
          end
          object qrbTotais: TQRBand
            Left = 30
            Top = 204
            Width = 593
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
              1961.22395833333)
            BandType = rbSummary
            object QRLabel16: TQRLabel
              Left = 159
              Top = 24
              Width = 82
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                525.859375
                79.375
                271.197916666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total de Exames:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
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
            object qrlTotCur: TQRLabel
              Left = 248
              Top = 24
              Width = 20
              Height = 14
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                46.3020833333333
                820.208333333333
                79.375
                66.1458333333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = False
              AutoStretch = False
              Caption = 'qrlTotCur'
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
  inherited tblSindic: TwwQuery
    Left = 339
    Top = 270
  end
  inherited tblProfis: TwwQuery
    Top = 270
  end
  object ds2: TwwDataSource
    DataSet = tblPeriodo
    Left = 242
    Top = 288
  end
  object tblHstasm: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;CODTIPOOCMED;NUMSEQ'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTASMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 287
    Top = 288
    object tblHstasmIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tblHstasmCODTIPOOCMED: TFloatField
      FieldName = 'CODTIPOOCMED'
      Required = True
    end
    object tblHstasmDATAREAL: TDateTimeField
      FieldName = 'DATAREAL'
    end
    object tblHstasmDATAPLAN: TDateTimeField
      FieldName = 'DATAPLAN'
    end
    object tblHstasmNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
      Required = True
    end
  end
  object tblOcorr: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOCMED'
    MasterFields = 'CODTIPOOCMED'
    MasterSource = ds2
    TableName = 'CM.TIPOCMED'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 378
    Top = 300
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
  object tblPeriodo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOCMED'
    TableName = 'CM.PEREXAME'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 394
    Top = 256
  end
  object dsHst: TwwDataSource
    DataSet = tblHstasm
    Left = 329
    Top = 231
  end
  object qryUltSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hstasmed'
      'where  IDPESSOA = :IDPESSOA'
      'and  CODTIPOOCMED = :CODTIPOOCMED')
    ValidateWithMask = True
    Left = 520
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTIPOOCMED'
        ParamType = ptUnknown
      end>
  end
end
