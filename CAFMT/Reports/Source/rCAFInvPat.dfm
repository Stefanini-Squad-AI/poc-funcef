inherited rptCAFInPat: TrptCAFInPat
  Left = 350
  Top = 297
  Height = 219
  Caption = 'Relação de Bens para Inventário Patrimonial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relação de Bens para Inventário Patrimonial'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Localização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, IDLOCALIZACAO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME'
          '')
        LookupSettings.Chave = 'IDLOCALIZACAO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '45'
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
        ComboBoxSettings.Items.Strings = (
          'SELECT NOME, IDLOCALIZACAO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME'
          '')
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
        Name = 'LOCALIZACAO'
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
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME'
          '')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Nome'
        LookupSettings.Tamanho = '60'
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
        ComboBoxSettings.Items.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME'
          '')
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
        Name = 'RESPONSAVEL'
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
        Caption = 'Classe'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE (ANASINT = '#39'A'#39')'
          'ORDER BY CODHIERARQ'
          '')
        LookupSettings.Chave = 'IDCLASSEBEM'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
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
        ComboBoxSettings.Items.Strings = (
          'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE (ANASINT = '#39'A'#39')'
          'ORDER BY CODHIERARQ'
          '')
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
        Name = 'CLASSE'
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
        Caption = 'Grupo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, CLASSE, IDGRUPO'
          'FROM GRUPO'
          'WHERE (TIPO = '#39'A'#39')'
          'ORDER BY CLASSE'
          '')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
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
        ComboBoxSettings.Items.Strings = (
          'SELECT NOME, CLASSE, IDGRUPO'
          'FROM GRUPO'
          'WHERE (TIPO = '#39'A'#39')'
          'ORDER BY CLASSE'
          '')
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
        Name = 'GRUPO'
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
        Caption = 'Conjunto'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCCONJUNTO, IDCONJUNTO'
          'FROM CONJUNTO'
          'ORDER BY DESCCONJUNTO'
          '')
        LookupSettings.Chave = 'IDCONJUNTO'
        LookupSettings.Display = 'DESCCONJUNTO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '200'
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
        ComboBoxSettings.Items.Strings = (
          'SELECT DESCCONJUNTO, IDCONJUNTO'
          'FROM CONJUNTO'
          'ORDER BY DESCCONJUNTO'
          '')
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
        Name = 'CONJUNTO'
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
        Caption = 'Controle'
        Controle = tcComboBox
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
        Name = 'CONTROLE'
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
        Caption = 'Ordenado Por'
        Controle = tcRadioGroup
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
        ComboBoxSettings.Items.Strings = (
          'Total'
          'Físico'
          '')
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
        Name = 'ORDENACAO'
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
    Report = rpInvPat
    LabelEmpresa = LblEmpresa
    LabelSistema = LBLSISTEMA
  end
  object ppInvPat: TppBDEPipeline
    DataSource = dsInvPat
    UserName = 'InvPat'
    Left = 248
    Top = 8
    object ppInvPatppField1: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppInvPatppField2: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppInvPatppField3: TppField
      FieldAlias = 'DESCCLASSE'
      FieldName = 'DESCCLASSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppInvPatppField4: TppField
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppInvPatppField5: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsInvPat: TwwDataSource
    DataSet = cdsInvPat
    Left = 120
    Top = 99
  end
  object rpInvPat: TppReport
    AutoStop = False
    DataPipeline = ppInvPat
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 200
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Inventário Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 77258
        mmTop = 8731
        mmWidth = 43921
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
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpInvPatDBText4: TppDBText
        UserName = 'rpInvPatDBText4'
        DataField = 'PLACA'
        DataPipeline = ppInvPat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object rpInvPatDBText5: TppDBText
        UserName = 'rpInvPatDBText5'
        DataField = 'DESBEM'
        DataPipeline = ppInvPat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 529
        mmWidth = 89165
        BandType = 4
      end
      object rpInvPatShape1: TppShape
        UserName = 'rpInvPatShape1'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatShape2: TppShape
        UserName = 'rpInvPatShape2'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatShape3: TppShape
        UserName = 'rpInvPatShape3'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 161925
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatLabel7: TppLabel
        UserName = 'rpInvPatLabel7'
        Caption = 'Ok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 529
        mmWidth = 3969
        BandType = 4
      end
      object rpInvPatLabel8: TppLabel
        UserName = 'rpInvPatLabel8'
        Caption = 'Não Encontrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object rpInvPatLabel9: TppLabel
        UserName = 'rpInvPatLabel9'
        Caption = 'Outro Setor _________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197379
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
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
        mmTop = 1588
        mmWidth = 71438
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 1588
        mmWidth = 52123
        BandType = 8
      end
    end
    object rpInvPatGroup1: TppGroup
      BreakName = 'DESCLOCAL'
      DataPipeline = ppInvPat
      NewPage = True
      ResetPageNo = True
      UserName = 'rpInvPatGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpInvPatGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'ppLine35'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel1: TppLabel
          UserName = 'rpInvPatLabel1'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel2: TppLabel
          UserName = 'rpInvPatLabel2'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 92340
          mmTop = 794
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatDBText1: TppDBText
          UserName = 'rpInvPatDBText1'
          DataField = 'DESCLOCAL'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatDBText2: TppDBText
          UserName = 'rpInvPatDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 114829
          mmTop = 794
          mmWidth = 82021
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel3: TppLabel
          UserName = 'rpInvPatLabel3'
          Caption = 'Nº Tombamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7144
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel4: TppLabel
          UserName = 'rpInvPatLabel4'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 7144
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel5: TppLabel
          UserName = 'rpInvPatLabel5'
          Caption = 'Situação do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 143404
          mmTop = 7408
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
      end
      object rpInvPatGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpInvPatGroup2: TppGroup
      BreakName = 'DESCCLASSE'
      DataPipeline = ppInvPat
      UserName = 'rpInvPatGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpInvPatGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpInvPatLabel6: TppLabel
          UserName = 'rpInvPatLabel6'
          Caption = 'Classe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object rpInvPatDBText3: TppDBText
          UserName = 'rpInvPatDBText3'
          DataField = 'DESCCLASSE'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 11642
          mmTop = 1058
          mmWidth = 185209
          BandType = 3
          GroupNo = 1
        end
      end
      object rpInvPatGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object cdsInvPat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 96
  end
  object sqlInvPat: TCMSqlParams
    SQL.Strings = (
      'SELECT L.NOME       AS DESCLOCAL,'
      '       PR.NOME      AS NOMERESP,'
      '       CB.DESCRICAO AS DESCCLASSE,'
      '       B.PLACA,'
      '       B.DESBEM'
      'FROM BEM         B,'
      '     CONJUNTO    C,'
      '     CLASSEDEBEM CB,'
      '     LOCALIZACAO L,'
      '     PESSOA      PR'
      'WHERE (B.IDPESSOA       = :PIDPESSOA)'
      ''
      ''
      ''
      ''
      ''
      ''
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'
      ''
      ''
      ' '
      '')
    ClientDataSet = cdsInvPat
    Left = 240
    Top = 96
  end
end
