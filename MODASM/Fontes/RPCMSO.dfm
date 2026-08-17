inherited relPCMSO: TrelPCMSO
  Left = 144
  Top = 129
  Caption = 'Ficha PCMSO'
  ClientHeight = 403
  ClientWidth = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 8
    Top = 0
    Width = 635
    Height = 898
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    PrintIfEmpty = True
    ReportTitle = 'Ficha PCMSO'
    Zoom = 80
    inherited PageFooterBand1: TQRBand
      Left = 30
      Top = 414
      Width = 575
      Height = 448
      Frame.DrawTop = False
      Size.Values = (
        1481.66666666667
        1901.69270833333)
      object QRShape7: TQRShape [0]
        Left = 12
        Top = 115
        Width = 545
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          135.598958333333
          39.6875
          380.338541666667
          1802.47395833333)
        Shape = qrsRectangle
      end
      object QRShape9: TQRShape [1]
        Left = 12
        Top = 173
        Width = 545
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          135.598958333333
          39.6875
          572.161458333333
          1802.47395833333)
        Shape = qrsRectangle
      end
      inherited QRSysData1: TQRSysData
        Left = 531
        Top = 418
        Width = 29
        Height = 13
        Enabled = False
        Size.Values = (
          42.9947916666667
          1756.171875
          1382.44791666667
          95.9114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        Data = qrsDate
        Font.Height = -13
        FontSize = 10
      end
      inherited QRSysData2: TQRSysData
        Left = 262
        Top = 404
        Width = 50
        Height = 12
        Enabled = False
        Size.Values = (
          39.6875
          866.510416666667
          1336.14583333333
          165.364583333333)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Top = 403
        Width = 127
        Height = 12
        Enabled = False
        Size.Values = (
          39.6875
          0
          1332.83854166667
          420.026041666667)
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 180
        Top = 367
        Width = 208
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          595.3125
          1213.77604166667
          687.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '_____________________________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbMedEntid: TQRDBText
        Left = 246
        Top = 382
        Width = 69
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          813.59375
          1263.38541666667
          228.203125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'EXAMINADOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbDatReal: TQRDBText
        Left = 439
        Top = 195
        Width = 55
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1451.90104166667
          644.921875
          181.901041666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'DATAREAL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblAval: TQRLabel
        Left = 12
        Top = 228
        Width = 50
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.3802083333333
          39.6875
          754.0625
          165.364583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbAval: TQRDBText
        Left = 74
        Top = 228
        Width = 60
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          244.739583333333
          754.0625
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'AVALIACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlObserv: TQRLabel
        Left = 148
        Top = 228
        Width = 44
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          489.479166666667
          754.0625
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
      object qrlblCid: TQRLabel
        Left = 12
        Top = 261
        Width = 128
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375
          39.6875
          863.203125
          423.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CID (Cod. Intern. Doenças):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbCID: TQRDBText
        Left = 151
        Top = 261
        Width = 40
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          499.401041666667
          863.203125
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'CODCID'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblObserv: TQRLabel
        Left = 12
        Top = 290
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375
          39.6875
          959.114583333333
          201.744791666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observações'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbComent: TQRDBText
        Left = 12
        Top = 303
        Width = 74
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          39.6875
          1002.109375
          244.739583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'OBSERVACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRMemoCID: TQRLabel
        Left = 152
        Top = 276
        Width = 417
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          502.708333333333
          912.8125
          1379.140625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRMemoCID'
        Color = clWhite
        Transparent = False
        WordWrap = False
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 228
        Top = 57
        Width = 118
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          754.0625
          188.515625
          390.260416666667)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Realização / Resultado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 45
        Width = 575
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          6.61458333333333
          0
          148.828125
          1901.69270833333)
        Pen.Style = psDot
        Shape = qrsHorLine
      end
      object QRDBText6: TQRDBText
        Left = 18
        Top = 138
        Width = 32
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          456.40625
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qry
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 391
        Top = 138
        Width = 62
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1293.15104166667
          456.40625
          205.052083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'NUMDOCUMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 456
        Top = 138
        Width = 57
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1508.125
          456.40625
          188.515625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'DATAEMISSAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 18
        Top = 195
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          644.921875
          324.114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryTabOcorr
        DataField = 'DESCRTIPOOCMED'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 98
        Top = 120
        Width = 28
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          324.114583333333
          396.875
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 441
        Top = 120
        Width = 49
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          1458.515625
          396.875
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cart.Ident.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape8: TQRShape
        Left = 385
        Top = 116
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1273.30729166667
          383.645833333333
          3.30729166666667)
        Shape = qrsRectangle
      end
      object QRLabel19: TQRLabel
        Left = 14
        Top = 100
        Width = 215
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          46.3020833333333
          330.729166666667
          711.067708333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Identificação do Empregado ou Candidato'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 12
        Top = 160
        Width = 166
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          39.6875
          529.166666666667
          549.010416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Exame Solicitado ou Ocorrência'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 98
        Top = 176
        Width = 20
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          324.114583333333
          582.083333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 455
        Top = 176
        Width = 22
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          1504.81770833333
          582.083333333333
          72.7604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 385
        Top = 173
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1273.30729166667
          572.161458333333
          3.30729166666667)
        Shape = qrsRectangle
      end
      object QRDBText11: TQRDBText
        Left = 225
        Top = 77
        Width = 38
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          744.140625
          254.661458333333
          125.677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qry
        DataField = 'TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 179
        Top = 77
        Width = 34
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          592.005208333333
          254.661458333333
          112.447916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 515
        Top = 138
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1703.25520833333
          456.40625
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'ORGAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited PageHeaderBand1: TQRBand
      Left = 30
      Top = 30
      Width = 575
      Height = 52
      Size.Values = (
        171.979166666667
        1901.69270833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 215
        Top = 7
        Width = 145
        Height = 18
        Size.Values = (
          59.53125
          711.067708333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 198
        Top = 29
        Width = 178
        Height = 18
        Size.Values = (
          59.53125
          654.84375
          95.9114583333333
          588.697916666667)
        FontSize = 14
      end
      object QRDBImage1: TQRDBImage
        Left = 32
        Top = 1
        Width = 41
        Height = 48
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.75
          105.833333333333
          3.30729166666667
          135.598958333333)
        DataField = 'IMAGEM'
        DataSet = qryEstab
        Stretch = True
      end
    end
    inherited qrCabecalho: TQRBand
      Left = 30
      Top = 82
      Width = 575
      Height = 23
      Size.Values = (
        76.0677083333333
        1901.69270833333)
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
        Caption = ''
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 94
        Top = 5
        Width = 10
        Height = 13
        Size.Values = (
          42.9947916666667
          310.885416666667
          16.5364583333333
          33.0729166666667)
        AutoSize = False
        Caption = ''
        Font.Height = -13
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 105
      Width = 575
      Height = 277
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        916.119791666667
        1901.69270833333)
      object QRShape4: TQRShape
        Left = 12
        Top = 101
        Width = 545
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          135.598958333333
          39.6875
          334.036458333333
          1802.47395833333)
        Shape = qrsRectangle
      end
      object QRShape1: TQRShape
        Left = 12
        Top = 43
        Width = 545
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          135.598958333333
          39.6875
          142.213541666667
          1802.47395833333)
        Shape = qrsRectangle
      end
      object qrdbNome: TQRDBText
        Left = 18
        Top = 66
        Width = 32
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          218.28125
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qry
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbNumIdent: TQRDBText
        Left = 391
        Top = 66
        Width = 62
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1293.15104166667
          218.28125
          205.052083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'NUMDOCUMENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbOrgIdent: TQRDBText
        Left = 515
        Top = 66
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1703.25520833333
          218.28125
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'ORGAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbDatIdent: TQRDBText
        Left = 456
        Top = 66
        Width = 57
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1508.125
          218.28125
          188.515625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryCartIdent
        DataField = 'DATAEMISSAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbExame: TQRDBText
        Left = 18
        Top = 123
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          406.796875
          324.114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryTabOcorr
        DataField = 'DESCRTIPOOCMED'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 421
        Top = 123
        Width = 55
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1392.36979166667
          406.796875
          181.901041666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'DATAPLAN'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 98
        Top = 48
        Width = 28
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          324.114583333333
          158.75
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 441
        Top = 48
        Width = 49
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          1458.515625
          158.75
          162.057291666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cart.Ident.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 385
        Top = 44
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1273.30729166667
          145.520833333333
          3.30729166666667)
        Shape = qrsRectangle
      end
      object QRLabel3: TQRLabel
        Left = 14
        Top = 28
        Width = 215
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          46.3020833333333
          92.6041666666667
          711.067708333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Identificação do Empregado ou Candidato'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 12
        Top = 88
        Width = 166
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          39.6875
          291.041666666667
          549.010416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Exame Solicitado ou Ocorrência'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 98
        Top = 104
        Width = 20
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          324.114583333333
          343.958333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 439
        Top = 104
        Width = 56
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          1451.90104166667
          343.958333333333
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data e Hora'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 385
        Top = 101
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1273.30729166667
          334.036458333333
          3.30729166666667)
        Shape = qrsRectangle
      end
      object QRDBText1: TQRDBText
        Left = 225
        Top = 5
        Width = 38
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          744.140625
          16.5364583333333
          125.677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qry
        DataField = 'TITULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 179
        Top = 5
        Width = 34
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          592.005208333333
          16.5364583333333
          112.447916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 12
        Top = 158
        Width = 545
        Height = 48
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.75
          39.6875
          522.552083333333
          1802.47395833333)
        Shape = qrsRectangle
      end
      object QRDBText3: TQRDBText
        Left = 18
        Top = 184
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          608.541666666667
          195.130208333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = qryExaminador
        DataField = 'ENDERECO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 12
        Top = 144
        Width = 105
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          39.6875
          476.25
          347.265625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Local de Realização'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 18
        Top = 165
        Width = 69
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          59.53125
          545.703125
          228.203125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmCadRegOcorr.qryDet
        DataField = 'EXAMINADOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 36
        Top = 243
        Width = 190
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          119.0625
          803.671875
          628.385416666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryEstab
        DataField = 'NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 291
        Top = 243
        Width = 208
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          962.421875
          803.671875
          687.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '_____________________________________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblAssinante: TQRLabel
        Left = 296
        Top = 257
        Width = 201
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          978.958333333333
          849.973958333333
          664.765625)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Assinante'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData3: TQRSysData
        Left = 230
        Top = 243
        Width = 29
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.9947916666667
          760.677083333333
          803.671875
          95.9114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
    end
    object qrbCandidato: TQRChildBand
      Left = 30
      Top = 382
      Width = 575
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
        1901.69270833333)
      ParentBand = DetailBand1
      object QRMemo1: TQRMemo
        Left = 16
        Top = 2
        Width = 540
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.6822916666667
          52.9166666666667
          6.61458333333333
          1785.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Lines.Strings = (
          
            'O não comparecimento do candidato no dia e hora marcados implica' +
            'rá perda da validade da presente Guia, acarretando atraso na sua' +
            ' admissão, podendo resultar na eliminação do candidato.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qryCartIdent: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmCadRegOcorr.ds
    SQL.Strings = (
      'Select * from DOCPESSOA D, TIPODOCOFICIAL TD'
      'where'
      '     D.IDDOCUMENTO = TD.IDDOCUMENTO AND'
      '    TD.CODDOCUMENTO = '#39'25'#39' AND'
      '    D.IDPESSOA = :IdPessoa')
    ValidateWithMask = True
    Left = 541
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryExaminador: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmCadRegOcorr.dsDet
    SQL.Strings = (
      'Select'
      '      RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO ||'
      
        '      DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL, '#39' - '#39' || RTRIM(E.CO' +
        'MPLEMENTO)) ||'
      
        '      DECODE(RTRIM(E.BAIRRO),NULL,NULL, '#39' - '#39' || RTRIM(E.BAIRRO)' +
        ')'
      '      AS ENDERECO'
      'from ENDPESS E, PESSOA P'
      'where'
      '     P.IDPESSOA = :IDEXAMINADOR  AND'
      '     P.IDPESSOA =  E.IDPESSOA    AND'
      '     (P.IDENDCOMERCIAL   = E.IDENDERECO OR'
      '      P.IDENDRESIDENCIAL = E.IDENDERECO)'
      ' ')
    ValidateWithMask = True
    Left = 469
    Top = 4
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEXAMINADOR'
        ParamType = ptUnknown
      end>
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select'
      '      IM.IMAGEM, TRIM(CI.NOME) AS NOME'
      'from IMAGENS IM, PESSOA P, ENDPESS E, CIDADES CI'
      'where'
      '     P.IDPESSOA = :IDESTAB  AND'
      '     P.IDIMAGEM =  IM.IDIMAGEM(+)  AND'
      '     P.IDENDCOMERCIAL = E.IDENDERECO AND'
      '     E.IDCIDADES = CI.IDCIDADES')
    ValidateWithMask = True
    Left = 405
    Top = 4
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDESTAB'
        ParamType = ptUnknown
      end>
  end
end
