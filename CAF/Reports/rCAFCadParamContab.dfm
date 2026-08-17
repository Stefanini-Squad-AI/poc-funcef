inherited RptCAFCadParamContab: TRptCAFCadParamContab
  Left = 234
  Top = 226
  Height = 199
  Caption = 'Parametrização Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parametrização Contábil por Grupo'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, CLASSE, IDGRUPO'
          'FROM GRUPO'
          'WHERE (TIPO = '#39'A'#39')'
          'ORDER BY CLASSE')
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
        Caption = 'Tipo Movimentação'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCTIPOMOVIMENTACAO, IDTIPOMOVIMENTACAO'
          'FROM TIPOMOVIMENTACAO'
          'WHERE LANCAMENTO = '#39'S'#39
          'ORDER BY DESCTIPOMOVIMENTACAO')
        LookupSettings.Chave = 'IDTIPOMOVIMENTACAO'
        LookupSettings.Display = 'DESCTIPOMOVIMENTACAO'
        LookupSettings.Descricao = 'Movimentação'
        LookupSettings.Tamanho = '40'
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
        Name = 'TIPOMOV'
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
    Formheight = 121
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpParamContab
    LabelEmpresa = ppLabel87
    LabelSistema = ppLabel88
  end
  object sqlParamContab: TCMSqlParams
    SQL.Strings = (
      
        'SELECT TMG.IDGRUPO,G.NOME AS DESCGRUPO,G.CLASSE,TMG.IDTIPOMOVIME' +
        'NTACAO,'
      
        '       TM.DESCTIPOMOVIMENTACAO,CTMG.PLANO,CTMG.PLACONTA,PC.PLANO' +
        'ME,'
      '       CTMG.TIPOLANCAMENTO AS DEBCRED, CTMG.TIPOLANCAMENTO,'
      
        '       CTMG.CODCENTROCUSTO, CC.NOME AS NOMECCUSTO, DECODE(CTMG.F' +
        'LGSEGREGA,0,'#39'NÃO'#39','#39'SIM'#39') AS FLGSEGREGA'
      'FROM   TIPOSMOVIMENTOGRUPOS TMG,'
      '       CONTASTIPOSMOVIMENTOGRUPOS CTMG,'
      '       TIPOMOVIMENTACAO TM,'
      '       GRUPO G,'
      '       PLANOCONTA PC,'
      '       CENTCUST CC'
      'WHERE TMG.IDPESSOA = :IDPESSOA'
      ''
      ''
      '  AND TMG.IDGRUPO = G.IDGRUPO'
      '  AND TMG.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO'
      '  AND TMG.IDPESSOA = CTMG.IDPESSOA(+)'
      '  AND TMG.IDGRUPO = CTMG.IDGRUPO(+)'
      '  AND TMG.IDTIPOMOVIMENTACAO = CTMG.IDTIPOMOVIMENTACAO(+)'
      '  AND CTMG.PLANO = PC.PLANO'
      '  AND CTMG.PLACONTA = PC.PLACONTA'
      '  AND CTMG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      '  AND CTMG.IDEMPRESA = CC.IDEMPRESA(+)'
      
        'ORDER BY G.CLASSE,TMG.IDTIPOMOVIMENTACAO,CTMG.TIPOLANCAMENTO DES' +
        'C,CTMG.CODCENTROCUSTO'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsParamContab
    Left = 225
    Top = 62
  end
  object cdsParamContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 225
    Top = 48
  end
  object dsParamContab: TwwDataSource
    DataSet = cdsParamContab
    Left = 224
    Top = 35
  end
  object ppParamContab: TppBDEPipeline
    DataSource = dsParamContab
    UserName = 'ParamContab'
    Left = 224
    Top = 21
  end
  object rpParamContab: TppReport
    AutoStop = False
    DataPipeline = ppParamContab
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
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel85: TppLabel
        UserName = 'ppLabel85'
        Caption = 'Parâmetros da Integração Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65352
        mmTop = 8731
        mmWidth = 70379
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
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
      object rpCtaMovGrpPlanoConta: TppLabel
        UserName = 'rpCtaMovGrpPlanoConta'
        Caption = 'Plano de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 15081
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpCtaMovGrpDBText4: TppDBText
        UserName = 'rpCtaMovGrpDBText4'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = ppParamContab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
      object rpCtaMovGrpDBText5: TppDBText
        UserName = 'rpCtaMovGrpDBText5'
        DataField = 'PLANOME'
        DataPipeline = ppParamContab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 47625
        mmTop = 794
        mmWidth = 96309
        BandType = 4
      end
      object rpCtaMovGrpDBText6: TppDBText
        UserName = 'rpCtaMovGrpDBText6'
        DataField = 'DEBCRED'
        DataPipeline = ppParamContab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 145257
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object rpCtaMovGrpDBText7: TppDBText
        UserName = 'rpCtaMovGrpDBText7'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppParamContab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FLGSEGREGA'
        DataPipeline = ppParamContab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 184680
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel88: TppLabel
        UserName = 'ppLabel88'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2381
        mmWidth = 35719
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 75142
        mmTop = 2646
        mmWidth = 46831
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
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
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCtaMovGrpGroup2: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = ppParamContab
      UserName = 'rpCtaMovGrpGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCtaMovGrpGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpCtaMovGrpLabel1: TppLabel
          UserName = 'rpCtaMovGrpLabel1'
          Caption = 'Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1588
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpDBText2: TppDBText
          UserName = 'rpCtaMovGrpDBText2'
          DataField = 'CLASSE'
          DataPipeline = ppParamContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 15081
          mmTop = 1588
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpDBText1: TppDBText
          UserName = 'rpCtaMovGrpDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = ppParamContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 44186
          mmTop = 1588
          mmWidth = 153194
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpLine2: TppLine
          UserName = 'rpCtaMovGrpLine2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2
          mmHeight = 1323
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpCtaMovGrpLine1: TppLine
          UserName = 'rpCtaMovGrpLine1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCtaMovGrpGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpCtaMovGrpGroup1: TppGroup
      BreakName = 'IDTIPOMOVIMENTACAO'
      DataPipeline = ppParamContab
      UserName = 'rpCtaMovGrpGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCtaMovGrpGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpCtaMovGrpLabel2: TppLabel
          UserName = 'rpCtaMovGrpLabel2'
          AutoSize = False
          Caption = 'Movimento '
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpDBText3: TppDBText
          UserName = 'rpCtaMovGrpDBText3'
          Color = clSilver
          DataField = 'DESCTIPOMOVIMENTACAO'
          DataPipeline = ppParamContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 4233
          mmLeft = 20638
          mmTop = 1058
          mmWidth = 176742
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel3: TppLabel
          UserName = 'rpCtaMovGrpLabel3'
          Caption = 'Conta Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6879
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel5: TppLabel
          UserName = 'rpCtaMovGrpLabel5'
          Caption = 'D/C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144727
          mmTop = 6879
          mmWidth = 6085
          BandType = 3
          GroupNo = 1
        end
        object rpCtaMovGrpLabel4: TppLabel
          UserName = 'rpCtaMovGrpLabel4'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 47625
          mmTop = 6879
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 152665
          mmTop = 6615
          mmWidth = 27517
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Segregar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 182298
          mmTop = 6615
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCtaMovGrpGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
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
        'IARIO,'
      '       G.MASCARACC'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC,'
      '       PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 32
    Top = 64
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 80
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO,MASCARA'
      'FROM PLANO'
      'WHERE PLANO = :PPLANO')
    ClientDataSet = cdsPlano
    Left = 120
    Top = 64
  end
  object qryParamContab: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      
        'SELECT TMG.IDGRUPO,G.NOME AS DESCGRUPO,G.CLASSE,TMG.IDTIPOMOVIME' +
        'NTACAO,'
      
        '       TM.DESCTIPOMOVIMENTACAO,CTMG.PLANO,CTMG.PLACONTA,PC.PLANO' +
        'ME,'
      '       CTMG.TIPOLANCAMENTO AS DEBCRED, CTMG.TIPOLANCAMENTO,'
      
        '       CTMG.CODCENTROCUSTO, CC.NOME AS NOMECCUSTO, DECODE(CTMG.F' +
        'LGSEGREGA,0,'#39'NÃO'#39','#39'SIM'#39') AS FLGSEGREGA'
      'FROM   TIPOSMOVIMENTOGRUPOS TMG,'
      '       CONTASTIPOSMOVIMENTOGRUPOS CTMG,'
      '       TIPOMOVIMENTACAO TM,'
      '       GRUPO G,'
      '       PLANOCONTA PC,'
      '       CENTCUST CC'
      'WHERE TMG.IDPESSOA = 0'
      ''
      '  AND TMG.IDGRUPO = G.IDGRUPO'
      '  AND TMG.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO'
      '  AND TMG.IDPESSOA = CTMG.IDPESSOA(+)'
      '  AND TMG.IDGRUPO = CTMG.IDGRUPO(+)'
      '  AND TMG.IDTIPOMOVIMENTACAO = CTMG.IDTIPOMOVIMENTACAO(+)'
      '  AND CTMG.PLANO = PC.PLANO'
      '  AND CTMG.PLACONTA = PC.PLACONTA'
      '  AND CTMG.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)'
      '  AND CTMG.IDEMPRESA = CC.IDEMPRESA(+)'
      
        'ORDER BY G.CLASSE,TMG.IDTIPOMOVIMENTACAO,CTMG.TIPOLANCAMENTO DES' +
        'C,CTMG.CODCENTROCUSTO')
    ValidateWithMask = True
    Left = 224
    Top = 112
  end
end
