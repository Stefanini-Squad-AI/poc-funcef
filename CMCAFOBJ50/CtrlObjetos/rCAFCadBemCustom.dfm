inherited RptCAFCadBemCustom: TRptCAFCadBemCustom
  Left = 270
  Top = 160
  Width = 313
  Height = 156
  Caption = 'Cadastro de Bens Customizável'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimentados até'
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
        Caption = 'Sub-Título'
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
        Caption = 'Bens Selecionados1'
        Controle = tcMemo
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
        Caption = 'Bens Selecionados2'
        Controle = tcMemo
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
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpSelBensCustom
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object sqlSelBensCustom: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DAT' +
        'AULTDEP,'
      '       B.DATAINICIODEP, B.IDNOTA, B.COMPLNOTA,'
      
        '       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS' +
        ' DESCCCUSTO,'
      
        '       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCG' +
        'RUPO,'
      
        '       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS V' +
        'ALHISTORICO,'
      
        '       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCL' +
        'ASSE,'
      '       S.DESCSITUACAO,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALC' +
        'TB0'
      'FROM BEM         B,'
      '     GRUPO       G,'
      '     CLASSEDEBEM CB,'
      '     CONJUNTO    C,'
      '     LOCALIZACAO L,'
      '     CENTCUST    CC,'
      '     PESSOA      PR,'
      '     PESSOA      PF,'
      '     SITUACAO    S,'
      
        '     (SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLD' +
        'BEM,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCB1.DEPLANC, SCB1.REAVDEPLANC,   SCB1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCB1.CMDEP,   SCB1.REAVCMDEP,     SCB1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      ''
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM) SB'
      ''
      'WHERE B.DATAINICIODEP <= :DATASLD'
      '  AND G.FLGIMOVEL = 0'
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND B.IDBEM = SB.IDBEM'
      '  AND B.IDPESSOA = SB.IDPESSOA'
      '  AND SB.IDGRUPO = G.IDGRUPO'
      '  AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND SB.IDPESSOA = L.IDPESSOA'
      '  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND L.IDEMPRESA = CC.IDEMPRESA'
      '  AND SB.IDRESPONSAVEL = PR.IDPESSOA'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '  AND B.IDSITUACAO = S.IDSITUACAO'
      '  AND B.IDFORNSERV = PF.IDPESSOA(+)'
      'ORDER BY B.PLACA'
      ''
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = sqlSelBensCustomFormartParam
    ClientDataSet = cdsSelBensCustom
    Left = 233
    Top = 59
  end
  object cdsSelBensCustom: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 46
  end
  object dsSelBensCustom: TwwDataSource
    DataSet = cdsSelBensCustom
    Left = 233
    Top = 34
  end
  object ppSelBensCustom: TppBDEPipeline
    DataSource = dsSelBensCustom
    AutoCreateFields = False
    UserName = 'ppSelBensCustom'
    Left = 232
    Top = 21
    object ppSelBensCustomppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppSelBensCustomppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppSelBensCustomppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppSelBensCustomppField4: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 3
    end
    object ppSelBensCustomppField5: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppSelBensCustomppField6: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppSelBensCustomppField7: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 6
    end
    object ppSelBensCustomppField8: TppField
      FieldAlias = 'COMPLNOTA'
      FieldName = 'COMPLNOTA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 7
    end
    object ppSelBensCustomppField9: TppField
      FieldAlias = 'NUMSERIE'
      FieldName = 'NUMSERIE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppSelBensCustomppField10: TppField
      FieldAlias = 'REGISTRO'
      FieldName = 'REGISTRO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppSelBensCustomppField11: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object ppSelBensCustomppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppSelBensCustomppField13: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 12
    end
    object ppSelBensCustomppField14: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object ppSelBensCustomppField15: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppSelBensCustomppField16: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppSelBensCustomppField17: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 16
    end
    object ppSelBensCustomppField18: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object ppSelBensCustomppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppSelBensCustomppField20: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object ppSelBensCustomppField21: TppField
      FieldAlias = 'IDOPCIONAL'
      FieldName = 'IDOPCIONAL'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppSelBensCustomppField22: TppField
      FieldAlias = 'DESCCLASSE'
      FieldName = 'DESCCLASSE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object ppSelBensCustomppField23: TppField
      FieldAlias = 'DESCSITUACAO'
      FieldName = 'DESCSITUACAO'
      FieldLength = 45
      DisplayWidth = 45
      Position = 22
    end
    object ppSelBensCustomppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG0'
      FieldName = 'VALORG0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppSelBensCustomppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM0'
      FieldName = 'CMBEM0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppSelBensCustomppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC0'
      FieldName = 'DEPLANC0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppSelBensCustomppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP0'
      FieldName = 'CMDEP0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppSelBensCustomppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
  end
  object rpSelBensCustom: TppReport
    AutoStop = False
    DataPipeline = ppSelBensCustom
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
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object lblTituloRelat: TppLabel
        UserName = 'lblTituloRelat'
        Caption = 'Relatório Customizável de Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 66411
        mmTop = 7673
        mmWidth = 64558
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 19315
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
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 20108
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 20108
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Saldo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 20108
        mmWidth = 21431
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'ppLabel121'
        Caption = 'Sub-Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'PLACA'
        DataPipeline = ppSelBensCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALCTB0'
        DataPipeline = ppSelBensCustom
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DESBEM'
        DataPipeline = ppSelBensCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 0
        mmWidth = 148432
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 74877
        mmTop = 1588
        mmWidth = 71702
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
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
        mmWidth = 55298
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'Line45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'ppDBCalc7'
        DataField = 'VALCTB0'
        DataPipeline = ppSelBensCustom
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 1058
        mmWidth = 16933
        BandType = 7
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 7
      end
    end
  end
end
