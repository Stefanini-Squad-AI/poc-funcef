inherited rptGrupoAut: TrptGrupoAut
  Left = 318
  Top = 215
  Width = 368
  Height = 260
  Caption = 'Grupo de Autorização'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Grupo de Autorização'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Grupo de Autorização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '      IDGRUPOAUTORIZA,'
          '      NOMEGRUPOAUT'
          'FROM'
          '      RADGRUPOAUTORIZA'
          'ORDER BY NOMEGRUPOAUT           ')
        LookupSettings.Chave = 'IDGRUPOAUTORIZA'
        LookupSettings.Display = 'NOMEGRUPOAUT'
        LookupSettings.Descricao = 'Grupo de Autorização'
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
      end>
    Formheight = 100
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
    Report = RptGrpAut
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
    Left = 88
    Top = 12
  end
  object sqlGrpAut: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       AUT.IDGRUPOAUTORIZA,'
      '       AUT.NUMAUTORIZACAO,'
      '       GA.NOMEGRUPOAUT,'
      '       AUT.VALORAUTORIZA,'
      '       CC.NOME,'
      '       GP.DESCGRUPOPROD,'
      '       CR.NOME AS DESCCENTRESP,'
      '       UN.NOME AS DESCUNIDNEG,'
      '       GRP.NOME AS DESCGRPRESPON'
      'FROM'
      '     RADGRAUTXGRRESPON AUT,'
      '     RADGRUPOAUTORIZA GA,'
      '     CENTCUST CC,'
      '     GRUPPROD GP,'
      '     CENTRESPON CR,'
      '     UNIDNEGOCIO UN,'
      '     RADGRPRESPON GRP'
      'WHERE ( AUT.IDGRUPOAUTORIZA = GA.IDGRUPOAUTORIZA)'
      '  AND ( GA.IDGRUPOAUTORIZA = :IDGRUPOAUTORIZA)'
      '  AND ( AUT.IDEMPRESA = CC.IDEMPRESA(+))'
      '  AND ( AUT.IDPESSOA = CR.IDPESSOA(+))'
      '  AND ( AUT.IDPESSOA = UN.IDPESSOA(+))'
      '  AND ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)'
      '  AND ( AUT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND ( AUT.CODGRUPOPROD = GP.CODGRUPOPROD(+))'
      '  AND ( AUT.CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      '  AND ( AUT.UNIDNEGOC = UN.UNIDNEGOC(+))'
      'ORDER BY NOMEGRUPOAUT, DESCGRPRESPON')
    ClientDataSet = cdsGrpAut
    Left = 32
    Top = 80
  end
  object cdsGrpAut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 78
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOAUTORIZA,'
      '      NOMEGRUPOAUT'
      'FROM'
      '      RADGRUPOAUTORIZA'
      'WHERE (IDGRUPOAUTORIZA= :IDGRUPOAUTORIZA)')
    ClientDataSet = cdsGrupo
    Left = 200
    Top = 160
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 158
  end
  object RptGrpAut: TppReport
    AutoStop = False
    DataPipeline = bdeGrpAut
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
    Left = 317
    Top = 82
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Grupo de Autorização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120121
        mmTop = 8731
        mmWidth = 44186
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
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Grupo de Autorização:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 15346
        mmWidth = 32279
        BandType = 0
      end
      object LbGrpAut: TppLabel
        UserName = 'LbGrpAut'
        Caption = ' TODOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Grupo de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 21960
        mmWidth = 40217
        BandType = 0
      end
      object RptGrpAutLine1: TppLine
        UserName = 'RptGrpAutLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284300
        BandType = 0
      end
      object RptGrpAutLabel1: TppLabel
        UserName = 'RptGrpAutLabel1'
        Caption = 'Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 21960
        mmWidth = 41275
        BandType = 0
      end
      object RptGrpAutLabel2: TppLabel
        UserName = 'RptGrpAutLabel2'
        Caption = 'Centro de  Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 21960
        mmWidth = 24871
        BandType = 0
      end
      object RptGrpAutLabel3: TppLabel
        UserName = 'RptGrpAutLabel3'
        Caption = 'Atividade / Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 21960
        mmWidth = 26458
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284300
        BandType = 0
      end
      object RptGrpAutLabel4: TppLabel
        UserName = 'RptGrpAutLabel4'
        Caption = 'Grupo de Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187590
        mmTop = 21960
        mmWidth = 25929
        BandType = 0
      end
      object RptGrpAutLabel5: TppLabel
        UserName = 'RptGrpAutLabel5'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 244475
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object RptGrpAutLabel6: TppLabel
        UserName = 'RptGrpAutLabel6'
        Caption = 'Nº Aut.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 21960
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptGrpAutDBText2: TppDBText
        UserName = 'RptGrpAutDBText2'
        DataField = 'DESCGRPRESPON'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText3: TppDBText
        UserName = 'RptGrpAutDBText3'
        DataField = 'DESCCENTRESP'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText4: TppDBText
        UserName = 'RptGrpAutDBText4'
        DataField = 'NOME'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText5: TppDBText
        UserName = 'RptGrpAutDBText5'
        DataField = 'DESCUNIDNEG'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 0
        mmWidth = 39688
        BandType = 4
      end
      object RptGrpAutDBText6: TppDBText
        UserName = 'RptGrpAutDBText6'
        DataField = 'DESCGRUPOPROD'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText7: TppDBText
        UserName = 'RptGrpAutDBText7'
        DataField = 'VALORAUTORIZA'
        DataPipeline = bdeGrpAut
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236273
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptGrpAutDBText8: TppDBText
        UserName = 'RptGrpAutDBText8'
        DataField = 'NUMAUTORIZACAO'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 253736
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 23813
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
        mmLeft = 111654
        mmTop = 529
        mmWidth = 61119
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
        mmLeft = 243946
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptGrpAutGroup1: TppGroup
      BreakName = 'IDGRUPOAUTORIZA'
      DataPipeline = bdeGrpAut
      UserName = 'RptGrpAutGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptGrpAutGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object RptGrpAutDBText1: TppDBText
          UserName = 'RptGrpAutDBText1'
          AutoSize = True
          DataField = 'NOMEGRUPOAUT'
          DataPipeline = bdeGrpAut
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 1588
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object RptGrpAutLine2: TppLine
          UserName = 'RptGrpAutLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'Grupo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1588
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGrpAutGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsGrpAut: TwwDataSource
    DataSet = cdsGrpAut
    Left = 173
    Top = 77
  end
  object bdeGrpAut: TppBDEPipeline
    DataSource = dsGrpAut
    UserName = 'bdeGrpAut'
    Left = 245
    Top = 82
  end
end
