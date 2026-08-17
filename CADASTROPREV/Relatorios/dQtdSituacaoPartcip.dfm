inherited dtmQtdSituacaoPartcip: TdtmQtdSituacaoPartcip
  Left = 720
  Top = 389
  Width = 350
  Height = 276
  Caption = 'dtmQtdSituacaoPartcip'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 56
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 79
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 82
    Top = 56
    mmColumnWidth = 49325
    DataPipelineName = 'pplExemplo'
    object ppColumnHeaderBand2: TppColumnHeaderBand [1]
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppColumnFooterBand2: TppColumnFooterBand [3]
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object dsConsulta: TwwDataSource
    DataSet = qryConsulta
    Left = 231
    Top = 48
  end
  object qryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 170
    Top = 48
  end
  object prQtdSituacaoPartcip: TppReport
    AutoStop = False
    Columns = 4
    DataPipeline = ppQtdSituacaoPartcip
    NoDataBehaviors = [ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = prQtdSituacaoPartcipBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 258
    Top = 152
    Version = '7.04'
    mmColumnWidth = 71075
    DataPipelineName = 'ppQtdSituacaoPartcip'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250561
        mmTop = 38100
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = 'FUNDAÇÃO DOS ECONOMICIÁRIOS FEDERAIS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 81756
        mmTop = 2381
        mmWidth = 124619
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label2'
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 89429
        mmTop = 10054
        mmWidth = 108479
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        Caption = 'GESEG - Quantitativo por situação do participante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 91546
        mmTop = 27517
        mmWidth = 101600
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        Caption = 'Brasília DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 98690
        mmTop = 13758
        mmWidth = 87842
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label5'
        Caption = 'CNPJ: 03295.938/0001-3 - Inscrição Estadual: 01.001.001-001-01'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 98690
        mmTop = 17992
        mmWidth = 87842
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label6'
        Caption = 'Período:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 109538
        mmTop = 34925
        mmWidth = 17198
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28046
        mmLeft = 14023
        mmTop = 4498
        mmWidth = 25929
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 43127
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label20'
        Caption = 'Emissão:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 234421
        mmTop = 38365
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label23'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 151342
        mmTop = 34925
        mmWidth = 2381
        BandType = 0
      end
      object pplblDtfim: TppLabel
        UserName = 'lblDtfim'
        Caption = '00/00/0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 155311
        mmTop = 34925
        mmWidth = 21431
        BandType = 0
      end
      object pplblDtini: TppLabel
        UserName = 'lblDtini'
        Caption = '00/00/0000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 128588
        mmTop = 34925
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      AfterPrint = ppColumnHeaderBand1AfterPrint
      BeforePrint = ppColumnHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object pplblSit: TppLabel
        UserName = 'lblSit'
        AutoSize = False
        Caption = 'Situação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 794
        mmWidth = 283898
        BandType = 2
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 0
      mmHeight = 112184
      mmPrintPosition = 0
      object ppTeeChart1: TppTeeChart
        UserName = 'TeeChart1'
        mmHeight = 43656
        mmLeft = 1852
        mmTop = 67204
        mmWidth = 68527
        BandType = 4
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BottomWall.Brush.Color = clWhite
          MarginBottom = 5
          MarginRight = 5
          MarginTop = 5
          Title.Text.Strings = (
            'Teste Ferreira')
          Title.Visible = False
          BottomAxis.Axis.Visible = False
          BottomAxis.Grid.Visible = False
          BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
          BottomAxis.LabelsFont.Color = clBlack
          BottomAxis.LabelsFont.Height = -4
          BottomAxis.LabelsFont.Name = 'Arial'
          BottomAxis.LabelsFont.Style = []
          BottomAxis.LabelsMultiLine = True
          BottomAxis.LabelStyle = talText
          BottomAxis.Visible = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 30
          LeftAxis.LabelsMultiLine = True
          LeftAxis.LabelsSize = 20
          LeftAxis.TickOnLabelsOnly = False
          Legend.Visible = False
          RightAxis.Axis.Visible = False
          RightAxis.Grid.Style = psDashDotDot
          RightAxis.Grid.SmallDots = True
          TopAxis.MinorGrid.Visible = True
          View3D = False
          BevelWidth = 0
          BevelOuter = bvNone
          Color = clWhite
          object BarSeries1: TBarSeries
            Marks.ArrowLength = 0
            Marks.Frame.Visible = False
            Marks.Style = smsXValue
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
          object Series1: TBarSeries
            Marks.ArrowLength = 0
            Marks.Frame.Visible = False
            Marks.Style = smsXValue
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
          object Series2: TBarSeries
            Marks.ArrowLength = 0
            Marks.Frame.Visible = False
            Marks.Style = smsXValue
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
          object Series3: TBarSeries
            Marks.ArrowLength = 0
            Marks.Frame.Visible = False
            Marks.Style = smsXValue
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 2646
        mmWidth = 62971
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 10319
        mmWidth = 62971
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 17992
        mmWidth = 62971
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 41010
        mmWidth = 62971
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 33338
        mmWidth = 62971
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Style = bsClear
        mmHeight = 7938
        mmLeft = 3969
        mmTop = 25665
        mmWidth = 62971
        BandType = 4
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Style = bsClear
        mmHeight = 46302
        mmLeft = 44450
        mmTop = 10319
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label21'
        Caption = 'Label21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 49477
        mmTop = 50536
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label17'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 50271
        mmWidth = 8467
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        Caption = 'REG/Replan (saldado)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 5556
        mmTop = 43392
        mmWidth = 29760
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        Caption = 'Novo Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5556
        mmTop = 35719
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'QTDPLANOREGREPLANS'
        DataPipeline = ppQtdSituacaoPartcip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQtdSituacaoPartcip'
        mmHeight = 3969
        mmLeft = 47096
        mmTop = 42863
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QTDPLANONOVOPL'
        DataPipeline = ppQtdSituacaoPartcip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQtdSituacaoPartcip'
        mmHeight = 3969
        mmLeft = 47096
        mmTop = 35190
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'QTDPLANOREGREPLANNS'
        DataPipeline = ppQtdSituacaoPartcip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQtdSituacaoPartcip'
        mmHeight = 3969
        mmLeft = 47096
        mmTop = 27517
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'QTDPLANOREB'
        DataPipeline = ppQtdSituacaoPartcip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQtdSituacaoPartcip'
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 19315
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label16'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 46831
        mmTop = 12700
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATA_MES'
        DataPipeline = ppQtdSituacaoPartcip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQtdSituacaoPartcip'
        mmHeight = 3969
        mmLeft = 38894
        mmTop = 3704
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label19'
        Caption = 'Mês Cobrança:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13758
        mmTop = 3969
        mmWidth = 23283
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = 'Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5556
        mmTop = 12965
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label13'
        Caption = 'REB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5821
        mmTop = 20373
        mmWidth = 6085
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label12'
        Caption = 'REG/Replan (não saldado)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 5821
        mmTop = 28310
        mmWidth = 35602
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 17992
        mmWidth = 284300
        BandType = 8
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 14288
        mmLeft = 794
        mmTop = 2117
        mmWidth = 89959
        BandType = 8
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clRed
        Shape = stSquare
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 4233
        mmWidth = 4763
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label7'
        Caption = 'REG / Replan não saldado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9525
        mmTop = 5292
        mmWidth = 36513
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 33023
        Shape = stSquare
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 10583
        mmWidth = 4763
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label8'
        Caption = 'REB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 9525
        mmTop = 11642
        mmWidth = 5969
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label9'
        Caption = 'REG / Replan saldado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 55827
        mmTop = 11906
        mmWidth = 30692
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label10'
        Caption = 'Novo Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 55827
        mmTop = 5556
        mmWidth = 15621
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clBlue
        Shape = stSquare
        mmHeight = 5027
        mmLeft = 49742
        mmTop = 4498
        mmWidth = 4763
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = clGreen
        Shape = stSquare
        mmHeight = 5027
        mmLeft = 49742
        mmTop = 10848
        mmWidth = 4763
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 273580
        mmTop = 19844
        mmWidth = 1588
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label29'
        Caption = 'de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 267759
        mmTop = 19844
        mmWidth = 3175
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 263526
        mmTop = 19844
        mmWidth = 1588
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label30'
        Caption = 'Página'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 252678
        mmTop = 19844
        mmWidth = 9313
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'FUNCEF/DIBEN/GESEG/COPAC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 19844
        mmWidth = 43921
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATA_ANO'
      DataPipeline = ppQtdSituacaoPartcip
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppQtdSituacaoPartcip'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'FLG_INTERNO'
      DataPipeline = ppQtdSituacaoPartcip
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentColumn = False
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppQtdSituacaoPartcip'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppQtdSituacaoPartcip: TppBDEPipeline
    DataSource = DataSource1
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 141
    Top = 160
    object ppQtdSituacaoPartcipppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField2: TppField
      FieldAlias = 'DATA_MES'
      FieldName = 'DATA_MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField3: TppField
      FieldAlias = 'IDPLANOREB'
      FieldName = 'IDPLANOREB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField4: TppField
      FieldAlias = 'DESCRPLANOREB'
      FieldName = 'DESCRPLANOREB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField5: TppField
      FieldAlias = 'QTDPLANOREB'
      FieldName = 'QTDPLANOREB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField6: TppField
      FieldAlias = 'IDPLANOREGREPLANS'
      FieldName = 'IDPLANOREGREPLANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField7: TppField
      FieldAlias = 'DESCRPLANOREGREPLANS'
      FieldName = 'DESCRPLANOREGREPLANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField8: TppField
      FieldAlias = 'QTDPLANOREGREPLANS'
      FieldName = 'QTDPLANOREGREPLANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField9: TppField
      FieldAlias = 'IDPLANONOVOPL'
      FieldName = 'IDPLANONOVOPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField10: TppField
      FieldAlias = 'DESCRPLANONOVOPL'
      FieldName = 'DESCRPLANONOVOPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField11: TppField
      FieldAlias = 'QTDPLANONOVOPL'
      FieldName = 'QTDPLANONOVOPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField12: TppField
      FieldAlias = 'IDPLANOREGREPLANNS'
      FieldName = 'IDPLANOREGREPLANNS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField13: TppField
      FieldAlias = 'DESCRPLANOREGREPLANNS'
      FieldName = 'DESCRPLANOREGREPLANNS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField14: TppField
      FieldAlias = 'QTDPLANOREGREPLANNS'
      FieldName = 'QTDPLANOREGREPLANNS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField15: TppField
      FieldAlias = 'DATA_ANO'
      FieldName = 'DATA_ANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppQtdSituacaoPartcipppField16: TppField
      FieldAlias = 'FLG_INTERNO'
      FieldName = 'FLG_INTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsRelat
    Left = 16
    Top = 112
  end
  object cdsRelat: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 104
    object cdsRelatDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsRelatDATA_MES: TStringField
      FieldName = 'DATA_MES'
    end
    object cdsRelatIDPLANOREB: TIntegerField
      FieldName = 'IDPLANOREB'
    end
    object cdsRelatDESCRPLANOREB: TStringField
      FieldName = 'DESCRPLANOREB'
    end
    object cdsRelatPLANOREB: TIntegerField
      FieldName = 'QTDPLANOREB'
    end
    object cdsRelatIDPLANOREGREPLANS: TIntegerField
      FieldName = 'IDPLANOREGREPLANS'
    end
    object cdsRelatDESCRPLANOREGREPLANS: TStringField
      FieldName = 'DESCRPLANOREGREPLANS'
    end
    object cdsRelatQTDPLANOREGREPLANS: TIntegerField
      FieldName = 'QTDPLANOREGREPLANS'
    end
    object cdsRelatIDPLANONOVOPL: TIntegerField
      FieldName = 'IDPLANONOVOPL'
    end
    object cdsRelatDESCRPLANONOVOPL: TStringField
      FieldName = 'DESCRPLANONOVOPL'
    end
    object cdsRelatQTDPLANONOVOPL: TIntegerField
      FieldName = 'QTDPLANONOVOPL'
    end
    object cdsRelatIDPLANOREGREPLANNS: TIntegerField
      FieldName = 'IDPLANOREGREPLANNS'
    end
    object cdsRelatDESCRPLANOREGREPLANNS: TStringField
      FieldName = 'DESCRPLANOREGREPLANNS'
    end
    object cdsRelatQTDPLANOREGREPLANNS: TIntegerField
      FieldName = 'QTDPLANOREGREPLANNS'
    end
    object cdsRelatDATA_ANO: TStringField
      FieldName = 'DATA_ANO'
      Size = 10
    end
    object cdsRelatFLG_INTERNO: TStringField
      FieldName = 'FLG_INTERNO'
    end
  end
  object dsAux: TDataSource
    Left = 292
    Top = 72
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsAux
    ValidateWithMask = True
    Left = 292
    Top = 24
  end
end
