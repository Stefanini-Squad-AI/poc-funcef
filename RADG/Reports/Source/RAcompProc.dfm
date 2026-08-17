inherited rptAcompProc: TrptAcompProc
  Left = 306
  Top = 282
  Width = 368
  Height = 260
  Caption = 'Acompanhamento de Processos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Acompanhamento de Processos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Tipo de Processo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPOPROCESSO, NOME '
          'FROM RADTIPOPROCESSO ORDER BY NOME')
        LookupSettings.Chave = 'IDTIPOPROCESSO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Processo'
        LookupSettings.Tamanho = '10'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Nº do Processo'
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
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Só pendentes'
          'em atraso')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
    Formheight = 180
    Left = 152
    Top = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 16
    Top = 12
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptAcompProc
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
    Left = 88
    Top = 12
  end
  object sqlAcompProc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IP.IDPROCESSO,'
      '     TP.NOME AS NOMEPROC,'
      '     IP.DATAINIPROCESSO,'
      '     IP.DATAFIMPREV AS DATAFIMPREVPROC,'
      '     IP.DATAFIMPROCESSO,'
      '  IP.OBS AS OBSPROC, '
      '     IE.IDETAPA, '
      '     IE.DATAFIMETAPA,'
      '     IE.DATAINIETAPA,'
      '     IE.DATAFIMPREV AS DATAFIMPREVETAPA,'
      '     TE.NOME AS NOMETAPA,'
      '     AUT.DATAAUTORIZACAO,'
      '     AUT.OBSAUTORIZA,'
      '     USU.NOMEUSUARIO,'
      
        '     DECODE(AUT.FLGSTATUS,'#39'R'#39','#39'RECUSADO'#39', DECODE(AUT.FLGSTATUS,'#39 +
        'S'#39','#39'AUTORIZADO'#39','#39'EXECUTADO'#39')) AS STATUS,'
      '    P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      RADINSTETAPA IE,'
      '      RADINSTPROCESSO IP,'
      '      RADAUTORIZACAO AUT,'
      '      RADTIPOETAPA TE,'
      '      RADTIPOPROCESSO TP,'
      '      USUARIOSISTEMA USU      '
      'WHERE'
      '            (IE.IDPROCESSO     = IP.IDPROCESSO)'
      '   AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA) '
      '   AND (IP.IDPESSRESP     = P.IDPESSOA(+))'
      '   AND (TP.IDTIPOPROCESSO = IP.IDTIPOPROCESSO) '
      '   AND (AUT.IDPROCESSO    = IP.IDPROCESSO)'
      '   AND (AUT.IDUSUARIO     = USU.IDUSUARIO)'
      '   AND (AUT.IDETAPA       = IE.IDETAPA)'
      'ORDER BY  NOMEPROC,DATAFIMETAPA, DATAFIMPREVETAPA'
      '')
    ClientDataSet = cdsAcompProc
    Left = 32
    Top = 80
  end
  object RptAcompProc: TppReport
    AutoStop = False
    DataPipeline = bdeAcompProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 309
    Top = 82
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Acompanhamento dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107950
        mmTop = 8731
        mmWidth = 68263
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 18521
        mmWidth = 284300
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
        mmLeft = 127794
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object RptAcompProcLine1: TppLine
        UserName = 'RptAcompProcLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object RptAcompProcLabel1: TppLabel
        UserName = 'RptAcompProcLabel1'
        Caption = 'Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 14023
        mmWidth = 15610
        BandType = 0
      end
      object LbProc: TppLabel
        UserName = 'LbProc'
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16669
        mmTop = 14023
        mmWidth = 10054
        BandType = 0
      end
      object RptAcompProcLabel2: TppLabel
        UserName = 'RptAcompProcLabel2'
        Caption = 'Tipo Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object RptAcompProcLine2: TppLine
        UserName = 'RptAcompProcLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 219340
        mmTop = 18521
        mmWidth = 2646
        BandType = 0
      end
      object RptAcompProcLabel5: TppLabel
        UserName = 'RptAcompProcLabel5'
        Caption = '  Data  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3969
        mmLeft = 241830
        mmTop = 15610
        mmWidth = 10054
        BandType = 0
      end
      object RptAcompProcLabel6: TppLabel
        UserName = 'RptAcompProcLabel6'
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 20373
        mmWidth = 8467
        BandType = 0
      end
      object RptAcompProcLabel7: TppLabel
        UserName = 'RptAcompProcLabel7'
        Caption = 'Fim Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 20373
        mmWidth = 18256
        BandType = 0
      end
      object RptAcompProcLabel8: TppLabel
        UserName = 'RptAcompProcLabel8'
        Caption = 'Fim Efetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object RptAcompProcLabel11: TppLabel
        UserName = 'RptAcompProcLabel11'
        Caption = 'Usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 20373
        mmWidth = 11113
        BandType = 0
      end
      object RptAcompProcLabel13: TppLabel
        UserName = 'RptAcompProcLabel13'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 20373
        mmWidth = 9260
        BandType = 0
      end
      object RptAcompProcLabel14: TppLabel
        UserName = 'RptAcompProcLabel14'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object RptAcompProcDBText3: TppDBText
        UserName = 'RptAcompProcDBText3'
        DataField = 'NOMETAPA'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptAcompProcDBText4: TppDBText
        UserName = 'RptAcompProcDBText4'
        DataField = 'DATAINIETAPA'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 222515
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText5: TppDBText
        UserName = 'RptAcompProcDBText5'
        DataField = 'DATAFIMPREVETAPA'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText6: TppDBText
        UserName = 'RptAcompProcDBText6'
        DataField = 'DATAFIMETAPA'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText10: TppDBText
        UserName = 'RptAcompProcDBText10'
        DataField = 'NOMEUSUARIO'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 265
        mmWidth = 31750
        BandType = 4
      end
      object RptAcompProcDBText11: TppDBText
        UserName = 'RptAcompProcDBText11'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128323
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object RptAcompProcDBMemo2: TppDBMemo
        UserName = 'RptAcompProcDBMemo2'
        CharWrap = True
        DataField = 'OBSAUTORIZA'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 22754
        mmLeft = 145786
        mmTop = 265
        mmWidth = 74877
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 529
        mmWidth = 23813
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 529
        mmWidth = 53181
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptAcompProcGroup1: TppGroup
      BreakName = 'IDPROCESSO'
      DataPipeline = bdeAcompProc
      NewPage = True
      UserName = 'RptAcompProcGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptAcompProcGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 34131
        mmPrintPosition = 0
        object RptAcompProcLabel3: TppLabel
          UserName = 'RptAcompProcLabel3'
          Caption = 'Processo Nº :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 265
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel4: TppLabel
          UserName = 'RptAcompProcLabel4'
          Caption = 'Processo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText1: TppDBText
          UserName = 'RptAcompProcDBText1'
          DataField = 'IDPROCESSO'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20373
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText2: TppDBText
          UserName = 'RptAcompProcDBText2'
          DataField = 'NOMEPROC'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 53446
          mmTop = 265
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBMemo1: TppDBMemo
          UserName = 'RptAcompProcDBMemo1'
          CharWrap = True
          DataField = 'OBSPROC'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 27252
          mmLeft = 150284
          mmTop = 1058
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object RptAcompProcLabel9: TppLabel
          UserName = 'RptAcompProcLabel9'
          Caption = 'Data Início :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 7144
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel10: TppLabel
          UserName = 'RptAcompProcLabel10'
          Caption = 'Data Fim Previsto :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39158
          mmTop = 7144
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel12: TppLabel
          UserName = 'RptAcompProcLabel12'
          Caption = 'Data Fim Efetivo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 7144
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText7: TppDBText
          UserName = 'RptAcompProcDBText7'
          DataField = 'DATAINIPROCESSO'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText8: TppDBText
          UserName = 'RptAcompProcDBText8'
          DataField = 'DATAFIMPREVPROC'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText9: TppDBText
          UserName = 'RptAcompProcDBText9'
          DataField = 'DATAFIMPROCESSO'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel16: TppLabel
          UserName = 'RptAcompProcLabel16'
          Caption = 'Pessoa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5027
          mmTop = 12171
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText12: TppDBText
          UserName = 'RptAcompProcDBText12'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 12171
          mmWidth = 113771
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel15: TppLabel
          UserName = 'RptAcompProcLabel15'
          Caption = 'Andamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 29633
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLine3: TppLine
          UserName = 'RptAcompProcLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 33867
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptAcompProcGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
      end
    end
    object RptAcompProcGroup2: TppGroup
      BreakName = 'IDETAPA'
      DataPipeline = bdeAcompProc
      UserName = 'RptAcompProcGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptAcompProcGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptAcompProcGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsAcompProc: TwwDataSource
    DataSet = cdsAcompProc
    Left = 181
    Top = 77
  end
  object bdeAcompProc: TppBDEPipeline
    DataSource = dsAcompProc
    UserName = 'bdeAcompProc'
    Left = 253
    Top = 84
  end
  object cdsAcompProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 78
  end
  object sqlProcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOPROCESSO, NOME'
      'FROM RADTIPOPROCESSO '
      'WHERE (IDTIPOPROCESSO = :IDTIPOPROCESSO)')
    ClientDataSet = cdsProcesso
    Left = 200
    Top = 160
  end
  object cdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 158
  end
end
