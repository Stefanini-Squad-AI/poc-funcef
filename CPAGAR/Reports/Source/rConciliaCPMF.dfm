inherited RptConciliaCPMF: TRptConciliaCPMF
  Left = 311
  Top = 229
  Width = 532
  Height = 349
  Caption = 'RptConciliaCPMF'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de CPMF'
    DataBaseName = 'BaseRemota'
    Params = <
      item
        Caption = 'Fornecedor'
        Controle = tcProcuraFC
        TipodeDado = tdString
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
        Caption = 'Data programada'
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
        Caption = 'Número do Lote'
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
        Caption = 'Conta Bancária'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODPORTADOR, DESCRICAO'
          'FROM'
          '  PORTADORCONTA'
          'WHERE'
          '  FLGSTATUS = '#39'A'#39' AND'
          '  IDPESSOA = 2'
          'ORDER BY'
          '  DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
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
        Caption = 'Status Lote'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Conciliados'
          'Não Conciliados')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
        Caption = 'Imprimir relatório expandido'
        Controle = tcCheckBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'S'
        CheckBoxSetings.ValueUnChecked = 'N'
        CheckBoxSetings.Checked = False
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
    BeforeExecute = CmpRptCMBeforeExecute
    AfterExecute = CmpRptCMAfterExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 300
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptRelLotesCPMF
    LabelEmpresa = ppLbEmpresa
    LabelSistema = ppLbNomeSistema
  end
  object rptRelLotesCPMF: TppReport
    AutoStop = False
    DataPipeline = ppPipLinDadosRel
    OnEndPage = rptRelLotesCPMFEndPage
    OnStartPage = rptRelLotesCPMFStartPage
    PassSetting = psTwoPass
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 285
    Top = 266
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppPipLinDadosRel'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 32808
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Nº Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 32808
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19315
        mmTop = 32808
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Data Geração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 76465
        mmTop = 32808
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 32808
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Base Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 32808
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'CPMF Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 148167
        mmTop = 32808
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'CPMF Calculada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 32808
        mmWidth = 21431
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppPipLinDadosEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppPipLinDadosEmpresa'
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 3440
        mmWidth = 13229
        BandType = 0
      end
      object ppLbEmpresa: TppLabel
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 23813
        mmTop = 4233
        mmWidth = 170392
        BandType = 0
      end
      object ppLbTitulo: TppLabel
        UserName = 'LbTitulo'
        Caption = 'Conciliação de CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23813
        mmTop = 10583
        mmWidth = 35719
        BandType = 0
      end
      object ppLbDescricao: TppLabel
        UserName = 'LbDescricao'
        Caption = 'Data Programada:  24/12/2004'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 16140
        mmWidth = 45244
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 8421631
        mmHeight = 2646
        mmLeft = 155840
        mmTop = 17463
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Relacionamento Inconsistente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 161396
        mmTop = 17463
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'CPMF não calculada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 161396
        mmTop = 13229
        mmWidth = 22754
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197300
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 11927037
        mmHeight = 2646
        mmLeft = 155840
        mmTop = 13229
        mmWidth = 4498
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSubRepDoc: TppSubReport
        OnPrint = ppSubRepDocPrint
        UserName = 'SubRepDoc'
        DrillDownComponent = ppLinhaDrilDraw
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppPipLinRelPorDoc'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppPipLinRelPorDoc
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
          Left = 360
          Top = 224
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppPipLinRelPorDoc'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 10319
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = 13882323
              ParentWidth = True
              mmHeight = 4498
              mmLeft = 0
              mmTop = 4498
              mmWidth = 197300
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Data Emissão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 78581
              mmTop = 5292
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'AP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 1588
              mmTop = 5292
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Favorecido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 12700
              mmTop = 5292
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Valor Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 97631
              mmTop = 5292
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Valor Base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 129382
              mmTop = 5292
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'CPMF Prevista'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 151077
              mmTop = 5292
              mmWidth = 16404
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'CPMF Calculada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 176742
              mmTop = 5292
              mmWidth = 18521
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShpCorZebra: TppShape
              OnPrint = ppShpCorZebraPrint
              UserName = 'ShpCorZebra'
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppSubRepRat: TppSubReport
              OnPrint = ppSubRepRatPrint
              UserName = 'SubRepRat'
              DrillDownComponent = ppLinhaDDSub1
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppPipLinRateio'
              mmHeight = 3440
              mmLeft = 0
              mmTop = 265
              mmWidth = 197300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = ppPipLinRateio
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
                Left = 368
                Top = 232
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppPipLinRateio'
                object ppTitleBand3: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 7938
                  mmPrintPosition = 0
                  object ppShape4: TppShape
                    UserName = 'Shape4'
                    Brush.Color = 13882323
                    mmHeight = 3175
                    mmLeft = 12435
                    mmTop = 4498
                    mmWidth = 184680
                    BandType = 1
                  end
                  object ppLabel17: TppLabel
                    UserName = 'Label17'
                    Caption = 'Valor CPMF'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 183357
                    mmTop = 4763
                    mmWidth = 13229
                    BandType = 1
                  end
                  object ppLabel18: TppLabel
                    UserName = 'Label18'
                    Caption = 'Valor Lote'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 165894
                    mmTop = 4763
                    mmWidth = 11113
                    BandType = 1
                  end
                  object ppLabel19: TppLabel
                    UserName = 'Label19'
                    Caption = 'Tipo desembolso'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 13229
                    mmTop = 4498
                    mmWidth = 18785
                    BandType = 1
                  end
                  object ppLabel20: TppLabel
                    UserName = 'Label20'
                    Caption = 'Centro de Custo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 78846
                    mmTop = 4763
                    mmWidth = 17727
                    BandType = 1
                  end
                  object ppLabel16: TppLabel
                    UserName = 'Label16'
                    Caption = 'Prg.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 108479
                    mmTop = 4763
                    mmWidth = 4498
                    BandType = 1
                  end
                  object ppLabel21: TppLabel
                    UserName = 'Label21'
                    Caption = 'Tipo CPMF'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 117211
                    mmTop = 4763
                    mmWidth = 12435
                    BandType = 1
                  end
                end
                object ppDetailBand3: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 3704
                  mmPrintPosition = 0
                  object ppShpCorZebraSub2: TppShape
                    OnPrint = ppShpCorZebraSub2Print
                    UserName = 'ShpCorZebraSub2'
                    Pen.Style = psClear
                    mmHeight = 3440
                    mmLeft = 13229
                    mmTop = 0
                    mmWidth = 184150
                    BandType = 4
                  end
                  object ppDBText9: TppDBText
                    UserName = 'DBText9'
                    DataField = 'CODTIPRECDES'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 13229
                    mmTop = 265
                    mmWidth = 8996
                    BandType = 4
                  end
                  object ppDBText10: TppDBText
                    UserName = 'DBText10'
                    DataField = 'VLRCPMF'
                    DataPipeline = ppPipLinRateio
                    DisplayFormat = '#,##0.00;(#,##0.00)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 179388
                    mmTop = 265
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText11: TppDBText
                    UserName = 'DBText11'
                    DataField = 'VLRBASE'
                    DataPipeline = ppPipLinRateio
                    DisplayFormat = '#,##0.00;(#,##0.00)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 159809
                    mmTop = 265
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppDBText12: TppDBText
                    UserName = 'DBText12'
                    DataField = 'DESCCUSTAGREG'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2646
                    mmLeft = 117211
                    mmTop = 529
                    mmWidth = 41540
                    BandType = 4
                  end
                  object ppDBText13: TppDBText
                    UserName = 'DBText13'
                    DataField = 'FLGTIPOPROGRAMA'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 108479
                    mmTop = 265
                    mmWidth = 7408
                    BandType = 4
                  end
                  object ppDBText14: TppDBText
                    UserName = 'DBText14'
                    DataField = 'NOME'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 88106
                    mmTop = 265
                    mmWidth = 19050
                    BandType = 4
                  end
                  object ppDBText15: TppDBText
                    UserName = 'DBText15'
                    DataField = 'CODEXTERNO'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 78846
                    mmTop = 265
                    mmWidth = 8202
                    BandType = 4
                  end
                  object ppDBText16: TppDBText
                    UserName = 'DBText16'
                    DataField = 'DESCRICAO'
                    DataPipeline = ppPipLinRateio
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppPipLinRateio'
                    mmHeight = 2910
                    mmLeft = 23548
                    mmTop = 265
                    mmWidth = 52388
                    BandType = 4
                  end
                end
                object ppSummaryBand3: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 6615
                  mmPrintPosition = 0
                  object ppLine6: TppLine
                    UserName = 'Line6'
                    Pen.Width = 2
                    Weight = 1.5
                    mmHeight = 3969
                    mmLeft = 12171
                    mmTop = 529
                    mmWidth = 185209
                    BandType = 7
                  end
                end
              end
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'NOME'
              DataPipeline = ppPipLinRelPorDoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 12700
              mmTop = 529
              mmWidth = 61648
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'NUMAPGR'
              DataPipeline = ppPipLinRelPorDoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 1058
              mmTop = 529
              mmWidth = 7673
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'DATAEMISSAO'
              DataPipeline = ppPipLinRelPorDoc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 78846
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'VLRBASE'
              DataPipeline = ppPipLinRelPorDoc
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 124090
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'CPMFPREV'
              DataPipeline = ppPipLinRelPorDoc
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 150284
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'CPMFCALC'
              DataPipeline = ppPipLinRelPorDoc
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 178065
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VLRLOTE'
              DataPipeline = ppPipLinRelPorDoc
              DisplayFormat = '#,##0.00;(#,##0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppPipLinRelPorDoc'
              mmHeight = 2910
              mmLeft = 97367
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppLinhaDDSub1: TppLine
              UserName = 'LinhaDDSub1'
              Pen.Style = psClear
              ParentWidth = True
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 0
              mmTop = 265
              mmWidth = 197300
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              Pen.Width = 2
              ParentWidth = True
              Weight = 1.5
              mmHeight = 3969
              mmLeft = 0
              mmTop = 1058
              mmWidth = 197300
              BandType = 7
            end
          end
        end
      end
      object ppShpCorLinha: TppShape
        OnPrint = ppShpCorLinhaPrint
        UserName = 'ShpCorLinha'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMLOTE'
        DataPipeline = ppPipLinDadosRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FAVORECIDO'
        DataPipeline = ppPipLinDadosRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3440
        mmLeft = 19579
        mmTop = 0
        mmWidth = 53975
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAEMISSAO'
        DataPipeline = ppPipLinDadosRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 76729
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBVlrLote: TppDBText
        UserName = 'DBVlrLote'
        DataField = 'VALORLOTE'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 96838
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBBaseCalc: TppDBText
        UserName = 'DBBaseCalc'
        DataField = 'VALORBASE'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 121179
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBVlrPrev: TppDBText
        UserName = 'DBVlrPrev'
        DataField = 'VALPREVISTO'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 143404
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBVlrCalc: TppDBText
        UserName = 'DBVlrCalc'
        DataField = 'VALCALCULADO'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppLinhaDrilDraw: TppLine
        UserName = 'LinhaDrilDraw'
        Pen.Style = psClear
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppLbNomeSistema: TppLabel
        UserName = 'LblSistema1'
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
        mmTop = 1323
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 89429
        mmTop = 1323
        mmWidth = 18256
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Totais:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 43656
        mmTop = 7673
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALORLOTE'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3440
        mmLeft = 96838
        mmTop = 7673
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALORBASE'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3440
        mmLeft = 120386
        mmTop = 7673
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VALPREVISTO'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3440
        mmLeft = 143669
        mmTop = 7673
        mmWidth = 23813
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VALCALCULADO'
        DataPipeline = ppPipLinDadosRel
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPipLinDadosRel'
        mmHeight = 3440
        mmLeft = 170127
        mmTop = 7673
        mmWidth = 25665
        BandType = 7
      end
    end
  end
  object CdsLotes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 93
  end
  object DsLotes: TwwDataSource
    DataSet = CdsLotes
    Left = 81
    Top = 144
  end
  object SqlCPFMNaoCalc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   ('#39'L'#39') AS ORIGEM, ('#39'Lote não calculado'#39') AS FAVORECIDO, LP.NUM' +
        'LOTE, LP.DATAEMISSAO, LP.CODPORTFORMA,'
      
        '   SUM (LX.VALOR) AS VALORLOTE, (SUM (LX.VALOR) * :PERCENTUAL / ' +
        '100) AS VALPREVISTO'
      'FROM'
      
        '   LOTEPAGTO LP, LOTEXDOCUM LX, PORTADORFORMA PF, PORTADORCONTA ' +
        'PC, BANCO BC'
      'WHERE'
      
        '      LP.DATAEMISSAO BETWEEN (:DATA -(6+PF.DIASUTEISLANCTO)) AND' +
        ' (:DATA - PF.DIASUTEISLANCTO)'
      '  AND LX.NUMLOTE = LP.NUMLOTE'
      '  AND LP.CODPORTFORMA = PF.CODPORTFORMA'
      '  AND PF.CODPORTADOR = PC.CODPORTADOR'
      '  AND PC.IDBANCO = BC.IDPESSOA'
      '  AND NVL(PC.FLGCONTAINVEST,0) <> 1'
      '  AND PF.DIASEMANALANCTO IS NOT NULL'
      '  AND PF.DIASUTEISLANCTO IS NOT NULL'
      
        '  AND NOT EXISTS (SELECT NUMLOTE FROM IMPOSTORETIDO WHERE NUMLOT' +
        'E = LP.NUMLOTE)'
      '  AND ((:IDBANCO IS NULL) OR (PC.IDBANCO = :IDBANCO))'
      
        '  AND ((:CODPORTADOR IS NULL) OR (PC.CODPORTADOR = :CODPORTADOR)' +
        ')'
      '  AND ((:NUMLOTE IS NULL) OR (LP.NUMLOTE = :NUMLOTE))'
      '  AND ((LP.FLAGCANCEL <> '#39'C'#39') OR (LP.FLAGCANCEL IS NULL))'
      ''
      'GROUP BY'
      '   LP.NUMLOTE, LP.DATAEMISSAO, LP.CODPORTFORMA'
      ''
      'UNION'
      ''
      'SELECT'
      
        '   ('#39'M'#39') AS ORIGEM, ('#39'Pgtº. Manual não calculado'#39') AS FAVORECIDO' +
        ', R.NUMLOTE, L.DATALANCTO AS DATAEMISSAO, R.CODPORTFORMA, L.VALO' +
        'R AS VALORLOTE, (L.VALOR * :PERCENTUAL /100) AS VALPREVISTO'
      'FROM'
      
        '   DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO  R, PORTADORFORMA PF,' +
        ' PORTADORCONTA PC, PARAMCAP P, BANCO BC'
      'WHERE'
      
        '      L.DATALANCTO BETWEEN (:DATA - (6+PF.DIASUTEISLANCTO)) AND ' +
        '(:DATA - PF.DIASUTEISLANCTO)'
      '  AND D.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND R.CODPORTFORMA = PF.CODPORTFORMA'
      '  AND PF.CODPORTADOR = PC.CODPORTADOR'
      '  AND R.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND PC.IDBANCO = BC.IDPESSOA'
      '  AND R.NUMLANCTO = L.NUMLANCTO'
      '  AND R.NUMLOTE = L.NUMLOTEMANUAL'
      '  AND D.RECPAG = '#39'P'#39
      '  AND L.OPERACAO = '#39'5'#39
      '  AND L.ESTORNO IS NULL'
      '  AND NVL(PC.FLGCONTAINVEST,0) <> 1'
      '  AND PF.DIASEMANALANCTO IS NOT NULL'
      '  AND PF.DIASUTEISLANCTO IS NOT NULL'
      '  AND P.RECPAG ='#39'P'#39
      '  AND P.CODTIPDOCCPMF <> D.CODTIPDOC'
      
        '  AND NOT EXISTS (SELECT NUMLOTEMANUAL FROM IMPOSTORETIDO WHERE ' +
        'NUMLOTEMANUAL = R.NUMLOTE)'
      '  AND ((:IDBANCO IS NULL) OR (PC.IDBANCO = :IDBANCO))'
      
        '  AND ((:CODPORTADOR IS NULL) OR (PC.CODPORTADOR = :CODPORTADOR)' +
        ')'
      '  AND (:NUMLOTE IS NULL)'
      '  AND NOT EXISTS (SELECT 1 FROM LOTEXDOCUM LX, LOTEPAGTO LP'
      '                  WHERE LP.NUMLOTE = LX.NUMLOTE'
      '                  AND   LX.CODDOCUMENTO = L.CODDOCUMENTO)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = CdsCPFMNaoCalc
    Left = 53
    Top = 209
  end
  object CdsCPFMNaoCalc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 53
    Top = 249
  end
  object dsDadosEmpresa: TwwDataSource
    DataSet = CdsDadosEmpresa
    Left = 157
    Top = 201
  end
  object CdsDadosEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 153
  end
  object SqlDadosEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     I.IMAGEM'
      'FROM'
      '  PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = 1) AND'
      '(E.IDPESSOA(+) = P.IDPESSOA) AND'
      ' (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      ' (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ClientDataSet = CdsDadosEmpresa
    Left = 333
    Top = 9
  end
  object SqlRelPorDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   I.NUMLOTE, D.CODDOCUMENTO, D.NUMAPGR, PE.NOME, D.DATAEMISSAO,'
      '   CPMFCALCLOTE.VLRBASE,'
      '   CPMFCALCLOTE.VLRCPMF AS CPMFCALC,'
      '   LD.VALOR AS VLRLOTE,'
      '   ((LD.VALOR * I.ALIQUOTA)/100) AS CPMFPREV'
      'FROM'
      '    PESSOA PE, FORNSERV FO, DOCUMENTO D, LOTEXDOCUM LD,'
      '    IMPOSTORETIDO I,'
      '   ( SELECT NUMLOTE, SUM(VALOR) AS TOTLOTE'
      '     FROM LOTEXDOCUM'
      '     GROUP BY NUMLOTE'
      '   ) LOTE,'
      
        '   ( SELECT NUMLOTE, SUM(VLRBASE) AS VLRBASE, SUM(VLRRETIDO) AS ' +
        'VLRRETIDO'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATA AND NUMLOTEMANUAL IS NULL'
      '     GROUP BY NUMLOTE'
      '   ) IR,'
      '   ('
      '     SELECT'
      '       I.NUMLOTE, DOC.CODDOCUMENTO,'
      
        '       SUM(DECODE(F.PERCCUSTAGREG, NULL, 0, LD.VALOR / L.VALOR *' +
        ' DOC.VALOR)) AS VLRBASE,'
      
        '       SUM((LD.VALOR / L.VALOR * DOC.VALOR * ( F.PERCCUSTAGREG /' +
        '100 ))) AS VLRCPMF'
      '     FROM'
      '('
      'SELECT'
      '   '#39'N'#39' ENGLOBADO,'
      '   D.CODDOCUMENTO,'
      '   D.NODOCUMENTO,'
      '   D.OPERACAO,'
      '   R.VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      'AND D.OPERACAO <> 3'
      ''
      'UNION ALL'
      ''
      'SELECT --DISTINCT'
      '   '#39'S'#39' ENGLOBADO,'
      '   ENGLOBADO.CODDOCUMENTO,'
      '   ENGLOBADO.NODOCUMENTO,'
      '   ENGLOBADO.OPERACAO,'
      '   ( R.VALOR * L.VALOR ) / S.VALORBRUTO AS VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R, LANCTODOCUM L,'
      '(SELECT CODDOCUMENTO, OPERACAO, NODOCUMENTO, NUMFATURA'
      'FROM DOCUMENTO'
      'WHERE OPERACAO = 3) ENGLOBADO,'
      '( SELECT D2.NUMFATURA, SUM( L2.VALOR ) AS VALORBRUTO'
      '  FROM DOCUMENTO D2, LANCTODOCUM L2'
      '  WHERE D2.CODDOCUMENTO = L2.CODDOCUMENTO'
      '  AND D2.OPERACAO = L2.OPERACAO'
      '  AND D2.OPERACAO = 1'
      '  AND D2.NUMFATURA IS NOT NULL'
      'GROUP BY D2.NUMFATURA'
      '  ) S'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      '  AND ENGLOBADO.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND ENGLOBADO.OPERACAO = L.OPERACAO'
      'AND D.NUMFATURA = ENGLOBADO.NUMFATURA'
      'AND D.NUMFATURA = S.NUMFATURA'
      ''
      ') DOC ,'
      ''
      '       LANCTODOCUM L,'
      '       LOTEXDOCUM LD,'
      '       TIPRECDESXTIPAGRE T,'
      '       TIPOAGRE          TA,'
      '       FAIXATIPOAGREG    F,'
      '       ( SELECT DISTINCT NUMLOTE'
      '         FROM IMPOSTORETIDO'
      '         WHERE DATARETENCAO = :DATA'
      '           AND NUMLOTEMANUAL IS NULL'
      '       )I'
      '     WHERE'
      '           DOC.CODDOCUMENTO = L.CODDOCUMENTO'
      '       AND DOC.OPERACAO = L.OPERACAO'
      '       AND DOC.CODDOCUMENTO = LD.CODDOCUMENTO'
      '       AND LD.NUMLOTE = I.NUMLOTE'
      '       AND ( DOC.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '       AND ( DOC.RECPAG             = T.RECPAG(+))'
      '       AND ( DOC.IDPESSOA           = T.IDPESSOA(+))'
      '       AND ( DOC.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '       AND ( DOC.IDEMPRESA          = T.IDEMPRESA(+))'
      '       AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '       AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '       AND ( ( ( :DATA >= F.DATAINI OR F.DATAINI IS NULL) AND   ' +
        ' (:DATA <= F.DATAFIM OR F.DATAFIM IS NULL ) ) )'
      
        '       AND ( DECODE(DOC.IDPROGRAMA, NULL, -1, DOC.IDPROGRAMA ) =' +
        ' DECODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '       '
      '     GROUP BY'
      '        I.NUMLOTE, DOC.CODDOCUMENTO'
      ''
      '   ) CPMFCALCLOTE'
      ''
      'WHERE'
      '   I.DATARETENCAO = :DATA'
      '   AND PE.IDPESSOA = FO.IDPESSOA'
      '   AND FO.IDPESSOA = D.IDFORCLI'
      '   AND D.CODDOCUMENTO = LD.CODDOCUMENTO'
      '   AND LD.NUMLOTE = I.NUMLOTE'
      '   AND I.NUMLOTE = LOTE.NUMLOTE'
      '   AND I.NUMLOTE = IR.NUMLOTE'
      '   AND I.NUMLOTE = CPMFCALCLOTE.NUMLOTE'
      '   AND D.CODDOCUMENTO = CPMFCALCLOTE.CODDOCUMENTO'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      
        '   I.NUMLOTEMANUAL AS NUMLOTE, D.CODDOCUMENTO, D.NUMAPGR, PE.NOM' +
        'E, D.DATAEMISSAO,'
      '   CPMFCALCDOC.VLRBASE  AS VLRBASE,'
      '   CPMFCALCDOC.VLRCPMF AS CPMFCALC,'
      '   L.VALOR AS VLRLOTE,'
      '   ((L.VALOR * I.ALIQUOTA)/100) AS CPMFPREV'
      'FROM'
      '    PESSOA PE, FORNSERV FO, DOCUMENTO D,'
      
        '    ( SELECT L.CODDOCUMENTO, L.NUMLOTEMANUAL, SUM(L.VALOR) AS VA' +
        'LOR'
      '      FROM LANCTODOCUM L'
      
        '      WHERE ((RTRIM(L.OPERACAO) = '#39'5'#39') OR  (RTRIM(L.OPERACAO) = ' +
        #39'10'#39'))'
      '        AND (L.ESTORNO IS NULL)'
      '      GROUP BY L.CODDOCUMENTO, L.NUMLOTEMANUAL'
      '    ) L,'
      '    IMPOSTORETIDO I,'
      
        '   ( SELECT NUMLOTEMANUAL, SUM(VLRBASE) AS VLRBASE, SUM(VLRRETID' +
        'O) AS VLRRETIDO'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATA AND NUMLOTE IS NULL'
      '     GROUP BY NUMLOTEMANUAL'
      '   ) IR,'
      '   ('
      '     SELECT'
      '        I.NUMLOTEMANUAL, DOC.CODDOCUMENTO,'
      
        '        SUM(DECODE(F.PERCCUSTAGREG, NULL, 0, LB.VALOR / L.VALOR ' +
        '* DOC.VALOR)) AS VLRBASE,'
      
        '        SUM((LB.VALOR / L.VALOR * DOC.VALOR * ( F.PERCCUSTAGREG ' +
        '/100 ))) AS VLRCPMF'
      '     FROM'
      '        LANCTODOCUM L, '
      '('
      'SELECT'
      '   '#39'N'#39' ENGLOBADO,'
      '   D.CODDOCUMENTO,'
      '   D.NODOCUMENTO,'
      '   D.OPERACAO,'
      '   R.VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      'AND D.OPERACAO <> 3'
      ''
      'UNION'
      ''
      'SELECT --DISTINCT'
      '   '#39'S'#39' ENGLOBADO,'
      '   ENGLOBADO.CODDOCUMENTO,'
      '   ENGLOBADO.NODOCUMENTO,'
      '   ENGLOBADO.OPERACAO,'
      '   ( R.VALOR * L.VALOR ) / S.VALORBRUTO AS VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R, LANCTODOCUM L,'
      '(SELECT CODDOCUMENTO, OPERACAO, NODOCUMENTO, NUMFATURA'
      'FROM DOCUMENTO'
      'WHERE OPERACAO = 3) ENGLOBADO, '
      '( SELECT D2.NUMFATURA, SUM( L2.VALOR ) AS VALORBRUTO  '
      '  FROM DOCUMENTO D2, LANCTODOCUM L2 '
      '  WHERE D2.CODDOCUMENTO = L2.CODDOCUMENTO'
      '  AND D2.OPERACAO = L2.OPERACAO'
      '  AND D2.OPERACAO = 1 '
      '  AND D2.NUMFATURA IS NOT NULL'
      'GROUP BY D2.NUMFATURA'
      '  ) S'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      '  AND ENGLOBADO.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND ENGLOBADO.OPERACAO = L.OPERACAO'
      'AND D.NUMFATURA = ENGLOBADO.NUMFATURA'
      'AND D.NUMFATURA = S.NUMFATURA'
      ''
      ''
      ') DOC ,'
      ''
      '        TIPRECDESXTIPAGRE T,'
      '        TIPOAGRE          TA,'
      '        FAIXATIPOAGREG    F,'
      
        '        ( SELECT L.CODDOCUMENTO, L.NUMLOTEMANUAL, SUM(L.VALOR) A' +
        'S VALOR'
      '          FROM LANCTODOCUM L'
      
        '          WHERE ((RTRIM(L.OPERACAO) = '#39'5'#39') OR  (RTRIM(L.OPERACAO' +
        ') = '#39'10'#39'))'
      '            AND (L.ESTORNO IS NULL)'
      '          GROUP BY L.CODDOCUMENTO, L.NUMLOTEMANUAL'
      '        ) LB,'
      '        ( SELECT DISTINCT NUMLOTEMANUAL'
      '          FROM IMPOSTORETIDO'
      '          WHERE DATARETENCAO = :DATA'
      '          AND NUMLOTE IS NULL'
      '        )I'
      '     WHERE'
      '            DOC.CODDOCUMENTO = L.CODDOCUMENTO'
      '        AND DOC.OPERACAO = L.OPERACAO'
      '        AND DOC.CODDOCUMENTO = LB.CODDOCUMENTO'
      '        AND ( LB.NUMLOTEMANUAL     = I.NUMLOTEMANUAL)'
      '        AND ( DOC.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '        AND ( DOC.RECPAG             = T.RECPAG(+))'
      '        AND ( DOC.IDPESSOA           = T.IDPESSOA(+))'
      '        AND ( DOC.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '        AND ( DOC.IDEMPRESA          = T.IDEMPRESA(+))'
      '        AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '        AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '        AND (  (    (:DATA >= F.DATAINI OR F.DATAINI IS NULL) AN' +
        'D    (:DATA <= F.DATAFIM OR F.DATAFIM IS NULL)  )      )'
      ''
      
        '        AND ( DECODE(DOC.IDPROGRAMA, NULL, -1, DOC.IDPROGRAMA ) ' +
        '= DECODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '     GROUP BY'
      '        I.NUMLOTEMANUAL, DOC.CODDOCUMENTO'
      '   ) CPMFCALCDOC'
      'WHERE'
      '   I.DATARETENCAO = :DATA'
      '   AND PE.IDPESSOA = FO.IDPESSOA'
      '   AND FO.IDPESSOA = D.IDFORCLI'
      '   AND D.CODDOCUMENTO = L.CODDOCUMENTO'
      '   AND L.NUMLOTEMANUAL = I.NUMLOTEMANUAL'
      '   AND I.NUMLOTEMANUAL = IR.NUMLOTEMANUAL'
      '   AND I.NUMLOTEMANUAL = CPMFCALCDOC.NUMLOTEMANUAL'
      '   AND D.CODDOCUMENTO  = CPMFCALCDOC.CODDOCUMENTO'
      ''
      'ORDER BY NUMLOTE, CODDOCUMENTO'
      ''
      ''
      ' ')
    ClientDataSet = CdsRelPorDoc
    Left = 341
    Top = 57
  end
  object CdsRelPorDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 153
    object CdsRelPorDocNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object CdsRelPorDocCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsRelPorDocNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsRelPorDocNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsRelPorDocDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsRelPorDocVLRBASE: TFloatField
      FieldName = 'VLRBASE'
    end
    object CdsRelPorDocCPMFCALC: TFloatField
      FieldName = 'CPMFCALC'
    end
    object CdsRelPorDocVLRLOTE: TFloatField
      FieldName = 'VLRLOTE'
    end
    object CdsRelPorDocCPMFPREV: TFloatField
      FieldName = 'CPMFPREV'
    end
  end
  object dsRelPorDoc: TwwDataSource
    DataSet = CdsRelPorDoc
    Left = 253
    Top = 201
  end
  object dsRateio: TwwDataSource
    DataSet = CdsRateio
    Left = 333
    Top = 217
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 309
    Top = 161
    object CdsRateioNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object CdsRateioCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsRateioCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsRateioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsRateioCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object CdsRateioNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object CdsRateioFLGTIPOPROGRAMA: TStringField
      FieldName = 'FLGTIPOPROGRAMA'
      Size = 3
    end
    object CdsRateioDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object CdsRateioVLRBASE: TFloatField
      FieldName = 'VLRBASE'
    end
    object CdsRateioVLRCPMF: TFloatField
      FieldName = 'VLRCPMF'
    end
  end
  object SqlRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   TRD.FLGCALCULAIMPOSTO,'
      
        '   I.NUMLOTE, DOC.CODDOCUMENTO, TRD.CODTIPRECDES, TRD.DESCRICAO,' +
        ' CC.CODEXTERNO, CC.NOME, P.FLGTIPOPROGRAMA, TA.DESCCUSTAGREG,'
      '   LD.VALOR / L.VALOR * DOC.VALOR AS VLRBASE,'
      
        '   (LD.VALOR / L.VALOR * DOC.VALOR * ( F.PERCCUSTAGREG /100 )) A' +
        'S VLRCPMF'
      'FROM'
      '('
      'SELECT'
      '   '#39'N'#39' ENGLOBADO,'
      '   D.CODDOCUMENTO,'
      '   D.NODOCUMENTO,'
      '   D.OPERACAO,'
      '   R.VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      'AND D.OPERACAO <> 3'
      ''
      'UNION ALL'
      ''
      'SELECT --DISTINCT'
      '   '#39'S'#39' ENGLOBADO,'
      '   ENGLOBADO.CODDOCUMENTO,'
      '   ENGLOBADO.NODOCUMENTO,'
      '   ENGLOBADO.OPERACAO,'
      '   ( R.VALOR * L.VALOR ) / S.VALORBRUTO AS VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R, LANCTODOCUM L,'
      '(SELECT CODDOCUMENTO, OPERACAO, NODOCUMENTO, NUMFATURA'
      'FROM DOCUMENTO'
      'WHERE OPERACAO = 3) ENGLOBADO,'
      '( SELECT D2.NUMFATURA, SUM( L2.VALOR ) AS VALORBRUTO'
      '  FROM DOCUMENTO D2, LANCTODOCUM L2'
      '  WHERE D2.CODDOCUMENTO = L2.CODDOCUMENTO'
      '  AND D2.OPERACAO = L2.OPERACAO'
      '  AND D2.OPERACAO = 1'
      '  AND D2.NUMFATURA IS NOT NULL'
      'GROUP BY D2.NUMFATURA'
      '  ) S'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      '  AND ENGLOBADO.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND ENGLOBADO.OPERACAO = L.OPERACAO'
      'AND D.NUMFATURA = ENGLOBADO.NUMFATURA'
      'AND D.NUMFATURA = S.NUMFATURA'
      ''
      ') DOC ,'
      '    LANCTODOCUM L,'
      '    TIPORECEBDESEMB TRD, CENTCUST CC, PROGRAMA P,'
      '    LOTEXDOCUM LD,'
      '    TIPRECDESXTIPAGRE T,'
      '    TIPOAGRE          TA,'
      '    FAIXATIPOAGREG    F,'
      '   ( SELECT DISTINCT'
      '       NUMLOTE'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATA'
      '       AND NUMLOTEMANUAL IS NULL'
      '   )I'
      'WHERE'
      '   TRD.RECPAG = '#39'P'#39
      '   AND DOC.CODDOCUMENTO = L.CODDOCUMENTO'
      '   AND DOC.OPERACAO = L.OPERACAO'
      '   AND DOC.CODTIPRECDES = TRD.CODTIPRECDES'
      '   AND DOC.IDEMPRESA = CC.IDEMPRESA (+)'
      '   AND DOC.CODCENTROCUSTO = CC.CODCENTROCUSTO (+)'
      '   AND DOC.IDPROGRAMA = P.IDPROGRAMA (+)'
      '   AND DOC.CODDOCUMENTO = LD.CODDOCUMENTO'
      '   AND LD.NUMLOTE = I.NUMLOTE'
      '   AND ( DOC.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '   AND ( DOC.RECPAG             = T.RECPAG(+))'
      '   AND ( DOC.IDPESSOA           = T.IDPESSOA(+))'
      '   AND ( DOC.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '   AND ( DOC.IDEMPRESA          = T.IDEMPRESA(+))'
      '   AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '   AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '   AND ( ( (:DATA >= F.DATAINI OR F.DATAINI IS NULL) AND    (:DA' +
        'TA <= F.DATAFIM OR F.DATAFIM IS NULL ) ) )'
      
        '   AND ( DECODE(DOC.IDPROGRAMA, NULL, -1, DOC.IDPROGRAMA ) = DEC' +
        'ODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      ''
      'UNION ALL'
      ''
      'SELECT'
      '   TRD.FLGCALCULAIMPOSTO,'
      
        '   I.NUMLOTEMANUAL AS NUMLOTE, DOC.CODDOCUMENTO, TRD.CODTIPRECDE' +
        'S, TRD.DESCRICAO, CC.CODEXTERNO, CC.NOME, P.FLGTIPOPROGRAMA, TA.' +
        'DESCCUSTAGREG,'
      '   LB.VALOR / L.VALOR * DOC.VALOR AS VLRBASE,'
      
        '   (LB.VALOR / L.VALOR * DOC.VALOR * ( F.PERCCUSTAGREG /100 )) A' +
        'S VLRCPMF'
      'FROM'
      ''
      '('
      'SELECT'
      '   '#39'N'#39' ENGLOBADO,'
      '   D.CODDOCUMENTO,'
      '   D.NODOCUMENTO,'
      '   D.OPERACAO,'
      '   R.VALOR,'
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA'
      'FROM DOCUMENTO D, RATEIODOCUM R'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      'AND D.OPERACAO <> 3'
      ''
      'UNION ALL'
      ''
      'SELECT --DISTINCT'
      '   '#39'S'#39' ENGLOBADO,'
      '   ENGLOBADO.CODDOCUMENTO,'
      '   ENGLOBADO.NODOCUMENTO,'
      '   ENGLOBADO.OPERACAO,'
      '   ( R.VALOR * L.VALOR ) / S.VALORBRUTO AS VALOR, '
      '   R.CODTIPRECDES,'
      '   R.IDEMPRESA,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   R.RECPAG,'
      '   R.IDPESSOA    '
      'FROM DOCUMENTO D, RATEIODOCUM R, LANCTODOCUM L,'
      '(SELECT CODDOCUMENTO, OPERACAO, NODOCUMENTO, NUMFATURA'
      'FROM DOCUMENTO'
      'WHERE OPERACAO = 3) ENGLOBADO,'
      '( SELECT D2.NUMFATURA, SUM( L2.VALOR ) AS VALORBRUTO  '
      '  FROM DOCUMENTO D2, LANCTODOCUM L2 '
      '  WHERE D2.CODDOCUMENTO = L2.CODDOCUMENTO'
      '  AND D2.OPERACAO = L2.OPERACAO'
      '  AND D2.OPERACAO = 1 '
      '  AND D2.NUMFATURA IS NOT NULL'
      'GROUP BY D2.NUMFATURA'
      '  ) S'
      'WHERE D.CODDOCUMENTO = R.CODDOCUMENTO'
      '  AND ENGLOBADO.CODDOCUMENTO = L.CODDOCUMENTO'
      '  AND ENGLOBADO.OPERACAO = L.OPERACAO'
      'AND D.NUMFATURA = ENGLOBADO.NUMFATURA'
      'AND D.NUMFATURA = S.NUMFATURA'
      ''
      ') DOC ,'
      ''
      '    LANCTODOCUM L,'
      '    TIPORECEBDESEMB TRD, CENTCUST CC, PROGRAMA P,'
      '    TIPRECDESXTIPAGRE T,'
      '    TIPOAGRE          TA,'
      '    FAIXATIPOAGREG    F,'
      
        '    ( SELECT L.CODDOCUMENTO, L.NUMLOTEMANUAL, SUM(L.VALOR) AS VA' +
        'LOR'
      '      FROM LANCTODOCUM L'
      
        '      WHERE ((RTRIM(L.OPERACAO) = '#39'5'#39') OR  (RTRIM(L.OPERACAO) = ' +
        #39'10'#39'))'
      '        AND (L.ESTORNO IS NULL)'
      '      GROUP BY L.CODDOCUMENTO, L.NUMLOTEMANUAL'
      '    ) LB,'
      '   ( SELECT DISTINCT'
      '       NUMLOTEMANUAL'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATA'
      '       AND NUMLOTE IS NULL'
      '   )I'
      'WHERE'
      '   TRD.RECPAG = '#39'P'#39
      '   AND DOC.CODDOCUMENTO = L.CODDOCUMENTO'
      '   AND DOC.OPERACAO = L.OPERACAO'
      '   AND DOC.CODTIPRECDES = TRD.CODTIPRECDES'
      '   AND DOC.IDEMPRESA = CC.IDEMPRESA (+)'
      '   AND DOC.CODCENTROCUSTO = CC.CODCENTROCUSTO (+)'
      '   AND DOC.IDPROGRAMA = P.IDPROGRAMA (+)'
      '   AND DOC.CODDOCUMENTO = LB.CODDOCUMENTO'
      '   AND LB.NUMLOTEMANUAL = I.NUMLOTEMANUAL'
      '   AND ( DOC.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '   AND ( DOC.RECPAG             = T.RECPAG(+))'
      '   AND ( DOC.IDPESSOA           = T.IDPESSOA(+))'
      '   AND ( DOC.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '   AND ( DOC.IDEMPRESA          = T.IDEMPRESA(+))'
      '   AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '   AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '   AND (  (    (:DATA >= F.DATAINI OR F.DATAINI IS NULL) AND    ' +
        '(:DATA <= F.DATAFIM OR F.DATAFIM IS NULL)  )      )'
      
        '   AND ( DECODE(DOC.IDPROGRAMA, NULL, -1, DOC.IDPROGRAMA ) = DEC' +
        'ODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '   '
      
        'ORDER BY NUMLOTE, CODDOCUMENTO, CODTIPRECDES, CODEXTERNO, FLGTIP' +
        'OPROGRAMA'
      ' '
      ' '
      ' ')
    ClientDataSet = CdsRateio
    Left = 333
    Top = 105
  end
  object SqlVerificaCPMF: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   F.PERCCUSTAGREG, T.*'
      'FROM'
      '   TIPOAGRE T,'
      '   PARAMCAP P,'
      '   FAIXATIPOAGREG F'
      'WHERE'
      '    P.RECPAG = '#39'P'#39
      'AND P.CODTIPDOCCPMF = T.CODTIPDOC'
      'AND P.IDPESSOA  =  :IDEMPRESA'
      'AND T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG'
      
        'AND (  (    (:DATA >= F.DATAINI OR F.DATAINI IS NULL) AND    (:D' +
        'ATA <= F.DATAFIM OR F.DATAFIM IS NULL)  )      ) ')
    ClientDataSet = CdsVerificaCPMF
    Left = 397
    Top = 113
  end
  object CdsVerificaCPMF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 161
  end
  object ppPipLinRelPorDoc: TppDBPipeline
    DataSource = dsRelPorDoc
    UserName = 'PipLinRelPorDoc'
    Left = 77
    Top = 313
    object ppPipLinRelPorDocppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField2: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField3: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField5: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField6: TppField
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField7: TppField
      FieldAlias = 'CPMFCALC'
      FieldName = 'CPMFCALC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField8: TppField
      FieldAlias = 'VLRLOTE'
      FieldName = 'VLRLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPipLinRelPorDocppField9: TppField
      FieldAlias = 'CPMFPREV'
      FieldName = 'CPMFPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ppPipLinDadosEmpresa: TppDBPipeline
    DataSource = dsDadosEmpresa
    UserName = 'PipLinDadosEmpresa'
    Left = 165
    Top = 265
    object ppPipLinDadosEmpresappField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object ppPipLinDadosRel: TppDBPipeline
    DataSource = DsLotes
    CloseDataSource = True
    UserName = 'PipLinDadosRel'
    Left = 213
    Top = 266
    object ppPipLinDadosRelppField1: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField2: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField3: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField4: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField5: TppField
      FieldAlias = 'VALCALCULADO'
      FieldName = 'VALCALCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField6: TppField
      FieldAlias = 'VALORBASE'
      FieldName = 'VALORBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField7: TppField
      FieldAlias = 'DATARETENCAO'
      FieldName = 'DATARETENCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField8: TppField
      FieldAlias = 'FLGCONFIRMARECPAG'
      FieldName = 'FLGCONFIRMARECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField9: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField10: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField11: TppField
      FieldAlias = 'DIASEMANALANCTO'
      FieldName = 'DIASEMANALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField12: TppField
      FieldAlias = 'DIASUTEISLANCTO'
      FieldName = 'DIASUTEISLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField13: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField14: TppField
      FieldAlias = 'RECALCULA'
      FieldName = 'RECALCULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField15: TppField
      FieldAlias = 'VALORLOTE'
      FieldName = 'VALORLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField16: TppField
      FieldAlias = 'VALPREVISTO'
      FieldName = 'VALPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField17: TppField
      FieldAlias = 'VALORAUDITORIA'
      FieldName = 'VALORAUDITORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppPipLinDadosRelppField18: TppField
      FieldAlias = 'IDIMPOSTORETIDO'
      FieldName = 'IDIMPOSTORETIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object ppPipLinRateio: TppDBPipeline
    DataSource = dsRateio
    UserName = 'PipLinRateio'
    Left = 389
    Top = 233
    object ppPipLinRateioppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField2: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField3: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField4: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField5: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField7: TppField
      FieldAlias = 'FLGTIPOPROGRAMA'
      FieldName = 'FLGTIPOPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField8: TppField
      FieldAlias = 'DESCCUSTAGREG'
      FieldName = 'DESCCUSTAGREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField9: TppField
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPipLinRateioppField10: TppField
      FieldAlias = 'VLRCPMF'
      FieldName = 'VLRCPMF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
end
