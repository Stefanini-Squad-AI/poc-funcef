inherited RptCAFMovPatBem: TRptCAFMovPatBem
  Left = 255
  Top = 230
  Width = 292
  Height = 160
  Caption = 'Movimento Patrimonial por Bem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimento Patrimonial por Bem'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
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
        Caption = 'Bem'
        Controle = tcMontaSelect
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDBEM,PLACA, DESBEM'
          'FROM BEM'
          'ORDER BY PLACA')
        LookupSettings.Chave = 'IDBEM'
        LookupSettings.Display = 'PLACA|DESBEM'
        LookupSettings.Descricao = 'Placa|Descrição'
        LookupSettings.Tamanho = '10|50'
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
        MontaSelect = MSBem
        Width = 0
      end
      item
        Caption = 'Movimentação'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCTIPOMOVIMENTACAO,IDTIPOMOVIMENTACAO'
          'FROM TIPOMOVIMENTACAO'
          'ORDER BY DESCTIPOMOVIMENTACAO')
        LookupSettings.Chave = 'IDTIPOMOVIMENTACAO'
        LookupSettings.Display = 'DESCTIPOMOVIMENTACAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '50'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 197
    FormWidth = 480
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMovBem
    LabelEmpresa = ppLabel38
    LabelSistema = ppLabel39
  end
  object sqlMovBem: TCMSqlParams
    SQL.Strings = (
      'SELECT B.PLACA,'
      '       B.IDBEM,'
      '       B.DESBEM AS DESCBEM,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       HM.DATAMOVIMENTACAO,'
      '       TM.DESCTIPOMOVIMENTACAO, HM.IDMOVIMENTACAO,'
      '       NVL(VM.VALOR, 0) AS VALOFI,'
      '       (NVL(SCB.VALORG,0)         + NVL(SCB.CMBEM,0) -'
      '        NVL(SCB.DEPLANC,0)        - NVL(SCB.CMDEP,0) +'
      '        NVL(SCB.REAVVALORG,0)     + NVL(SCB.REAVCMBEM,0) -'
      '        NVL(SCB.REAVDEPLANC,0)    - NVL(SCB.REAVCMDEP,0) +'
      '        NVL(SCB.ULTREAVVALORG,0)  + NVL(SCB.ULTREAVCMBEM,0) -'
      
        '        NVL(SCB.ULTREAVDEPLANC,0) - NVL(SCB.ULTREAVCMDEP,0)) AS ' +
        'VALCTB'
      'FROM BEM B,'
      '     PLANOGRUPO PG,'
      '     GRUPO G,'
      '     HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM,'
      '     TIPOMOVIMENTACAO TM,'
      ''
      
        '     (SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLD' +
        'BEM, SCB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP SCD1'
      '      WHERE SCB1."IDBEM" >= -1E38'
      '        AND SCB1.IDPESSOA = :IDPESSOA'
      ''
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDPESSOA = :IDPESSOA'
      '        AND SCD1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCB1.DATASLDBEM >= :PDATAMOVINI'
      '        AND SCB1.DATASLDBEM <= :PDATAMOVFIM'
      '        AND SCD1.DATASLDBEM >= :PDATAMOVINI'
      '        AND SCD1.DATASLDBEM <= :PDATAMOVFIM'
      '        AND SCD1.IDBEM = SCB1.IDBEM'
      '        AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '        AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '        AND SCD1.DATASLDBEM = SCB1.DATASLDBEM ) SCB'
      ''
      
        'WHERE (HM.DATAMOVIMENTACAO >= :PDATAMOVINI AND HM.DATAMOVIMENTAC' +
        'AO <= :PDATAMOVFIM)'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND (VM.MOECODIGO = :MOECODIGO OR VM.MOECODIGO IS NULL)'
      
        '  AND (VM.IDTAXADEP = :IDTAXADEP OR VM.IDTAXADEP = 0 OR VM.IDTAX' +
        'ADEP IS NULL)'
      ''
      ''
      ''
      '  AND B.IDBEM = HM.IDBEM'
      '  AND B.IDPESSOA = HM.IDPESSOA'
      '  AND HM.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      '  AND HM.IDBEM = SCB.IDBEM(+)'
      '  AND HM.IDPESSOA = SCB.IDPESSOA(+)'
      '  AND HM.DATAMOVIMENTACAO = SCB.DATASLDBEM(+)'
      '  AND SCB.IDGRUPO = PG.IDGRUPO(+)'
      '  AND PG.IDGRUPO = G.IDGRUPO(+)'
      
        'ORDER BY G.CLASSE, B.PLACA, HM.IDBEM, HM.DATAMOVIMENTACAO, HM.ID' +
        'MOVIMENTACAO'
      ''
      ''
      ''
      '')
    ClientDataSet = cdsMovBem
    Left = 215
    Top = 64
  end
  object cdsMovBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 50
  end
  object dsMovBem: TwwDataSource
    DataSet = cdsMovBem
    Left = 215
    Top = 36
  end
  object ppMovBem: TppBDEPipeline
    DataSource = dsMovBem
    UserName = 'MovBem'
    Left = 214
    Top = 23
  end
  object rpMovBem: TppReport
    AutoStop = False
    DataPipeline = ppMovBem
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
    Left = 214
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Extrato de Movimentação dos Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 62971
        mmTop = 8731
        mmWidth = 71438
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'ppLabel38'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpMovBemLabel6: TppLabel
        UserName = 'rpMovBemLabel6'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 56621
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rpMovBemLabel7: TppLabel
        UserName = 'rpMovBemLabel7'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel8: TppLabel
        UserName = 'rpMovBemLabel8'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel9: TppLabel
        UserName = 'rpMovBemLabel9'
        Caption = 'até'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 111919
        mmTop = 14817
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpMovBemDBText4: TppDBText
        UserName = 'rpMovBemDBText4'
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object rpMovBemDBText5: TppDBText
        UserName = 'rpMovBemDBText5'
        DataField = 'DESCTIPOMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 0
        mmWidth = 98690
        BandType = 4
      end
      object rpMovBemDBText6: TppDBText
        UserName = 'rpMovBemDBText6'
        DataField = 'VALOFI'
        DataPipeline = ppMovBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VALCTB'
        DataPipeline = ppMovBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171186
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
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
        mmWidth = 57679
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
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
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 1323
        mmWidth = 50800
        BandType = 8
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppMovBem
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpMovBemLabel1: TppLabel
          UserName = 'rpMovBemLabel1'
          Caption = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemDBText1: TppDBText
          UserName = 'rpMovBemDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 13229
          mmTop = 0
          mmWidth = 183092
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpMovBemGroup1: TppGroup
      BreakName = 'IDBEM'
      DataPipeline = ppMovBem
      UserName = 'rpMovBemGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMovBemGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpMovBemLine2: TppLine
          UserName = 'rpMovBemLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemLabel2: TppLabel
          UserName = 'rpMovBemLabel2'
          Caption = 'Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemCalc1: TppVariable
          OnPrint = rpMovBemCalc1Print
          UserName = 'rpMovBemCalc1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 8202
          mmTop = 794
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemDBText2: TppDBText
          UserName = 'rpMovBemDBText2'
          DataField = 'DESCBEM'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 40481
          mmTop = 794
          mmWidth = 155311
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel5: TppLabel
          UserName = 'rpMovBemLabel5'
          Caption = 'Valor Movimentado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 6879
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Saldo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 171186
          mmTop = 6879
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel4: TppLabel
          UserName = 'rpMovBemLabel4'
          Caption = 'Tipo do Movimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 26723
          mmTop = 6879
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel3: TppLabel
          UserName = 'rpMovBemLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6879
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLine1: TppLine
          UserName = 'rpMovBemLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpMovBemGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
    end
  end
  object MSBem: TMontaSelect
    Tag = 3
    Template.IdConsulta = 0
    Caption = 'Selecione o Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.PLACA'
      'BEM.IDBEM'
      'BEM.IDPESSOA')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 24
    Top = 64
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
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
    Left = 104
    Top = 64
  end
end
