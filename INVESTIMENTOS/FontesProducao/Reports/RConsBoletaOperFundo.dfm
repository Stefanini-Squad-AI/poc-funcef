inherited RelConsBoletaOperFundo: TRelConsBoletaOperFundo
  Height = 215
  Caption = 'RelConsBoletaOperFundo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
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
        Name = 'dtIni'
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
        Caption = 'Data Final'
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
        Name = 'dtFim'
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
        Caption = 'Tipo de Fundo'
        Controle = tcLookupCombo
        CampoBanco = 'IDTIPOFUNDOINVEST'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCTIPOFUNDOINV, IDTIPOFUNDOINVEST FROM '
          'TIPOFUNDOINVEST'
          'ORDER BY DESCTIPOFUNDOINV')
        LookupSettings.Chave = 'IDTIPOFUNDOINVEST'
        LookupSettings.Display = 'DESCTIPOFUNDOINV'
        LookupSettings.Descricao = 'Tipo de Fundo'
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
        Name = 'iTpFundo'
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
        Caption = 'Plano / Patrocinadora'
        Controle = tcLookupCombo
        CampoBanco = 'IDPLANPREVCTBPATR'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PLANPRVCONTABPATRO, IDPLANPREVCTBPATR'
          'FROM VWPLANPREVCTBPATR')
        LookupSettings.Chave = 'IDPLANPREVCTBPATR'
        LookupSettings.Display = 'PLANPRVCONTABPATRO'
        LookupSettings.Descricao = 'Plano / Patrocinadora'
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
        Name = 'iPlanoPatro'
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
        Caption = 'Fundo de Investimentos'
        Controle = tcLookupCombo
        CampoBanco = 'IDFUNDOINVEST'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCFUNDOINVEST, IDFUNDOINVEST FROM FUNDOINVEST'
          'ORDER BY DESCFUNDOINVEST')
        LookupSettings.Chave = 'IDFUNDOINVEST'
        LookupSettings.Display = 'DESCFUNDOINVEST'
        LookupSettings.Descricao = 'Fundo de Investimentos'
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
        Name = 'iFundoInvest'
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
    Formheight = 210
  end
  inherited CrmRptCM: TCmRptManager
    Report = rptBoletaFundo
    LabelEmpresa = lblEmpresa
    LabelSistema = LblSistema
  end
  object rptBoletaFundo: TppReport
    AutoStop = False
    DataPipeline = pplBoletaFundo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
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
    Left = 138
    Top = 120
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBoletaFundo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Boleta de Operação de Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 81534
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1323
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object pplblDataOperacao: TppLabel
        UserName = 'lblPrazo1'
        Caption = 'Data Operação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 15346
        mmWidth = 24342
        BandType = 0
      end
      object ppdbDataOperacao: TppDBText
        UserName = 'dbDataOperacao'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplBoletaFundo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 51329
        mmTop = 15346
        mmWidth = 17198
        BandType = 0
      end
      object pplblDataLiquidacao: TppLabel
        UserName = 'lblDataLiquidacao'
        Caption = 'Data Liquidação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 15346
        mmWidth = 26458
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2117
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197115
        BandType = 0
      end
      object pplblBoleta: TppLabel
        UserName = 'Label3'
        Caption = 'Boleta :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3683
        mmLeft = 25400
        mmTop = 21167
        mmWidth = 11684
        BandType = 0
      end
      object ppdbBoleta: TppDBText
        UserName = 'dbBoleta'
        DataField = 'IDBOLETA'
        DataPipeline = pplBoletaFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 38894
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object ppdbDtaLiq: TppDBText
        UserName = 'dbDataOperacao1'
        DataField = 'DATALIQUIDACAO'
        DataPipeline = pplBoletaFundo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 15346
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppbBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 41804
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Observação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 16933
        mmWidth = 16140
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197115
        BandType = 4
      end
      object pplblQuantidade: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 5821
        mmWidth = 15610
        BandType = 4
      end
      object pplblValor: TppLabel
        UserName = 'Label5'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 7144
        BandType = 4
      end
      object ppdbQuantidade: TppDBText
        UserName = 'dbQuantidade'
        DataField = 'QTDOPERACAO'
        DataPipeline = pplBoletaFundo
        DisplayFormat = '#,0.000000000;-#,0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 5821
        mmWidth = 38364
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLROPERACAO'
        DataPipeline = pplBoletaFundo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 1058
        mmWidth = 38364
        BandType = 4
      end
      object pplblPrazo: TppLabel
        UserName = 'Label6'
        Caption = 'Prazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 66940
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplBoletaFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 1058
        mmWidth = 34661
        BandType = 4
      end
      object pplblPuOperacao: TppLabel
        UserName = 'Label16'
        Caption = 'Cota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2117
        mmTop = 10583
        mmWidth = 6265
        BandType = 4
      end
      object ppdbPuOperacao: TppDBText
        UserName = 'dbPuOperacao'
        DataField = 'VLRCOTA'
        DataPipeline = pplBoletaFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 10583
        mmWidth = 38364
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = pplBoletaFundo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 19579
        mmLeft = 794
        mmTop = 20902
        mmWidth = 196586
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 529
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBPrazo: TppDBText
        UserName = 'ppDBPrazo'
        DataField = 'PRAZO'
        DataPipeline = pplBoletaFundo
        DisplayFormat = '###0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaFundo'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 6085
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable: TppSystemVariable
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
        mmTop = 1588
        mmWidth = 196850
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
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
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
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
        mmLeft = 794
        mmTop = 1323
        mmWidth = 196850
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'IDBOLETA'
      DataPipeline = pplBoletaFundo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBoletaFundo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 11906
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label1'
          Caption = 'Operação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 6615
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object pplblTitulo: TppLabel
          UserName = 'Label2'
          Caption = 'Título'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescOperacao: TppDBText
          UserName = 'dbDescOperacao'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = pplBoletaFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplBoletaFundo'
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 1852
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object ppdbDesInvestimento: TppDBText
          UserName = 'dbDesInvestimento'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplBoletaFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplBoletaFundo'
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 6615
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescEmissor: TppDBText
          UserName = 'dbDescEmissor'
          DataField = 'NOME'
          DataPipeline = pplBoletaFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplBoletaFundo'
          mmHeight = 3704
          mmLeft = 114036
          mmTop = 1852
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescCustodiante: TppDBText
          UserName = 'dbDescCustodiante'
          DataField = 'SGLCUSTODIANTE'
          DataPipeline = pplBoletaFundo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplBoletaFundo'
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 6615
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object pplblEmissor: TppLabel
          UserName = 'Label7'
          Caption = 'Gestor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 91811
          mmTop = 1852
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object pplblCustodiante: TppLabel
          UserName = 'Label8'
          Caption = 'Custodiante'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 92075
          mmTop = 6615
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlBoletaFundo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        'TF.DESCTIPOFUNDOINV, PL.PLANPRVCONTABPATRO, FI.DESCFUNDOINVEST, ' +
        'TP.DESCTIPOOPERACAO,'
      
        'OP.DATAOPERACAO, OP.DATALIQUIDACAO, OP.DATAVENCIMENTO, OP.VLROPE' +
        'RACAO, OP.QTDOPERACAO ,'
      'OP.VLRCOTA, OP.OBSERVACAO, OP.IDBOLETA, CT.SGLCUSTODIANTE,'
      '(OP.DATAVENCIMENTO-OP.DATAOPERACAO) AS PRAZO, PS.NOME'
      
        'FROM OPERACAOFUNDO OP, TIPOFUNDOINVEST TF, TIPOOPERACAO TP, CUST' +
        'ODIANTE CT, PESSOA PS,'
      ''
      
        '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS ' +
        'PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL '
      '    WHERE  (PA.IDPATRO = PE.IDPESSOA(+))'
      '       AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL, '
      ''
      
        '   (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST, ID' +
        'CUSTODIANTE, IDGESTORCARTEIRA'
      '    FROM HISTFUNDOINVEST '
      
        '    WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN '
      
        '               (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST '
      
        '                WHERE (DTAVIGENCIA < TO_DATE('#39'13/02/2007'#39','#39'DD/MM' +
        '/YYYY'#39')+1) '
      '                GROUP BY IDFUNDOINVEST))) FI  '
      'WHERE'
      '    OP.IDFUNDOINVEST      = FI.IDFUNDOINVEST'
      'AND OP.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR '
      'AND TF.IDTIPOINVEST       = OP.IDTIPOINVEST '
      'AND TF.IDTIPOFUNDOINVEST  = FI.IDTIPOFUNDOINVEST '
      'AND TP.IDTIPOINVEST       = OP.IDTIPOINVEST '
      'AND TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO '
      'AND CT.IDCUSTODIANTE      = FI.IDCUSTODIANTE'
      'AND PS.IDPESSOA           = FI.IDGESTORCARTEIRA'
      
        'ORDER BY TF.DESCTIPOFUNDOINV, OP.DATAOPERACAO, PL.PLANPRVCONTABP' +
        'ATRO, FI.DESCFUNDOINVEST '
      ' '
      ' ')
    ClientDataSet = cdsBoletaFundo
    Left = 32
    Top = 72
  end
  object cdsBoletaFundo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 137
    Top = 72
    Data = {
      EB0200009619E0BD01000000180000000F000100000003000000EE0110444553
      435449504F46554E444F494E5601004900000001000557494454480200020050
      0012504C414E505256434F4E544142504154524F010049000000010005574944
      54480200020071000F4445534346554E444F494E564553540100490000000100
      055749445448020002003C0010444553435449504F4F5045524143414F010049
      0000000100055749445448020002003C000C444154414F5045524143414F0800
      0800000000000E444154414C49515549444143414F08000800000000000E4441
      544156454E43494D454E544F08000800000000000B564C524F5045524143414F
      08000400000000000B5154444F5045524143414F080004000000000007564C52
      434F544108000400000000000A4F42534552564143414F04004B000000020007
      535542545950450200490005005465787400055749445448020002002C010849
      44424F4C4554410100490000000100055749445448020002001E000E53474C43
      5553544F4449414E54450100490000000100055749445448020002000A000550
      52415A4F0800040000000000044E4F4D45010049000000010005574944544802
      0002003C0002000D44454641554C545F4F524445520200820004000000010005
      0002000300044C434944040001000908000000000000002E46756E646F732064
      6520496E76657374696D656E746F20656D204469726569746F73204372656469
      74F372696F730D434F4D554D202D20434F4D554D22424D472046494443202D20
      4352454449544F5320434F4E5349474E41444F532056491041706C696361E7E3
      6F202D20464944430000085DB4C9CC420000085DB4C9CC420000F0254FD8CC42
      00000000389C7C413E096CCEA1A1924037DE1D19CB91D8402C00000054455354
      455320444520494D5052455353C34F2044412041504C494341C7C34F20504152
      412052454645522E07303031372F303707424F56455350410000000000B09640
      0E46554E4441C7C34F205245464552}
  end
  object dsBoletaFundo: TDataSource
    DataSet = cdsBoletaFundo
    Left = 240
    Top = 72
  end
  object pplBoletaFundo: TppBDEPipeline
    DataSource = dsBoletaFundo
    UserName = 'lBoletaFundo'
    Left = 32
    Top = 120
    object pplBoletaFundoppField1: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 0
    end
    object pplBoletaFundoppField2: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 1
    end
    object pplBoletaFundoppField3: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplBoletaFundoppField4: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplBoletaFundoppField5: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplBoletaFundoppField6: TppField
      FieldAlias = 'DATALIQUIDACAO'
      FieldName = 'DATALIQUIDACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplBoletaFundoppField7: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplBoletaFundoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplBoletaFundoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplBoletaFundoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplBoletaFundoppField11: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 300
      DataType = dtMemo
      DisplayWidth = 10
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplBoletaFundoppField12: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object pplBoletaFundoppField13: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplBoletaFundoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplBoletaFundoppField15: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
  end
end
