inherited relTabPer: TrelTabPer
  Left = 140
  Top = 228
  Caption = 'Listagem da Tabela de Periodicidades'
  ClientHeight = 280
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Width = 635
    Height = 898
    DataSet = qryTabOcorr
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
    ReportTitle = 'Listagem da Tabela de Periodicidades de Exames e Testes '
    Zoom = 80
    inherited PageFooterBand1: TQRBand
      Left = 30
      Top = 179
      Width = 575
      Height = 32
      Size.Values = (
        105.833333333333
        1901.69270833333)
      inherited QRSysData1: TQRSysData
        Left = 530
        Top = 17
        Width = 45
        Height = 12
        Size.Values = (
          39.6875
          1752.86458333333
          56.2239583333333
          148.828125)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Left = 262
        Top = 17
        Width = 50
        Height = 12
        Size.Values = (
          39.6875
          866.510416666667
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
      Width = 575
      Height = 62
      Size.Values = (
        205.052083333333
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
      inherited qrlblTitRel: TQRSysData
        Left = 245
        Top = 29
        Width = 84
        Height = 18
        Size.Values = (
          59.53125
          810.286458333333
          95.9114583333333
          277.8125)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Left = 30
      Top = 92
      Width = 575
      Height = 26
      Size.Values = (
        85.9895833333333
        1901.69270833333)
      inherited QRLabelFixo: TQRLabel
        Left = 14
        Top = 10
        Width = 44
        Height = 12
        Size.Values = (
          39.6875
          46.3020833333333
          33.0729166666667
          145.520833333333)
        Caption = 'Descrição'
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 170
        Top = 9
        Width = 54
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          562.239583333333
          29.765625
          178.59375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Baseado Em'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 240
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
          793.75
          6.61458333333333
          72.7604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Faixa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 235
        Top = 17
        Width = 30
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          777.213541666667
          56.2239583333333
          99.21875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Anos)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 274
        Top = 2
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          906.197916666667
          6.61458333333333
          115.755208333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Período'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 274
        Top = 17
        Width = 38
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          906.197916666667
          56.2239583333333
          125.677083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Meses}'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 326
        Top = 2
        Width = 31
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1078.17708333333
          6.61458333333333
          102.526041666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Centro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 322
        Top = 17
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1064.94791666667
          56.2239583333333
          135.598958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'de Custo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 377
        Top = 10
        Width = 134
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1246.84895833333
          33.0729166666667
          443.177083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo (Em Branco, para todos)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Left = 30
      Top = 118
      Width = 575
      Height = 17
      BeforePrint = DetailBand1BeforePrint
      Size.Values = (
        56.2239583333333
        1901.69270833333)
      object qrlBaseado: TQRLabel
        Left = 173
        Top = 2
        Width = 51
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          571.5
          7.9375
          169.333333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlBaseado'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 5
        Top = 2
        Width = 98
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          16.5364583333333
          6.61458333333333
          324.114583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'DESCRTIPOOCMED'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 233
        Top = 2
        Width = 18
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          769.9375
          7.9375
          58.2083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'LIMINFERIOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 254
        Top = 2
        Width = 15
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          841.375
          7.9375
          50.2708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'LIMSUPERIOR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 274
        Top = 2
        Width = 30
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          904.875
          7.9375
          97.8958333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'PERIODO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 317
        Top = 2
        Width = 56
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1047.75
          7.9375
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'CODCENTROCUSTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 379
        Top = 2
        Width = 35
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          1253.46354166667
          6.61458333333333
          115.755208333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tblCargo
        DataField = 'TITULO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbTotais: TQRBand
      Left = 30
      Top = 135
      Width = 575
      Height = 44
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
        145.520833333333
        1901.69270833333)
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 62
        Top = 22
        Width = 206
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          205.052083333333
          72.7604166666667
          681.302083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Tipos de Exame (e suas variações):'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 281
        Top = 22
        Width = 36
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          929.348958333333
          72.7604166666667
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
  end
  object qryTabOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    OnFilterRecord = qryTabOcorrFilterRecord
    SQL.Strings = (
      'Select * from TIPOCMED, PEREXAME '
      'where TIPOCMED.CODTIPOOCMED = PEREXAME.CODTIPOOCMED '
      'order by TIPOCMED.DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 219
    Top = 8
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 519
    Top = 12
  end
  object ds: TwwDataSource
    DataSet = qryTabOcorr
    Left = 147
    Top = 9
  end
end
