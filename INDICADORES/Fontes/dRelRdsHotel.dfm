inherited dtmRelRDSHotel: TdtmRelRDSHotel
  Left = 346
  Top = 298
  Width = 392
  Caption = 'dtmRelRDSHotel'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'idImovel'
        Controle = tcEdit
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
        Width = 0
      end
      item
        Caption = 'idGrpApuracao'
        Controle = tcEdit
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
        Width = 0
      end
      item
        Caption = 'dtIni'
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
        MostraComboCompara = True
        Required = False
        TextDefault = 'dtIni'
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
        Caption = 'bSeparador'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Width = 0
      end
      item
        Caption = 'bCorLinha'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Width = 0
      end
      item
        Caption = 'iCorLinha'
        Controle = tcEdit
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
        Width = 0
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppRdsHotel
  end
  inherited cds: TClientDataSet
    Data = {
      030400009619E0BD010000001800000021000000000003000000030408494449
      4D4F56454C080004000000000007494D4F4E4F4D450100490000000100055749
      445448020002003C000E414E4F434F4D504554454E4349410800040000000000
      0B4944494E44494341444F520800040000000000095449504F56414C4F520100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000100054F5244454D08000400000000000D49444752504150
      55524143414F08000400000000000A4453435F43435553544F01004900000001
      00055749445448020002003C000D4453435F494E44494341444F520100490000
      000100055749445448020002003C000D4453435F5449504F56414C4F52010049
      0000000100055749445448020002000A000D4453435F5449504F4C414E434101
      0049000000010005574944544802000200040005444941303101004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A0005444941303201004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00054449413033010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A000544494130340100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A000544494130
      3501004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000A0005444941303601004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0005
      444941303701004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002000A000553454D3031010049000000010005
      57494454480200020003000553454D3032010049000000010005574944544802
      00020003000553454D3033010049000000010005574944544802000200030005
      53454D303401004900000001000557494454480200020003000553454D303501
      004900000001000557494454480200020003000553454D303601004900000001
      000557494454480200020003000553454D303701004900000001000557494454
      4802000200030005564C523031080004000000000005564C5230320800040000
      00000005564C523033080004000000000005564C523034080004000000000005
      564C523035080004000000000005564C523036080004000000000005564C5230
      37080004000000000006564C524D4553080004000000000002000D4445464155
      4C545F4F524445520200820005000000020008000A0006000900044C43494404
      00010009080000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT IM.IDIMOVEL,'
      '       IM.IMONOME,'
      '       CCI.ANOCOMPETENCIA,'
      '       I.IDINDICADOR,'
      '       I.TIPOVALOR,'
      '       CCI.ORDEM,'
      '       GA.IDGRPAPURACAO,'
      '       GA.DESCRICAO AS DSC_CCUSTO,'
      '       I.DESCRICAO  AS DSC_INDICADOR, '
      
        '       DECODE(I.TIPOVALOR,'#39'R'#39','#39'RECEITAS'#39','#39'D'#39','#39'DESPESAS'#39','#39'DESEMPE' +
        'NHO'#39') AS DSC_TIPOVALOR, '
      
        '       DECODE(CCI.TIPOLANCA,'#39'P'#39','#39'PREV'#39','#39'REAL'#39') AS DSC_TIPOLANCA,' +
        ' '
      '       '#39'01/01/2002'#39' AS DIA01,'
      '       '#39'02/01/2002'#39' AS DIA02,'
      '       '#39'03/01/2002'#39' AS DIA03,'
      '       '#39'04/01/2002'#39' AS DIA04,'
      '       '#39'05/01/2002'#39' AS DIA05,'
      '       '#39'06/01/2002'#39' AS DIA06,'
      
        '       '#39'07/01/2002'#39' AS DIA07,                                   ' +
        '             '
      
        '       TO_CHAR(TO_DATE('#39'01/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM01' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'02/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM02' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'03/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM03' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'04/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM04' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'05/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM05' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'06/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM06' +
        ','
      
        '       TO_CHAR(TO_DATE('#39'07/01/2002'#39','#39'DD/MM/YYYY'#39'),'#39'DY'#39') AS SEM07' +
        ',                                                '
      '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01, '
      '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02, '
      '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03, '
      '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04, '
      '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05, '
      '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06, '
      '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07, '
      '       NVL(APMES.VLRAPURACAONUM,0) AS VLRMES '
      'FROM '
      '       IMOVEL IM, '
      '       INDINDICADOR I, '
      '       INDGRPAPURACAO GA, '
      '       ( '
      
        '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS ' +
        'IDGRPAPURACAO, AP.IDINDICADOR, '
      
        '                        GI.TIPOLANCA, AP.ANOCOMPETENCIA, GI.ORDE' +
        'M '
      '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST, '
      '               INDAPURACAO AP,     INDINDICADOR I '
      '         WHERE AP.IDINDICADOR = GI.IDINDICADOR '
      '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO '
      '           AND AP.IDINDICADOR = I.IDINDICADOR'
      '          -- AND ST.IDREPORTS = 3435                         '
      '           AND ST.IDSUBTIPO = 102  '
      '           AND AP.MESCOMPETENCIA = 1'
      '           AND AP.ANOCOMPETENCIA = 2002           '
      '           AND AP.IDIMOVEL  = 1234'
      '        ) CCI, '
      '       ( '
      
        '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS ID' +
        'GRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACA' +
        'ONUM '
      '          FROM INDAPURACAO '
      '         WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      '           AND DATAAPURACAO = TO_DATE('#39'01/01/2002'#39','#39'DD/MM/YYYY'#39')'
      
        '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANC' +
        'A '
      '        ) AP01, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'02/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP02, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'03/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP03, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'04/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP04, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'05/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP05, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'06/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP06, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'07/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP07, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1 AND ANOCOMPETENCIA = 2002'
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) APMES '
      'WHERE CCI.IDINDICADOR    = I.IDINDICADOR '
      '  AND CCI.IDIMOVEL       = IM.IDIMOVEL '
      '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '
      '  AND CCI.IDIMOVEL       = AP01.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP02.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP03.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP04.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP05.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP06.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP07.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = APMES.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = APMES.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = APMES.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = APMES.TIPOLANCA(+) '
      '  '
      
        'ORDER BY IMONOME, DSC_CCUSTO, DSC_TIPOVALOR, ORDEM, DSC_INDICADO' +
        'R'
      ' ')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'TIPOVALOR'
      FieldName = 'TIPOVALOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRPAPURACAO'
      FieldName = 'IDGRPAPURACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      FieldAlias = 'DSC_CCUSTO'
      FieldName = 'DSC_CCUSTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplppField9: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplppField10: TppField
      FieldAlias = 'DSC_TIPOVALOR'
      FieldName = 'DSC_TIPOVALOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      FieldAlias = 'DSC_TIPOLANCA'
      FieldName = 'DSC_TIPOLANCA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 10
    end
    object pplppField12: TppField
      FieldAlias = 'DIA01'
      FieldName = 'DIA01'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      FieldAlias = 'DIA02'
      FieldName = 'DIA02'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      FieldAlias = 'DIA03'
      FieldName = 'DIA03'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      FieldAlias = 'DIA04'
      FieldName = 'DIA04'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object pplppField16: TppField
      FieldAlias = 'DIA05'
      FieldName = 'DIA05'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object pplppField17: TppField
      FieldAlias = 'DIA06'
      FieldName = 'DIA06'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object pplppField18: TppField
      FieldAlias = 'DIA07'
      FieldName = 'DIA07'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object pplppField19: TppField
      FieldAlias = 'SEM01'
      FieldName = 'SEM01'
      FieldLength = 3
      DisplayWidth = 3
      Position = 18
    end
    object pplppField20: TppField
      FieldAlias = 'SEM02'
      FieldName = 'SEM02'
      FieldLength = 3
      DisplayWidth = 3
      Position = 19
    end
    object pplppField21: TppField
      FieldAlias = 'SEM03'
      FieldName = 'SEM03'
      FieldLength = 3
      DisplayWidth = 3
      Position = 20
    end
    object pplppField22: TppField
      FieldAlias = 'SEM04'
      FieldName = 'SEM04'
      FieldLength = 3
      DisplayWidth = 3
      Position = 21
    end
    object pplppField23: TppField
      FieldAlias = 'SEM05'
      FieldName = 'SEM05'
      FieldLength = 3
      DisplayWidth = 3
      Position = 22
    end
    object pplppField24: TppField
      FieldAlias = 'SEM06'
      FieldName = 'SEM06'
      FieldLength = 3
      DisplayWidth = 3
      Position = 23
    end
    object pplppField25: TppField
      FieldAlias = 'SEM07'
      FieldName = 'SEM07'
      FieldLength = 3
      DisplayWidth = 3
      Position = 24
    end
    object pplppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR01'
      FieldName = 'VLR01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR02'
      FieldName = 'VLR02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR03'
      FieldName = 'VLR03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR04'
      FieldName = 'VLR04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR05'
      FieldName = 'VLR05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR06'
      FieldName = 'VLR06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR07'
      FieldName = 'VLR07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMES'
      FieldName = 'VLRMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
  end
  object ppRdsHotel: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppOrcamentoHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo Diário da Situação de Hotéis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8466
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppOrcamentoDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDscDetalhe: TppDBText
        UserName = 'ppDscDetalhe'
        DataField = 'DSC_INDICADOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 5556
        mmTop = 0
        mmWidth = 49742
        BandType = 4
      end
      object ppOrcamentoDBText4: TppDBText
        UserName = 'OrcamentoDBText4'
        DataField = 'VLR01'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 71173
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText5: TppDBText
        UserName = 'OrcamentoDBText5'
        DataField = 'VLR05'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText6: TppDBText
        UserName = 'OrcamentoDBText6'
        DataField = 'VLR02'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 94192
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText7: TppDBText
        UserName = 'OrcamentoDBText7'
        DataField = 'VLR03'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText8: TppDBText
        UserName = 'OrcamentoDBText8'
        DataField = 'VLR04'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText9: TppDBText
        UserName = 'OrcamentoDBText9'
        DataField = 'VLR06'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 186267
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppOrcamentoDBText11: TppDBText
        UserName = 'OrcamentoDBText11'
        DataField = 'VLR07'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 209550
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object vTot: TppVariable
        UserName = 'vTot'
        AutoSize = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRMES'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 259028
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppOrcamentoFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object lblSistema: TppLabel
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppOrcamentoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'IMONOME'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DSC_CCUSTO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DSC_CCUSTO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 2646
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 9260
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Total do Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 237596
          mmTop = 1588
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Acumulado no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 258234
          mmTop = 1588
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DIA01'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 73290
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'SEM01'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 73290
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'DIA02'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 96309
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'SEM02'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 96309
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'DIA03'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 119327
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'SEM03'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 119327
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DIA04'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 142346
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText12: TppDBText
          UserName = 'DBText104'
          DataField = 'SEM04'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 142346
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'DIA05'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'SEM05'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'DIA06'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 188384
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'SEM06'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 188384
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'DIA07'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 211667
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'SEM07'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 211667
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
      end
    end
    object ppGrpQuebra: TppGroup
      BreakName = 'DSC_TIPOVALOR'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'GrpQuebra'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDscQuebra: TppDBText
          UserName = 'DscQuebra'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3704
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppOrcamentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object RegRodape: TppRegion
          UserName = 'RegRodape'
          Pen.Color = clWhite
          Pen.Width = 0
          mmHeight = 8996
          mmLeft = 265
          mmTop = 1323
          mmWidth = 284428
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppOrcamentoLine6: TppLine
            UserName = 'OrcamentoLine6'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 794
            mmLeft = 265
            mmTop = 7144
            mmWidth = 284428
            BandType = 5
            GroupNo = 0
          end
          object vTD2: TppVariable
            UserName = 'vTD2'
            AutoSize = False
            CalcOrder = 1
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 94457
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD3: TppVariable
            UserName = 'vTD3'
            AutoSize = False
            CalcOrder = 2
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 117476
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD4: TppVariable
            UserName = 'vTD4'
            AutoSize = False
            CalcOrder = 3
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 140494
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD5: TppVariable
            UserName = 'vTD5'
            AutoSize = False
            CalcOrder = 4
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 163513
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD6: TppVariable
            UserName = 'vTD6'
            AutoSize = False
            CalcOrder = 5
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 186532
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD7: TppVariable
            UserName = 'vTD7'
            AutoSize = False
            CalcOrder = 6
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 209815
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vPTot: TppVariable
            UserName = 'vPTot'
            AutoSize = False
            CalcOrder = 7
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 234951
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vPAnt: TppVariable
            UserName = 'vPAnt'
            AutoSize = False
            CalcOrder = 8
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 259293
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object vTD1: TppVariable
            UserName = 'vTD1'
            AutoSize = False
            CalcOrder = 0
            DataType = dtExtended
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 71438
            mmTop = 2911
            mmWidth = 16669
            BandType = 5
            GroupNo = 0
          end
          object ppOrcamentoLabel15: TppLabel
            UserName = 'Label16'
            Caption = 'T O T A L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 37307
            mmTop = 2911
            mmWidth = 12435
            BandType = 5
            GroupNo = 0
          end
        end
        object ppOrcamentoLine4: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDINDICADOR'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppLine1: TppLine
          OnPrint = pplSeparadorPrint
          UserName = 'lSeparador1'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          StretchWithParent = True
          Weight = 0.75
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 3
        end
        object ppShape1: TppShape
          OnPrint = ppsCorPrint
          UserName = 'sCor1'
          Brush.Color = clLime
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 3
        end
        object lblPercent: TppLabel
          UserName = 'lblPercent'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 265
          mmWidth = 12965
          BandType = 5
          GroupNo = 3
        end
        object vPer1: TppVariable
          UserName = 'vPer1'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 71173
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer2: TppVariable
          UserName = 'vPer2'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 94192
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer3: TppVariable
          UserName = 'vPer3'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 117211
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer4: TppVariable
          UserName = 'vPer4'
          AutoSize = False
          CalcOrder = 3
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 140229
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer5: TppVariable
          UserName = 'vPer5'
          AutoSize = False
          CalcOrder = 4
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 163248
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer6: TppVariable
          UserName = 'vPer6'
          AutoSize = False
          CalcOrder = 5
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 186267
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPer7: TppVariable
          UserName = 'vPer7'
          AutoSize = False
          CalcOrder = 6
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 209550
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPerSem: TppVariable
          UserName = 'vPerSem'
          AutoSize = False
          CalcOrder = 7
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234686
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
        object vPerMes: TppVariable
          UserName = 'vPerMes'
          AutoSize = False
          CalcOrder = 8
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 259028
          mmTop = 265
          mmWidth = 16669
          BandType = 5
          GroupNo = 3
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365064470726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073447363446574616C6865203A
        20537472696E673B0D0A626567696E0D0A0D0A656E643B0D0A0001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061044657461696C
        41667465725072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C1F03000070726F6365647572652044657461696C41
        667465725072696E743B0D0A626567696E0D0A20202069662070704473634465
        74616C68652E446174614669656C64203D20274453435F494E44494341444F52
        27207468656E0D0A202020202020202073447363446574616C6865203A3D2070
        706C5B274453435F494E44494341444F52275D0D0A202020656C736520734473
        63446574616C6865203A3D2070706C5B274453435F43435553544F275D3B0D0A
        2020200D0A20202069662070706C5B274944494E44494341444F52275D203C3E
        2070706C55485B274944494E44494341444F52275D207468656E20626567696E
        2020200D0A202020202020765444312E4173457874656E646564203A3D207654
        44312E4173457874656E646564202B2070706C5B27564C523031275D3B0D0A20
        2020202020765444322E4173457874656E646564203A3D20765444322E417345
        7874656E646564202B2070706C5B27564C523032275D3B0D0A20202020202076
        5444332E4173457874656E646564203A3D20765444332E4173457874656E6465
        64202B2070706C5B27564C523033275D3B0D0A202020202020765444342E4173
        457874656E646564203A3D20765444342E4173457874656E646564202B207070
        6C5B27564C523034275D3B0D0A202020202020765444352E4173457874656E64
        6564203A3D20765444352E4173457874656E646564202B2070706C5B27564C52
        3035275D3B0D0A202020202020765444362E4173457874656E646564203A3D20
        765444362E4173457874656E646564202B2070706C5B27564C523036275D3B0D
        0A202020202020765444372E4173457874656E646564203A3D20765444372E41
        73457874656E646564202B2070706C5B27564C523037275D3B0D0A2020202020
        207650416E742E4173457874656E646564203A3D207650416E742E4173457874
        656E646564202B2070706C5B27564C524D4553275D3B2020202020200D0A2020
        202020207650546F742E4173457874656E646564203A3D207650546F742E4173
        457874656E646564202B2076546F742E4173457874656E6465643B0D0A202020
        656E643B20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506064465
        7461696C094576656E744E616D65060A41667465725072696E74074576656E74
        494402170001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D6506234F7263616D656E746F47726F757048656164657242616E64314166
        7465725072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C4401000070726F636564757265204F7263616D656E746F
        47726F757048656164657242616E643141667465725072696E743B0D0A626567
        696E0D0A20202073447363446574616C6865202020203A3D2027273B0D0A2020
        20765444312E4173457874656E646564203A3D20303B0D0A202020765444322E
        4173457874656E646564203A3D20303B0D0A202020765444332E417345787465
        6E646564203A3D20303B0D0A202020765444342E4173457874656E646564203A
        3D20303B0D0A202020765444352E4173457874656E646564203A3D20303B0D0A
        202020765444362E4173457874656E646564203A3D20303B0D0A202020765444
        372E4173457874656E646564203A3D20303B0D0A2020207650416E742E417345
        7874656E646564203A3D20303B0D0A2020207650546F742E4173457874656E64
        6564203A3D20303B200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        194F7263616D656E746F47726F757048656164657242616E6431094576656E74
        4E616D65060A41667465725072696E74074576656E74494402170001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506114465746169
        6C4265666F72655072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C4602000070726F636564757265204465746169
        6C4265666F72655072696E743B0D0A626567696E0D0A20202069662070704473
        63446574616C68652E446174614669656C64203D20274453435F494E44494341
        444F5227207468656E20626567696E2020200D0A202020202069662073447363
        446574616C6865203D2070706C5B274453435F494E44494341444F52275D2074
        68656E0D0A202020202020202020207070447363446574616C68652E56697369
        626C65203A3D2046616C73650D0A2020202020656C7365207070447363446574
        616C68652E56697369626C65203A3D20547275653B0D0A202020656E6420656C
        736520626567696E0D0A202020202069662073447363446574616C6865203D20
        70706C5B274453435F43435553544F275D207468656E0D0A2020202020202020
        20207070447363446574616C68652E56697369626C65203A3D2046616C73650D
        0A2020202020656C7365207070447363446574616C68652E56697369626C6520
        3A3D20547275653B0D0A202020656E643B20200D0A2020200D0A2020200D0A20
        202076546F742E4173457874656E646564203A3D2070706C5B27564C52303127
        5D202B2070706C5B27564C523032275D202B2070706C5B27564C523033275D20
        2B0D0A2020202020202020202020202020202020202020202070706C5B27564C
        523034275D202B2070706C5B27564C523035275D202B2070706C5B27564C5230
        36275D202B0D0A2020202020202020202020202020202020202020202070706C
        5B27564C523037275D3B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060644657461696C094576656E744E616D65060B4265666F726550
        72696E74074576656E74494402180001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061B47726F7570466F6F74657242616E643342
        65666F72655072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C8704000070726F6365647572652047726F7570466F
        6F74657242616E64334265666F72655072696E743B0D0A626567696E0D0A2020
        206966202870706C5B274944494E44494341444F52275D203C3E2070706C5548
        5B274944494E44494341444F52275D2920616E640D0A2020202020202870706C
        5B274453435F5449504F56414C4F52275D203D2027444553454D50454E484F27
        29207468656E20626567696E0D0A20202020206C626C50657263656E742E4361
        7074696F6E203A3D2070706C5B274453435F494E44494341444F52275D202B20
        27202D2025273B0D0A202020202076506572312E4173457874656E646564203A
        3D202870706C5B27564C523031275D202A2031303029202F2070706C55485B27
        564C523031275D3B0D0A202020202076506572322E4173457874656E64656420
        3A3D202870706C5B27564C523032275D202A2031303029202F2070706C55485B
        27564C523032275D3B20202020200D0A202020202076506572332E4173457874
        656E646564203A3D202870706C5B27564C523033275D202A2031303029202F20
        70706C55485B27564C523033275D3B0D0A202020202076506572342E41734578
        74656E646564203A3D202870706C5B27564C523034275D202A2031303029202F
        2070706C55485B27564C523034275D3B20202020200D0A202020202076506572
        352E4173457874656E646564203A3D202870706C5B27564C523035275D202A20
        31303029202F2070706C55485B27564C523035275D3B20202020200D0A202020
        202076506572362E4173457874656E646564203A3D202870706C5B27564C5230
        36275D202A2031303029202F2070706C55485B27564C523036275D3B0D0A2020
        20202076506572372E4173457874656E646564203A3D202870706C5B27564C52
        3037275D202A2031303029202F2070706C55485B27564C523037275D3B202020
        20200D0A20202020200D0A20202020207650657253656D2E4173457874656E64
        6564203A3D202876546F742E4173457874656E646564202A2031303029202F20
        0D0A202020202020202020202020202020202020202020202020202020287070
        6C55485B27564C523031275D202B2070706C55485B27564C523032275D202B20
        70706C55485B27564C523033275D202B20202020200D0A202020202020202020
        2020202020202020202020202020202020202870706C55485B27564C52303427
        5D202B2070706C55485B27564C523035275D202B2070706C55485B27564C5230
        36275D202B2070706C55485B27564C523037275D293B0D0A2020202020202020
        202020202020202020202020200D0A2020202020765065724D65732E41734578
        74656E646564203A3D202870706C5B27564C524D4553275D202A203130302920
        2F2070706C55485B27564C524D4553275D3B20202020200D0A2020202020200D
        0A202020202047726F7570466F6F74657242616E64332E56697369626C65203A
        3D20547275653B0D0A202020656E6420656C736520626567696E0D0A20202020
        2047726F7570466F6F74657242616E64332E56697369626C65203A3D2046616C
        73653B0D0A202020656E643B20200D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65061047726F7570466F6F74657242616E6433094576656E744E616D65
        060B4265666F72655072696E74074576656E74494402180001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506244F7263616D656E74
        6F47726F7570466F6F74657242616E64314265666F72655072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506A67072
        6F636564757265204F7263616D656E746F47726F7570466F6F74657242616E64
        314265666F72655072696E743B0D0A626567696E0D0A202069662070706C5B27
        5449504F56414C4F52275D203D20274527207468656E0D0A2020202020202052
        6567526F646170652E56697369626C65203A3D2046616C73650D0A2020656C73
        6520526567526F646170652E56697369626C65203A3D20547275653B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D6506194F7263616D656E746F47726F
        7570466F6F74657242616E6431094576656E744E616D65060B4265666F726550
        72696E74074576656E74494402180000}
    end
  end
  object CMspUH: TCMSqlParams
    SQL.Strings = (
      'SELECT IM.IDIMOVEL,'
      '       GA.IDGRPAPURACAO,'
      '       I.IDINDICADOR,'
      '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01,'
      '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02,'
      '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03,'
      '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04,'
      '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05,'
      '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06,'
      '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07,'
      '       NVL(APMES.VLRAPURACAONUM,0) AS VLRMES'
      'FROM'
      '       IMOVEL IM,'
      '       INDINDICADOR I,'
      '       INDGRPAPURACAO GA,'
      '       ('
      
        '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS ' +
        'IDGRPAPURACAO, AP.IDINDICADOR,'
      '                        GI.TIPOLANCA, AP.ANOCOMPETENCIA '
      '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST, '
      '               INDAPURACAO AP,     INDINDICADOR I '
      '         WHERE AP.IDINDICADOR = GI.IDINDICADOR '
      '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO '
      '           AND AP.IDINDICADOR = I.IDINDICADOR'
      '          -- AND ST.IDREPORTS = 3435                         '
      '           AND ST.IDSUBTIPO = 102  '
      '           AND I.IDINDICADOR = 30'
      '           AND AP.MESCOMPETENCIA = 1'
      '           AND AP.ANOCOMPETENCIA = 2002           '
      '           AND AP.IDIMOVEL  = 1234'
      '        ) CCI, '
      '       ( '
      
        '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS ID' +
        'GRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACA' +
        'ONUM '
      '          FROM INDAPURACAO '
      '         WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      '           AND DATAAPURACAO = TO_DATE('#39'01/01/2002'#39','#39'DD/MM/YYYY'#39')'
      '           AND IDINDICADOR = 30 '
      
        '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANC' +
        'A '
      '        ) AP01, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'02/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP02, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'03/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP03, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'04/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP04, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'05/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP05, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'06/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP06, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1  AND ANOCOMPETENCIA = 2002'
      
        '          AND DATAAPURACAO = TO_DATE('#39'07/01/2002'#39','#39'DD/MM/YYYY'#39') ' +
        '       '
      '          AND IDINDICADOR = 30           '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) AP07, '
      '       ( '
      
        '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDG' +
        'RPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAO' +
        'NUM '
      '         FROM INDAPURACAO '
      '        WHERE MESCOMPETENCIA = 1 AND ANOCOMPETENCIA = 2002'
      '          AND IDINDICADOR = 30         '
      
        '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA' +
        ' '
      '       ) APMES '
      'WHERE CCI.IDINDICADOR    = I.IDINDICADOR '
      '  AND CCI.IDIMOVEL       = IM.IDIMOVEL '
      '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '
      '  AND CCI.IDIMOVEL       = AP01.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP02.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP03.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP04.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP05.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP06.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = AP07.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+) '
      '  AND CCI.IDIMOVEL       = APMES.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = APMES.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = APMES.IDINDICADOR(+) '
      '  AND CCI.TIPOLANCA      = APMES.TIPOLANCA(+) '
      '  '
      ' ')
    ClientDataSet = cdsUH
    Left = 321
    Top = 8
  end
  object cdsUH: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 21
    Data = {
      2F0100009619E0BD01000000180000000B000100000003000000D30008494449
      4D4F56454C08000400000000000D4944475250415055524143414F0800040000
      0000000B4944494E44494341444F52080004000000000005564C523031080004
      000000000005564C523032080004000000000005564C52303308000400000000
      0005564C523034080004000000000005564C523035080004000000000005564C
      523036080004000000000005564C523037080004000000000006564C524D4553
      08000400000000000100044C4349440400010009080000000000000000000000
      48934000000000000024400000000000003E400000000000F073400000000000
      F073400000000000F073400000000000F073400000000000F073400000000000
      F0734000000000000000000000000000E89D40}
  end
  object dsUH: TDataSource
    DataSet = cdsUH
    Left = 321
    Top = 34
  end
  object pplUH: TppBDEPipeline
    DataSource = dsUH
    UserName = 'pplUH'
    Left = 319
    Top = 48
    MasterDataPipelineName = 'ppl'
    object pplUHppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplUHppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRPAPURACAO'
      FieldName = 'IDGRPAPURACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplUHppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplUHppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR01'
      FieldName = 'VLR01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplUHppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR02'
      FieldName = 'VLR02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplUHppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR03'
      FieldName = 'VLR03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplUHppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR04'
      FieldName = 'VLR04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplUHppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR05'
      FieldName = 'VLR05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplUHppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR06'
      FieldName = 'VLR06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplUHppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR07'
      FieldName = 'VLR07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplUHppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMES'
      FieldName = 'VLRMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDIMOVEL'
      DetailFieldName = 'IDIMOVEL'
      DetailSortOrder = soAscending
    end
  end
end
