inherited RptCAFObras: TRptCAFObras
  Left = 480
  Top = 174
  Width = 265
  Height = 147
  Caption = 'Cadastro de Obras'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Obras'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Emitir'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Em Aberto'
          'Encerradas'
          'Todas')
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
      end
      item
        Caption = 'Obra'
        Controle = tcMontaSelect
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
        MontaSelect = MSObra
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 142
    FormWidth = 450
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpObras
    LabelEmpresa = ppLabel57
    LabelSistema = ppLabel61
  end
  object sqlObras: TCMSqlParams
    SQL.Strings = (
      
        'SELECT O.IDCAFOBRA, O.IDPESSOA, O.IDMODULO, P.NOME AS NOMEFORN, ' +
        'L.DESCLANCOBRA,'
      
        '       O.DESCCAFOBRA, O.DTAINICIOOBRA, O.DTAENCERRAOBRA, O.FLGOB' +
        'RA,'
      
        '       EO.DESCOBRATIPOETAPA, L.DTALANCAMENTO, L.VALOFI, L.DTANOT' +
        'A, L.NUMNOTA, L.COMPLNOTA,'
      '       L.IDGRUPO, L.CODSUBCONTA, L.UNIDNEGOC, L.IDOBRATIPOETAPA,'
      
        '       G.NOME AS DESCGRUPO, AV.NOME AS DESCATIVPROJ, SC.NOMESUBC' +
        'ONTA'
      'FROM   CAFOBRALANC L,'
      '       CAFOBRATIPOETAPA EO,'
      '       CAFOBRA O,'
      '       GRUPO G,'
      '       PLANOGRUPO PG,'
      '       UNIDNEGOCIO AV,'
      '       SUBCONTA SC, PESSOA P'
      'WHERE O.IDPESSOA = :IDPESSOA'
      ''
      ''
      ''
      '  AND O.IDCAFOBRA = L.IDCAFOBRA(+)'
      '  AND O.IDPESSOA = L.IDPESSOA(+)'
      '  AND L.IDGRUPO = PG.IDGRUPO(+)'
      '  AND L.IDPESSOA = PG.IDPESSOA(+)'
      '  AND PG.IDGRUPO = G.IDGRUPO(+)'
      '  AND L.UNIDNEGOC = AV.UNIDNEGOC(+)'
      '  AND L.IDPESSOA = AV.IDPESSOA(+)'
      '  AND L.CODSUBCONTA = SC.CODSUBCONTA(+)'
      '  AND L.IDPESSOA = SC.IDPESSOA(+)'
      '  AND L.IDOBRATIPOETAPA = EO.IDOBRATIPOETAPA(+)'
      '  AND L.IDFORNECEDOR = P.IDPESSOA(+)'
      
        'ORDER BY O.IDCAFOBRA, O.IDPESSOA, L.DTALANCAMENTO, L.IDOBRATIPOE' +
        'TAPA, L.IDGRUPO'
      ''
      ' ')
    ClientDataSet = cdsObras
    Left = 208
    Top = 58
  end
  object cdsObras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 45
  end
  object dsObras: TwwDataSource
    DataSet = cdsObras
    Left = 208
    Top = 32
  end
  object ppObras: TppBDEPipeline
    DataSource = dsObras
    UserName = 'Obras'
    Left = 208
    Top = 20
  end
  object rpObras: TppReport
    AutoStop = False
    DataPipeline = ppObras
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
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 208
    Top = 7
    Version = '5.5'
    mmColumnWidth = 197379
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Relação de Obras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 124884
        mmTop = 8731
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'ppLabel57'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'rpInvPatDBText4'
        DataField = 'DTALANCAMENTO'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'rpInvPatDBText5'
        DataField = 'DESCOBRATIPOETAPA'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'VALOFI'
        DataPipeline = ppObras
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'NUMNOTA'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'COMPLNOTA'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 103717
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'DTANOTA'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'DESCGRUPO'
        DataPipeline = ppObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 5027
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'NOMESUBCONTA'
        DataPipeline = ppObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 5027
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DESCATIVPROJ'
        DataPipeline = ppObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 65881
        mmTop = 5027
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText301'
        DataField = 'NOMEFORN'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 0
        mmWidth = 66146
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'DESCLANCOBRA'
        DataPipeline = ppObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 204523
        mmTop = 0
        mmWidth = 76994
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
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
        mmWidth = 104246
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
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
        mmLeft = 258234
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 116152
        mmTop = 1588
        mmWidth = 52123
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDCAFOBRA'
      DataPipeline = ppObras
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object ppLabel58: TppLabel
          UserName = 'Label58'
          AutoSize = False
          Caption = 'Data de Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'DTAINICIOOBRA'
          DataPipeline = ppObras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 20638
          mmTop = 4498
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 14023
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          AutoSize = False
          Caption = 'Atividade/Projeto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 66146
          mmTop = 14023
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'Label62'
          AutoSize = False
          Caption = 'Sub Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 14023
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          OnPrint = ppLabel64Print
          UserName = 'ppLabel64'
          AutoSize = False
          Caption = 'Encerrado em 99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 38894
          mmTop = 4498
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label65'
          AutoSize = False
          Caption = 'Etapa da Obra '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 265
          mmTop = 9790
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 41010
          mmTop = 9790
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label67'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 65352
          mmTop = 9790
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'D o c u m e n t o   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 89165
          mmTop = 9790
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'Label80'
          AutoSize = False
          Caption = 'Data Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 120650
          mmTop = 9790
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLine29: TppLine
          UserName = 'Line29'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 17463
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = 'DESCCAFOBRA'
          DataPipeline = ppObras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 265
          mmWidth = 238655
          BandType = 3
          GroupNo = 0
        end
        object ppLabel124: TppLabel
          UserName = 'Label801'
          AutoSize = False
          Caption = 'Fornecedor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 137584
          mmTop = 9790
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel125: TppLabel
          UserName = 'Label125'
          AutoSize = False
          Caption = 'Fato Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 204523
          mmTop = 9790
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOFI'
          DataPipeline = ppObras
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 59267
          mmTop = 794
          mmWidth = 20109
          BandType = 5
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line30'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object MSObra: TMontaSelect
    Tag = 1
    Template.IdConsulta = 0
    Caption = 'Selecione a Obra'
    Colunas.Strings = (
      'CAFOBRA.DESCCAFOBRA'
      'CAFOBRA.DTAINICIOOBRA'
      'CAFOBRA.DTAENCERRAOBRA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Inicio'
      'Data de Encerramento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CAFOBRA')
    CamposChave.Strings = (
      'CAFOBRA.IDCAFOBRA'
      'CAFOBRA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '18'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 60
  end
end
