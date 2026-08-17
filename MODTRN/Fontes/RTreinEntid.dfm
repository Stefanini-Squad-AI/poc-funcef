inherited relTreinEntid: TrelTreinEntid
  Left = 270
  Top = 158
  BorderStyle = bsSingle
  Caption = 'Relatório da Atividade de Treinamento por Entidade/Instrutor'
  ClientHeight = 340
  ClientWidth = 428
  Font.Style = [fsBold]
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Top = -3
    Width = 653
    Height = 845
    BeforePrint = qrBeforePrint
    DataSet = qryPessoal
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.PaperSize = Letter
    Page.Values = (
      100
      2794
      100
      2159
      100
      100
      0)
    ReportTitle = 'Atividade de Treinamento por Entidade/Instrutor'
    Zoom = 80
    inherited DetailBand1: TQRBand [0]
      Left = 30
      Top = 148
      Width = 593
      Height = 20
      AfterPrint = DetailBand1AfterPrint
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        66.1458333333333
        1961.22395833333)
      object QRDBText1: TQRDBText
        Left = 0
        Top = 4
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          0
          13.2291666666667
          102.526041666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryPessoal
        DataField = 'NOME'
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
    end
    inherited PageFooterBand1: TQRBand [1]
      Left = 30
      Top = 286
      Width = 593
      Height = 32
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
    inherited PageHeaderBand1: TQRBand [2]
      Left = 30
      Top = 30
      Width = 593
      Height = 60
      Size.Values = (
        198.4375
        1961.22395833333)
      inherited qrlblNomeCli: TQRLabel
        Left = 224
        Top = 7
        Width = 145
        Height = 19
        Size.Values = (
          62.8385416666667
          740.833333333333
          23.1510416666667
          479.557291666667)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 207
        Top = 29
        Width = 178
        Height = 19
        Size.Values = (
          62.8385416666667
          684.609375
          95.9114583333333
          588.697916666667)
        FontSize = 14
      end
    end
    object qrbTotais: TQRBand [3]
      Left = 30
      Top = 244
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
      object QRLabel18: TQRLabel
        Left = 70
        Top = 24
        Width = 105
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          231.510416666667
          79.375
          347.265625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Participantes:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 409
        Top = 24
        Width = 60
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1352.68229166667
          79.375
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Custo Total)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 228
        Top = 24
        Width = 71
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          754.0625
          79.375
          234.817708333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Horas:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotPes: TQRLabel
        Left = 181
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
          598.619791666667
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
      object qrlTotHor: TQRLabel
        Left = 304
        Top = 24
        Width = 42
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1005.41666666667
          79.375
          138.90625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlTotHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotCus: TQRLabel
        Left = 356
        Top = 24
        Width = 45
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1177.39583333333
          79.375
          148.828125)
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
    object qrbSubTot: TQRBand [4]
      Left = 30
      Top = 218
      Width = 593
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbSubTotBeforePrint
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
        85.9895833333333
        1961.22395833333)
      BandType = rbGroupFooter
      object qrlSubCus: TQRLabel
        Left = 353
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
          1167.47395833333
          19.84375
          148.828125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubCus'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlSubHor: TQRLabel
        Left = 304
        Top = 6
        Width = 34
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1005.41666666667
          19.84375
          112.447916666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qSubHor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlMdCurs: TQRLabel
        Left = 528
        Top = 6
        Width = 30
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1746.25
          19.84375
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MdCur'
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
      object QRLabel3: TQRLabel
        Left = 181
        Top = 6
        Width = 120
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          598.619791666667
          19.84375
          396.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totais da Entidade ou Instrutor:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 439
        Top = 6
        Width = 66
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1451.90104166667
          19.84375
          218.28125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação Média:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited qrMestre: TQRGroup [5]
      Left = 30
      Top = 122
      Width = 593
      Height = 26
      Size.Values = (
        85.9895833333333
        1961.22395833333)
    end
    object qrsubdt: TQRSubDetail [6]
      Left = 30
      Top = 168
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1961.22395833333)
      Master = qr
      DataSet = tblHsttrn
      FooterBand = qrbSubTot
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText3: TQRDBText
        Left = 32
        Top = 16
        Width = 24
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          105.833333333333
          52.9166666666667
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblPessoal
        DataField = 'NOME'
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
      object QRDBText5: TQRDBText
        Left = 209
        Top = 10
        Width = 37
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          691.223958333333
          33.0729166666667
          122.369791666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DATREINI'
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
      object QRDBText6: TQRDBText
        Left = 257
        Top = 10
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          849.973958333333
          33.0729166666667
          135.598958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DATREFIM'
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
      object QRDBText8: TQRDBText
        Left = 349
        Top = 10
        Width = 50
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1154.24479166667
          33.0729166666667
          165.364583333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'TOT_CUSTO'
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
      object qrlAvTeor: TQRLabel
        Left = 408
        Top = 10
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1349.375
          33.0729166666667
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvTeor'
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
      object qrlAvPrat: TQRLabel
        Left = 442
        Top = 10
        Width = 27
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1461.82291666667
          33.0729166666667
          89.296875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvPrat'
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
      object qrlResult: TQRLabel
        Left = 480
        Top = 10
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1587.5
          33.0729166666667
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
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
      object QRDBText7: TQRDBText
        Left = 302
        Top = 10
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          998.802083333333
          33.0729166666667
          125.677083333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblHsttrn
        DataField = 'DUR_TOT'
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
      object qrlAvCurs: TQRLabel
        Left = 528
        Top = 10
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1746.25
          33.0729166666667
          99.21875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AvCurs'
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
      object QRDBText2: TQRDBText
        Left = 17
        Top = 1
        Width = 48
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          56.2239583333333
          3.30729166666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCurso
        DataField = 'DESCRICAO'
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
    inherited qrCabecalho: TQRBand [7]
      Left = 30
      Top = 90
      Width = 593
      Height = 32
      Size.Values = (
        105.833333333333
        1961.22395833333)
      inherited QrLabel4: TQRLabel
        Left = 46
        Top = 7
        Width = 71
        Height = 12
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
      inherited QrLabelFixo: TQRLabel
        Left = 1
        Top = 4
        Width = 94
        Height = 12
        Size.Values = (
          39.6875
          3.30729166666667
          13.2291666666667
          310.885416666667)
        Caption = 'Entidade ou Instrutor'
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 16
        Width = 130
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          52.9166666666667
          52.9166666666667
          429.947916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Curso / Participante do Curso'
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
      object QRLabel2: TQRLabel
        Left = 214
        Top = 17
        Width = 20
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          707.760416666667
          56.2239583333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Início'
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
      object QRLabel7: TQRLabel
        Left = 264
        Top = 17
        Width = 18
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          873.125
          56.2239583333333
          59.53125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Final'
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
      object QRLabel9: TQRLabel
        Left = 314
        Top = 17
        Width = 24
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1038.48958333333
          56.2239583333333
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Horas'
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
      object QRLabel16: TQRLabel
        Left = 365
        Top = 17
        Width = 23
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1207.16145833333
          56.2239583333333
          76.0677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Custo'
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
      object QRLabel20: TQRLabel
        Left = 413
        Top = 17
        Width = 64
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1365.91145833333
          56.2239583333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aval.Aluno (T/P)'
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
      object QRLabel21: TQRLabel
        Left = 480
        Top = 17
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1587.5
          56.2239583333333
          128.984375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado'
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
      object QRLabel22: TQRLabel
        Left = 527
        Top = 17
        Width = 46
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1742.94270833333
          56.2239583333333
          152.135416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aval. Curso'
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
    object qrchldInstrutor: TQRChildBand
      Left = 30
      Top = 200
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
      ParentBand = qrsubdt
      object qrdbInstrutor: TQRDBText
        Left = 302
        Top = 3
        Width = 280
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          998.802083333333
          9.921875
          926.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tblInstrutor
        DataField = 'NOME'
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
      object QRLabel6: TQRLabel
        Left = 263
        Top = 3
        Width = 33
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          869.817708333333
          9.921875
          109.140625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Instrutor'
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
  end
  object lstCodSelec: TListBox [1]
    Left = 303
    Top = 118
    Width = 40
    Height = 30
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 301
    Width = 428
    Height = 39
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object pnBotoes: TPanel
      Left = 181
      Top = 1
      Width = 246
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnBotoes'
      TabOrder = 0
      object bbtnOk: TBitBtn
        Left = 3
        Top = 2
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnOkClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 84
        Top = 2
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnAjuda: TmaHelpBitBtn
        Left = 165
        Top = 2
        Width = 80
        Height = 33
        Caption = '&Ajuda'
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888004444400
          888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
          408887F88877788887F88744447F74444088878888878888878F7C4444444444
          44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
          44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
          440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
          4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ClickHelpContext = 0
      end
    end
  end
  object pnlFundo: TPanel [3]
    Left = 0
    Top = 0
    Width = 428
    Height = 301
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 3
    object rgSelTudo: TRadioGroup
      Left = 34
      Top = 20
      Width = 360
      Height = 45
      Caption = 'Considerar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas as Entidades'
        'A Selecionar')
      TabOrder = 0
      OnClick = rgSelTudoClick
    end
    object gbxSelec: TGroupBox
      Left = 34
      Top = 65
      Width = 360
      Height = 216
      Caption = 'Entidades / Instrutores'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Visible = False
      object dblcSelec: TwwDBLookupCombo
        Left = 30
        Top = 21
        Width = 295
        Height = 21
        Hint = 'Informe Grupo(s) Desejado(s)'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPessoal2
        LookupField = 'NOME'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
        OnCloseUp = dblcSelecCloseUp
      end
      object lstSelec: TListBox
        Left = 30
        Top = 46
        Width = 295
        Height = 160
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnKeyDown = lstSelecKeyDown
      end
    end
  end
  object tblHsttrn: TwwTable
    OnCalcFields = tblHsttrnCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDENTIDINSTR'
    MasterFields = 'IDPESSOA'
    MasterSource = ds2
    TableName = 'CM.HSTTRN'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 83
    Top = 195
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
    object tblHsttrnVALOR: TFloatField
      FieldName = 'VALOR'
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
    object tblHsttrnLOCALCURSO: TStringField
      FieldName = 'LOCALCURSO'
      Size = 80
    end
    object tblHsttrnIDINSTRUTOR: TFloatField
      FieldName = 'IDINSTRUTOR'
    end
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    MasterFields = 'IDCURSO'
    MasterSource = ds
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 144
    Top = 195
  end
  object ds: TwwDataSource
    DataSet = tblHsttrn
    Left = 38
    Top = 195
  end
  object tblPessoal: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDPESSOA'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 197
    Top = 157
  end
  object ds2: TwwDataSource
    DataSet = qryPessoal
    Left = 270
    Top = 198
  end
  object qryPessoal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct PESSOA.IDPESSOA, PESSOA.NOME, '
      'HSTTRN.IDENTIDINSTR from PESSOA, HSTTRN '
      'where PESSOA.IDPESSOA = HSTTRN.IDENTIDINSTR '
      'order by PESSOA.NOME')
    ValidateWithMask = True
    Left = 322
    Top = 191
  end
  object qryPessoal2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select Distinct PESSOA.IDPESSOA, PESSOA.NOME, '
      'HSTTRN.IDENTIDINSTR from PESSOA, HSTTRN '
      'where PESSOA.IDPESSOA = HSTTRN.IDENTIDINSTR '
      'order by PESSOA.NOME')
    ValidateWithMask = True
    Left = 315
    Top = 136
  end
  object qryFuncio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select  IDPESSOA, CODCENTROCUSTO'
      'from FUNCIONARIO '
      'where IDPESSOA = :idpessoa')
    ValidateWithMask = True
    Left = 386
    Top = 191
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
  object tblInstrutor: TwwTable
    OnCalcFields = tblHsttrnCalcFields
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDINSTRUTOR'
    MasterSource = ds
    TableName = 'CM.PESSOA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 453
    Top = 261
  end
end
