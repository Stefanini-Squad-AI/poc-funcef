inherited dtmRelatorios: TdtmRelatorios
  Top = 197
  Width = 281
  Height = 359
  Caption = 'dtmRelatorios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
  object pplUsuario: TppBDEPipeline
    DataSource = DsUsuario
    UserName = 'iUsuario'
    Left = 157
    Top = 68
    object pplUsuarioppField1: TppField
      FieldAlias = 'IDUSUARIO'
      FieldName = 'IDUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplUsuarioppField2: TppField
      FieldAlias = 'IDESPACESSO'
      FieldName = 'IDESPACESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplUsuarioppField3: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplUsuarioppField4: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object DsUsuario: TwwDataSource
    DataSet = QryUsuario
    Left = 95
    Top = 68
  end
  object QryUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IdUsuario, IdEspAcesso, NomeUsuario, Descricao'
      'From UsuarioSistema'
      'Where IdUsuario = 4')
    ValidateWithMask = True
    Left = 34
    Top = 68
  end
  object rpUsuario: TppReport
    AutoStop = False
    DataPipeline = pplUsuario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 218
    Top = 68
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Acessos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 78317
        mmTop = 8731
        mmWidth = 43392
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 45244
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplGrupo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 140
          Top = 68
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 15081
            mmPrintPosition = 0
            object LblTitMembro: TppLabel
              UserName = 'Label2'
              Caption = 'Grupos Cadastrados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 794
              mmWidth = 35190
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 9525
              mmWidth = 9790
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 76200
              mmTop = 9525
              mmWidth = 16933
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object DbtNomeMembro: TppDBText
              UserName = 'DbtNomeMembro'
              AutoSize = True
              DataPipeline = pplGrupo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 28046
              BandType = 4
            end
            object DbtDescrMembro: TppDBText
              UserName = 'DbtDescrMembro'
              AutoSize = True
              DataPipeline = pplGrupo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 76200
              mmTop = 0
              mmWidth = 27781
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
          end
        end
      end
      object LblTitulo: TppLabel
        UserName = 'Label1'
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 1323
        mmWidth = 14288
        BandType = 4
      end
      object LblNome: TppLabel
        UserName = 'LblDescricao1'
        Caption = 'Nome do usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16669
        mmTop = 1323
        mmWidth = 29104
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Descrição:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 1323
        mmWidth = 17992
        BandType = 4
      end
      object LblDescricao: TppLabel
        UserName = 'LblDescricao'
        Caption = 'Descrição do usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 120386
        mmTop = 1323
        mmWidth = 36248
        BandType = 4
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplDataview
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 140
          Top = 68
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14288
            mmPrintPosition = 0
            object ppLabel9: TppLabel
              UserName = 'Label2'
              Caption = 'Consultas Manuais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 794
              mmWidth = 32544
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 8467
              mmWidth = 9790
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object DbtNomeVisao: TppDBText
              UserName = 'DbtNomeMembro1'
              AutoSize = True
              DataField = 'NAME'
              DataPipeline = pplDataview
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 10319
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 28575
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplTabela
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 140
          Top = 68
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLabel16: TppLabel
              UserName = 'Label2'
              Caption = 'Tabelas Cadastradas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 794
              mmWidth = 35454
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 38100
              mmTop = 8731
              mmWidth = 12171
              BandType = 1
            end
          end
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object DbtColuna: TppDBText
              UserName = 'DbtDescrMembro1'
              AutoSize = True
              DataField = 'COLUMN_NAME'
              DataPipeline = pplTabela
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 38100
              mmTop = 0
              mmWidth = 27517
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'TABLE_NAME'
            DataPipeline = pplTabela
            KeepTogether = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object DbtTabela: TppDBText
                UserName = 'DbtNomeMembro2'
                AutoSize = True
                DataField = 'TABLE_NAME'
                DataPipeline = pplTabela
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 13229
                mmTop = 0
                mmWidth = 23548
                BandType = 3
                GroupNo = 0
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                Caption = 'Nome:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 0
                mmWidth = 11113
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 37835
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplDireito
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 140
          Top = 68
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14817
            mmPrintPosition = 0
            object ppLabel26: TppLabel
              UserName = 'Label2'
              Caption = 'Direitos Cadastrados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 794
              mmWidth = 35719
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 8202
              mmWidth = 16404
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label3'
              Caption = 'Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 76200
              mmTop = 8467
              mmWidth = 12700
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'NOMEOPERACAO'
              DataPipeline = pplDireito
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 30692
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'NOMEFUNCAO'
              DataPipeline = pplDireito
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 76200
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplGrupo: TppBDEPipeline
    DataSource = DsGrupo
    MasterDataPipeline = pplUsuario
    UserName = 'iGrupo'
    Left = 157
    Top = 120
  end
  object DsGrupo: TwwDataSource
    DataSet = QryGrupo
    Left = 95
    Top = 120
  end
  object QryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsUsuario
    SQL.Strings = (
      'Select G.NomeGrupo, G.Descricao'
      'From GrupoUsu X, GrupoAcesso G'
      'Where X.IdUsuario = :idusuario'
      '     and X.IdGrupo = G.IdGrupo')
    ValidateWithMask = True
    Left = 34
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object pplTabela: TppBDEPipeline
    DataSource = DsTabela
    MasterDataPipeline = pplUsuario
    UserName = 'iTabela'
    Left = 157
    Top = 224
    object pplTabelappField1: TppField
      FieldAlias = 'TABLE_NAME'
      FieldName = 'TABLE_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object pplTabelappField2: TppField
      FieldAlias = 'COLUMN_NAME'
      FieldName = 'COLUMN_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
  end
  object DsTabela: TwwDataSource
    DataSet = QryTabela
    Left = 95
    Top = 224
  end
  object QryTabela: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsUsuario
    SQL.Strings = (
      'Select T.Table_Name, C.Column_Name'
      '  From TabelaAcesso T, ColunaAcesso C'
      'Where T.IdEspAcesso = :idespacesso'
      '    and T.IdEspAcesso = C.IdEspAcesso(+)'
      '    and T.Table_Name = C.Table_Name(+)')
    ValidateWithMask = True
    Left = 34
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDESPACESSO'
        ParamType = ptUnknown
      end>
    object QryTabelaTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 30
    end
    object QryTabelaCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
  end
  object pplDataview: TppBDEPipeline
    DataSource = DsDataview
    MasterDataPipeline = pplUsuario
    UserName = 'iDataview'
    Left = 157
    Top = 172
    object pplDataviewppField1: TppField
      FieldAlias = 'NAME'
      FieldName = 'NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object DsDataview: TwwDataSource
    DataSet = QryDataview
    Left = 95
    Top = 172
  end
  object QryDataview: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsUsuario
    SQL.Strings = (
      'Select D.Name'
      'From DataviewAcesso A, Dataview D'
      'Where A.IdEspAcesso = :idespacesso'
      '    and A.IdDataview = D.IdDataview'
      '    and A.OrigemCmDv = D.OrigemCmDv')
    ValidateWithMask = True
    Left = 34
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDESPACESSO'
        ParamType = ptUnknown
      end>
    object QryDataviewNAME: TStringField
      FieldName = 'NAME'
      Origin = 'BASEDADOS.DATAVIEW.NAME'
      Size = 40
    end
  end
  object pplDireito: TppBDEPipeline
    DataSource = DsDireito
    MasterDataPipeline = pplUsuario
    UserName = 'iDireito'
    Left = 157
    Top = 276
    object pplDireitoppField1: TppField
      FieldAlias = 'NOMEOPERACAO'
      FieldName = 'NOMEOPERACAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object pplDireitoppField2: TppField
      FieldAlias = 'NOMEFUNCAO'
      FieldName = 'NOMEFUNCAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  object DsDireito: TwwDataSource
    DataSet = QryDireito
    Left = 95
    Top = 276
  end
  object QryDireito: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsUsuario
    SQL.Strings = (
      'Select o.NomeOperacao, f.NomeFuncao'
      '  From Autoriza a, OperFunc s, Operacao o, Funcao f'
      ' Where a.IdEspAcesso = :idespacesso'
      '   and a.IdOperFunc = s.IdOperFunc'
      '   and s.IdOperacao = o.IdOperacao'
      '   and s.IdFuncao = f.IdFuncao')
    ValidateWithMask = True
    Left = 34
    Top = 276
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDESPACESSO'
        ParamType = ptUnknown
      end>
    object QryDireitoNOMEOPERACAO: TStringField
      FieldName = 'NOMEOPERACAO'
      Origin = 'BASEDADOS.OPERACAO.NOMEOPERACAO'
      FixedChar = True
      Size = 30
    end
    object QryDireitoNOMEFUNCAO: TStringField
      FieldName = 'NOMEFUNCAO'
      Origin = 'BASEDADOS.FUNCAO.NOMEFUNCAO'
      Size = 60
    end
  end
end
