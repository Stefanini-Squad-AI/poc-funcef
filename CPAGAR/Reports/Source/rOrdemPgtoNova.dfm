inherited rptOrdemPgtoNova: TrptOrdemPgtoNova
  Left = 363
  Width = 577
  Height = 221
  Caption = 'rptOrdemPgtoNova'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Orden de Pago'
    Params = <
      item
        Caption = 'Fecha Inicial:'
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
        Caption = 'Fecha Final:'
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
        Caption = 'Alterador para Retencion:'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT CODALTERADOR, DESCRICAO'
          'FROM TIPOALTERADOR'
          'WHERE (RECPAG = '#39'P'#39')'
          '     AND (ACRESDECRES  = '#39'D'#39')')
        LookupSettings.Chave = 'CODALTERADOR'
        LookupSettings.Display = 'Descricao'
        LookupSettings.Descricao = 'DESCRICAO'
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
        Caption = 'Numero de la OP Inicial:'
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
        Caption = 'Numero de la OP Final:'
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
    Formheight = 200
    FormWidth = 500
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpOrdemPagoArg
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
  end
  object sqlOrdemPago: TCMSqlParams
    SQL.Strings = (
      'SELECT P.RAZAOSOCIAL, P.NOME, D.NODOCUMENTO, D.COMPLDOCUMENTO,'
      '       DL.VALOR AS VALORORIGINAL, LD.VALOR AS VALORPAGO,'
      
        '       D.CODDOCUMENTO, D.DATAPROGRAMADA, TOTL.VALOR AS TOTALLOTE' +
        ','
      '       LP.NUMLOTE, LP.NUMCHQBORDERO, LP.DATAEMISSAO,'
      '       RS.VALOR AS VALORRETENCAO, PF.DESCRICAO,'
      '       LP.FAVORECIDO, L.HISTORICOCOMPL, LP.NUMSLIP,'
      '       (NVL(RS.VALOR,0)+TOTL.VALOR) AS VALORANTESRET'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     LOTEPAGTO LP,'
      '     LOTEXDOCUM LD,'
      '     PORTADORFORMA PF,'
      '     PESSOA P,'
      '     (SELECT L.NUMLOTE,SUM(LD.VALOR) AS VALOR'
      '       FROM LOTEPAGTO L, LOTEXDOCUM LD'
      '       WHERE (L.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '         AND (L.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '         AND (L.IDPESSOA = :IDEMPRESA)'
      '         AND (LD.NUMLOTE = L.NUMLOTE)'
      '      GROUP BY L.NUMLOTE) TOTL,'
      
        '     (SELECT L.DATALANCTO,D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C' +
        #39', L.VALOR,L.VALOR*-1)) AS VALOR'
      
        '      FROM DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LD, LOTEPAGTO ' +
        'LP'
      '      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '        AND (LP.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.IDPESSOA = :IDEMPRESA)'
      '        AND (LP.NUMLOTE = LD.NUMLOTE)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (L.OPERACAO <> '#39'5 '#39')'
      '      GROUP BY L.DATALANCTO,D.CODDOCUMENTO) DL,'
      ''
      
        '     (SELECT LP.NUMLOTE, SUM(DECODE(L.DEBCRE,'#39'D'#39', L.VALOR,L.VALO' +
        'R*-1)) AS VALOR'
      
        '      FROM DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LD, LOTEPAGTO ' +
        'LP'
      '      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '        AND (LP.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.IDPESSOA = :IDEMPRESA)'
      '        AND (LP.NUMLOTE = LD.NUMLOTE)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (L.CODALTERADOR = :CODALTERADOR)'
      '      GROUP BY LP.NUMLOTE) RS'
      'WHERE (LP.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (LP.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      ''
      '  AND (LP.IDPESSOA = :IDEMPRESA)'
      '  AND (D.CODDOCUMENTO  = LD.CODDOCUMENTO)'
      '  AND (PF.CODPORTFORMA = LP.CODPORTFORMA)'
      '  AND (LP.NUMLOTE = LD.NUMLOTE)'
      '  AND (TOTL.NUMLOTE = LP.NUMLOTE)'
      '  AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (L.OPERACAO <> '#39'5 '#39')'
      '  AND (D.CODDOCUMENTO = DL.CODDOCUMENTO)'
      '  AND (D.OPERACAO = L.OPERACAO)'
      '  AND (L.DATALANCTO = DL.DATALANCTO)'
      '  AND (P.IDPESSOA = D.IDFORCLI)'
      '  AND (LP.NUMLOTE = RS.NUMLOTE(+))'
      'ORDER BY NUMLOTE'
      ''
      ' ')
    ClientDataSet = cdsOrdemPago
    Left = 37
    Top = 65
  end
  object cdsOrdemPago: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 117
    Top = 62
  end
  object sqlResContab: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PLC.PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME, ' +
        'LC.LACVALOR,'
      
        '       LC.LACDEBCRE,LC.CODCENTROCUSTO,LC.CODSUBCONTA, CC.NOME AS' +
        ' NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     LOTEPAGTO LP,'
      '     LOTEXDOCUM LD,'
      '     PLANILHA PLC,'
      '     LANCAMENTO LC,'
      '     PLANOCONTA PC,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (D.CODDOCUMENTO  = LD.CODDOCUMENTO)'
      '  AND (LP.NUMLOTE = LD.NUMLOTE)'
      '  AND (L.PLNCODIGO = PLC.PLNCODIGO)'
      '  AND (PLC.PLNCODIGO = LC.PLNCODIGO)'
      '  AND (L.OPERACAO <> '#39'5 '#39')'
      '  AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (PC.PLANO = LC.PLANO)'
      '  AND (PC.PLACONTA = LC.PLACONTA)'
      '  AND (LC.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (LC.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (LC.IDEMPRESA = CC.IDEMPRESA(+))'
      'UNION ALL'
      
        'SELECT 0 AS PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME,' +
        ' TOTL.LACVALOR,'
      
        '       '#39'C'#39' AS LACDEBCRE,PF.CODCENTROCUSTO,PF.CODSUBCONTA, CC.NOM' +
        'E AS NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM LOTEPAGTO LP,'
      '     PORTADORFORMA PF,'
      '     PLANOCONTA PC,'
      '     (SELECT NUMLOTE,SUM(VALOR) AS LACVALOR'
      '      FROM LOTEXDOCUM WHERE (NUMLOTE = :NUMLOTE)'
      '      GROUP BY NUMLOTE) TOTL,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (PF.CODPORTFORMA = LP.CODPORTFORMA)'
      '  AND (PC.PLANO = PF.PLANO)'
      '  AND (PC.PLACONTA = PF.PLACONTA)'
      '  AND (TOTL.NUMLOTE = LP.NUMLOTE)'
      '  AND (PF.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (PF.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (PF.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (PF.IDEMPRESA = CC.IDEMPRESA(+))'
      'UNION ALL'
      'SELECT 0 AS PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME,'
      '       SUM(LD.VALOR) AS LACVALOR,'
      
        '       '#39'D'#39' AS LACDEBCRE,D.CODCENTROCUSTO,D.CODSUBCONTA, CC.NOME ' +
        'AS NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM LOTEPAGTO LP,'
      '     PLANOCONTA PC,'
      '     LOTEXDOCUM LD,'
      '     DOCUMENTO D,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (PC.PLANO = D.PLANO)'
      '  AND (PC.PLACONTA = D.PLACONTA)'
      '  AND (LD.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (LD.NUMLOTE = LP.NUMLOTE)'
      '  AND (D.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (D.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (D.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (D.IDEMPRESA = CC.IDEMPRESA(+))'
      
        'GROUP BY PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME, D.CODCENTROCU' +
        'STO,D.CODSUBCONTA, CC.NOME,'
      '       SC.NOMESUBCONTA'
      '')
    ClientDataSet = cdsResContab
    Left = 37
    Top = 137
  end
  object cdsResContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 117
    Top = 142
  end
  object pplResContab: TppBDEPipeline
    DataSource = dsResContab
    UserName = 'lResContab'
    Left = 269
    Top = 142
    MasterDataPipelineName = 'pplOrdemPago'
  end
  object dsResContab: TwwDataSource
    DataSet = qryResContab
    Left = 186
    Top = 136
  end
  object rpOrdemPagoArg: TppReport
    AutoStop = False
    DataPipeline = pplOrdemPago
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 16000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 6000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 376
    Top = 29
    Version = '7.04'
    mmColumnWidth = 194000
    DataPipelineName = 'pplOrdemPago'
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpFaturaEmiteDBText2: TppDBText
        UserName = 'rpFaturaEmiteDBText2'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplOrdemPago
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 30956
        mmTop = 265
        mmWidth = 50800
        BandType = 4
      end
      object rpFaturaEmiteDBText3: TppDBText
        UserName = 'rpFaturaEmiteDBText3'
        DataField = 'NODOCUMENTO'
        DataPipeline = pplOrdemPago
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object rpFaturaEmiteDBText4: TppDBText
        UserName = 'rpFaturaEmiteDBText4'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplOrdemPago
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'VALORORIGINAL'
        DataPipeline = pplOrdemPago
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 139965
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'VALORPAGO'
        DataPipeline = pplOrdemPago
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = pplOrdemPago
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemPago'
        mmHeight = 3175
        mmLeft = 104511
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 36248
        mmWidth = 192617
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 34925
        mmWidth = 194000
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
        mmLeft = 794
        mmTop = 36248
        mmWidth = 192882
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 36248
        mmWidth = 26194
        BandType = 8
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 10583
        mmLeft = 7673
        mmTop = 5292
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Recebi de ....'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 19579
        mmWidth = 183357
        BandType = 8
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 10583
        mmLeft = 55033
        mmTop = 5292
        mmWidth = 32015
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 10583
        mmLeft = 102394
        mmTop = 5292
        mmWidth = 32015
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 10583
        mmLeft = 150284
        mmTop = 5292
        mmWidth = 32015
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 17992
        mmWidth = 194000
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Firmas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5027
        mmTop = 1323
        mmWidth = 14023
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 194000
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Emitio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 6085
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Reviso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 55563
        mmTop = 6085
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Controller'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 6085
        mmWidth = 16140
        BandType = 8
      end
      object ppLabel31: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Emitio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 14023
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 10583
        mmLeft = 28840
        mmTop = 23548
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Firma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 29369
        mmTop = 24342
        mmWidth = 14023
        BandType = 8
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 10583
        mmLeft = 79111
        mmTop = 23548
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Aclaracion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 79640
        mmTop = 24342
        mmWidth = 16933
        BandType = 8
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 10583
        mmLeft = 129382
        mmTop = 23548
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'D.N.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 129911
        mmTop = 24342
        mmWidth = 14023
        BandType = 8
      end
    end
    object rpFaturaEmiteSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object rpFaturaEmiteGroup1: TppGroup
      BreakName = 'NUMLOTE'
      DataPipeline = pplOrdemPago
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'rpFaturaEmiteGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrdemPago'
      object rpFaturaEmiteGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 49742
        mmPrintPosition = 0
        object rpFaturaEmiteDBText1: TppDBText
          UserName = 'rpFaturaEmiteDBText1'
          DataField = 'DATAEMISSAO'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 5027
          mmLeft = 163248
          mmTop = 13229
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object rpFaturaEmiteLabel1: TppLabel
          UserName = 'rpFaturaEmiteLabel1'
          AutoSize = False
          Caption = 'Fecha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 141552
          mmTop = 13229
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppImage1: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          mmHeight = 24342
          mmLeft = 5027
          mmTop = 1323
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object pplblTitFatEmit: TppLabel
          UserName = 'pplblTitFatEmit'
          AutoSize = False
          Caption = 'Orden de Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 141817
          mmTop = 265
          mmWidth = 47096
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 139700
          mmTop = 6879
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NUMSLIP'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 5027
          mmLeft = 163248
          mmTop = 6879
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 141552
          mmTop = 19579
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'TOTALLOTE'
          DataPipeline = pplOrdemPago
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 5027
          mmLeft = 163248
          mmTop = 19579
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 32015
          mmWidth = 194000
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 39688
          mmWidth = 194000
          BandType = 3
          GroupNo = 0
        end
        object LblEmpresa: TppLabel
          UserName = 'LblEmpresa'
          AutoSize = False
          Caption = 'LblEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5821
          mmLeft = 35719
          mmTop = 1588
          mmWidth = 102923
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Destinatario:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 1852
          mmTop = 33867
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'FAVORECIDO'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 5027
          mmLeft = 28840
          mmTop = 33867
          mmWidth = 157692
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Documentos Cancelados por este Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2381
          mmTop = 41275
          mmWidth = 68263
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 45508
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Proveedor/Beneficiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 30956
          mmTop = 45508
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Fecha Venc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 82815
          mmTop = 45508
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Detalle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 104511
          mmTop = 45508
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Valor Original'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 139965
          mmTop = 45508
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166159
          mmTop = 45508
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFaturaEmiteGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 30427
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          OnPrint = ppLabel11Print
          UserName = 'Label11'
          Caption = 'Label11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 31485
          mmTop = 20373
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Label12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 31485
          mmTop = 25135
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Valor en Letras:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 20373
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 1588
          mmWidth = 194000
          BandType = 5
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 10583
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Nº Cheque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 15346
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Fecha de Emission:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 64029
          mmTop = 15346
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Fecha Diferida:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 128059
          mmTop = 15346
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 4233
          mmLeft = 25135
          mmTop = 15346
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'DATAEMISSAO'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 4233
          mmLeft = 100013
          mmTop = 15346
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'DESCRICAO'
          DataPipeline = pplOrdemPago
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 4233
          mmLeft = 18521
          mmTop = 10583
          mmWidth = 96838
          BandType = 5
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Valor a Pagar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 138377
          mmTop = 2117
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Valor de la Retencion Sufrida:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 119327
          mmTop = 6085
          mmWidth = 44450
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 117211
          mmTop = 10319
          mmWidth = 76729
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Valor do Cheque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 138377
          mmTop = 11113
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText401'
          DataField = 'VALORANTESRET'
          DataPipeline = pplOrdemPago
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 3175
          mmLeft = 164042
          mmTop = 2381
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'VALORRETENCAO'
          DataPipeline = pplOrdemPago
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 3175
          mmLeft = 164042
          mmTop = 6350
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'TOTALLOTE'
          DataPipeline = pplOrdemPago
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrdemPago'
          mmHeight = 3175
          mmLeft = 164042
          mmTop = 11377
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMLOTE'
      DataPipeline = pplOrdemPago
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrdemPago'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpFaturaEmiteSubReport1: TppSubReport
          UserName = 'rpFaturaEmiteSubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplResContab'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 194000
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFaturaEmiteChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplResContab
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 16000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 6000
            PrinterSetup.mmMarginTop = 13000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplResContab'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 10848
              mmPrintPosition = 0
              object rpFaturaEmiteLabel4: TppLabel
                UserName = 'rpFaturaEmiteLabel4'
                AutoSize = False
                Caption = 'Contabilizacion'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 2646
                mmTop = 2646
                mmWidth = 29104
                BandType = 1
              end
              object ppLabel22: TppLabel
                UserName = 'Label22'
                AutoSize = False
                Caption = 'Planilla'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 3440
                mmTop = 6879
                mmWidth = 19050
                BandType = 1
              end
              object ppLabel21: TppLabel
                UserName = 'Label21'
                AutoSize = False
                Caption = 'Cuenta Contable'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 23019
                mmTop = 6879
                mmWidth = 25665
                BandType = 1
              end
              object ppLabel23: TppLabel
                UserName = 'Label23'
                AutoSize = False
                Caption = 'Descripcion'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 57415
                mmTop = 6879
                mmWidth = 19050
                BandType = 1
              end
              object ppLabel24: TppLabel
                UserName = 'Label24'
                AutoSize = False
                Caption = 'Centro de Costo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 100806
                mmTop = 6879
                mmWidth = 32279
                BandType = 1
              end
              object ppLabel25: TppLabel
                UserName = 'Label25'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 162454
                mmTop = 6879
                mmWidth = 22225
                BandType = 1
              end
              object ppLine1: TppLine
                UserName = 'Line2'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 2117
                mmLeft = 0
                mmTop = 1058
                mmWidth = 194000
                BandType = 1
              end
            end
            object rpFaturaEmiteChildReport1DetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object rpFaturaEmiteDBText6: TppDBText
                UserName = 'rpFaturaEmiteDBText6'
                DataField = 'PLNPLANIL'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 3440
                mmTop = 529
                mmWidth = 17727
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'PLACONCORRESP'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 23019
                mmTop = 529
                mmWidth = 33073
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'PLANOME'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 57415
                mmTop = 529
                mmWidth = 42863
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'CODCENTROCUSTO'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 100806
                mmTop = 529
                mmWidth = 25400
                BandType = 4
              end
              object ppDBText14: TppDBText
                UserName = 'DBText14'
                DataField = 'NOMECC'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 127265
                mmTop = 529
                mmWidth = 31221
                BandType = 4
              end
              object ppDBText15: TppDBText
                UserName = 'DBText15'
                DataField = 'LACVALOR'
                DataPipeline = pplResContab
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 159279
                mmTop = 529
                mmWidth = 25400
                BandType = 4
              end
              object ppDBText16: TppDBText
                UserName = 'DBText16'
                DataField = 'LACDEBCRE'
                DataPipeline = pplResContab
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplResContab'
                mmHeight = 3175
                mmLeft = 185738
                mmTop = 529
                mmWidth = 5821
                BandType = 4
              end
            end
          end
        end
      end
    end
  end
  object pplOrdemPago: TppBDEPipeline
    DataSource = dsOrdemPago
    UserName = 'lOrdemPago'
    Left = 309
    Top = 64
    object pplOrdemPagoppField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplOrdemPagoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplOrdemPagoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplOrdemPagoppField4: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 3
    end
    object pplOrdemPagoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORIGINAL'
      FieldName = 'VALORORIGINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplOrdemPagoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPAGO'
      FieldName = 'VALORPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplOrdemPagoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplOrdemPagoppField8: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplOrdemPagoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALLOTE'
      FieldName = 'TOTALLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplOrdemPagoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplOrdemPagoppField11: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object pplOrdemPagoppField12: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object pplOrdemPagoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRETENCAO'
      FieldName = 'VALORRETENCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplOrdemPagoppField14: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object pplOrdemPagoppField15: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplOrdemPagoppField16: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object pplOrdemPagoppField17: TppField
      FieldAlias = 'NUMSLIP'
      FieldName = 'NUMSLIP'
      FieldLength = 11
      DisplayWidth = 11
      Position = 16
    end
    object pplOrdemPagoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORANTESRET'
      FieldName = 'VALORANTESRET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
  end
  object dsOrdemPago: TwwDataSource
    DataSet = qryOrdemPago
    Left = 191
    Top = 64
  end
  object qryOrdemPago: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.RAZAOSOCIAL, P.NOME, D.NODOCUMENTO, D.COMPLDOCUMENTO,'
      '       L.VALOR AS VALORORIGINAL, LD.VALOR AS VALORPAGO,'
      
        '       D.CODDOCUMENTO, D.DATAPROGRAMADA, TOTL.VALOR AS TOTALLOTE' +
        ','
      '       LP.NUMLOTE, LP.NUMCHQBORDERO, LP.DATAEMISSAO,'
      '       RS.VALOR AS VALORRETENCAO, PF.DESCRICAO,'
      '       LP.FAVORECIDO, L.HISTORICOCOMPL, LP.NUMSLIP,'
      '       (NVL(RS.VALOR,0)+TOTL.VALOR) AS VALORANTESRET'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     LOTEPAGTO LP,'
      '     LOTEXDOCUM LD,'
      '     PORTADORFORMA PF,'
      '     PESSOA P,'
      '     (SELECT L.NUMLOTE,SUM(LD.VALOR) AS VALOR'
      '       FROM LOTEPAGTO L, LOTEXDOCUM LD'
      '       WHERE (L.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '         AND (L.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '         AND (L.IDPESSOA = :IDEMPRESA)'
      '         AND (LD.NUMLOTE = L.NUMLOTE)'
      '      GROUP BY L.NUMLOTE) TOTL,'
      
        '     (SELECT LP.NUMLOTE, SUM(DECODE(L.DEBCRE,'#39'D'#39', L.VALOR,L.VALO' +
        'R*-1)) AS VALOR'
      
        '      FROM DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LD, LOTEPAGTO ' +
        'LP'
      '      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '        AND (D.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '        AND (LP.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '        AND (LP.IDPESSOA = :IDEMPRESA)'
      '        AND (LP.NUMLOTE = LD.NUMLOTE)'
      '        AND (D.RECPAG = '#39'P'#39')'
      '        AND (L.CODALTERADOR = :CODALTERADOR)'
      '      GROUP BY LP.NUMLOTE) RS'
      'WHERE (LP.DATAEMISSAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (LP.DATAEMISSAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND (1 = 1)'
      '  AND (LP.IDPESSOA = :IDEMPRESA)'
      '  AND (D.CODDOCUMENTO  = LD.CODDOCUMENTO)'
      '  AND (PF.CODPORTFORMA = LP.CODPORTFORMA)'
      '  AND (LP.NUMLOTE = LD.NUMLOTE)'
      '  AND (TOTL.NUMLOTE = LP.NUMLOTE)'
      '  AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (D.OPERACAO = L.OPERACAO)'
      '  AND (P.IDPESSOA = D.IDFORCLI)'
      '  AND (LP.NUMLOTE = RS.NUMLOTE(+))'
      '  AND (EXISTS (SELECT R.NUMLOTE'
      '               FROM RECBTOPAGTO R'
      '               WHERE (R.CODDOCUMENTO = D.CODDOCUMENTO)'
      '                 AND (R.NUMLOTE = LP.NUMLOTE)))'
      'ORDER BY NUMLOTE'
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updOrdemPago
    ValidateWithMask = True
    Left = 336
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
        Value = '12/09/1900'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
        Value = '12/09/1900'
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
        Value = '14'
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryResContab: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsOrdemPago
    SQL.Strings = (
      
        'SELECT PLC.PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME, ' +
        'LC.LACVALOR,'
      
        '       LC.LACDEBCRE,LC.CODCENTROCUSTO,LC.CODSUBCONTA, CC.NOME AS' +
        ' NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L,'
      '     LOTEPAGTO LP,'
      '     LOTEXDOCUM LD,'
      '     PLANILHA PLC,'
      '     LANCAMENTO LC,'
      '     PLANOCONTA PC,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (D.CODDOCUMENTO  = LD.CODDOCUMENTO)'
      '  AND (LP.NUMLOTE = LD.NUMLOTE)'
      '  AND (L.PLNCODIGO = PLC.PLNCODIGO)'
      '  AND (PLC.PLNCODIGO = LC.PLNCODIGO)'
      '  AND (L.OPERACAO <> '#39'5 '#39')'
      '  AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (PC.PLANO = LC.PLANO)'
      '  AND (PC.PLACONTA = LC.PLACONTA)'
      '  AND (LC.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (LC.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (LC.IDEMPRESA = CC.IDEMPRESA(+))'
      'UNION ALL'
      
        'SELECT 0 AS PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME,' +
        ' TOTL.LACVALOR,'
      
        '       '#39'C'#39' AS LACDEBCRE,PF.CODCENTROCUSTO,PF.CODSUBCONTA, CC.NOM' +
        'E AS NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM LOTEPAGTO LP,'
      '     PORTADORFORMA PF,'
      '     PLANOCONTA PC,'
      '     (SELECT NUMLOTE,SUM(VALOR) AS LACVALOR'
      '      FROM LOTEXDOCUM WHERE (NUMLOTE = :NUMLOTE)'
      '      GROUP BY NUMLOTE) TOTL,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (PF.CODPORTFORMA = LP.CODPORTFORMA)'
      '  AND (PC.PLANO = PF.PLANO)'
      '  AND (PC.PLACONTA = PF.PLACONTA)'
      '  AND (TOTL.NUMLOTE = LP.NUMLOTE)'
      '  AND (PF.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (PF.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (PF.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (PF.IDEMPRESA = CC.IDEMPRESA(+))'
      'UNION ALL'
      'SELECT 0 AS PLNPLANIL, PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME,'
      '       SUM(LD.VALOR) AS LACVALOR,'
      
        '       '#39'D'#39' AS LACDEBCRE,D.CODCENTROCUSTO,D.CODSUBCONTA, CC.NOME ' +
        'AS NOMECC,'
      '       SC.NOMESUBCONTA'
      'FROM LOTEPAGTO LP,'
      '     PLANOCONTA PC,'
      '     LOTEXDOCUM LD,'
      '     DOCUMENTO D,'
      '     SUBCONTA SC,'
      '     CENTCUST CC'
      'WHERE (LP.NUMLOTE = :NUMLOTE)'
      '  AND (PC.PLANO = D.PLANO)'
      '  AND (PC.PLACONTA = D.PLACONTA)'
      '  AND (LD.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (LD.NUMLOTE = LP.NUMLOTE)'
      '  AND (D.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND (D.IDPESSOA = SC.IDPESSOA(+))'
      '  AND (D.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (D.IDEMPRESA = CC.IDEMPRESA(+))'
      
        'GROUP BY PC.PLACONTA, PC.PLACONCORRESP,PC.PLANOME, D.CODCENTROCU' +
        'STO,D.CODSUBCONTA, CC.NOME,'
      '       SC.NOMESUBCONTA'
      '')
    ValidateWithMask = True
    Left = 416
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end>
  end
  object ExtensoOP: TExtensoCM
    TamanhoLinha = 0
    Idioma = ieEspanhol
    CompletaExtenso = False
    Left = 230
    Top = 8
  end
  object updOrdemPago: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPODEBCRED'
      'set'
      '  IDGRUPODC = :IDGRUPODC,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDGRUPODC = :OLD_IDGRUPODC')
    InsertSQL.Strings = (
      'insert into GRUPODEBCRED'
      '  (IDGRUPODC, DESCRICAO)'
      'values'
      '  (:IDGRUPODC, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from GRUPODEBCRED'
      'where'
      '  IDGRUPODC = :OLD_IDGRUPODC')
    Left = 435
    Top = 62
  end
end
