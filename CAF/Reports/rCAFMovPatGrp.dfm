inherited rptCAFMovPatGrp: TrptCAFMovPatGrp
  Left = 336
  Top = 255
  Width = 396
  Height = 220
  Caption = 'Movimento Patrimonial por Grupo Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimento Patrimonial por Grupo Contábil'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
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
        Required = True
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
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
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
        Required = True
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
        Caption = 'Grupo Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
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
        Caption = 'Grupo Final'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
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
    Formheight = 172
    Left = 28
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMovPatGrp
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
    Left = 91
  end
  object sqlMovPatGrp: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0.00) AS SLDANT,'
      '       (0.00) AS DEBITOS,'
      '       (0.00) AS CREDITOS,'
      '       (0.00) AS SLDATU'
      'FROM GRUPO'
      'WHERE IDGRUPO IS NULL'
      'ORDER BY CLASSE'
      '')
    ClientDataSet = cdsMovPatGrp
    Left = 242
    Top = 57
  end
  object cdsMovPatGrp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 44
  end
  object dsMovPatGrp: TwwDataSource
    DataSet = cdsMovPatGrp
    Left = 241
    Top = 32
  end
  object ppMovPatGrp: TppBDEPipeline
    DataSource = dsMovPatGrp
    UserName = 'MovPatGrp'
    Left = 241
    Top = 20
  end
  object rpMovPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppMovPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 242
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Movimento Patrimonial por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56356
        mmTop = 7673
        mmWidth = 84402
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 27517
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 27517
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 27517
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 27517
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Débitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 27517
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Créditos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 27517
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object pplbldata1: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rbLabel80: TppLabel
        UserName = 'rbLabel80'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197379
        BandType = 0
      end
      object rbLabel82: TppLabel
        UserName = 'rbLabel82'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLabel1: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'à'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpDBText1: TppDBText
        OnPrint = rpDBText1Print
        UserName = 'rpDBText1'
        DataField = 'CLASSE'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rpDBText2: TppDBText
        UserName = 'rpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object rpDBText4: TppDBText
        UserName = 'rpDBText4'
        BlankWhenZero = True
        DataField = 'SLDANT'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rpDBText5: TppDBText
        UserName = 'rpDBText5'
        BlankWhenZero = True
        DataField = 'DEBITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 121179
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpDBText6: TppDBText
        UserName = 'rpDBText05'
        BlankWhenZero = True
        DataField = 'CREDITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpDBText7: TppDBText
        UserName = 'rpDBText7'
        BlankWhenZero = True
        DataField = 'SLDATU'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpDBText3: TppDBText
        UserName = 'rpDBText3'
        DataField = 'S_A'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 87577
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 144
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.IDGRUPO, G.NOME AS DESCGRUPO, G.TIPO,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEP' +
        'LANC,0) - NVL(SB.CMDEP,0)+'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2) AS SLDANT,'
      '       ROUND(SUM(NVL(BEMATU.VALBEMATU,0) +'
      '                 NVL(ACRESATU.VALACRESATU,0) +'
      '                 NVL(CMBEMATU.VALCMBEMATU,0) +'
      '                 NVL(CMACRESATU.VALCMACRESATU,0) +'
      '                 NVL(BXDEPBEMATU.BXVALDEPBEMATU,0) +'
      '                 NVL(BXDEPACRESATU.BXVALDEPACRESATU,0) +'
      '                 NVL(BXCMDEPBEMATU.BXVALCMDEPBEMATU,0) +'
      '                 NVL(BXCMDEPACRESATU.BXVALCMDEPACRESATU,0) +'
      '                 NVL(REAVPOSATU.VALREAVPOSATU,0) +'
      '                 NVL(CMREAVPOSATU.VALCMREAVPOSATU,0) +'
      '                 NVL(DEPREAVNEGATU.VALDEPREAVNEGATU,0) +'
      '                 NVL(CMDEPREAVNEGATU.VALCMDEPREAVNEGATU,0) +'
      '                 NVL(BXREAVNEGATU.BXVALREAVNEGATU,0) +'
      '                 NVL(BXCMREAVNEGATU.BXVALCMREAVNEGATU,0) +'
      '                 NVL(BXDEPREAVPOSATU.BXVALDEPREAVPOSATU,0) +'
      
        '                 NVL(BXCMDEPREAVPOSATU.BXVALCMDEPREAVPOSATU,0)),' +
        '2) AS DEBITOS,'
      '       ROUND(SUM(NVL(BXBEMATU.BXVALBEMATU,0) +'
      '                 NVL(BXACRESATU.BXVALACRESATU,0) +'
      '                 NVL(BXCMBEMATU.BXVALCMBEMATU,0) +'
      '                 NVL(BXCMACRESATU.BXVALCMACRESATU,0) +'
      '                 NVL(DEPBEMATU.VALDEPBEMATU,0) +'
      '                 NVL(DEPACRESATU.VALDEPACRESATU,0) +'
      '                 NVL(CMDEPBEMATU.VALCMDEPBEMATU,0) +'
      '                 NVL(CMDEPACRESATU.VALCMDEPACRESATU,0) +'
      '                 NVL(REAVNEGATU.VALREAVNEGATU,0) +'
      '                 NVL(CMREAVNEGATU.VALCMREAVNEGATU,0) +'
      '                 NVL(DEPREAVPOSATU.VALDEPREAVPOSATU,0) +'
      '                 NVL(CMDEPREAVPOSATU.VALCMDEPREAVPOSATU,0) +'
      '                 NVL(BXREAVPOSATU.BXVALREAVPOSATU,0) +'
      '                 NVL(BXCMREAVPOSATU.BXVALCMREAVPOSATU,0) +'
      '                 NVL(BXDEPREAVNEGATU.BXVALDEPREAVNEGATU,0) +'
      
        '                 NVL(BXCMDEPREAVNEGATU.BXVALCMDEPREAVNEGATU,0)),' +
        '2) AS CREDITOS'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      
        '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :DATAMOVINI)'
      '              AND (MOECODIGO = :MOECODIGO)'
      '              AND (IDPESSOA = :IDPESSOA)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB1.IDPESSOA = :IDPESSOA)'
      '        AND (SCB1.MOECODIGO = :MOECODIGO)'
      '        AND (SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP)'
      '        AND (SCB1.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB1.IDBEM = DTAMAX.IDBEM)'
      '        AND (SCB1.IDBEM = SCD1.IDBEM)'
      '        AND (SCB1.IDPESSOA = SCD1.IDPESSOA)'
      '        AND (SCB1.MOECODIGO = SCD1.MOECODIGO)'
      '        AND (SCB1.DATASLDBEM = SCD1.DATASLDBEM) ) SB,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) ACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) DEPBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) DEPACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMDEPBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMDEPACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXDEPBEMATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXDEPREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXDEPREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXDEPACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMDEPBEMATU,'
      ''
      
        '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPREAVPOSAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMDEPREAVPOSATU,'
      ''
      
        '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPREAVNEGAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMDEPREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALCMDEPACRESATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXCMDEPACRESATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) REAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) REAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) DEPREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) DEPREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMDEPREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMDEPREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS VALCMDEPREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) CMDEPREAVNEGATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALREAVPOSATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR > 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXREAVPOSATU,'
      ''
      '   (SELECT HM.IDBEM, SUM(NVL(VM.VALOR,0)) AS BXVALREAVNEGATU'
      '    FROM   HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      
        '      AND  ((HM.DATAMOVIMENTACAO >= :DATAMOVINI) AND (HM.DATAMOV' +
        'IMENTACAO <= :DATAMOVFIM))'
      '      AND  (VM.VALOR < 0)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (VM.MOECODIGO = :MOECODIGO)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDBEM) BXREAVNEGATU'
      ''
      'WHERE (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.DATAINICIODEP <= :DATAMOVFIM)'
      ''
      ''
      '  AND (B.IDGRUPO  = G.IDGRUPO)'
      '  AND (B.IDBEM    = SB.IDBEM)'
      '  AND (B.IDPESSOA = SB.IDPESSOA)'
      '  AND (B.IDBEM = BEMATU.IDBEM(+))'
      '  AND (B.IDBEM = REAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = REAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = ACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVPOSATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVNEGATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESATU.IDBEM(+))'
      ''
      'GROUP BY G.CLASSE, G.IDGRUPO, G.NOME, G.TIPO'
      '')
    ClientDataSet = cdsGrpAnaliticos
    Left = 48
    Top = 128
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 144
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE G.TIPO = '#39'S'#39
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      '')
    ClientDataSet = cdsGrpSinteticos
    Left = 144
    Top = 128
  end
  object cdsMovPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 23
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 72
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 40
    Top = 56
  end
  object sqlMovPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO AS S_A,'
      '       (0.00) AS SLDANT,'
      '       (0.00) AS DEBITOS,'
      '       (0.00) AS CREDITOS,'
      '       (0.00) AS SLDATU'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      '')
    ClientDataSet = cdsMovPatAux
    Left = 328
    Top = 8
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 72
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '')
    ClientDataSet = cdsVerUltFec
    Left = 136
    Top = 56
  end
  object cdsGrupoAnalit: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 144
  end
  object sqlGrupoAnalit: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, SB.IDPESSOA,'
      '       SUM(SB.SLDANT) AS SLDANT,'
      ''
      'FROM (SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA,'
      
        '             ROUND(SUM(NVL(SB1.VALORG,0)  + NVL(SB1.REAVVALORG,0' +
        ')  + NVL(SB1.ULTREAVVALORG,0) +'
      
        '                       NVL(SB1.CMBEM,0)   + NVL(SB1.REAVCMBEM,0)' +
        '   + NVL(SB1.ULTREAVCMBEM,0) +'
      
        '                       NVL(SD1.DEPLANC,0) + NVL(SD1.REAVDEPLANC,' +
        '0) + NVL(SD1.ULTREAVDEPLANC,0) +'
      
        '                       NVL(SD1.CMDEP,0)   + NVL(SD1.REAVCMDEP,0)' +
        '   + NVL(SD1.ULTREAVCMDEP,0)) ,2) AS SLDANT,'
      '             (0) AS DEBITOS,'
      '             (0) AS CREDITOS'
      '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATAMOVFIM'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM, IDPESSOA) MAX1,'
      '           BEM B1, GRUPO G1'
      '      WHERE B1.DATAINICIODEP <= :DATAMOVFIM'
      ''
      ''
      ''
      ''
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      '        AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = MAX1.IDBEM'
      '        AND SB1.IDPESSOA = MAX1.IDPESSOA'
      '        AND SB1.DATASLDBEM = MAX1.DATA'
      '        AND SB1.IDBEM = SD1.IDBEM'
      '        AND SB1.IDPESSOA = SD1.IDPESSOA'
      '        AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '        AND SB1.MOECODIGO = SD1.MOECODIGO'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDPESSOA UNION'
      ''
      '      SELECT /*+ RULE */ SB2.IDGRUPO, SB2.IDPESSOA,'
      '             (0) AS SLDANT,'
      
        '             ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     17,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     43,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     35,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     51,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     18,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     33,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     47,NVL(VM2.' +
        'VALOR,0),0)),2) AS DEBITOS,'
      '             (0) AS CREDITOS'
      '      FROM HISTORICOMOVIMENTACAO HM2,'
      '           VLRHISTMOVBEM VM2,'
      '           GRUPO G2,'
      '           SALDOCONTABBEM SB2,'
      '           BEM B2'
      '      WHERE B2.DATAINICIODEP <= :DATAMOVFIM'
      ''
      ''
      ''
      ''
      
        '        AND HM2.DATAMOVIMENTACAO >= :DATAMOVINI AND HM2.DATAMOVI' +
        'MENTACAO <= :DATAMOVFIM'
      
        '        AND SB2.DATASLDBEM >= :DATAMOVINI AND SB2.DATASLDBEM <= ' +
        ':DATAMOVFIM'
      '        AND SB2.MOECODIGO = :MOECODIGO'
      '        AND SB2.IDPESSOA = :IDPESSOA'
      '        AND HM2.IDPESSOA = :IDPESSOA'
      '        AND B2.IDPESSOA = :IDPESSOA'
      '        AND VM2.MOECODIGO = :MOECODIGO'
      '        AND VM2.IDTAXADEP = :IDTAXADEP'
      '        AND HM2.IDBEM = SB2.IDBEM'
      '        AND HM2.IDPESSOA = SB2.IDPESSOA'
      '        AND HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM'
      '        AND SB2.IDBEM = B2.IDBEM'
      '        AND SB2.IDPESSOA = B2.IDPESSOA'
      '        AND G2.IDGRUPO = SB2.IDGRUPO'
      '        AND HM2.IDPESSOA = B2.IDPESSOA'
      '        AND HM2.IDBEM = B2.IDBEM'
      '        AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      '      GROUP BY SB2.IDGRUPO, SB2.IDPESSOA) SB'
      ''
      'GROUP BY SB.IDGRUPO, SB.IDPESSOA'
      'ORDER BY SB.IDGRUPO, SB.IDPESSOA'
      '')
    ClientDataSet = cdsGrupoAnalit
    Left = 256
    Top = 128
  end
end
