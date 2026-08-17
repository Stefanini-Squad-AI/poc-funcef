inherited RptSolPrePronta: TRptSolPrePronta
  Width = 324
  Height = 151
  Caption = 'Solicitação de Compra Pré-Pronta'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Solicitação de Compra Pré-Pronta'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'Almoxarifado'
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
        Name = 'Almoxarifado'
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
        Caption = 'Utilizar Solicitações'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Não Imressas'
          'Já Impressas')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Solicitacoes'
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
        Caption = 'No. da Solicitação'
        Controle = tcMontaSelect
        CampoBanco = 'NUMSOLCOMPRA'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'NumSolicit'
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
        MontaSelect = MsSolPrepronta
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 180
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptSolPrePronta
    Left = 84
  end
  object bdeSolPrePronta: TppBDEPipeline
    DataSource = dsSolPrePronta
    UserName = 'bdeSolPrePronta'
    Left = 84
    Top = 64
  end
  object dsSolPrePronta: TwwDataSource
    DataSet = CdsSolPrePronta
    Left = 140
    Top = 64
  end
  object RptSolPrePronta: TppReport
    AutoStop = False
    DataPipeline = bdeSolPrePronta
    OnPrintingComplete = RptSolPreProntaPrintingComplete
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
    DeviceType = 'Screen'
    Left = 24
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31221
      mmPrintPosition = 0
      object RptSolPreProntaLine3: TppLine
        UserName = 'RptSolPreProntaLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21696
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'Solicitação Pré-Pronta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 114565
        mmTop = 8731
        mmWidth = 54769
        BandType = 0
      end
      object LblEmpresa: TppLabel
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
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptSolPreProntaLine1: TppLine
        UserName = 'RptSolPreProntaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30692
        mmWidth = 284300
        BandType = 0
      end
      object RptSolPreProntaLabel2: TppLabel
        UserName = 'RptSolPreProntaLabel2'
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 26194
        mmWidth = 8996
        BandType = 0
      end
      object RptSolPreProntaLine4: TppLine
        UserName = 'RptSolPreProntaLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 88900
        mmTop = 21696
        mmWidth = 5027
        BandType = 0
      end
      object RptSolPreProntaLabel4: TppLabel
        UserName = 'RptSolPreProntaLabel4'
        AutoSize = False
        Caption = 'Última Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 19315
        mmWidth = 25665
        BandType = 0
      end
      object RptSolPreProntaLine5: TppLine
        UserName = 'RptSolPreProntaLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 188384
        mmTop = 21696
        mmWidth = 5027
        BandType = 0
      end
      object RptSolPreProntaLabel5: TppLabel
        UserName = 'RptSolPreProntaLabel5'
        AutoSize = False
        Caption = 'Quantidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 203994
        mmTop = 19315
        mmWidth = 22490
        BandType = 0
      end
      object RptSolPreProntaLabel6: TppLabel
        UserName = 'RptSolPreProntaLabel6'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 91281
        mmTop = 26194
        mmWidth = 16933
        BandType = 0
      end
      object RptSolPreProntaLabel7: TppLabel
        UserName = 'RptSolPreProntaLabel7'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 26194
        mmWidth = 6085
        BandType = 0
      end
      object RptSolPreProntaLabel8: TppLabel
        UserName = 'RptSolPreProntaLabel8'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 26194
        mmWidth = 7673
        BandType = 0
      end
      object RptSolPreProntaLabel1: TppLabel
        UserName = 'RptSolPreProntaLabel1'
        Caption = 'em estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 26194
        mmWidth = 17727
        BandType = 0
      end
      object RptSolPreProntaLabel9: TppLabel
        UserName = 'RptSolPreProntaLabel9'
        Caption = 'a comprar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 227807
        mmTop = 26194
        mmWidth = 14817
        BandType = 0
      end
      object RptSolPreProntaLabel10: TppLabel
        UserName = 'RptSolPreProntaLabel10'
        Caption = 'solicitada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 208757
        mmTop = 26194
        mmWidth = 13758
        BandType = 0
      end
      object RptSolPreProntaLine6: TppLine
        UserName = 'RptSolPreProntaLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 244211
        mmTop = 21696
        mmWidth = 5027
        BandType = 0
      end
      object RptSolPreProntaLabel11: TppLabel
        UserName = 'RptSolPreProntaLabel11'
        AutoSize = False
        Caption = 'Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 248709
        mmTop = 19315
        mmWidth = 23283
        BandType = 0
      end
      object RptSolPreProntaLabel12: TppLabel
        UserName = 'RptSolPreProntaLabel12'
        Caption = 'Preços'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 26194
        mmWidth = 10319
        BandType = 0
      end
      object RptSolPreProntaDBText11: TppDBText
        UserName = 'RptSolPreProntaDBText11'
        AutoSize = True
        DataField = 'NUMSOLCOMPRA'
        DataPipeline = bdeSolPrePronta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 16933
        mmTop = 16669
        mmWidth = 30692
        BandType = 0
      end
      object RptSolPreProntaLabel13: TppLabel
        UserName = 'RptSolPreProntaLabel13'
        Caption = 'Solicitação Nº :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 16669
        mmWidth = 25665
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
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
        mmLeft = 529
        mmTop = 529
        mmWidth = 34925
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 129117
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptSolPreProntaGroup1: TppGroup
      BreakName = 'NUMSOLCOMPRA'
      DataPipeline = bdeSolPrePronta
      NewPage = True
      UserName = 'RptSolPreProntaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptSolPreProntaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptSolPreProntaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptSolPreProntaGroup2: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdeSolPrePronta
      UserName = 'RptSolPreProntaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptSolPreProntaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptSolPreProntaDBText1: TppDBText
          UserName = 'RptSolPreProntaDBText1'
          AutoSize = True
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 529
          mmTop = 1058
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
        object RptSolPreProntaLabel3: TppLabel
          UserName = 'RptSolPreProntaLabel3'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 17198
          mmTop = 1058
          mmWidth = 1058
          BandType = 3
          GroupNo = 1
        end
        object RptSolPreProntaDBText2: TppDBText
          UserName = 'RptSolPreProntaDBText2'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 19315
          mmTop = 1058
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object RptSolPreProntaLine2: TppLine
          UserName = 'RptSolPreProntaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object RptSolPreProntaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptSolPreProntaGroup3: TppGroup
      BreakName = 'CODARTIGO'
      DataPipeline = bdeSolPrePronta
      UserName = 'RptSolPreProntaGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptSolPreProntaGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptSolPreProntaGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptSolPreProntaDBText3: TppDBText
          UserName = 'RptSolPreProntaDBText3'
          DataField = 'CODARTIGO'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText4: TppDBText
          UserName = 'RptSolPreProntaDBText4'
          DataField = 'DESCRICAO'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 24077
          mmTop = 265
          mmWidth = 63236
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText5: TppDBText
          UserName = 'RptSolPreProntaDBText5'
          DataField = 'NOME'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 92340
          mmTop = 265
          mmWidth = 58738
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText7: TppDBText
          UserName = 'RptSolPreProntaDBText7'
          DataField = 'DATAULT'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153194
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText6: TppDBText
          UserName = 'RptSolPreProntaDBText6'
          DataField = 'VLRUNITARIO'
          DataPipeline = bdeSolPrePronta
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 170657
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText8: TppDBText
          UserName = 'RptSolPreProntaDBText8'
          DataField = 'SALDOQTDE'
          DataPipeline = bdeSolPrePronta
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 189707
          mmTop = 265
          mmWidth = 13494
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText12: TppDBText
          UserName = 'RptSolPreProntaDBText12'
          DataField = 'UNIDSALDO'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 203465
          mmTop = 265
          mmWidth = 4498
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText9: TppDBText
          UserName = 'RptSolPreProntaDBText9'
          DataField = 'QTDEPEDIDA'
          DataPipeline = bdeSolPrePronta
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 209021
          mmTop = 265
          mmWidth = 13494
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaDBText10: TppDBText
          UserName = 'RptSolPreProntaDBText10'
          DataField = 'CODMEDIDA'
          DataPipeline = bdeSolPrePronta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 223309
          mmTop = 265
          mmWidth = 4233
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaLine7: TppLine
          UserName = 'RptSolPreProntaLine7'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 228600
          mmTop = 0
          mmWidth = 15610
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaLine8: TppLine
          UserName = 'RptSolPreProntaLine8'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 246063
          mmTop = 0
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
        object RptSolPreProntaLine9: TppLine
          UserName = 'RptSolPreProntaLine9'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 261409
          mmTop = 0
          mmWidth = 13229
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object SqlSolPrePronta: TCMSqlParams
    ClientDataSet = CdsSolPrePronta
    Left = 196
    Top = 8
  end
  object CdsSolPrePronta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 64
  end
  object MsSolPrepronta: TMontaSelect
    Tag = 2
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SOLICOMP.NUMSOLCOMPRA'
      'SOLICOMP.DATAENTREGA')
    TipodeDado.Strings = (
      'N'
      'D')
    Descricao.Strings = (
      'Num. Solicitação'
      'Data Entrega')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SOLICOMP')
    CamposChave.Strings = (
      'SOLICOMP.NUMSOLCOMPRA'
      'SOLICOMP.NUMSOLCOMPRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 260
    Top = 64
  end
end
