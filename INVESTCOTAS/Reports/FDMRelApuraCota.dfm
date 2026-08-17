inherited RelApuraCota: TRelApuraCota
  Top = 168
  Width = 623
  Height = 442
  Caption = 'RelApuraCota'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Data Inicial :'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Data Final :'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Carteira de Investimentos :'
        Controle = tcLookupCombo
        CampoBanco = 'DESCCARTINVEST'
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCCARTINVEST, IDCARTEIRAINVEST  '
          'FROM    CARTEIRAINVEST ')
        LookupSettings.Chave = 'IDCARTEIRAINVEST'
        LookupSettings.Display = 'DESCCARTINVEST'
        LookupSettings.Descricao = 'Descrição'
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
      end>
  end
  inherited pplReport: TppBDEPipeline
    Left = 21
    object pplReportppField1: TppField
      FieldAlias = 'DATAHISTCOTA'
      FieldName = 'DATAHISTCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplReportppField2: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplReportppField3: TppField
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  inherited spl: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   HC.DATAHISTCOTA,  CI.DESCCARTINVEST, CI.IDCARTEIRAINVEST'
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI'
      'WHERE'
      '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+)'
      'AND  ECC.STACOTA          = '#39'S'#39
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+)'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+)'
      
        'GROUP BY  CI.IDCARTEIRAINVEST, CI.DESCCARTINVEST, HC.DATAHISTCOT' +
        'A'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = cds
  end
  inherited cds: TCMClientDataSet
    Active = False
  end
  inherited rptReport: TppReport
    OnStartPage = rptReportStartPage
    PrinterSetup.Orientation = poPortrait
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    BeforePrint = rptReportBeforePrint
    DataPipelineName = 'pplReport'
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 32015
      inherited LblEmpresa: TppLabel [0]
      end
      inherited lblNomeRelatorio: TppLabel [1]
        Caption = 'Consulta Apuração de Cotas'
        mmWidth = 48091
      end
      inherited ppDBImage: TppDBImage
        DataPipelineName = 'ppLogoTipo'
      end
      inherited lblPeriodo: TppLabel
        Visible = False
        mmHeight = 3641
        mmWidth = 11007
      end
      inherited shpCabecalho: TppShape
        mmTop = 23813
        mmWidth = 197300
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAHISTCOTA'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3641
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 14023
        mmWidth = 91281
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 265
        mmTop = 24606
        mmWidth = 98161
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Passivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 98954
        mmTop = 24606
        mmWidth = 97896
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 98954
        mmTop = 23813
        mmWidth = 13229
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmHeight = 6085
      inherited shpDetalhe: TppShape
        mmTop = 529
        mmWidth = 197300
      end
      object ppShape1: TppShape
        UserName = 'shpDetalhe1'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 4
      end
      object ppRAtivo: TppRegion
        UserName = 'RAtivo'
        Caption = 'RAtivo'
        Stretch = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 529
        mmWidth = 98690
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSRAtivo: TppSubReport
          UserName = 'SRAtivo'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplAtivo'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1059
          mmWidth = 98690
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplAtivo
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
            Left = 344
            Top = 160
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplAtivo'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'shpCabecalho1'
                Brush.Color = clGray
                mmHeight = 6350
                mmLeft = 529
                mmTop = 0
                mmWidth = 97630
                BandType = 1
              end
              object ppLabel3: TppLabel
                UserName = 'Label3'
                Caption = 'Evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4191
                mmLeft = 3704
                mmTop = 1323
                mmWidth = 11769
                BandType = 1
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4191
                mmLeft = 88371
                mmTop = 1323
                mmWidth = 8763
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppShape10: TppShape
                OnPrint = ppShape10Print
                UserName = 'Shape10'
                Brush.Color = clSilver
                Pen.Style = psClear
                mmHeight = 5292
                mmLeft = 529
                mmTop = 0
                mmWidth = 97896
                BandType = 4
              end
              object ppDBValorAtivo: TppDBText
                UserName = 'DBText1'
                DataField = 'VLRHISTCOTA'
                DataPipeline = pplAtivo
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplAtivo'
                mmHeight = 3260
                mmLeft = 67733
                mmTop = 794
                mmWidth = 29369
                BandType = 4
              end
              object ppDBEventoAtivo: TppDBText
                UserName = 'DBEventoAtivo'
                DataField = 'DESCCAIXACOTA'
                DataPipeline = pplAtivo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplAtivo'
                mmHeight = 3260
                mmLeft = 3704
                mmTop = 794
                mmWidth = 63500
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup3: TppGroup
              BreakName = 'DATAHISTCOTA'
              DataPipeline = pplAtivo
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group3'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplAtivo'
              object ppGroupHeaderBand3: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand3: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object ppGroup4: TppGroup
              BreakName = 'DESCCARTINVEST'
              DataPipeline = pplAtivo
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group4'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplAtivo'
              object ppGroupHeaderBand4: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand4: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5555
                mmPrintPosition = 0
                object ppDBTotalAtivo: TppDBCalc
                  UserName = 'DBTotalAtivo'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplAtivo
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  ResetGroup = ppGroup4
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplAtivo'
                  mmHeight = 3387
                  mmLeft = 67733
                  mmTop = 529
                  mmWidth = 29369
                  BandType = 5
                  GroupNo = 1
                end
                object ppLabel6: TppLabel
                  UserName = 'Label6'
                  Caption = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3387
                  mmLeft = 3704
                  mmTop = 529
                  mmWidth = 9229
                  BandType = 5
                  GroupNo = 1
                end
                object ppLine1: TppLine
                  UserName = 'Line1'
                  Weight = 0.75
                  mmHeight = 2381
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 98425
                  BandType = 5
                  GroupNo = 1
                end
              end
            end
          end
        end
      end
      object ppRPassivo: TppRegion
        UserName = 'RPassivo'
        Caption = 'RPassivo'
        Stretch = True
        mmHeight = 5556
        mmLeft = 99219
        mmTop = 529
        mmWidth = 97896
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSRPassivo: TppSubReport
          UserName = 'SRPassivo'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplPassivo'
          mmHeight = 5027
          mmLeft = 99219
          mmTop = 1059
          mmWidth = 97896
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplPassivo
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
            Left = 360
            Top = 176
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplPassivo'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppShape3: TppShape
                UserName = 'Shape3'
                Brush.Color = clGray
                mmHeight = 6350
                mmLeft = 529
                mmTop = 0
                mmWidth = 96573
                BandType = 1
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Evento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4191
                mmLeft = 3440
                mmTop = 1058
                mmWidth = 11769
                BandType = 1
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4191
                mmLeft = 87048
                mmTop = 1058
                mmWidth = 8763
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppShape11: TppShape
                OnPrint = ppShape11Print
                UserName = 'Shape101'
                Brush.Color = clSilver
                Pen.Style = psClear
                mmHeight = 5291
                mmLeft = 529
                mmTop = 0
                mmWidth = 97102
                BandType = 4
              end
              object ppDBValorPassivo: TppDBText
                UserName = 'DBValorPassivo'
                DataField = 'VLRHISTCOTA'
                DataPipeline = pplPassivo
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplPassivo'
                mmHeight = 3260
                mmLeft = 66146
                mmTop = 794
                mmWidth = 29633
                BandType = 4
              end
              object ppDBEventoPassivo: TppDBText
                UserName = 'DBEventoPassivo'
                DataField = 'DESCCAIXACOTA'
                DataPipeline = pplPassivo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplPassivo'
                mmHeight = 3260
                mmLeft = 3440
                mmTop = 794
                mmWidth = 62442
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup5: TppGroup
              BreakName = 'DATAHISTCOTA'
              DataPipeline = pplPassivo
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplPassivo'
              object ppGroupHeaderBand5: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand5: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object ppGroup6: TppGroup
              BreakName = 'DESCCARTINVEST'
              DataPipeline = pplPassivo
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplPassivo'
              object ppGroupHeaderBand6: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand6: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5556
                mmPrintPosition = 0
                object ppDBTotalPassivo: TppDBCalc
                  UserName = 'DBTotalPassivo'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplPassivo
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  ResetGroup = ppGroup6
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplPassivo'
                  mmHeight = 3387
                  mmLeft = 68527
                  mmTop = 529
                  mmWidth = 27252
                  BandType = 5
                  GroupNo = 1
                end
                object ppLabel7: TppLabel
                  UserName = 'Label7'
                  Caption = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3387
                  mmLeft = 3440
                  mmTop = 529
                  mmWidth = 9229
                  BandType = 5
                  GroupNo = 1
                end
                object ppLine3: TppLine
                  UserName = 'Line3'
                  Weight = 0.75
                  mmHeight = 2117
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97631
                  BandType = 5
                  GroupNo = 1
                end
              end
            end
          end
        end
      end
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppSystemVariable1: TppSystemVariable
        mmWidth = 197115
      end
      inherited LblSistema: TppLabel
        mmWidth = 196850
      end
      inherited ppLine2: TppLine
        mmWidth = 197300
      end
      inherited ppSystemVariable2: TppSystemVariable
        mmLeft = 168011
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAHISTCOTA'
      DataPipeline = pplReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReport'
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
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReport'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 48154
        mmPrintPosition = 0
        object ppRPLF: TppRegion
          UserName = 'RPLF'
          Caption = 'RPLF'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 25135
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRPLF: TppSubReport
            UserName = 'SRPLF'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplPLF'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 24871
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport7: TppChildReport
              AutoStop = False
              DataPipeline = pplPLF
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 320
              Top = 152
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplPLF'
              object ppTitleBand6: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand7: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape4: TppShape
                  UserName = 'Shape1'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText7: TppDBText
                  UserName = 'DBText7'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplPLF
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplPLF'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40747
                  BandType = 4
                end
                object ppDBText9: TppDBText
                  UserName = 'DBText9'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplPLF
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplPLF'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51595
                  BandType = 4
                end
              end
              object ppSummaryBand6: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup7: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplPLF
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group7'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplPLF'
                object ppGroupHeaderBand7: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand7: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup8: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplPLF
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group8'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplPLF'
                object ppGroupHeaderBand8: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand8: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
        object ppRQtd: TppRegion
          UserName = 'RQtd'
          Caption = 'RQtd'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 33073
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRQtd: TppSubReport
            UserName = 'SRQtd'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplQtd'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 32808
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport4: TppChildReport
              AutoStop = False
              DataPipeline = pplQtd
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 392
              Top = 208
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplQtd'
              object ppTitleBand3: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand4: TppDetailBand
                AfterPrint = ppDetailBand4AfterPrint
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape5: TppShape
                  UserName = 'Shape5'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText10: TppDBText
                  UserName = 'DBText10'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplQtd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplQtd'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51594
                  BandType = 4
                end
                object ppDBQtd: TppDBText
                  UserName = 'DBQtd'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplQtd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplQtd'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40746
                  BandType = 4
                end
              end
              object ppSummaryBand3: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup9: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplQtd
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group9'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplQtd'
                object ppGroupHeaderBand9: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand9: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup10: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplQtd
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group10'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplQtd'
                object ppGroupHeaderBand10: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand10: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
        object ppRCota: TppRegion
          UserName = 'RCota'
          Caption = 'RCota'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 41275
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRCota: TppSubReport
            UserName = 'SRCota'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            ParentWidth = False
            TraverseAllData = False
            DataPipelineName = 'pplCota'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 41010
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport5: TppChildReport
              AutoStop = False
              DataPipeline = pplCota
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 408
              Top = 224
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplCota'
              object ppTitleBand5: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand6: TppDetailBand
                AfterPrint = ppDetailBand6AfterPrint
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape6: TppShape
                  UserName = 'Shape6'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText12: TppDBText
                  UserName = 'DBText12'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplCota
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplCota'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51595
                  BandType = 4
                end
                object ppDBCota: TppDBText
                  UserName = 'DBCota'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplCota
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplCota'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40747
                  BandType = 4
                end
              end
              object ppSummaryBand5: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup11: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplCota
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group11'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCota'
                object ppGroupHeaderBand11: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand11: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup12: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplCota
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group12'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCota'
                object ppGroupHeaderBand12: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand12: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
        object ppRPL: TppRegion
          UserName = 'RPL'
          Caption = 'RPL'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 1058
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRPL: TppSubReport
            UserName = 'SRPL'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplPL'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 1058
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport3: TppChildReport
              AutoStop = False
              DataPipeline = pplPL
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 320
              Top = 152
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplPL'
              object ppTitleBand4: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand5: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape7: TppShape
                  UserName = 'Shape1'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText1: TppDBText
                  UserName = 'DBText7'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplPL
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplPL'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40747
                  BandType = 4
                end
                object ppDBText2: TppDBText
                  UserName = 'DBText9'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplPL
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplPL'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51595
                  BandType = 4
                end
              end
              object ppSummaryBand4: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup13: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplPL
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group7'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplPL'
                object ppGroupHeaderBand13: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand13: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup14: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplPL
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group8'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplPL'
                object ppGroupHeaderBand14: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand14: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
        object ppRCTE: TppRegion
          UserName = 'RCTE'
          Caption = 'RCTE'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 8996
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRCTE: TppSubReport
            UserName = 'SRCTE'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplCTE'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 8996
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport6: TppChildReport
              AutoStop = False
              DataPipeline = pplCTE
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 312
              Top = 216
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplCTE'
              object ppTitleBand7: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand8: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape8: TppShape
                  UserName = 'Shape8'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText3: TppDBText
                  UserName = 'DBText3'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplCTE
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplCTE'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40747
                  BandType = 4
                end
                object ppDBText6: TppDBText
                  UserName = 'DBText6'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplCTE
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplCTE'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51595
                  BandType = 4
                end
              end
              object ppSummaryBand7: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup15: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplCTE
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group15'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCTE'
                object ppGroupHeaderBand15: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand15: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup16: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplCTE
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group16'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCTE'
                object ppGroupHeaderBand16: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand16: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
        object ppRCTR: TppRegion
          UserName = 'RCTR'
          Caption = 'RCTR'
          Stretch = True
          mmHeight = 6350
          mmLeft = 99219
          mmTop = 16669
          mmWidth = 97102
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppSRCTR: TppSubReport
            UserName = 'SRCTR'
            ExpandAll = False
            NewPrintJob = False
            OutlineSettings.CreateNode = True
            TraverseAllData = False
            DataPipelineName = 'pplCTR'
            mmHeight = 5027
            mmLeft = 99219
            mmTop = 16669
            mmWidth = 97102
            BandType = 5
            GroupNo = 1
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            object ppChildReport8: TppChildReport
              AutoStop = False
              DataPipeline = pplCTR
              PrinterSetup.BinName = 'Default'
              PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
              Left = 408
              Top = 312
              Version = '7.04'
              mmColumnWidth = 0
              DataPipelineName = 'pplCTR'
              object ppTitleBand8: TppTitleBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppDetailBand9: TppDetailBand
                mmBottomOffset = 0
                mmHeight = 6350
                mmPrintPosition = 0
                object ppShape9: TppShape
                  UserName = 'Shape9'
                  Brush.Color = clSilver
                  mmHeight = 6350
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 97102
                  BandType = 4
                end
                object ppDBText8: TppDBText
                  UserName = 'DBText8'
                  DataField = 'VLRHISTCOTA'
                  DataPipeline = pplCTR
                  DisplayFormat = '#,0.00;-#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'pplCTR'
                  mmHeight = 3387
                  mmLeft = 55298
                  mmTop = 1323
                  mmWidth = 40747
                  BandType = 4
                end
                object ppDBText11: TppDBText
                  UserName = 'DBText11'
                  DataField = 'DESCCAIXACOTA'
                  DataPipeline = pplCTR
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'pplCTR'
                  mmHeight = 3387
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 51595
                  BandType = 4
                end
              end
              object ppSummaryBand8: TppSummaryBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroup17: TppGroup
                BreakName = 'DATAHISTCOTA'
                DataPipeline = pplCTR
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group17'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCTR'
                object ppGroupHeaderBand17: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand17: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
              object ppGroup18: TppGroup
                BreakName = 'DESCCARTINVEST'
                DataPipeline = pplCTR
                KeepTogether = True
                OutlineSettings.CreateNode = True
                UserName = 'Group18'
                mmNewColumnThreshold = 0
                mmNewPageThreshold = 0
                DataPipelineName = 'pplCTR'
                object ppGroupHeaderBand18: TppGroupHeaderBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppGroupFooterBand18: TppGroupFooterBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
      end
    end
  end
  object DsAtivo: TDataSource
    DataSet = CdsAtivo
    Left = 390
    Top = 11
  end
  object CdsAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 11
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA,'
      '   HC.VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, '
      
        '   ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, E' +
        'CC.IDTIPOINVEST,'
      '   ECC.IDREGRA, ECC.IDTIPODESPINVEST,  ECC.FLGMANUALAUT,'
      '   CI.DESCCARTINVEST'
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI'
      'WHERE'
      '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+)'
      'AND  ECC.STACOTA          = '#39'S'#39
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+)'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+)'
      'AND  ECC.STAATIVOPASSIVO  = '#39'A'#39
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsAtivo
    Left = 453
    Top = 9
  end
  object pplAtivo: TppBDEPipeline
    DataSource = DsAtivo
    UserName = 'lAtivo'
    Left = 514
    Top = 8
    MasterDataPipelineName = 'pplReport'
    object ppBDEPipeline2ppMasterFieldLink3: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplAtivoppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object DsPassivo: TDataSource
    DataSet = CdsPassivo
    Left = 390
    Top = 59
  end
  object CdsPassivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 59
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA,'
      '   HC.VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,'
      
        '   ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO, ECC.IDTIPOOPERACAO, E' +
        'CC.IDTIPOINVEST,'
      '   ECC.IDREGRA, ECC.IDTIPODESPINVEST,  ECC.FLGMANUALAUT,'
      '   CI.DESCCARTINVEST'
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI'
      'WHERE'
      '     HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+)'
      'AND  ECC.STACOTA          = '#39'S'#39
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+)'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+)'
      'AND  ECC.STAATIVOPASSIVO  = '#39'P'#39
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsPassivo
    Left = 453
    Top = 57
  end
  object pplPassivo: TppBDEPipeline
    DataSource = DsPassivo
    UserName = 'lPassivo'
    Left = 525
    Top = 56
    MasterDataPipelineName = 'pplReport'
    object ppBDEPipeline1ppMasterFieldLink3: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplPassivoppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CMSqlParams3: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA, '
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC, '
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO, '
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT, '
      '   CI.DESCCARTINVEST '
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI '
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -3 '
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO          '
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsPLF
    Left = 453
    Top = 109
  end
  object CdsPLF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 109
  end
  object DsPLF: TDataSource
    DataSet = CdsPLF
    Left = 398
    Top = 109
  end
  object pplPLF: TppBDEPipeline
    DataSource = DsPLF
    UserName = 'lPLF'
    Left = 525
    Top = 111
    MasterDataPipelineName = 'pplReport'
    object ppBDEPipeline1ppMasterFieldLink4: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplPLppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CMSqlParams4: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA, '
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC, '
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO, '
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT, '
      '   CI.DESCCARTINVEST '
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI '
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -4 '
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsQtd
    Left = 453
    Top = 155
  end
  object CdsQtd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 155
  end
  object DsQtd: TDataSource
    DataSet = CdsQtd
    Left = 398
    Top = 155
  end
  object pplQtd: TppBDEPipeline
    DataSource = DsQtd
    UserName = 'lQtd'
    Left = 525
    Top = 157
    MasterDataPipelineName = 'pplReport'
    object ppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplQtdppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CMSqlParams5: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA, '
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC, '
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO, '
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT, '
      '   CI.DESCCARTINVEST '
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI '
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -5'
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsCota
    Left = 453
    Top = 202
  end
  object CdsCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 202
  end
  object DsCota: TDataSource
    DataSet = CdsCota
    Left = 398
    Top = 202
  end
  object pplCota: TppBDEPipeline
    DataSource = DsCota
    UserName = 'lCota'
    Left = 525
    Top = 204
    MasterDataPipelineName = 'pplReport'
    object ppMasterFieldLink4: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplCotappMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CdsAux: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 146
    Data = {
      160100009619E0BD01000000180000000300020000000300000092000C444154
      4148495354434F544108000800000000000E4445534343415254494E56455354
      0100490000000100055749445448020002003C00104944434152544549524149
      4E56455354080004000000000002000D44454641554C545F4F52444552020082
      000200000002000100044C4349440400010009080000000000004EA445C9CC42
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F564553504129000000000000F03F000000007C3748C9
      CC422F4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849424F564553504129000000000000F03F}
  end
  object CMSqlParams7: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA, '
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC, '
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO, '
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT, '
      '   CI.DESCCARTINVEST '
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI '
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -16 '
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO          '
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsCTE
    Left = 453
    Top = 301
  end
  object CdsCTE: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 301
  end
  object DsCTE: TDataSource
    DataSet = CdsCTE
    Left = 398
    Top = 301
  end
  object pplCTE: TppBDEPipeline
    DataSource = DsCTE
    UserName = 'lCTE'
    Left = 525
    Top = 303
    MasterDataPipelineName = 'pplReport'
    object ppMasterFieldLink5: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object ppMasterFieldLink6: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CMSqlParams8: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA, '
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC, '
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO, '
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT, '
      '   CI.DESCCARTINVEST '
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI '
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -17 '
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO          '
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsCTR
    Left = 453
    Top = 351
  end
  object CdsCTR: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 351
  end
  object DsCTR: TDataSource
    DataSet = CdsCTR
    Left = 398
    Top = 351
  end
  object pplCTR: TppBDEPipeline
    DataSource = DsCTR
    UserName = 'lCTR'
    Left = 525
    Top = 353
    MasterDataPipelineName = 'pplReport'
    object ppMasterFieldLink7: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object ppMasterFieldLink8: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CMSqlParams6: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCOTA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVCTBPATR, HC' +
        '.DATAHISTCOTA,'
      
        '   NVL(HC.VLRHISTCOTA,0) AS VLRHISTCOTA, HC.IDCARTEIRAINVEST, HC' +
        '.IDCARTEIRAGERENC,'
      
        '   ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STAATIVOPASSIVO' +
        ', ECC.IDTIPOOPERACAO,'
      
        '   ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST, ECC.FLGM' +
        'ANUALAUT,'
      '   CI.DESCCARTINVEST'
      
        'FROM HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CARTE' +
        'IRAINVEST CI'
      'WHERE'
      '     ECC.STACOTA          = '#39'S'#39
      'AND  ECC.IDEVENTOCAIXACOTA = -18'
      'AND  CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA'
      'AND  CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST'
      'AND  HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA, HC.IDHISTCOTA')
    ClientDataSet = CdsPL
    Left = 453
    Top = 251
  end
  object CdsPL: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 251
  end
  object DsPL: TDataSource
    DataSet = CdsPL
    Left = 398
    Top = 251
  end
  object pplPL: TppBDEPipeline
    DataSource = DsPL
    UserName = 'lPL'
    Left = 525
    Top = 253
    MasterDataPipelineName = 'pplReport'
    object pplPLppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplPLppMasterFieldLink3: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
end
