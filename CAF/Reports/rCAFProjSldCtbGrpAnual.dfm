inherited rptCAFProjSldCtbGrpAnual: TrptCAFProjSldCtbGrpAnual
  Left = 452
  Top = 177
  Width = 322
  Height = 199
  Caption = 'Projeção do Saldo Contábil por Grupo - Anual'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Projeção de Saldo Contábil por Grupo - Anual '
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimentados até'
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
        Caption = 'No. Anos'
        Controle = tcSpinEdit
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
        TextDefault = '1'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 10
        SpinEditSettings.MinValue = 1
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 1
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
        Caption = 'Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'País'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS'
          'FROM CAFPAISES CP,'
          '     PAIS P'
          'WHERE CP.IDPESSOA = 1'
          '  AND CP.IDPAIS = P.IDPAIS'
          'ORDER BY P.NOMEPAIS')
        LookupSettings.Chave = 'IDCAFPAISES'
        LookupSettings.Display = 'NOMEPAIS'
        LookupSettings.Descricao = 'País'
        LookupSettings.Tamanho = '30'
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
        Caption = 'Grupo Contábil'
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
        LookupSettings.Tamanho = '40|8'
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
        Caption = 'Grupos Contábeis dos Bens'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Imobiliários'
          'Todos')
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 244
    FormWidth = 500
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpProjSldCtbGrpAnual
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
  end
  object sqlProjSldCtbGrpAnual: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE AS CLASSE9,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0) AS ANO,'
      '       (0.00) AS VALCUSTO,'
      '       (0.00) AS VALCMCUSTO,'
      '       (0.00) AS VALDEPREC,'
      '       (0.00) AS VALCMDEPREC,'
      '       (0.00) AS VALSALDO'
      'FROM GRUPO'
      'WHERE IDGRUPO IS NULL'
      'ORDER BY CLASSE9'
      '')
    ClientDataSet = cdsProjSldCtbGrpAnual
    Left = 232
    Top = 63
  end
  object cdsProjSldCtbGrpAnual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 49
  end
  object dsProjSldCtbGrpAnual: TwwDataSource
    DataSet = cdsProjSldCtbGrpAnual
    Left = 232
    Top = 35
  end
  object ppProjSldCtbGrpAnual: TppBDEPipeline
    DataSource = dsProjSldCtbGrpAnual
    UserName = 'ProjSldCtbGrpAnual'
    Left = 232
    Top = 21
  end
  object rpProjSldCtbGrpAnual: TppReport
    AutoStop = False
    DataPipeline = ppProjSldCtbGrpAnual
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2350
    PrinterSetup.mmMarginLeft = 2350
    PrinterSetup.mmMarginRight = 2350
    PrinterSetup.mmMarginTop = 2350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 8
    Version = '5.5'
    mmColumnWidth = 292427
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Projeção de Saldo Contábil por Grupo - Anual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 88900
        mmTop = 7144
        mmWidth = 114565
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
        mmLeft = 132027
        mmTop = 529
        mmWidth = 28310
        BandType = 0
      end
      object lblTipoGrupo: TppLabel
        UserName = 'lblTipoGrupo'
        AutoSize = False
        Caption = 'Depreciação Calculada até '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 118534
        mmTop = 13758
        mmWidth = 55033
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32014
        mmWidth = 292427
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 27517
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'C.M. Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 27517
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 27781
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 247725
        mmTop = 27517
        mmWidth = 18711
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Saldo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 270669
        mmTop = 27517
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 27517
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Grupo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 27517
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 27517
        mmWidth = 5556
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText26: TppDBText
        UserName = 'ppDBText504'
        BlankWhenZero = True
        DataField = 'VALCUSTO'
        DataPipeline = ppProjSldCtbGrpAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'VALCMCUSTO'
        DataPipeline = ppProjSldCtbGrpAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 192088
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText501'
        BlankWhenZero = True
        DataField = 'VALDEPREC'
        DataPipeline = ppProjSldCtbGrpAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 217223
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText503'
        BlankWhenZero = True
        DataField = 'VALCMDEPREC'
        DataPipeline = ppProjSldCtbGrpAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        BlankWhenZero = True
        DataField = 'VALSALDO'
        DataPipeline = ppProjSldCtbGrpAnual
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 267494
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'ANO'
        DataPipeline = ppProjSldCtbGrpAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3683
        mmLeft = 152665
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object rbdbeClasse: TppDBText
        UserName = 'rbdbeClasse'
        DataField = 'CLASSE'
        DataPipeline = ppProjSldCtbGrpAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCGRUPO'
        DataPipeline = ppProjSldCtbGrpAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 0
        mmWidth = 110596
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'S_A'
        DataPipeline = ppProjSldCtbGrpAnual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 292427
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
        mmHeight = 3440
        mmLeft = 0
        mmTop = 794
        mmWidth = 26458
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
        mmLeft = 126471
        mmTop = 794
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
        mmLeft = 266171
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
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
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 32
    Top = 56
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 72
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, A.ANO, G.NOME, PG.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG,'
      '     (SELECT (:ANOINI + (IDTIPOMOVIMENTACAO - 1)) ANO'
      '      FROM TIPOMOVIMENTACAO'
      '      WHERE IDTIPOMOVIMENTACAO <= :ANOS) A'
      'WHERE G.TIPO = '#39'S'#39
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE, A.ANO'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsGrpSinteticos
    Left = 120
    Top = 56
  end
  object cdsProjSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 112
  end
end
