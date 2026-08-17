inherited rptGrupoRespon: TrptGrupoRespon
  Left = 318
  Top = 215
  Width = 368
  Height = 260
  Caption = 'Grupo de  Responsabilidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Grupo de  Responsabilidade'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Grupo de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '            IDGRPRESPON,'
          '            NOME'
          'FROM'
          '           RADGRPRESPON'
          'ORDER BY NOME  ')
        LookupSettings.Chave = 'IDGRPRESPON'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Grupo de Responsabilidade'
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
    Report = RptGrpRespon
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
    Left = 88
    Top = 12
  end
  object sqlGrpRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     GRP.IDGRPRESPON,'
      '     GRP.NOME,'
      '     USU.NOMEUSUARIO'
      'FROM'
      '     RADRESPONXGRP GXU,'
      '     RADGRPRESPON GRP,'
      '     USUARIOSISTEMA USU'
      'WHERE'
      '       (GXU.IDGRPRESPON = GRP.IDGRPRESPON)'
      '   AND (GXU.IDUSUARIO   = USU.IDUSUARIO)'
      '   AND (GRP.IDGRPRESPON = :IDGRPRESPON)'
      'ORDER BY NOME, NOMEUSUARIO'
      ' ')
    ClientDataSet = cdsGrpRespon
    Left = 32
    Top = 80
  end
  object cdsGrpRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 78
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '            IDGRPRESPON,'
      '            NOME'
      'FROM'
      '           RADGRPRESPON'
      'WHERE (IDGRPRESPON= :IDGRPRESPON)')
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
  object RptGrpRespon: TppReport
    AutoStop = False
    DataPipeline = bdeGrpRespon
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
    Left = 309
    Top = 74
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Grupo de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71438
        mmTop = 8731
        mmWidth = 56356
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
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
      object RptGrpResponLabel1: TppLabel
        UserName = 'RptGrpResponLabel1'
        Caption = 'Grupo de Responsabilidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 15346
        mmWidth = 41804
        BandType = 0
      end
      object LbGrpRespon: TppLabel
        UserName = 'LbGrpRespon'
        Caption = ' TODOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object RptGrpResponLabel2: TppLabel
        UserName = 'RptGrpResponLabel2'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 20373
        mmWidth = 8996
        BandType = 0
      end
      object RptGrpResponLabel3: TppLabel
        UserName = 'RptGrpResponLabel3'
        Caption = 'Usuários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 66411
        mmTop = 20373
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptGrpResponDBText2: TppDBText
        UserName = 'RptGrpResponDBText2'
        DataField = 'NOMEUSUARIO'
        DataPipeline = bdeGrpRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66411
        mmTop = 0
        mmWidth = 31750
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 529
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptGrpResponGroup1: TppGroup
      BreakName = 'IDGRPRESPON'
      DataPipeline = bdeGrpRespon
      UserName = 'RptGrpResponGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptGrpResponGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object RptGrpResponDBText1: TppDBText
          UserName = 'RptGrpResponDBText1'
          DataField = 'NOME'
          DataPipeline = bdeGrpRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 529
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptGrpResponLine1: TppLine
          UserName = 'RptGrpResponLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5027
          mmWidth = 112713
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGrpResponGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsGrpRespon: TwwDataSource
    DataSet = cdsGrpRespon
    Left = 173
    Top = 77
  end
  object bdeGrpRespon: TppBDEPipeline
    DataSource = dsGrpRespon
    UserName = 'bdeGrpRespon'
    Left = 237
    Top = 76
  end
end
