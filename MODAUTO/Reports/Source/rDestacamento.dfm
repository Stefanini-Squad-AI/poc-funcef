inherited RptDestacamento: TRptDestacamento
  Left = 533
  Top = 271
  Width = 374
  Height = 301
  Caption = 'RptDestacamento'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Informe o Número do Destacamento'
    Params = <
      item
        Caption = 'Nº Destacamento'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'IDDESTACAMENTO'
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
      end>
    Formheight = 105
    FormWidth = 328
  end
  inherited DevRptCM: TExtraOptions
    XHTML.PixelFormat = pfCustom
    RTF.PixelFormat = pfCustom
    Excel.RowSizing = True
    Graphic.PixelFormat = pfCustom
    PDF.Creator = 'CM Soluções Informática LTDA'
    PDF.Author = 'CM Soluções Informática LTDA'
    PDF.RichEditPixelFormat = pfCustom
    PDF.PixelFormat = pfCustom
    PDF.Permissions = [ppPrint]
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rbDestacamento
    ConnectionType = cntBDE
  end
  object rbDestacamento: TppReport
    AutoStop = False
    DataPipeline = ppDestacamento
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BackgroundPrintSettings.Enabled = True
    DeviceType = 'Screen'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 217
    Top = 7
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDestacamento'
    object ppTitleBand3: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'CM Soluções Informática Ltda.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197644
        BandType = 1
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Destacamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197644
        BandType = 1
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 62442
      mmPrintPosition = 0
      object ppShape41: TppShape
        UserName = 'Shape41'
        mmHeight = 24342
        mmLeft = 132027
        mmTop = 8202
        mmWidth = 64823
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 19579
        mmLeft = 132027
        mmTop = 12965
        mmWidth = 64823
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape43: TppShape
        UserName = 'Shape43'
        mmHeight = 8996
        mmLeft = 132027
        mmTop = 35190
        mmWidth = 64823
        BandType = 4
      end
      object ppShape42: TppShape
        UserName = 'Shape42'
        mmHeight = 4498
        mmLeft = 132027
        mmTop = 43921
        mmWidth = 64823
        BandType = 4
      end
      object ppShape38: TppShape
        UserName = 'Shape38'
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 44715
        mmWidth = 48154
        BandType = 4
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        mmHeight = 8996
        mmLeft = 5821
        mmTop = 35983
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAINI'
        DataPipeline = ppDestacamento
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 44715
        mmWidth = 48154
        BandType = 4
      end
      object ppCentroCusto: TppDBText
        UserName = 'CentroCusto'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 31485
        mmTop = 23283
        mmWidth = 97896
        BandType = 4
      end
      object ppCargoFuncao: TppDBText
        UserName = 'CargoFuncao'
        DataField = 'TITULO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 31485
        mmTop = 18256
        mmWidth = 97896
        BandType = 4
      end
      object ppValorDestacamento: TppDBText
        UserName = 'ValorDestacamento'
        DataField = 'VLRDESTACAMENTO'
        DataPipeline = ppDestacamento
        DisplayFormat = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4498
        mmLeft = 132027
        mmTop = 43921
        mmWidth = 64823
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label5'
        Caption = 'DESTACADO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 13229
        mmWidth = 25400
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppCalendario'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 57415
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppCalendario
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
          Units = utMillimeters
          Left = 448
          Top = 320
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppCalendario'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12965
            mmPrintPosition = 0
            object ppLabel6: TppLabel
              UserName = 'Label1'
              Caption = 'Calendário das Diárias:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 265
              mmWidth = 45381
              BandType = 1
            end
            object ppShape1: TppShape
              UserName = 'Shape1'
              mmHeight = 5821
              mmLeft = 0
              mmTop = 7144
              mmWidth = 24871
              BandType = 1
            end
            object ppShape2: TppShape
              UserName = 'Shape2'
              mmHeight = 5821
              mmLeft = 24606
              mmTop = 7144
              mmWidth = 65352
              BandType = 1
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 5821
              mmLeft = 89694
              mmTop = 7144
              mmWidth = 25665
              BandType = 1
            end
            object ppShape4: TppShape
              UserName = 'Shape4'
              mmHeight = 5821
              mmLeft = 115094
              mmTop = 7144
              mmWidth = 10319
              BandType = 1
            end
            object ppShape5: TppShape
              UserName = 'Shape5'
              mmHeight = 5821
              mmLeft = 125148
              mmTop = 7144
              mmWidth = 25665
              BandType = 1
            end
            object ppShape6: TppShape
              UserName = 'Shape6'
              mmHeight = 5821
              mmLeft = 150548
              mmTop = 7144
              mmWidth = 10319
              BandType = 1
            end
            object ppShape7: TppShape
              UserName = 'Shape7'
              mmHeight = 5821
              mmLeft = 160602
              mmTop = 7144
              mmWidth = 25665
              BandType = 1
            end
            object ppShape8: TppShape
              UserName = 'Shape8'
              mmHeight = 5821
              mmLeft = 186002
              mmTop = 7144
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 7938
              mmWidth = 23019
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              AutoSize = False
              Caption = 'Hospedagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 7938
              mmWidth = 63765
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'Diária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 90488
              mmTop = 7938
              mmWidth = 23813
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label101'
              AutoSize = False
              Caption = 'Hotel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 125942
              mmTop = 7938
              mmWidth = 23813
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label102'
              AutoSize = False
              Caption = 'Desl./Abat.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 161396
              mmTop = 7938
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label103'
              AutoSize = False
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 115888
              mmTop = 7938
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              AutoSize = False
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 151342
              mmTop = 7938
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              AutoSize = False
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 186796
              mmTop = 7938
              mmWidth = 8731
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppShape9: TppShape
              UserName = 'Shape9'
              mmHeight = 5821
              mmLeft = 0
              mmTop = 0
              mmWidth = 24871
              BandType = 4
            end
            object ppShape10: TppShape
              UserName = 'Shape10'
              mmHeight = 5821
              mmLeft = 24606
              mmTop = 0
              mmWidth = 65352
              BandType = 4
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              mmHeight = 5821
              mmLeft = 89694
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
            object ppShape12: TppShape
              UserName = 'Shape12'
              mmHeight = 5821
              mmLeft = 115094
              mmTop = 0
              mmWidth = 10319
              BandType = 4
            end
            object ppShape13: TppShape
              UserName = 'Shape13'
              mmHeight = 5821
              mmLeft = 125148
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
            object ppShape14: TppShape
              UserName = 'Shape14'
              mmHeight = 5821
              mmLeft = 150548
              mmTop = 0
              mmWidth = 10319
              BandType = 4
            end
            object ppShape15: TppShape
              UserName = 'Shape15'
              mmHeight = 5821
              mmLeft = 160602
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
            object ppShape16: TppShape
              UserName = 'Shape16'
              mmHeight = 5821
              mmLeft = 186002
              mmTop = 0
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DATADESTACAMENTO'
              DataPipeline = ppCalendario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 794
              mmTop = 794
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'CALC_HOSPEDAGEM'
              DataPipeline = ppCalendario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 25400
              mmTop = 794
              mmWidth = 63500
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'PCDESLOCAMENTO'
              DataPipeline = ppCalendario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 187061
              mmTop = 794
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'VLRDIARIA'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 90488
              mmTop = 794
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'PCDIARIA'
              DataPipeline = ppCalendario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 116152
              mmTop = 794
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'VLRHOTEL'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 125942
              mmTop = 794
              mmWidth = 23813
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'PCHOTEL'
              DataPipeline = ppCalendario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 151607
              mmTop = 794
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VLRDESLOCAMENTO'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 161396
              mmTop = 794
              mmWidth = 23813
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppShape17: TppShape
              UserName = 'Shape101'
              mmHeight = 5821
              mmLeft = 24606
              mmTop = 0
              mmWidth = 65352
              BandType = 7
            end
            object ppShape18: TppShape
              UserName = 'Shape18'
              mmHeight = 5821
              mmLeft = 89694
              mmTop = 0
              mmWidth = 25400
              BandType = 7
            end
            object ppShape20: TppShape
              UserName = 'Shape20'
              mmHeight = 5821
              mmLeft = 125148
              mmTop = 0
              mmWidth = 25400
              BandType = 7
            end
            object ppShape22: TppShape
              UserName = 'Shape22'
              mmHeight = 5821
              mmLeft = 160602
              mmTop = 0
              mmWidth = 25400
              BandType = 7
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4191
              mmLeft = 64558
              mmTop = 794
              mmWidth = 24342
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'DIARIA_COM_PERCENTUAL'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 90223
              mmTop = 794
              mmWidth = 24077
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'HOTEL_COM_PERCENTUAL'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 125942
              mmTop = 794
              mmWidth = 23813
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'DESLOCAMENTO_COM_PERCENTUAL'
              DataPipeline = ppCalendario
              DisplayFormat = '##,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCalendario'
              mmHeight = 4233
              mmLeft = 161396
              mmTop = 794
              mmWidth = 23813
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Data Inicial do'
          'Destacamento')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 5821
        mmTop = 35983
        mmWidth = 48154
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
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Valor do'
          'Destacamento')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 132027
        mmTop = 35190
        mmWidth = 64823
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 52388
        mmWidth = 197380
        BandType = 4
      end
      object ppShape39: TppShape
        UserName = 'Shape39'
        mmHeight = 8996
        mmLeft = 75671
        mmTop = 35983
        mmWidth = 52388
        BandType = 4
      end
      object ppShape40: TppShape
        UserName = 'Shape40'
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 44715
        mmWidth = 52388
        BandType = 4
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Data Final do'
          'Destacamento')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 75671
        mmTop = 35983
        mmWidth = 52388
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAFIM'
        DataPipeline = ppDestacamento
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 44715
        mmWidth = 52388
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Justificativa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 132027
        mmTop = 8202
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Cargo/Função:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 18256
        mmWidth = 29379
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label7'
        Caption = 'Centro Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 23283
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Nº :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 794
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDDESTACAMENTO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 5027
        mmLeft = 9525
        mmTop = 794
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'NOMEDESTACADO'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 13229
        mmWidth = 97896
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'MATRICULA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 8202
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'MATRICULA'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 8202
        mmWidth = 97896
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Centro Resp.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4318
        mmLeft = 2974
        mmTop = 28310
        mmWidth = 26924
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'CentroCusto1'
        DataField = 'CENTRORESPONSABILIDADE'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 31485
        mmTop = 28310
        mmWidth = 97896
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object lblNomeSistema: TppLabel
        UserName = 'Label1'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 79904
        mmTop = 1323
        mmWidth = 33073
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 164571
        mmTop = 1323
        mmWidth = 33073
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 197644
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 64294
      mmPrintPosition = 0
      object ppShape35: TppShape
        UserName = 'Shape35'
        mmHeight = 42598
        mmLeft = 17992
        mmTop = 14023
        mmWidth = 64558
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Valores:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 19050
        mmTop = 14817
        mmWidth = 14647
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Acerto de Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1588
        mmWidth = 34925
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Alimentação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23283
        mmTop = 23019
        mmWidth = 23368
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Outras Despesas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 29633
        mmWidth = 31284
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VALALIMENT'
        DataPipeline = ppDestacamento
        DisplayFormat = '##,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 59267
        mmTop = 23019
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'VALOUTROS'
        DataPipeline = ppDestacamento
        DisplayFormat = '##,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 59267
        mmTop = 29633
        mmWidth = 21431
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 22754
        mmTop = 35719
        mmWidth = 58208
        BandType = 7
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VLRACERTO'
        DataPipeline = ppDestacamento
        DisplayFormat = '##,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 59267
        mmTop = 37306
        mmWidth = 21431
        BandType = 7
      end
      object ppShape36: TppShape
        UserName = 'Shape36'
        mmHeight = 42598
        mmLeft = 88900
        mmTop = 14023
        mmWidth = 103717
        BandType = 7
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'JUSTIFICATIVA'
        DataPipeline = ppDestacamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 34925
        mmLeft = 89959
        mmTop = 20638
        mmWidth = 101600
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Observação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 14817
        mmWidth = 22183
        BandType = 7
      end
      object ppsRAD: TppSubReport
        UserName = 'sRAD'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppRAD'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 57944
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppRAD
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
          Units = utMillimeters
          Left = 240
          Top = 192
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppRAD'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Processo RAD:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 0
              mmWidth = 28660
              BandType = 1
            end
            object ppShape48: TppShape
              UserName = 'Shape48'
              mmHeight = 5292
              mmLeft = 0
              mmTop = 7143
              mmWidth = 30427
              BandType = 1
            end
            object ppShape50: TppShape
              UserName = 'Shape50'
              mmHeight = 5292
              mmLeft = 69321
              mmTop = 7143
              mmWidth = 50271
              BandType = 1
            end
            object ppShape51: TppShape
              UserName = 'Shape51'
              mmHeight = 5292
              mmLeft = 30163
              mmTop = 7143
              mmWidth = 39423
              BandType = 1
            end
            object ppShape52: TppShape
              UserName = 'Shape52'
              mmHeight = 5292
              mmLeft = 119327
              mmTop = 7143
              mmWidth = 43392
              BandType = 1
            end
            object ppShape53: TppShape
              UserName = 'Shape53'
              mmHeight = 5292
              mmLeft = 162454
              mmTop = 7143
              mmWidth = 34925
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              AutoSize = False
              Caption = 'Tipo Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 7673
              mmWidth = 28840
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 30956
              mmTop = 7673
              mmWidth = 37835
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 70115
              mmTop = 7673
              mmWidth = 48948
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'Usuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 120121
              mmTop = 7673
              mmWidth = 41804
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              AutoSize = False
              Caption = 'Data/Hora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 163248
              mmTop = 7673
              mmWidth = 33338
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppShape44: TppShape
              UserName = 'Shape44'
              mmHeight = 5292
              mmLeft = 0
              mmTop = 0
              mmWidth = 30427
              BandType = 4
            end
            object ppShape45: TppShape
              UserName = 'Shape45'
              mmHeight = 5292
              mmLeft = 69321
              mmTop = 0
              mmWidth = 50271
              BandType = 4
            end
            object ppShape46: TppShape
              UserName = 'Shape46'
              mmHeight = 5292
              mmLeft = 30163
              mmTop = 0
              mmWidth = 39423
              BandType = 4
            end
            object ppShape47: TppShape
              UserName = 'Shape47'
              mmHeight = 5292
              mmLeft = 119327
              mmTop = 0
              mmWidth = 43392
              BandType = 4
            end
            object ppShape49: TppShape
              UserName = 'Shape49'
              mmHeight = 5292
              mmLeft = 162454
              mmTop = 0
              mmWidth = 34925
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'TIPOPROCESSO'
              DataPipeline = ppRAD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRAD'
              mmHeight = 4233
              mmLeft = 794
              mmTop = 529
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'DESCRICAO'
              DataPipeline = ppRAD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRAD'
              mmHeight = 4233
              mmLeft = 30956
              mmTop = 529
              mmWidth = 37835
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'STATUS'
              DataPipeline = ppRAD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRAD'
              mmHeight = 4233
              mmLeft = 70115
              mmTop = 529
              mmWidth = 48683
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'USUARIO'
              DataPipeline = ppRAD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRAD'
              mmHeight = 4233
              mmLeft = 120121
              mmTop = 529
              mmWidth = 41804
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'DATA'
              DataPipeline = ppRAD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Verdana'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppRAD'
              mmHeight = 4233
              mmLeft = 163248
              mmTop = 529
              mmWidth = 33338
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText25: TppDBText
        UserName = 'ValorDestacamento1'
        DataField = 'VLRDESTACAMENTO'
        DataPipeline = ppDestacamento
        DisplayFormat = '##,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 43127
        mmWidth = 21696
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 22754
        mmTop = 48419
        mmWidth = 58208
        BandType = 7
      end
      object lblSaldo: TppLabel
        UserName = 'lblSaldo'
        AutoSize = False
        Caption = 'lblSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 50536
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 50536
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Destacamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 43127
        mmWidth = 33602
        BandType = 7
      end
      object lblTipoAcerto: TppLabel
        UserName = 'lblTipoAcerto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 37571
        mmTop = 1588
        mmWidth = 34925
        BandType = 7
      end
      object ppShape54: TppShape
        UserName = 'Shape54'
        mmHeight = 4233
        mmLeft = 88636
        mmTop = 9260
        mmWidth = 48154
        BandType = 7
      end
      object ppShape55: TppShape
        UserName = 'Shape55'
        mmHeight = 8996
        mmLeft = 88636
        mmTop = 529
        mmWidth = 48154
        BandType = 7
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'DATAINIEFET'
        DataPipeline = ppDestacamento
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 88636
        mmTop = 9260
        mmWidth = 48154
        BandType = 7
      end
      object ppMemo4: TppMemo
        UserName = 'Memo4'
        Caption = 'Memo4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Data Inicial'
          '  Efetiva')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 88636
        mmTop = 529
        mmWidth = 48154
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape56: TppShape
        UserName = 'Shape56'
        mmHeight = 8996
        mmLeft = 140229
        mmTop = 529
        mmWidth = 52388
        BandType = 7
      end
      object ppShape57: TppShape
        UserName = 'Shape401'
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 9260
        mmWidth = 52388
        BandType = 7
      end
      object ppMemo5: TppMemo
        UserName = 'Memo5'
        Caption = 'Memo5'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Data Final'
          '  Efetiva'
          '')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8996
        mmLeft = 140229
        mmTop = 529
        mmWidth = 52388
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'DATAFIMEFET'
        DataPipeline = ppDestacamento
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDestacamento'
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 9260
        mmWidth = 52388
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDDESTACAMENTO'
      DataPipeline = ppDestacamento
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDestacamento'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppTrecho'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5000
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppTrecho
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
            Units = utMillimeters
            Left = 488
            Top = 360
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppTrecho'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 12965
              mmPrintPosition = 0
              object ppLabel16: TppLabel
                UserName = 'Label16'
                Caption = 'Trechos do Destacamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 0
                mmWidth = 52409
                BandType = 1
              end
              object ppShape26: TppShape
                UserName = 'Shape26'
                mmHeight = 5556
                mmLeft = 0
                mmTop = 7144
                mmWidth = 36513
                BandType = 1
              end
              object ppLabel17: TppLabel
                UserName = 'Label17'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 794
                mmTop = 7938
                mmWidth = 34925
                BandType = 1
              end
              object ppShape27: TppShape
                UserName = 'Shape27'
                mmHeight = 5821
                mmLeft = 36777
                mmTop = 7144
                mmWidth = 68792
                BandType = 1
              end
              object ppLabel18: TppLabel
                UserName = 'Label18'
                AutoSize = False
                Caption = 'Cidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 37571
                mmTop = 7938
                mmWidth = 67469
                BandType = 1
              end
              object ppShape28: TppShape
                UserName = 'Shape28'
                mmHeight = 5821
                mmLeft = 105569
                mmTop = 7144
                mmWidth = 29898
                BandType = 1
              end
              object ppLabel19: TppLabel
                UserName = 'Label104'
                AutoSize = False
                Caption = 'Transporte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 106363
                mmTop = 7938
                mmWidth = 28046
                BandType = 1
              end
              object ppShape29: TppShape
                UserName = 'Shape29'
                mmHeight = 5821
                mmLeft = 135202
                mmTop = 7144
                mmWidth = 29898
                BandType = 1
              end
              object ppLabel20: TppLabel
                UserName = 'Label20'
                AutoSize = False
                Caption = 'Embarque'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 135996
                mmTop = 7938
                mmWidth = 28046
                BandType = 1
              end
              object ppShape30: TppShape
                UserName = 'Shape30'
                mmHeight = 5821
                mmLeft = 164836
                mmTop = 7144
                mmWidth = 31221
                BandType = 1
              end
              object ppLabel21: TppLabel
                UserName = 'Label21'
                AutoSize = False
                Caption = 'Desembarque'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 165894
                mmTop = 7938
                mmWidth = 29369
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
              object ppShape19: TppShape
                UserName = 'Shape19'
                mmHeight = 5821
                mmLeft = 0
                mmTop = 0
                mmWidth = 36513
                BandType = 4
              end
              object ppShape21: TppShape
                UserName = 'Shape102'
                mmHeight = 5821
                mmLeft = 36513
                mmTop = 0
                mmWidth = 68792
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'DATAINI'
                DataPipeline = ppTrecho
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 794
                mmTop = 794
                mmWidth = 34660
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'NOME'
                DataPipeline = ppTrecho
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 37571
                mmTop = 794
                mmWidth = 67469
                BandType = 4
              end
              object ppShape23: TppShape
                UserName = 'Shape23'
                mmHeight = 5821
                mmLeft = 105569
                mmTop = 0
                mmWidth = 29898
                BandType = 4
              end
              object ppDBText14: TppDBText
                UserName = 'DBText14'
                DataField = 'VLRTRANSPORTE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 106363
                mmTop = 794
                mmWidth = 28310
                BandType = 4
              end
              object ppShape24: TppShape
                UserName = 'Shape24'
                mmHeight = 5821
                mmLeft = 135202
                mmTop = 0
                mmWidth = 29898
                BandType = 4
              end
              object ppDBText15: TppDBText
                UserName = 'DBText15'
                DataField = 'VLREMBARQUE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 135996
                mmTop = 794
                mmWidth = 28310
                BandType = 4
              end
              object ppShape25: TppShape
                UserName = 'Shape25'
                mmHeight = 5821
                mmLeft = 164836
                mmTop = 0
                mmWidth = 31221
                BandType = 4
              end
              object ppDBText16: TppDBText
                UserName = 'DBText16'
                DataField = 'VLRDESEMBARQUE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 165629
                mmTop = 794
                mmWidth = 29633
                BandType = 4
              end
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Stretch = True
                mmHeight = 7673
                mmLeft = 0
                mmTop = 5556
                mmWidth = 196057
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppDBMemo3: TppDBMemo
                  UserName = 'DBMemo3'
                  CharWrap = False
                  DataField = 'OBSERVACAO'
                  DataPipeline = ppTrecho
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Verdana'
                  Font.Size = 10
                  Font.Style = []
                  Stretch = True
                  Transparent = True
                  DataPipelineName = 'ppTrecho'
                  mmHeight = 5292
                  mmLeft = 794
                  mmTop = 6879
                  mmWidth = 194469
                  BandType = 4
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmLeading = 0
                end
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppShape31: TppShape
                UserName = 'Shape31'
                mmHeight = 5821
                mmLeft = 36513
                mmTop = 0
                mmWidth = 68792
                BandType = 7
              end
              object ppLabel22: TppLabel
                UserName = 'Label22'
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 63077
                mmTop = 794
                mmWidth = 41540
                BandType = 7
              end
              object ppShape32: TppShape
                UserName = 'Shape32'
                mmHeight = 5821
                mmLeft = 105569
                mmTop = 0
                mmWidth = 29898
                BandType = 7
              end
              object ppDBCalc4: TppDBCalc
                UserName = 'DBCalc4'
                DataField = 'VLRTRANSPORTE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 106363
                mmTop = 794
                mmWidth = 27781
                BandType = 7
              end
              object ppShape33: TppShape
                UserName = 'Shape201'
                mmHeight = 5821
                mmLeft = 135202
                mmTop = 0
                mmWidth = 29898
                BandType = 7
              end
              object ppDBCalc5: TppDBCalc
                UserName = 'DBCalc5'
                DataField = 'VLREMBARQUE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 136261
                mmTop = 794
                mmWidth = 27781
                BandType = 7
              end
              object ppShape34: TppShape
                UserName = 'Shape34'
                mmHeight = 5821
                mmLeft = 164836
                mmTop = 0
                mmWidth = 31221
                BandType = 7
              end
              object ppDBCalc6: TppDBCalc
                UserName = 'DBCalc6'
                DataField = 'VLRDESEMBARQUE'
                DataPipeline = ppTrecho
                DisplayFormat = '##,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppTrecho'
                mmHeight = 4233
                mmLeft = 165894
                mmTop = 794
                mmWidth = 29104
                BandType = 7
              end
            end
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
        object ppSubReport3: TppSubReport
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubReport2
          TraverseAllData = False
          DataPipelineName = 'ppDespesas'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 10848
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppDespesas
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
            Units = utMillimeters
            Left = 176
            Top = 128
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppDespesas'
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11906
              mmPrintPosition = 0
              object ppShape61: TppShape
                UserName = 'Shape61'
                mmHeight = 5556
                mmLeft = 123825
                mmTop = 6350
                mmWidth = 73554
                BandType = 1
              end
              object ppShape60: TppShape
                UserName = 'Shape60'
                mmHeight = 5556
                mmLeft = 101865
                mmTop = 6350
                mmWidth = 21960
                BandType = 1
              end
              object ppShape59: TppShape
                UserName = 'Shape59'
                mmHeight = 5556
                mmLeft = 34660
                mmTop = 6350
                mmWidth = 67204
                BandType = 1
              end
              object ppShape58: TppShape
                UserName = 'Shape58'
                mmHeight = 5556
                mmLeft = 2117
                mmTop = 6350
                mmWidth = 32279
                BandType = 1
              end
              object ppLabel38: TppLabel
                UserName = 'Label38'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 2910
                mmTop = 6879
                mmWidth = 30427
                BandType = 1
              end
              object ppLabel39: TppLabel
                UserName = 'Label39'
                Caption = 'Tipo de Despesa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 35454
                mmTop = 6879
                mmWidth = 65088
                BandType = 1
              end
              object ppLabel40: TppLabel
                UserName = 'Label40'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4233
                mmLeft = 103188
                mmTop = 6879
                mmWidth = 19050
                BandType = 1
              end
              object ppLabel41: TppLabel
                UserName = 'Label41'
                Caption = 'Observação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 124619
                mmTop = 6879
                mmWidth = 23283
                BandType = 1
              end
              object ppLabel42: TppLabel
                UserName = 'Label42'
                Caption = 'Despesas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 4318
                mmLeft = 2117
                mmTop = 1588
                mmWidth = 20320
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppShape65: TppShape
                UserName = 'Shape65'
                ParentHeight = True
                mmHeight = 5821
                mmLeft = 123825
                mmTop = 0
                mmWidth = 73554
                BandType = 4
              end
              object ppShape64: TppShape
                UserName = 'Shape64'
                ParentHeight = True
                mmHeight = 5821
                mmLeft = 101865
                mmTop = 0
                mmWidth = 21960
                BandType = 4
              end
              object ppShape63: TppShape
                UserName = 'Shape63'
                ParentHeight = True
                mmHeight = 5821
                mmLeft = 34660
                mmTop = 0
                mmWidth = 67204
                BandType = 4
              end
              object ppShape62: TppShape
                UserName = 'Shape62'
                ParentHeight = True
                mmHeight = 5821
                mmLeft = 2117
                mmTop = 0
                mmWidth = 32808
                BandType = 4
              end
              object ppDBText29: TppDBText
                UserName = 'DBText29'
                DataField = 'DATAREF'
                DataPipeline = ppDespesas
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDespesas'
                mmHeight = 4318
                mmLeft = 1852
                mmTop = 794
                mmWidth = 32544
                BandType = 4
              end
              object ppDBText30: TppDBText
                UserName = 'DBText30'
                DataField = 'DESCRICAO'
                DataPipeline = ppDespesas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDespesas'
                mmHeight = 4318
                mmLeft = 35454
                mmTop = 794
                mmWidth = 65881
                BandType = 4
              end
              object ppDBText31: TppDBText
                UserName = 'DBText31'
                DataField = 'VALOR'
                DataPipeline = ppDespesas
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDespesas'
                mmHeight = 4318
                mmLeft = 102923
                mmTop = 794
                mmWidth = 20108
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'DBText32'
                DataField = 'OBSCURTA'
                DataPipeline = ppDespesas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDespesas'
                mmHeight = 4318
                mmLeft = 124619
                mmTop = 794
                mmWidth = 71702
                BandType = 4
              end
            end
            object ppSummaryBand5: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppShape67: TppShape
                UserName = 'Shape67'
                ParentHeight = True
                mmHeight = 4763
                mmLeft = 101865
                mmTop = 0
                mmWidth = 21960
                BandType = 7
              end
              object ppShape66: TppShape
                UserName = 'Shape66'
                ParentHeight = True
                mmHeight = 4763
                mmLeft = 34660
                mmTop = 0
                mmWidth = 67204
                BandType = 7
              end
              object ppDBCalc7: TppDBCalc
                UserName = 'DBCalc7'
                DataField = 'VALOR'
                DataPipeline = ppDespesas
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDespesas'
                mmHeight = 4233
                mmLeft = 102659
                mmTop = 0
                mmWidth = 20373
                BandType = 7
              end
              object ppLabel43: TppLabel
                UserName = 'Label43'
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Verdana'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4318
                mmLeft = 88106
                mmTop = 265
                mmWidth = 11515
                BandType = 7
              end
            end
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDestacamento: TppBDEPipeline
    DataSource = dsDestacamento
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'Destacamento'
    Left = 31
    Top = 215
    object ppDestacamentoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDESTACAMENTO'
      FieldName = 'IDDESTACAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDestacamentoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROCESSO'
      FieldName = 'IDPROCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDestacamentoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDestacamentoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGFUNCIONARIO'
      FieldName = 'FLGFUNCIONARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDestacamentoppField5: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDestacamentoppField6: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDestacamentoppField7: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 6
    end
    object ppDestacamentoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRACERTO'
      FieldName = 'VLRACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDestacamentoppField9: TppField
      FieldAlias = 'INDACERTO'
      FieldName = 'INDACERTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppDestacamentoppField10: TppField
      FieldAlias = 'JUSTIFICATIVA'
      FieldName = 'JUSTIFICATIVA'
      FieldLength = 200
      DisplayWidth = 200
      Position = 9
    end
    object ppDestacamentoppField11: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object ppDestacamentoppField12: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object ppDestacamentoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDOBJETIVO'
      FieldName = 'INDOBJETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDestacamentoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGLANCAFOLHA'
      FieldName = 'FLGLANCAFOLHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDestacamentoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGGERAAP'
      FieldName = 'FLGGERAAP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDestacamentoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALALIMENT'
      FieldName = 'VALALIMENT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDestacamentoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOUTROS'
      FieldName = 'VALOUTROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDestacamentoppField18: TppField
      FieldAlias = 'DATAEMAILACERTO'
      FieldName = 'DATAEMAILACERTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object ppDestacamentoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCACERTO'
      FieldName = 'CODDOCACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDestacamentoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCDESTAC'
      FieldName = 'CODDOCDESTAC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDestacamentoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDUSUARIOSISTEMA'
      FieldName = 'IDUSUARIOSISTEMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppDestacamentoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROCESSOACERTO'
      FieldName = 'IDPROCESSOACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppDestacamentoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDESTACAMENTO'
      FieldName = 'VLRDESTACAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppDestacamentoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDUSUARIOACERTO'
      FieldName = 'IDUSUARIOACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppDestacamentoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppDestacamentoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppDestacamentoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEMPRESA'
      FieldName = 'IDEMPRESA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDestacamentoppField28: TppField
      FieldAlias = 'TITULO'
      FieldName = 'TITULO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 27
    end
    object ppDestacamentoppField29: TppField
      FieldAlias = 'CODCENTROCUSTODESTAC'
      FieldName = 'CODCENTROCUSTODESTAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object ppDestacamentoppField30: TppField
      FieldAlias = 'CENTROCUSTODESTAC'
      FieldName = 'CENTROCUSTODESTAC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 29
    end
    object ppDestacamentoppField31: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 30
    end
    object ppDestacamentoppField32: TppField
      FieldAlias = 'NOMEDESTACADO'
      FieldName = 'NOMEDESTACADO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 31
    end
    object ppDestacamentoppField33: TppField
      FieldAlias = 'USUARIODESTAC'
      FieldName = 'USUARIODESTAC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 32
    end
    object ppDestacamentoppField34: TppField
      FieldAlias = 'USUARIOACERTO'
      FieldName = 'USUARIOACERTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 33
    end
    object ppDestacamentoppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCDESTAC'
      FieldName = 'DOCDESTAC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppDestacamentoppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCACERTO'
      FieldName = 'DOCACERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppDestacamentoppField37: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 36
    end
    object ppDestacamentoppField38: TppField
      FieldAlias = 'CENTRORESPONSABILIDADE'
      FieldName = 'CENTRORESPONSABILIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 37
    end
  end
  object ppCalendario: TppBDEPipeline
    DataSource = dsCalen
    OpenDataSource = False
    UserName = 'Calendario'
    Left = 109
    Top = 215
    MasterDataPipelineName = 'ppDestacamento'
    object ppCalendarioppField1: TppField
      FieldAlias = 'CALC_HOSPEDAGEM'
      FieldName = 'CALC_HOSPEDAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField2: TppField
      FieldAlias = 'IDDESTACAMENTO'
      FieldName = 'IDDESTACAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField3: TppField
      FieldAlias = 'DATADESTACAMENTO'
      FieldName = 'DATADESTACAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField4: TppField
      FieldAlias = 'FLGDIARIA'
      FieldName = 'FLGDIARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField5: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField6: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField7: TppField
      FieldAlias = 'VLRDIARIA'
      FieldName = 'VLRDIARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField8: TppField
      FieldAlias = 'VLRHOTEL'
      FieldName = 'VLRHOTEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField9: TppField
      FieldAlias = 'VLRDESLOCAMENTO'
      FieldName = 'VLRDESLOCAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField10: TppField
      FieldAlias = 'PCDIARIA'
      FieldName = 'PCDIARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField11: TppField
      FieldAlias = 'PCHOTEL'
      FieldName = 'PCHOTEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField12: TppField
      FieldAlias = 'PCDESLOCAMENTO'
      FieldName = 'PCDESLOCAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField13: TppField
      FieldAlias = 'DIARIA_COM_PERCENTUAL'
      FieldName = 'DIARIA_COM_PERCENTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField14: TppField
      FieldAlias = 'HOTEL_COM_PERCENTUAL'
      FieldName = 'HOTEL_COM_PERCENTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppCalendarioppField15: TppField
      FieldAlias = 'DESLOCAMENTO_COM_PERCENTUAL'
      FieldName = 'DESLOCAMENTO_COM_PERCENTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
  end
  object ppTrecho: TppBDEPipeline
    DataSource = dsTrecho
    OpenDataSource = False
    UserName = 'Trecho'
    Left = 184
    Top = 215
    MasterDataPipelineName = 'ppDestacamento'
  end
  object qryDestacamento: TCMSqlParams
    SQL.Strings = (
      ' SELECT '
      '   D.*, C.TITULO, '
      '   CC.CODCENTROCUSTO as CODCENTROCUSTODESTAC, '
      '   CC.NOME as CENTROCUSTODESTAC, '
      '   F.MATRICULA, P.NOME AS NOMEDESTACADO, '
      '   P1.NOME as USUARIODESTAC, '
      '   P2.NOME as USUARIOACERTO, '
      '   D1.NODOCUMENTO as DOCDESTAC, '
      '   D2.NODOCUMENTO as DOCACERTO,'
      '   CC2.NOME as CENTROCUSTO,'
      '   CR.NOME as CENTRORESPONSABILIDADE'
      ''
      ' FROM '
      '   DESTACAMENTO D, CARGO C, CENTCUST CC, '
      '   FUNCIONARIO F, PESSOA P, '
      '   PESSOA P1, PESSOA P2, '
      '   DOCUMENTO D1, DOCUMENTO D2,'
      '   CENTCUST CC2, CENTRESPON CR'
      ''
      ' WHERE '
      '   (P.IDPESSOA = F.IDPESSOA) '
      '   AND (F.IDPESSOA = D.IDPESSOA) '
      
        '   AND (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO)  = C.IDCARG' +
        'O) '
      '   AND (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) '
      '   AND (F.IDEMPRESA = CC.IDEMPRESA) '
      '   AND (P1.IDPESSOA (+) = D.IDUSUARIOSISTEMA) '
      '   AND (P2.IDPESSOA (+) = D.IDUSUARIOACERTO) '
      '   AND (D1.CODDOCUMENTO (+) = D.CODDOCDESTAC) '
      '   AND (D2.CODDOCUMENTO (+) = D.CODDOCACERTO) '
      '   AND (CC2.CODCENTROCUSTO = D.CODCENTROCUSTO)'
      '   AND (CR.CODCENTRORESPON = D.CODCENTRORESPON)'
      ''
      ' ORDER BY'
      '   DATAINI, DATAFIM')
    ClientDataSet = cdsDestacamento
    Left = 31
    Top = 78
  end
  object qryCalendario: TCMSqlParams
    SQL.Strings = (
      'select * from dstcalendario')
    ClientDataSet = cdsCalen
    Left = 109
    Top = 78
  end
  object qryTrecho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' D.*, C.NOME'
      'FROM'
      '  DSTTRECHO D, CIDADES C'
      'WHERE'
      '  (D.IDCIDADES = C.IDCIDADES)'
      'ORDER BY D.DATAINI')
    ClientDataSet = cdsTrecho
    Left = 184
    Top = 78
  end
  object dsDestacamento: TwwDataSource
    AutoEdit = False
    DataSet = cdsDestacamento
    Left = 31
    Top = 167
  end
  object msDestacamento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Destacamento'
    Colunas.Strings = (
      'D.IDDESTACAMENTO'
      'P.NOME'
      'D.DATAINI'
      'D.DATAFIM'
      
        'DECODE(R1.FLGOK,'#39'E'#39','#39'EXCLUÍDO'#39','#39'N'#39','#39'PENDENTE'#39','#39'R'#39','#39'RECUSADO'#39','#39'S'#39 +
        ','#39'APROVADO'#39',NULL)')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'L')
    Descricao.Strings = (
      'Número Interno'
      'Destacado'
      'Data Inicial'
      'Data Final'
      'RAD Destac.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'DESTACAMENTO D'
      'RADINSTPROCESSO R1')
    CamposChave.Strings = (
      'IDDESTACAMENTO')
    Filtro.Strings = (
      'D.IDPESSOA = P.IDPESSOA'
      'D.IDPROCESSO = R1.IDPROCESSO (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '38'
      '15'
      '15'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      
        'SELECT DISTINCT DECODE(FLGOK,'#39'E'#39','#39'EXCLUÍDO'#39','#39'N'#39','#39'PENDENTE'#39','#39'R'#39','#39 +
        'RECUSADO'#39','#39'S'#39','#39'APROVADO'#39',NULL) AS SRD FROM RADINSTPROCESSO')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      'SRD')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      'SRD')
    Left = 303
    Top = 6
  end
  object cdsCalen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 123
    object cdsCalenCALC_HOSPEDAGEM: TStringField
      DisplayLabel = 'Hospedagem'
      DisplayWidth = 28
      FieldKind = fkCalculated
      FieldName = 'CALC_HOSPEDAGEM'
      Size = 10
      Calculated = True
    end
    object cdsCalenIDDESTACAMENTO: TFloatField
      FieldName = 'IDDESTACAMENTO'
    end
    object cdsCalenDATADESTACAMENTO: TDateTimeField
      FieldName = 'DATADESTACAMENTO'
    end
    object cdsCalenFLGDIARIA: TFloatField
      FieldName = 'FLGDIARIA'
    end
    object cdsCalenTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsCalenTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsCalenVLRDIARIA: TFloatField
      FieldName = 'VLRDIARIA'
    end
    object cdsCalenVLRHOTEL: TFloatField
      FieldName = 'VLRHOTEL'
    end
    object cdsCalenVLRDESLOCAMENTO: TFloatField
      FieldName = 'VLRDESLOCAMENTO'
    end
    object cdsCalenPCDIARIA: TFloatField
      FieldName = 'PCDIARIA'
    end
    object cdsCalenPCHOTEL: TFloatField
      FieldName = 'PCHOTEL'
    end
    object cdsCalenPCDESLOCAMENTO: TFloatField
      FieldName = 'PCDESLOCAMENTO'
    end
    object cdsCalenDIARIA_COM_PERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIARIA_COM_PERCENTUAL'
      Calculated = True
    end
    object cdsCalenHOTEL_COM_PERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'HOTEL_COM_PERCENTUAL'
      Calculated = True
    end
    object cdsCalenDESLOCAMENTO_COM_PERCENTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DESLOCAMENTO_COM_PERCENTUAL'
      Calculated = True
    end
  end
  object dsCalen: TwwDataSource
    AutoEdit = False
    DataSet = cdsCalen
    Left = 109
    Top = 167
  end
  object cdsTrecho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 123
  end
  object dsTrecho: TwwDataSource
    AutoEdit = False
    DataSet = cdsTrecho
    Left = 184
    Top = 167
  end
  object cdsDestacamento: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 31
    Top = 123
    Data = {
      490400009619E0BD01000000180000002600000000000300000049040E494444
      4553544143414D454E544F08000400000000000A494450524F434553534F0800
      040000000000084944504553534F4108000400000000000E464C4746554E4349
      4F4E4152494F08000400000000000744415441494E4908000800000000000744
      41544146494D08000800000000000A4F42534552564143414F01004900000001
      0005574944544802000200C80009564C5241434552544F080004000000000009
      494E4441434552544F01004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020001000D4A555354494649434154
      495641010049000000010005574944544802000200C8000D5452474454494E43
      4C5553414F08000800000000000F54524755534552494E434C5553414F010049
      0000000100055749445448020002001E000B494E444F424A455449564F080004
      00000000000D464C474C414E4341464F4C4841080004000000000009464C4747
      455241415008000400000000000A56414C414C494D454E540800040000000000
      0956414C4F5554524F5308000400000000000F44415441454D41494C41434552
      544F08000800000000000C434F44444F4341434552544F08000400000000000C
      434F44444F4344455354414308000400000000001049445553554152494F5349
      5354454D41080004000000000010494450524F434553534F41434552544F0800
      0400000000000F564C52444553544143414D454E544F08000400000000000F49
      445553554152494F41434552544F08000400000000000E434F4443454E54524F
      435553544F08000400000000000F434F4443454E54524F524553504F4E080004
      0000000000094944454D5052455341080004000000000006544954554C4F0100
      49000000010005574944544802000200280014434F4443454E54524F43555354
      4F44455354414301004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A001143454E54524F435553544F44
      45535441430100490000000100055749445448020002001E00094D4154524943
      554C410100490000000100055749445448020002000D000D4E4F4D4544455354
      414341444F0100490000000100055749445448020002003C000D555355415249
      4F4445535441430100490000000100055749445448020002003C000D55535541
      52494F41434552544F0100490000000100055749445448020002003C0009444F
      43444553544143080004000000000009444F4341434552544F08000400000000
      000B43454E54524F435553544F0100490000000100055749445448020002001E
      001643454E54524F524553504F4E534142494C49444144450100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02001E0002000D44454641554C545F4F52444552020082000200000005000600
      044C4349440400010009080000}
  end
  object cdsRAD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 125
  end
  object qryRAD: TCMSqlParams
    SQL.Strings = (
      ' SELECT '
      '   d.IDDESTACAMENTO, '
      
        '   DECODE(e.idradtipoproc,3,'#39'DESTACAMENTO'#39',4,'#39'ACERTO'#39') TIPOPROCE' +
        'SSO, '
      '   e.descricao, '
      
        '   decode(u.flgok,'#39'S'#39',DECODE(u.flgressalva,1,'#39'APROVADO COM RESSA' +
        'LVA'#39','#39'APROVADO'#39'), '
      '                  '#39'N'#39','#39'PENDENTE'#39', '
      '                  '#39'R'#39','#39'RECUSADO'#39', '
      '                  '#39'E'#39','#39'EXCLUÍDO'#39') Status, '
      '   us.nomeusuario USUARIO,'
      '   TO_CHAR(r.datafimetapa, '#39'DD/MM/YYYY HH24:MI'#39') DATA, '
      '   u.obs ,'
      '   e.numero '
      ' from '
      '   radetapa e, '
      '   radetapaprocusu u, '
      '   radetapaproc r, '
      '   destacamento d, '
      '   usuariosistema us '
      ' where '
      '   u.idradetapaproc = r.idradetapaproc '
      '   and e.idradetapa = r.idradetapa '
      
        '   and (d.idprocesso = r.idprocesso or d.idprocessoacerto = r.id' +
        'processo) '
      '   and us.idusuario = u.idusuario '
      '   and d.iddestacamento = 9'
      ' order by '
      '   TIPOPROCESSO,'
      '   e.numero ')
    ClientDataSet = cdsRAD
    Left = 256
    Top = 80
  end
  object dsRAD: TwwDataSource
    AutoEdit = False
    DataSet = cdsRAD
    Left = 256
    Top = 169
  end
  object ppRAD: TppBDEPipeline
    DataSource = dsRAD
    UserName = 'RAD'
    Left = 256
    Top = 215
    MasterDataPipelineName = 'ppDestacamento'
  end
  object ppDespesas: TppBDEPipeline
    DataSource = dsDespesas
    OpenDataSource = False
    UserName = 'Despesas'
    Left = 312
    Top = 215
  end
  object qryDespesas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' D.*, C.DESCRICAO, SUBSTR(D.OBSERVACAO,1,40) AS OBSCURTA'
      'FROM'
      '  DSTITEMDESPESA D, DSTTIPODESPESA C'
      'WHERE'
      '  (D.IDDSTTIPODESPESA = C.IDDSTTIPODESPESA)'
      'ORDER BY D.DATAREF, C.DESCRICAO')
    ClientDataSet = cdsDespesas
    Left = 312
    Top = 78
  end
  object cdsDespesas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 123
  end
  object dsDespesas: TwwDataSource
    AutoEdit = False
    DataSet = cdsDespesas
    Left = 312
    Top = 167
  end
end
