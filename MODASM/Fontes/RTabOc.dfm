inherited relTabOc: TrelTabOc
  Left = 144
  Top = 223
  Caption = 'Listagem da Tabela de Ocorrências'
  ClientHeight = 246
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
    ReportTitle = 'Listagem da Tabela de Ocorrências, Testes e Exames'
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
        Width = 32
        Height = 12
        Size.Values = (
          39.6875
          46.3020833333333
          33.0729166666667
          105.833333333333)
        Caption = 'Código'
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 154
        Top = 10
        Width = 44
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          509.322916666667
          33.0729166666667
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descrição'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 408
        Top = 10
        Width = 76
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
          251.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Avaliação Mínima'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      Size.Values = (
        56.2239583333333
        1901.69270833333)
      object QRDBText1: TQRDBText
        Left = 10
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
          31.75
          7.9375
          97.8958333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'CODTIPOOCMED'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 91
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
          300.963541666667
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
      object QRDBText3: TQRDBText
        Left = 425
        Top = 2
        Width = 46
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1404.9375
          7.9375
          153.458333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryTabOcorr
        DataField = 'AVALMIN'
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
        Left = 91
        Top = 24
        Width = 137
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          300.963541666667
          79.375
          453.098958333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de Tipos de Ocorrência:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 242
        Top = 24
        Width = 36
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.3020833333333
          800.364583333333
          79.375
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
      'Select * from TIPOCMED order by DESCRTIPOOCMED')
    ValidateWithMask = True
    Left = 228
    Top = 5
  end
end
