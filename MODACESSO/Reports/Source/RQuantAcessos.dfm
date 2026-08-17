inherited RptQuantAcessos: TRptQuantAcessos
  Left = 258
  Top = 196
  Width = 288
  Height = 279
  Caption = 'RptQuantAcessos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NomeEmpresa'
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
        Name = 'NomeEmpresa'
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
        Caption = 'ListaIdPessoa'
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
        Name = 'ListaIdPessoa'
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
        Caption = 'DataInicial'
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
        Name = 'DataInicial'
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
        Caption = 'DataFinal'
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
        Name = 'DataFinal'
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
    DataBaseName = 'BaseDados'
    Report = rpQuantAcessos
  end
  object rpQuantAcessos: TppReport
    AutoStop = False
    DataPipeline = ppQuantAcessos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 210
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppQuantAcessos'
    object rpOcorrPessHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'rpOcorrPessLbl1'
        AutoSize = False
        Caption = 'Quantidade de Acessos Permitidos e Realizados por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 45508
        mmTop = 9525
        mmWidth = 102659
        BandType = 0
      end
      object rpOcorrPessLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrPessLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
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
        mmLeft = 154252
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 4318
        mmLeft = 87694
        mmTop = 2381
        mmWidth = 17230
        BandType = 0
      end
      object rpOcorrPessSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 10319
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessLbl4: TppLabel
        UserName = 'rpOcorrPessLbl4'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 18521
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessLblDATAINI: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object rpOcorrPessLbl5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object rpOcorrPessLblDATAFINAL: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
    end
    object rpOcorrPessDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpOcorrPessDBTxt6: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRICAO'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 529
        mmWidth = 111390
        BandType = 4
      end
      object rpOcorrPessDBTxt7: TppDBText
        UserName = 'DBText7'
        DataField = 'SAIDA'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 134409
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ENTRADA'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 114565
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PERMITIDOS'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'REALIZADOS'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDO'
        DataPipeline = ppQuantAcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppQuantAcessos'
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 529
        mmWidth = 8202
        BandType = 4
      end
    end
    object rpOcorrPessSmryBnd: TppSummaryBand
      AfterPrint = rpOcorrPessSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object rpOcorrPessGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppQuantAcessos
      OutlineSettings.CreateNode = True
      UserName = 'rpOcorrPessGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppQuantAcessos'
      object rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpOcorrPessLbl6: TppLabel
          UserName = 'rpTabCIDLbl4'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1852
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpOcorrPessLbl7: TppLabel
          UserName = 'rpTabCIDLbl5'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 1852
          mmWidth = 85461
          BandType = 3
          GroupNo = 0
        end
        object rpOcorrPessLbl8: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Cargo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 1852
          mmWidth = 65088
          BandType = 3
          GroupNo = 0
        end
      end
      object rpOcorrPessGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object rpOcorrPessLbl14: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 4763
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLbl15: TppLabel
          UserName = 'Label7'
          Caption = 'Totais Gerais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 128323
          mmTop = 4763
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object rpCalc1Tot: TppDBCalc
          UserName = 'rpCalc1Tot'
          DataField = 'PERMITIDOS'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOcorrPessGrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 4233
          mmLeft = 153459
          mmTop = 4763
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object rpCalc2Tot: TppDBCalc
          UserName = 'rpCalc2Tot'
          DataField = 'REALIZADOS'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = rpOcorrPessGrp1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 4233
          mmLeft = 169863
          mmTop = 4763
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessDBCalc1: TppDBCalc
          UserName = 'rpOcorrPessDBCalc1'
          DataField = 'NUMEMPREGADO'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 3704
          mmLeft = 31750
          mmTop = 4763
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOcorrPessGrp2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppQuantAcessos
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppQuantAcessos'
      object rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 6879
          mmLeft = 794
          mmTop = 0
          mmWidth = 194205
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt3: TppDBText
          UserName = 'rpOcorrPessDBTxt3'
          DataField = 'MATRICULA'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1588
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt4: TppDBText
          UserName = 'rpOcorrPessDBTxt4'
          DataField = 'NOME'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 1588
          mmWidth = 85461
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt5: TppDBText
          UserName = 'rpOcorrPessDBTxt5'
          DataField = 'CARGO'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 1588
          mmWidth = 78317
          BandType = 3
          GroupNo = 1
        end
        object ppRegCab: TppRegion
          UserName = 'RegCab'
          Pen.Color = clWhite
          Pen.Style = psClear
          mmHeight = 5556
          mmLeft = 1058
          mmTop = 6615
          mmWidth = 194205
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpOcorrPessLbl9: TppLabel
            UserName = 'Label9'
            AutoSize = False
            Caption = 'Estação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 2646
            mmTop = 7673
            mmWidth = 38894
            BandType = 3
            GroupNo = 1
          end
          object ppLabel2: TppLabel
            UserName = 'Label8'
            AutoSize = False
            Caption = 'Permitidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 150548
            mmTop = 7673
            mmWidth = 16404
            BandType = 3
            GroupNo = 1
          end
          object ppLabel4: TppLabel
            UserName = 'rpOcorrPessLbl101'
            AutoSize = False
            Caption = 'Realizados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 168275
            mmTop = 7673
            mmWidth = 16140
            BandType = 3
            GroupNo = 1
          end
          object rpOcorrPessLbl10: TppLabel
            UserName = 'rpOcorrPessLbl10'
            AutoSize = False
            Caption = 'Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 185738
            mmTop = 7673
            mmWidth = 8202
            BandType = 3
            GroupNo = 1
          end
          object ppLabel5: TppLabel
            UserName = 'Label11'
            AutoSize = False
            Caption = 'De'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3704
            mmLeft = 115623
            mmTop = 7673
            mmWidth = 17727
            BandType = 3
            GroupNo = 1
          end
          object ppLabel6: TppLabel
            UserName = 'Label12'
            AutoSize = False
            Caption = 'Até'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3704
            mmLeft = 136525
            mmTop = 7673
            mmWidth = 11377
            BandType = 3
            GroupNo = 1
          end
        end
      end
      object rpOcorrPessGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label10'
          Caption = 'Totais da Pessoa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 123031
          mmTop = 529
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
        object rpCalc2: TppDBCalc
          UserName = 'rpCalc2'
          DataField = 'PERMITIDOS'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOcorrPessGrp2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 4233
          mmLeft = 153459
          mmTop = 529
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object rpCalc3: TppDBCalc
          UserName = 'rpCalc3'
          DataField = 'REALIZADOS'
          DataPipeline = ppQuantAcessos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = rpOcorrPessGrp2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppQuantAcessos'
          mmHeight = 4233
          mmLeft = 169863
          mmTop = 529
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppQuantAcessos: TppBDEPipeline
    DataSource = dsQuantAcessos
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'QuantAcessos'
    Left = 210
    Top = 55
    object ppQuantAcessosppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppQuantAcessosppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppQuantAcessosppField3: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppQuantAcessosppField4: TppField
      FieldAlias = 'ENTRADA'
      FieldName = 'ENTRADA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppQuantAcessosppField5: TppField
      FieldAlias = 'SAIDA'
      FieldName = 'SAIDA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppQuantAcessosppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppQuantAcessosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERMITIDOS'
      FieldName = 'PERMITIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppQuantAcessosppField8: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppQuantAcessosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMEMPREGADO'
      FieldName = 'NUMEMPREGADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppQuantAcessosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'REALIZADOS'
      FieldName = 'REALIZADOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppQuantAcessosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object dsQuantAcessos: TwwDataSource
    DataSet = CdsQuantAcessos
    Left = 210
    Top = 103
  end
  object sqlQuantAcessos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  RPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS NOME,'
      '  RPAD('#39'1'#39',40,'#39'1'#39') AS CARGO,'
      '  RPAD('#39'1'#39',30,'#39'1'#39') AS ENTRADA,'
      '  RPAD('#39'1'#39',30,'#39'1'#39') AS SAIDA,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS DESCRICAO,'
      '  0 AS PERMITIDOS,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS EMPRESA,'
      '  0 AS NUMEMPREGADO,'
      '  0 AS REALIZADOS,'
      '  0 AS SALDO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsQuantAcessos
    Left = 210
    Top = 199
  end
  object CdsQuantAcessos: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ENTRADA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SAIDA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PERMITIDOS'
        DataType = ftFloat
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMEMPREGADO'
        DataType = ftFloat
      end
      item
        Name = 'REALIZADOS'
        DataType = ftFloat
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsAcessoPessoaIndex1'
        CaseInsFields = 'NOME'
        Fields = 'NOME;ENTRADA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsAcessoPessoaIndex1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsQuantAcessosAfterScroll
    Left = 210
    Top = 151
    Data = {
      310100009619E0BD01000000180000000B0000000000030000003101094D4154
      524943554C410100490000000100055749445448020002000D00044E4F4D4501
      00490000000100055749445448020002003C0005434152474F01004900000001
      0005574944544802000200280007454E54524144410100490000000100055749
      445448020002001E000553414944410100490000000100055749445448020002
      001E000944455343524943414F0100490000000100055749445448020002003C
      000A5045524D495449444F53080004000000000007454D505245534101004900
      00000100055749445448020002003C000C4E554D454D5052454741444F080004
      00000000000A5245414C495A41444F5308000400000000000553414C444F0800
      0400000000000100044C4349440400010000000000}
  end
  object sqlReal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0 AS REALIZADOS'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsReal
    Left = 114
    Top = 200
  end
  object CdsReal: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TITRELAT'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CENTROCUSTO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ENTRADA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SAIDA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 114
    Top = 152
  end
end
