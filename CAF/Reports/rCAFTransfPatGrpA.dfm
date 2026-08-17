inherited RptCAFTransfPatGrpA: TRptCAFTransfPatGrpA
  Left = 282
  Top = 211
  Width = 301
  Height = 164
  Caption = 'Transferência Patrimonial por Grupo - Analítico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Transferência Patrimonial por Grupo - Analítico'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = ' Bens '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Investimentos'
          'Ambos')
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
        Caption = 'Data Inicial'
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
        Caption = 'Data Final'
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
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '40|15'
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
    Formheight = 191
    FormWidth = 480
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpTransfPatGrpA
    LabelEmpresa = LblEmpresa
    LabelSistema = LBLSISTEMA
  end
  object sqlTransfPatGrpA: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SC.IDGRUPO, HM.IDGRUPANT, G.CLASSE AS CODGRUPO, G.NOME AS' +
        ' NOMEGRUPO,'
      '       GA.CLASSE AS CODGRUPOANT, GA.NOME AS NOMEGRUPOANT,'
      '       B.PLACA, B.DESBEM, HM.DATAMOVIMENTACAO,'
      
        '       (SC.VALORG + SC.REAVVALORG + SC.ULTREAVVALORG) AS VALORG1' +
        ','
      '       (SC.CMBEM + SC.REAVCMBEM + SC.ULTREAVCMBEM) AS CMBEM1,'
      
        '       (SC.DEPLANC + SC.REAVDEPLANC + SC.ULTREAVDEPLANC - NVL(FE' +
        'C.VALOR,0)) AS DEPLANC1,'
      '       (SC.CMDEP + SC.REAVCMDEP + SC.ULTREAVCMDEP) AS CMDEP1'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      
        '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
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
      '           SLDCTBBEMXDEP  SCD1'
      '      WHERE SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCB1.DATASLDBEM >= :DATAINI'
      '        AND SCB1.DATASLDBEM <= :DATAFIM'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SC,'
      '     GRUPO GA,'
      '     GRUPO G,'
      
        '     (SELECT HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO, SUM(NVL' +
        '(VM.VALOR,0)) AS VALOR'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           VLRHISTMOVBEM VM'
      '      WHERE HM.DATAMOVIMENTACAO >= :DATAINI'
      '        AND HM.DATAMOVIMENTACAO <= :DATAFIM'
      
        '        AND (HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 18 OR HM.IDTIPOMOVIMENTACAO = 35)'
      '        AND HM.TIPDEPPRORATA = 2'
      '        AND HM.IDPESSOA  = :IDPESSOA'
      '        AND VM.MOECODIGO = :MOECODIGO'
      '        AND VM.IDTAXADEP = :IDTAXADEP'
      '        AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+)'
      '      GROUP BY HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO) FEC'
      ''
      'WHERE HM.DATAMOVIMENTACAO >= :DATAINI'
      '  AND HM.DATAMOVIMENTACAO <= :DATAFIM'
      '  AND HM.IDTIPOMOVIMENTACAO = 05'
      ''
      ''
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = SC.IDBEM'
      '  AND HM.IDPESSOA = SC.IDPESSOA'
      '  AND HM.DATAMOVIMENTACAO = SC.DATASLDBEM'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND SC.IDGRUPO = G.IDGRUPO'
      '  AND HM.IDGRUPANT = GA.IDGRUPO'
      '  AND HM.IDBEM = FEC.IDBEM(+)'
      '  AND HM.IDPESSOA = FEC.IDPESSOA(+)'
      '  AND HM.DATAMOVIMENTACAO = FEC.DATAMOVIMENTACAO(+)'
      'ORDER BY SC.IDGRUPO, HM.IDGRUPANT'
      ''
      ' ')
    ClientDataSet = cdsTransfPatGrpA
    Left = 223
    Top = 57
  end
  object cdsTransfPatGrpA: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 44
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO  = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 96
    Top = 64
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
    Left = 24
    Top = 64
  end
  object dsTransfPatGrpA: TwwDataSource
    DataSet = cdsTransfPatGrpA
    Left = 223
    Top = 32
  end
  object ppTransfPatGrpA: TppBDEPipeline
    DataSource = dsTransfPatGrpA
    UserName = 'ppTransfPatGrpA'
    Left = 223
    Top = 20
  end
  object rpTransfPatGrpA: TppReport
    AutoStop = False
    DataPipeline = ppTransfPatGrpA
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
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
        mmLeft = 132292
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 106627
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 139436
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'ppLabel108'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 165365
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161925
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Transferência Patrimonial por Grupos - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 86254
        mmTop = 7673
        mmWidth = 120121
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      BeforePrint = ppDetailBand13BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        UserName = 'ppDBText32'
        DataField = 'PLACA'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        DataField = 'DESBEM'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 110861
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText41'
        BlankWhenZero = True
        DataField = 'VALORG1'
        DataPipeline = ppTransfPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        BlankWhenZero = True
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        BlankWhenZero = True
        DataField = 'CMBEM1'
        DataPipeline = ppTransfPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 185209
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        BlankWhenZero = True
        DataField = 'DEPLANC1'
        DataPipeline = ppTransfPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 219075
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        BlankWhenZero = True
        DataField = 'CMDEP1'
        DataPipeline = ppTransfPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 252678
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1852
        mmWidth = 56621
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc19'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 126736
        mmTop = 1852
        mmWidth = 39158
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'ppCalc201'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 1852
        mmWidth = 27517
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODGRUPO'
      DataPipeline = ppTransfPatGrpA
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel104: TppLabel
          UserName = 'Label104'
          Caption = 'Grupo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText44'
          DataField = 'CODGRUPO'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26194
          mmTop = 265
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          UserName = 'DBText45'
          DataField = 'NOMEGRUPO'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 45244
          mmTop = 265
          mmWidth = 150284
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel113: TppLabel
          UserName = 'Label113'
          Caption = 'Total dos Valores Recebidos pelo Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 68792
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'ppDBCalc6'
          DataField = 'VALORG1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 151342
          mmTop = 794
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 69586
          mmTop = 794
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'CMBEM1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 185209
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'DEPLANC1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 219075
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          DataField = 'CMDEP1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 252678
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'CODGRUPOANT'
      DataPipeline = ppTransfPatGrpA
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLine40: TppLine
          UserName = 'ppLine19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284427
          BandType = 3
          GroupNo = 1
        end
        object ppLabel100: TppLabel
          UserName = 'ppLabel71'
          Caption = 'Placa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6085
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel101: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 6085
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel102: TppLabel
          UserName = 'Label102'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 135996
          mmTop = 6085
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel111: TppLabel
          UserName = 'Label87'
          Caption = 'Custo Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 157163
          mmTop = 6350
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppLine41: TppLine
          UserName = 'rpMovPatGrpLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 10848
          mmWidth = 284427
          BandType = 3
          GroupNo = 1
        end
        object ppLabel103: TppLabel
          UserName = 'ppLabel103'
          Caption = 'Grupo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppDBText40: TppDBText
          UserName = 'ppDBText40'
          DataField = 'CODGRUPOANT'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26194
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppDBText43: TppDBText
          UserName = 'DBText401'
          DataField = 'NOMEGRUPOANT'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 45244
          mmTop = 794
          mmWidth = 150284
          BandType = 3
          GroupNo = 1
        end
        object ppLabel78: TppLabel
          UserName = 'Label78'
          Caption = 'Corr. Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 192352
          mmTop = 6350
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = 'Depreciação Acum.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 220398
          mmTop = 6350
          mmWidth = 29898
          BandType = 3
          GroupNo = 1
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          Caption = 'Corr. Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 259821
          mmTop = 6350
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel105: TppLabel
          UserName = 'Label105'
          Caption = 'Soma dos Valores Transferidos do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 65352
          BandType = 5
          GroupNo = 1
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 284427
          BandType = 5
          GroupNo = 1
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5556
          mmWidth = 284427
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'VALORG1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          ShiftWithParent = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 66146
          mmTop = 1058
          mmWidth = 24871
          BandType = 5
          GroupNo = 1
        end
        object ppLabel115: TppLabel
          UserName = 'ppLabel115'
          ShiftWithParent = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 114565
          mmTop = 1058
          mmWidth = 35190
          BandType = 5
          GroupNo = 1
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          ShiftWithParent = True
          Caption = ' para o Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 91546
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'CMBEM1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185209
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'DEPLANC1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 219075
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'CMDEP1'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 252678
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
