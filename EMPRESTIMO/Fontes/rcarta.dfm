inherited relCarta: TrelCarta
  Left = 55
  Top = 117
  Caption = 'Carta'
  ClientHeight = 512
  ClientWidth = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    BeforePrint = qrBeforePrint
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    object DetailBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 499
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
        1320.27083333333
        1899.70833333333)
      BandType = rbDetail
      object qrdbredCarta: TQRDBRichText
        Left = 3
        Top = 3
        Width = 712
        Height = 493
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1304.39583333333
          7.9375
          7.9375
          1883.83333333333)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'TEXTO'
        DataSet = frmPRelCarta.qryCarta
      end
    end
  end
end
FParamDiverg
