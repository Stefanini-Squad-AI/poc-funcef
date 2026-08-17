inherited relResumoProc: TrelResumoProc
  Left = 118
  Top = 200
  Caption = 'Resumo por UF'
  ClientHeight = 224
  ClientWidth = 650
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 0
    Width = 653
    Height = 845
    BeforePrint = qrBeforePrint
    DataSet = frmSelRelProc.qryResumo
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.PaperSize = Letter
    Page.Values = (
      200
      2794
      100
      2159
      100
      100
      0)
    ReportTitle = 'Resumo por UF'
    Zoom = 80
    inherited PageFooterBand1: TQRBand
      Left = 30
      Top = 188
      Width = 593
      Height = 32
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        105.833333333333
        1961.22395833333)
      inherited QRSysData1: TQRSysData
        Left = 548
        Top = 17
        Width = 45
        Height = 12
        Size.Values = (
          39.6875
          1812.39583333333
          56.2239583333333
          148.828125)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 271
        Top = 17
        Width = 50
        Height = 12
        Size.Values = (
          39.6875
          896.276041666667
          56.2239583333333
          165.364583333333)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Top = 17
        Width = 127
        Height = 12
        Size.Values = (
          39.6875
          0
          56.2239583333333
          420.026041666667)
        FontSize = 8
      end
    end
    inherited PageHeaderBand1: TQRBand
      Left = 30
      Top = 30
      Width = 593
      Height = 62
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        205.052083333333
        1961.22395833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 224
        Top = 7
        Width = 145
        Height = 18
        Size.Values = (
          59.53125
          740.833333333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 207
        Top = 29
        Width = 178
        Height = 18
        Size.Values = (
          59.53125
          684.609375
          95.9114583333333
          588.697916666667)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Left = 30
      Top = 92
      Width = 593
      Height = 31
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        102.526041666667
        1961.22395833333)
      inherited QrLabel4: TQRLabel
        Left = 46
        Top = 7
        Width = 8
        Height = 12
        Size.Values = (
          39.6875
          150.8125
          23.8125
          26.4583333333333)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 5
        Top = 2
        Width = 70
        Height = 12
        Size.Values = (
          39.6875
          16.5364583333333
          6.61458333333333
          231.510416666667)
        Caption = 'Unid. Federação'
        FontSize = 8
      end
      object qrLabelMaxOrig: TQRLabel
        Left = 112
        Top = 16
        Width = 54
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          52.9166666666667
          178.59375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Risco Máximo'
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
      object qrLabelRiscoProvavel: TQRLabel
        Left = 224
        Top = 16
        Width = 58
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          740.833333333333
          52.9166666666667
          191.822916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Risco Provável'
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
      object qrLabelMaxOrig2: TQRLabel
        Left = 448
        Top = 16
        Width = 55
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1481.66666666667
          52.9166666666667
          181.901041666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sobre Máximo'
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
      object qrLabelSobreProvavel: TQRLabel
        Left = 519
        Top = 16
        Width = 60
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1716.484375
          52.9166666666667
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sobre Provável'
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
      object QRShape1: TQRShape
        Left = 74
        Top = 0
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          246.0625
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape2: TQRShape
        Left = 197
        Top = 0
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          650.875
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape6: TQRShape
        Left = 312
        Top = 0
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1031.875
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape7: TQRShape
        Left = 438
        Top = 0
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1449.91666666667
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRLabel1: TQRLabel
        Left = 49
        Top = 16
        Width = 22
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          162.057291666667
          52.9166666666667
          72.7604166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qtde.'
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
      object qrLabelEconomia: TQRLabel
        Left = 490
        Top = 2
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1620.57291666667
          6.61458333333333
          125.677083333333)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrLabelValorReal: TQRLabel
        Left = 355
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
          1174.08854166667
          52.9166666666667
          135.598958333333)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 123
      Width = 593
      Height = 31
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      BeforePrint = DetailBand1BeforePrint
      Font.Height = -11
      ParentFont = False
      Size.Values = (
        102.526041666667
        1961.22395833333)
      object QRDBText2: TQRDBText
        Left = 5
        Top = 2
        Width = 26
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          16.5364583333333
          6.61458333333333
          85.9895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'NOME'
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
      object QRShape3: TQRShape
        Left = 74
        Top = 14
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          246.0625
          47.625
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape4: TQRShape
        Left = 197
        Top = 17
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          650.875
          55.5625
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape5: TQRShape
        Left = 312
        Top = 17
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1031.875
          55.5625
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape8: TQRShape
        Left = 438
        Top = 17
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1449.91666666667
          55.5625
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRDBText1: TQRDBText
        Left = 29
        Top = 17
        Width = 40
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          95.25
          55.5625
          132.291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'QTDPROC'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 97
        Top = 17
        Width = 70
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          320.145833333333
          55.5625
          232.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'VALRECLAMADO'
        Mask = '##,###,###,###'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 227
        Top = 17
        Width = 60
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          751.416666666667
          55.5625
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'VALESTIMADO'
        Mask = '##,###,###,###'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 333
        Top = 17
        Width = 62
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1100.66666666667
          55.5625
          203.729166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'VALREAL'
        Mask = '##,###,###,###'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 440
        Top = 17
        Width = 65
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1455.20833333333
          56.2239583333333
          214.973958333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'ECONRECLAMADO'
        Mask = '##,###,###,###'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 514
        Top = 17
        Width = 65
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1701.27083333333
          55.5625
          214.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = frmSelRelProc.qryResumo
        DataField = 'ECONESTIMADO'
        Mask = '##,###,###,###'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 30
      Top = 154
      Width = 593
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
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
        112.447916666667
        1961.22395833333)
      BandType = rbSummary
      object qrlTot4: TQRLabel
        Left = 440
        Top = 18
        Width = 65
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1455.20833333333
          59.53125
          214.973958333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTot4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlTot1: TQRLabel
        Left = 97
        Top = 18
        Width = 70
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          320.145833333333
          60.8541666666667
          232.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTot1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlTot2: TQRLabel
        Left = 227
        Top = 18
        Width = 60
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          751.416666666667
          60.8541666666667
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTot2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlTot3: TQRLabel
        Left = 333
        Top = 18
        Width = 62
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1100.66666666667
          60.8541666666667
          203.729166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTot3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 5
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
          16.5364583333333
          6.61458333333333
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totais'
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
      object QRShape9: TQRShape
        Left = 74
        Top = -6
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          246.0625
          -21.1666666666667
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape10: TQRShape
        Left = 197
        Top = -6
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          650.875
          -21.1666666666667
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 312
        Top = -6
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1031.875
          -21.1666666666667
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape12: TQRShape
        Left = 438
        Top = -6
        Width = 1
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666667
          1449.91666666667
          -21.1666666666667
          2.64583333333333)
        Shape = qrsVertLine
      end
      object qrlTQP: TQRLabel
        Left = 29
        Top = 18
        Width = 40
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          95.25
          60.8541666666667
          132.291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlQ1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlTot5: TQRLabel
        Left = 514
        Top = 18
        Width = 65
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1701.27083333333
          60.8541666666667
          214.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlTot5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
