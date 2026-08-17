inherited dtmRelExtratoDesligamento: TdtmRelExtratoDesligamento
  Left = 341
  Top = 192
  Width = 478
  Height = 352
  Caption = 'dtmRelExtratoDesligamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 165
    Top = 8
  end
  inherited dsExemplo: TwwDataSource
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = 1')
    Left = 26
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 234
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object ppRelDesligamento: TppReport
    AutoStop = False
    DataPipeline = ppRegReplan
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    BeforePrint = ppRelDesligamentoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 224
    Top = 112
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppRegReplan'
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 68792
      mmPrintPosition = 0
      object ppSubRegReplan: TppSubReport
        UserName = 'SubRegReplan'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 168
          Top = 88
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 22225
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 200555
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'Shape7'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 35454
              mmWidth = 196850
              BandType = 4
            end
            object ppShape8: TppShape
              UserName = 'Shape8'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 40746
              mmWidth = 33073
              BandType = 4
            end
            object ppShape9: TppShape
              UserName = 'Shape9'
              mmHeight = 5821
              mmLeft = 33338
              mmTop = 40746
              mmWidth = 38365
              BandType = 4
            end
            object ppShape10: TppShape
              UserName = 'Shape10'
              mmHeight = 5821
              mmLeft = 71438
              mmTop = 40746
              mmWidth = 38365
              BandType = 4
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              mmHeight = 5821
              mmLeft = 109538
              mmTop = 40746
              mmWidth = 38365
              BandType = 4
            end
            object ppShape12: TppShape
              UserName = 'Shape12'
              mmHeight = 5821
              mmLeft = 147373
              mmTop = 40746
              mmWidth = 50006
              BandType = 4
            end
            object ppShape13: TppShape
              UserName = 'Shape13'
              mmHeight = 11377
              mmLeft = 529
              mmTop = 46302
              mmWidth = 33073
              BandType = 4
            end
            object ppShape14: TppShape
              UserName = 'Shape14'
              mmHeight = 11377
              mmLeft = 33338
              mmTop = 46302
              mmWidth = 38365
              BandType = 4
            end
            object ppShape15: TppShape
              UserName = 'Shape101'
              mmHeight = 11377
              mmLeft = 71438
              mmTop = 46302
              mmWidth = 38365
              BandType = 4
            end
            object ppShape19: TppShape
              UserName = 'Shape19'
              mmHeight = 11377
              mmLeft = 109538
              mmTop = 46302
              mmWidth = 38100
              BandType = 4
            end
            object ppShape21: TppShape
              UserName = 'Shape21'
              mmHeight = 11377
              mmLeft = 147373
              mmTop = 46302
              mmWidth = 50006
              BandType = 4
            end
            object ppShape25: TppShape
              UserName = 'Shape25'
              mmHeight = 10848
              mmLeft = 529
              mmTop = 57415
              mmWidth = 196850
              BandType = 4
            end
            object ppShape26: TppShape
              UserName = 'Shape26'
              mmHeight = 22490
              mmLeft = 529
              mmTop = 67998
              mmWidth = 196850
              BandType = 4
            end
            object ppShape27: TppShape
              UserName = 'Shape27'
              mmHeight = 22225
              mmLeft = 529
              mmTop = 90223
              mmWidth = 196850
              BandType = 4
            end
            object ppShape28: TppShape
              UserName = 'Shape28'
              mmHeight = 20373
              mmLeft = 529
              mmTop = 112184
              mmWidth = 196850
              BandType = 4
            end
            object ppShape29: TppShape
              UserName = 'Shape29'
              mmHeight = 11906
              mmLeft = 529
              mmTop = 132292
              mmWidth = 196850
              BandType = 4
            end
            object ppShape30: TppShape
              UserName = 'Shape30'
              mmHeight = 10848
              mmLeft = 529
              mmTop = 143934
              mmWidth = 196850
              BandType = 4
            end
            object ppShape31: TppShape
              UserName = 'Shape31'
              mmHeight = 11113
              mmLeft = 529
              mmTop = 154517
              mmWidth = 196850
              BandType = 4
            end
            object ppShape32: TppShape
              UserName = 'Shape32'
              mmHeight = 15081
              mmLeft = 529
              mmTop = 165365
              mmWidth = 196850
              BandType = 4
            end
            object ppShape33: TppShape
              UserName = 'Shape33'
              mmHeight = 11377
              mmLeft = 529
              mmTop = 180182
              mmWidth = 196850
              BandType = 4
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'I - BENEFÍCIO PROPORCIONAL DIFERIDO - BPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 19579
              mmWidth = 65352
              BandType = 4
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'Reserva matemática'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 35190
              mmTop = 42069
              mmWidth = 34396
              BandType = 4
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Reserva de poupança'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 73819
              mmTop = 42069
              mmWidth = 33073
              BandType = 4
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Reserva para o BPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 113506
              mmTop = 42069
              mmWidth = 29633
              BandType = 4
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Valor do BPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 160867
              mmTop = 42069
              mmWidth = 22490
              BandType = 4
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Reais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 10583
              mmTop = 49477
              mmWidth = 8975
              BandType = 4
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Reserva para o BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 59002
              mmWidth = 29898
              BandType = 4
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 
                'Corresponde a reserva mais vantajosa entre a reserva matemática ' +
                'e a reserva de poupança.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 3440
              mmTop = 63500
              mmWidth = 139171
              BandType = 4
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Valor do BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 69056
              mmWidth = 19844
              BandType = 4
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 
                'O valor do BPD informado neste extrato resulta de SIMULAÇÃO prod' +
                'uzida com base em premissas e hipóteses atuariais vigentes na da' +
                'ta-base do cálculo, podendo sofrer alterações decorrentes de mud' +
                'anças nessas premissas e hipóteses.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7144
              mmLeft = 3440
              mmTop = 73819
              mmWidth = 186267
              BandType = 4
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 
                'Critério de cálculo do benefício de prestação continuada decorre' +
                'nte do BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 91811
              mmWidth = 111654
              BandType = 4
            end
            object ppLabel32: TppLabel
              UserName = 'Label301'
              Caption = 
                'Cobertura do risco de invalidez ou morte durante o período de di' +
                'ferimento: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 114300
              mmWidth = 111390
              BandType = 4
            end
            object ppLabel34: TppLabel
              UserName = 'Label302'
              Caption = 'Custeio Administrativo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 132821
              mmWidth = 36513
              BandType = 4
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 
                'Na data da opção pelo BPD, será deduzido da reserva matemática o' +
                ' valor equivalente à taxa administrativa, referente ao período d' +
                'e diferimento, nos termos definidos no plano de custeio e normat' +
                'ivos internos.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7144
              mmLeft = 3440
              mmTop = 136525
              mmWidth = 194998
              BandType = 4
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'Data base do cálculo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 145786
              mmWidth = 35454
              BandType = 4
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              Caption = 'Critério de atualização do BPD no período de diferimento:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 155840
              mmWidth = 85461
              BandType = 4
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              Caption = 
                'A reserva para o BPD será atualizada pelo índice do plano, acres' +
                'cida da taxa de juros do plano vigente na data da opção pelo BPD' +
                '.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 3440
              mmTop = 160338
              mmWidth = 170392
              BandType = 4
            end
            object ppLabel39: TppLabel
              UserName = 'Label39'
              Caption = 
                'Critério de atualização do benefício decorrente da opção pelo BP' +
                'D: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 167482
              mmWidth = 97896
              BandType = 4
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 
                'Após a concessão do benefício de prestação continuada decorrente' +
                ' do BPD, o benefício será reajustado em conformidade com o índic' +
                'e aplicável ao empregado do patrocinador na data prevista pelo a' +
                'cordo coletivo de trabalho.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7408
              mmLeft = 3440
              mmTop = 172244
              mmWidth = 192617
              BandType = 4
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 
                'Requisito para elegibilidade ao benefício decorrente da opção pe' +
                'lo BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3704
              mmTop = 181240
              mmWidth = 113771
              BandType = 4
            end
            object ppLabel42: TppLabel
              UserName = 'Label42'
              Caption = 'Estiver em gozo de benefício por órgão oficial de previdência.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 3704
              mmTop = 186002
              mmWidth = 84931
              BandType = 4
            end
            object ppShape1: TppShape
              UserName = 'Shape1'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 1852
              mmWidth = 196850
              BandType = 4
            end
            object ppShape2: TppShape
              UserName = 'Shape2'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 7408
              mmWidth = 65881
              BandType = 4
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 5821
              mmLeft = 66146
              mmTop = 7408
              mmWidth = 131234
              BandType = 4
            end
            object ppShape4: TppShape
              UserName = 'Shape4'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 12965
              mmWidth = 196850
              BandType = 4
            end
            object ppShape5: TppShape
              UserName = 'Shape5'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 18521
              mmWidth = 196850
              BandType = 4
            end
            object ppShape6: TppShape
              UserName = 'Shape6'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 24077
              mmWidth = 196850
              BandType = 4
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'EXTRATO DOS INSTITUTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 80169
              mmTop = 3175
              mmWidth = 37835
              BandType = 4
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Matrícula:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 8466
              mmWidth = 14288
              BandType = 4
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Nome:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 68263
              mmTop = 8466
              mmWidth = 9260
              BandType = 4
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Patrocinador: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 14552
              mmWidth = 19262
              BandType = 4
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Plano de Benefícios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 19844
              mmWidth = 29633
              BandType = 4
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Data da rescisão contratual:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 25400
              mmWidth = 40481
              BandType = 4
            end
            object ppSubRegReplan2: TppSubReport
              UserName = 'SubRegReplan2'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              mmHeight = 5027
              mmLeft = 0
              mmTop = 192352
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport4: TppChildReport
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Left = 200
                Top = 120
                Version = '7.04'
                mmColumnWidth = 0
                object ppTitleBand4: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 1323
                  mmPrintPosition = 0
                end
                object ppDetailBand5: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 207963
                  mmPrintPosition = 0
                  object ppShape34: TppShape
                    UserName = 'Shape34'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 8731
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape35: TppShape
                    UserName = 'Shape35'
                    mmHeight = 5821
                    mmLeft = 34925
                    mmTop = 14288
                    mmWidth = 82286
                    BandType = 4
                  end
                  object ppShape36: TppShape
                    UserName = 'Shape102'
                    mmHeight = 5821
                    mmLeft = 115094
                    mmTop = 14288
                    mmWidth = 82286
                    BandType = 4
                  end
                  object ppShape39: TppShape
                    UserName = 'Shape39'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 19844
                    mmWidth = 34925
                    BandType = 4
                  end
                  object ppShape40: TppShape
                    UserName = 'Shape40'
                    mmHeight = 11377
                    mmLeft = 34925
                    mmTop = 19844
                    mmWidth = 82286
                    BandType = 4
                  end
                  object ppShape41: TppShape
                    UserName = 'Shape41'
                    mmHeight = 11377
                    mmLeft = 115094
                    mmTop = 19844
                    mmWidth = 82286
                    BandType = 4
                  end
                  object ppLabel43: TppLabel
                    UserName = 'Label43'
                    Caption = 'II - PORTABILIDADE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3439
                    mmTop = 10054
                    mmWidth = 27136
                    BandType = 4
                  end
                  object ppLabel44: TppLabel
                    UserName = 'Label44'
                    Caption = 'Valor a ser portado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 60854
                    mmTop = 15610
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel45: TppLabel
                    UserName = 'Label45'
                    Caption = 'Valor portado de outro plano'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 132292
                    mmTop = 15346
                    mmWidth = 50271
                    BandType = 4
                  end
                  object ppLabel48: TppLabel
                    UserName = 'Label201'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 10583
                    mmTop = 23813
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape49: TppShape
                    UserName = 'Shape49'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 14288
                    mmWidth = 34925
                    BandType = 4
                  end
                  object ppShape37: TppShape
                    UserName = 'Shape37'
                    mmHeight = 18521
                    mmLeft = 265
                    mmTop = 30956
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape38: TppShape
                    UserName = 'Shape301'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 49213
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel46: TppLabel
                    UserName = 'Label46'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 51065
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape45: TppShape
                    UserName = 'Shape45'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 59796
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel47: TppLabel
                    UserName = 'Label47'
                    Caption = 'Critério de atualização até a efetiva transferência: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 61383
                    mmWidth = 85725
                    BandType = 4
                  end
                  object ppLabel50: TppLabel
                    UserName = 'Label50'
                    Caption = 'Critério de cálculo do valor a ser portado: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 32808
                    mmWidth = 69056
                    BandType = 4
                  end
                  object ppLabel51: TppLabel
                    UserName = 'Label51'
                    Caption = 
                      'O valor a ser portado será igual à reserva de poupança, ou à res' +
                      'erva matemática limitada a duas vezes o valor da reserva de poup' +
                      'ança.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    WordWrap = True
                    mmHeight = 10848
                    mmLeft = 3175
                    mmTop = 36777
                    mmWidth = 191559
                    BandType = 4
                  end
                  object ppLabel52: TppLabel
                    UserName = 'Label52'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 66146
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppShape46: TppShape
                    UserName = 'Shape46'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 76994
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape48: TppShape
                    UserName = 'Shape48'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 91546
                    mmWidth = 22225
                    BandType = 4
                  end
                  object ppShape50: TppShape
                    UserName = 'Shape401'
                    mmHeight = 9260
                    mmLeft = 21960
                    mmTop = 82550
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppLabel53: TppLabel
                    UserName = 'Label53'
                    Caption = 'III - RESGATE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3439
                    mmTop = 78317
                    mmWidth = 18500
                    BandType = 4
                  end
                  object ppLabel55: TppLabel
                    UserName = 'Label55'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 5821
                    mmTop = 94986
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape54: TppShape
                    UserName = 'Shape54'
                    mmHeight = 9260
                    mmLeft = 51065
                    mmTop = 82550
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape55: TppShape
                    UserName = 'Shape55'
                    mmHeight = 9260
                    mmLeft = 79640
                    mmTop = 82550
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape56: TppShape
                    UserName = 'Shape56'
                    mmHeight = 9260
                    mmLeft = 108744
                    mmTop = 82550
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape57: TppShape
                    UserName = 'Shape57'
                    mmHeight = 9260
                    mmLeft = 137848
                    mmTop = 82550
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape58: TppShape
                    UserName = 'Shape58'
                    mmHeight = 9260
                    mmLeft = 166952
                    mmTop = 82550
                    mmWidth = 30427
                    BandType = 4
                  end
                  object ppShape47: TppShape
                    UserName = 'Shape47'
                    mmHeight = 9260
                    mmLeft = 265
                    mmTop = 82550
                    mmWidth = 21960
                    BandType = 4
                  end
                  object ppLabel56: TppLabel
                    UserName = 'Label56'
                    Caption = 'Valor de Resgate tributável '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7938
                    mmLeft = 23283
                    mmTop = 83344
                    mmWidth = 26194
                    BandType = 4
                  end
                  object ppLabel57: TppLabel
                    UserName = 'Label57'
                    Caption = 'Valor de Resgate não tributável'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 8202
                    mmLeft = 51594
                    mmTop = 83079
                    mmWidth = 27781
                    BandType = 4
                  end
                  object ppLabel58: TppLabel
                    UserName = 'Label58'
                    Caption = 'Resgate    Bruto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7144
                    mmLeft = 88106
                    mmTop = 83608
                    mmWidth = 12171
                    BandType = 4
                  end
                  object ppLabel60: TppLabel
                    UserName = 'Label60'
                    Caption = 'Descontos Empréstimo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7144
                    mmLeft = 142875
                    mmTop = 83608
                    mmWidth = 18256
                    BandType = 4
                  end
                  object ppLabel61: TppLabel
                    UserName = 'Label61'
                    Caption = 'Valor Líquido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7673
                    mmLeft = 173567
                    mmTop = 83344
                    mmWidth = 15610
                    BandType = 4
                  end
                  object ppShape52: TppShape
                    UserName = 'Shape52'
                    mmHeight = 11377
                    mmLeft = 21960
                    mmTop = 91546
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape53: TppShape
                    UserName = 'Shape53'
                    mmHeight = 11377
                    mmLeft = 51065
                    mmTop = 91546
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape59: TppShape
                    UserName = 'Shape59'
                    mmHeight = 11377
                    mmLeft = 79640
                    mmTop = 91546
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape60: TppShape
                    UserName = 'Shape60'
                    mmHeight = 11642
                    mmLeft = 108744
                    mmTop = 91546
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape61: TppShape
                    UserName = 'Shape601'
                    mmHeight = 11642
                    mmLeft = 137848
                    mmTop = 91546
                    mmWidth = 29369
                    BandType = 4
                  end
                  object ppShape62: TppShape
                    UserName = 'Shape62'
                    mmHeight = 11642
                    mmLeft = 166952
                    mmTop = 91546
                    mmWidth = 30427
                    BandType = 4
                  end
                  object ppShape69: TppShape
                    UserName = 'Shape69'
                    mmHeight = 18785
                    mmLeft = 265
                    mmTop = 102659
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape70: TppShape
                    UserName = 'Shape70'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 121179
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel63: TppLabel
                    UserName = 'Label63'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 122767
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape71: TppShape
                    UserName = 'Shape701'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 131763
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel64: TppLabel
                    UserName = 'Label64'
                    Caption = 
                      'Critério de atualização entre a data do cálculo e o efetivo paga' +
                      'mento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 133086
                    mmWidth = 113771
                    BandType = 4
                  end
                  object ppShape72: TppShape
                    UserName = 'Shape72'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 142346
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel65: TppLabel
                    UserName = 'Label65'
                    Caption = 'Prazo para pagamento: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 143669
                    mmWidth = 37835
                    BandType = 4
                  end
                  object ppLabel66: TppLabel
                    UserName = 'Label66'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 137848
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel67: TppLabel
                    UserName = 'Label67'
                    Caption = 'Até 30 dias'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 148167
                    mmWidth = 26194
                    BandType = 4
                  end
                  object ppShape73: TppShape
                    UserName = 'Shape73'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 158486
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel68: TppLabel
                    UserName = 'Label68'
                    Caption = 'IV - AUTOPATROCÍNIO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 3175
                    mmTop = 159809
                    mmWidth = 30692
                    BandType = 4
                  end
                  object ppShape74: TppShape
                    UserName = 'Shape74'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 164042
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel69: TppLabel
                    UserName = 'Label69'
                    Caption = 'Salário de Participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 3175
                    mmTop = 165629
                    mmWidth = 29104
                    BandType = 4
                  end
                  object ppLabel70: TppLabel
                    UserName = 'Label70'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 170127
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppShape75: TppShape
                    UserName = 'Shape75'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 174361
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape76: TppShape
                    UserName = 'Shape76'
                    mmHeight = 5556
                    mmLeft = 265
                    mmTop = 184680
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape77: TppShape
                    UserName = 'Shape77'
                    mmHeight = 5556
                    mmLeft = 265
                    mmTop = 189971
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape78: TppShape
                    UserName = 'Shape78'
                    mmHeight = 5556
                    mmLeft = 265
                    mmTop = 195263
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape80: TppShape
                    UserName = 'Shape80'
                    mmHeight = 5556
                    mmLeft = 98690
                    mmTop = 184680
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape81: TppShape
                    UserName = 'Shape81'
                    mmHeight = 5556
                    mmLeft = 98690
                    mmTop = 189971
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape82: TppShape
                    UserName = 'Shape82'
                    mmHeight = 5556
                    mmLeft = 98690
                    mmTop = 195263
                    mmWidth = 98690
                    BandType = 4
                  end
                  object ppShape84: TppShape
                    UserName = 'Shape84'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 200555
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel71: TppLabel
                    UserName = 'Label701'
                    Caption = 'Salário de Participação - critério de atualização: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3440
                    mmTop = 175948
                    mmWidth = 83079
                    BandType = 4
                  end
                  object ppLabel72: TppLabel
                    UserName = 'Label72'
                    Caption = 
                      'Reajustado de acordo com as condições aplicáveis aos empregados ' +
                      'do patrocinador (§ 6º Art. 61 do REG/REPLAN).'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 3440
                    mmTop = 180446
                    mmWidth = 156104
                    BandType = 4
                  end
                  object ppLabel73: TppLabel
                    UserName = 'Label73'
                    Caption = 'Contribuição'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 185738
                    mmWidth = 21960
                    BandType = 4
                  end
                  object ppLabel74: TppLabel
                    UserName = 'Label74'
                    Caption = 'Valor Inicial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 101071
                    mmTop = 185738
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppLabel75: TppLabel
                    UserName = 'Label75'
                    Caption = 'Participante'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 191030
                    mmWidth = 15081
                    BandType = 4
                  end
                  object ppLabel76: TppLabel
                    UserName = 'Label76'
                    Caption = 'Patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 196321
                    mmWidth = 16140
                    BandType = 4
                  end
                  object ppLabel78: TppLabel
                    UserName = 'Label78'
                    Caption = 
                      'O valor constante no campo acima, contribuições em aberto, refer' +
                      'e-se as contribuições do período da data da rescisão a data de e' +
                      'missão desse extrato.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 3175
                    mmTop = 202407
                    mmWidth = 184415
                    BandType = 4
                  end
                  object ppLabel79: TppLabel
                    UserName = 'Label79'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 101071
                    mmTop = 191030
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel80: TppLabel
                    UserName = 'Label80'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 101071
                    mmTop = 196321
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel59: TppLabel
                    UserName = 'Label59'
                    Caption = 'IRRF'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 119856
                    mmTop = 85725
                    mmWidth = 6604
                    BandType = 4
                  end
                  object ppDBText10: TppDBText
                    UserName = 'DBText10'
                    OnGetText = ppDBText10GetText
                    AutoSize = True
                    DataField = 'VALORPORTADOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4022
                    mmLeft = 59806
                    mmTop = 23283
                    mmWidth = 31538
                    BandType = 4
                  end
                  object ppDBText11: TppDBText
                    UserName = 'DBText11'
                    OnGetText = ppDBText11GetText
                    AutoSize = True
                    DataField = 'VALORPORTADOOUTROPLANOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4022
                    mmLeft = 126805
                    mmTop = 23283
                    mmWidth = 56219
                    BandType = 4
                  end
                  object ppDBText14: TppDBText
                    UserName = 'DBText14'
                    AutoSize = True
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4022
                    mmLeft = 3440
                    mmTop = 55298
                    mmWidth = 27559
                    BandType = 4
                  end
                  object ppDBText15: TppDBText
                    UserName = 'DBText15'
                    OnGetText = GetTextGeral
                    DataField = 'VALORRESGATETRIBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 23019
                    mmTop = 94986
                    mmWidth = 26988
                    BandType = 4
                  end
                  object ppDBText17: TppDBText
                    UserName = 'DBText17'
                    OnGetText = GetTextGeral
                    DataField = 'VALORRESGATENAOTRIBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 52123
                    mmTop = 94986
                    mmWidth = 26723
                    BandType = 4
                  end
                  object ppDBText19: TppDBText
                    UserName = 'DBText19'
                    OnGetText = GetTextGeral
                    DataField = 'VALORRESGATEBRUTOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 80433
                    mmTop = 94986
                    mmWidth = 27252
                    BandType = 4
                  end
                  object ppDBText21: TppDBText
                    UserName = 'DBText21'
                    OnGetText = GetTextGeral
                    DataField = 'VALORIRRFQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 109538
                    mmTop = 94986
                    mmWidth = 27252
                    BandType = 4
                  end
                  object ppDBText23: TppDBText
                    UserName = 'DBText23'
                    OnGetText = GetTextGeral
                    DataField = 'DESCONTOEMPTMOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 138907
                    mmTop = 94986
                    mmWidth = 26988
                    BandType = 4
                  end
                  object ppDBText25: TppDBText
                    UserName = 'DBText25'
                    OnGetText = GetTextGeral
                    DataField = 'VALORLIQUIDOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 167746
                    mmTop = 94986
                    mmWidth = 28310
                    BandType = 4
                  end
                  object ppDBText27: TppDBText
                    UserName = 'DBText27'
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 126736
                    mmWidth = 29898
                    BandType = 4
                  end
                  object ppDBText28: TppDBText
                    UserName = 'DBText28'
                    DataField = 'SALARIOPART'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 7408
                    mmTop = 170127
                    mmWidth = 52917
                    BandType = 4
                  end
                  object ppDBText29: TppDBText
                    UserName = 'DBText29'
                    OnGetText = GetTextGeral
                    AutoSize = True
                    DataField = 'CONTRIBPARTICIPANTE'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3260
                    mmLeft = 105570
                    mmTop = 191030
                    mmWidth = 32978
                    BandType = 4
                  end
                  object ppDBText30: TppDBText
                    UserName = 'DBText30'
                    OnGetText = GetTextGeral
                    AutoSize = True
                    DataField = 'CONTRIBPATROCINADOR'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3260
                    mmLeft = 105570
                    mmTop = 196321
                    mmWidth = 35137
                    BandType = 4
                  end
                  object lblNaoElegivelSALRegReplan: TppLabel
                    UserName = 'lblNaoElegivelSALRegReplan'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3387
                    mmLeft = 37042
                    mmTop = 160073
                    mmWidth = 16891
                    BandType = 4
                  end
                  object lblNaoElegivelResgateRegReplan: TppLabel
                    UserName = 'lblNaoElegivelResgateRegReplan'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 23813
                    mmTop = 78317
                    mmWidth = 16933
                    BandType = 4
                  end
                  object lblNaoElegivelPortabilidadeRegReplan: TppLabel
                    UserName = 'lblNaoElegivelPortabilidadeRegReplan'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 32015
                    mmTop = 10319
                    mmWidth = 16933
                    BandType = 4
                  end
                  object ppMemo8: TppMemo
                    UserName = 'Memo8'
                    Caption = 'Memo8'
                    CharWrap = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Lines.Strings = (
                      
                        'As contribuições realizadas no período de janeiro de 1889 a deze' +
                        'mbro de 1995 são isentas de imposto de renda. Para as contribuiç' +
                        'ões realizadas nos '
                      
                        'demais  períodos  há  incidência  de  imposto  de  renda.  Caso ' +
                        ' possua  dívidas  de  financiamento junto à FUNCEF ou demais déb' +
                        'itos não relacionados '
                      
                        'acima, o(s) valor(es) a serem amortizados no resgate lhe serão i' +
                        'nformado previamente, para sua anuência.'
                      ' ')
                    TextAlignment = taFullJustified
                    Transparent = True
                    mmHeight = 15875
                    mmLeft = 1323
                    mmTop = 103452
                    mmWidth = 194734
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    mmLeading = 0
                  end
                end
                object ppSummaryBand4: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 2910
                  mmPrintPosition = 0
                end
                object raCodeModule4: TraCodeModule
                  ProgramStream = {00}
                end
              end
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              OnGetText = ppDBText1GetText
              AutoSize = True
              Color = clActiveBorder
              DataField = 'RESERVAMATQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 4022
              mmLeft = 38805
              mmTop = 49742
              mmWidth = 26374
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              OnGetText = ppDBText2GetText
              AutoSize = True
              DataField = 'ReservaPoupQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 4022
              mmLeft = 79148
              mmTop = 49742
              mmWidth = 24003
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              OnGetText = ppDBText3GetText
              AutoSize = True
              DataField = 'ReservaBPDQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 4022
              mmLeft = 117735
              mmTop = 49742
              mmWidth = 23029
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              OnGetText = ppDBText4GetText
              AutoSize = True
              DataField = 'ValorBPDQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 4022
              mmLeft = 163444
              mmTop = 49742
              mmWidth = 17865
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              AutoSize = True
              DataField = 'DataBaseCalc'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 4022
              mmLeft = 3704
              mmTop = 149754
              mmWidth = 22437
              BandType = 4
            end
            object ppLabel214: TppLabel
              UserName = 'Label214'
              Caption = 'REG/REPLAN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 33338
              mmTop = 20108
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText101'
              AutoSize = True
              DataField = 'matricula'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 18256
              mmTop = 8467
              mmWidth = 12996
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText102'
              AutoSize = True
              DataField = 'PatrocinadorRegReplan'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 23283
              mmTop = 14552
              mmWidth = 34078
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText103'
              AutoSize = True
              DataField = 'DATARECISAOREGREPLAN'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 44186
              mmTop = 25400
              mmWidth = 41741
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText104'
              AutoSize = True
              DataField = 'Nome'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 77788
              mmTop = 8467
              mmWidth = 8509
              BandType = 4
            end
            object ppLabel217: TppLabel
              UserName = 'Label217'
              Caption = 'Data de Admissão na Patrocinadora:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 101071
              mmTop = 14552
              mmWidth = 52652
              BandType = 4
            end
            object ppDBText97: TppDBText
              UserName = 'DBText97'
              AutoSize = True
              DataField = 'DATAADMISSAOREGREPLAN'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 154252
              mmTop = 14288
              mmWidth = 44154
              BandType = 4
            end
            object ppLabel220: TppLabel
              UserName = 'Label220'
              Caption = 'Data de adesão ao Plano:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 101071
              mmTop = 20108
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText100: TppDBText
              UserName = 'DBText100'
              AutoSize = True
              DataField = 'DATAINSCRICAOREGREPLAN'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 137319
              mmTop = 19844
              mmWidth = 45085
              BandType = 4
            end
            object ppLabel223: TppLabel
              UserName = 'Label223'
              Caption = 
                'Benefício projetado para pagamento aos 53 anos de idade, se home' +
                'm e 48, se mulher.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 3175
              mmLeft = 3175
              mmTop = 81227
              mmWidth = 139965
              BandType = 4
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'Sexo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 168275
              mmTop = 8467
              mmWidth = 8467
              BandType = 4
            end
            object ppLabel88: TppLabel
              UserName = 'Label88'
              Caption = 'Idade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 100806
              mmTop = 25400
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'sexo'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3704
              mmLeft = 177271
              mmTop = 8202
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'idade'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3969
              mmLeft = 111390
              mmTop = 25135
              mmWidth = 5027
              BandType = 4
            end
            object ppLabel171: TppLabel
              UserName = 'Label171'
              Caption = 'I - BENEFÍCIO PROPORCIONAL DIFERIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 36513
              mmWidth = 56886
              BandType = 4
            end
            object lblNaoElegivelBPDRegReplan: TppLabel
              UserName = 'lblNaoElegivelBPDRegReplan'
              Caption = 'Não Elegível'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveBorder
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 61119
              mmTop = 36513
              mmWidth = 16933
              BandType = 4
            end
            object ppMemo1: TppMemo
              UserName = 'Memo1'
              Caption = 
                'O valor será calculado com base no salário de participação prati' +
                'cado pelo participante na época da opção pelo BPD'#13#10'menos o benef' +
                'ício de aposentadoria por tempo de contribuição fixado pelo Órgã' +
                'o Oficial de Previdência ou o valor '#13#10'projetado, proporcionaliza' +
                'do pela reserva matemática na data da opção, em razão da reserva' +
                ' matemática integral. O benefício de prestação continuada a ser ' +
                'pago, será apurado conforme critérios descritos anteriormente ou' +
                ' de acordo '#13#10'com o valor calculado atuarialmente com base na res' +
                'erva de poupança, prevalecendo o que for maior.'#13#10
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'O  valor  será  calculado  com  base   no   salário  de particip' +
                  'ação  praticado  pelo  participante  na  época  da   opção  pelo' +
                  '  BPD  menos  o  benefício'
                
                  'de  aposentadoria  por  tempo  de  contribuição  fixado  pelo  Ó' +
                  'rgão  Oficial  de  Previdência  ou  o  valor  projetado,  propor' +
                  'cionalizado  pela  reserva'
                
                  'matemática na data da opção, em razão da reserva matemática inte' +
                  'gral. O  benefício  de  prestação  continuada  a ser pago, será ' +
                  'apurado conforme'
                
                  'critérios descritos anteriormente ou de acordo com o valor calcu' +
                  'lado atuarialmente com base na reserva de poupança, prevalecendo' +
                  ' o que for maior.')
              TabStopPositions.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0')
              TextAlignment = taFullJustified
              Transparent = True
              mmHeight = 15610
              mmLeft = 3440
              mmTop = 96309
              mmWidth = 192617
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppMemo7: TppMemo
              UserName = 'Memo7'
              Caption = 'Memo7'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'Será  o  valor  fixado  atuarialmente  de  acordo com o indicado' +
                  ' acima. No caso de morte, o rateio do benefício para os benefici' +
                  'ários acompanhará a'
                
                  'mesma  proporcionalidade  adotada  pelo  órgão  oficial  de  pre' +
                  'vidência. O pagamento deste benefício cessará quando o  pagament' +
                  'o  for  extinto ou '
                'suspenso pelo órgão oficial de previdência.')
              TextAlignment = taFullJustified
              Transparent = True
              mmHeight = 11377
              mmLeft = 3440
              mmTop = 119063
              mmWidth = 192617
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1058
            mmPrintPosition = 0
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppSubNovoPLano: TppSubReport
        UserName = 'SubNovoPLano'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6879
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 208
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21696
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 185738
            mmPrintPosition = 0
            object ppShape85: TppShape
              UserName = 'Shape85'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 3969
              mmWidth = 196850
              BandType = 4
            end
            object ppShape86: TppShape
              UserName = 'Shape86'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 9525
              mmWidth = 65881
              BandType = 4
            end
            object ppShape87: TppShape
              UserName = 'Shape87'
              mmHeight = 5821
              mmLeft = 66146
              mmTop = 9525
              mmWidth = 131234
              BandType = 4
            end
            object ppShape88: TppShape
              UserName = 'Shape88'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 15081
              mmWidth = 196850
              BandType = 4
            end
            object ppShape89: TppShape
              UserName = 'Shape89'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 20638
              mmWidth = 196850
              BandType = 4
            end
            object ppShape90: TppShape
              UserName = 'Shape90'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 26194
              mmWidth = 196850
              BandType = 4
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'EXTRATO DOS INSTITUTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 82021
              mmTop = 5292
              mmWidth = 37835
              BandType = 4
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Matrícula:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 10848
              mmWidth = 15081
              BandType = 4
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Nome:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 69321
              mmTop = 10848
              mmWidth = 10319
              BandType = 4
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Patrocinador:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 16669
              mmWidth = 20638
              BandType = 4
            end
            object ppLabel82: TppLabel
              UserName = 'Label82'
              Caption = 'Plano de Benefícios: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 21960
              mmWidth = 29633
              BandType = 4
            end
            object ppLabel83: TppLabel
              UserName = 'Label83'
              Caption = 'Data da rescisão contratual:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 27517
              mmWidth = 40481
              BandType = 4
            end
            object ppShape91: TppShape
              UserName = 'Shape91'
              mmHeight = 5821
              mmLeft = 265
              mmTop = 41804
              mmWidth = 197115
              BandType = 4
            end
            object ppShape92: TppShape
              UserName = 'Shape92'
              mmHeight = 5821
              mmLeft = 36777
              mmTop = 47361
              mmWidth = 69586
              BandType = 4
            end
            object ppShape93: TppShape
              UserName = 'Shape93'
              mmHeight = 5821
              mmLeft = 106098
              mmTop = 47361
              mmWidth = 91281
              BandType = 4
            end
            object ppShape94: TppShape
              UserName = 'Shape94'
              mmHeight = 11113
              mmLeft = 265
              mmTop = 52917
              mmWidth = 36777
              BandType = 4
            end
            object ppShape95: TppShape
              UserName = 'Shape402'
              mmHeight = 11113
              mmLeft = 36777
              mmTop = 52917
              mmWidth = 69586
              BandType = 4
            end
            object ppShape96: TppShape
              UserName = 'Shape96'
              mmHeight = 11113
              mmLeft = 106098
              mmTop = 52917
              mmWidth = 91281
              BandType = 4
            end
            object ppLabel84: TppLabel
              UserName = 'Label84'
              Caption = 'I - BENEFÍCIO PROPORCIONAL DIFERIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 43127
              mmWidth = 56938
              BandType = 4
            end
            object ppLabel85: TppLabel
              UserName = 'Label85'
              Caption = 'Saldo de Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 59267
              mmTop = 48419
              mmWidth = 30163
              BandType = 4
            end
            object ppLabel86: TppLabel
              UserName = 'Label86'
              Caption = 'Valor previsto do BPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 134409
              mmTop = 48419
              mmWidth = 42333
              BandType = 4
            end
            object ppLabel87: TppLabel
              UserName = 'Label87'
              Caption = 'Reais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 8996
              mmTop = 56356
              mmWidth = 8975
              BandType = 4
            end
            object ppShape100: TppShape
              UserName = 'Shape100'
              mmHeight = 5821
              mmLeft = 265
              mmTop = 47361
              mmWidth = 36777
              BandType = 4
            end
            object ppShape101: TppShape
              UserName = 'Shape1'
              mmHeight = 19579
              mmLeft = 265
              mmTop = 63765
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel89: TppLabel
              UserName = 'Label501'
              Caption = 
                'Critério de cálculo do benefício de prestação continuada decorre' +
                'nte do BPD: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 2646
              mmTop = 65881
              mmWidth = 130704
              BandType = 4
            end
            object ppShape102: TppShape
              UserName = 'Shape2'
              mmHeight = 37571
              mmLeft = 265
              mmTop = 83079
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel91: TppLabel
              UserName = 'Label91'
              Caption = 
                'Cobertura do risco de invalidez ou morte durante o período de di' +
                'ferimento: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 2646
              mmTop = 84931
              mmWidth = 129382
              BandType = 4
            end
            object ppShape103: TppShape
              UserName = 'Shape103'
              mmHeight = 14552
              mmLeft = 265
              mmTop = 120386
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel93: TppLabel
              UserName = 'Label902'
              Caption = 
                'Será deduzido, mensalmente, do saldo de conta do participante, o' +
                ' valor correspondente à taxa administrativa de BPD conforme defi' +
                'nido no plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 6615
              mmLeft = 3175
              mmTop = 126207
              mmWidth = 191559
              BandType = 4
            end
            object ppLabel94: TppLabel
              UserName = 'Label94'
              Caption = 'Custeio Administrativo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 121973
              mmWidth = 40481
              BandType = 4
            end
            object ppShape104: TppShape
              UserName = 'Shape104'
              mmHeight = 12965
              mmLeft = 265
              mmTop = 134673
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel96: TppLabel
              UserName = 'Label96'
              Caption = 'Data base do cálculo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 136261
              mmWidth = 29972
              BandType = 4
            end
            object ppShape105: TppShape
              UserName = 'Shape105'
              mmHeight = 14023
              mmLeft = 265
              mmTop = 147373
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel95: TppLabel
              UserName = 'Label95'
              Caption = 
                'Critério de atualização do benefício decorrente da opção pelo BP' +
                'D: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 148167
              mmWidth = 111654
              BandType = 4
            end
            object ppLabel97: TppLabel
              UserName = 'Label97'
              Caption = 
                'Na fase de recebimento do benefício de prestação continuada deco' +
                'rrente do BPD, o benefício será reajustado no mês de janeiro de ' +
                'cada exercício, com base na variação do índice do plano que é o ' +
                'INPC/IBGE.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7408
              mmLeft = 3175
              mmTop = 152400
              mmWidth = 188119
              BandType = 4
            end
            object ppShape106: TppShape
              UserName = 'Shape106'
              mmHeight = 12965
              mmLeft = 265
              mmTop = 161132
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel98: TppLabel
              UserName = 'Label98'
              Caption = 
                'Requisitos para elegibilidade do benefício decorrente da opção p' +
                'elo BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 161925
              mmWidth = 123825
              BandType = 4
            end
            object ppSubNovoPLano2: TppSubReport
              UserName = 'SubNovoPLano2'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              mmHeight = 5027
              mmLeft = 0
              mmTop = 178859
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport5: TppChildReport
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Left = 136
                Top = 56
                Version = '7.04'
                mmColumnWidth = 0
                object ppTitleBand5: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 21167
                  mmPrintPosition = 0
                end
                object ppDetailBand6: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 250296
                  mmPrintPosition = 0
                  object ppShape107: TppShape
                    UserName = 'Shape107'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 10848
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape108: TppShape
                    UserName = 'Shape108'
                    mmHeight = 5821
                    mmLeft = 17463
                    mmTop = 16404
                    mmWidth = 49213
                    BandType = 4
                  end
                  object ppShape109: TppShape
                    UserName = 'Shape109'
                    mmHeight = 5821
                    mmLeft = 66411
                    mmTop = 16404
                    mmWidth = 58738
                    BandType = 4
                  end
                  object ppShape110: TppShape
                    UserName = 'Shape110'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 21960
                    mmWidth = 17463
                    BandType = 4
                  end
                  object ppShape111: TppShape
                    UserName = 'Shape403'
                    mmHeight = 11377
                    mmLeft = 17463
                    mmTop = 21960
                    mmWidth = 49213
                    BandType = 4
                  end
                  object ppShape112: TppShape
                    UserName = 'Shape112'
                    mmHeight = 11377
                    mmLeft = 66411
                    mmTop = 21960
                    mmWidth = 58738
                    BandType = 4
                  end
                  object ppLabel100: TppLabel
                    UserName = 'Label100'
                    Caption = 'II - PORTABILIDADE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 12171
                    mmWidth = 27136
                    BandType = 4
                  end
                  object ppLabel101: TppLabel
                    UserName = 'Label101'
                    Caption = 'Valor a ser portado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 25929
                    mmTop = 17727
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel102: TppLabel
                    UserName = 'Label102'
                    Caption = 'Valor portado de outro plano'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 74613
                    mmTop = 17463
                    mmWidth = 42598
                    BandType = 4
                  end
                  object ppLabel103: TppLabel
                    UserName = 'Label103'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 3969
                    mmTop = 25400
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape116: TppShape
                    UserName = 'Shape116'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 16404
                    mmWidth = 17463
                    BandType = 4
                  end
                  object ppShape117: TppShape
                    UserName = 'Shape117'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 33073
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape118: TppShape
                    UserName = 'Shape118'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 43392
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel105: TppLabel
                    UserName = 'Label105'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 45244
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape119: TppShape
                    UserName = 'Shape119'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 53975
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel106: TppLabel
                    UserName = 'Label106'
                    Caption = 'Critério de atualização até a efetiva transferência: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 55563
                    mmWidth = 85725
                    BandType = 4
                  end
                  object ppLabel107: TppLabel
                    UserName = 'Label502'
                    Caption = 'Critério de cálculo do valor a ser portado: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 34925
                    mmWidth = 69056
                    BandType = 4
                  end
                  object ppLabel109: TppLabel
                    UserName = 'Label109'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 60325
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppShape120: TppShape
                    UserName = 'Shape120'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 74877
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape121: TppShape
                    UserName = 'Shape121'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 89165
                    mmWidth = 23813
                    BandType = 4
                  end
                  object ppShape122: TppShape
                    UserName = 'Shape122'
                    mmHeight = 9260
                    mmLeft = 23813
                    mmTop = 80433
                    mmWidth = 49742
                    BandType = 4
                  end
                  object ppLabel110: TppLabel
                    UserName = 'Label110'
                    Caption = 'III - RESGATE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 75936
                    mmWidth = 18521
                    BandType = 4
                  end
                  object ppLabel111: TppLabel
                    UserName = 'Label111'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 5027
                    mmTop = 92604
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape123: TppShape
                    UserName = 'Shape123'
                    mmHeight = 9260
                    mmLeft = 73290
                    mmTop = 80433
                    mmWidth = 41010
                    BandType = 4
                  end
                  object ppShape124: TppShape
                    UserName = 'Shape124'
                    mmHeight = 9260
                    mmLeft = 114036
                    mmTop = 80433
                    mmWidth = 37306
                    BandType = 4
                  end
                  object ppShape125: TppShape
                    UserName = 'Shape125'
                    mmHeight = 9260
                    mmLeft = 151077
                    mmTop = 80433
                    mmWidth = 46302
                    BandType = 4
                  end
                  object ppShape128: TppShape
                    UserName = 'Shape128'
                    mmHeight = 8996
                    mmLeft = 265
                    mmTop = 80433
                    mmWidth = 23813
                    BandType = 4
                  end
                  object ppLabel113: TppLabel
                    UserName = 'Label113'
                    Caption = 'Resgate Bruto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 6773
                    mmLeft = 42333
                    mmTop = 81227
                    mmWidth = 12171
                    BandType = 4
                  end
                  object ppLabel114: TppLabel
                    UserName = 'Label114'
                    Caption = 'Valor IRRF'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 6773
                    mmLeft = 89959
                    mmTop = 81227
                    mmWidth = 7938
                    BandType = 4
                  end
                  object ppLabel115: TppLabel
                    UserName = 'Label115'
                    Caption = 'Descontos Empréstimo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7144
                    mmLeft = 124090
                    mmTop = 81227
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppShape130: TppShape
                    UserName = 'Shape130'
                    mmHeight = 11377
                    mmLeft = 23813
                    mmTop = 89165
                    mmWidth = 49742
                    BandType = 4
                  end
                  object ppShape131: TppShape
                    UserName = 'Shape131'
                    mmHeight = 11377
                    mmLeft = 73290
                    mmTop = 89165
                    mmWidth = 41010
                    BandType = 4
                  end
                  object ppShape132: TppShape
                    UserName = 'Shape132'
                    mmHeight = 11377
                    mmLeft = 114036
                    mmTop = 89165
                    mmWidth = 37306
                    BandType = 4
                  end
                  object ppShape133: TppShape
                    UserName = 'Shape602'
                    mmHeight = 11377
                    mmLeft = 151077
                    mmTop = 89165
                    mmWidth = 46302
                    BandType = 4
                  end
                  object ppShape142: TppShape
                    UserName = 'Shape142'
                    mmHeight = 34660
                    mmLeft = 265
                    mmTop = 100277
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape143: TppShape
                    UserName = 'Shape702'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 134673
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel119: TppLabel
                    UserName = 'Label119'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 2910
                    mmTop = 136261
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape144: TppShape
                    UserName = 'Shape144'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 145257
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel120: TppLabel
                    UserName = 'Label120'
                    Caption = 
                      'Critério de atualização entre a data do cálculo e o efetivo paga' +
                      'mento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 2910
                    mmTop = 146579
                    mmWidth = 113771
                    BandType = 4
                  end
                  object ppShape145: TppShape
                    UserName = 'Shape145'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 155840
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel121: TppLabel
                    UserName = 'Label121'
                    Caption = 'Prazo para pagamento: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 2910
                    mmTop = 157163
                    mmWidth = 37835
                    BandType = 4
                  end
                  object ppLabel122: TppLabel
                    UserName = 'Label122'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 2910
                    mmTop = 151342
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel123: TppLabel
                    UserName = 'Label123'
                    Caption = 'Até 30 dias'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 2910
                    mmTop = 161661
                    mmWidth = 26194
                    BandType = 4
                  end
                  object ppLabel124: TppLabel
                    UserName = 'Label124'
                    Caption = 'Valor Líquido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7408
                    mmLeft = 168805
                    mmTop = 81227
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppShape146: TppShape
                    UserName = 'Shape146'
                    mmHeight = 5821
                    mmLeft = 124884
                    mmTop = 16404
                    mmWidth = 72496
                    BandType = 4
                  end
                  object ppShape147: TppShape
                    UserName = 'Shape147'
                    mmHeight = 11377
                    mmLeft = 124884
                    mmTop = 21960
                    mmWidth = 72496
                    BandType = 4
                  end
                  object ppLabel125: TppLabel
                    UserName = 'Label125'
                    Caption = 'Total a ser portado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 147109
                    mmTop = 17463
                    mmWidth = 29898
                    BandType = 4
                  end
                  object ppShape126: TppShape
                    UserName = 'Shape126'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 172244
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel116: TppLabel
                    UserName = 'Label116'
                    Caption = 'IV - AUTOPATROCÍNIO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 3175
                    mmTop = 173567
                    mmWidth = 30692
                    BandType = 4
                  end
                  object ppShape127: TppShape
                    UserName = 'Shape127'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 177800
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel117: TppLabel
                    UserName = 'Label117'
                    Caption = 'Salário de Participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 3175
                    mmTop = 179388
                    mmWidth = 29104
                    BandType = 4
                  end
                  object ppLabel126: TppLabel
                    UserName = 'Label702'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 183886
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppShape134: TppShape
                    UserName = 'Shape134'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 188119
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel127: TppLabel
                    UserName = 'Label127'
                    Caption = 'Salário de Participação - critério de atualização: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 189707
                    mmWidth = 83079
                    BandType = 4
                  end
                  object ppLabel128: TppLabel
                    UserName = 'Label128'
                    Caption = 
                      'Atualizado na mesma data e com o mesmo índice de reajuste conced' +
                      'ido pelo patrocinador. '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 3175
                    mmTop = 194205
                    mmWidth = 115951
                    BandType = 4
                  end
                  object ppShape135: TppShape
                    UserName = 'Shape135'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 198438
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape140: TppShape
                    UserName = 'Shape140'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 198438
                    mmWidth = 32279
                    BandType = 4
                  end
                  object ppShape141: TppShape
                    UserName = 'Shape1401'
                    mmHeight = 6350
                    mmLeft = 81492
                    mmTop = 198438
                    mmWidth = 115888
                    BandType = 4
                  end
                  object ppLabel129: TppLabel
                    UserName = 'Label129'
                    Caption = 'Contribuição/Custeio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 200025
                    mmWidth = 36513
                    BandType = 4
                  end
                  object ppLabel130: TppLabel
                    UserName = 'Label130'
                    Caption = 'Valor Inicial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 50800
                    mmTop = 200290
                    mmWidth = 20108
                    BandType = 4
                  end
                  object ppLabel131: TppLabel
                    UserName = 'Label1301'
                    Caption = 'Percentual de Contribuição'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 84667
                    mmTop = 200025
                    mmWidth = 43127
                    BandType = 4
                  end
                  object ppShape149: TppShape
                    UserName = 'Shape149'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 204523
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape150: TppShape
                    UserName = 'Shape1402'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 204523
                    mmWidth = 32279
                    BandType = 4
                  end
                  object ppShape151: TppShape
                    UserName = 'Shape151'
                    mmHeight = 6350
                    mmLeft = 81492
                    mmTop = 204523
                    mmWidth = 115888
                    BandType = 4
                  end
                  object ppLabel132: TppLabel
                    UserName = 'Label132'
                    Caption = 'Participante'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 3175
                    mmTop = 206111
                    mmWidth = 14986
                    BandType = 4
                  end
                  object ppLabel133: TppLabel
                    UserName = 'Label1302'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 50800
                    mmTop = 206375
                    mmWidth = 3598
                    BandType = 4
                  end
                  object ppLabel134: TppLabel
                    UserName = 'Label134'
                    Caption = 'X% sobre o salário de participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 82021
                    mmTop = 206111
                    mmWidth = 64823
                    BandType = 4
                  end
                  object ppShape152: TppShape
                    UserName = 'Shape152'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 210609
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape153: TppShape
                    UserName = 'Shape1403'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 210609
                    mmWidth = 32279
                    BandType = 4
                  end
                  object ppShape154: TppShape
                    UserName = 'Shape154'
                    mmHeight = 6350
                    mmLeft = 81492
                    mmTop = 210609
                    mmWidth = 115888
                    BandType = 4
                  end
                  object ppLabel135: TppLabel
                    UserName = 'Label135'
                    Caption = 'Patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 3175
                    mmTop = 212196
                    mmWidth = 16044
                    BandType = 4
                  end
                  object ppLabel136: TppLabel
                    UserName = 'Label1303'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 50800
                    mmTop = 212461
                    mmWidth = 3598
                    BandType = 4
                  end
                  object ppLabel137: TppLabel
                    UserName = 'Label137'
                    Caption = 'X% sobre o salário de participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 82286
                    mmTop = 212461
                    mmWidth = 62442
                    BandType = 4
                  end
                  object ppShape155: TppShape
                    UserName = 'Shape155'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 216694
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape156: TppShape
                    UserName = 'Shape156'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 216694
                    mmWidth = 32279
                    BandType = 4
                  end
                  object ppShape157: TppShape
                    UserName = 'Shape157'
                    mmHeight = 6350
                    mmLeft = 81492
                    mmTop = 216694
                    mmWidth = 115888
                    BandType = 4
                  end
                  object ppLabel138: TppLabel
                    UserName = 'Label138'
                    Caption = 'Custeio Administrativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 3175
                    mmTop = 218282
                    mmWidth = 28279
                    BandType = 4
                  end
                  object ppLabel139: TppLabel
                    UserName = 'Label139'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 50800
                    mmTop = 218546
                    mmWidth = 3598
                    BandType = 4
                  end
                  object ppLabel140: TppLabel
                    UserName = 'Label140'
                    Caption = 
                      '4,75% incidente sobre a contribuição referente à parte  particip' +
                      'ante e a parte patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 82021
                    mmTop = 218546
                    mmWidth = 115623
                    BandType = 4
                  end
                  object ppShape158: TppShape
                    UserName = 'Shape158'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 222780
                    mmWidth = 49742
                    BandType = 4
                  end
                  object ppShape159: TppShape
                    UserName = 'Shape159'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 222780
                    mmWidth = 32279
                    BandType = 4
                  end
                  object ppShape160: TppShape
                    UserName = 'Shape160'
                    mmHeight = 6350
                    mmLeft = 81492
                    mmTop = 222780
                    mmWidth = 115888
                    BandType = 4
                  end
                  object ppLabel141: TppLabel
                    UserName = 'Label141'
                    Caption = 'Custeio de Risco'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 3175
                    mmTop = 224367
                    mmWidth = 21463
                    BandType = 4
                  end
                  object ppLabel142: TppLabel
                    UserName = 'Label142'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 50800
                    mmTop = 224632
                    mmWidth = 3598
                    BandType = 4
                  end
                  object ppLabel143: TppLabel
                    UserName = 'Label1401'
                    Caption = '0,96% Incidente sobre o salário de participação.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3302
                    mmLeft = 82286
                    mmTop = 224632
                    mmWidth = 57743
                    BandType = 4
                  end
                  object ppShape163: TppShape
                    UserName = 'Shape163'
                    mmHeight = 12435
                    mmLeft = 265
                    mmTop = 228865
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppDBText45: TppDBText
                    UserName = 'DBText45'
                    OnGetText = ppDBText45GetText
                    DataField = 'ValorPortadoNovoPlanoQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 19050
                    mmTop = 25400
                    mmWidth = 47096
                    BandType = 4
                  end
                  object ppDBText47: TppDBText
                    UserName = 'DBText47'
                    OnGetText = ppDBText47GetText
                    DataField = 'ValorPortadoOutroNovoPlanoQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 72496
                    mmTop = 25400
                    mmWidth = 47096
                    BandType = 4
                  end
                  object ppDBText49: TppDBText
                    UserName = 'DBText49'
                    OnGetText = ppDBText49GetText
                    DataField = 'TotalPortadoNovoPLanoQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 136790
                    mmTop = 25400
                    mmWidth = 47096
                    BandType = 4
                  end
                  object ppLabel108: TppLabel
                    UserName = 'Label108'
                    Caption = 'O valor a ser portado corresponde ao saldo total de conta.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 2910
                    mmTop = 38894
                    mmWidth = 111919
                    BandType = 4
                  end
                  object ppDBText51: TppDBText
                    UserName = 'DBText51'
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 49477
                    mmWidth = 50271
                    BandType = 4
                  end
                  object ppDBText52: TppDBText
                    UserName = 'DBText52'
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 140494
                    mmWidth = 36513
                    BandType = 4
                  end
                  object ppDBText53: TppDBText
                    UserName = 'DBText53'
                    DataField = 'SALPARTNOVOPLANO'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 7408
                    mmTop = 183621
                    mmWidth = 41010
                    BandType = 4
                  end
                  object ppDBText54: TppDBText
                    UserName = 'DBText54'
                    OnGetText = GetTextGeral
                    DataField = 'CONTRIBPARTNOVOPLANO'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3704
                    mmLeft = 55033
                    mmTop = 206111
                    mmWidth = 24871
                    BandType = 4
                  end
                  object ppDBText55: TppDBText
                    UserName = 'DBText55'
                    OnGetText = GetTextGeral
                    DataField = 'CONTRIBPATRONOVOPLANO'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 55033
                    mmTop = 211932
                    mmWidth = 25929
                    BandType = 4
                  end
                  object ppDBText56: TppDBText
                    UserName = 'DBText56'
                    OnGetText = GetTextGeral
                    DataField = 'CUSTEIOADMNOVOPLANO'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 55033
                    mmTop = 218282
                    mmWidth = 25400
                    BandType = 4
                  end
                  object ppDBText57: TppDBText
                    UserName = 'DBText57'
                    OnGetText = GetTextGeral
                    DataField = 'CUSTEIORISCONOVOPLANO'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 55033
                    mmTop = 224103
                    mmWidth = 25665
                    BandType = 4
                  end
                  object ppDBText59: TppDBText
                    UserName = 'DBText59'
                    OnGetText = GetTextGeral
                    DataField = 'ResgateBrutoNovoPlanoQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 24342
                    mmTop = 92869
                    mmWidth = 48683
                    BandType = 4
                  end
                  object ppDBText61: TppDBText
                    UserName = 'DBText61'
                    OnGetText = GetTextGeral
                    DataField = 'IRRFNOVOPLANOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 73819
                    mmTop = 92869
                    mmWidth = 39952
                    BandType = 4
                  end
                  object ppDBText63: TppDBText
                    UserName = 'DBText63'
                    OnGetText = GetTextGeral
                    DataField = 'DESCONTONOVOPLANOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 114565
                    mmTop = 92869
                    mmWidth = 35719
                    BandType = 4
                  end
                  object ppDBText65: TppDBText
                    UserName = 'DBText65'
                    OnGetText = GetTextGeral
                    DataField = 'VLRLIQUIDOQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 151607
                    mmTop = 92869
                    mmWidth = 45773
                    BandType = 4
                  end
                  object lblNaoElegivelSALNovoPlano: TppLabel
                    UserName = 'lblNaoElegivelSALNovoPlano'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3387
                    mmLeft = 36777
                    mmTop = 173832
                    mmWidth = 16891
                    BandType = 4
                  end
                  object lblNaoElegivelPortabilidadeNovoPlano: TppLabel
                    UserName = 'lblNaoElegivelPortabilidadeNovoPlano'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 31221
                    mmTop = 12435
                    mmWidth = 16933
                    BandType = 4
                  end
                  object lblNaoElegivelResgateNovoPlano: TppLabel
                    UserName = 'lblNaoElegivelResgateNovoPlano'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 22490
                    mmTop = 76200
                    mmWidth = 16933
                    BandType = 4
                  end
                  object ppMemo6: TppMemo
                    UserName = 'Memo6'
                    Caption = 'Memo6'
                    CharWrap = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Lines.Strings = (
                      
                        'O cálculo do imposto de renda levou em consideração sua opção pe' +
                        'la nova regra de tributação (art. 1º ou art. 2º  da  Lei  nº 11.' +
                        '053, de 29 de '
                      
                        'dezembro de 2004). Caso  não  tenha feito a opção pela tabela re' +
                        'gressiva, a alíquota é de 15%, sendo que os eventuais acertos de' +
                        'verão ser '
                      'feitos na Declaração Anual do IRPF.')
                    TextAlignment = taFullJustified
                    Transparent = True
                    mmHeight = 23548
                    mmLeft = 2381
                    mmTop = 101600
                    mmWidth = 192882
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    mmLeading = 0
                  end
                  object ppMemo10: TppMemo
                    UserName = 'Memo10'
                    Caption = 'Memo10'
                    CharWrap = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = [fsBold]
                    Lines.Strings = (
                      
                        'Serão  cobradas  as  contribuiçoes  referentes  ao  período  da ' +
                        ' data  da  rescisão do contrato de trabalho e a data de efetivaç' +
                        'ão  do  instituto Autopatrocínio.'
                      
                        'Esses valores lhe serão encaminhados previamente para o e-mail i' +
                        'nformado no termo de opção para devida autorização. O percentual' +
                        ' poderá ser modificado '
                      
                        'para o percentual mínimo de contribuição do Regulamento do Plano' +
                        '.')
                    TextAlignment = taFullJustified
                    Transparent = True
                    mmHeight = 9260
                    mmLeft = 2381
                    mmTop = 230188
                    mmWidth = 193940
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    mmLeading = 0
                  end
                end
                object ppSummaryBand5: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 3969
                  mmPrintPosition = 0
                end
              end
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              AutoSize = True
              DataField = 'matricula'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 18785
              mmTop = 10848
              mmWidth = 12996
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              AutoSize = True
              DataField = 'Nome'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 79904
              mmTop = 10848
              mmWidth = 8509
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              AutoSize = True
              DataField = 'PatrocinadorNovoPLano'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 24342
              mmTop = 16669
              mmWidth = 34756
              BandType = 4
            end
            object ppLabel215: TppLabel
              UserName = 'Label215'
              Caption = 'NOVO PLANO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 33338
              mmTop = 22225
              mmWidth = 18754
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              AutoSize = True
              DataField = 'DATARECISAONOVOPLANO'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 44186
              mmTop = 27517
              mmWidth = 42249
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              OnGetText = ppDBText40GetText
              DataField = 'SaldoContaQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3969
              mmLeft = 37571
              mmTop = 56355
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText42: TppDBText
              UserName = 'DBText402'
              OnGetText = ppDBText42GetText
              DataField = 'ValorPrevistoQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3969
              mmLeft = 119327
              mmTop = 56355
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              DataField = 'DATABASECALC'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3969
              mmLeft = 3175
              mmTop = 141023
              mmWidth = 44186
              BandType = 4
            end
            object ppLabel99: TppLabel
              UserName = 'Label99'
              Caption = 'For elegível ao benefício programado pleno.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 3440
              mmTop = 166423
              mmWidth = 55499
              BandType = 4
            end
            object ppLabel218: TppLabel
              UserName = 'Label218'
              Caption = 'Data de Admissão na Patrocinadora:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 103188
              mmTop = 16933
              mmWidth = 52652
              BandType = 4
            end
            object ppDBText98: TppDBText
              UserName = 'DBText98'
              AutoSize = True
              DataField = 'DATAADMISSAONOVOPLANO'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 156104
              mmTop = 16669
              mmWidth = 44662
              BandType = 4
            end
            object ppLabel221: TppLabel
              UserName = 'Label2201'
              Caption = 'Data de adesão ao Plano:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 103188
              mmTop = 22225
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText101: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'DATAINSCRICAONOVOPLANO'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 139436
              mmTop = 21960
              mmWidth = 45593
              BandType = 4
            end
            object ppLabel104: TppLabel
              UserName = 'Label104'
              Caption = 'Sexo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 10848
              mmWidth = 8467
              BandType = 4
            end
            object ppLabel112: TppLabel
              UserName = 'Label112'
              Caption = 'Idade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 103188
              mmTop = 27517
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'sexo'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3175
              mmLeft = 178594
              mmTop = 10848
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'idade'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3175
              mmLeft = 113506
              mmTop = 27517
              mmWidth = 11906
              BandType = 4
            end
            object lblNaoElegivelBPDNovoPlano: TppLabel
              UserName = 'lblNaoElegivelBPDNovoPlano'
              Caption = 'Não Elegível'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveBorder
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 61383
              mmTop = 43127
              mmWidth = 16933
              BandType = 4
            end
            object ppMemo4: TppMemo
              UserName = 'Memo4'
              Caption = 'Memo4'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'O  benefício de prestação continuada  decorrente da opção  pelo ' +
                  ' BPD corresponderá ao Saldo de Conta dividido pelo fator atuaria' +
                  'l calculado na data'
                
                  'de  entrada  do  requerimento  do  benefício  de  prestação  con' +
                  'tinuada. Os  valores  acima  referem - se  a  situação  atual, s' +
                  'endo  revistos  quando  da '
                
                  'concessão do benefício, pois as premissas consideradas para a ap' +
                  'uração do fator atuarial serão as vigentes na data da concessão ' +
                  'do benefício.')
              TextAlignment = taFullJustified
              Transparent = True
              mmHeight = 11113
              mmLeft = 2381
              mmTop = 70379
              mmWidth = 192352
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppMemo5: TppMemo
              UserName = 'Memo5'
              Caption = 'Memo5'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'O  valor  corresponderá  ao  saldo  de  conte divido pelo fator ' +
                  'atuarial. No caso do risco de invalidez o benefício  será  devid' +
                  'o desde  que  o  participante'
                
                  'esteja  aposentado  por  invalidez no órgão oficial de previdênc' +
                  'ia. No caso de morte o benefício será devido desde que o depende' +
                  'nte  esteja  habilitado'
                
                  'na FUNCEF.  O valor  mensal da pensão  será recalculado sempre  ' +
                  'que  ocorrer habilitação de dependentes não previstos  no fator ' +
                  'atuarial  da  data  da'
                
                  'concessão do benefício, sendo os efeitos financeiros devidos a p' +
                  'artir da nova habilitação. O  benefício  será  rateado entre os ' +
                  'dependentes,  em  partes'
                
                  'iguais;  na hipótese de  cessação do direito de um dos dependent' +
                  'es, a quota correspondente será revertida em favor dos demais.  ' +
                  'Com  a  extinção  da '
                
                  'quota do último dependente extingue-se o benefício a cargo da FU' +
                  'NCEF. ')
              TextAlignment = taFullJustified
              Transparent = True
              mmHeight = 24606
              mmLeft = 2646
              mmTop = 89429
              mmWidth = 192352
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReb: TppSubReport
        UserName = 'SubReb'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 12700
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 240
          Top = 160
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21696
            mmPrintPosition = 0
          end
          object ppDetailBand4: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 283105
            mmPrintPosition = 0
            object ppShape164: TppShape
              UserName = 'Shape164'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 6085
              mmWidth = 196850
              BandType = 4
            end
            object ppShape165: TppShape
              UserName = 'Shape165'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 11642
              mmWidth = 65881
              BandType = 4
            end
            object ppShape166: TppShape
              UserName = 'Shape166'
              mmHeight = 5821
              mmLeft = 66146
              mmTop = 11642
              mmWidth = 131234
              BandType = 4
            end
            object ppShape167: TppShape
              UserName = 'Shape167'
              mmHeight = 7144
              mmLeft = 529
              mmTop = 17198
              mmWidth = 196850
              BandType = 4
            end
            object ppShape168: TppShape
              UserName = 'Shape168'
              mmHeight = 6879
              mmLeft = 529
              mmTop = 24077
              mmWidth = 196850
              BandType = 4
            end
            object ppShape169: TppShape
              UserName = 'Shape901'
              mmHeight = 5821
              mmLeft = 529
              mmTop = 30692
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'EXTRATO DOS INSTITUTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 83873
              mmTop = 7408
              mmWidth = 37835
              BandType = 4
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Matrícula:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 12965
              mmWidth = 14288
              BandType = 4
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Nome:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 69586
              mmTop = 12965
              mmWidth = 9790
              BandType = 4
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Patrocinador: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 19050
              mmWidth = 19262
              BandType = 4
            end
            object ppLabel147: TppLabel
              UserName = 'Label147'
              Caption = 'Plano de Benefícios: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 2910
              mmTop = 25929
              mmWidth = 29633
              BandType = 4
            end
            object ppLabel148: TppLabel
              UserName = 'Label148'
              Caption = 'Data da rescisão contratual:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 2910
              mmTop = 32015
              mmWidth = 39952
              BandType = 4
            end
            object ppLabel149: TppLabel
              OnPrint = ppLabel149Print
              UserName = 'Label149'
              Caption = '(    ) Fundação dos Economiários Federais - FUNCEF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 24077
              mmTop = 19050
              mmWidth = 80698
              BandType = 4
            end
            object ppShape170: TppShape
              UserName = 'Shape170'
              mmHeight = 5821
              mmLeft = 265
              mmTop = 43921
              mmWidth = 197115
              BandType = 4
            end
            object ppShape171: TppShape
              UserName = 'Shape171'
              mmHeight = 5821
              mmLeft = 38629
              mmTop = 49477
              mmWidth = 69586
              BandType = 4
            end
            object ppShape172: TppShape
              UserName = 'Shape172'
              mmHeight = 5821
              mmLeft = 106098
              mmTop = 49477
              mmWidth = 91281
              BandType = 4
            end
            object ppShape173: TppShape
              UserName = 'Shape173'
              mmHeight = 11113
              mmLeft = 265
              mmTop = 55033
              mmWidth = 38629
              BandType = 4
            end
            object ppShape174: TppShape
              UserName = 'Shape174'
              mmHeight = 11113
              mmLeft = 38629
              mmTop = 55033
              mmWidth = 69586
              BandType = 4
            end
            object ppShape175: TppShape
              UserName = 'Shape175'
              mmHeight = 11113
              mmLeft = 106098
              mmTop = 55033
              mmWidth = 91281
              BandType = 4
            end
            object ppLabel151: TppLabel
              UserName = 'Label151'
              Caption = 'I - BENEFÍCIO PROPORCIONAL DIFERIDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 45244
              mmWidth = 56938
              BandType = 4
            end
            object ppLabel152: TppLabel
              UserName = 'Label152'
              Caption = 'Saldo de Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 60854
              mmTop = 50800
              mmWidth = 30163
              BandType = 4
            end
            object ppLabel153: TppLabel
              UserName = 'Label153'
              Caption = 'Valor previsto do BPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 133350
              mmTop = 50536
              mmWidth = 42333
              BandType = 4
            end
            object ppLabel154: TppLabel
              UserName = 'Label154'
              Caption = 'Reais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 12435
              mmTop = 58473
              mmWidth = 8975
              BandType = 4
            end
            object ppShape179: TppShape
              UserName = 'Shape1001'
              mmHeight = 5821
              mmLeft = 265
              mmTop = 49477
              mmWidth = 38629
              BandType = 4
            end
            object ppShape180: TppShape
              UserName = 'Shape180'
              mmHeight = 19579
              mmLeft = 265
              mmTop = 65881
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel156: TppLabel
              UserName = 'Label156'
              Caption = 
                'Critério de cálculo do benefício de prestação continuada decorre' +
                'nte do BPD: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 67998
              mmWidth = 130704
              BandType = 4
            end
            object ppShape181: TppShape
              UserName = 'Shape181'
              mmHeight = 37571
              mmLeft = 265
              mmTop = 85196
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel158: TppLabel
              UserName = 'Label158'
              Caption = 
                'Cobertura do risco de invalidez ou morte durante o período de di' +
                'ferimento: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 87048
              mmWidth = 129382
              BandType = 4
            end
            object ppShape182: TppShape
              UserName = 'Shape182'
              mmHeight = 14552
              mmLeft = 265
              mmTop = 122502
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel160: TppLabel
              UserName = 'Label160'
              Caption = 
                'Será deduzido, mensalmente, do saldo de conta do participante, o' +
                ' valor correspondente à taxa administrativa de BPD conforme defi' +
                'nido no plano de custeio anual.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7144
              mmLeft = 3175
              mmTop = 128323
              mmWidth = 184150
              BandType = 4
            end
            object ppLabel161: TppLabel
              UserName = 'Label161'
              Caption = 'Custeio Administrativo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 124090
              mmWidth = 40481
              BandType = 4
            end
            object ppShape183: TppShape
              UserName = 'Shape183'
              mmHeight = 12965
              mmLeft = 265
              mmTop = 136790
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel162: TppLabel
              UserName = 'Label162'
              Caption = 'Data base do cálculo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 138377
              mmWidth = 29972
              BandType = 4
            end
            object ppShape184: TppShape
              UserName = 'Shape184'
              mmHeight = 14023
              mmLeft = 265
              mmTop = 149490
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel163: TppLabel
              UserName = 'Label163'
              Caption = 
                'Critério de atualização do benefício decorrente da opção pelo BP' +
                'D: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 150284
              mmWidth = 111654
              BandType = 4
            end
            object ppLabel164: TppLabel
              UserName = 'Label164'
              Caption = 
                'Na fase de recebimento do benefício de prestação continuada deco' +
                'rrente do BPD, o benefício será reajustado no mês de janeiro de ' +
                'cada ano, com base na variação do índice do plano.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 7938
              mmLeft = 3175
              mmTop = 154517
              mmWidth = 186532
              BandType = 4
            end
            object ppShape185: TppShape
              UserName = 'Shape185'
              mmHeight = 12965
              mmLeft = 265
              mmTop = 163248
              mmWidth = 197115
              BandType = 4
            end
            object ppLabel165: TppLabel
              UserName = 'Label165'
              Caption = 
                'Requisitos para elegibilidade ao benefício decorrente da opção p' +
                'elo BPD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3175
              mmTop = 164042
              mmWidth = 99695
              BandType = 4
            end
            object ppLabel166: TppLabel
              UserName = 'Label166'
              Caption = 
                'For elegível ao benefício de renda vitalícia por tempo de contri' +
                'buição.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 168805
              mmWidth = 115359
              BandType = 4
            end
            object ppSubReb2: TppSubReport
              UserName = 'SubReb2'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              mmHeight = 5027
              mmLeft = 0
              mmTop = 180975
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport6: TppChildReport
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Left = 216
                Top = 136
                Version = '7.04'
                mmColumnWidth = 0
                object ppTitleBand6: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 18256
                  mmPrintPosition = 0
                end
                object ppDetailBand7: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 251884
                  mmPrintPosition = 0
                  object ppShape186: TppShape
                    UserName = 'Shape186'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 12965
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape187: TppShape
                    UserName = 'Shape187'
                    mmHeight = 5821
                    mmLeft = 19315
                    mmTop = 18521
                    mmWidth = 49213
                    BandType = 4
                  end
                  object ppShape188: TppShape
                    UserName = 'Shape188'
                    mmHeight = 5821
                    mmLeft = 68263
                    mmTop = 18521
                    mmWidth = 58738
                    BandType = 4
                  end
                  object ppShape189: TppShape
                    UserName = 'Shape1101'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 24077
                    mmWidth = 19315
                    BandType = 4
                  end
                  object ppShape190: TppShape
                    UserName = 'Shape190'
                    mmHeight = 11377
                    mmLeft = 19315
                    mmTop = 24077
                    mmWidth = 49213
                    BandType = 4
                  end
                  object ppShape191: TppShape
                    UserName = 'Shape191'
                    mmHeight = 11377
                    mmLeft = 68263
                    mmTop = 24077
                    mmWidth = 58738
                    BandType = 4
                  end
                  object ppLabel167: TppLabel
                    UserName = 'Label1001'
                    Caption = 'II - PORTABILIDADE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 14288
                    mmWidth = 27136
                    BandType = 4
                  end
                  object ppLabel168: TppLabel
                    UserName = 'Label168'
                    Caption = 'Valor a ser portado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 27781
                    mmTop = 19844
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel169: TppLabel
                    UserName = 'Label169'
                    Caption = 'Valor portado de outro plano'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 76465
                    mmTop = 19579
                    mmWidth = 42598
                    BandType = 4
                  end
                  object ppLabel170: TppLabel
                    UserName = 'Label170'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 4498
                    mmTop = 28310
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape195: TppShape
                    UserName = 'Shape195'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 18521
                    mmWidth = 19315
                    BandType = 4
                  end
                  object ppShape196: TppShape
                    UserName = 'Shape196'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 35190
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape197: TppShape
                    UserName = 'Shape197'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 45508
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel172: TppLabel
                    UserName = 'Label172'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 47361
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape198: TppShape
                    UserName = 'Shape198'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 56092
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel173: TppLabel
                    UserName = 'Label173'
                    Caption = 'Critério de atualização até a efetiva transferência: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 57679
                    mmWidth = 85725
                    BandType = 4
                  end
                  object ppLabel174: TppLabel
                    UserName = 'Label174'
                    Caption = 'Critério de cálculo do valor a ser portado: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 37042
                    mmWidth = 69056
                    BandType = 4
                  end
                  object ppLabel176: TppLabel
                    UserName = 'Label176'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 62442
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppShape199: TppShape
                    UserName = 'Shape199'
                    mmHeight = 5821
                    mmLeft = 124884
                    mmTop = 18521
                    mmWidth = 72496
                    BandType = 4
                  end
                  object ppShape200: TppShape
                    UserName = 'Shape200'
                    mmHeight = 11377
                    mmLeft = 124884
                    mmTop = 24077
                    mmWidth = 72496
                    BandType = 4
                  end
                  object ppLabel177: TppLabel
                    UserName = 'Label177'
                    Caption = 'Total a ser portado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 148961
                    mmTop = 19579
                    mmWidth = 29898
                    BandType = 4
                  end
                  object ppShape202: TppShape
                    UserName = 'Shape1201'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 76994
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape203: TppShape
                    UserName = 'Shape203'
                    mmHeight = 11377
                    mmLeft = 265
                    mmTop = 91281
                    mmWidth = 25665
                    BandType = 4
                  end
                  object ppShape204: TppShape
                    UserName = 'Shape204'
                    mmHeight = 9260
                    mmLeft = 25665
                    mmTop = 82550
                    mmWidth = 49742
                    BandType = 4
                  end
                  object ppLabel178: TppLabel
                    UserName = 'Label1101'
                    Caption = 'III - RESGATE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 3175
                    mmTop = 78052
                    mmWidth = 18521
                    BandType = 4
                  end
                  object ppLabel179: TppLabel
                    UserName = 'Label179'
                    Caption = 'Reais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4022
                    mmLeft = 6615
                    mmTop = 94456
                    mmWidth = 8975
                    BandType = 4
                  end
                  object ppShape205: TppShape
                    UserName = 'Shape205'
                    mmHeight = 9260
                    mmLeft = 75142
                    mmTop = 82550
                    mmWidth = 41010
                    BandType = 4
                  end
                  object ppShape206: TppShape
                    UserName = 'Shape206'
                    mmHeight = 9260
                    mmLeft = 115888
                    mmTop = 82550
                    mmWidth = 37306
                    BandType = 4
                  end
                  object ppShape207: TppShape
                    UserName = 'Shape207'
                    mmHeight = 9260
                    mmLeft = 151077
                    mmTop = 82550
                    mmWidth = 46302
                    BandType = 4
                  end
                  object ppShape208: TppShape
                    UserName = 'Shape208'
                    mmHeight = 8996
                    mmLeft = 265
                    mmTop = 82550
                    mmWidth = 25665
                    BandType = 4
                  end
                  object ppLabel181: TppLabel
                    UserName = 'Label181'
                    Caption = 'Resgate Bruto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 6773
                    mmLeft = 44186
                    mmTop = 83344
                    mmWidth = 12171
                    BandType = 4
                  end
                  object ppLabel182: TppLabel
                    UserName = 'Label182'
                    Caption = 'IRRF'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 3387
                    mmLeft = 93801
                    mmTop = 85196
                    mmWidth = 6604
                    BandType = 4
                  end
                  object ppLabel183: TppLabel
                    UserName = 'Label183'
                    Caption = 'Descontos Empréstimo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7144
                    mmLeft = 125942
                    mmTop = 83344
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppShape210: TppShape
                    UserName = 'Shape1301'
                    mmHeight = 11377
                    mmLeft = 25665
                    mmTop = 91281
                    mmWidth = 49742
                    BandType = 4
                  end
                  object ppShape211: TppShape
                    UserName = 'Shape211'
                    mmHeight = 11377
                    mmLeft = 75142
                    mmTop = 91281
                    mmWidth = 41010
                    BandType = 4
                  end
                  object ppShape212: TppShape
                    UserName = 'Shape212'
                    mmHeight = 11377
                    mmLeft = 115888
                    mmTop = 91281
                    mmWidth = 37306
                    BandType = 4
                  end
                  object ppShape213: TppShape
                    UserName = 'Shape213'
                    mmHeight = 11642
                    mmLeft = 151077
                    mmTop = 91281
                    mmWidth = 46302
                    BandType = 4
                  end
                  object ppShape218: TppShape
                    UserName = 'Shape218'
                    mmHeight = 34660
                    mmLeft = 265
                    mmTop = 102394
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppShape219: TppShape
                    UserName = 'Shape219'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 136790
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel185: TppLabel
                    UserName = 'Label185'
                    Caption = 'Data base do cálculo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 138377
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppShape220: TppShape
                    UserName = 'Shape220'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 147373
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel186: TppLabel
                    UserName = 'Label1201'
                    Caption = 
                      'Critério de atualização entre a data do cálculo e o efetivo paga' +
                      'mento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 148696
                    mmWidth = 113771
                    BandType = 4
                  end
                  object ppShape221: TppShape
                    UserName = 'Shape221'
                    mmHeight = 10848
                    mmLeft = 265
                    mmTop = 157957
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel187: TppLabel
                    UserName = 'Label187'
                    Caption = 'Prazo para pagamento: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 159279
                    mmWidth = 37835
                    BandType = 4
                  end
                  object ppLabel188: TppLabel
                    UserName = 'Label188'
                    Caption = 'Índice do Plano: INPC/IBGE.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 153459
                    mmWidth = 36248
                    BandType = 4
                  end
                  object ppLabel189: TppLabel
                    UserName = 'Label189'
                    Caption = 'Até 30 dias'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 163777
                    mmWidth = 26194
                    BandType = 4
                  end
                  object ppLabel190: TppLabel
                    UserName = 'Label190'
                    Caption = 'Valor Líquido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taCentered
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7408
                    mmLeft = 171715
                    mmTop = 83344
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppShape222: TppShape
                    UserName = 'Shape222'
                    mmHeight = 5821
                    mmLeft = 265
                    mmTop = 174361
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel191: TppLabel
                    UserName = 'Label191'
                    Caption = 'IV - AUTOPATROCÍNIO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold, fsUnderline]
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 5027
                    mmTop = 175684
                    mmWidth = 30692
                    BandType = 4
                  end
                  object ppShape223: TppShape
                    UserName = 'Shape223'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 179917
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel192: TppLabel
                    UserName = 'Label192'
                    Caption = 'Salário de Participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 5027
                    mmTop = 181505
                    mmWidth = 29104
                    BandType = 4
                  end
                  object ppLabel193: TppLabel
                    UserName = 'Label193'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 5027
                    mmTop = 186002
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppShape224: TppShape
                    UserName = 'Shape224'
                    mmHeight = 10583
                    mmLeft = 265
                    mmTop = 190236
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel194: TppLabel
                    UserName = 'Label194'
                    Caption = 'Salário de Participação - critério de atualização: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 5027
                    mmTop = 191823
                    mmWidth = 83079
                    BandType = 4
                  end
                  object ppLabel195: TppLabel
                    UserName = 'Label195'
                    Caption = 
                      'Atualizado na mesma data e com o mesmo índice de reajuste conced' +
                      'ido pelo patrocinador. '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3260
                    mmLeft = 5027
                    mmTop = 196321
                    mmWidth = 115951
                    BandType = 4
                  end
                  object ppShape225: TppShape
                    UserName = 'Shape225'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 200555
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape226: TppShape
                    UserName = 'Shape1404'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 200555
                    mmWidth = 33867
                    BandType = 4
                  end
                  object ppShape227: TppShape
                    UserName = 'Shape227'
                    mmHeight = 6350
                    mmLeft = 81227
                    mmTop = 200555
                    mmWidth = 116152
                    BandType = 4
                  end
                  object ppLabel196: TppLabel
                    UserName = 'Label196'
                    Caption = 'Contribuição/Custeio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 3175
                    mmTop = 202142
                    mmWidth = 36513
                    BandType = 4
                  end
                  object ppLabel197: TppLabel
                    UserName = 'Label1304'
                    Caption = 'Valor Inicial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 50800
                    mmTop = 202407
                    mmWidth = 20108
                    BandType = 4
                  end
                  object ppLabel198: TppLabel
                    UserName = 'Label198'
                    Caption = 'Percentual de Contribuição'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 84667
                    mmTop = 202142
                    mmWidth = 44450
                    BandType = 4
                  end
                  object ppShape228: TppShape
                    UserName = 'Shape228'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 206640
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape229: TppShape
                    UserName = 'Shape229'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 206640
                    mmWidth = 33867
                    BandType = 4
                  end
                  object ppShape230: TppShape
                    UserName = 'Shape230'
                    mmHeight = 6350
                    mmLeft = 81227
                    mmTop = 206640
                    mmWidth = 116152
                    BandType = 4
                  end
                  object ppLabel199: TppLabel
                    UserName = 'Label199'
                    Caption = 'Participante'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 208227
                    mmWidth = 15081
                    BandType = 4
                  end
                  object ppLabel200: TppLabel
                    UserName = 'Label200'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 50800
                    mmTop = 208492
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel201: TppLabel
                    UserName = 'Label1'
                    Caption = 'X% sobre o salário de participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 84667
                    mmTop = 208492
                    mmWidth = 64823
                    BandType = 4
                  end
                  object ppShape231: TppShape
                    UserName = 'Shape231'
                    mmHeight = 6350
                    mmLeft = 265
                    mmTop = 212725
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape232: TppShape
                    UserName = 'Shape232'
                    mmHeight = 6350
                    mmLeft = 49477
                    mmTop = 212725
                    mmWidth = 33867
                    BandType = 4
                  end
                  object ppShape233: TppShape
                    UserName = 'Shape233'
                    mmHeight = 6350
                    mmLeft = 81227
                    mmTop = 212725
                    mmWidth = 116152
                    BandType = 4
                  end
                  object ppLabel202: TppLabel
                    UserName = 'Label202'
                    Caption = 'Patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 214313
                    mmWidth = 16140
                    BandType = 4
                  end
                  object ppLabel203: TppLabel
                    UserName = 'Label203'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 50800
                    mmTop = 214578
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel204: TppLabel
                    UserName = 'Label204'
                    Caption = 'X% sobre o salário de participação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 84667
                    mmTop = 214578
                    mmWidth = 62442
                    BandType = 4
                  end
                  object ppShape234: TppShape
                    UserName = 'Shape234'
                    mmHeight = 9260
                    mmLeft = 265
                    mmTop = 218811
                    mmWidth = 49477
                    BandType = 4
                  end
                  object ppShape235: TppShape
                    UserName = 'Shape235'
                    mmHeight = 9260
                    mmLeft = 49477
                    mmTop = 218811
                    mmWidth = 33867
                    BandType = 4
                  end
                  object ppShape236: TppShape
                    UserName = 'Shape236'
                    mmHeight = 9260
                    mmLeft = 81227
                    mmTop = 218811
                    mmWidth = 116152
                    BandType = 4
                  end
                  object ppLabel205: TppLabel
                    UserName = 'Label205'
                    Caption = 'Custeio Administrativo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 221986
                    mmWidth = 28310
                    BandType = 4
                  end
                  object ppLabel206: TppLabel
                    UserName = 'Label206'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 50800
                    mmTop = 221986
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel207: TppLabel
                    UserName = 'Label1402'
                    Caption = 
                      '4,75% incidente sobre a contribuição referente à parte  particip' +
                      'ante e a parte patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7408
                    mmLeft = 84402
                    mmTop = 219605
                    mmWidth = 111125
                    BandType = 4
                  end
                  object ppShape237: TppShape
                    UserName = 'Shape237'
                    mmHeight = 11113
                    mmLeft = 265
                    mmTop = 227807
                    mmWidth = 50006
                    BandType = 4
                  end
                  object ppShape238: TppShape
                    UserName = 'Shape238'
                    mmHeight = 11113
                    mmLeft = 49477
                    mmTop = 227807
                    mmWidth = 33867
                    BandType = 4
                  end
                  object ppShape239: TppShape
                    UserName = 'Shape1601'
                    mmHeight = 11113
                    mmLeft = 81227
                    mmTop = 227807
                    mmWidth = 116152
                    BandType = 4
                  end
                  object ppLabel208: TppLabel
                    UserName = 'Label208'
                    Caption = 'Custeio de Risco'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 231775
                    mmWidth = 21431
                    BandType = 4
                  end
                  object ppLabel209: TppLabel
                    UserName = 'Label209'
                    Caption = 'R$'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 50800
                    mmTop = 231775
                    mmWidth = 3704
                    BandType = 4
                  end
                  object ppLabel210: TppLabel
                    UserName = 'Label210'
                    Caption = 
                      '6,8412162% incidente sobre a contribuição referente à parte  par' +
                      'ticipante e a parte patrocinador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    WordWrap = True
                    mmHeight = 7673
                    mmLeft = 84667
                    mmTop = 229659
                    mmWidth = 109009
                    BandType = 4
                  end
                  object ppShape242: TppShape
                    UserName = 'Shape242'
                    mmHeight = 11642
                    mmLeft = 265
                    mmTop = 238655
                    mmWidth = 197115
                    BandType = 4
                  end
                  object ppLabel213: TppLabel
                    UserName = 'Label213'
                    Caption = 
                      'Serão cobradas as contribuições referentes ao período da data de' +
                      ' recisão do contrato e trabalho e a data de efetivação do Instit' +
                      'utos Autopatrocínio. Caso seja de seu interesse poderá alterar o' +
                      ' percentual desde que atendido o mínimo estabelecido no regulame' +
                      'nto do PLANO.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = [fsBold]
                    Transparent = True
                    WordWrap = True
                    mmHeight = 5842
                    mmLeft = 2117
                    mmTop = 239713
                    mmWidth = 188087
                    BandType = 4
                  end
                  object ppDBText75: TppDBText
                    UserName = 'DBText75'
                    AutoSize = True
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4022
                    mmLeft = 3175
                    mmTop = 51594
                    mmWidth = 27559
                    BandType = 4
                  end
                  object ppDBText76: TppDBText
                    UserName = 'DBText76'
                    AutoSize = True
                    DataField = 'DATABASECALC'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4022
                    mmLeft = 3175
                    mmTop = 142346
                    mmWidth = 27559
                    BandType = 4
                  end
                  object ppDBText77: TppDBText
                    UserName = 'DBText77'
                    OnGetText = ppDBText77GetText
                    DataField = 'VALORPORTADOREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 4498
                    mmLeft = 20108
                    mmTop = 28311
                    mmWidth = 47625
                    BandType = 4
                  end
                  object ppDBText78: TppDBText
                    UserName = 'DBText78'
                    OnGetText = ppDBText78GetText
                    DataField = 'VALORPORTADOOUTROREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 73290
                    mmTop = 28311
                    mmWidth = 47625
                    BandType = 4
                  end
                  object ppDBText79: TppDBText
                    UserName = 'DBText79'
                    OnGetText = ppDBText79GetText
                    DataField = 'TOTALPORTADOREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 138907
                    mmTop = 28311
                    mmWidth = 47625
                    BandType = 4
                  end
                  object ppDBText83: TppDBText
                    UserName = 'DBText83'
                    OnGetText = GetTextGeral
                    DataField = 'VLRRESGATEBRUTOREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 26458
                    mmTop = 94721
                    mmWidth = 48419
                    BandType = 4
                  end
                  object ppDBText85: TppDBText
                    UserName = 'DBText85'
                    OnGetText = GetTextGeral
                    DataField = 'VLRIRRFREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 75671
                    mmTop = 94721
                    mmWidth = 39952
                    BandType = 4
                  end
                  object ppDBText87: TppDBText
                    UserName = 'DBText87'
                    OnGetText = GetTextGeral
                    DataField = 'DESCONTOREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 118269
                    mmTop = 94721
                    mmWidth = 32015
                    BandType = 4
                  end
                  object ppDBText89: TppDBText
                    UserName = 'DBText89'
                    OnGetText = GetTextGeral
                    DataField = 'VLRLIQUIDOREBQ'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3969
                    mmLeft = 151871
                    mmTop = 94721
                    mmWidth = 44715
                    BandType = 4
                  end
                  object ppDBText91: TppDBText
                    UserName = 'DBText91'
                    DataField = 'CONTRIBPARTREB'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 55033
                    mmTop = 208492
                    mmWidth = 24871
                    BandType = 4
                  end
                  object ppDBText92: TppDBText
                    UserName = 'DBText92'
                    DataField = 'CONTRIBPATROREB'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 55033
                    mmTop = 214578
                    mmWidth = 24871
                    BandType = 4
                  end
                  object ppDBText93: TppDBText
                    UserName = 'DBText93'
                    OnGetText = GetTextGeral
                    DataField = 'CUSTEIOADMREB'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 54769
                    mmTop = 221986
                    mmWidth = 24871
                    BandType = 4
                  end
                  object ppDBText94: TppDBText
                    UserName = 'DBText94'
                    OnGetText = GetTextGeral
                    DataField = 'CUSTEIORISCOREB'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 54769
                    mmTop = 231775
                    mmWidth = 24871
                    BandType = 4
                  end
                  object ppDBText96: TppDBText
                    UserName = 'DBText96'
                    DataField = 'SALARIOPARTICIPACAOREB'
                    DataPipeline = ppRegReplan
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppRegReplan'
                    mmHeight = 3175
                    mmLeft = 8996
                    mmTop = 186002
                    mmWidth = 39688
                    BandType = 4
                  end
                  object ppLabel175: TppLabel
                    UserName = 'Label175'
                    Caption = 'O valor a ser portado corresponde ao saldo de conta.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 3175
                    mmTop = 41275
                    mmWidth = 97896
                    BandType = 4
                  end
                  object lblNaoElegivelSALREB: TppLabel
                    UserName = 'lblNaoElegivelSALREB'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3387
                    mmLeft = 38894
                    mmTop = 175948
                    mmWidth = 16891
                    BandType = 4
                  end
                  object lblNaoElegivelPortabilidadeReb: TppLabel
                    UserName = 'lblNaoElegivelPortabilidadeReb'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 32015
                    mmTop = 14552
                    mmWidth = 16933
                    BandType = 4
                  end
                  object lblNaoElegivelResgateReb: TppLabel
                    UserName = 'lblNaoElegivelResgateReb'
                    Caption = 'Não Elegível'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clActiveBorder
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3440
                    mmLeft = 22490
                    mmTop = 78317
                    mmWidth = 16933
                    BandType = 4
                  end
                  object ppMemo9: TppMemo
                    UserName = 'Memo9'
                    Caption = 'Memo9'
                    CharWrap = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Lines.Strings = (
                      
                        'As contribuições realizadas no período de janeiro de 1989 a deze' +
                        'mbro de 1995 são isentas de imposto de renda. Para as contribuiç' +
                        'ões realizadas nos '
                      
                        'demais períodos há incidência de imposto de renda. O cálculo do ' +
                        'imposto de renda levou em consideração sua opção  pela  nova  re' +
                        'gra  de  tributação '
                      
                        '(art. 1º ou art. 2º da Lei nº 11.053, de 29 de dezembro de 2004)' +
                        '. Caso não tenha feito a opção pela tabela regressiva, a alíquot' +
                        'a é de 15%, sendo  que '
                      
                        'os eventuais acertos deverão ser feitos na Declaração Anual do I' +
                        'RPF. Caso  possua  dívidas  de  financiamento junto à FUNCEF ou ' +
                        'demais débitos não'
                      
                        'relacionados acima, o(s) valor(es) a serem amortizados no resgat' +
                        'e lhe serão informado previamente, para sua anuência.')
                    TextAlignment = taFullJustified
                    Transparent = True
                    mmHeight = 24077
                    mmLeft = 1588
                    mmTop = 103717
                    mmWidth = 194205
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    mmLeading = 0
                  end
                end
                object ppSummaryBand6: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 3440
                  mmPrintPosition = 0
                end
              end
            end
            object ppDBText67: TppDBText
              UserName = 'DBText67'
              AutoSize = True
              DataField = 'Matricula'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 17992
              mmTop = 12700
              mmWidth = 12912
              BandType = 4
            end
            object ppDBText68: TppDBText
              UserName = 'DBText68'
              AutoSize = True
              DataField = 'nome'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 79904
              mmTop = 12700
              mmWidth = 8001
              BandType = 4
            end
            object ppDBText70: TppDBText
              UserName = 'DBText70'
              AutoSize = True
              DataField = 'DataRecisaoREB'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 43392
              mmTop = 32015
              mmWidth = 24807
              BandType = 4
            end
            object ppLabel216: TppLabel
              UserName = 'Label216'
              Caption = 'REB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3598
              mmLeft = 33602
              mmTop = 25929
              mmWidth = 6519
              BandType = 4
            end
            object ppDBText69: TppDBText
              UserName = 'DBText69'
              OnGetText = ppDBText69GetText
              DataField = 'SALDOCONTAREBQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3704
              mmLeft = 39688
              mmTop = 58208
              mmWidth = 65617
              BandType = 4
            end
            object ppDBText72: TppDBText
              UserName = 'DBText72'
              OnGetText = ppDBText72GetText
              DataField = 'VALORPREVISTOREBQ'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3704
              mmLeft = 107156
              mmTop = 58473
              mmWidth = 89429
              BandType = 4
            end
            object ppDBText74: TppDBText
              UserName = 'DBText74'
              DataField = 'DATABASECALC'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 3440
              mmTop = 143404
              mmWidth = 17198
              BandType = 4
            end
            object ppLabel219: TppLabel
              UserName = 'Label219'
              Caption = 'Data de Admissão na Patrocinadora:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 109273
              mmTop = 19050
              mmWidth = 52652
              BandType = 4
            end
            object ppDBText99: TppDBText
              UserName = 'DBText701'
              AutoSize = True
              DataField = 'DATAADMISSAOREB'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 162454
              mmTop = 19050
              mmWidth = 31115
              BandType = 4
            end
            object ppLabel222: TppLabel
              UserName = 'Label222'
              Caption = 'Data de adesão ao Plano:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 109538
              mmTop = 25665
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText102: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'DATAINSCRICAOREB'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3598
              mmLeft = 146579
              mmTop = 25665
              mmWidth = 32046
              BandType = 4
            end
            object ppLabel144: TppLabel
              UserName = 'Label144'
              Caption = 'Sexo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169598
              mmTop = 12700
              mmWidth = 8467
              BandType = 4
            end
            object ppLabel145: TppLabel
              UserName = 'Label145'
              Caption = 'Idade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 109538
              mmTop = 32015
              mmWidth = 9790
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'sexo'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3175
              mmLeft = 178859
              mmTop = 12700
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'idade'
              DataPipeline = ppRegReplan
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppRegReplan'
              mmHeight = 3175
              mmLeft = 119856
              mmTop = 32015
              mmWidth = 17198
              BandType = 4
            end
            object lblNaoElegivelBPDReb: TppLabel
              UserName = 'lblNaoElegivelBPDReb'
              Caption = 'Não Elegível'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clActiveBorder
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 61913
              mmTop = 45244
              mmWidth = 16933
              BandType = 4
            end
            object ppMemo2: TppMemo
              UserName = 'Memo2'
              Caption = 'Memo2'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'O benefício de prestação continuada decorrente da opção pelo BPD' +
                  ' corresponderá ao Saldo de  Conta  dividido  pelo  fator  atuari' +
                  'al  calculado  na '
                
                  'data de entrada do requerimento do benefício de prestação contin' +
                  'uada. Os  valores acima se referem à situação atual,  sendo revi' +
                  'stos quando da '
                
                  'concessão do benefício, pois as premissas consideradas para a ap' +
                  'uração do fator atuarial serão as vigentes na data de concessão ' +
                  'do benefício. ')
              Transparent = True
              mmHeight = 11906
              mmLeft = 2910
              mmTop = 72496
              mmWidth = 187855
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppMemo3: TppMemo
              UserName = 'Memo3'
              Caption = 'Memo3'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Lines.Strings = (
                
                  'O  valor  do  benefício de risco corresponderá ao saldo de conta' +
                  ' divido pelo fator atuarial. No caso do risco de invalidez o ben' +
                  'efício  será  devido '
                
                  'desde que  o  participante  esteja  aposentado por invalidez no ' +
                  'órgão oficial de previdência. No caso de morte o benefício será ' +
                  'devido desde que'
                
                  'o dependente esteja habilitado na FUNCEF e esteja  em  gozo do b' +
                  'enefício de pensão por morte no órgão oficial  de  previdência. ' +
                  'O valor  mensal'
                
                  'da  pensão será recalculado sempre que ocorrer habilitação de de' +
                  'pendentes não previstos no fator atuarial da data da concessão d' +
                  'o  benefício, '
                
                  'sendo os efeitos financeiros devidos a partir da nova habilitaçã' +
                  'o. O benefício será rateado entre os dependentes, em partes igua' +
                  'is; na  hipótese'
                
                  'de  cessação do direito de um dos dependentes, a quota correspon' +
                  'dente será revertida em favor dos demais. Com a extinção da quot' +
                  'a do último'
                'dependente extingue-se o benefício a cargo da FUNCEF. '
                ' ')
              Transparent = True
              mmHeight = 29898
              mmLeft = 3175
              mmTop = 91546
              mmWidth = 187590
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppRegReplan: TppDBPipeline
    DataSource = dsRegReplan
    UserName = 'RegReplan'
    Left = 112
    Top = 184
    object ppRegReplanppField1: TppField
      FieldAlias = 'RESERVAMATQ'
      FieldName = 'RESERVAMATQ'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
  end
  object dsRegReplan: TwwDataSource
    DataSet = cds
    Left = 24
    Top = 112
  end
  object cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RESERVAMATQ'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 64
    Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B524553
      455256414D4154510100490000000100055749445448020002001E000000}
  end
end
