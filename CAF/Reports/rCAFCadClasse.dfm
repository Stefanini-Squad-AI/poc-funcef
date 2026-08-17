inherited RptCAFCadClasse: TRptCAFCadClasse
  Left = 313
  Top = 210
  Width = 274
  Height = 166
  Caption = 'RptCAFCadClasse'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Classificação de Bens'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Código de Classificação Inicial'
        Controle = tcEdit
        TipodeDado = tdString
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
        Caption = 'Código de Classificação Final'
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
    Formheight = 130
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpCadClasse
    LabelEmpresa = LblEmpresa
    LabelSistema = LBLSISTEMA
  end
  object sqlCadClasse: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CB.CODHIERARQ AS CLASSE,'
      '   CB.DESCRICAO  AS NOME,'
      '   CB.ANASINT    AS TIPO,'
      '   G.CLASSE      AS CODGRUPO,'
      '   G.NOME        AS DESCGRUPO,CB.CODHIERARQ'
      'FROM'
      '   CLASSEDEBEM CB,'
      '   CLASSEXGRUPO CXB,'
      '   GRUPO G'
      'WHERE'
      ''
      '      CB.IDCLASSEBEM = CXB.IDCLASSEBEM(+)'
      '  AND CXB.IDGRUPO    = G.IDGRUPO(+)'
      'ORDER BY CB.CODHIERARQ'
      '')
    ClientDataSet = cdsCadClasse
    Left = 211
    Top = 62
  end
  object cdsCadClasse: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 211
    Top = 47
  end
  object dsCadClasse: TwwDataSource
    DataSet = cdsCadClasse
    Left = 210
    Top = 34
  end
  object ppCadClasse: TppBDEPipeline
    DataSource = dsCadClasse
    UserName = 'CadClasse'
    Left = 210
    Top = 21
  end
  object rpCadClasse: TppReport
    AutoStop = False
    DataPipeline = ppCadClasse
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 210
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Cadastro de Classes de Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 68792
        mmTop = 8996
        mmWidth = 59531
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197379
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 19844
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'S / A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 19579
        mmWidth = 6350
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197379
        BandType = 0
      end
      object rpCadClasseLabel1: TppLabel
        UserName = 'rpCadClasseLabel1'
        Caption = 'Grupos Contábeis Associados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 25135
        mmWidth = 50006
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object rpCadClasseDBText1: TppDBText
        UserName = 'rpCadClasseDBText1'
        DataField = 'DESCGRUPO'
        DataPipeline = ppCadClasse
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 38365
        mmTop = 0
        mmWidth = 158221
        BandType = 4
      end
      object rpCadClasseCODGRUPO: TppVariable
        OnPrint = rpCadClasseCODGRUPOPrint
        UserName = 'rpCadClasseCODGRUPO1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 0
        mmWidth = 37306
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
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
        mmWidth = 63500
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCadClasseGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppCadClasse
      UserName = 'rpCadClasseGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadClasseGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText20: TppDBText
          UserName = 'ppDBText20'
          DataField = 'NOME'
          DataPipeline = ppCadClasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 27517
          mmTop = 0
          mmWidth = 149754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'ppDBText21'
          DataField = 'TIPO'
          DataPipeline = ppCadClasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 180182
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadClasseLine1: TppLine
          UserName = 'rpCadClasseLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadClasseCODCLASSE: TppVariable
          OnPrint = rpCadClasseCODCLASSEPrint
          UserName = 'rpCadClasseCODCLASSE1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4234
          mmLeft = 0
          mmTop = 0
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadClasseGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object rpCadClasseLine2: TppLine
          UserName = 'rpCadClasseLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
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
    Left = 24
    Top = 64
  end
end
