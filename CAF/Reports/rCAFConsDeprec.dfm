inherited RptCAFConsDeprec: TRptCAFConsDeprec
  Left = 264
  Top = 96
  Width = 298
  Height = 294
  Caption = 'Consistencia de Depreciação Acumulada'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Consistencia de Depreciação Acumulada'
    DataBaseName = 'Basedados'
    Params = <
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
        LookupSettings.Tamanho = '40|8'
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
      end
      item
        Caption = ' Bens '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Invest. Imobiliários'
          'Todos')
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
        Caption = ' Processar '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Não Depreciáveis'
          'Parcialmente Depreciados'
          'Totalmente Depreciados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 56
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
    Formheight = 202
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConsDeprec
    LabelEmpresa = ppLabel70
    LabelSistema = ppLabel81
  end
  object cdsBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 144
  end
  object sqlBens: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM, B.DATAINICIODEP, B.PLACA, B.DESBEM,'
      
        '       BM.VALORG, BM.CMBEM, BD.DEPLANC, BD.CMDEP, BD.TAXADEP, BD' +
        '.DATAULTDEP, BD.FLGDEPREC'
      'FROM BEM B,'
      '     BEMXMOEDA BM,'
      '     BEMXDEP BD,'
      '     GRUPO G'
      'WHERE B.IDPESSOA = :IDPESSOA'
      '  AND BM.MOECODIGO = :MOECODIGO'
      '  AND BM.IDPESSOA = :IDPESSOA'
      '  AND BD.IDBEMXDEP = :IDTAXADEP'
      '  AND BD.MOECODIGO = :MOECODIGO'
      '  AND BD.IDPESSOA = :IDPESSOA'
      '  AND (BD.FLGDEPREC = :PDEPREC OR BD.FLGDEPREC = :PNOTDEPREC)'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      ''
      ''
      ''
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDBEM = BM.IDBEM'
      '  AND B.IDPESSOA = BM.IDPESSOA'
      '  AND BM.IDBEM = BD.IDBEM'
      '  AND BM.IDPESSOA = BD.IDPESSOA'
      'ORDER BY B.PLACA'
      '')
    ClientDataSet = cdsBens
    Left = 40
    Top = 128
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT MASCCODGRUPO, SISTEMAS, FLGTIPOCALC, MOEDAOFICIAL    '
      'FROM PARAMETROSCAFMANUT'
      'WHERE IDPESSOA = :PIDPESSOA'
      ''
      ' ')
    ClientDataSet = cdsParamCaf
    Left = 40
    Top = 64
  end
  object cdsAcrescimos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 144
  end
  object sqlAcrescimos: TCMSqlParams
    SQL.Strings = (
      'SELECT A.IDACRESCIMO, A.DATAACRESCIMO, B.PLACA, B.DESBEM,'
      
        '       AM.VALORG, AM.CMBEM, AD.DEPLANC, AD.CMDEP, AD.TAXADEP, AD' +
        '.DATAULTDEP, AD.FLGDEPREC'
      'FROM ACRESCIMOVALOR A,'
      '     ACRESCVALORXMOEDA AM,'
      '     ACRESCVALORXDEP AD,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE A.IDBEM = :IDBEM'
      '  AND A.IDPESSOA = :IDPESSOA'
      '  AND AM.MOECODIGO = :MOECODIGO'
      '  AND AD.IDACRESCIMOXDEP = :IDTAXADEP'
      '  AND AD.MOECODIGO = :MOECODIGO'
      '  AND (AD.FLGDEPREC = :PDEPREC OR AD.FLGDEPREC = :PNOTDEPREC)'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      ''
      ''
      ''
      '  AND A.IDACRESCIMO = AM.IDACRESCIMO'
      '  AND AM.IDACRESCIMO = AD.IDACRESCIMO'
      '  AND A.IDBEM = B.IDBEM'
      '  AND A.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      'ORDER BY B.PLACA, A.IDACRESCIMO'
      '')
    ClientDataSet = cdsAcrescimos
    Left = 224
    Top = 128
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
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
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 128
    Top = 64
  end
  object sqlConsDeprec: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACA,'
      '       DESBEM,'
      '       ('#39'Reavaliação'#39') AS TIPO,'
      '       TO_DATE('#39'01/01/1980'#39','#39'DD/MM/YYYY'#39') AS DATAINIDEP,'
      '       TO_DATE('#39'01/01/1980'#39','#39'DD/MM/YYYY'#39') AS DATAULTDEP,'
      '       (0.000000) AS TAXADEP,'
      '       (0.00) AS VALCUSTO,'
      '       (0.00) AS VALDEPREC,'
      '       (0.00) AS VALDEPCALC'
      'FROM BEM'
      'WHERE IDBEM IS NULL'
      ''
      '')
    ClientDataSet = cdsConsDeprec
    Left = 224
    Top = 63
  end
  object cdsConsDeprec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 49
  end
  object dsConsDeprec: TwwDataSource
    DataSet = cdsConsDeprec
    Left = 224
    Top = 35
  end
  object ppConsDeprec: TppBDEPipeline
    DataSource = dsConsDeprec
    UserName = 'ConsDeprec'
    Left = 224
    Top = 21
  end
  object rpConsDeprec: TppReport
    AutoStop = False
    DataPipeline = ppConsDeprec
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
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        Caption = 'Consistencia da Depreciação Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 94456
        mmTop = 7408
        mmWidth = 95250
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
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
        mmTop = 794
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        AutoSize = False
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 23019
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 23019
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        AutoSize = False
        Caption = 'Início Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 23019
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        AutoSize = False
        Caption = 'Última Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 23019
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        AutoSize = False
        Caption = 'Taxa Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 101865
        mmTop = 23019
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        AutoSize = False
        Caption = 'Custo Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 23019
        mmWidth = 24077
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Depreciação Corrigida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 23019
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = 'INVESTIMENTOS IMOBILIÁRIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 109538
        mmTop = 14023
        mmWidth = 65352
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Depreciação Calculada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 23019
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 215900
        mmTop = 23019
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rbdbeClasse: TppDBText
        UserName = 'rbdbeClasse'
        DataField = 'PLACA'
        DataPipeline = ppConsDeprec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        BlankWhenZero = True
        DataField = 'DATAINIDEP'
        DataPipeline = ppConsDeprec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 46302
        mmTop = 529
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'DATAULTDEP'
        DataPipeline = ppConsDeprec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 75671
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        BlankWhenZero = True
        DataField = 'TAXADEP'
        DataPipeline = ppConsDeprec
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 101865
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        BlankWhenZero = True
        DataField = 'VALCUSTO'
        DataPipeline = ppConsDeprec
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 127529
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        DataField = 'TIPO'
        DataPipeline = ppConsDeprec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 21431
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText502'
        BlankWhenZero = True
        DataField = 'VALDEPREC'
        DataPipeline = ppConsDeprec
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'VALDEPCALC'
        DataPipeline = ppConsDeprec
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 188119
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppConsDeprec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 215900
        mmTop = 529
        mmWidth = 67469
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
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
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 1852
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsReavaliacoes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 144
  end
  object sqlReavaliacoes: TCMSqlParams
    SQL.Strings = (
      'SELECT R.IDREAVALIACAO, R.DATAREAVALIACAO, B.PLACA, B.DESBEM,'
      
        '       RM.VALORG, RM.CMBEM, RD.DEPLANC, RD.CMDEP, RD.TAXADEP, RD' +
        '.DATAULTDEP, RD.FLGDEPREC'
      'FROM REAVALIACAO R,'
      '     REAVALXMOEDA RM,'
      '     REAVALXDEP RD,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE R.IDBEM = :IDBEM'
      '  AND R.IDPESSOA = :IDPESSOA'
      '  AND RM.MOECODIGO = :MOECODIGO'
      '  AND RD.IDREAVALXDEP = :IDTAXADEP'
      '  AND RD.MOECODIGO = :MOECODIGO'
      '  AND (RD.FLGDEPREC = :PDEPREC OR RD.FLGDEPREC = :PNOTDEPREC)'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      ''
      ''
      ''
      '  AND R.IDREAVALIACAO = RM.IDREAVALIACAO'
      '  AND RM.IDREAVALIACAO = RD.IDREAVALIACAO'
      '  AND R.IDBEM = B.IDBEM'
      '  AND R.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      'ORDER BY B.PLACA, R.IDREAVALIACAO'
      ''
      ''
      '')
    ClientDataSet = cdsReavaliacoes
    Left = 128
    Top = 128
  end
  object cdsDepAntBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 216
  end
  object sqlDepAntBens: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(VM.VALOR) AS DEPLANCINI'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 17 OR HM.IDTIPOMOVIMENTACAO = 21 ' +
        'OR'
      '       HM.IDTIPOMOVIMENTACAO = 43 OR HM.IDTIPOMOVIMENTACAO = 44)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.IDTAXADEP = :IDTAXADEP'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      '')
    ClientDataSet = cdsDepAntBens
    Left = 40
    Top = 200
  end
  object cdsDepAntReav: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 216
  end
  object sqlDepAntReav: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(VM.VALOR) AS DEPLANCINI'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDREAVALACRESC = :IDREAVALACRESC'
      '  AND HM.IDBEM = :IDBEM'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 33 OR HM.IDTIPOMOVIMENTACAO = 19 ' +
        'OR'
      '       HM.IDTIPOMOVIMENTACAO = 47 OR HM.IDTIPOMOVIMENTACAO = 48)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.IDTAXADEP = :IDTAXADEP'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      ''
      '')
    ClientDataSet = cdsDepAntReav
    Left = 128
    Top = 200
  end
end
