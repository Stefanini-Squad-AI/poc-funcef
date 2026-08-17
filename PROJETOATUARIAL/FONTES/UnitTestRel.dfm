object Formtesterel: TFormtesterel
  Left = 115
  Top = 126
  Width = 544
  Height = 375
  Caption = 'Formtesterel'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ppViewer1: TppViewer
    Left = 195
    Top = 210
    Width = 320
    Height = 120
    Report = ppReport1
    ZoomPercentage = 100
    ZoomSetting = zsWholePage
  end
  object ppReport1: TppReport
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    Left = 205
    Top = 20
    Version = '3.52'
    mmColumnWidth = 0
    object ppReport1HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppReport1Label2: TppLabel
        Caption = 'Sistema de Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 2117
        mmWidth = 46831
        BandType = 0
      end
    end
    object ppReport1DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppReport1Label1: TppLabel
        Caption = 'Tábua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20373
        mmTop = 1323
        mmWidth = 10583
        BandType = 4
      end
      object ppReport1DBText1: TppDBText
        DataField = 'DS_TABUA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 1323
        mmWidth = 84138
        BandType = 4
      end
      object ppReport1DBText2: TppDBText
        DataField = 'SG_TABUA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 132821
        mmTop = 794
        mmWidth = 23813
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppReport1Label3: TppLabel
        Caption = 'Rodapé'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 2910
        mmWidth = 12965
        BandType = 8
      end
    end
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from fi_tabua')
    ValidateWithMask = True
    Left = 120
    Top = 15
  end
  object DataSource1: TDataSource
    DataSet = wwQuery1
    Left = 80
    Top = 15
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = DataSource1
    Left = 165
    Top = 15
  end
end
E
