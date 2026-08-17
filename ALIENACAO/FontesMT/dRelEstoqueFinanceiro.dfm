inherited dtmRelEstoqueFinanceiro: TdtmRelEstoqueFinanceiro
  Left = 306
  Top = 246
  Width = 401
  Height = 246
  Caption = 'dtmRelEstoqueFinanceiro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Segmento'
        Controle = tcEdit
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
        Name = 'Segmento'
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
        Caption = 'Contrato'
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
        Name = 'Contrato'
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
        Caption = 'Data'
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
        Name = 'Data'
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
        Caption = 'bSeparador'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Name = 'bSeparador'
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
        Caption = 'bCorLinha'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Name = 'bCorLinha'
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
        Caption = 'iPosCor'
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
        Name = 'iPosCor'
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
        Caption = 'iTipo'
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
        Name = 'iTipo'
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
        Caption = 'iTipoRelat'
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
        Name = 'iTipoRelat'
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
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptEstoqueFinanceiro
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Active = False
    Left = 40
    Top = 88
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       P.RAZAOSOCIAL,'
      '       IM.NOMEMESTRE,'
      '       IM.SEGMENTO,'
      '       0 AS VALOR'
      '  FROM'
      '       CONTRATOIMOVEL CI,'
      '       PESSOA P,'
      '       '
      '       ( SELECT DISTINCT'
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '                M.IMONOME            AS NOMEMESTRE,'
      '                M.IDIMOVEL           AS IDIMOVEL,'
      '                I.CODTIPIMOVEL       AS SEGMENTO'
      '           FROM CONTRATOXIMOVEL CXI,'
      '                IMOVEL I,'
      '                IMOVEL M'
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '            AND I.IDIMOVELMESTRE = M.IDIMOVEL'
      '       ) IM'
      ' WHERE  (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      '    AND ( CI.IDCONTRATOIMOVEL = 2181 )'
      ''
      '  ORDER BY IM.SEGMENTO, CI.CONNUMERO'
      '')
    Left = 172
    Top = 88
  end
  inherited ds: TDataSource
    Top = 88
  end
  object rptEstoqueFinanceiro: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 300
    Top = 88
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 794
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Estoque Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 8467
        mmWidth = 197380
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 17198
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clWindow
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object rptParcelas: TppSubReport
        OnPrint = rptParcelasPrint
        UserName = 'rptParcelas'
        DrillDownComponent = ppDBText2
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplParc'
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplParc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
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
          Units = utMillimeters
          Left = 192
          Top = 104
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplParc'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 9260
            mmPrintPosition = 0
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 61648
              mmTop = 5292
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Limite'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 84931
              mmTop = 5292
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 96044
              mmTop = 5292
              mmWidth = 12435
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Principal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 136790
              mmTop = 5292
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Acres/Decres'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 150548
              mmTop = 5292
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 179917
              mmTop = 5292
              mmWidth = 6085
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Multa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 199232
              mmTop = 5292
              mmWidth = 5821
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Correção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 215636
              mmTop = 5292
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Vlr. Devido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 233363
              mmTop = 5292
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Vlr. Pago'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 254001
              mmTop = 5292
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Dias Atraso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              mmHeight = 5821
              mmLeft = 110596
              mmTop = 2381
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Diferença'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 273844
              mmTop = 5292
              mmWidth = 10583
              BandType = 1
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 8466
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 34131
              mmTop = 5292
              mmWidth = 12435
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Lançamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 2910
              mmTop = 5292
              mmWidth = 13494
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'CODDOCUMENTO'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 3175
              mmLeft = 34131
              mmTop = 0
              mmWidth = 23813
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'DATAVENCIMENTO'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 59267
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'DATALIMITE'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 76200
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'DATAPAGAMENTO'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 93134
              mmTop = 0
              mmWidth = 15346
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VLRPRESTACAO'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 129117
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'TOT_ALTERADOR'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 3175
              mmLeft = 148167
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'TOT_JUROS'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 168805
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'TOT_MULTA'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 187855
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'TOT_CORRECAO'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 208492
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'VLRDEVIDO'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 228071
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'DIASDIF'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 110596
              mmTop = 0
              mmWidth = 10583
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'VLRPAGO'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 246857
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'VLRDIF'
              DataPipeline = pplParc
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 267230
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'CAL_TIPO'
              DataPipeline = pplParc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplParc'
              mmHeight = 2910
              mmLeft = 2910
              mmTop = 0
              mmWidth = 29369
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1058
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CONNUMERO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CONNOME'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 0
        mmWidth = 102129
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 0
        mmWidth = 83079
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALOR'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 0
        mmWidth = 35983
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object lblSistema: TppLabel
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
        mmWidth = 287338
        BandType = 8
      end
      object ppOrcamentoSystemVariable7: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 285751
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 255323
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALOR'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 1058
        mmWidth = 35983
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 209021
        mmTop = 1058
        mmWidth = 16669
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SEGMENTO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'SEGMENTO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3704
          mmLeft = 26458
          mmTop = 1323
          mmWidth = 97367
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1323
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 9260
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 34660
          mmTop = 9260
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 9260
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Valor Atual.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 246592
          mmTop = 9260
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 13758
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 2117
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3704
          mmLeft = 228336
          mmTop = 3704
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Total do Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 197115
          mmTop = 3704
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 222
    Top = 80
    object pplppField1: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplppField2: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplppField3: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplppField4: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplppField5: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplppField6: TppField
      FieldAlias = 'SEGMENTO'
      FieldName = 'SEGMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplppField7: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object cdsParc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 128
  end
  object dsParc: TDataSource
    DataSet = cdsParc
    Left = 80
    Top = 144
  end
  object pplParc: TppBDEPipeline
    DataSource = dsParc
    UserName = 'ppl1'
    Left = 134
    Top = 144
    object pplParcppField1: TppField
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplParcppField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplParcppField3: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplParcppField4: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplParcppField5: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplParcppField6: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplParcppField7: TppField
      FieldAlias = 'SEGMENTO'
      FieldName = 'SEGMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplParcppField8: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplParcppField9: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplParcppField10: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplParcppField11: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplParcppField12: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplParcppField13: TppField
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplParcppField14: TppField
      FieldAlias = 'DATALIMITE'
      FieldName = 'DATALIMITE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplParcppField15: TppField
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplParcppField16: TppField
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplParcppField17: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplParcppField18: TppField
      FieldAlias = 'TOT_ALTERADOR'
      FieldName = 'TOT_ALTERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplParcppField19: TppField
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplParcppField20: TppField
      FieldAlias = 'DIASDIF'
      FieldName = 'DIASDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplParcppField21: TppField
      FieldAlias = 'VLRCMATRASO'
      FieldName = 'VLRCMATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplParcppField22: TppField
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplParcppField23: TppField
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplParcppField24: TppField
      FieldAlias = 'VLRCMCORRIG'
      FieldName = 'VLRCMCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplParcppField25: TppField
      FieldAlias = 'VLRMULTACORRIG'
      FieldName = 'VLRMULTACORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplParcppField26: TppField
      FieldAlias = 'VLRJUROSCORRIG'
      FieldName = 'VLRJUROSCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplParcppField27: TppField
      FieldAlias = 'TOT_CORRECAO'
      FieldName = 'TOT_CORRECAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplParcppField28: TppField
      FieldAlias = 'TOT_MULTA'
      FieldName = 'TOT_MULTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplParcppField29: TppField
      FieldAlias = 'TOT_JUROS'
      FieldName = 'TOT_JUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplParcppField30: TppField
      FieldAlias = 'VLRDEVIDO'
      FieldName = 'VLRDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplParcppField31: TppField
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '   SELECT PF.IDPARCFINANCIMOV,'
      '         PF.IDCONDPAGIMOVEL,'
      '         PF.CODDOCUMENTO,'
      '          CP.IDCONTRATOIMOVEL,'
      '          CI.CONNUMERO,'
      '          CI.CONNOME,'
      '          IM.SEGMENTO,'
      '          '#39'                       '#39' AS CAL_TIPO,'
      '          (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '          P.RAZAOSOCIAL,'
      
        '          DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ' +
        #39'/'#39' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '          DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIM' +
        'ENTO) AS DATAVENCIMENTO,'
      
        '          DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTA' +
        'CAO) AS VLRPRESTACAO,'
      '          PF.DATALIMITE,'
      '          PF.FLGTIPOLANC,'
      '          PF.FLGLANCINTEGRA,'
      '          PP.DATAPAGAMENTO,'
      '          ALT.TOT_ALTERADOR,'
      '          ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO,'
      '          PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF,'
      ''
      '          CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,'
      '          MA.VLRMULTAATRASO AS VLRMULTAATRASO,'
      '          JA.VLRMORAATRASO AS VLRMORAATRASO,'
      ''
      '          CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,   '
      '          MS.VLRMULTASALDO    AS VLRMULTACORRIG,   '
      '          JS.VLRMORASALDO AS VLRJUROSCORRIG,   '
      ''
      
        '          NVL(CMA.VLRCORRIGIDOATRASO,0) + NVL(CMS.VLRCORRIGIDOSA' +
        'LDO,0) AS TOT_CORRECAO, '
      
        '          NVL(MA.VLRMULTAATRASO,0) + NVL(MS.VLRMULTASALDO,0)   A' +
        'S TOT_MULTA,   '
      
        '          NVL(JA.VLRMORAATRASO,0) + NVL(JS.VLRMORASALDO,0) AS TO' +
        'T_JUROS,   '
      ''
      '             '
      '          NVL(PF.VLRPRESTACAO,0) +'
      '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) +'
      '          NVL(MA.VLRMULTAATRASO, 0 ) +'
      '          NVL(JA.VLRMORAATRASO, 0 ) +'
      '          NVL(CMS.VLRCORRIGIDOSALDO,0) +'
      '          NVL(MS.VLRMULTASALDO,0) +'
      '          NVL(JS.VLRMORASALDO,0) +'
      '          NVL(ALT.TOT_ALTERADOR,0) AS VLRDEVIDO,'
      ''
      '          NVL(PF.VLRPRESTACAO,0) +'
      '          NVL(CMA.VLRCORRIGIDOATRASO, 0 ) +'
      '          NVL(MA.VLRMULTAATRASO, 0 ) +'
      '          NVL(JA.VLRMORAATRASO, 0 ) -'
      '          NVL(PP.VLRPAGO, 0 ) +'
      '          NVL(CMS.VLRCORRIGIDOSALDO,0) +'
      '          NVL(MS.VLRMULTASALDO,0) +'
      '          NVL(JS.VLRMORASALDO,0) +'
      '          NVL(ALT.TOT_ALTERADOR,0) AS VLRDIF'
      '          '
      '               '
      '     FROM PARCFINANCIMOV PF,  '
      '          CONDPAGIMOVEL  CP,  '
      '          CONTRATOIMOVEL CI,  '
      '          PESSOA P,           '
      '                  ( SELECT /*+ INDEX(D) INDEX(LD)*/           '
      '                           LD.CODDOCUMENTO, T.CODTIPIMOVEL,   '
      
        '                           SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, ' +
        '(LD.VALOR * -1)) ) AS TOT_ALTERADOR '
      
        '                      FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALI' +
        'ENACAO PA,          '
      
        '                           PARCFINANCIMOV P, CONDPAGIMOVEL C,  T' +
        'IPOIMOVEL T,        '
      
        '                           ( SELECT DISTINCT C.IDCONTRATOIMOVEL,' +
        ' I.CODTIPIMOVEL     '
      
        '                               FROM CONTRATOIMOVEL C, CONTRATOXI' +
        'MOVEL CXI, IMOVEL I '
      
        '                              WHERE CXI.IDIMOVEL = I.IDIMOVEL   ' +
        '                    '
      
        '                                AND CXI.IDCONTRATOIMOVEL = C.IDC' +
        'ONTRATOIMOVEL       '
      
        '                                AND C.FLGTIPOCONTRATO = '#39'C'#39' ) TC' +
        '                  '
      '                     WHERE RTRIM(LD.OPERACAO) = '#39'4'#39' '
      '                       AND LD.CODALTERADOR <> 215'
      '                       AND LD.CODALTERADOR <> 216'
      '                       AND PA.IDPESSOA = 1'
      '                       AND LD.CODDOCUMENTO = D.CODDOCUMENTO '
      '                       AND D.CODDOCUMENTO = P.CODDOCUMENTO  '
      
        '                       AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL' +
        ' '
      
        '                       AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMO' +
        'VEL '
      
        '                       AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL     ' +
        '    '
      '                       AND LD.DATALANCTO <= '#39'31/08/2005'#39
      
        '                       AND ( PA.IDOPERATUALCM IS NULL OR        ' +
        '      '
      
        '                             ( LD.CODALTERADOR <> T.CODALTCMAL A' +
        'ND    '
      
        '                               LD.CODALTERADOR <> T.CODALTJRAL A' +
        'ND    '
      
        '                               LD.CODALTERADOR <> T.CODALTMTAL )' +
        ' )    '
      
        '                       AND D.IDMODULO = 135                     ' +
        '      '
      
        '                     GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )' +
        '  ALT,'
      ''
      ''
      '          (  '
      '            SELECT /*+ INDEX(LD) INDEX(RP)*/    '
      '                   IDPARCFINANCIMOV,  '
      
        '                   DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAME' +
        'NTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO,  '
      
        '                   DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), ' +
        'SUM(LD.VALOR) ) AS VLRPAGO  '
      
        '              FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO' +
        ' RP  '
      '             WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)  '
      '               AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)  '
      '               AND LD.NUMLANCTO    = RP.NUMLANCTO(+)     '
      
        '               AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENT' +
        'O <= '#39'31/08/2005'#39' ) OR  '
      
        '                    (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.O' +
        'PERACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 )  '
      
        '                                                AND LD.ESTORNO I' +
        'S NULL             '
      
        '                                                AND LD.DATALANCT' +
        'O <= '#39'31/08/2005'#39' ) )  '
      
        '             GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO          ' +
        '                   '
      '          ) PP,  '
      ''
      '          ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,  '
      '                   A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                   A.DATAINI,                         '
      '                   A.IDCONDPAGIMOVEL                  '
      '              FROM CONDPAGIMOVEL A,                   '
      '                   (SELECT IDCONDINICIAL,             '
      '                           MAX(DATAINI) AS DATAINI    '
      '                      FROM CONDPAGIMOVEL              '
      '                     GROUP BY IDCONDINICIAL) B        '
      '             WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '               AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      ''
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULT' +
        'AATRASO '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '        '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '        '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2       '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALMULT' +
        'A)      '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39') ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA  = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) MA,                                         '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORA' +
        'ATRASO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALJURO' +
        'S)    '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39' ) ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) JA,                                          '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORR' +
        'IGIDOATRASO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALCM) ' +
        '   '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39') ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NOT NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALCM )     '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) CMA,                                          '
      ''
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULT' +
        'ASALDO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '        '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '        '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2       '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALMULT' +
        'A)      '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1   '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) MS,                                         '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORA' +
        'SALDO '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1   '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALJURO' +
        'S)    '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1  '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )  '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) JS,                                          '
      '          ( SELECT /*+ INDEX (L) */                 '
      
        '                   L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORR' +
        'IGIDOSALDO  '
      
        '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,         ' +
        '      '
      
        '                   ( SELECT MAX(L2.DATAOPER) AS DTAPUR          ' +
        '      '
      
        '                       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P' +
        '2     '
      '                      WHERE P2.IDPESSOA = 1  '
      
        '                        AND ( L2.IDOPERACAO = P2.IDOPERATUALCM) ' +
        '   '
      '                        AND ( DATAOPER <= '#39'31/08/2005'#39')  ) D  '
      '             WHERE L.DATAOPER = D.DTAPUR    '
      '               AND L.DATABAIXA IS NULL  '
      '               AND P.IDPESSOA = 1   '
      '               AND ( L.IDOPERACAO = P.IDOPERATUALCM )     '
      '             GROUP BY L.IDPARCFINANCIMOV                  '
      '           ) CMS,                                          '
      '          ( SELECT DISTINCT                                  '
      '                   CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,  '
      '                   M.IMONOME   AS NOMEMESTRE,                '
      '                   M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                   C.UF        AS UF,    '
      '                   I.CODTIPIMOVEL       AS SEGMENTO           '
      '              FROM CONTRATOXIMOVEL CXI,  '
      '                   IMOVEL I,  '
      '                   IMOVEL M,  '
      '                   CIDADES C  '
      '             WHERE CXI.IDIMOVEL = I.IDIMOVEL              '
      '              AND  M.IDCIDADES = C.IDCIDADES(+)           '
      '              AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM     '
      '     WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))          '
      '       AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') = '#39'N'#39')          '
      '       AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '       AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '
      '       AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '       AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '
      '       AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))  '
      '       AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))  '
      '       AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '
      '       AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '       AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL) '
      '       AND ( CI.IDCONTRATOIMOVEL = 2181) '
      ''
      
        '     ORDER BY IM.SEGMENTO, CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DAT' +
        'AVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA '
      ''
      ' ')
    ClientDataSet = cdsParc
    Left = 212
    Top = 144
  end
end
