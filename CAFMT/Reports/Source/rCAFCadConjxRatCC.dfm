inherited RptCAFCadConjxRatCC: TRptCAFCadConjxRatCC
  Left = 364
  Top = 154
  Height = 264
  Caption = 'Cadastro de Conjuntos - Rateio de Custos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Conjuntos - Rateio de Custos'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpCadConj
    LabelEmpresa = LblEmpresa
    LabelSistema = lblsistema
  end
  object dsCadConj: TwwDataSource
    DataSet = cdsCadConj
    Left = 96
    Top = 80
  end
  object ppCadConj: TppBDEPipeline
    DataSource = dsCadConj
    UserName = 'CadConj'
    Left = 256
    Top = 8
  end
  object rpCadConj: TppReport
    AutoStop = False
    DataPipeline = ppCadConj
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
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
    Left = 200
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
        Caption = 'Cadastro de Conjuntos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 75142
        mmTop = 8731
        mmWidth = 46831
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
        mmWidth = 28310
        BandType = 0
      end
      object rpCadConjLine2: TppLine
        UserName = 'rpCadConjLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197379
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpCadConjDBText3: TppDBText
        UserName = 'rpCadConjDBText3'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppCadConj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rpCadConjDBText4: TppDBText
        UserName = 'rpCadConjDBText4'
        AutoSize = True
        DataField = 'DESCCENTROCUSTO'
        DataPipeline = ppCadConj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object rpCadConjDBText5: TppDBText
        UserName = 'rpCadConjDBText5'
        DataField = 'PARTICIPACAO'
        DataPipeline = ppCadConj
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object lblsistema: TppLabel
        UserName = 'lblsistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1323
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
    object rpCadConjGroup1: TppGroup
      BreakName = 'IDCONJUNTO'
      DataPipeline = ppCadConj
      UserName = 'rpCadConjGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadConjGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object rpCadConjLabel1: TppLabel
          UserName = 'rpCadConjLabel1'
          Caption = 'Conjunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 529
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel2: TppLabel
          UserName = 'rpCadConjLabel2'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 3969
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel3: TppLabel
          UserName = 'rpCadConjLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 7408
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          DataField = 'DESCCONJUNTO'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 529
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText1: TppDBText
          UserName = 'rpCadConjDBText1'
          DataField = 'NOMELOCAL'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 3969
          mmWidth = 174361
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText2: TppDBText
          UserName = 'rpCadConjDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 7408
          mmWidth = 156104
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLine1: TppLine
          UserName = 'rpCadConjLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 11642
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel4: TppLabel
          UserName = 'rpCadConjLabel4'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 12435
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjLabel6: TppLabel
          UserName = 'rpCadConjLabel6'
          Caption = 'Participação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 12435
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpCadConjDBText6: TppDBText
          UserName = 'rpCadConjDBText6'
          DataField = 'IDCONJUNTO'
          DataPipeline = ppCadConj
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 178330
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadConjGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine11: TppLine
          UserName = 'ppLine11'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsCadConj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 88
  end
  object sqlCadConj: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.IDCONJUNTO,C.DESCCONJUNTO,L.NOME AS NOMELOCAL,P.NOME AS' +
        ' NOMERESP,'
      
        '       RD.CODCENTROCUSTO,CC.NOME AS DESCCENTROCUSTO,RD.PARTICIPA' +
        'CAO'
      'FROM RATEIODEPRECIACAO RD,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     PESSOA P,'
      '     CENTCUST CC'
      'WHERE (C.IDPESSOA        = :PIDPESSOA)'
      ''
      ''
      '  AND (RD.IDCONJUNTO     = C.IDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      '  AND (C.IDLOCALIZACAO   = L.IDLOCALIZACAO)'
      '  AND (C.IDRESPONSAVEL   = P.IDPESSOA)'
      'ORDER BY C.IDCONJUNTO'
      '   '
      '')
    ClientDataSet = cdsCadConj
    Left = 16
    Top = 80
  end
  object sqlParamGlobal: TCMSqlParams
    SQL.Strings = (
      'SELECT UNIDNEGOC, MASCARACC'
      'FROM     PARAMGLOBAL'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ClientDataSet = cdsParamGlobal
    Left = 24
    Top = 176
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 176
  end
end
