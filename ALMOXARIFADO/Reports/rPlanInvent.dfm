inherited rptPlanInvent: TrptPlanInvent
  Left = 657
  Top = 291
  Width = 289
  Height = 160
  Caption = 'Planilha de Inventário'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Planilha de Inventário'
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
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'Select IdInventario, DataInventario, AbertoFechado '
          '  From Inventar '
          ' Where (ContagemEncerrada = '#39'F'#39')'
          '   And idPessoa = 1')
        LookupSettings.Chave = 'IDINVENTARIO'
        LookupSettings.Display = 'IDINVENTARIO|DATAINVENTARIO'
        LookupSettings.Descricao = 'No. Inventário|Data Inventário'
        LookupSettings.Tamanho = '0|0'
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
        Name = 'NumeroInven'
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
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Código'
          'Alfabética'
          'Grupo de Produtos'
          'Localização')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
    Formheight = 230
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptPlanInvent
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
    Left = 84
  end
  object sqlPlanInvent: TCMSqlParams
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
    ClientDataSet = cdsPlanInvent
    Left = 204
    Top = 8
  end
  object cdsPlanInvent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 204
    Top = 64
  end
  object rptPlanInvent: TppReport
    AutoStop = False
    DataPipeline = bdePlanInvent
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
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Planilha de Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 72231
        mmTop = 8731
        mmWidth = 52917
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
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
      object rptPlanInventLabel7: TppLabel
        UserName = 'rptPlanInventLabel7'
        Caption = 'Almoxarifado : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 16140
        mmWidth = 25929
        BandType = 0
      end
      object LBAlmoxPI: TppLabel
        UserName = 'LBAlmoxPI'
        Caption = 'Almox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 32279
        mmTop = 16140
        mmWidth = 10054
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object rptPlanInventDBText3: TppDBText
        UserName = 'rptPlanInventDBText3'
        DataField = 'CODARTIGO'
        DataPipeline = bdePlanInvent
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
      object rptPlanInventDBText4: TppDBText
        UserName = 'rptPlanInventDBText4'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = bdePlanInvent
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
      object rptPlanInventLine3: TppLine
        UserName = 'rptPlanInventLine3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 95779
        mmTop = 6085
        mmWidth = 24871
        BandType = 4
      end
      object rptPlanInventDBText5: TppDBText
        UserName = 'rptPlanInventDBText5'
        DataField = 'LOCALIZACAO'
        DataPipeline = bdePlanInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 2646
        mmWidth = 57415
        BandType = 4
      end
      object rptPlanInventDBText6: TppDBText
        UserName = 'rptPlanInventDBText6'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdePlanInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 2646
        mmWidth = 8202
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
      object ppLine7: TppLine
        UserName = 'ppLine7'
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
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
    object rptPlanInventGroup1: TppGroup
      BreakName = 'IDINVENTARIO'
      DataPipeline = bdePlanInvent
      NewPage = True
      UserName = 'rptPlanInventGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptPlanInventGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object rptPlanInventLine1: TppLine
          UserName = 'rptPlanInventLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8467
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventDBText1: TppDBText
          UserName = 'rptPlanInventDBText1'
          AutoSize = True
          DataField = 'IDINVENTARIO'
          DataPipeline = bdePlanInvent
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
        object rptPlanInventDBText2: TppDBText
          UserName = 'rptPlanInventDBText2'
          AutoSize = True
          DataField = 'DATAINVENTARIO'
          DataPipeline = bdePlanInvent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 93398
          mmTop = 1852
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel1: TppLabel
          UserName = 'rptPlanInventLabel1'
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
        object rptPlanInventLabel2: TppLabel
          UserName = 'rptPlanInventLabel2'
          Caption = 'Data :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 82815
          mmTop = 1852
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel3: TppLabel
          UserName = 'rptPlanInventLabel3'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 10319
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel4: TppLabel
          UserName = 'rptPlanInventLabel4'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 10319
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel5: TppLabel
          UserName = 'rptPlanInventLabel5'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 96044
          mmTop = 10583
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLine2: TppLine
          UserName = 'rptPlanInventLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 15611
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel6: TppLabel
          UserName = 'rptPlanInventLabel6'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 133879
          mmTop = 10583
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rptPlanInventLabel8: TppLabel
          UserName = 'rptPlanInventLabel8'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 123561
          mmTop = 10583
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
      end
      object rptPlanInventGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsPlanInvent: TwwDataSource
    DataSet = cdsPlanInvent
    Left = 144
    Top = 64
  end
  object bdePlanInvent: TppBDEPipeline
    DataSource = dsPlanInvent
    UserName = 'bdePlanInvent'
    Left = 84
    Top = 64
  end
end
