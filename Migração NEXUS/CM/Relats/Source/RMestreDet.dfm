inherited relMestreDet: TrelMestreDet
  Left = 39
  Top = 192
  Caption = 'relMestreDet'
  ClientHeight = 381
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Top = -12
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      200
      2970
      100
      2100
      100
      100
      0)
    inherited PageFooterBand1: TQRBand
      Top = 190
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
        Left = -24
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
      Size.Values = (
        171.979166666667
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
        Size.Values = (
          60.8541666666667
          656.166666666667
          95.25
          587.375)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Size.Values = (
        87.3125
        1899.70833333333)
      inherited QRLabel4: TQRLabel
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Top = 169
      Size.Values = (
        55.5625
        1899.70833333333)
    end
    object qrMestre: TQRGroup
      Left = 38
      Top = 136
      Width = 718
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrMestreBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.3125
        1899.70833333333)
      Master = qr
      ReprintOnNewPage = False
    end
  end
end
