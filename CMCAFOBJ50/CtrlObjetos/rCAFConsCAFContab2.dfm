inherited RptCAFConsCAFContab2: TRptCAFConsCAFContab2
  Left = 375
  Top = 124
  Width = 326
  Height = 189
  Caption = 'Conciliação entre Ativo Fixo e Contabilidade II'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conciliação entre Ativo Fixo e Contabilidade II'
    DataBaseName = 'Basedados'
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
        Caption = 'Opção'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Planilhas não mais associadas ao Ativo Fixo'
          'Planilhas modificadas pela Contabilidade')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
    Formheight = 190
    FormWidth = 520
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConsCAFContab2
    LabelEmpresa = ppLabel36
    LabelSistema = ppLabel37
  end
  object cdsConsCAFContab2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 48
  end
  object dsConsCAFContab2: TwwDataSource
    DataSet = cdsConsCAFContab2
    Left = 232
    Top = 34
  end
  object ppConsCAFContab2: TppBDEPipeline
    DataSource = dsConsCAFContab2
    UserName = 'ConsCAFContab2'
    Left = 231
    Top = 21
  end
  object rpConsCAFContab2: TppReport
    AutoStop = False
    DataPipeline = ppConsCAFContab2
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        AutoSize = False
        Caption = 'Conciliação entre Ativo Fixo e Contabilidade II'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 8467
        mmWidth = 115359
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26723
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label5'
        Caption = 'Data Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 27517
        mmWidth = 22225
        BandType = 0
      end
      object lblLanc: TppLabel
        UserName = 'lblLanc'
        AutoSize = False
        Caption = 'No.Lançamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 27252
        mmWidth = 28575
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32014
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label4'
        Caption = 'Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 91546
        mmTop = 27517
        mmWidth = 13758
        BandType = 0
      end
      object LbPer13: TppLabel
        UserName = 'LbPer13'
        Caption = 'De 01/01/1999 a 01/01/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 20638
        mmWidth = 45773
        BandType = 0
      end
      object lblSubTitulo: TppLabel
        UserName = 'lblSubTitulo'
        AutoSize = False
        Caption = 'Planilhas não mais associadas ao Ativo Fixo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 61119
        mmTop = 15346
        mmWidth = 75142
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLNDATDIA'
        DataPipeline = ppConsCAFContab2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 11113
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'LACNUMLAN'
        DataPipeline = ppConsCAFContab2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 160867
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PLNPLANIL'
        DataPipeline = ppConsCAFContab2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
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
        mmTop = 265
        mmWidth = 62971
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 70115
        mmTop = 265
        mmWidth = 71702
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 170921
        mmTop = 265
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (PG.DATAULTFEC IS NOT NULL)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)')
    ClientDataSet = cdsVerUltFec
    Left = 24
    Top = 78
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 64
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.PLNDATDIA, P.PLNPLANIL, P.PLNCODIGO, L.LACNUMLAN, L.IDM' +
        'ODULO'
      'FROM PLANILHA P,'
      '     LANCAMENTO L'
      'WHERE (P.IDMODULO = 7)'
      '  AND (L.IDMODULO <> 7)'
      '  AND (P.PLNDATDIA >= :DATAINI)'
      '  AND (P.PLNDATDIA <= :DATAFIM)'
      '  AND (P.PLNCODIGO = L.PLNCODIGO)'
      'ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN')
    ValidateWithMask = True
    Left = 88
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
  object sqlConsCAFContab22: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.PLNDATDIA, P.PLNPLANIL, P.PLNCODIGO, L.LACNUMLAN, L.IDM' +
        'ODULO'
      'FROM PLANILHA P,'
      '     LANCAMENTO L'
      'WHERE (P.IDMODULO = 7)'
      '  AND (L.IDMODULO <> 7)'
      '  AND (P.PLNDATDIA >= :DATAINI)'
      '  AND (P.PLNDATDIA <= :DATAFIM)'
      '  AND (P.PLNCODIGO = L.PLNCODIGO)'
      'ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN')
    ClientDataSet = cdsConsCAFContab2
    Left = 232
    Top = 112
  end
  object sqlConsCAFContab21: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.PLNDATDIA, P.PLNPLANIL, P.PLNCODIGO, COUNT(L.PLNCODIGO)' +
        ' AS LACNUMLAN'
      'FROM PLANILHA P,'
      '     LANCAMENTO L'
      'WHERE (P.IDMODULO = 7)'
      '  AND (P.PLNDATDIA >= :DATAINI)'
      '  AND (P.PLNDATDIA <= :DATAFIM)'
      '  AND (NOT EXISTS (SELECT HM.PLNCODIGO'
      '                   FROM HISTORICOMOVIMENTACAO HM'
      '                   WHERE (HM.PLNCODIGO IS NOT NULL)'
      '                     AND (P.PLNCODIGO = HM.PLNCODIGO)'
      '                   GROUP BY HM.PLNCODIGO))'
      '  AND (P.PLNCODIGO = L.PLNCODIGO(+))'
      'GROUP BY P.PLNDATDIA, P.PLNPLANIL, P.PLNCODIGO'
      ''
      ' ')
    ClientDataSet = cdsConsCAFContab2
    Left = 232
    Top = 96
  end
end
