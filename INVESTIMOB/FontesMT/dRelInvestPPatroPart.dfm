inherited dtmRelInvestPPatroPart: TdtmRelInvestPPatroPart
  Left = 375
  Top = 116
  Width = 397
  Height = 203
  Caption = 'dtmRelInvestPPatroPart'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'dDataSaldo'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'dDataSaldo'
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
        Caption = 'PPatro'
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
        Name = 'PPatro'
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
        Caption = 'PPlano'
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
        Name = 'PPlano'
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
        Caption = 'iPosCor'
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
        Name = 'iPosCor'
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
    Report = ppInvestPatro
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Left = 104
    Data = {
      170100009619E0BD01000000180000000900000000000300000017010E444553
      435449504F494D4F56454C010049000000010005574944544802000200190004
      4E4F4D450100490000000100055749445448020002003C00084944494D4F5645
      4C0800040000000000074944504154524F08000400000000000A4E4F4D455F50
      4154524F0100490000000100055749445448020002003C000B4944504C414E4F
      5052455608000400000000000A4E4F4D455F504C414E4F010049000000010005
      57494454480200020032000A50455243454E5455414C08000400000000000756
      414C43544230080004000000000002000D44454641554C545F4F524445520200
      8200040000000100020005000700044C4349440400010009080000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT TP.DESCTIPOIMOVEL,'
      '       IM.NOME,'
      '       IM.IDIMOVEL,'
      '       FT.IDPATRO,'
      '       FT.NOME_PATRO,'
      '       FT.IDPLANOPREV,'
      '       FT.NOME_PLANO,'
      '       IXP.PERCENTUAL,'
      ''
      '       ROUND(SUM((SB.VALORG + SB.CMBEM -'
      '                  SB.DEPLANC - SB.CMDEP +'
      '                  SB.REAVVALORG + SB.REAVCMBEM -'
      '                  SB.REAVDEPLANC - SB.REAVCMDEP +'
      '                  SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '                  SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP) * NVL(FT.' +
        'FATOR,1)),2)  AS VALCTB0'
      ''
      'FROM /* SELECIONA O SALDO CONTÁBIL DOS BENS */'
      '     (SELECT SCB.IDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '              FROM SALDOCONTABBEM'
      
        '             WHERE DATASLDBEM <= TO_DATE('#39'08/06/2004'#39','#39'DD/MM/YYY' +
        'Y'#39')'
      '             GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '      /* SELECIONA OS IMÓVEIS MESTRES */'
      '     (SELECT IDIMOVEL, IMONOME AS NOME'
      '        FROM IMOVEL'
      '       WHERE IDIMOVELMESTRE IS NULL) IM,'
      ''
      
        '     IMOVEL I, TIPOIMOVEL TP, IMOVELXBEM IXB, BEM B, GRUPO G, IM' +
        'OVELXPROP IXP,'
      ''
      '     /* SELECIONA PERCENTUAIS DE PARTICIPAÇÃO PLANO_X_PATRO */'
      '     (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,'
      '             PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'
      '             PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,'
      
        '             ROUND(DECODE(PI.FLGTIPO,'#39'P'#39',(PI.PPIPERCENTRATEIO / ' +
        '100),'
      
        '                                     '#39'C'#39',(PI.PPIPERCENTRATEIO / ' +
        'TT.TOTAL),'
      '                                      NULL), 4) AS FATOR'
      
        '        FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL P' +
        'L,'
      '            (SELECT IDIMOVEL,'
      '                    SUM(PPIPERCENTRATEIO) AS TOTAL'
      '               FROM PLANOPATROXIMOVEL'
      '               GROUP BY IDIMOVEL) TT'
      '       WHERE PI.IDIMOVEL    = TT.IDIMOVEL'
      '         AND PI.IDPATRO     = PE.IDPESSOA'
      '         AND PI.IDPLANOPREV = PL.IDPLANOPREV'
      '         AND PI.IDPATRO = 3'
      '         AND PL.IDPLANOPREV = 44) FT'
      ''
      'WHERE (B.DATAINICIODEP <= TO_DATE('#39'08/06/2004'#39','#39'DD/MM/YYYY'#39'))'
      '  AND (G.FLGIMOVEL = 1)'
      
        '  AND (ABS(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEPLANC,0' +
        ') - NVL(SB.CMDEP,0) +'
      
        '           NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) - NVL(SB.R' +
        'EAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '           NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0) - NV' +
        'L(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,0)) >= 0.01)'
      '  AND (IXB.IDPESSOA = B.IDPESSOA)'
      '  AND (IXB.IDBEM    = B.IDBEM)'
      '  AND (IXB.IDIMOVEL = I.IDIMOVEL)'
      '  AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '  AND (IXB.IDIMOVEL = FT.IDIMOVEL(+))'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (I.IDIMOVELMESTRE = IXP.IDIMOVEL(+))'
      '  AND (IXP.IDPROPRIETARIOUH = 1563935)'
      '  AND (TP.CODTIPIMOVEL = I.CODTIPIMOVEL)'
      '  AND 1=2'
      ''
      'GROUP BY TP.DESCTIPOIMOVEL, IM.NOME, IM.IDIMOVEL, FT.IDPATRO,'
      '         FT.NOME_PATRO, FT.IDPLANOPREV, FT.NOME_PLANO,'
      '         IXP.PERCENTUAL'
      ''
      'UNION'
      ''
      'SELECT TP.DESCTIPOIMOVEL,'
      '       IM.IMONOME AS NOME,'
      '       IM.IDIMOVEL,'
      '       FT.IDPATRO,'
      '       FT.NOME_PATRO,'
      '       FT.IDPLANOPREV,'
      '       FT.NOME_PLANO,'
      '       IXP.PERCENTUAL,'
      '       SUM(L.VALOFI * NVL(FT.FATOR,1)) AS VALCTB0'
      ''
      '  FROM CAFOBRALANC L, CAFOBRA O,'
      
        '       GRUPO G, IMOVEL I, TIPOIMOVEL TP, IMOVEL IM, IMOVELXPROP ' +
        'IXP,'
      ''
      '       /* SELECIONA PERCENTUAIS DE PARTICIPAÇÃO PLANO_X_PATRO */'
      '       (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,'
      '               PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'
      '               PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,'
      
        '               ROUND(DECODE(PI.FLGTIPO,'#39'P'#39',(PI.PPIPERCENTRATEIO ' +
        '/ 100),'
      
        '                                       '#39'C'#39',(PI.PPIPERCENTRATEIO ' +
        '/ TT.TOTAL),'
      '                                        NULL), 4) AS FATOR'
      
        '         FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL ' +
        'PL,'
      '              (SELECT IDIMOVEL,'
      '                  SUM(PPIPERCENTRATEIO) AS TOTAL'
      '                 FROM PLANOPATROXIMOVEL'
      '              GROUP BY IDIMOVEL) TT'
      '        WHERE PI.IDIMOVEL    = TT.IDIMOVEL'
      '          AND PI.IDPATRO     = PE.IDPESSOA'
      '          AND PI.IDPLANOPREV = PL.IDPLANOPREV'
      '          AND PI.IDPATRO = 3'
      '          AND PL.IDPLANOPREV = 44) FT'
      ''
      ''
      ' WHERE (L.IDCAFOBRA = O.IDCAFOBRA)'
      '   AND (L.IDGRUPO = G.IDGRUPO)'
      '   AND (O.IDIMOVEL = I.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND (FT.IDIMOVEL = I.IDIMOVEL(+))'
      '   AND (O.DTAENCERRAOBRA IS NULL)'
      '   AND (L.DTALANCAMENTO <= TO_DATE('#39'08/06/2004'#39','#39'DD/MM/YYYY'#39'))'
      '   AND (O.IDIMOVEL = IXP.IDIMOVEL(+))'
      '   AND (IXP.IDPROPRIETARIOUH = 1563935)'
      '   AND (TP.CODTIPIMOVEL = I.CODTIPIMOVEL)'
      '   AND 1=2'
      ''
      
        ' GROUP BY TP.DESCTIPOIMOVEL, IM.IMONOME, IM.IDIMOVEL, FT.IDPATRO' +
        ','
      '          FT.NOME_PATRO, FT.IDPLANOPREV, FT.NOME_PLANO,'
      '          IXP.PERCENTUAL'
      ''
      ''
      'ORDER BY DESCTIPOIMOVEL, NOME, NOME_PATRO, NOME_PLANO'
      ''
      ''
      ''
      ''
      ''
      ' ')
    Left = 24
    Top = 64
  end
  inherited ds: TDataSource
    Left = 184
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 261
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'NOME_PATRO'
      FieldName = 'NOME_PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      FieldAlias = 'NOME_PLANO'
      FieldName = 'NOME_PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object ppInvestPatro: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 260
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
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
        mmTop = 265
        mmWidth = 196850
        BandType = 0
      end
      object lblTitulo: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Ativos Imobiliários X Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 8996
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 17463
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 17463
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Participação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 167217
        mmTop = 17463
        mmWidth = 20902
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'Empreendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 17463
        mmWidth = 28840
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine4: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Visible = False
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME_PATRO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME_PLANO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 60325
        mmTop = 265
        mmWidth = 71967
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALCTB0'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134144
        mmTop = 265
        mmWidth = 27517
        BandType = 4
      end
      object ppVPercent: TppVariable
        UserName = 'VPercent'
        AutoSize = False
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '###,##0.000%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 170392
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
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
        mmLeft = 170921
        mmTop = 265
        mmWidth = 26194
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
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
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
        mmTop = 265
        mmWidth = 196850
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 12171
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplSub
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 192
          Top = 80
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11377
            mmPrintPosition = 0
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Resumo da Carteira:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 1058
              mmWidth = 34396
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 6350
              mmWidth = 23548
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 10848
              mmWidth = 197300
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 68792
              mmTop = 6350
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Valor Contábil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 136261
              mmTop = 6350
              mmWidth = 23813
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 5821
              mmWidth = 197300
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            BeforePrint = ppDetailBand2BeforePrint
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'NOME_PATRO'
              DataPipeline = pplSub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 4233
              mmLeft = 265
              mmTop = 265
              mmWidth = 61913
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'NOME_PLANO'
              DataPipeline = pplSub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 68792
              mmTop = 0
              mmWidth = 56886
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'VALCTB0'
              DataPipeline = pplSub
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 132557
              mmTop = 0
              mmWidth = 27781
              BandType = 4
            end
            object ppVPercentPlano: TppVariable
              UserName = 'ppVPercentPlano'
              AutoSize = False
              CalcOrder = 0
              DataType = dtExtended
              DisplayFormat = '###,##0.000%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 168275
              mmTop = 0
              mmWidth = 17727
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Total Geral da Carteira Imobiliária: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 73554
              mmTop = 265
              mmWidth = 58473
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'VALCTB0'
              DataPipeline = pplSub
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 133086
              mmTop = 265
              mmWidth = 27517
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOIMOVEL'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALCTB0'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134144
          mmTop = 794
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Total da Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 794
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14737632
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 26194
          mmTop = 529
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALCTB0'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 133879
          mmTop = 265
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Total do Empreendimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 87577
          mmTop = 265
          mmWidth = 44715
          BandType = 5
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PERCENTUAL'
          DataPipeline = ppl
          DisplayFormat = '###,##0.000%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 170657
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object cdsSub: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 120
    Data = {
      C90000009619E0BD010000001800000005000000000003000000C90007494450
      4154524F08000400000000000B4944504C414E4F505245560800040000000000
      0A4E4F4D455F504C414E4F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002001E000A4E4F4D455F504154
      524F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002001E000756414C4354423008000400000000000100
      044C4349440400010009080000}
    object cdsSubIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsSubIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsSubNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      FixedChar = True
      Size = 30
    end
    object cdsSubNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      FixedChar = True
      Size = 30
    end
    object cdsSubVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
  object CMspSub: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 AS IDPATRO,'
      '       0 AS IDPLANOPREV,'
      '       '#39'                              '#39' AS NOME_PLANO,'
      
        '       '#39'                              '#39' AS NOME_PATRO,          ' +
        '           '
      '       0 AS VALCTB0'
      '  FROM DUAL'
      ' WHERE 1=2'
      '')
    ClientDataSet = cdsSub
    Left = 23
    Top = 120
  end
  object dsSub: TDataSource
    DataSet = cdsSub
    Left = 184
    Top = 120
  end
  object pplSub: TppBDEPipeline
    DataSource = dsSub
    UserName = 'pplSub'
    Left = 261
    Top = 120
    object pplSubppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplSubppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplSubppField3: TppField
      FieldAlias = 'NOME_PLANO'
      FieldName = 'NOME_PLANO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object pplSubppField4: TppField
      FieldAlias = 'NOME_PATRO'
      FieldName = 'NOME_PATRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object pplSubppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
end
