inherited frmRelProdAnalit: TfrmRelProdAnalit
  Left = 16
  Top = 96
  Caption = 'Relatório de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qr: TQuickRep
    Left = 29
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
      Top = 243
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
      inherited qrlblTitRel: TQRSysData
        Top = 44
        Size.Values = (
          60.8541666666667
          809.625
          116.416666666667
          277.8125)
        FontSize = 14
      end
    end
    inherited qrCabecalho: TQRBand
      Top = 113
      Size.Values = (
        87.3125
        1899.70833333333)
      inherited QRLabelFixo: TQRLabel
        Size.Values = (
          39.6875
          150.8125
          23.8125
          235.479166666667)
        FontSize = 8
      end
    end
    inherited DetailBand1: TQRBand
      Top = 147
      Height = 16
      Size.Values = (
        42.3333333333333
        1899.70833333333)
      object QRDBText1: TQRDBText
        Left = 17
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
          44.9791666666667
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
    end
    inherited qrMestre: TQRGroup
      Top = 146
      Height = 1
      Size.Values = (
        2.64583333333333
        1899.70833333333)
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
    object qrsubdt: TQRSubDetail
      Left = 38
      Top = 187
      Width = 718
      Height = 16
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
        42.3333333333333
        1899.70833333333)
      Master = qr
      DataSet = qryplanass
      HeaderBand = GroupHeaderBand1
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText2: TQRDBText
        Left = 226
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
          597.958333333333
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
    object GroupHeaderBand1: TQRBand
      Left = 38
      Top = 163
      Width = 718
      Height = 24
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
        63.5
        1899.70833333333)
      BandType = rbGroupHeader
      object QRLabel5: TQRLabel
        Left = 225
        Top = 3
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          595.3125
          7.9375
          288.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plano Assistencial'
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
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 227
      Width = 718
      Height = 16
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
        42.3333333333333
        1899.70833333333)
      Master = qrsubdt
      DataSet = qryforn
      HeaderBand = GroupHeaderBand2
      PrintBefore = False
      PrintIfEmpty = False
      object QRDBText3: TQRDBText
        Left = 528
        Top = 2
        Width = 85
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1397
          5.29166666666667
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryforn
        DataField = 'NOMEFANTASIA'
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
    object GroupHeaderBand2: TQRBand
      Left = 38
      Top = 203
      Width = 718
      Height = 24
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
        63.5
        1899.70833333333)
      BandType = rbGroupHeader
      object QRLabel6: TQRLabel
        Left = 529
        Top = 3
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1399.64583333333
          7.9375
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fornecedores'
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
  end
  object qryprod: TwwQuery
    BeforeOpen = qryprodBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select PRODASS.*,PLANASS.IDPLANASS from prodass,PLANASS'
      'WHERE PLANASS.IDPRODASS = PRODASS.IDPRODASS')
    ValidateWithMask = True
    Left = 126
    Top = 18
  end
  object dsprod: TwwDataSource
    DataSet = qryprod
    Left = 142
    Top = 42
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsprod
    SQL.Strings = (
      'SELECT  * FROM PLANASS'
      'WHERE IDPRODASS =  :IDPRODASS')
    Params.Data = {0100010009494450524F444153530006080000000000000000000100}
    ValidateWithMask = True
    Left = 246
    Top = 2
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 262
    Top = 53
  end
  object qryforn: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsplanass
    SQL.Strings = (
      'select * from fornserv'
      'where idpessoa  =  :idFORNSERV')
    Params.Data = {010001000A4944464F524E534552560006080000000000000000000100}
    ValidateWithMask = True
    Left = 382
    Top = 50
  end
  object dsforn: TwwDataSource
    DataSet = qryforn
    Left = 486
    Top = 90
  end
end
P
