object DmRelatoriosAtuariais: TDmRelatoriosAtuariais
  OldCreateOrder = True
  Left = 65532
  Top = 65532
  Height = 608
  Width = 808
  object ppHistorico: TppReport
    AutoStop = False
    DataPipeline = pplSimulacoes
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppHistorico'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 19050
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 240
    Top = 56
    Version = '5.5'
    mmColumnWidth = 0
    object ppHistoricoHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 86254
      mmPrintPosition = 0
      object ppHistoricoShape3: TppShape
        UserName = 'ppHistoricoShape3'
        mmHeight = 19315
        mmLeft = 265
        mmTop = 9790
        mmWidth = 194998
        BandType = 0
      end
      object ppHistoricoShape1: TppShape
        UserName = 'ppHistoricoShape1'
        mmHeight = 38365
        mmLeft = 1058
        mmTop = 32808
        mmWidth = 194469
        BandType = 0
      end
      object ppHistoricoDBText1: TppDBText
        UserName = 'ppHistoricoDBText1'
        DataField = 'DESCSIM'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 71702
        mmTop = 39952
        mmWidth = 119592
        BandType = 0
      end
      object ppHistoricoDBText2: TppDBText
        UserName = 'ppHistoricoDBText2'
        DataField = 'IDARQ'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 57150
        mmWidth = 15875
        BandType = 0
      end
      object ppHistoricoDBText3: TppDBText
        UserName = 'ppHistoricoDBText3'
        DataField = 'IDBIO'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 51329
        mmWidth = 15875
        BandType = 0
      end
      object ppHistoricoDBText4: TppDBText
        UserName = 'ppHistoricoDBText4'
        DataField = 'DESCHIPO'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 45773
        mmWidth = 119856
        BandType = 0
      end
      object ppHistoricoDBText5: TppDBText
        UserName = 'ppHistoricoDBText5'
        DataField = 'IDHIPO'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 45773
        mmWidth = 15875
        BandType = 0
      end
      object ppHistoricoDBText6: TppDBText
        UserName = 'ppHistoricoDBText6'
        DataField = 'DESCBIO'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 51594
        mmWidth = 120386
        BandType = 0
      end
      object ppHistoricoDBText7: TppDBText
        UserName = 'ppHistoricoDBText7'
        DataField = 'IDSIM'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 40217
        mmWidth = 15875
        BandType = 0
      end
      object ppHistoricoDBText8: TppDBText
        UserName = 'ppHistoricoDBText8'
        DataField = 'DESCARQ'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 71702
        mmTop = 57150
        mmWidth = 120121
        BandType = 0
      end
      object ppHistoricoDBText9: TppDBText
        UserName = 'ppHistoricoDBText9'
        DataField = 'IDREG'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 63236
        mmWidth = 15875
        BandType = 0
      end
      object ppHistoricoDBText10: TppDBText
        UserName = 'ppHistoricoDBText10'
        DataField = 'DESCREG'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 63236
        mmWidth = 120650
        BandType = 0
      end
      object ppHistoricoLabel1: TppLabel
        UserName = 'ppHistoricoLabel1'
        Caption = 'Nome da Simulação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 12965
        mmWidth = 34131
        BandType = 0
      end
      object ppHistoricoLabel2: TppLabel
        UserName = 'ppHistoricoLabel2'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 50006
        mmTop = 33867
        mmWidth = 11906
        BandType = 0
      end
      object ppHistoricoDBText13: TppDBText
        UserName = 'ppHistoricoDBText13'
        DataField = 'SIMNOME'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 12965
        mmWidth = 145786
        BandType = 0
      end
      object ppHistoricoLabel3: TppLabel
        UserName = 'ppHistoricoLabel3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 71967
        mmTop = 34131
        mmWidth = 16404
        BandType = 0
      end
      object ppHistoricoLabel4: TppLabel
        UserName = 'ppHistoricoLabel4'
        Caption = 'Simulação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 39952
        mmWidth = 17992
        BandType = 0
      end
      object ppHistoricoLabel5: TppLabel
        UserName = 'ppHistoricoLabel5'
        Caption = 'Grupo de Hipóteses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 45244
        mmWidth = 32808
        BandType = 0
      end
      object ppHistoricoLabel6: TppLabel
        UserName = 'ppHistoricoLabel6'
        Caption = 'Tabela Biométrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 50536
        mmWidth = 30956
        BandType = 0
      end
      object ppHistoricoLabel7: TppLabel
        UserName = 'ppHistoricoLabel7'
        Caption = 'Filtro Utilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 56356
        mmWidth = 24606
        BandType = 0
      end
      object ppHistoricoLabel8: TppLabel
        UserName = 'ppHistoricoLabel8'
        Caption = 'Grupo de Regras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 62706
        mmWidth = 28310
        BandType = 0
      end
      object ppHistoricoLabel9: TppLabel
        UserName = 'ppHistoricoLabel9'
        Caption = 'Histórico de Simulação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 76729
        mmTop = 1852
        mmWidth = 46567
        BandType = 0
      end
      object ppHistoricoShape2: TppShape
        UserName = 'ppHistoricoShape2'
        mmHeight = 38100
        mmLeft = 41804
        mmTop = 32808
        mmWidth = 794
        BandType = 0
      end
      object ppHistoricoLine1: TppLine
        UserName = 'ppHistoricoLine1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 72761
        mmWidth = 197115
        BandType = 0
      end
      object ppHistoricoLabel10: TppLabel
        UserName = 'ppHistoricoLabel10'
        Caption = 'Grupo de Regras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 74613
        mmWidth = 28310
        BandType = 0
      end
      object ppHistoricoLabel11: TppLabel
        UserName = 'ppHistoricoLabel11'
        Caption = 'Código da regra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 81227
        mmWidth = 27252
        BandType = 0
      end
      object ppHistoricoLabel12: TppLabel
        UserName = 'ppHistoricoLabel12'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 80963
        mmWidth = 16404
        BandType = 0
      end
      object ppHistoricoLabel13: TppLabel
        UserName = 'ppHistoricoLabel13'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 20373
        mmWidth = 7673
        BandType = 0
      end
      object ppHistoricoDBText14: TppDBText
        UserName = 'ppHistoricoDBText14'
        DataField = 'DATA'
        DataPipeline = pplSimulacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 47361
        mmTop = 20638
        mmWidth = 35190
        BandType = 0
      end
    end
    object ppHistoricoDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppHistoricoSubReport1: TppSubReport
        UserName = 'ppHistoricoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 6085
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppHistoricoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplSimulacoes
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppHistorico'
          PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 19050
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Version = '5.5'
          mmColumnWidth = 0
          object ppHistoricoChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppHistoricoChildReport1Label1: TppLabel
              UserName = 'ppHistoricoChildReport1Label1'
              Caption = 'Hipóteses Adotadas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6615
              mmTop = 1323
              mmWidth = 32808
              BandType = 1
            end
            object ppHistoricoChildReport1Label2: TppLabel
              UserName = 'ppHistoricoChildReport1Label2'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 7408
              mmTop = 6615
              mmWidth = 16404
              BandType = 1
            end
            object ppHistoricoChildReport1Label3: TppLabel
              UserName = 'ppHistoricoChildReport1Label3'
              Caption = 'Nome de Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 112977
              mmTop = 6350
              mmWidth = 34396
              BandType = 1
            end
            object ppHistoricoChildReport1Label4: TppLabel
              UserName = 'ppHistoricoChildReport1Label4'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 178859
              mmTop = 5821
              mmWidth = 8996
              BandType = 1
            end
            object ppHistoricoChildReport1Line1: TppLine
              UserName = 'ppHistoricoChildReport1Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 12171
              mmWidth = 198702
              BandType = 1
            end
            object ppHistoricoChildReport1Line3: TppLine
              UserName = 'ppHistoricoChildReport1Line3'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 0
              mmWidth = 198702
              BandType = 1
            end
          end
          object ppHistoricoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            DataPipeline = pplHipoteses
            object ppHistoricoChildReport1DBText1: TppDBText
              UserName = 'ppHistoricoChildReport1DBText1'
              DataField = 'DESCRICAO'
              DataPipeline = pplHipoteses
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 7673
              mmTop = 265
              mmWidth = 95515
              BandType = 4
            end
            object ppHistoricoChildReport1DBText2: TppDBText
              UserName = 'ppHistoricoChildReport1DBText2'
              DataField = 'VLRHIPOTESES'
              DataPipeline = pplHipoteses
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 162719
              mmTop = 265
              mmWidth = 25929
              BandType = 4
            end
            object ppHistoricoChildReport1DBText3: TppDBText
              UserName = 'ppHistoricoChildReport1DBText3'
              DataField = 'REFERENCIA'
              DataPipeline = pplHipoteses
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 117475
              mmTop = 265
              mmWidth = 24871
              BandType = 4
            end
            object ppHistoricoChildReport1Line2: TppLine
              UserName = 'ppHistoricoChildReport1Line2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 5821
              mmWidth = 198702
              BandType = 4
            end
          end
        end
      end
      object ppHistoricoDBText11: TppDBText
        UserName = 'ppHistoricoDBText11'
        DataField = 'DESCRICAO'
        DataPipeline = pplRegras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 41804
        mmTop = 1323
        mmWidth = 79111
        BandType = 4
      end
      object ppHistoricoDBText12: TppDBText
        UserName = 'ppHistoricoDBText12'
        DataField = 'IDREGRA'
        DataPipeline = pplRegras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppHistoricoFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppHistoricoChildReport1Shape1: TppShape
        UserName = 'ppHistoricoChildReport1Shape1'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 265
        mmWidth = 198702
        BandType = 8
      end
      object RLNome: TppLabel
        UserName = 'RLNome'
        Caption = 'Fundação XYZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 794
        mmWidth = 20108
        BandType = 8
      end
      object ppHistoricoChildReport1Calc2: TppSystemVariable
        UserName = 'HistoricoChildReport1Calc2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 64823
        mmTop = 794
        mmWidth = 11113
        BandType = 8
      end
      object ppHistoricoChildReport1Calc1: TppSystemVariable
        UserName = 'HistoricoChildReport1Calc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 794
        mmWidth = 11113
        BandType = 8
      end
      object ppHistoricoChildReport1Calc3: TppSystemVariable
        UserName = 'HistoricoChildReport1Calc3'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 794
        mmWidth = 11906
        BandType = 8
      end
    end
  end
  object pplSimulacoes: TppBDEPipeline
    DataSource = DsSimulacoes
    UserName = 'lSimulacoes'
    Left = 176
    Top = 8
  end
  object pplHipoteses: TppBDEPipeline
    DataSource = DsHipoteses
    UserName = 'lHipoteses'
    Left = 176
    Top = 56
  end
  object RQrySimulacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.IDSIMULACAO AS IDSIM,A.NOME AS SIMNOME,A.DESCRICAO AS D' +
        'ESCSIM, A.DATA,'
      'B.IDGRUPOHIPOTESE AS IDHIPO,B.DESCRICAO AS DESCHIPO,'
      'C.IDTABELA AS IDBIO,C.DESCRICAO AS DESCBIO,'
      'D.IDGRUPOREGRA AS IDREG,D.DESCRICAO AS DESCREG,'
      'E.IDFILTRO AS IDARQ,E.DESCRICAOFILTRO AS DESCARQ'
      'FROM CM.SIMULACOES A, CM.GRUPOSDEHIPOTESES B,'
      'CM.TABBIO C, CM.GRUPOSDEREGRAS D, CM.TABFILTROSQL E'
      'WHERE A.IDSIMULACAO = :CHAVESIMULA  AND'
      'A.IDTABELA = C.IDTABELA AND'
      'A.IDGRUPOREGRA = D.IDGRUPOREGRA AND'
      'A.IDGRUPOHIPOTESE = B.IDGRUPOHIPOTESE AND'
      'A.IDFILTRO = E.IDFILTRO'
      '')
    ValidateWithMask = True
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CHAVESIMULA'
        ParamType = ptUnknown
      end>
  end
  object RQryHipoteses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO,VLRHIPOTESES,REFERENCIA'
      'FROM CM.HIPOTESES'
      'WHERE IDGRUPOHIPOTESE = :CHAVEGRUPO'
      'ORDER BY IDHIPOTESE')
    ValidateWithMask = True
    Left = 8
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CHAVEGRUPO'
        ParamType = ptUnknown
      end>
  end
  object DsSimulacoes: TwwDataSource
    DataSet = RQrySimulacoes
    Left = 96
    Top = 8
  end
  object DsHipoteses: TwwDataSource
    DataSet = RQryHipoteses
    Left = 96
    Top = 56
  end
  object RQryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.IDREGRA,A.DESCRICAO FROM CM.REGRAS A,CM.SIMULACOES B'
      'WHERE A.IDGRUPOREGRA =  :CHAVEREGRA  AND'
      'A.IDGRUPOREGRA = B.IDGRUPOREGRA'
      '')
    ValidateWithMask = True
    Left = 8
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CHAVEREGRA'
        ParamType = ptUnknown
      end>
  end
  object DsRegras: TwwDataSource
    DataSet = RQryRegras
    Left = 96
    Top = 104
  end
  object pplRegras: TppBDEPipeline
    DataSource = DsRegras
    UserName = 'lRegras'
    Left = 176
    Top = 104
  end
  object TabelaTXT: TTable
    TableType = ttASCII
    Left = 8
    Top = 181
  end
  object DSTabTXT: TDataSource
    DataSet = TabelaTXT
    Left = 80
    Top = 183
  end
  object BDRelat: TppBDEPipeline
    DataSource = DSTabTXT
    UserName = 'BDRelat'
    Left = 143
    Top = 184
  end
  object RelTXT: TppReport
    AutoStop = False
    DataPipeline = BDRelat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RelTXT'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 240
    Top = 184
    Version = '5.5'
    mmColumnWidth = 0
    object RelTXTHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RelTXTDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RelTXTFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object Design: TppDesigner
    Caption = 'Gerador de Relatórios'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000010000000000000000000
      0000FFFFFF000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0088888888888888888888000000000000199999999999999999998000000000
      0019999999999999999999880000000000199999999999999999998800000000
      0019999999999999999999880000000000000000000000000000008800000000
      8888888888888888888888080000000899999999999999999999999000000019
      9999999999999999999999980000001999999999999999999999999880000019
      9999999999999999999999988800001999999999999999999999999888000019
      999999999999999999AAAA988800001999999999999999999999999888000011
      1111111111111111111111188800000999999999999999999999999188000000
      9999000000000000000009991800000000000111111111111111000000000000
      0000011DDDDDDDDDDD1100000000000000000111111111111111000000000000
      00000011DDDDDDDDDDD110000000000000000011111111111111100000000000
      000000011DDDDDDDDDDD11000000000000000000111111111111111000000000
      0000000011DDDDDDDDDDD1100000000000000000011111111111111100000000
      0000000001111111111111110000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFF800003FF800001FF800000FF8000007F8000007F8000007F0000007E000
      0007C00000078000000780000003800000018000000180000001800000018000
      0001C0000001E0000001F0000001FF00007FFF00007FFF80003FFF80003FFFC0
      001FFFE0000FFFE0000FFFF00007FFF00007FFF80007FFFFFFFFFFFFFFFF}
    Position = poScreenCenter
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = RelTXT
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 192
    Top = 183
  end
end
