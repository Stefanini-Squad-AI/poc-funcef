inherited RelEvolucaoPatr: TRelEvolucaoPatr
  Left = 388
  Top = 155
  Width = 532
  Height = 422
  Caption = 'RelEvolucaoPatr'
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
        Caption = 'Carteira de Investimento :'
        Controle = tcLookupCombo
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
      end
      item
        Caption = 'Evento :'
        Controle = tcLookupCombo
        CampoBanco = 'DESCCAIXACOTA'
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDEVENTOCAIXACOTA, DESCCAIXACOTA'
          'FROM  EVENTOCAIXACOTA'
          'ORDER BY DESCCAIXACOTA')
        LookupSettings.Chave = 'IDEVENTOCAIXACOTA'
        LookupSettings.Display = 'DESCCAIXACOTA'
        LookupSettings.Descricao = 'Evento'
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
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA  ')
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
    DataPipelineName = 'pplReport'
    inherited ppHeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel [0]
      end
      inherited lblNomeRelatorio: TppLabel [1]
        Caption = 'Consulta da Evolução Patrimonial'
        mmHeight = 4233
        mmWidth = 56886
      end
      inherited lblPeriodo: TppLabel [2]
        mmLeft = 24871
      end
      inherited shpCabecalho: TppShape [3]
        mmWidth = 197300
      end
      inherited ppDBImage: TppDBImage [4]
        DataPipelineName = 'ppLogoTipo'
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 14817
        mmWidth = 100013
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2910
        mmTop = 21696
        mmWidth = 7620
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Patrimônio Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 43582
        mmTop = 21696
        mmWidth = 32089
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 91780
        mmTop = 21696
        mmWidth = 35221
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 21696
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Variação Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 179123
        mmTop = 19315
        mmWidth = 15875
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      AfterPrint = ppDetailBand1AfterPrint
      PrintHeight = phDynamic
      mmHeight = 5556
      inherited shpDetalhe: TppShape
        mmHeight = 5027
        mmTop = 265
        mmWidth = 197300
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAHISTCOTA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 529
        mmWidth = 21696
        BandType = 4
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Stretch = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 529
        mmWidth = 50800
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplPL'
          mmHeight = 5027
          mmLeft = 24871
          mmTop = 529
          mmWidth = 50800
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
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
            Left = 272
            Top = 136
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplPL'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                DataField = 'VLRHISTCOTA'
                DataPipeline = pplPL
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplPL'
                mmHeight = 3969
                mmLeft = 7673
                mmTop = 0
                mmWidth = 41010
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
              DataPipeline = pplPL
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group3'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplPL'
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
              DataPipeline = pplPL
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group4'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplPL'
              object ppGroupHeaderBand4: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand4: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Caption = 'Region2'
        Stretch = True
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 529
        mmWidth = 50800
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplQtd'
          mmHeight = 5027
          mmLeft = 76200
          mmTop = 529
          mmWidth = 50800
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
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
            Left = 368
            Top = 232
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplQtd'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppDBTQtd: TppDBText
                UserName = 'DBTQtd'
                DataField = 'VLRHISTCOTA'
                DataPipeline = pplQtd
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplQtd'
                mmHeight = 3969
                mmLeft = 3969
                mmTop = 0
                mmWidth = 43921
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
              DataPipeline = pplQtd
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplQtd'
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
              DataPipeline = pplQtd
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplQtd'
              object ppGroupHeaderBand6: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand6: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
      object ppRegion3: TppRegion
        UserName = 'Region3'
        Caption = 'Region3'
        Stretch = True
        mmHeight = 5027
        mmLeft = 127529
        mmTop = 529
        mmWidth = 48419
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport3: TppSubReport
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplCotas'
          mmHeight = 5027
          mmLeft = 127529
          mmTop = 529
          mmWidth = 48419
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = pplCotas
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
            Left = 464
            Top = 328
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplCotas'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand4: TppDetailBand
              AfterPrint = ppDetailBand4AfterPrint
              BeforePrint = ppDetailBand4BeforePrint
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppDBTCota: TppDBText
                UserName = 'DBTCota'
                DataField = 'VLRHISTCOTA'
                DataPipeline = pplCotas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCotas'
                mmHeight = 3969
                mmLeft = 3969
                mmTop = 0
                mmWidth = 42069
                BandType = 4
              end
              object ppShape3: TppShape
                UserName = 'Shape1'
                mmHeight = 4233
                mmLeft = 48948
                mmTop = 0
                mmWidth = 20638
                BandType = 4
              end
              object pplVarDia: TppLabel
                UserName = 'lVarDia'
                Caption = 'lVarDia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 49477
                mmTop = 0
                mmWidth = 15875
                BandType = 4
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 65881
                mmTop = 0
                mmWidth = 3175
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup7: TppGroup
              BreakName = 'DATAHISTCOTA'
              DataPipeline = pplCotas
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group7'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplCotas'
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
              DataPipeline = pplCotas
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group8'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplCotas'
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
    end
    inherited ppFooterBand1: TppFooterBand
      inherited ppSystemVariable1: TppSystemVariable
        mmWidth = 197115
      end
      inherited LblSistema: TppLabel
        mmLeft = 0
        mmWidth = 197380
      end
      inherited ppLine2: TppLine
        mmHeight = 1852
        mmWidth = 197300
      end
      inherited ppSystemVariable2: TppSystemVariable
        mmLeft = 168275
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReport'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        AfterPrint = ppGroupHeaderBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 78846
        mmPrintPosition = 0
        object ppDPTCGraf: TppDPTeeChart
          UserName = 'DPTCGraf'
          mmHeight = 76729
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          object ppDPTeeChartControl1: TppDPTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              'Gráfico')
            LeftAxis.Title.Caption = 'Patrimônio Líquido'
            Legend.LegendStyle = lsSeries
            View3D = False
            BevelOuter = bvNone
            Color = clWhite
            object Series1: TFastLineSeries
              Tag = 3
              Marks.ArrowLength = 8
              Marks.Visible = False
              DataSource = pplPLGraf
              SeriesColor = clRed
              Title = 'Evolução Patrimonial'
              LinePen.Color = clGreen
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              XValues.ValueSource = 'DATAHISTCOTA'
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'VLRHISTCOTA'
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAHISTCOTA'
      DataPipeline = pplReport
      KeepTogether = True
      OutlineSettings.CreateNode = True
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
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
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
      'AND  ECC.IDEVENTOCAIXACOTA = -3'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = CdsPL
    Left = 309
    Top = 9
  end
  object CdsPL: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 9
  end
  object DsPL: TDataSource
    DataSet = CdsPL
    Left = 390
    Top = 9
  end
  object pplPL: TppBDEPipeline
    DataSource = DsPL
    UserName = 'lPL'
    Left = 429
    Top = 8
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
  object CMSqlParams2: TCMSqlParams
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
      'AND  ECC.IDEVENTOCAIXACOTA = -4'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = CdsQtd
    Left = 309
    Top = 55
  end
  object CdsQtd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 55
  end
  object DsQtd: TDataSource
    DataSet = CdsQtd
    Left = 390
    Top = 55
  end
  object pplQtd: TppBDEPipeline
    DataSource = DsQtd
    UserName = 'lQtd'
    Left = 429
    Top = 54
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
  object CMSqlParams3: TCMSqlParams
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
      'AND  ECC.IDEVENTOCAIXACOTA = -5'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = CdsCotas
    Left = 309
    Top = 103
  end
  object CdsCotas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 103
  end
  object DsCotas: TDataSource
    DataSet = CdsCotas
    Left = 390
    Top = 103
  end
  object pplCotas: TppBDEPipeline
    DataSource = DsCotas
    UserName = 'lCotas'
    Left = 429
    Top = 102
    MasterDataPipelineName = 'pplReport'
    object ppMasterFieldLink4: TppMasterFieldLink
      MasterFieldName = 'IDCARTEIRAINVEST'
      DetailFieldName = 'IDCARTEIRAINVEST'
      DetailSortOrder = soAscending
    end
    object pplCotasppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'DATAHISTCOTA'
      DetailFieldName = 'DATAHISTCOTA'
      DetailSortOrder = soAscending
    end
  end
  object CPREvento: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial :'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Carteira de Investimento :'
        Controle = tcLookupCombo
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
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    Left = 140
    Top = 199
  end
  object EOEvento: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = False
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 24
    Top = 199
  end
  object CRMEvento: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rptEvento
    LabelEmpresa = LblEmpEvento
    LabelSistema = LblSisEvento
    ConnectionType = cntADO
    Left = 83
    Top = 199
  end
  object pplEvento: TppBDEPipeline
    DataSource = dsEvento
    UserName = 'lEvento'
    Left = 21
    Top = 319
    object pplEventoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTCOTA'
      FieldName = 'IDHISTCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplEventoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAXEVENTO'
      FieldName = 'IDCARTEIRAXEVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplEventoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplEventoppField4: TppField
      FieldAlias = 'DATAHISTCOTA'
      FieldName = 'DATAHISTCOTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplEventoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRHISTCOTA'
      FieldName = 'VLRHISTCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplEventoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplEventoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAGERENC'
      FieldName = 'IDCARTEIRAGERENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplEventoppField8: TppField
      FieldAlias = 'DESCCAIXACOTA'
      FieldName = 'DESCCAIXACOTA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object pplEventoppField9: TppField
      FieldAlias = 'STAATIVOPASSIVO'
      FieldName = 'STAATIVOPASSIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplEventoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplEventoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplEventoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplEventoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPODESPINVEST'
      FieldName = 'IDTIPODESPINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplEventoppField14: TppField
      FieldAlias = 'FLGMANUALAUT'
      FieldName = 'FLGMANUALAUT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object pplEventoppField15: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
  end
  object sqlEvento: TCMSqlParams
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
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = cdsEvento
    Left = 29
    Top = 256
  end
  object cdsEvento: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 256
    Data = {
      DA4B00009619E0BD01000000180000000F00AB00000003000000F2010A494448
      495354434F544108000400000000001149444341525445495241584556454E54
      4F0800040000000000114944504C414E50524556435442504154520800040000
      0000000C4441544148495354434F544108000800000000000B564C5248495354
      434F544108000400000000001049444341525445495241494E56455354080004
      00000000001049444341525445495241474552454E4308000400000000000D44
      4553434341495841434F54410100490000000100055749445448020002002800
      0F535441415449564F5041535349564F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000E494454
      49504F4F5045524143414F08000400000000000C49445449504F494E56455354
      0800040000000000074944524547524108000400000000001049445449504F44
      455350494E5645535408000400000000000C464C474D414E55414C4155540100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000E4445534343415254494E5645535401004900000001
      00055749445448020002003C0002000D44454641554C545F4F52444552020082
      00020000000F000400044C434944040001000908000000101054010000000000
      F49C4000000000000035400000545129C9CC424861116C2EDB2E420000000000
      00F03F1250415452494D4F4E494F204C49515549444F014E01412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101054010000000000F89C40000000000000364000
      00545129C9CC424861116C2EDB2E42000000000000F03F135155414E54494441
      444520444520434F544153014E01412F4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849424F56455350412900
      101054010000000000FC9C4000000000000037400000545129C9CC4200000000
      0000F03F000000000000F03F0D56414C4F5220444120434F5441014E01412F41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      726961202849424F564553504129001011540100000000003499400000000000
      0030400000545129C9CC42000000000000F03F0B53414C444F20415455414C01
      4101412F4156202D2043617274656972612052656E646120566172696176656C
      2050726F70726961202849424F56455350412900101154010000000000249A40
      00000000000040400000545129C9CC42000000000000F03F1354415841204445
      20504552464F524D414E4345015001412F4156202D2043617274656972612052
      656E646120566172696176656C2050726F70726961202849424F564553504129
      00101054010000000000189A400000000000003B400000545129C9CC42AE4751
      404506D141000000000000F03F0A52454E44412046495841014101412F415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      61202849424F564553504129001010540100000000001C9A4000000000000039
      400000545129C9CC427B14AE1D5CC39C41000000000000F03F0E52454E444120
      564152494156454C014101412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101154
      010000000000209A400000000000003C400000545129C9CC42000000000000F0
      3F15544158412044452041444D494E4953545241C7C34F015001412F4156202D
      2043617274656972612052656E646120566172696176656C2050726F70726961
      202849424F56455350412900101054010000000000149A400000000000003A40
      0000545129C9CC42000000949A442E42000000000000F03F1746554E444F5320
      444520494E56455354494D454E544F53014101412F4156202D20436172746569
      72612052656E646120566172696176656C2050726F70726961202849424F5645
      5350412900101154010000000000009D4000000000000030400000DE0A31C9CC
      42000000000000F03F0B53414C444F20415455414C014101412F4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      49424F56455350412900101154010000000000049D400000000000003A400000
      DE0A31C9CC42000000000000F03F1746554E444F5320444520494E5645535449
      4D454E544F53014101412F4156202D2043617274656972612052656E64612056
      6172696176656C2050726F70726961202849424F564553504129001010540100
      00000000089D400000000000003B400000DE0A31C9CC42D7A30043EE09D14100
      0000000000F03F0A52454E44412046495841014101412F4156202D2043617274
      656972612052656E646120566172696176656C2050726F70726961202849424F
      564553504129001010540100000000000C9D4000000000000039400000DE0A31
      C9CC42A4F029AB558E2F42000000000000F03F0E52454E444120564152494156
      454C014101412F4156202D2043617274656972612052656E6461205661726961
      76656C2050726F70726961202849424F56455350412900101054010000000000
      209D4000000000000037400000DE0A31C9CC426133233094A3F03F0000000000
      00F03F0D56414C4F5220444120434F5441014E01412F4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849424F56
      455350412900101154010000000000149D4000000000000040400000DE0A31C9
      CC42000000000000F03F135441584120444520504552464F524D414E43450150
      01412F4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849424F56455350412900101054010000000000189D4000
      000000000035400000DE0A31C9CC42E1FAA08E520B3042000000000000F03F12
      50415452494D4F4E494F204C49515549444F014E01412F4156202D2043617274
      656972612052656E646120566172696176656C2050726F70726961202849424F
      564553504129001010540100000000001C9D4000000000000036400000DE0A31
      C9CC424861116C2EDB2E42000000000000F03F135155414E5449444144452044
      4520434F544153014E01412F4156202D2043617274656972612052656E646120
      566172696176656C2050726F70726961202849424F5645535041290010115401
      0000000000109D400000000000003C400000DE0A31C9CC42000000000000F03F
      15544158412044452041444D494E4953545241C7C34F015001412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101154010000000000249D40000000000000304000
      000C9E33C9CC42000000000000F03F0B53414C444F20415455414C014101412F
      4156202D2043617274656972612052656E646120566172696176656C2050726F
      70726961202849424F56455350412900101154010000000000289D4000000000
      00003A4000000C9E33C9CC42000000000000F03F1746554E444F532044452049
      4E56455354494D454E544F53014101412F4156202D2043617274656972612052
      656E646120566172696176656C2050726F70726961202849424F564553504129
      001010540100000000002C9D400000000000003B4000000C9E33C9CC42E17AF4
      D8590BD141000000000000F03F0A52454E44412046495841014101412F415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      61202849424F56455350412900101054010000000000309D4000000000000039
      4000000C9E33C9CC42E1FACC3BAC0D3042000000000000F03F0E52454E444120
      564152494156454C014101412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101054
      010000000000449D40000000000000374000000C9E33C9CC42F52DBA8FB8ECF0
      3F000000000000F03F0D56414C4F5220444120434F5441014E01412F4156202D
      2043617274656972612052656E646120566172696176656C2050726F70726961
      202849424F56455350412900101154010000000000389D400000000000004040
      00000C9E33C9CC42000000000000F03F135441584120444520504552464F524D
      414E4345015001412F4156202D2043617274656972612052656E646120566172
      696176656C2050726F70726961202849424F5645535041290010105401000000
      00003C9D40000000000000354000000C9E33C9CC42CDCC30A3D9513042000000
      000000F03F1250415452494D4F4E494F204C49515549444F014E01412F415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      61202849424F56455350412900101054010000000000409D4000000000000036
      4000000C9E33C9CC424861116C2EDB2E42000000000000F03F135155414E5449
      4441444520444520434F544153014E01412F4156202D20436172746569726120
      52656E646120566172696176656C2050726F70726961202849424F5645535041
      2900101154010000000000349D400000000000003C4000000C9E33C9CC420000
      00000000F03F15544158412044452041444D494E4953545241C7C34F01500141
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F56455350412900101154010000000000489D40000000
      000000304000003A3136C9CC42000000000000F03F0B53414C444F2041545541
      4C014101412F4156202D2043617274656972612052656E646120566172696176
      656C2050726F70726961202849424F564553504129001011540100000000004C
      9D400000000000003A4000003A3136C9CC42000000000000F03F1746554E444F
      5320444520494E56455354494D454E544F53014101412F4156202D2043617274
      656972612052656E646120566172696176656C2050726F70726961202849424F
      56455350412900101054010000000000509D400000000000003B4000003A3136
      C9CC42B81E858EC50CD141000000000000F03F0A52454E444120464958410141
      01412F4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849424F56455350412900101054010000000000549D4000
      0000000000394000003A3136C9CC42F6A8543F4E1A3042000000000000F03F0E
      52454E444120564152494156454C014101412F4156202D204361727465697261
      2052656E646120566172696176656C2050726F70726961202849424F56455350
      412900101054010000000000689D40000000000000374000003A3136C9CC426E
      AF1E5AD8F9F03F000000000000F03F0D56414C4F5220444120434F5441014E01
      412F4156202D2043617274656972612052656E646120566172696176656C2050
      726F70726961202849424F564553504129001011540100000000005C9D400000
      00000000404000003A3136C9CC42000000000000F03F13544158412044452050
      4552464F524D414E4345015001412F4156202D2043617274656972612052656E
      646120566172696176656C2050726F70726961202849424F5645535041290010
      1054010000000000609D40000000000000354000003A3136C9CC4271BD8E5581
      5E3042000000000000F03F1250415452494D4F4E494F204C49515549444F014E
      01412F4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849424F56455350412900101054010000000000649D4000
      0000000000364000003A3136C9CC424861116C2EDB2E42000000000000F03F13
      5155414E54494441444520444520434F544153014E01412F4156202D20436172
      74656972612052656E646120566172696176656C2050726F7072696120284942
      4F56455350412900101154010000000000589D400000000000003C4000003A31
      36C9CC42000000000000F03F15544158412044452041444D494E4953545241C7
      C34F015001412F4156202D2043617274656972612052656E6461205661726961
      76656C2050726F70726961202849424F56455350412900101154010000000000
      6C9D400000000000003040000068C438C9CC42000000000000F03F0B53414C44
      4F20415455414C014101412F4156202D2043617274656972612052656E646120
      566172696176656C2050726F70726961202849424F5645535041290010115401
      0000000000709D400000000000003A40000068C438C9CC42000000000000F03F
      1746554E444F5320444520494E56455354494D454E544F53014101412F415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      61202849424F56455350412900101054010000000000749D400000000000003B
      40000068C438C9CC429A9929D8300ED141000000000000F03F0A52454E444120
      46495841014101412F4156202D2043617274656972612052656E646120566172
      696176656C2050726F70726961202849424F5645535041290010105401000000
      0000789D400000000000003940000068C438C9CC421FC5CD03EA193042000000
      000000F03F0E52454E444120564152494156454C014101412F4156202D204361
      7274656972612052656E646120566172696176656C2050726F70726961202849
      424F564553504129001010540100000000008C9D400000000000003740000068
      C438C9CC42BEF04D4A76F9F03F000000000000F03F0D56414C4F522044412043
      4F5441014E01412F4156202D2043617274656972612052656E64612056617269
      6176656C2050726F70726961202849424F564553504129001011540100000000
      00809D400000000000004040000068C438C9CC42000000000000F03F13544158
      4120444520504552464F524D414E4345015001412F4156202D20436172746569
      72612052656E646120566172696176656C2050726F70726961202849424F5645
      5350412900101054010000000000849D400000000000003540000068C438C9CC
      42856B2EC7225E3042000000000000F03F1250415452494D4F4E494F204C4951
      5549444F014E01412F4156202D2043617274656972612052656E646120566172
      696176656C2050726F70726961202849424F5645535041290010105401000000
      0000889D400000000000003640000068C438C9CC424861116C2EDB2E42000000
      000000F03F135155414E54494441444520444520434F544153014E01412F4156
      202D2043617274656972612052656E646120566172696176656C2050726F7072
      6961202849424F564553504129001011540100000000007C9D40000000000000
      3C40000068C438C9CC42000000000000F03F15544158412044452041444D494E
      4953545241C7C34F015001412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101154
      010000000000909D400000000000003040000096573BC9CC42000000000000F0
      3F0B53414C444F20415455414C014101412F4156202D20436172746569726120
      52656E646120566172696176656C2050726F70726961202849424F5645535041
      2900101154010000000000949D400000000000003A40000096573BC9CC420000
      00000000F03F1746554E444F5320444520494E56455354494D454E544F530141
      01412F4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849424F56455350412900101054010000000000989D4000
      00000000003B40000096573BC9CC4285EB21F29C0FD141000000000000F03F0A
      52454E44412046495841014101412F4156202D2043617274656972612052656E
      646120566172696176656C2050726F70726961202849424F5645535041290010
      10540100000000009C9D400000000000003940000096573BC9CC428FC2F82329
      153042000000000000F03F0E52454E444120564152494156454C014101412F41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      726961202849424F56455350412900101054010000000000B09D400000000000
      003740000096573BC9CC42401315358EF4F03F000000000000F03F0D56414C4F
      5220444120434F5441014E01412F4156202D2043617274656972612052656E64
      6120566172696176656C2050726F70726961202849424F564553504129001011
      54010000000000A49D400000000000004040000096573BC9CC42000000000000
      F03F135441584120444520504552464F524D414E4345015001412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101054010000000000A89D40000000000000354000
      0096573BC9CC423D4AC19767593042000000000000F03F1250415452494D4F4E
      494F204C49515549444F014E01412F4156202D2043617274656972612052656E
      646120566172696176656C2050726F70726961202849424F5645535041290010
      1054010000000000AC9D400000000000003640000096573BC9CC424861116C2E
      DB2E42000000000000F03F135155414E54494441444520444520434F54415301
      4E01412F4156202D2043617274656972612052656E646120566172696176656C
      2050726F70726961202849424F56455350412900101154010000000000A09D40
      0000000000003C40000096573BC9CC42000000000000F03F1554415841204445
      2041444D494E4953545241C7C34F015001412F4156202D204361727465697261
      2052656E646120566172696176656C2050726F70726961202849424F56455350
      412900101154010000000000B49D4000000000000030400000201143C9CC4200
      0000000000F03F0B53414C444F20415455414C014101412F4156202D20436172
      74656972612052656E646120566172696176656C2050726F7072696120284942
      4F56455350412900101154010000000000B89D400000000000003A4000002011
      43C9CC42000000000000F03F1746554E444F5320444520494E56455354494D45
      4E544F53014101412F4156202D2043617274656972612052656E646120566172
      696176656C2050726F70726961202849424F5645535041290010105401000000
      0000BC9D400000000000003B400000201143C9CC42EC51E80DCA12D141000000
      000000F03F0A52454E44412046495841014101412F4156202D20436172746569
      72612052656E646120566172696176656C2050726F70726961202849424F5645
      5350412900101054010000000000C09D4000000000000039400000201143C9CC
      42D7E3969BB3153042000000000000F03F0E52454E444120564152494156454C
      014101412F4156202D2043617274656972612052656E64612056617269617665
      6C2050726F70726961202849424F56455350412900101054010000000000D49D
      4000000000000037400000201143C9CC424F33ACFB2AF5F03F000000000000F0
      3F0D56414C4F5220444120434F5441014E01412F4156202D2043617274656972
      612052656E646120566172696176656C2050726F70726961202849424F564553
      50412900101154010000000000C89D4000000000000040400000201143C9CC42
      000000000000F03F135441584120444520504552464F524D414E434501500141
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F56455350412900101054010000000000CC9D40000000
      00000035400000201143C9CC421F85CEC3FE593042000000000000F03F125041
      5452494D4F4E494F204C49515549444F014E01412F4156202D20436172746569
      72612052656E646120566172696176656C2050726F70726961202849424F5645
      5350412900101054010000000000D09D4000000000000036400000201143C9CC
      424861116C2EDB2E42000000000000F03F135155414E54494441444520444520
      434F544153014E01412F4156202D2043617274656972612052656E6461205661
      72696176656C2050726F70726961202849424F56455350412900101154010000
      000000C49D400000000000003C400000201143C9CC42000000000000F03F1554
      4158412044452041444D494E4953545241C7C34F015001412F4156202D204361
      7274656972612052656E646120566172696176656C2050726F70726961202849
      424F56455350412900101154010000000000D89D40000000000000304000004E
      A445C9CC42000000000000F03F0B53414C444F20415455414C014101412F4156
      202D2043617274656972612052656E646120566172696176656C2050726F7072
      6961202849424F56455350412900101154010000000000DC9D40000000000000
      3A4000004EA445C9CC42000000000000F03F1746554E444F5320444520494E56
      455354494D454E544F53014101412F4156202D2043617274656972612052656E
      646120566172696176656C2050726F70726961202849424F5645535041290010
      1054010000000000E09D400000000000003B4000004EA445C9CC42EC51F8F935
      14D141000000000000F03F0A52454E44412046495841014101412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101054010000000000E49D40000000000000394000
      004EA445C9CC4200004B58B2F02F42000000000000F03F0E52454E4441205641
      52494156454C014101412F4156202D2043617274656972612052656E64612056
      6172696176656C2050726F70726961202849424F564553504129001010540100
      00000000F89D40000000000000374000004EA445C9CC42FDB37CE3BFD6F03F00
      0000000000F03F0D56414C4F5220444120434F5441014E01412F4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      49424F56455350412900101154010000000000EC9D4000000000000040400000
      4EA445C9CC42000000000000F03F135441584120444520504552464F524D414E
      4345015001412F4156202D2043617274656972612052656E6461205661726961
      76656C2050726F70726961202849424F56455350412900101054010000000000
      F09D40000000000000354000004EA445C9CC4248610D04AA3C30420000000000
      00F03F1250415452494D4F4E494F204C49515549444F014E01412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101054010000000000F49D40000000000000364000
      004EA445C9CC424861116C2EDB2E42000000000000F03F135155414E54494441
      444520444520434F544153014E01412F4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849424F56455350412900
      101154010000000000E89D400000000000003C4000004EA445C9CC4200000000
      0000F03F15544158412044452041444D494E4953545241C7C34F015001412F41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      726961202849424F56455350412900101154010000000000FC9D400000000000
      00304000007C3748C9CC42000000000000F03F0B53414C444F20415455414C01
      4101412F4156202D2043617274656972612052656E646120566172696176656C
      2050726F70726961202849424F56455350412900101154010000000000009E40
      0000000000003A4000007C3748C9CC42000000000000F03F1746554E444F5320
      444520494E56455354494D454E544F53014101412F4156202D20436172746569
      72612052656E646120566172696176656C2050726F70726961202849424F5645
      5350412900101054010000000000049E400000000000003B4000007C3748C9CC
      426666D677A115D141000000000000F03F0A52454E4441204649584101410141
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F56455350412900101054010000000000089E40000000
      000000394000007C3748C9CC4271FD301F828B3042000000000000F03F0E5245
      4E444120564152494156454C014101412F4156202D2043617274656972612052
      656E646120566172696176656C2050726F70726961202849424F564553504129
      001010540100000000001C9E40000000000000374000007C3748C9CC42AA43C7
      3E636FF13F000000000000F03F0D56414C4F5220444120434F5441014E01412F
      4156202D2043617274656972612052656E646120566172696176656C2050726F
      70726961202849424F56455350412900101154010000000000109E4000000000
      0000404000007C3748C9CC42000000000000F03F135441584120444520504552
      464F524D414E4345015001412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101054
      010000000000149E40000000000000354000007C3748C9CC420A5710A5D8CF30
      42000000000000F03F1250415452494D4F4E494F204C49515549444F014E0141
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F56455350412900101054010000000000189E40000000
      000000364000007C3748C9CC424861116C2EDB2E42000000000000F03F135155
      414E54494441444520444520434F544153014E01412F4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849424F56
      4553504129001011540100000000000C9E400000000000003C4000007C3748C9
      CC42000000000000F03F15544158412044452041444D494E4953545241C7C34F
      015001412F4156202D2043617274656972612052656E64612056617269617665
      6C2050726F70726961202849424F56455350412900101154010000000000209E
      4000000000000030400000AACA4AC9CC42000000000000F03F0B53414C444F20
      415455414C014101412F4156202D2043617274656972612052656E6461205661
      72696176656C2050726F70726961202849424F56455350412900101154010000
      000000249E400000000000003A400000AACA4AC9CC42000000000000F03F1746
      554E444F5320444520494E56455354494D454E544F53014101412F4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      2849424F56455350412900101054010000000000289E400000000000003B4000
      00AACA4AC9CC428FC205FF0D17D141000000000000F03F0A52454E4441204649
      5841014101412F4156202D2043617274656972612052656E6461205661726961
      76656C2050726F70726961202849424F56455350412900101054010000000000
      2C9E4000000000000039400000AACA4AC9CC429AD96D2F02E230420000000000
      00F03F0E52454E444120564152494156454C014101412F4156202D2043617274
      656972612052656E646120566172696176656C2050726F70726961202849424F
      56455350412900101154010000000000309E400000000000003C400000AACA4A
      C9CC42000000000000F03F15544158412044452041444D494E4953545241C7C3
      4F015001412F4156202D2043617274656972612052656E646120566172696176
      656C2050726F70726961202849424F5645535041290010115401000000000034
      9E4000000000000040400000AACA4AC9CC42000000000000F03F135441584120
      444520504552464F524D414E4345015001412F4156202D204361727465697261
      2052656E646120566172696176656C2050726F70726961202849424F56455350
      412900101054010000000000389E4000000000000035400000AACA4AC9CC42A4
      F069675E263142000000000000F03F1250415452494D4F4E494F204C49515549
      444F014E01412F4156202D2043617274656972612052656E6461205661726961
      76656C2050726F70726961202849424F56455350412900101054010000000000
      3C9E4000000000000036400000AACA4AC9CC424861116C2EDB2E420000000000
      00F03F135155414E54494441444520444520434F544153014E01412F4156202D
      2043617274656972612052656E646120566172696176656C2050726F70726961
      202849424F56455350412900101054010000000000409E400000000000003740
      0000AACA4AC9CC42DF46C8151EC9F13F000000000000F03F0D56414C4F522044
      4120434F5441014E01412F4156202D2043617274656972612052656E64612056
      6172696176656C2050726F70726961202849424F564553504129001011540100
      00000000449E4000000000000030400000D85D4DC9CC42000000000000F03F0B
      53414C444F20415455414C014101412F4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849424F56455350412900
      101154010000000000489E400000000000003A400000D85D4DC9CC4200000000
      0000F03F1746554E444F5320444520494E56455354494D454E544F5301410141
      2F4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849424F564553504129001010540100000000004C9E40000000
      0000003B400000D85D4DC9CC4248E18A337A18D141000000000000F03F0A5245
      4E44412046495841014101412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101054
      010000000000509E4000000000000039400000D85D4DC9CC429AD96D2F02E230
      42000000000000F03F0E52454E444120564152494156454C014101412F415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      61202849424F56455350412900101054010000000000649E4000000000000037
      400000D85D4DC9CC42EE7D89FC23C9F13F000000000000F03F0D56414C4F5220
      444120434F5441014E01412F4156202D2043617274656972612052656E646120
      566172696176656C2050726F70726961202849424F5645535041290010115401
      0000000000589E4000000000000040400000D85D4DC9CC42000000000000F03F
      135441584120444520504552464F524D414E4345015001412F4156202D204361
      7274656972612052656E646120566172696176656C2050726F70726961202849
      424F564553504129001010540100000000005C9E4000000000000035400000D8
      5D4DC9CC421F053C1864263142000000000000F03F1250415452494D4F4E494F
      204C49515549444F014E01412F4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849424F56455350412900101054
      010000000000609E4000000000000036400000D85D4DC9CC424861116C2EDB2E
      42000000000000F03F135155414E54494441444520444520434F544153014E01
      412F4156202D2043617274656972612052656E646120566172696176656C2050
      726F70726961202849424F56455350412900101154010000000000549E400000
      000000003C400000D85D4DC9CC42000000000000F03F15544158412044452041
      444D494E4953545241C7C34F015001412F4156202D2043617274656972612052
      656E646120566172696176656C2050726F70726961202849424F564553504129
      0010115401000000000004994000000000008043400000545129C9CC42000000
      00000028401746554E444F5320444520494E56455354494D454E544F53014101
      412D4156202D2043617274656972612052656E646120566172696176656C2050
      726F707269612028494258203530290010105401000000000010994000000000
      008044400000545129C9CC42AE4751404506D141000000000000284013515541
      4E54494441444520444520434F544153014E01412D4156202D20436172746569
      72612052656E646120566172696176656C2050726F7072696120284942582035
      30290010105401000000000014994000000000000045400000545129C9CC4200
      0000000000F03F00000000000028400D56414C4F5220444120434F5441014E01
      412D4156202D2043617274656972612052656E646120566172696176656C2050
      726F707269612028494258203530290010115401000000000000994000000000
      000032400000545129C9CC4200000000000028400B53414C444F20415455414C
      014101412D4156202D2043617274656972612052656E64612056617269617665
      6C2050726F70726961202849425820353029001010540100000000000C994000
      000000000043400000545129C9CC42AE4751404506D141000000000000284012
      50415452494D4F4E494F204C49515549444F014E01412D4156202D2043617274
      656972612052656E646120566172696176656C2050726F707269612028494258
      203530290010105401000000000008994000000000000044400000545129C9CC
      42AE4751404506D14100000000000028400A52454E4441204649584101410141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F70726961202849425820353029001010540100000000002C99400000000000
      8044400000DE0A31C9CC42AE4751404506D1410000000000002840135155414E
      54494441444520444520434F544153014E01412D4156202D2043617274656972
      612052656E646120566172696176656C2050726F707269612028494258203530
      29001010540100000000001C994000000000000032400000DE0A31C9CC420000
      0000C05C154100000000000028400B53414C444F20415455414C014101412D41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      7269612028494258203530290010105401000000000030994000000000000045
      400000DE0A31C9CC42753F02DAB104F03F00000000000028400D56414C4F5220
      444120434F5441014E01412D4156202D2043617274656972612052656E646120
      566172696176656C2050726F7072696120284942582035302900101054010000
      00000028994000000000000043400000DE0A31C9CC42D7A3000F440BD1410000
      0000000028401250415452494D4F4E494F204C49515549444F014E01412D4156
      202D2043617274656972612052656E646120566172696176656C2050726F7072
      6961202849425820353029001010540100000000002499400000000000004440
      0000DE0A31C9CC42D7A30043EE09D14100000000000028400A52454E44412046
      495841014101412D4156202D2043617274656972612052656E64612056617269
      6176656C2050726F707269612028494258203530290010115401000000000020
      994000000000008043400000DE0A31C9CC4200000000000028401746554E444F
      5320444520494E56455354494D454E544F53014101412D4156202D2043617274
      656972612052656E646120566172696176656C2050726F707269612028494258
      2035302900101054010000000000849A40000000000000434000000C9E33C9CC
      42E17AF4A4AF0CD14100000000000028401250415452494D4F4E494F204C4951
      5549444F014E01412D4156202D2043617274656972612052656E646120566172
      696176656C2050726F7072696120284942582035302900101054010000000000
      889A40000000000080444000000C9E33C9CC42AE4751404506D1410000000000
      002840135155414E54494441444520444520434F544153014E01412D4156202D
      2043617274656972612052656E646120566172696176656C2050726F70726961
      202849425820353029001010540100000000008C9A4000000000000045400000
      0C9E33C9CC42DE72AE8E0706F03F00000000000028400D56414C4F5220444120
      434F5441014E01412D4156202D2043617274656972612052656E646120566172
      696176656C2050726F7072696120284942582035302900101154010000000000
      7C9A40000000000080434000000C9E33C9CC4200000000000028401746554E44
      4F5320444520494E56455354494D454E544F53014101412D4156202D20436172
      74656972612052656E646120566172696176656C2050726F7072696120284942
      582035302900101054010000000000809A40000000000000444000000C9E33C9
      CC42E17AF4D8590BD14100000000000028400A52454E44412046495841014101
      412D4156202D2043617274656972612052656E646120566172696176656C2050
      726F7072696120284942582035302900101054010000000000589A4000000000
      0000324000000C9E33C9CC4200000000C05C154100000000000028400B53414C
      444F20415455414C014101412D4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849425820353029001010540100
      00000000C09A40000000000000434000003A3136C9CC42B81E855A1B0ED14100
      000000000028401250415452494D4F4E494F204C49515549444F014E01412D41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      72696120284942582035302900101154010000000000B89A4000000000008043
      4000003A3136C9CC4200000000000028401746554E444F5320444520494E5645
      5354494D454E544F53014101412D4156202D2043617274656972612052656E64
      6120566172696176656C2050726F707269612028494258203530290010105401
      0000000000C89A40000000000000454000003A3136C9CC42EE8226615D07F03F
      00000000000028400D56414C4F5220444120434F5441014E01412D4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      284942582035302900101054010000000000BC9A40000000000000444000003A
      3136C9CC42B81E858EC50CD14100000000000028400A52454E44412046495841
      014101412D4156202D2043617274656972612052656E64612056617269617665
      6C2050726F7072696120284942582035302900101054010000000000C49A4000
      0000000080444000003A3136C9CC42AE4751404506D141000000000000284013
      5155414E54494441444520444520434F544153014E01412D4156202D20436172
      74656972612052656E646120566172696176656C2050726F7072696120284942
      582035302900101054010000000000B49A40000000000000324000003A3136C9
      CC4200000000C05C154100000000000028400B53414C444F20415455414C0141
      01412D4156202D2043617274656972612052656E646120566172696176656C20
      50726F7072696120284942582035302900101054010000000000D09A40000000
      0000003240000068C438C9CC4200000000C05C154100000000000028400B5341
      4C444F20415455414C014101412D4156202D2043617274656972612052656E64
      6120566172696176656C2050726F707269612028494258203530290010105401
      0000000000049B400000000000004540000068C438C9CC42AA9C26CEB208F03F
      00000000000028400D56414C4F5220444120434F5441014E01412D4156202D20
      43617274656972612052656E646120566172696176656C2050726F7072696120
      284942582035302900101054010000000000009B400000000000804440000068
      C438C9CC42AE4751404506D1410000000000002840135155414E544944414445
      20444520434F544153014E01412D4156202D2043617274656972612052656E64
      6120566172696176656C2050726F707269612028494258203530290010105401
      0000000000FC9A400000000000004340000068C438C9CC429A9929A4860FD141
      00000000000028401250415452494D4F4E494F204C49515549444F014E01412D
      4156202D2043617274656972612052656E646120566172696176656C2050726F
      7072696120284942582035302900101054010000000000F89A40000000000000
      4440000068C438C9CC429A9929D8300ED14100000000000028400A52454E4441
      2046495841014101412D4156202D2043617274656972612052656E6461205661
      72696176656C2050726F70726961202849425820353029001011540100000000
      00F49A400000000000804340000068C438C9CC4200000000000028401746554E
      444F5320444520494E56455354494D454E544F53014101412D4156202D204361
      7274656972612052656E646120566172696176656C2050726F70726961202849
      42582035302900101054010000000000349B400000000000004440000096573B
      C9CC4285EB21F29C0FD14100000000000028400A52454E444120464958410141
      01412D4156202D2043617274656972612052656E646120566172696176656C20
      50726F7072696120284942582035302900101054010000000000449B40000000
      0000004540000096573BC9CC4266F2516FDBF1F53F00000000000028400D5641
      4C4F5220444120434F5441014E01412D4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849425820353029001010
      54010000000000409B400000000000804440000096573BC9CC42AE4751404506
      D1410000000000002840135155414E54494441444520444520434F544153014E
      01412D4156202D2043617274656972612052656E646120566172696176656C20
      50726F70726961202849425820353029001010540100000000003C9B40000000
      0000004340000096573BC9CC42713DBAD39259D7410000000000002840125041
      5452494D4F4E494F204C49515549444F014E01412D4156202D20436172746569
      72612052656E646120566172696176656C2050726F7072696120284942582035
      302900101054010000000000389B400000000000004640000096573BC9CC42AE
      4761568022B94100000000000028400E52454E444120564152494156454C0141
      01412D4156202D2043617274656972612052656E646120566172696176656C20
      50726F7072696120284942582035302900101154010000000000309B40000000
      0000804340000096573BC9CC4200000000000028401746554E444F5320444520
      494E56455354494D454E544F53014101412D4156202D20436172746569726120
      52656E646120566172696176656C2050726F7072696120284942582035302900
      1010540100000000000C9B400000000000003240000096573BC9CC4200000000
      C05C154100000000000028400B53414C444F20415455414C014101412D415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      6120284942582035302900101054010000000000749B40000000000000444000
      00201143C9CC42EC51E80DCA12D14100000000000028400A52454E4441204649
      5841014101412D4156202D2043617274656972612052656E6461205661726961
      76656C2050726F7072696120284942582035302900101154010000000000709B
      4000000000008043400000201143C9CC4200000000000028401746554E444F53
      20444520494E56455354494D454E544F53014101412D4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849425820
      353029001010540100000000004C9B4000000000000032400000201143C9CC42
      00000000C05C154100000000000028400B53414C444F20415455414C01410141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F7072696120284942582035302900101054010000000000789B400000000000
      0046400000201143C9CC42EC5138FCB525B94100000000000028400E52454E44
      4120564152494156454C014101412D4156202D2043617274656972612052656E
      646120566172696176656C2050726F7072696120284942582035302900101054
      0100000000007C9B4000000000000043400000201143C9CC426666F6588D5DD7
      4100000000000028401250415452494D4F4E494F204C49515549444F014E0141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F7072696120284942582035302900101054010000000000809B400000000000
      8044400000201143C9CC42AE4751404506D1410000000000002840135155414E
      54494441444520444520434F544153014E01412D4156202D2043617274656972
      612052656E646120566172696176656C2050726F707269612028494258203530
      2900101054010000000000849B4000000000000045400000201143C9CC425FBF
      C0A998F5F53F00000000000028400D56414C4F5220444120434F5441014E0141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F7072696120284942582035302900101154010000000000B09B400000000000
      80434000004EA445C9CC4200000000000028401746554E444F5320444520494E
      56455354494D454E544F53014101412D4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849425820353029001010
      54010000000000B49B40000000000000444000004EA445C9CC42EC51F8F93514
      D14100000000000028400A52454E44412046495841014101412D4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      4942582035302900101054010000000000C49B40000000000000454000004EA4
      45C9CC429200AAC2E3F6F53F00000000000028400D56414C4F5220444120434F
      5441014E01412D4156202D2043617274656972612052656E6461205661726961
      76656C2050726F7072696120284942582035302900101054010000000000C09B
      40000000000080444000004EA445C9CC42AE4751404506D14100000000000028
      40135155414E54494441444520444520434F544153014E01412D4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      4942582035302900101054010000000000BC9B40000000000000434000004EA4
      45C9CC42A4701DA5ED5ED74100000000000028401250415452494D4F4E494F20
      4C49515549444F014E01412D4156202D2043617274656972612052656E646120
      566172696176656C2050726F7072696120284942582035302900101054010000
      000000B89B40000000000000464000004EA445C9CC42E17A947C8725B9410000
      0000000028400E52454E444120564152494156454C014101412D4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      49425820353029001010540100000000008C9B40000000000000324000004EA4
      45C9CC4200000000C05C154100000000000028400B53414C444F20415455414C
      014101412D4156202D2043617274656972612052656E64612056617269617665
      6C2050726F7072696120284942582035302900101054010000000000049C4000
      0000000000454000007C3748C9CC42196C851144F3F53F00000000000028400D
      56414C4F5220444120434F5441014E01412D4156202D20436172746569726120
      52656E646120566172696176656C2050726F7072696120284942582035302900
      101154010000000000F09B40000000000080434000007C3748C9CC4200000000
      000028401746554E444F5320444520494E56455354494D454E544F5301410141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F7072696120284942582035302900101054010000000000CC9B400000000000
      00324000007C3748C9CC4200000000C05C154100000000000028400B53414C44
      4F20415455414C014101412D4156202D2043617274656972612052656E646120
      566172696176656C2050726F7072696120284942582035302900101054010000
      000000F49B40000000000000444000007C3748C9CC426666D677A115D1410000
      0000000028400A52454E44412046495841014101412D4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849425820
      35302900101054010000000000F89B40000000000000464000007C3748C9CC42
      14AE07266D10B94100000000000028400E52454E444120564152494156454C01
      4101412D4156202D2043617274656972612052656E646120566172696176656C
      2050726F7072696120284942582035302900101054010000000000FC9B400000
      00000000434000007C3748C9CC42EC51588D125BD74100000000000028401250
      415452494D4F4E494F204C49515549444F014E01412D4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849425820
      35302900101054010000000000009C40000000000080444000007C3748C9CC42
      AE4751404506D1410000000000002840135155414E5449444144452044452043
      4F544153014E01412D4156202D2043617274656972612052656E646120566172
      696176656C2050726F7072696120284942582035302900101054010000000000
      449C4000000000000045400000AACA4AC9CC4293C64256B209F63F0000000000
      0028400D56414C4F5220444120434F5441014E01412D4156202D204361727465
      6972612052656E646120566172696176656C2050726F70726961202849425820
      353029001010540100000000000C9C4000000000000032400000AACA4AC9CC42
      00000000C05C154100000000000028400B53414C444F20415455414C01410141
      2D4156202D2043617274656972612052656E646120566172696176656C205072
      6F7072696120284942582035302900101154010000000000309C400000000000
      8043400000AACA4AC9CC4200000000000028401746554E444F5320444520494E
      56455354494D454E544F53014101412D4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849425820353029001010
      54010000000000349C4000000000000044400000AACA4AC9CC428FC205FF0D17
      D14100000000000028400A52454E44412046495841014101412D4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      4942582035302900101054010000000000389C4000000000000046400000AACA
      4AC9CC4252B8DED7326AB94100000000000028400E52454E4441205641524941
      56454C014101412D4156202D2043617274656972612052656E64612056617269
      6176656C2050726F70726961202849425820353029001010540100000000003C
      9C4000000000000043400000AACA4AC9CC42A470FD80F072D741000000000000
      28401250415452494D4F4E494F204C49515549444F014E01412D4156202D2043
      617274656972612052656E646120566172696176656C2050726F707269612028
      4942582035302900101054010000000000409C4000000000008044400000AACA
      4AC9CC42AE4751404506D1410000000000002840135155414E54494441444520
      444520434F544153014E01412D4156202D2043617274656972612052656E6461
      20566172696176656C2050726F70726961202849425820353029001010540100
      00000000B89C4000000000000032400000D85D4DC9CC4200000000C05C154100
      000000000028400B53414C444F20415455414C014101412D4156202D20436172
      74656972612052656E646120566172696176656C2050726F7072696120284942
      582035302900101054010000000000E09C4000000000000044400000D85D4DC9
      CC4248E18A337A18D14100000000000028400A52454E44412046495841014101
      412D4156202D2043617274656972612052656E646120566172696176656C2050
      726F7072696120284942582035302900101054010000000000E49C4000000000
      000046400000D85D4DC9CC4252B8DED7326AB94100000000000028400E52454E
      444120564152494156454C014101412D4156202D204361727465697261205265
      6E646120566172696176656C2050726F70726961202849425820353029001010
      54010000000000F09C4000000000000045400000D85D4DC9CC426D012FA0080B
      F63F00000000000028400D56414C4F5220444120434F5441014E01412D415620
      2D2043617274656972612052656E646120566172696176656C2050726F707269
      6120284942582035302900101154010000000000DC9C40000000000080434000
      00D85D4DC9CC4200000000000028401746554E444F5320444520494E56455354
      494D454E544F53014101412D4156202D2043617274656972612052656E646120
      566172696176656C2050726F7072696120284942582035302900101054010000
      000000EC9C4000000000008044400000D85D4DC9CC42AE4751404506D1410000
      000000002840135155414E54494441444520444520434F544153014E01412D41
      56202D2043617274656972612052656E646120566172696176656C2050726F70
      72696120284942582035302900101054010000000000E89C4000000000000043
      400000D85D4DC9CC425C8F82B55C74D74100000000000028401250415452494D
      4F4E494F204C49515549444F014E01412D4156202D2043617274656972612052
      656E646120566172696176656C2050726F70726961202849425820353029}
  end
  object dsEvento: TDataSource
    DataSet = cdsEvento
    Left = 134
    Top = 256
  end
  object rptEvento: TppReport
    AutoStop = False
    DataPipeline = pplEvento
    OnStartPage = rptEventoStartPage
    PassSetting = psTwoPass
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 82
    Top = 319
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplEvento'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object LblEmpEvento: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object LblNomRel: TppLabel
        UserName = 'lblNomeRelatorio'
        Caption = 'Consulta da Evolução Patrimonial por evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 75819
        BandType = 0
      end
      object LblPerEvento: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3641
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 11007
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEvento
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEvento'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAHISTCOTA'
        DataPipeline = pplEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEvento'
        mmHeight = 3969
        mmLeft = 110861
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object ppDBVlrCota: TppDBText
        UserName = 'DBVlrCota'
        DataField = 'VLRHISTCOTA'
        DataPipeline = pplEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEvento'
        mmHeight = 3969
        mmLeft = 139965
        mmTop = 265
        mmWidth = 56092
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
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
        mmTop = 794
        mmWidth = 197115
        BandType = 8
      end
      object LblSisEvento: TppLabel
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 168275
        mmTop = 794
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplEvento
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEvento'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'shpCabecalho'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 8202
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label1'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 110861
          mmTop = 7938
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 187325
          mmTop = 7938
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 7938
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = pplEvento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplEvento'
          mmHeight = 4106
          mmLeft = 112448
          mmTop = 0
          mmWidth = 85196
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'DESCCAIXACOTA'
      DataPipeline = pplEvento
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEvento'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'DESCCAIXACOTA'
          DataPipeline = pplEvento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEvento'
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 0
          mmWidth = 56092
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object cdsLTEvento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 192
  end
  object ppLTEvento: TppBDEPipeline
    DataSource = dsLTEvento
    UserName = 'LTEvento'
    Left = 205
    Top = 241
  end
  object dsLTEvento: TDataSource
    DataSet = cdsLTEvento
    Left = 206
    Top = 264
  end
  object CdsAux: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 358
    Top = 202
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
  object CMSqlParams4: TCMSqlParams
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
      'AND  ECC.IDEVENTOCAIXACOTA = -3'
      'AND HC.IDCARTEIRAINVEST = 1'
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCOTA')
    ClientDataSet = CdsPLGraf
    Left = 309
    Top = 151
  end
  object CdsPLGraf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 151
  end
  object DsPLGraf: TDataSource
    DataSet = CdsPLGraf
    Left = 390
    Top = 151
  end
  object pplPLGraf: TppBDEPipeline
    DataSource = DsPLGraf
    UserName = 'lPLGraf'
    Left = 435
    Top = 145
  end
end
