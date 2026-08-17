inherited dtmRelHistoricoContratual: TdtmRelHistoricoContratual
  Left = 299
  Top = 234
  Caption = 'dtmRelHistoricoContratual'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'iIdImovelMestre'
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
        Name = 'iIdImovelMestre'
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
        Caption = 'iIdContrato'
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
        Name = 'iIdContrato'
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
        Caption = 'iAnoInicial'
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
        Name = 'iAnoInicial'
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
        Caption = 'iAnoFinal'
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
        Name = 'iAnoFinal'
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
        Caption = 'bSemContrato'
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
        Name = 'bSemContrato'
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
        Caption = 'iIdLocatario'
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
        Name = 'iIdLocatario'
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
        Caption = 'bConverte'
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
        Name = 'bConverte'
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
    DataBaseName = 'BaseDados'
    Report = rptHistorico
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Active = False
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IM.IMONOME AS NOME_MESTRE, LI.IDIMOVELMESTRE, CI.CONNOME,' +
        ' CI.CONNUMERO, CI.IDCONTRATOIMOVEL,'
      
        '       T.DESCCUSTORECIMO, TO_CHAR(PG.DATALANCTO,'#39'YYYY'#39') AS ANOPA' +
        'GTO, PG.DATALANCTO, LI.DATAVENCIMENTO,'
      
        '       TO_CHAR(LI.MESCOMPETENCIA,'#39'00'#39') || '#39'/'#39' || TO_CHAR(LI.ANOC' +
        'OMPETENCIA) AS COMPETENCIA,'
      
        '       D.CODDOCUMENTO, NVL(LI.VLRRECEB,0) AS VLRRECEB, NVL(PG.VL' +
        'RPAGO,0)  AS VLRPAGO,'
      '       SUM( DECODE(RTRIM(LD.OPERACAO),'#39'4'#39','
      
        '                   DECODE(LD.CODALTERADOR,TI.CODALTJUROS,LD.VALO' +
        'R,0),0 ) )   AS JUROS,'
      '       SUM( DECODE(RTRIM(LD.OPERACAO),'#39'4'#39','
      
        '                   DECODE(LD.CODALTERADOR,TI.CODALTMULTA,LD.VALO' +
        'R,0),0 ) )   AS MULTA,'
      '       SUM( DECODE(RTRIM(LD.OPERACAO),'#39'4'#39','
      
        '                   DECODE(LD.CODALTERADOR,TI.CODALTCORRMON,LD.VA' +
        'LOR,0),0 ) ) AS CORRECAO,'
      '       SUM( DECODE(RTRIM(LD.OPERACAO),'#39'4'#39','
      '                   DECODE(LD.CODALTERADOR,TI.CODALTJUROS,0,'
      '                   DECODE(LD.CODALTERADOR,TI.CODALTMULTA,0,'
      '                   DECODE(LD.CODALTERADOR,TI.CODALTCORRMON,0,'
      
        '                   DECODE(LD.DEBCRE, '#39'C'#39', LD.VALOR *(-1), LD.VAL' +
        'OR) ))),0 ) ) AS OUTROS'
      ''
      
        'FROM TIPOCUSTORECIMOV T, DOCUMENTO D, LANCTODOCUM LD, TIPOIMOVEL' +
        ' TI, CONTRATOIMOVEL CI, IMOVEL IM,'
      ''
      '       /* TOTALIZA LANCAMENTOSIMOVEL */'
      '       ( SELECT L.CODDOCUMENTO,'
      '                L.IDCONTRATOIMOVEL,'
      '                I.IDIMOVELMESTRE,'
      '                L.IDTIPOCUSTORECIMO,'
      '                L.DATAVENCIMENTO,'
      '                L.MESCOMPETENCIA,'
      '                L.ANOCOMPETENCIA,'
      '                L.CODTIPIMOVEL,'
      '                SUM(L.VLRLANCRECEB) AS VLRRECEB'
      '           FROM LANCAMENTOSIMOVEL L, IMOVEL I'
      '          WHERE L.IDIMOVEL     = I.IDIMOVEL'
      '            AND L.RECPAG       = '#39'R'#39
      '            AND L.IDPESSOA     = 2'
      '            AND L.FLGESTORNADO = NULL'
      
        '          GROUP BY L.CODDOCUMENTO, L.IDCONTRATOIMOVEL, I.IDIMOVE' +
        'LMESTRE, L.IDTIPOCUSTORECIMO,'
      
        '                   L.DATAVENCIMENTO, L.MESCOMPETENCIA, L.ANOCOMP' +
        'ETENCIA, L.CODTIPIMOVEL ) LI,'
      ''
      '       /* VALOR PAGO */'
      
        '       (SELECT LD2.CODDOCUMENTO, LD2.DATALANCTO, SUM(LD2.VALOR) ' +
        'AS VLRPAGO'
      '          FROM LANCTODOCUM LD2, DOCUMENTO D'
      '         WHERE LD2.CODDOCUMENTO = D.CODDOCUMENTO'
      '           AND RTRIM(LD2.OPERACAO) = '#39'5'#39' /*VLR RECEBIDO*/'
      '           AND D.IDPESSOA = 2 /*SUBSTITUIR POR PARÂMETRO*/'
      '           AND D.IDMODULO = 64'
      '        GROUP BY LD2.CODDOCUMENTO, LD2.DATALANCTO'
      '        ORDER BY CODDOCUMENTO) PG'
      ''
      ' WHERE ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( LI.IDCONTRATOIMOVEL  = CI.IDCONTRATOIMOVEL(+) )'
      '   AND ( LI.IDIMOVELMESTRE    = IM.IDIMOVEL(+) )'
      '   AND ( LI.CODTIPIMOVEL      = TI.CODTIPIMOVEL )'
      '   AND ( RTRIM(LD.OPERACAO) IN('#39'4'#39','#39'5'#39' ) )'
      '   AND ( D.CODDOCUMENTO       = LD.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO       = LI.CODDOCUMENTO )'
      '   AND ( D.CODDOCUMENTO       = PG.CODDOCUMENTO )'
      
        '   AND ( TO_NUMBER(TO_CHAR(LD.DATALANCTO,'#39'YYYY'#39')) BETWEEN 2000 A' +
        'ND 2004 )'
      ''
      
        'GROUP BY IM.IMONOME, LI.IDIMOVELMESTRE, CI.CONNOME, CI.CONNUMERO' +
        ', CI.IDCONTRATOIMOVEL,'
      
        '         T.DESCCUSTORECIMO, TO_CHAR(PG.DATALANCTO,'#39'YYYY'#39'), PG.DA' +
        'TALANCTO,'
      
        '         LI.DATAVENCIMENTO, TO_CHAR(LI.MESCOMPETENCIA,'#39'00'#39') || '#39 +
        '/'#39' || TO_CHAR(LI.ANOCOMPETENCIA),'
      '         D.CODDOCUMENTO, NVL(LI.VLRRECEB,0), NVL(PG.VLRPAGO,0)'
      ''
      
        'ORDER BY NOME_MESTRE, CONNOME, IDCONTRATOIMOVEL, ANOPAGTO, DATAL' +
        'ANCTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
  end
  object ppHistotico: TppBDEPipeline
    DataSource = ds
    UserName = 'ppHistotico'
    Left = 184
    Top = 64
  end
  object rptHistorico: TppReport
    AutoStop = False
    DataPipeline = ppHistotico
    PassSetting = psTwoPass
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
    DataPipelineName = 'ppHistotico'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
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
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
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
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Histórico Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8202
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATALANCTO'
        DataPipeline = ppHistotico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 27781
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'JUROS'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 105040
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MULTA'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 120915
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CORRECAO'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = ppHistotico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 265
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = ppHistotico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRRECEB'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 76729
        mmTop = 265
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRPAGO'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 168805
        mmTop = 265
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'OUTROS'
        DataPipeline = ppHistotico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 152665
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'COMPETENCIA'
        DataPipeline = ppHistotico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppHistotico'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
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
        mmTop = 1588
        mmWidth = 197115
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 65617
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 1588
        mmWidth = 35454
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'IDIMOVELMESTRE'
      DataPipeline = ppHistotico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistotico'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'NOME_MESTRE'
          DataPipeline = ppHistotico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistotico'
          mmHeight = 4233
          mmLeft = 27517
          mmTop = 2910
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Imóvel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 2910
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 1588
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region3'
          mmHeight = 5027
          mmLeft = 15610
          mmTop = 265
          mmWidth = 181769
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel14: TppLabel
            UserName = 'Label14'
            Caption = 'TOTAL IMÓVEL MESTRE: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 17197
            mmTop = 1058
            mmWidth = 35454
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc11: TppDBCalc
            UserName = 'DBCalc11'
            DataField = 'VLRRECEB'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 66940
            mmTop = 1058
            mmWidth = 36777
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc12: TppDBCalc
            UserName = 'DBCalc12'
            DataField = 'JUROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 105040
            mmTop = 1058
            mmWidth = 15346
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc13: TppDBCalc
            UserName = 'DBCalc13'
            DataField = 'MULTA'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 120915
            mmTop = 1058
            mmWidth = 15346
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc14: TppDBCalc
            UserName = 'DBCalc14'
            DataField = 'CORRECAO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 136790
            mmTop = 1058
            mmWidth = 15346
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc15: TppDBCalc
            UserName = 'DBCalc101'
            DataField = 'VLRPAGO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 168805
            mmTop = 1058
            mmWidth = 27252
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc18: TppDBCalc
            UserName = 'DBCalc18'
            DataField = 'OUTROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup4
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 152665
            mmTop = 1058
            mmWidth = 15346
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = ppHistotico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistotico'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14737632
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1588
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'CONNOME'
          DataPipeline = ppHistotico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistotico'
          mmHeight = 4233
          mmLeft = 18521
          mmTop = 1588
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Contrato: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 1588
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'CONNUMERO'
          DataPipeline = ppHistotico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistotico'
          mmHeight = 4233
          mmLeft = 171186
          mmTop = 1588
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 164836
          mmTop = 1588
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          mmHeight = 5027
          mmLeft = 15610
          mmTop = 1852
          mmWidth = 181769
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel13: TppLabel
            UserName = 'Label13'
            Caption = 'TOTAL CONTRATO: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 17462
            mmTop = 2645
            mmWidth = 27517
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc6: TppDBCalc
            UserName = 'DBCalc6'
            DataField = 'VLRRECEB'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 66940
            mmTop = 2646
            mmWidth = 36777
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc7: TppDBCalc
            UserName = 'DBCalc7'
            DataField = 'JUROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 105040
            mmTop = 2646
            mmWidth = 15346
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc8: TppDBCalc
            UserName = 'DBCalc8'
            DataField = 'MULTA'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 120915
            mmTop = 2646
            mmWidth = 15346
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc9: TppDBCalc
            UserName = 'DBCalc9'
            DataField = 'CORRECAO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 136790
            mmTop = 2646
            mmWidth = 15346
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc10: TppDBCalc
            UserName = 'DBCalc10'
            DataField = 'VLRPAGO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 168805
            mmTop = 2646
            mmWidth = 27252
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc17: TppDBCalc
            UserName = 'DBCalc17'
            DataField = 'OUTROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup5
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 152665
            mmTop = 2646
            mmWidth = 15346
            BandType = 5
            GroupNo = 1
          end
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'ANOPAGTO'
      DataPipeline = ppHistotico
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistotico'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'ANOPAGTO'
          DataPipeline = ppHistotico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistotico'
          mmHeight = 3440
          mmLeft = 8996
          mmTop = 265
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Ano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 265
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 12435
          mmTop = 4763
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 27781
          mmTop = 4763
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 43392
          mmTop = 4763
          mmWidth = 10054
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 96573
          mmTop = 4763
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 112713
          mmTop = 4763
          mmWidth = 7673
          BandType = 3
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 128852
          mmTop = 4763
          mmWidth = 7408
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Correção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 139700
          mmTop = 4763
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Total Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 181505
          mmTop = 4763
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8466
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Outros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 158750
          mmTop = 4763
          mmWidth = 9260
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 106098
          mmTop = 2381
          mmWidth = 22490
          BandType = 3
          GroupNo = 2
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 147902
          mmTop = 2381
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Alteradores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 129117
          mmTop = 529
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Comp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 4763
          mmWidth = 9790
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 5027
          mmLeft = 15610
          mmTop = 1058
          mmWidth = 181769
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel12: TppLabel
            UserName = 'Label12'
            Caption = 'TOTAL ANO: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 17462
            mmTop = 1852
            mmWidth = 17992
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc5: TppDBCalc
            UserName = 'DBCalc5'
            DataField = 'VLRRECEB'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 66940
            mmTop = 1852
            mmWidth = 36777
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc4: TppDBCalc
            UserName = 'DBCalc4'
            DataField = 'JUROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 105040
            mmTop = 1852
            mmWidth = 15346
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc3: TppDBCalc
            UserName = 'DBCalc3'
            DataField = 'MULTA'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 120915
            mmTop = 1852
            mmWidth = 15346
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            DataField = 'CORRECAO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 136790
            mmTop = 1852
            mmWidth = 15346
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            DataField = 'VLRPAGO'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 168805
            mmTop = 1852
            mmWidth = 27252
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc16: TppDBCalc
            UserName = 'DBCalc16'
            DataField = 'OUTROS'
            DataPipeline = ppHistotico
            DisplayFormat = ',##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup6
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppHistotico'
            mmHeight = 3440
            mmLeft = 152665
            mmTop = 1852
            mmWidth = 15346
            BandType = 5
            GroupNo = 2
          end
        end
      end
    end
  end
end
