inherited rptPlanInventGrupo: TrptPlanInventGrupo
  Left = 656
  Top = 428
  Width = 333
  Height = 151
  Caption = 'Planilha de Inventário por Grupo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Planilha de Inventário por Grupo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'Almoxarifado'
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
        Name = 'Almoxarifado'
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
        Caption = 'Número do Inventário'
        Controle = tcMontaSelect
        CampoBanco = 'IDINVENTARIO'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'NumInvent'
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
        MontaSelect = MsPlanInventGrupo
        Width = 0
      end
      item
        Caption = 'Data do Inventário'
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
        Caption = 'Só imprirmir itens estocáveis'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 180
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptPlanInventGrp
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
  end
  object sqlPlanInventGrp: TCMSqlParams
    SQL.Strings = (
      'SELECT AL.DESCALMOX AS ALMOXARIFADO,'
      '       SL.LOCALIZACAO,'
      '       M.NUMDOCUMENTO AS NUMERO,'
      '       M.IDMOV,'
      '       M.DATAMOV,'
      '       M.CODCENTROCUSTO,'
      '       M.CODARTIGO,'
      '       PR.CODMEDCUSTO,'
      
        '       PR.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO AS ' +
        'DESCRICAO,'
      '       ( M.QTDEMOV * ( -1 ) )  AS QTDEMOV,'
      '       ( M.VALORMOV * ( -1 ) ) AS VALORMOV,'
      '       M.CUSTOMEDIOMOV,'
      '       M.CODTIPOMOV,'
      '       C.NOME,'
      '       M.NUMDOCUMENTO || M.CODCENTROCUSTO AS GRUPO'
      '  FROM MOVIMENT M,'
      '       SALDO sl,'
      '       PRODUTO PR,'
      '       ARTIGO A,'
      '       ALMOX AL,'
      '       CENTCUST C'
      ' WHERE ( 1 = 1 )'
      '   AND ( RTRIM( M.NUMDOCUMENTO ) = :numreq )'
      '   AND :tipomov'
      '   AND ( M.DATAMOV >= :dataini )'
      '   AND ( M.DATAMOV <= :datafim )'
      '   AND ( M.CODALMOXARIFADO = :almox )'
      '   AND ( RTRIM( M.CODCENTROCUSTO ) = :ccusto )'
      '   AND ( PR.ITEMESTOCAVEL = :estoque )'
      '   AND ( M.IDPESSOA = :idempresa )'
      '   AND ( C.IDEMPRESA = :idempresa )'
      '   AND ( A.CODARTIGO = M.CODARTIGO )'
      '   AND ( A.CODPRODUTO = PR.CODPRODUTO )'
      '   AND ( M.CODALMOXARIFADO = AL.CODALMOXARIFADO )'
      '   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO )'
      '   AND ( SL.CODARTIGO = A.CODARTIGO(+)  )'
      '   AND ( SL.CODALMOXARIFADO = AL.CODALMOXARIFADO(+) )'
      
        ' ORDER BY ALMOXARIFADO, M.DATAMOV, NUMERO, M.CODCENTROCUSTO, :or' +
        'dem')
    ClientDataSet = cdsPlanInventGrp
    Left = 204
    Top = 8
  end
  object cdsPlanInventGrp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 204
    Top = 60
  end
  object rptPlanInventGrp: TppReport
    AutoStop = False
    DataPipeline = bdePlanInventGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 24
    Top = 61
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Planilha de Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 72496
        mmTop = 8731
        mmWidth = 52917
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
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rptPlanInventGrpLabel1: TppLabel
        UserName = 'rptPlanInventGrpLabel1'
        Caption = 'ALmoxarifado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16933
        mmWidth = 25929
        BandType = 0
      end
      object lbAlmox5: TppLabel
        UserName = 'lbAlmox5'
        Caption = 'Almoxarifado Principal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28310
        mmTop = 16933
        mmWidth = 35719
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        DataField = 'CODARTIGO'
        DataPipeline = bdePlanInventGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 2646
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = bdePlanInventGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 2646
        mmWidth = 16669
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 169598
        mmTop = 5821
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'LOCALIZACAO'
        DataPipeline = bdePlanInventGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 2646
        mmWidth = 57415
        BandType = 4
      end
      object rptPlanInventGrpDBText3: TppDBText
        UserName = 'rptPlanInventGrpDBText3'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdePlanInventGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 2646
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
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
    object ppGroup3: TppGroup
      BreakName = 'IDINVENTARIO'
      DataPipeline = bdePlanInventGrp
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'ppDBText11'
          AutoSize = True
          DataField = 'IDINVENTARIO'
          DataPipeline = bdePlanInventGrp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 28575
          mmTop = 1852
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'ppDBText12'
          AutoSize = True
          DataField = 'DATAINVENTARIO'
          DataPipeline = bdePlanInventGrp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 88900
          mmTop = 1852
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'Inventário Nº :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 1852
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'Data :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78317
          mmTop = 1852
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventGrpLine1: TppLine
          UserName = 'rptPlanInventGrpLine1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6879
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rptPlanInventGrpGroup1: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdePlanInventGrp
      UserName = 'rptPlanInventGrpGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptPlanInventGrpGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLine16: TppLine
          UserName = 'ppLine16'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel40: TppLabel
          UserName = 'ppLabel40'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 9525
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppLabel41: TppLabel
          UserName = 'ppLabel41'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 9525
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppLabel42: TppLabel
          UserName = 'ppLabel42'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 9525
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLine17: TppLine
          UserName = 'ppLine17'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 14023
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel43: TppLabel
          UserName = 'ppLabel43'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 100806
          mmTop = 9790
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object rptPlanInventGrpDBText1: TppDBText
          UserName = 'rptPlanInventGrpDBText1'
          AutoSize = True
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdePlanInventGrp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 1588
          mmWidth = 31221
          BandType = 3
          GroupNo = 1
        end
        object rptPlanInventGrpDBText2: TppDBText
          UserName = 'rptPlanInventGrpDBText2'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdePlanInventGrp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 23019
          mmTop = 1323
          mmWidth = 33073
          BandType = 3
          GroupNo = 1
        end
        object rptPlanInventGrpLabel2: TppLabel
          UserName = 'rptPlanInventGrpLabel2'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 159809
          mmTop = 9525
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
      end
      object rptPlanInventGrpGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsPlanInventGrp: TwwDataSource
    DataSet = cdsPlanInventGrp
    Left = 143
    Top = 60
  end
  object bdePlanInventGrp: TppBDEPipeline
    DataSource = dsPlanInventGrp
    UserName = 'bdePlanInventGrp'
    Left = 86
    Top = 61
  end
  object MsPlanInventGrupo: TMontaSelect
    Tag = 4
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.ABERTOFECHADO')
    TipodeDado.Strings = (
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Código'
      'Data'
      'Aberto/Fechado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTAR')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.IDINVENTARIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 260
    Top = 60
  end
end
