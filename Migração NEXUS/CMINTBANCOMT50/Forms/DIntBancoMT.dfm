object DtmIntBancoMT: TDtmIntBancoMT
  Left = 346
  Top = 167
  Width = 167
  Height = 283
  Caption = 'qryop'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnDestroy = DtmCobrancaDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RptBarrasBB: TppReport
    AutoStop = False
    DataPipeline = PpBarrasBB
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Boleto Banco do Brasil'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13350
    PrinterSetup.mmMarginLeft = 12350
    PrinterSetup.mmMarginRight = 12350
    PrinterSetup.mmMarginTop = 13350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    BeforePrint = RptBarrasBBBeforePrint
    DeviceType = 'Printer'
    OnCancel = RptBarrasBBCancel
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 106
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpBarrasBB'
    object ppReport1DetailBand1: TppDetailBand
      BeforePrint = ppReport1DetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 246592
      mmPrintPosition = 0
      object RptBarrasBBLine36: TppLine
        UserName = 'RptBarrasBBLine36'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 66675
        mmLeft = 0
        mmTop = 36248
        mmWidth = 185209
        BandType = 4
      end
      object RptBarrasBBLine41: TppLine
        UserName = 'RptBarrasBBLine41'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 75936
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine29: TppLine
        UserName = 'RptBarrasBBLine29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 89165
        mmLeft = 134938
        mmTop = 13494
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine43: TppLine
        UserName = 'RptBarrasBBLine43'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 134938
        mmTop = 88900
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine42: TppLine
        UserName = 'RptBarrasBBLine42'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 82286
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel42: TppLabel
        UserName = 'RptBarrasBBLabel42'
        Caption = '( - ) Outras Deduções / Abatimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 75671
        mmWidth = 30692
        BandType = 4
      end
      object RptBarrasBBLine48: TppLine
        UserName = 'RptBarrasBBLine48'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 69056
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine52: TppLine
        UserName = 'RptBarrasBBLine52'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 49477
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine50: TppLine
        UserName = 'RptBarrasBBLine50'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 55827
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine49: TppLine
        UserName = 'RptBarrasBBLine49'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 62442
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine21: TppLine
        UserName = 'RptBarrasBBLine21'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 57415
        mmTop = 171450
        mmWidth = 38100
        BandType = 4
      end
      object RptBarrasBBLine23: TppLine
        UserName = 'RptBarrasBBLine23'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 78581
        mmTop = 164836
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBLine22: TppLine
        UserName = 'RptBarrasBBLine22'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 57679
        mmTop = 165100
        mmWidth = 21167
        BandType = 4
      end
      object RptBarrasBBLine19: TppLine
        UserName = 'RptBarrasBBLine19'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 0
        mmTop = 165100
        mmWidth = 27781
        BandType = 4
      end
      object RptBarrasBBLine5: TppLine
        UserName = 'RptBarrasBBLine5'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 158750
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine13: TppLine
        UserName = 'RptBarrasBBLine13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 59002
        mmLeft = 134938
        mmTop = 151871
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel1: TppLabel
        UserName = 'RptBarrasBBLabel1'
        Caption = 'BANCO DO BRASIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 7408
        mmTop = 145786
        mmWidth = 38894
        BandType = 4
      end
      object RptBarrasBBLabel2: TppLabel
        UserName = 'RptBarrasBBLabel2'
        Caption = '001-9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 48683
        mmTop = 145521
        mmWidth = 15875
        BandType = 4
      end
      object RptBarrasBBLine1: TppLine
        UserName = 'RptBarrasBBLine1'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 46831
        mmTop = 145786
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine3: TppLine
        UserName = 'RptBarrasBBLine3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 150813
        mmWidth = 185473
        BandType = 4
      end
      object RptBarrasBBLine2: TppLine
        UserName = 'RptBarrasBBLine2'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 63765
        mmTop = 145786
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine4: TppLine
        UserName = 'RptBarrasBBLine4'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 152400
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine6: TppLine
        UserName = 'RptBarrasBBLine6'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 165100
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine7: TppLine
        UserName = 'RptBarrasBBLine7'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 171450
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine8: TppLine
        UserName = 'RptBarrasBBLine8'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 33867
        mmLeft = 0
        mmTop = 177536
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine9: TppLine
        UserName = 'RptBarrasBBLine9'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 15081
        mmLeft = 0
        mmTop = 210873
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine10: TppLine
        UserName = 'RptBarrasBBLine10'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 124354
        mmTop = 227542
        mmWidth = 60061
        BandType = 4
      end
      object RptBarrasBBLine11: TppLine
        UserName = 'RptBarrasBBLine11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 124354
        mmTop = 227542
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBLabel3: TppLabel
        UserName = 'RptBarrasBBLabel3'
        Caption = ' Autenticação Mecânica '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 142875
        mmTop = 226748
        mmWidth = 21696
        BandType = 4
      end
      object RptBarrasBBLine14: TppLine
        UserName = 'RptBarrasBBLine14'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 177800
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine15: TppLine
        UserName = 'RptBarrasBBLine15'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 184415
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine16: TppLine
        UserName = 'RptBarrasBBLine16'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 190765
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine17: TppLine
        UserName = 'RptBarrasBBLine17'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 135202
        mmTop = 197380
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel4: TppLabel
        UserName = 'RptBarrasBBLabel4'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 152400
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel5: TppLabel
        UserName = 'RptBarrasBBLabel5'
        Caption = 'Agência/Código Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 158750
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBLabel6: TppLabel
        UserName = 'RptBarrasBBLabel6'
        Caption = 'Nosso Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 165100
        mmWidth = 13229
        BandType = 4
      end
      object RptBarrasBBLabel7: TppLabel
        UserName = 'RptBarrasBBLabel7'
        Caption = '( = ) Valor do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 171450
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBLabel8: TppLabel
        UserName = 'RptBarrasBBLabel8'
        Caption = '( - ) Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 177800
        mmWidth = 12435
        BandType = 4
      end
      object RptBarrasBBLabel9: TppLabel
        UserName = 'RptBarrasBBLabel9'
        Caption = '( - ) Outras Deduções / Abatimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 184150
        mmWidth = 30692
        BandType = 4
      end
      object RptBarrasBBLabel10: TppLabel
        UserName = 'RptBarrasBBLabel10'
        Caption = '( + ) Mora / Multa / Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 190765
        mmWidth = 22490
        BandType = 4
      end
      object RptBarrasBBLabel11: TppLabel
        UserName = 'RptBarrasBBLabel11'
        Caption = '( + ) Outros Acréscimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 197115
        mmWidth = 21431
        BandType = 4
      end
      object RptBarrasBBLabel12: TppLabel
        UserName = 'RptBarrasBBLabel12'
        Caption = '( = ) Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 203994
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel13: TppLabel
        UserName = 'RptBarrasBBLabel13'
        Caption = 'Código de baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 146315
        mmTop = 221457
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBLabel14: TppLabel
        UserName = 'RptBarrasBBLabel14'
        Caption = '5593'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 177800
        mmTop = 220663
        mmWidth = 6350
        BandType = 4
      end
      object RptBarrasBBLabel15: TppLabel
        UserName = 'RptBarrasBBLabel15'
        Caption = 'Sacado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 212196
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel16: TppLabel
        UserName = 'RptBarrasBBLabel16'
        Caption = 'Sacador/Avalista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 222515
        mmWidth = 15610
        BandType = 4
      end
      object RptBarrasBBLabel17: TppLabel
        UserName = 'RptBarrasBBLabel17'
        Caption = 'Instruções:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 177800
        mmWidth = 9790
        BandType = 4
      end
      object RptBarrasBBLabel18: TppLabel
        UserName = 'RptBarrasBBLabel18'
        Caption = '( Texto de Responsabilidade do Cedente )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        mmHeight = 2646
        mmLeft = 11906
        mmTop = 177800
        mmWidth = 41010
        BandType = 4
      end
      object RptBarrasBBLabel19: TppLabel
        UserName = 'RptBarrasBBLabel19'
        Caption = 'Local de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 152400
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel20: TppLabel
        UserName = 'RptBarrasBBLabel20'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 158750
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel21: TppLabel
        UserName = 'RptBarrasBBLabel21'
        Caption = 'Data do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 165100
        mmWidth = 17198
        BandType = 4
      end
      object RptBarrasBBLabel22: TppLabel
        UserName = 'RptBarrasBBLabel22'
        Caption = 'Nº  da Conta/Respo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 171450
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBLine18: TppLine
        UserName = 'RptBarrasBBLine18'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 27781
        mmTop = 165100
        mmWidth = 29898
        BandType = 4
      end
      object RptBarrasBBLabel23: TppLabel
        UserName = 'RptBarrasBBLabel23'
        Caption = 'Nº do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 165100
        mmWidth = 15346
        BandType = 4
      end
      object RptBarrasBBLine20: TppLine
        UserName = 'RptBarrasBBLine20'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 28046
        mmTop = 171186
        mmWidth = 18256
        BandType = 4
      end
      object RptBarrasBBLabel24: TppLabel
        UserName = 'RptBarrasBBLabel24'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 171450
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel25: TppLabel
        UserName = 'RptBarrasBBLabel25'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 171450
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel26: TppLabel
        UserName = 'RptBarrasBBLabel26'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 58208
        mmTop = 171450
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel27: TppLabel
        UserName = 'RptBarrasBBLabel27'
        Caption = 'Espécie Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 58473
        mmTop = 165100
        mmWidth = 11377
        BandType = 4
      end
      object RptBarrasBBLabel28: TppLabel
        UserName = 'RptBarrasBBLabel28'
        Caption = 'Aceite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 79375
        mmTop = 165100
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBLabel29: TppLabel
        UserName = 'RptBarrasBBLabel29'
        Caption = 'Data do Processamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 91017
        mmTop = 165100
        mmWidth = 20902
        BandType = 4
      end
      object RptBarrasBBLabel30: TppLabel
        UserName = 'RptBarrasBBLabel30'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 171450
        mmWidth = 4763
        BandType = 4
      end
      object RptBarrasBBLabel31: TppLabel
        OnPrint = LblAceitePrint
        UserName = 'RptBarrasBBLabel31'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83344
        mmTop = 167482
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBLabel32: TppLabel
        UserName = 'RptBarrasBBLabel32'
        Caption = 'FICHA DE COMPENSAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 148432
        mmTop = 236538
        mmWidth = 35983
        BandType = 4
      end
      object RptBarrasBBLine24: TppLine
        UserName = 'RptBarrasBBLine24'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 59531
        mmTop = 32544
        mmWidth = 38100
        BandType = 4
      end
      object RptBarrasBBLine25: TppLine
        UserName = 'RptBarrasBBLine25'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 80698
        mmTop = 25929
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBLine26: TppLine
        UserName = 'RptBarrasBBLine26'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 59796
        mmTop = 26194
        mmWidth = 21167
        BandType = 4
      end
      object RptBarrasBBLine27: TppLine
        UserName = 'RptBarrasBBLine27'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 2117
        mmTop = 26194
        mmWidth = 27781
        BandType = 4
      end
      object RptBarrasBBLine28: TppLine
        UserName = 'RptBarrasBBLine28'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 19579
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLabel33: TppLabel
        UserName = 'RptBarrasBBLabel33'
        Caption = 'BANCO DO BRASIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 38894
        BandType = 4
      end
      object RptBarrasBBLabel34: TppLabel
        UserName = 'RptBarrasBBLabel34'
        Caption = '001-9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 49213
        mmTop = 6615
        mmWidth = 15875
        BandType = 4
      end
      object RptBarrasBBLine30: TppLine
        UserName = 'RptBarrasBBLine30'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 47096
        mmTop = 6879
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine31: TppLine
        UserName = 'RptBarrasBBLine31'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 265
        mmTop = 11906
        mmWidth = 185473
        BandType = 4
      end
      object RptBarrasBBLine32: TppLine
        UserName = 'RptBarrasBBLine32'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 64823
        mmTop = 6879
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine33: TppLine
        UserName = 'RptBarrasBBLine33'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 13494
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine34: TppLine
        UserName = 'RptBarrasBBLine34'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 26194
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine35: TppLine
        UserName = 'RptBarrasBBLine35'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 32544
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine37: TppLine
        UserName = 'RptBarrasBBLine37'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 15081
        mmLeft = 0
        mmTop = 105569
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine38: TppLine
        UserName = 'RptBarrasBBLine38'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 49742
        mmTop = 122238
        mmWidth = 132821
        BandType = 4
      end
      object RptBarrasBBLabel36: TppLabel
        UserName = 'RptBarrasBBLabel36'
        Caption = ' Autenticação Mecânica '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 104246
        mmTop = 121444
        mmWidth = 21696
        BandType = 4
      end
      object RptBarrasBBLine40: TppLine
        UserName = 'RptBarrasBBLine40'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 69321
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel37: TppLabel
        UserName = 'RptBarrasBBLabel37'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 49742
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel39: TppLabel
        UserName = 'RptBarrasBBLabel39'
        Caption = 'Nosso Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 56092
        mmWidth = 13229
        BandType = 4
      end
      object RptBarrasBBLabel40: TppLabel
        UserName = 'RptBarrasBBLabel40'
        Caption = '( = ) Valor do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 62706
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBLabel41: TppLabel
        UserName = 'RptBarrasBBLabel41'
        Caption = '( - ) Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 69321
        mmWidth = 12435
        BandType = 4
      end
      object RptBarrasBBLabel43: TppLabel
        UserName = 'RptBarrasBBLabel43'
        Caption = '( + ) Mora / Multa / Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 82286
        mmWidth = 22490
        BandType = 4
      end
      object RptBarrasBBLabel44: TppLabel
        UserName = 'RptBarrasBBLabel44'
        Caption = '( + ) Outros Acréscimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 88636
        mmWidth = 21431
        BandType = 4
      end
      object RptBarrasBBLabel45: TppLabel
        UserName = 'RptBarrasBBLabel45'
        Caption = '( = ) Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 95515
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel46: TppLabel
        UserName = 'RptBarrasBBLabel46'
        Caption = 'Código de baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 148432
        mmTop = 116152
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBLabel47: TppLabel
        UserName = 'RptBarrasBBLabel47'
        Caption = '5593'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 115359
        mmWidth = 6350
        BandType = 4
      end
      object RptBarrasBBLabel48: TppLabel
        UserName = 'RptBarrasBBLabel48'
        Caption = 'Sacado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 102923
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel49: TppLabel
        UserName = 'RptBarrasBBLabel49'
        Caption = 'Sacador/Avalista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 116417
        mmWidth = 15610
        BandType = 4
      end
      object RptBarrasBBLabel50: TppLabel
        UserName = 'RptBarrasBBLabel50'
        Caption = 'Instruções:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 38894
        mmWidth = 9790
        BandType = 4
      end
      object RptBarrasBBLabel51: TppLabel
        UserName = 'RptBarrasBBLabel51'
        Caption = '( Texto de Responsabilidade do Cedente )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        mmHeight = 2646
        mmLeft = 14023
        mmTop = 38894
        mmWidth = 41010
        BandType = 4
      end
      object RptBarrasBBLabel52: TppLabel
        UserName = 'RptBarrasBBLabel52'
        Caption = 'Local de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 13494
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel53: TppLabel
        UserName = 'RptBarrasBBLabel53'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 19844
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel54: TppLabel
        UserName = 'RptBarrasBBLabel54'
        Caption = 'Data do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 26194
        mmWidth = 17198
        BandType = 4
      end
      object RptBarrasBBLabel55: TppLabel
        UserName = 'RptBarrasBBLabel55'
        Caption = 'Nº  da Conta/Respo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 32544
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBLine44: TppLine
        UserName = 'RptBarrasBBLine44'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 29898
        mmTop = 26194
        mmWidth = 29898
        BandType = 4
      end
      object RptBarrasBBLabel56: TppLabel
        UserName = 'RptBarrasBBLabel56'
        Caption = 'Nº do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 30163
        mmTop = 26194
        mmWidth = 15346
        BandType = 4
      end
      object RptBarrasBBLine45: TppLine
        UserName = 'RptBarrasBBLine45'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 30163
        mmTop = 32279
        mmWidth = 18256
        BandType = 4
      end
      object RptBarrasBBLabel57: TppLabel
        UserName = 'RptBarrasBBLabel57'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 30163
        mmTop = 32544
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel58: TppLabel
        UserName = 'RptBarrasBBLabel58'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 48948
        mmTop = 32544
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel59: TppLabel
        UserName = 'RptBarrasBBLabel59'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 60325
        mmTop = 32544
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel60: TppLabel
        UserName = 'RptBarrasBBLabel60'
        Caption = 'Espécie Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 60590
        mmTop = 26194
        mmWidth = 11377
        BandType = 4
      end
      object RptBarrasBBLabel61: TppLabel
        UserName = 'RptBarrasBBLabel61'
        Caption = 'Aceite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 81492
        mmTop = 26194
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBLabel62: TppLabel
        UserName = 'RptBarrasBBLabel62'
        Caption = 'Data do Processamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 93134
        mmTop = 26194
        mmWidth = 20902
        BandType = 4
      end
      object RptBarrasBBLabel63: TppLabel
        UserName = 'RptBarrasBBLabel63'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 98425
        mmTop = 32544
        mmWidth = 4763
        BandType = 4
      end
      object LblAceite: TppLabel
        OnPrint = LblAceitePrint
        UserName = 'LblAceite'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 28575
        mmWidth = 3440
        BandType = 4
      end
      object RptBarrasBBLabel65: TppLabel
        UserName = 'RptBarrasBBLabel65'
        Caption = 'RECIBO DO SACADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 8202
        mmWidth = 28046
        BandType = 4
      end
      object RptBarrasBBLine46: TppLine
        UserName = 'RptBarrasBBLine46'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 142346
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine47: TppLine
        UserName = 'RptBarrasBBLine47'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 49477
        mmTop = 122238
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBDBText1: TppDBText
        UserName = 'RptBarrasBBDBText1'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 139436
        mmTop = 52388
        mmWidth = 28046
        BandType = 4
      end
      object RptBarrasBBDBText2: TppDBText
        UserName = 'RptBarrasBBDBText2'
        AutoSize = True
        DataField = 'rSaldo'
        DataPipeline = PpBarrasBB
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 139436
        mmTop = 65088
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBDBText4: TppDBText
        UserName = 'RptBarrasBBDBText4'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 28575
        mmWidth = 20638
        BandType = 4
      end
      object RptBarrasBBDBText5: TppDBText
        UserName = 'RptBarrasBBDBText5'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 28575
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBDBText6: TppDBText
        UserName = 'RptBarrasBBDBText6'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 28575
        mmWidth = 6879
        BandType = 4
      end
      object RptBarrasBBLabel35: TppLabel
        UserName = 'RptBarrasBBLabel35'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 33867
        mmWidth = 1852
        BandType = 4
      end
      object RptBarrasBBLabel38: TppLabel
        UserName = 'RptBarrasBBLabel38'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 94456
        mmTop = 172773
        mmWidth = 1852
        BandType = 4
      end
      object RptBarrasBBLabel66: TppLabel
        UserName = 'RptBarrasBBLabel66'
        Caption = 'Pagável Na Rede Bancária Até o Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 16404
        mmWidth = 57415
        BandType = 4
      end
      object LblCarteira: TppLabel
        OnPrint = LblCarteiraPrint
        UserName = 'LblCarteira'
        Caption = '16-019'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 35190
        mmWidth = 8731
        BandType = 4
      end
      object RptBarrasBBDBText3: TppDBText
        UserName = 'RptBarrasBBDBText3'
        DataField = 'MOESIGLA'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 34925
        mmWidth = 9260
        BandType = 4
      end
      object RptBarrasBBDBText7: TppDBText
        UserName = 'RptBarrasBBDBText7'
        AutoSize = True
        DataField = 'rSaldoOutraMoeda'
        DataPipeline = PpBarrasBB
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 61383
        mmTop = 35190
        mmWidth = 32015
        BandType = 4
      end
      object RptBarrasBBLabel69: TppLabel
        UserName = 'RptBarrasBBLabel69'
        Caption = 'Recebimento através do cheque Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 90488
        mmWidth = 30956
        BandType = 4
      end
      object RptBarrasBBLabel70: TppLabel
        UserName = 'RptBarrasBBLabel70'
        Caption = 'do banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 93398
        mmWidth = 7938
        BandType = 4
      end
      object RptBarrasBBLabel71: TppLabel
        UserName = 'RptBarrasBBLabel71'
        Caption = 
          'Esta quitação só terá validade após o pagamento do cheque pelo b' +
          'anco sacado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 96309
        mmWidth = 69586
        BandType = 4
      end
      object RptBarrasBBDBText17: TppDBText
        UserName = 'RptBarrasBBDBText17'
        DataField = 'NOME'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 105834
        mmWidth = 93663
        BandType = 4
      end
      object RptBarrasBBDBText18: TppDBText
        UserName = 'RptBarrasBBDBText18'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 105834
        mmWidth = 61913
        BandType = 4
      end
      object RptBarrasBBLabel72: TppLabel
        UserName = 'RptBarrasBBLabel72'
        Caption = 'C.G.C \ CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 105834
        mmWidth = 16669
        BandType = 4
      end
      object RptBarrasBBDBText19: TppDBText
        UserName = 'RptBarrasBBDBText19'
        DataField = 'LOGRADOURO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 109538
        mmWidth = 89165
        BandType = 4
      end
      object RptBarrasBBDBText20: TppDBText
        UserName = 'RptBarrasBBDBText20'
        DataField = 'NUMERO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 93927
        mmTop = 109538
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBDBText21: TppDBText
        UserName = 'RptBarrasBBDBText21'
        DataField = 'COMPLEMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 109538
        mmWidth = 26458
        BandType = 4
      end
      object RptBarrasBBDBText22: TppDBText
        UserName = 'RptBarrasBBDBText22'
        DataField = 'BAIRRO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 113242
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText23: TppDBText
        UserName = 'RptBarrasBBDBText23'
        DataField = 'CIDADE'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 113242
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText24: TppDBText
        UserName = 'RptBarrasBBDBText24'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 90223
        mmTop = 113242
        mmWidth = 5821
        BandType = 4
      end
      object RptBarrasBBDBText25: TppDBText
        UserName = 'RptBarrasBBDBText25'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 118269
        mmTop = 113242
        mmWidth = 17992
        BandType = 4
      end
      object RptBarrasBBDBText26: TppDBText
        UserName = 'RptBarrasBBDBText26'
        DataField = 'NOME'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 211667
        mmWidth = 93663
        BandType = 4
      end
      object RptBarrasBBDBText27: TppDBText
        UserName = 'RptBarrasBBDBText27'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 120915
        mmTop = 211667
        mmWidth = 61913
        BandType = 4
      end
      object RptBarrasBBLabel73: TppLabel
        UserName = 'RptBarrasBBLabel73'
        Caption = 'C.G.C \ CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 211667
        mmWidth = 16669
        BandType = 4
      end
      object RptBarrasBBDBText28: TppDBText
        UserName = 'RptBarrasBBDBText28'
        DataField = 'LOGRADOURO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 215371
        mmWidth = 89165
        BandType = 4
      end
      object RptBarrasBBDBText29: TppDBText
        UserName = 'RptBarrasBBDBText29'
        DataField = 'NUMERO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 215371
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBDBText30: TppDBText
        UserName = 'RptBarrasBBDBText30'
        DataField = 'COMPLEMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 215371
        mmWidth = 26458
        BandType = 4
      end
      object RptBarrasBBDBText31: TppDBText
        UserName = 'RptBarrasBBDBText31'
        DataField = 'BAIRRO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 219075
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText32: TppDBText
        UserName = 'RptBarrasBBDBText32'
        DataField = 'CIDADE'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 219075
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText33: TppDBText
        UserName = 'RptBarrasBBDBText33'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 94456
        mmTop = 219075
        mmWidth = 5821
        BandType = 4
      end
      object RptBarrasBBDBText34: TppDBText
        UserName = 'RptBarrasBBDBText34'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 122502
        mmTop = 219075
        mmWidth = 17992
        BandType = 4
      end
      object RptBarrasBBLabel74: TppLabel
        UserName = 'RptBarrasBBLabel74'
        Caption = 'Pagável Na Rede Bancária Até o Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 155311
        mmWidth = 57415
        BandType = 4
      end
      object LblEmpresa2: TppLabel
        OnPrint = LblEmpresa2Print
        UserName = 'LblEmpresa2'
        Caption = 'Empresa Proprietária do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 161132
        mmWidth = 48154
        BandType = 4
      end
      object RptBarrasBBDBText40: TppDBText
        UserName = 'RptBarrasBBDBText40'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 167482
        mmWidth = 20638
        BandType = 4
      end
      object RptBarrasBBDBText41: TppDBText
        UserName = 'RptBarrasBBDBText41'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 167482
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBDBText42: TppDBText
        UserName = 'RptBarrasBBDBText42'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 50271
        mmTop = 167482
        mmWidth = 7144
        BandType = 4
      end
      object LblCarteira2: TppLabel
        OnPrint = LblCarteiraPrint
        UserName = 'LblCarteira2'
        Caption = '16-019'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 174096
        mmWidth = 8996
        BandType = 4
      end
      object RptBarrasBBDBText43: TppDBText
        UserName = 'RptBarrasBBDBText43'
        DataField = 'MOESIGLA'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 173832
        mmWidth = 9260
        BandType = 4
      end
      object RptBarrasBBDBText44: TppDBText
        UserName = 'RptBarrasBBDBText44'
        AutoSize = True
        DataField = 'rSaldoOutraMoeda'
        DataPipeline = PpBarrasBB
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 58738
        mmTop = 174096
        mmWidth = 32015
        BandType = 4
      end
      object RptBarrasBBDBText45: TppDBText
        UserName = 'RptBarrasBBDBText45'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 139700
        mmTop = 154782
        mmWidth = 28046
        BandType = 4
      end
      object RptBarrasBBDBText46: TppDBText
        UserName = 'RptBarrasBBDBText46'
        AutoSize = True
        DataField = 'rSaldo'
        DataPipeline = PpBarrasBB
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 139700
        mmTop = 174096
        mmWidth = 11906
        BandType = 4
      end
      object LblAgenciaCedente: TppLabel
        OnPrint = LblAgenciaCedentePrint
        UserName = 'LblAgenciaCedente'
        Caption = '0.392-1 / 152.059-8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 161661
        mmWidth = 25135
        BandType = 4
      end
      object LblEmpresa: TppLabel
        OnPrint = LblEmpresa2Print
        UserName = 'LblEmpresa'
        Caption = 'Empresa Proprietária do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 21960
        mmWidth = 48154
        BandType = 4
      end
      object RptBarrasBBDBText47: TppDBText
        UserName = 'RptBarrasBBDBText47'
        AutoSize = True
        DataField = 'NOSSONUMERO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 139436
        mmTop = 58738
        mmWidth = 22754
        BandType = 4
      end
      object RptBarrasBBDBText48: TppDBText
        UserName = 'RptBarrasBBDBText48'
        AutoSize = True
        DataField = 'NOSSONUMERO'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 3440
        mmLeft = 138907
        mmTop = 167482
        mmWidth = 22754
        BandType = 4
      end
      object RptBarrasBBDBText49: TppDBText
        UserName = 'RptBarrasBBDBText49'
        AutoSize = True
        DataField = 'CODBARRADIG'
        DataPipeline = PpBarrasBB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 5027
        mmLeft = 66411
        mmTop = 146050
        mmWidth = 29633
        BandType = 4
      end
      object Barras: TppDBBarCode
        UserName = 'Barras'
        BarCodeType = bcInt2of5
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'CODBARRA'
        DataPipeline = PpBarrasBB
        PrintHumanReadable = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBarrasBB'
        mmHeight = 9260
        mmLeft = 1852
        mmTop = 227542
        mmWidth = 119327
        BandType = 4
        mmBarWidth = 381
        mmWideBarRatio = 2000
      end
      object RptBarrasBBLine51: TppLine
        UserName = 'RptBarrasBBLine51'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 243946
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBImage1: TppImage
        UserName = 'RptBarrasBBImage1'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D617022040000424D22040000000000003E000000280000004800
          0000530000000100010000000000E40300000000000000000000020000000200
          000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFF7FFFFFFFF000000F9FFFFFFE3FFFFFFFF00
          0000F8FFFFFFC0FFFFFFFF000000F87FFFFF007FFFFFFF000000F83FFFFE003F
          FFFFFF000000F807FFF8000FFFFFFF000000F803FFF00003FFFFFF000000F801
          FFC00001FFFFFF000000F800FF800000FFFFFF000000FC003E0000003FFFFF00
          0000FE003C001C000FFFFF000000FF80F0003F0007FFFF000000FFC1E0007F80
          03FFFF000000FFE38001FFC001FFFF000000FFFF0007FFF0007FFF000000FFFC
          000FFFF8001FFF000000FFF8001FFFF80007FF000000FFF0003FFFF00003FF00
          0000FFC000F1FFC00001FF000000FF8003C07F8000007F000000FE0007803E00
          00003F000000FC000F001E0000001F000000FE000700078000001F000000FF00
          038003C000003F000000FFC001E000F00000FF000000FFE0007800380003FF00
          0000FFF8003C001E0007FF000000FFFC003E000F000FFF000000FFFE00FF0003
          801FFF000000FFFF83C3C001E07FFF000000FFFFC700F00078FFFF000000FFFF
          FE0078003FFFFF000000FFFFFC003C000FFFFF000000FFFFFC000F000FFFFF00
          0000FFFFFF0003803FFFFF000000FFFFC38001E070FFFF000000FFFF01C00070
          E07FFF000000FFFF00E0007B801FFF000000FFFC0078001F000FFF000000FFF8
          001E000F0007FF000000FFE0000F4003C001FF000000FFC000038001E000FF00
          0000FF000001E00070003F000000FE00000070003C001F000000FE0000003C00
          3C001F000000FF0000003F0070003F000000FF8000003F80E0007F000000FFC0
          0000FFC1C000FF000000FFF00001FFF70003FF000000FFF80003FFFE0007FF00
          0000FFFE0003FFFC000FFF000000FFFF0003FFF8003FFF000000FFFFC000FFE0
          0071FF000000FFFFE0007FC001E0FF000000FFFFF8001F0003C03F000000FFFF
          FC000C000F001F000000FFFFFE0000001F000F000000FFFFFF8000003F800F00
          0000FFFFFFC00000FFE007000000FFFFFFF00001FFF007000000FFFFFFF80007
          FFFC07000000FFFFFFFC000FFFFE07000000FFFFFFFF001FFFFF07000000FFFF
          FFFF807FFFFFC7000000FFFFFFFFE0FFFFFFE7000000FFFFFFFFF3FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000}
        mmHeight = 8731
        mmLeft = 0
        mmTop = 3440
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBImage2: TppImage
        UserName = 'RptBarrasBBImage2'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D617022040000424D22040000000000003E000000280000004800
          0000530000000100010000000000E40300000000000000000000020000000200
          000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFF7FFFFFFFF000000F9FFFFFFE3FFFFFFFF00
          0000F8FFFFFFC0FFFFFFFF000000F87FFFFF007FFFFFFF000000F83FFFFE003F
          FFFFFF000000F807FFF8000FFFFFFF000000F803FFF00003FFFFFF000000F801
          FFC00001FFFFFF000000F800FF800000FFFFFF000000FC003E0000003FFFFF00
          0000FE003C001C000FFFFF000000FF80F0003F0007FFFF000000FFC1E0007F80
          03FFFF000000FFE38001FFC001FFFF000000FFFF0007FFF0007FFF000000FFFC
          000FFFF8001FFF000000FFF8001FFFF80007FF000000FFF0003FFFF00003FF00
          0000FFC000F1FFC00001FF000000FF8003C07F8000007F000000FE0007803E00
          00003F000000FC000F001E0000001F000000FE000700078000001F000000FF00
          038003C000003F000000FFC001E000F00000FF000000FFE0007800380003FF00
          0000FFF8003C001E0007FF000000FFFC003E000F000FFF000000FFFE00FF0003
          801FFF000000FFFF83C3C001E07FFF000000FFFFC700F00078FFFF000000FFFF
          FE0078003FFFFF000000FFFFFC003C000FFFFF000000FFFFFC000F000FFFFF00
          0000FFFFFF0003803FFFFF000000FFFFC38001E070FFFF000000FFFF01C00070
          E07FFF000000FFFF00E0007B801FFF000000FFFC0078001F000FFF000000FFF8
          001E000F0007FF000000FFE0000F4003C001FF000000FFC000038001E000FF00
          0000FF000001E00070003F000000FE00000070003C001F000000FE0000003C00
          3C001F000000FF0000003F0070003F000000FF8000003F80E0007F000000FFC0
          0000FFC1C000FF000000FFF00001FFF70003FF000000FFF80003FFFE0007FF00
          0000FFFE0003FFFC000FFF000000FFFF0003FFF8003FFF000000FFFFC000FFE0
          0071FF000000FFFFE0007FC001E0FF000000FFFFF8001F0003C03F000000FFFF
          FC000C000F001F000000FFFFFE0000001F000F000000FFFFFF8000003F800F00
          0000FFFFFFC00000FFE007000000FFFFFFF00001FFF007000000FFFFFFF80007
          FFFC07000000FFFFFFFC000FFFFE07000000FFFFFFFF001FFFFF07000000FFFF
          FFFF807FFFFFC7000000FFFFFFFFE0FFFFFFE7000000FFFFFFFFF3FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000}
        mmHeight = 8731
        mmLeft = 0
        mmTop = 142875
        mmWidth = 7408
        BandType = 4
      end
      object MemMensagem2: TppMemo
        UserName = 'MemMensagem2'
        Caption = 'MemMensagem2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 29633
        mmLeft = 0
        mmTop = 180711
        mmWidth = 134673
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object MemMensagem1: TppMemo
        UserName = 'MemMensagem1'
        Caption = 'MemMensagem1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 47625
        mmLeft = 2117
        mmTop = 42333
        mmWidth = 132821
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object LblEspeciedoc: TppLabel
        OnPrint = LblEspeciedocPrint
        UserName = 'LblEspeciedoc'
        AutoSize = False
        Caption = 'LblEspeciedoc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 28575
        mmWidth = 17727
        BandType = 4
      end
      object LblEspecieDoc2: TppLabel
        OnPrint = LblEspeciedocPrint
        UserName = 'LblEspecieDoc2'
        AutoSize = False
        Caption = 'LblEspeciedoc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 167482
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBCalc1: TppSystemVariable
        UserName = 'RptBarrasBBCalc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107156
        mmTop = 28575
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBCalc2: TppSystemVariable
        UserName = 'RptBarrasBBCalc2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 167482
        mmWidth = 14288
        BandType = 4
      end
    end
  end
  object PpBarrasBB: TppBDEPipeline
    DataSource = DsBarrasBB
    SkipWhenNoRecords = False
    UserName = 'PpBarrasBB'
    Left = 114
    Top = 56
  end
  object DsBarrasBB: TwwDataSource
    DataSet = CdsBarrasBB
    Left = 106
    Top = 104
  end
  object CprBBLaser: TCmParamReport
    Caption = 'Parâmetros Para Remessa Banco do Brasil Laser'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Número do Convênio'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Sigla do Cedente'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Carteira para Cobrança '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          '16'
          '18')
        RadioGroupSettings.Values.Strings = (
          '016'
          '018')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Aceite '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Sim'
          'Não')
        RadioGroupSettings.Values.Strings = (
          'S'
          'N')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Confere Sequencial da Remessa '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Sim'
          'Não')
        RadioGroupSettings.Values.Strings = (
          'S'
          'N')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Espécie do Título '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Apólice de Seguro'
          'Duplicata Mercantil'
          'Dupl Prest de Serv'
          'Letra de Câmbio'
          'Nota de Débito'
          'Recibo'
          'Nota de Seguro'
          'Nota Promissória')
        RadioGroupSettings.Values.Strings = (
          'AP'
          'DM'
          'DS'
          'LC'
          'ND'
          'RC'
          'SG'
          'NP')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 1
        RadioGroupSettings.Height = 80
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo de Moeda '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'FAJ TR'
          'DOLAR'
          'UPF'
          'FTR'
          'IDTR'
          'UFIR'
          'REAL'
          'UFESP')
        RadioGroupSettings.Values.Strings = (
          '01'
          '02'
          '04'
          '06'
          '07'
          '08'
          '09'
          '10')
        RadioGroupSettings.Columns = 4
        RadioGroupSettings.ItemIndex = 6
        RadioGroupSettings.Height = 60
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Forma de Impressão '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Bloqueto envelopado e expedido pelo BB'
          'Bloqueto não envelopado, expedido pelo cliente'
          'Bloqueto envelopado pelo BB e expedido pelo cliente')
        RadioGroupSettings.Values.Strings = (
          '01'
          '02'
          '03')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Data de Vencimento '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Do Documento'
          'A Vista'
          'Na Apresentação'
          'Em Branco')
        RadioGroupSettings.Values.Strings = (
          ''
          '888888'
          '999999'
          '000000')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 
          ' Fonte Para Instruções de Cobrança Fixa para a Ficha de Compensa' +
          'ção '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Normal'
          'Negrito'
          'Italico')
        RadioGroupSettings.Values.Strings = (
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Fonte Para Mensagens Fixas para o Verso do Recibo do Sacado '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Normal'
          'Negrito'
          'Italico')
        RadioGroupSettings.Values.Strings = (
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 
          ' Fonte Para Mensagen Específica do Título para o Verso do Recibo' +
          ' do Sacado '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Normal'
          'Negrito'
          'Italico')
        RadioGroupSettings.Values.Strings = (
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 
          ' Fonte Para Instruções de Cobrança Específicas da Ficha de Compe' +
          'nsação '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Normal'
          'Negrito'
          'Italico')
        RadioGroupSettings.Values.Strings = (
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Variação'
        Controle = tcMaskEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Variacao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 3
        MaskEditSettings.EditMask = '999;1; '
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 50
      end>
    ExibeMensagem = True
    Formheight = 550
    FormWidth = 525
    Left = 16
    Top = 152
  end
  object SQLParamIntBanco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' P.IDPARAMINTBANCO,'
      ' P.RECPAG,'
      ' P.IDMODELOSCNAB,'
      ' P.DESCPARAMINTBANCO,'
      ' I.VALPARAMINTBANCO,'
      ' I.CODPORTFORMA'
      'FROM'
      ' PARAMINTBANCO P,'
      
        ' (SELECT * FROM INTBANCOXPORTFORM WHERE CODPORTFORMA = :CODPORTF' +
        'ORMA ) I'
      'WHERE'
      ' (P.RECPAG          = :RECPAG) AND'
      ' (P.IDMODELOSCNAB = :IDMODELOSCNAB) AND'
      ' (P.IDPARAMINTBANCO = I.IDPARAMINTBANCO(+)) AND'
      ' (CODPORTFORMA IS NOT NULL)')
    ClientDataSet = CdsParamIntBanco
    Left = 56
    Top = 200
  end
  object CdsParamIntBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 152
  end
  object SQLBarrasBB: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      ' E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO,'
      ' E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO,'
      
        ' P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPRO' +
        'GRAMADA,'
      
        ' D.CODPORTFORMA, D.DATAVENCTO, D.DATAREMESSA, D.EMISBLOQ, D.STAT' +
        'US,'
      
        ' D.DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIP' +
        'O, D.NOSSONUMERO,'
      
        ' D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR' +
        ' AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS,'
      
        '('#39'01234567890123456789012345678901234567890123'#39') AS CODBARRA, (0' +
        ') As rSaldo, (0) As rSaldoOutraMoeda,'
      
        '('#39'00186.99595  90309.403922  00152.059168                       ' +
        '               000'#39') AS CODBARRADIG, ('#39' '#39') AS FLGGRUPO'
      'FROM'
      'ENDPESS E, CIDADES C, ESTADO ES,'
      'PESSOA P,'
      'DOCUMENTO D,'
      'PORTADORFORMA F ,'
      'MOEDA M,'
      'AGENCIABANCARIA AB,'
      'PORTADORCONTA PC'
      'WHERE 1=2'
      ''
      ' '
      ' ')
    ClientDataSet = CdsBarrasBB
    Left = 104
    Top = 200
  end
  object CdsBarrasBB: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 152
  end
  object sqlValMaximo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    VALORMAXIMO, CODFORMAPAGTO, '
      '    CODFORMAPGTOALT, DMAISALT, DMAIS,  '
      '    FLGFLOATARQBANC, FLGDATATDEBCRED'
      'FROM PORTADORFORMA '
      'WHERE CODPORTFORMA = :CODPORTFORMA')
    ClientDataSet = cdsValMaximo
    Left = 24
    Top = 16
  end
  object cdsValMaximo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 56
  end
end
