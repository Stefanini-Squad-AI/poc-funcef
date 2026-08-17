inherited RptExtMovSint: TRptExtMovSint
  Left = 301
  Top = 152
  Width = 282
  Height = 149
  Caption = 'Extrato de Movimentação Sintético'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato de Movimentação Sintético'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CodAlmoxarifado'
        LookupSettings.Display = 'DescAlmox'
        LookupSettings.Descricao = 'DescAlmox'
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
        Name = 'DataInicial'
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
        Name = 'DataFinal'
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
        Caption = 'Grupo de Produtos'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCGRUPOPROD, CODGRUPOPROD'
          'FROM GRUPPROD'
          'WHERE STATUSGRUPO = '#39'A'#39
          'ORDER BY DESCGRUPOPROD')
        LookupSettings.Chave = 'CODGRUPOPROD'
        LookupSettings.Display = 'DESCGRUPOPROD'
        LookupSettings.Descricao = 'DESCGRUPOPROD'
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
        Name = 'Grupo de Produtos'
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
        Caption = 'Imprimir somente itens com movimentação'
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
    Formheight = 200
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptExtMovSint
    LabelEmpresa = LblEmpresa
    LabelSistema = LbSistema
    Left = 84
  end
  object SqlParExtMovSint: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '       G.CODGRUPOPROD,'
      '       G.DESCGRUPOPROD,'
      '       A.CODARTIGO,'
      '       P.DESCPROD,'
      '       P.CODMEDCUSTO,'
      '       MOV.QTDENTRADA,'
      '       MOV.VLRENTRADA,'
      '       MOV.QTDSAIDA,'
      '       MOV.VLRSAIDA,'
      '       ANT.QTDSALDOANT,'
      '       ANT.VLRSALDOANT,'
      '       ATU.QTDSALDOATU,'
      '       ATU.VLRSALDOATU'
      'FROM PRODUTO P,'
      '     ARTIGO A,'
      '     GRUPPROD G,'
      '     (SELECT M.CODARTIGO,'
      '            ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VLRSALDOANT,'
      '            ( M.SALDOQTDEMOV ) AS QTDSALDOANT'
      '      FROM MOVIMENT M,'
      '          (SELECT M.CODARTIGO,'
      '                  MAX( M.IDMOV ) AS MAXIDMOV'
      '           FROM MOVIMENT M,'
      '               ( SELECT M.CODARTIGO, MAX( M.DATAMOV ) AS DATAMOV'
      '                   FROM MOVIMENT M'
      '                 WHERE ( M.IDPESSOA = :IDEMPRESA )'
      '                   AND ( M.CODALMOXARIFADO = :ALMOX )'
      '                   AND ( M.DATAMOV < :DATAINI )'
      '                 GROUP BY M.CODARTIGO) SUB'
      '           WHERE ( M.DATAMOV = SUB.DATAMOV )'
      '             AND ( M.CODALMOXARIFADO = :ALMOX )'
      '             AND ( M.CODARTIGO = SUB.CODARTIGO)'
      '           GROUP BY M.CODARTIGO) AUX'
      '      WHERE ( M.IDMOV = AUX.MAXIDMOV )'
      '        AND ( M.CODALMOXARIFADO = :ALMOX )'
      '     ) ANT,'
      '     (SELECT M.CODARTIGO,'
      '            ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VLRSALDOATU,'
      '            ( M.SALDOQTDEMOV ) AS QTDSALDOATU'
      '      FROM MOVIMENT M,'
      '          (SELECT M.CODARTIGO,'
      '                  MAX( M.IDMOV ) AS MAXIDMOV'
      '           FROM MOVIMENT M,'
      '               ( SELECT M.CODARTIGO, MAX( M.DATAMOV ) AS DATAMOV'
      '                   FROM MOVIMENT M'
      '                 WHERE ( M.IDPESSOA = :IDEMPRESA )'
      '                   AND ( M.CODALMOXARIFADO = :ALMOX )'
      '                   AND ( M.DATAMOV <= :DATAFIM )'
      '                 GROUP BY M.CODARTIGO) SUB'
      '           WHERE ( M.DATAMOV = SUB.DATAMOV )'
      '             AND ( M.CODALMOXARIFADO = :ALMOX )'
      '             AND ( M.CODARTIGO = SUB.CODARTIGO)'
      '           GROUP BY M.CODARTIGO) AUX'
      '      WHERE ( M.IDMOV = AUX.MAXIDMOV'
      '        AND ( M.CODALMOXARIFADO = :ALMOX ) )'
      '     ) ATU,'
      '     (SELECT M.CODARTIGO,'
      
        '             SUM( DECODE( SIGN( M.VALORMOV ),  1, M.VALORMOV, 0 ' +
        ') ) AS VLRENTRADA,'
      
        '             SUM( DECODE( SIGN( M.VALORMOV ), -1, (M.VALORMOV*-1' +
        '), 0 ) ) AS VLRSAIDA,'
      
        '             SUM( DECODE( SIGN( M.QTDEMOV ),  1, M.QTDEMOV, 0 ) ' +
        ') AS QTDENTRADA,'
      
        '             SUM( DECODE( SIGN( M.QTDEMOV ), -1, (M.QTDEMOV*-1),' +
        ' 0 ) ) AS QTDSAIDA'
      '      FROM MOVIMENT M'
      '      WHERE ( M.IDPESSOA = :IDEMPRESA )'
      '        AND ( M.CODALMOXARIFADO = :ALMOX )'
      '        AND ( M.DATAMOV >= :DATAINI )'
      '        AND ( M.DATAMOV <= :DATAFIM )'
      '      GROUP BY M.CODARTIGO) MOV'
      'WHERE'
      '      ( A.CODPRODUTO      = P.CODPRODUTO )'
      '  AND ( P.CODGRUPOPROD    = :GRUPO )'
      '  AND ( A.CODARTIGO       = MOV.CODARTIGO(+) )'
      '  AND ( A.CODARTIGO       = ANT.CODARTIGO(+) )'
      '  AND ( A.CODARTIGO       = ATU.CODARTIGO )'
      '  AND ( P.CODGRUPOPROD    = G.CODGRUPOPROD )'
      '  AND (:CONDICAO)'
      'ORDER BY CODGRUPOPROD, DESCPROD'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    OnFormartParam = SqlParExtMovSintFormartParam
    ClientDataSet = CdsExtMovSint
    Left = 200
    Top = 8
  end
  object CdsExtMovSint: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
  object dsExtMovSint: TwwDataSource
    DataSet = CdsExtMovSint
    Left = 140
    Top = 60
  end
  object bdeExtMovSint: TppBDEPipeline
    DataSource = dsExtMovSint
    UserName = 'bdeExtMovSint'
    Left = 84
    Top = 60
  end
  object RptExtMovSint: TppReport
    AutoStop = False
    DataPipeline = bdeExtMovSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 20
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 270934
        mmTop = 27517
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'ppLabel59'
        Caption = 'Extrato de Movimentação Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70379
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
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object RptExtMovSintLine1: TppLine
        UserName = 'RptExtMovSintLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34660
        mmWidth = 284300
        BandType = 0
      end
      object RptExtMovSintLabel1: TppLabel
        UserName = 'RptExtMovSintLabel1'
        Caption = 'Almoxarifado : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 22490
        BandType = 0
      end
      object lbAlmox: TppLabel
        UserName = 'lbAlmox'
        Caption = 'Almoxarifado Central'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 22225
        mmWidth = 30163
        BandType = 0
      end
      object RptExtMovSintLine3: TppLine
        UserName = 'RptExtMovSintLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object RptExtMovSintLabel2: TppLabel
        UserName = 'RptExtMovSintLabel2'
        Caption = 'Artigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 29898
        mmWidth = 8202
        BandType = 0
      end
      object RptExtMovSintLine4: TppLine
        UserName = 'RptExtMovSintLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 234157
        mmTop = 27517
        mmWidth = 13229
        BandType = 0
      end
      object RptExtMovSintLabel3: TppLabel
        UserName = 'RptExtMovSintLabel3'
        Caption = '  Quantidades  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 25400
        mmWidth = 21696
        BandType = 0
      end
      object RptExtMovSintLabel4: TppLabel
        UserName = 'RptExtMovSintLabel4'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 195792
        mmTop = 30427
        mmWidth = 11906
        BandType = 0
      end
      object RptExtMovSintLabel5: TppLabel
        UserName = 'RptExtMovSintLabel5'
        Caption = 'Saídas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 222780
        mmTop = 30427
        mmWidth = 8996
        BandType = 0
      end
      object LbPeriodo: TppLabel
        UserName = 'LbPeriodo'
        Caption = 'De 01/01/1999 a 01/10/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 15081
        mmWidth = 41275
        BandType = 0
      end
      object RptExtMovSintLabel7: TppLabel
        UserName = 'RptExtMovSintLabel7'
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 76465
        mmTop = 30956
        mmWidth = 6879
        BandType = 0
      end
      object RptExtMovSintLine5: TppLine
        UserName = 'RptExtMovSintLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 184944
        mmTop = 27517
        mmWidth = 13229
        BandType = 0
      end
      object RptExtMovSintLabel8: TppLabel
        UserName = 'RptExtMovSintLabel8'
        Caption = '  Valores  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3704
        mmLeft = 202407
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object RptExtMovSintLabel9: TppLabel
        UserName = 'RptExtMovSintLabel9'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 30427
        mmWidth = 11906
        BandType = 0
      end
      object RptExtMovSintLabel10: TppLabel
        UserName = 'RptExtMovSintLabel10'
        Caption = 'Saídas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 30692
        mmWidth = 8996
        BandType = 0
      end
      object RptExtMovSintLabel11: TppLabel
        UserName = 'RptExtMovSintLabel11'
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 252413
        mmTop = 30692
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel224: TppLabel
        UserName = 'Label224'
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 100806
        mmTop = 30163
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel225: TppLabel
        UserName = 'Label225'
        Caption = '  Saldo Anterior  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 25135
        mmWidth = 23813
        BandType = 0
      end
      object ppLine99: TppLine
        UserName = 'Line99'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 84402
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
      object ppLine100: TppLine
        UserName = 'Line100'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7408
        mmLeft = 133615
        mmTop = 27517
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel226: TppLabel
        UserName = 'Label226'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 30163
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = '  Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3704
        mmLeft = 248973
        mmTop = 25929
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 275432
        mmTop = 30692
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object RptExtMovSintDBText3: TppDBText
        UserName = 'RptExtMovSintDBText3'
        DataField = 'CODARTIGO'
        DataPipeline = bdeExtMovSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object RptExtMovSintDBText4: TppDBText
        UserName = 'RptExtMovSintDBText4'
        DataField = 'DESCPROD'
        DataPipeline = bdeExtMovSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 265
        mmWidth = 51329
        BandType = 4
      end
      object RptExtMovSintDBText5: TppDBText
        UserName = 'RptExtMovSintDBText5'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdeExtMovSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 265
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'DBText95'
        DataField = 'QTDSALDOANT'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        DataField = 'VLRSALDOANT'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'QTDSALDOATU'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235480
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object RptExtMovSintDBText6: TppDBText
        UserName = 'RptExtMovSintDBText6'
        DataField = 'VLRSALDOATU'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259292
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLRSAIDA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 208492
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRENTRADA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'QTDSAIDA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDENTRADA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object LbSistema: TppLabel
        UserName = 'LbSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 23019
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
        mmLeft = 117475
        mmTop = 529
        mmWidth = 49213
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
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
        mmLeft = 245798
        mmTop = 265
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptExtMovSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptExtMovSintLine6: TppLine
        UserName = 'RptExtMovSintLine6'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 75406
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VLRSALDOANT'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 108744
        mmTop = 2646
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRENTRADA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 184415
        mmTop = 2646
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLRSAIDA'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 208492
        mmTop = 2646
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLRSALDOATU'
        DataPipeline = bdeExtMovSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 259292
        mmTop = 2646
        mmWidth = 23283
        BandType = 7
      end
    end
    object RptExtMovSintGroup1: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdeExtMovSint
      UserName = 'RptExtMovSintGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptExtMovSintGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object RptExtMovSintLine2: TppLine
          UserName = 'RptExtMovSintLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6615
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovSintDBText1: TppDBText
          UserName = 'RptExtMovSintDBText1'
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeExtMovSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1323
          mmTop = 2381
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovSintDBText2: TppDBText
          UserName = 'RptExtMovSintDBText2'
          AutoSize = True
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeExtMovSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 2381
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
      end
      object RptExtMovSintGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptExtMovSintDBCalc3: TppDBCalc
          UserName = 'RptExtMovSintDBCalc3'
          DataField = 'VLRSAIDA'
          DataPipeline = bdeExtMovSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptExtMovSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 208492
          mmTop = 1058
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object RptExtMovSintDBCalc4: TppDBCalc
          UserName = 'RptExtMovSintDBCalc4'
          DataField = 'VLRENTRADA'
          DataPipeline = bdeExtMovSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptExtMovSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 184415
          mmTop = 1058
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRSALDOATU'
          DataPipeline = bdeExtMovSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptExtMovSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 259292
          mmTop = 1058
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRSALDOANT'
          DataPipeline = bdeExtMovSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptExtMovSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 108744
          mmTop = 1058
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total do Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 75406
          mmTop = 1058
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
