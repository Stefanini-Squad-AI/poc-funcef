inherited dtmRelEvolVacancia: TdtmRelEvolVacancia
  Left = 384
  Top = 230
  Height = 150
  Caption = 'dtmRelEvolVacancia'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'iMes'
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
        Name = 'iMes'
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
        Caption = 'iAno'
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
        Name = 'iAno'
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
        Name = 'bSeparador'
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
        Name = 'bCorLinha'
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
        Name = 'iCorLinha'
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
    Report = ppEvolVacancia
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    FieldDefs = <
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IMOCODIGO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IMONOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'AREATOTAL'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA01'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA02'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA03'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA04'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA05'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA06'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA07'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA08'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA09'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA10'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA11'
        DataType = ftFloat
      end
      item
        Name = 'AREAVAGA12'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA01'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA02'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA03'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA04'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA05'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA06'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA07'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA08'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA09'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA10'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA11'
        DataType = ftFloat
      end
      item
        Name = 'PERCVACANCIA12'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'NOME'
        Fields = 'IMONOME'
      end
      item
        Name = 'TOTAL'
        Fields = 'VLRTOTAL'
        Options = [ixDescending]
      end>
    IndexName = 'NOME'
    StoreDefs = True
    Data = {
      940200009619E0BD01000000180000001C000000000003000000940208494449
      4D4F56454C080004000000000009494D4F434F4449474F010049000000010005
      5749445448020002000F0007494D4F4E4F4D4501004900000001000557494454
      48020002003C000941524541544F54414C08000400000000000A415245415641
      4741303108000400000000000A4152454156414741303208000400000000000A
      4152454156414741303308000400000000000A41524541564147413034080004
      00000000000A4152454156414741303508000400000000000A41524541564147
      41303608000400000000000A4152454156414741303708000400000000000A41
      52454156414741303808000400000000000A4152454156414741303908000400
      000000000A4152454156414741313008000400000000000A4152454156414741
      313108000400000000000A4152454156414741313208000400000000000E5045
      5243564143414E434941303108000400000000000E50455243564143414E4349
      41303208000400000000000E50455243564143414E4349413033080004000000
      00000E50455243564143414E434941303408000400000000000E504552435641
      43414E434941303508000400000000000E50455243564143414E434941303608
      000400000000000E50455243564143414E434941303708000400000000000E50
      455243564143414E434941303808000400000000000E50455243564143414E43
      4941303908000400000000000E50455243564143414E43494131300800040000
      0000000E50455243564143414E434941313108000400000000000E5045524356
      4143414E4349413132080004000000000002000D44454641554C545F4F524445
      5202008200010000000300044C4349440400010009080000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT AM.IDIMOVEL, AM.IMOCODIGO, AM.IMONOME, AM.AREATOTAL,     ' +
        '            '
      
        '       AV01.AREAVAGA AS AREAVAGA01,                             ' +
        '            '
      
        '       AV02.AREAVAGA AS AREAVAGA02,                             ' +
        '            '
      
        '       AV03.AREAVAGA AS AREAVAGA03,                             ' +
        '            '
      
        '       AV04.AREAVAGA AS AREAVAGA04,                             ' +
        '            '
      
        '       AV05.AREAVAGA AS AREAVAGA05,                             ' +
        '            '
      
        '       AV06.AREAVAGA AS AREAVAGA06,                             ' +
        '            '
      
        '       AV07.AREAVAGA AS AREAVAGA07,                             ' +
        '            '
      
        '       AV08.AREAVAGA AS AREAVAGA08,                             ' +
        '            '
      
        '       AV09.AREAVAGA AS AREAVAGA09,                             ' +
        '            '
      
        '       AV10.AREAVAGA AS AREAVAGA10,                             ' +
        '            '
      
        '       AV11.AREAVAGA AS AREAVAGA11,                             ' +
        '            '
      
        '       AV12.AREAVAGA AS AREAVAGA12,                             ' +
        '            '
      
        '       ROUND( (AV01.AREAVAGA * 100) / AM01.AREATOTAL, 2) AS PERC' +
        'VACANCIA01, '
      
        '       ROUND( (AV02.AREAVAGA * 100) / AM02.AREATOTAL, 2) AS PERC' +
        'VACANCIA02, '
      
        '       ROUND( (AV03.AREAVAGA * 100) / AM03.AREATOTAL, 2) AS PERC' +
        'VACANCIA03, '
      
        '       ROUND( (AV04.AREAVAGA * 100) / AM04.AREATOTAL, 2) AS PERC' +
        'VACANCIA04, '
      
        '       ROUND( (AV05.AREAVAGA * 100) / AM05.AREATOTAL, 2) AS PERC' +
        'VACANCIA05, '
      
        '       ROUND( (AV06.AREAVAGA * 100) / AM06.AREATOTAL, 2) AS PERC' +
        'VACANCIA06, '
      
        '       ROUND( (AV07.AREAVAGA * 100) / AM07.AREATOTAL, 2) AS PERC' +
        'VACANCIA07, '
      
        '       ROUND( (AV08.AREAVAGA * 100) / AM08.AREATOTAL, 2) AS PERC' +
        'VACANCIA08, '
      
        '       ROUND( (AV09.AREAVAGA * 100) / AM09.AREATOTAL, 2) AS PERC' +
        'VACANCIA09, '
      
        '       ROUND( (AV10.AREAVAGA * 100) / AM10.AREATOTAL, 2) AS PERC' +
        'VACANCIA10, '
      
        '       ROUND( (AV11.AREAVAGA * 100) / AM11.AREATOTAL, 2) AS PERC' +
        'VACANCIA11, '
      
        '       ROUND( (AV12.AREAVAGA * 100) / AM12.AREATOTAL, 2) AS PERC' +
        'VACANCIA12  '
      
        '  FROM (                                                        ' +
        '            '
      
        '        SELECT IM.IDIMOVEL, IM.IMOCODIGO, IM.IMONOME,           ' +
        '      '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM                              ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL(+))              ' +
        '            '
      
        '           AND I.FLGATIVO = 1                                   ' +
        '            '
      
        '           AND I.IDIMOVELMESTRE IS NOT NULL                     ' +
        '            '
      
        '      GROUP BY IM.IDIMOVEL, IM.IMOCODIGO, IM.IMONOME            ' +
        '      '
      
        '            ) AM,                                               ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) AND ( (AL.DTVENDA I' +
        'S NOT NULL AND                                                  ' +
        '          '
      
        '200501 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200501 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM01,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200502 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200502 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM02,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200503 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200503 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM03,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200504 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200504 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM04,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200505 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200505 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM05,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200506 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200506 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM06,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200507 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200507 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM07,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200508 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200508 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM08,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200509 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200509 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM09,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200510 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200510 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM10,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200511 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200511 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM11,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT I.IDIMOVELMESTRE,                                ' +
        '            '
      
        '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL             ' +
        '            '
      
        '          FROM IMOVEL I, IMOVEL IM,                             ' +
        '            '
      
        '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA       ' +
        '            '
      
        '                   FROM EVENTOIMOVEL                            ' +
        '            '
      
        '                  WHERE FLGTIPOEVENTO = '#39'CA'#39'                    ' +
        '          '
      
        '                  GROUP BY IDIMOVEL                             ' +
        '            '
      
        '               ) AL                                             ' +
        '            '
      
        '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                 ' +
        '            '
      
        '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))  AND ( (AL.DTVENDA ' +
        'IS NOT NULL AND                                                 ' +
        '           '
      
        '200512 BETWEEN TO_CHAR(I.IMODATACOMPRA,'#39'YYYYMM'#39') AND TO_CHAR(AL.' +
        'DTVENDA,'#39'YYYYMM'#39')) OR '
      
        '       (AL.DTVENDA IS NULL AND 200512 >= TO_CHAR(I.IMODATACOMPRA' +
        ','#39'MMYYYY'#39')) )      '
      
        '         GROUP BY I.IDIMOVELMESTRE                              ' +
        '            '
      
        '       ) AM12,                                                  ' +
        '            '
      
        '       (                                                        ' +
        '            '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 1 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV01,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 2 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV02,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 3 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV03,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 4 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV04,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 5 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV05,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 6 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV06,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 7 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV07,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 8 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV08,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 9 A' +
        'ND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV09,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 10 ' +
        'AND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV10,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 11 ' +
        'AND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV11,  '
      '       (         '
      
        '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.ID' +
        'IMOVELMESTRE) AS IDIMOVELMESTRE,  '
      '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '
      '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '
      '         WHERE A.IDINDICADOR = I.IDINDICADOR               '
      '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '
      '           AND A.TIPOLANCA      = '#39'R'#39'                    '
      
        '           AND I.TIPOINDICADOR  = 23  AND A.MESCOMPETENCIA = 12 ' +
        'AND A.ANOCOMPETENCIA = 2005'
      
        '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM' +
        '.IDIMOVELMESTRE)  '
      '        ) AV12  '
      ' WHERE AM.IDIMOVEL = AM01.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM02.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM03.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM04.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM05.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM06.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM07.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM08.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM09.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM10.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM11.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AM12.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV01.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV02.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV03.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV04.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV05.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV06.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV07.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV08.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV09.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV10.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV11.IDIMOVELMESTRE(+)                '
      '   AND AM.IDIMOVEL = AV12.IDIMOVELMESTRE(+)                '
      
        '   AND (AV01.IDIMOVELMESTRE IS NOT NULL OR AV02.IDIMOVELMESTRE I' +
        'S NOT NULL OR  '
      
        '        AV03.IDIMOVELMESTRE IS NOT NULL OR AV04.IDIMOVELMESTRE I' +
        'S NOT NULL OR  '
      
        '        AV05.IDIMOVELMESTRE IS NOT NULL OR AV06.IDIMOVELMESTRE I' +
        'S NOT NULL OR  '
      
        '        AV07.IDIMOVELMESTRE IS NOT NULL OR AV08.IDIMOVELMESTRE I' +
        'S NOT NULL OR  '
      
        '        AV09.IDIMOVELMESTRE IS NOT NULL OR AV10.IDIMOVELMESTRE I' +
        'S NOT NULL OR  '
      
        '        AV11.IDIMOVELMESTRE IS NOT NULL OR AV12.IDIMOVELMESTRE I' +
        'S NOT NULL )   '
      ' ORDER BY IMONOME ')
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
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREATOTAL'
      FieldName = 'AREATOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA01'
      FieldName = 'AREAVAGA01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA02'
      FieldName = 'AREAVAGA02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA03'
      FieldName = 'AREAVAGA03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA04'
      FieldName = 'AREAVAGA04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA05'
      FieldName = 'AREAVAGA05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA06'
      FieldName = 'AREAVAGA06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA07'
      FieldName = 'AREAVAGA07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA08'
      FieldName = 'AREAVAGA08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA09'
      FieldName = 'AREAVAGA09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA10'
      FieldName = 'AREAVAGA10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA11'
      FieldName = 'AREAVAGA11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'AREAVAGA12'
      FieldName = 'AREAVAGA12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA01'
      FieldName = 'PERCVACANCIA01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA02'
      FieldName = 'PERCVACANCIA02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA03'
      FieldName = 'PERCVACANCIA03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA04'
      FieldName = 'PERCVACANCIA04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA05'
      FieldName = 'PERCVACANCIA05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA06'
      FieldName = 'PERCVACANCIA06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA07'
      FieldName = 'PERCVACANCIA07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA08'
      FieldName = 'PERCVACANCIA08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA09'
      FieldName = 'PERCVACANCIA09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA10'
      FieldName = 'PERCVACANCIA10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA11'
      FieldName = 'PERCVACANCIA11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVACANCIA12'
      FieldName = 'PERCVACANCIA12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
  end
  object ppEvolVacancia: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppOrcamentoLabel2: TppLabel
        UserName = 'OrcamentoLabel2'
        AutoSize = False
        Caption = 'Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3440
        mmLeft = 86784
        mmTop = 23548
        mmWidth = 11113
        BandType = 0
      end
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
        Caption = 'Evolução de Vacância por Empreendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Competência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17992
        mmWidth = 26723
        BandType = 0
      end
      object ppOrcamentoLine1: TppLine
        UserName = 'OrcamentoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284300
        BandType = 0
      end
      object ppOrcamentoLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 31485
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22490
        mmTop = 25665
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 82815
        mmTop = 27252
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 25665
        mmWidth = 9790
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
      object pplCompetencia: TppLabel
        UserName = 'lCompetencia'
        AutoSize = False
        Caption = 'Janeiro / 2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 17992
        mmWidth = 55563
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 102659
        mmTop = 24871
        mmWidth = 163248
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Area Vaga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 23283
        mmWidth = 22225
        BandType = 0
      end
      object ppMes1: TppLabel
        UserName = 'Mes1'
        Caption = 'JAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 109538
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
      object ppMes2: TppLabel
        UserName = 'Mes2'
        Caption = 'FEV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
      object ppMes10: TppLabel
        UserName = 'Mes10'
        Caption = 'OUT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 233363
        mmTop = 27252
        mmWidth = 5821
        BandType = 0
      end
      object ppMes3: TppLabel
        UserName = 'Mes3'
        Caption = 'MAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 136525
        mmTop = 27252
        mmWidth = 6350
        BandType = 0
      end
      object ppMes4: TppLabel
        UserName = 'Mes4'
        Caption = 'ABR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 150548
        mmTop = 27252
        mmWidth = 6085
        BandType = 0
      end
      object ppMes5: TppLabel
        UserName = 'Mes5'
        Caption = 'MAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 165365
        mmTop = 27252
        mmWidth = 5027
        BandType = 0
      end
      object ppMes6: TppLabel
        UserName = 'Mes6'
        Caption = 'JUN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 178594
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
      object ppMes7: TppLabel
        UserName = 'Mes7'
        Caption = 'JUL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 192617
        mmTop = 27252
        mmWidth = 5292
        BandType = 0
      end
      object ppMes8: TppLabel
        UserName = 'Label4'
        Caption = 'AGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 205317
        mmTop = 27252
        mmWidth = 6350
        BandType = 0
      end
      object ppMes9: TppLabel
        UserName = 'Label13'
        Caption = 'SET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
      object ppMes11: TppLabel
        UserName = 'Mes11'
        Caption = 'NOV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 246857
        mmTop = 27252
        mmWidth = 6085
        BandType = 0
      end
      object ppMes12: TppLabel
        UserName = 'Label14'
        Caption = 'DEZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 261144
        mmTop = 27252
        mmWidth = 5556
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4498
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
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IMONOME'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 265
        mmWidth = 57415
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'AREATOTAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.##;-#,0.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 81756
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IMOCODIGO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppOrcamentoDBText4: TppDBText
        UserName = 'OrcamentoDBText4'
        DataField = 'AREAVAGA01'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText6: TppDBText
        UserName = 'OrcamentoDBText6'
        DataField = 'AREAVAGA02'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText7: TppDBText
        UserName = 'OrcamentoDBText7'
        DataField = 'AREAVAGA03'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText8: TppDBText
        UserName = 'OrcamentoDBText8'
        DataField = 'AREAVAGA04'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText5: TppDBText
        UserName = 'OrcamentoDBText5'
        DataField = 'AREAVAGA05'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText9: TppDBText
        UserName = 'OrcamentoDBText9'
        DataField = 'AREAVAGA06'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText11: TppDBText
        UserName = 'OrcamentoDBText11'
        DataField = 'AREAVAGA07'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText12: TppDBText
        UserName = 'OrcamentoDBText12'
        DataField = 'AREAVAGA08'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 198702
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText10: TppDBText
        UserName = 'OrcamentoDBText10'
        DataField = 'AREAVAGA09'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 212461
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'AREAVAGA10'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 226219
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText14: TppDBText
        UserName = 'DBText102'
        DataField = 'AREAVAGA11'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppOrcamentoDBText15: TppDBText
        UserName = 'DBText103'
        DataField = 'AREAVAGA12'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 253736
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
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
        mmWidth = 283105
        BandType = 8
      end
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
        mmTop = 2910
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
        mmLeft = 256911
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
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppl'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppl
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Left = 216
          Top = 56
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppl'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 110596
            mmPrintPosition = 0
            object ppTeeChart1: TppTeeChart
              UserName = 'TeeChart1'
              mmHeight = 98954
              mmLeft = 0
              mmTop = 3440
              mmWidth = 282576
              BandType = 1
              object ppTeeChartControl1: TppTeeChartControl
                Left = 0
                Top = 0
                Width = 400
                Height = 250
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -13
                Title.Font.Name = 'Arial'
                Title.Font.Style = [fsBold]
                Title.Text.Strings = (
                  'Evolução do Percentual de Vacância')
                BackColor = clWhite
                BottomAxis.LabelsSize = 8
                BottomAxis.LabelStyle = talText
                BottomAxis.TitleSize = 8
                LeftAxis.AxisValuesFormat = '#,##0.## %'
                LeftAxis.Title.Caption = 'Percentual'
                LeftAxis.TitleSize = 8
                Legend.Alignment = laBottom
                Legend.LegendStyle = lsSeries
                Legend.TopPos = 0
                RightAxis.AxisValuesFormat = '#,##0.#'
                BevelOuter = bvNone
                Color = clWhite
                object Series1: TFastLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clNavy
                  Title = 'Area Total'
                  LinePen.Color = clNavy
                  LinePen.Width = 3
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Y'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                end
              end
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 1323
              mmWidth = 284300
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
  end
end
