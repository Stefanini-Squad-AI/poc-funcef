inherited frmRelProd: TfrmRelProd
  Caption = 'Relatório de Produtos'
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    DataSet = qryprod
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 156
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
        Left = 226
        Width = 265
        Size.Values = (
          60.8541666666667
          597.958333333333
          95.25
          701.145833333333)
        Caption = 'Relatório de Planos e Produtos'
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Height = 27
      Size.Values = (
        71.4375
        1899.70833333333)
      inherited QRLabel4: TQRLabel
        Left = 73
        Top = 4
        Width = 35
        Height = 17
        Size.Values = (
          44.9791666666667
          193.145833333333
          10.5833333333333
          92.6041666666667)
        Caption = 'Nome'
        Font.Color = clNavy
        Font.Height = -13
        Font.Style = []
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 461
        Top = 4
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1219.72916666667
          10.5833333333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descrição'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Top = 140
      Height = 16
      Size.Values = (
        42.3333333333333
        1899.70833333333)
      object QRDBText2: TQRDBText
        Left = 74
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
          195.791666666667
          2.64583333333333
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryprod
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
      object QRDBText3: TQRDBText
        Left = 461
        Top = 1
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1219.72916666667
          2.64583333333333
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryprod
        DataField = 'DESCRICAO'
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
  object qryprod: TwwQuery
    BeforeOpen = qryprodBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PRODASS.*,PLANASS.IDPLANASS'
      ' FROM PRODASS,PLANASS'
      'WHERE PLANASS.IDPRODASS = PRODASS.IDPRODASS'
      '')
    ValidateWithMask = True
    Left = 286
    Top = 57
  end
  object dsprod: TwwDataSource
    DataSet = qryprod
    Left = 310
    Top = 105
  end
end
