inherited frmRelPlanass: TfrmRelPlanass
  Caption = 'Relatório de Planos Assistênciais'
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    DataSet = qryplanass
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 162
      Size.Values = (
        105.833333333333
        1899.70833333333)
      inherited QRSysData1: TQRSysData
        Size.Values = (
          39.6875
          1751.54166666667
          55.5625
          148.166666666667)
        FontSize = 8
      end
      inherited QRSysData2: TQRSysData
        Size.Values = (
          39.6875
          865.1875
          55.5625
          166.6875)
        FontSize = 8
      end
      inherited qrlblIdent: TQRLabel
        Size.Values = (
          39.6875
          0
          55.5625
          420.6875)
        FontSize = 8
      end
    end
    inherited PageHeaderBand1: TQRBand
      Height = 75
      Size.Values = (
        198.4375
        1899.70833333333)
      inherited qrlblNomeCli: TQRLabel
        Size.Values = (
          60.8541666666667
          709.083333333333
          23.8125
          478.895833333333)
        FontSize = 14
      end
      inherited qrlblTitRel: TQRLabel
        Left = 217
        Width = 283
        Size.Values = (
          60.8541666666667
          574.145833333333
          95.25
          748.770833333333)
        Caption = 'Relatório de Planos Assistênciais'
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Size.Values = (
        87.3125
        1899.70833333333)
      inherited QRLabel4: TQRLabel
        Left = 152
        Top = 3
        Width = 35
        Height = 17
        Size.Values = (
          44.9791666666667
          402.166666666667
          7.9375
          92.6041666666667)
        Caption = 'Nome'
        Font.Color = clNavy
        Font.Height = -13
        Font.Style = []
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Top = 146
      Height = 16
      Size.Values = (
        42.3333333333333
        1899.70833333333)
      object QRDBText2: TQRDBText
        Left = 153
        Top = 1
        Width = 33
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          404.8125
          2.64583333333333
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryplanass
        DataField = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 113
      Width = 718
      Height = 0
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
        0
        1899.70833333333)
      BandType = rbTitle
    end
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANASS')
    ValidateWithMask = True
    Left = 96
    Top = 35
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 120
    Top = 72
  end
end
 
