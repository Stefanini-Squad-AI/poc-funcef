inherited RptCartaConvoc: TRptCartaConvoc
  Left = 255
  Top = 178
  Width = 284
  Height = 276
  Caption = 'RptCartaConvoc'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Seleção de Pessoas para Emissão da Carta'
    Params = <
      item
        Caption = 'Todos'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Para Todos os Inscritos'
          'Só Para os Selecionados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
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
        Name = 'Todos'
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
        Width = 320
      end>
    Formheight = 160
    FormWidth = 350
    Left = 148
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpCartaConvoc
  end
  object rpCartaConvoc: TppReport
    AutoStop = False
    DataPipeline = ppCartaConvoc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Convocação para Treinamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 67733
        mmTop = 11642
        mmWidth = 61913
        BandType = 0
      end
      object rpCartaConvocLblEmpresa: TppLabel
        UserName = 'rpCartaConvocLblEmpresa'
        Caption = 'Nome da Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78052
        mmTop = 1588
        mmWidth = 43127
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 12700
        mmWidth = 22225
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 10583
        mmWidth = 191030
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 17463
        mmWidth = 191030
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 79111
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'EMPREGADO'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 56092
        mmTop = 2117
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 33073
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Período de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 40217
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DATAINI'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 40217
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 55827
        mmTop = 40217
        mmWidth = 1852
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'DATAFIM'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 60854
        mmTop = 40217
        mmWidth = 15346
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Local/Diretivas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 46567
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'LOCAL'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 46567
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 9525
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ENDSETOR'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 24077
        mmWidth = 19579
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 52652
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'ENTIDADE'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 52652
        mmWidth = 17727
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Convocado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'MATRICULA'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Supervisor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 16933
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MATRSUP'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 16933
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'SUPERVISOR'
        DataPipeline = ppCartaConvoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 56092
        mmTop = 16933
        mmWidth = 23019
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Setor ou Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 24077
        mmWidth = 32544
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 9525
        mmWidth = 11377
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Treinamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 33073
        mmWidth = 22490
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1852
        mmTop = 30163
        mmWidth = 191030
        BandType = 4
      end
      object SubInstrutor: TppSubReport
        UserName = 'SubInstrutor'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 59796
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppCartaConvoc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 216
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Instrutor(es):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 1852
              mmWidth = 21960
              BandType = 1
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              AutoSize = True
              DataField = 'INSTRUTOR'
              DataPipeline = ppCartaConvoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 35454
              mmTop = 1852
              mmWidth = 20638
              BandType = 1
            end
            object ppDBMemo1: TppDBMemo
              UserName = 'DBMemo1'
              CharWrap = False
              DataField = 'INSTRUTORES'
              DataPipeline = ppCartaConvoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5821
              mmLeft = 35454
              mmTop = 6615
              mmWidth = 135732
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppDetailBand4: TppDetailBand
            Visible = False
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubHorario: TppSubReport
        UserName = 'SubHorario'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = SubInstrutor
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 64558
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppCartaConvoc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 256
          Top = 240
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Horários:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 794
              mmWidth = 15610
              BandType = 1
            end
            object ppDBMemo4: TppDBMemo
              UserName = 'DBMemo4'
              CharWrap = False
              DataField = 'DATAHORA'
              DataPipeline = ppCartaConvoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              mmHeight = 5821
              mmLeft = 35454
              mmTop = 794
              mmWidth = 135732
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppDetailBand5: TppDetailBand
            Visible = False
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubConteudo: TppSubReport
        UserName = 'SubConteudo'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = SubHorario
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 69321
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppObserv
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 136
          Top = 120
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Conteúdo Programático:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1852
              mmTop = 1058
              mmWidth = 41540
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 9260
            mmPrintPosition = 0
            object ppDBMemo3: TppDBMemo
              UserName = 'DBMemo3'
              CharWrap = False
              DataField = 'OBSERVACAO'
              DataPipeline = ppObserv
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              mmHeight = 6350
              mmLeft = 1852
              mmTop = 1058
              mmWidth = 182034
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
      object SubObserv: TppSubReport
        UserName = 'SubObserv'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = SubConteudo
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 74083
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppObserv
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 297 x 210 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 176
          Top = 160
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Observações:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1852
              mmTop = 794
              mmWidth = 23548
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8202
            mmPrintPosition = 0
            object ppDBMemo2: TppDBMemo
              UserName = 'DBMemo2'
              CharWrap = False
              DataField = 'OBSERVACAO2'
              DataPipeline = ppObserv
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              mmHeight = 5821
              mmLeft = 1852
              mmTop = 1058
              mmWidth = 182034
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpCartaConvocSmryBnd: TppSummaryBand
      AfterPrint = rpCartaConvocSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'IDENT'
      DataPipeline = ppCartaConvoc
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
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
    object ppGroup1: TppGroup
      BreakName = 'SUPERVISOR'
      DataPipeline = ppCartaConvoc
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppCartaConvoc: TppBDEPipeline
    DataSource = dsCartaConvoc
    SkipWhenNoRecords = False
    UserName = 'CartaConvoc'
    Left = 215
    Top = 57
    object ppCartaConvocppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppCartaConvocppField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppCartaConvocppField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppCartaConvocppField4: TppField
      FieldAlias = 'IDENT'
      FieldName = 'IDENT'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppCartaConvocppField5: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppCartaConvocppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppCartaConvocppField7: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppCartaConvocppField8: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppCartaConvocppField9: TppField
      FieldAlias = 'ENDSETOR'
      FieldName = 'ENDSETOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppCartaConvocppField10: TppField
      FieldAlias = 'SUPERVISOR'
      FieldName = 'SUPERVISOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppCartaConvocppField11: TppField
      FieldAlias = 'DATAHORA'
      FieldName = 'DATAHORA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppCartaConvocppField12: TppField
      FieldAlias = 'INSTRUTORES'
      FieldName = 'INSTRUTORES'
      FieldLength = 70
      DisplayWidth = 70
      Position = 11
    end
    object ppCartaConvocppField13: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppCartaConvocppField14: TppField
      FieldAlias = 'MATRSUP'
      FieldName = 'MATRSUP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppCartaConvocppField15: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppCartaConvocppField16: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
  end
  object dsCartaConvoc: TwwDataSource
    AutoEdit = False
    DataSet = CdsCartaConvoc
    Left = 215
    Top = 103
  end
  object CdsCartaConvoc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CdsCartaConvocAfterScroll
    Left = 215
    Top = 148
    Data = {
      730300009619E0BD010000001800000010000000000003000000730307454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200460009454D5052454741444F0100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002004600054944454E
      5401004900000002000753554254595045020049000A00466978656443686172
      0005574944544802000200460009494E53545255544F52010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0046000944455343524943414F01004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200460005434152474F01
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002004600054C4F43414C010049000000020007535542545950
      45020049000A004669786564436861720005574944544802000200460008454E
      445345544F5201004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020046000A53555045525649534F52010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020046000844415441484F52410100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020046000B49
      4E53545255544F52455301004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002004600094D4154524943554C41
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A00074D415452535550010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000A00
      0744415441494E4901004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A00074441544146494D01004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002000A000100044C4349440400010009080000}
  end
  object sqlCartaConvoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS IDENT,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDSETOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS SUPERVISOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DATAHORA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTORES,'
      '  '#39'1234567890'#39'  AS MATRICULA, '#39'1234567890'#39'  AS MATRSUP,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' ')
    ClientDataSet = CdsCartaConvoc
    Left = 215
    Top = 200
  end
  object ppObserv: TppBDEPipeline
    DataSource = dsObserv
    SkipWhenNoRecords = False
    UserName = 'CartaConvoc1'
    Left = 95
    Top = 57
    object ppObservppField1: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppObservppField2: TppField
      FieldAlias = 'OBSERVACAO2'
      FieldName = 'OBSERVACAO2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
  end
  object dsObserv: TwwDataSource
    AutoEdit = False
    DataSet = CdsObserv
    Left = 95
    Top = 103
  end
  object CdsObserv: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 95
    Top = 148
    Data = {
      960000009619E0BD01000000180000000200000000000300000096000A4F4253
      4552564143414F01004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020046000B4F42534552564143414F3201
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020046000100044C4349440400010009080000}
  end
  object sqlObserv: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO2'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' ')
    ClientDataSet = CdsObserv
    Left = 95
    Top = 200
  end
end
