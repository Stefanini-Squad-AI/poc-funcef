object relProcesso: TrelProcesso
  Left = 210
  Top = 147
  Width = 544
  Height = 375
  Caption = 'relProcesso'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qr: TQuickRep
    Left = -35
    Top = 2
    Width = 898
    Height = 635
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
    Zoom = 80
    object PageFooterBand1: TQRBand
      Left = 30
      Top = 269
      Width = 838
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
        2771.51041666667)
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 793
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
          2622.68229166667
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
        Left = 394
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
          1303.07291666667
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
      Width = 838
      Height = 45
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
        148.828125
        2771.51041666667)
      BandType = rbPageHeader
      object qrlblNomeCli: TQRLabel
        Left = 346
        Top = 5
        Width = 145
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          59.53125
          1144.32291666667
          16.5364583333333
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
        Left = 381
        Top = 26
        Width = 75
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1260.078125
          85.9895833333333
          248.046875)
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
      Left = 30
      Top = 75
      Width = 838
      Height = 32
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
        2771.51041666667)
      BandType = rbColumnHeader
      object QRLabel4: TQRLabel
        Left = 9
        Top = 19
        Width = 36
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          29.765625
          62.8385416666667
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
        Left = 76
        Top = 19
        Width = 57
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          251.354166666667
          62.8385416666667
          188.515625)
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
        Left = 493
        Top = 19
        Width = 44
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1630.49479166667
          62.8385416666667
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
        Left = 581
        Top = 10
        Width = 25
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1921.53645833333
          33.0729166666667
          82.6822916666667)
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
        Left = 544
        Top = 19
        Width = 14
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1799.16666666667
          62.8385416666667
          46.3020833333333)
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
        Left = 636
        Top = 10
        Width = 25
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2103.4375
          33.0729166666667
          82.6822916666667)
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
        Left = 680
        Top = 19
        Width = 45
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2248.95833333333
          62.8385416666667
          148.828125)
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
        Left = 787
        Top = 10
        Width = 43
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2602.83854166667
          33.0729166666667
          142.213541666667)
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
        Left = 739
        Top = 10
        Width = 43
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2444.08854166667
          33.0729166666667
          142.213541666667)
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
        Left = 739
        Top = 19
        Width = 43
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2444.08854166667
          62.8385416666667
          142.213541666667)
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
        Left = 786
        Top = 19
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2599.53125
          62.8385416666667
          152.135416666667)
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
      object qrlPatro: TQRLabel
        Left = 358
        Top = 19
        Width = 62
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1184.01041666667
          62.8385416666667
          205.052083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Patrocinadora'
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
        Left = 630
        Top = 19
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2083.59375
          62.8385416666667
          125.677083333333)
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
        Left = 577
        Top = 19
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1908.30729166667
          62.8385416666667
          115.755208333333)
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
      object qrlDemissao: TQRLabel
        Left = 307
        Top = 19
        Width = 45
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1015.33854166667
          62.8385416666667
          148.828125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Demissão'
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
      object qrlAdmissao: TQRLabel
        Left = 254
        Top = 19
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          840.052083333334
          62.8385416666667
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Admissão'
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
        Left = 56
        Top = 19
        Width = 11
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          185.208333333333
          62.8385416666667
          36.3802083333333)
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
      object qrlVaraJust: TQRLabel
        Left = 252
        Top = 19
        Width = 68
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          833.4375
          62.8385416666667
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
      object qrlNumVara: TQRLabel
        Left = 442
        Top = 19
        Width = 32
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1461.82291666667
          62.8385416666667
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
    end
    object DetailBand1: TQRBand
      Left = 30
      Top = 107
      Width = 838
      Height = 16
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
        2771.51041666667)
      BandType = rbDetail
      object qrdbNumJCJ: TQRDBText
        Left = 0
        Top = 5
        Width = 46
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          0
          16.5364583333333
          152.135416666667)
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
        Left = 76
        Top = 5
        Width = 172
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          251.354166666667
          16.5364583333333
          568.854166666667)
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
        Left = 493
        Top = 5
        Width = 42
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          1630.49479166667
          16.5364583333333
          138.90625)
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
        Left = 544
        Top = 5
        Width = 12
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          1799.16666666667
          16.5364583333333
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
        Left = 621
        Top = 5
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          2053.828125
          16.5364583333333
          165.364583333333)
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
        Left = 565
        Top = 5
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1868.61979166667
          16.5364583333333
          165.364583333333)
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
        Left = 677
        Top = 5
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          2239.03645833333
          16.5364583333333
          165.364583333333)
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
        Left = 786
        Top = 5
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          2599.53125
          16.5364583333333
          165.364583333333)
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
        Left = 733
        Top = 5
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          2424.24479166667
          16.5364583333333
          165.364583333333)
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
      object qrdbPatro: TQRDBText
        Left = 358
        Top = 5
        Width = 130
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1184.01041666667
          16.5364583333333
          429.947916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryPatro
        DataField = 'NOME'
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object qdrbDtDem: TQRDBText
        Left = 306
        Top = 5
        Width = 49
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1012.03125
          16.5364583333333
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc2.qryProcesso
        DataField = 'DATADEMISSAO'
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object qrdbDtAdm: TQRDBText
        Left = 252
        Top = 5
        Width = 49
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.3802083333333
          833.4375
          16.5364583333333
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc2.qryProcesso
        DataField = 'DATAADMISSAO'
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object qrdbUF: TQRDBText
        Left = 55
        Top = 5
        Width = 15
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.3802083333333
          181.901041666667
          16.5364583333333
          49.609375)
        Alignment = taRightJustify
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
      object qrdbNumInt: TQRDBText
        Left = 0
        Top = 5
        Width = 46
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          0
          16.5364583333333
          152.135416666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc2.qryProcesso
        DataField = 'NUMPROCTRAB'
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object qrdbVaraJust: TQRDBText
        Left = 252
        Top = 5
        Width = 42
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          833.4375
          16.5364583333333
          138.90625)
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
        Left = 448
        Top = 5
        Width = 69
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          1481.66666666667
          16.5364583333333
          228.203125)
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
      Left = 30
      Top = 238
      Width = 838
      Height = 31
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
        102.526041666667
        2771.51041666667)
      BandType = rbSummary
      object QRLabel8: TQRLabel
        Left = 91
        Top = 10
        Width = 72
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          300.963541666667
          33.0729166666667
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
        Left = 461
        Top = 10
        Width = 45
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          1524.66145833333
          33.0729166666667
          148.828125)
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
        Left = 197
        Top = 10
        Width = 34
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          33.0729166666667
          651.536458333334
          33.0729166666667
          112.447916666667)
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
        Left = 565
        Top = 10
        Width = 50
        Height = 14
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
        Left = 621
        Top = 10
        Width = 50
        Height = 14
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
        Left = 677
        Top = 10
        Width = 50
        Height = 14
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
        Left = 786
        Top = 10
        Width = 50
        Height = 14
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
        Left = 733
        Top = 10
        Width = 50
        Height = 14
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
    object qrbCargo: TQRChildBand
      Left = 30
      Top = 123
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      ParentBand = DetailBand1
      object QRDBText4: TQRDBText
        Left = 76
        Top = 2
        Width = 172
        Height = 14
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
        DataSet = frmSelRelProc2.qryProcesso
        DataField = 'TITULO'
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
    object qrsbLitis: TQRSubDetail
      Left = 30
      Top = 151
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      Master = qr
      DataSet = qryLitis
      HeaderBand = qrCabLitis
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText9: TQRDBText
        Left = 76
        Top = 2
        Width = 172
        Height = 14
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
        Left = 252
        Top = 2
        Width = 200
        Height = 14
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
      Left = 30
      Top = 179
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      Master = qr
      DataSet = qryEtapa
      HeaderBand = qrCabEtapa
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText5: TQRDBText
        Left = 252
        Top = 2
        Width = 49
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          833.4375
          6.61458333333333
          162.057291666667)
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
        Left = 76
        Top = 2
        Width = 172
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          251.354166666667
          6.61458333333333
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
        Left = 358
        Top = 2
        Width = 130
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1184.01041666667
          6.61458333333333
          429.947916666667)
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
      Left = 30
      Top = 193
      Width = 838
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
        2771.51041666667)
      ParentBand = qrsdEtapa
      object QRDBText8: TQRDBText
        Left = 76
        Top = 2
        Width = 412
        Height = 14
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
        AutoStretch = True
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
      Left = 30
      Top = 224
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      Master = qr
      DataSet = qryObjeto
      HeaderBand = qrCabObjeto
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText11: TQRDBText
        Left = 422
        Top = 2
        Width = 49
        Height = 14
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1395.67708333333
          6.61458333333333
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryObjeto
        DataField = 'DATAINICIO'
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
      object QRDBText12: TQRDBText
        Left = 76
        Top = 2
        Width = 320
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          251.354166666667
          6.61458333333333
          1058.33333333333)
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
      object QRDBText14: TQRDBText
        Left = 476
        Top = 2
        Width = 49
        Height = 14
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1574.27083333333
          6.61458333333333
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryObjeto
        DataField = 'DATAFINAL'
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
        Left = 565
        Top = 2
        Width = 50
        Height = 14
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
        Left = 621
        Top = 2
        Width = 50
        Height = 14
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
        Left = 677
        Top = 2
        Width = 50
        Height = 14
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
        Left = 733
        Top = 2
        Width = 50
        Height = 14
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
        Left = 786
        Top = 2
        Width = 50
        Height = 14
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
      Left = 30
      Top = 137
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      BandType = rbGroupHeader
      object QRLabel1: TQRLabel
        Left = 76
        Top = 2
        Width = 90
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          251.354166666667
          6.61458333333333
          297.65625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome do Litisconsorte'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlSitLitis: TQRLabel
        Left = 253
        Top = 2
        Width = 101
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          836.744791666667
          6.61458333333333
          334.036458333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Situação do Litisconsorte'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrCabEtapa: TQRBand
      Left = 30
      Top = 165
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      BandType = rbGroupHeader
      object QRLabel3: TQRLabel
        Left = 76
        Top = 2
        Width = 114
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          251.354166666667
          6.61458333333333
          377.03125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo de Etapa ou Andamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 253
        Top = 2
        Width = 19
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          836.744791666667
          6.61458333333333
          62.8385416666667)
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
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 358
        Top = 2
        Width = 75
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1184.01041666667
          6.61458333333333
          248.046875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Assunto Resumido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrCabObjeto: TQRBand
      Left = 30
      Top = 210
      Width = 838
      Height = 14
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
        46.3020833333333
        2771.51041666667)
      BandType = rbGroupHeader
      object QRLabel10: TQRLabel
        Left = 76
        Top = 2
        Width = 60
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          251.354166666667
          6.61458333333333
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo de Objeto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 425
        Top = 2
        Width = 90
        Height = 12
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1405.59895833333
          6.61458333333333
          297.65625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Período de Ocorrência'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds2
    SQL.Strings = (
      'Select NOME from PESSOA '
      'where (IDPESSOA = :IdPessJur) ')
    ValidateWithMask = True
    Left = 42
    Top = 39
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end>
  end
  object ds2: TwwDataSource
    DataSet = frmSelRelProc2.qryProcesso
    Left = 141
    Top = 43
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
    Left = 347
    Top = 40
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
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 270
    Top = 135
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 270
    Top = 258
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
    Left = 263
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
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
    Left = 108
    Top = 214
  end
end
