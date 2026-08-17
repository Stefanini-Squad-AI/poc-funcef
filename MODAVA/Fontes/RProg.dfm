inherited relProg: TrelProg
  Left = 6
  Top = 149
  Caption = 'Relatório de Programação de Avaliações de Desempenho'
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
          DataSet = tblPessoal
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
          OnPreview = qrPreview
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
          PrintIfEmpty = False
          SnapToGrid = True
          Units = MM
          Zoom = 100
          object PageFooterBand1: TQRBand
            Left = 38
            Top = 247
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
            object qrlTitulo: TQRLabel
              Left = 150
              Top = 36
              Width = 417
              Height = 23
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                60.8541666666667
                396.875
                95.25
                1103.3125)
              Alignment = taCenter
              AlignToBand = True
              AutoSize = True
              AutoStretch = False
              Caption = 'Programação de Avaliações de Desempenho'
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
            object qrlPeriodo: TQRLabel
              Left = 18
              Top = 57
              Width = 53
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
                140.229166666667)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Período: '
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
            object QRLabel7: TQRLabel
              Left = 624
              Top = 12
              Width = 24
              Height = 15
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                39.6875
                1651
                31.75
                63.5)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Data'
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
            Color = clWhite
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
              Color = clWhite
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
              Color = clWhite
              DataSet = tblCargo2
              DataField = 'TITULO'
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlDataProg: TQRLabel
              Left = 597
              Top = 12
              Width = 69
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                1579.5625
                31.75
                182.5625)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'qrlDataProg'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
          end
          object qrbTotais: TQRBand
            Left = 38
            Top = 195
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
              Width = 205
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
                542.395833333333)
              Alignment = taLeftJustify
              AlignToBand = False
              AutoSize = True
              AutoStretch = False
              Caption = 'Total de Avaliações para o Período:'
              Color = clWhite
              Transparent = False
              WordWrap = True
              FontSize = 10
            end
            object qrlTotPes: TQRLabel
              Left = 370
              Top = 30
              Width = 22
              Height = 17
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Size.Values = (
                44.9791666666667
                978.958333333333
                79.375
                58.2083333333333)
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
    Top = 27
  end
  object tblHstaval: TwwTable
    DatabaseName = 'BaseDados'
    Filtered = True
    OnFilterRecord = tblHstavalFilterRecord
    IndexFieldNames = 'IDPESSOA;CODTIPOAVAL;NUMSEQ'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.HSTAVAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 129
    Top = 24
  end
  object tblGrupo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODGRPFUNC'
    MasterFields = 'CODGRPFUNC'
    MasterSource = dsCar
    TableName = 'CM.GRUPFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 43
    Top = 37
  end
  object dsCar: TwwDataSource
    DataSet = tblCargo2
    Left = 259
    Top = 34
  end
  object tblHstcon2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;CODTIPOAVAL'
    MasterFields = 'IDPESSOA;CODTIPOAVAL'
    MasterSource = dsAval
    TableName = 'CM.HSTAVAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 132
    Top = 75
  end
  object dsAval: TwwDataSource
    DataSet = tblHstaval
    Left = 84
    Top = 18
  end
  object tblTipAval: TwwTable
    DatabaseName = 'BaseDados'
    Filter = 'FLGTIPOAVAL < 2'
    Filtered = True
    IndexFieldNames = 'CODTIPOAVAL'
    TableName = 'CM.TIPOAVAL'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 174
    Top = 3
  end
end
