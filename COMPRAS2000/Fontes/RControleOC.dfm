inherited RptControleOC: TRptControleOC
  Left = 204
  Top = 259
  Height = 191
  Caption = 'RptControleOC'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Controle de OC'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Nº da OC'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Caption = 'Fornecedor'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT P.RAZAOSOCIAL, P.IDPESSOA '
          'FROM PESSOA P, EMPRESAFORN E'
          'WHERE (P.IDPESSOA = E.IDFORCLI)'
          'ORDER BY 1')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Fornecedor'
        LookupSettings.Tamanho = '40'
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
        Caption = 'Recebimento do Item'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todas'
          'Parcial e Total'
          'Parcial'
          'Total'
          'Não Recebido')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 55
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
        Caption = 'Ordem de Compra'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todas'
          'Entregues'
          'Não Entregues e Vencidas'
          'Não Entregues em dia')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
        Caption = 'Ordem de Compra Data Início'
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
        Caption = 'Ordem de Compra Data Término'
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
        Caption = 'Previsão de Entrega Data Início'
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
        Caption = 'Previsão de Entrega Data Término'
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
        Caption = 'Entrega Data Início'
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
        Caption = 'Entrega Data Término'
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
    Formheight = 390
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = ppControleOC
    LabelEmpresa = ppLabel8
    LabelSistema = rpOrdemCompraLabel5
  end
  object qryControleOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                             '
      '     P.NOME AS FORNECEDOR,'
      '     O.NUMOC,'
      
        '     O.DATAOC,                                                  ' +
        '                             '
      
        '     O.OCATENDIDA,                                              ' +
        '                             '
      
        '     DECODE(O.FLGIMPRESSA,'#39'T'#39','#39'O.C. JÁ IMPRESSA'#39','#39'O.C. NÃO IMPRE' +
        'SSA'#39') AS IIMPRESSA,'
      
        '     O.OBSOC,                                                   ' +
        '                             '
      
        '     I.CODARTIGO,                                               ' +
        '                             '
      
        '     I.CODMEDIDA,                                               ' +
        '                             '
      
        '     DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DE' +
        'SCRICAO,                     '
      
        '     I.VALORUN,                                                 ' +
        '                             '
      
        '     PE.QTDEENTREGA,                                            ' +
        '                             '
      '     PE.DATAENTREGA,'
      '     NF.NUMNF,'
      '     NF.DATAENTDEVOL,'
      
        '     DECODE(INF.QTDERECEBDEVOL,NULL,0,INF.QTDERECEBDEVOL) AS QTD' +
        'ERECEBIDA,'
      '     IMP.TOTIMP,'
      '     IPI.TOTIPI,'
      '     TOT.TOTITEM,'
      '     (I.VALORUN*PE.QTDEENTREGA) AS VALTOTAL,'
      
        '     (DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI)+DECODE(IMP.TOTIMP,NUL' +
        'L,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTOC,'
      '     I.OBSITEMOC'
      'FROM'
      '     PESSOA P,'
      '     ITEMOC I,'
      '     OC O,'
      '     ARTIGO A,'
      '     PRODUTO PR,'
      '     PRODVARI PV,'
      '     PRAZOENTREGAOC PE,'
      '     ITENSRECEBDEVOL INF,'
      '     NFRECEBDEVOL NF,'
      '     (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM'
      '      FROM ITEMOC I, PRAZOENTREGAOC PE'
      '      WHERE (1=1)'
      '        AND (I.IDITEMOC = PE.IDITEMOC)'
      '      GROUP BY I.NUMOC) TOT,'
      '     ((SELECT AOC.NUMOC,'
      
        '              SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AOC.VLRAGREGTOT*-1)' +
        ',AOC.VLRAGREGTOT)) AS TOTIMP'
      '       FROM  AGREGTOTOC AOC,'
      '             TIPOAGRE T'
      '       WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '          AND (UPPER(T.DESCCUSTAGREG) NOT LIKE '#39'IPI'#39'||'#39'%'#39')'
      '          AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '       GROUP BY AOC.NUMOC)'
      '       UNION'
      '      (SELECT I.NUMOC,'
      
        '              SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AI.VLRAGREGITEM*-1)' +
        ',AI.VLRAGREGITEM)) AS TOTIMP'
      '       FROM  AGREGITEMOC AI,'
      '             TIPOAGRE T,'
      '             ITEMOC I'
      '       WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '          AND (UPPER(T.DESCCUSTAGREG) NOT LIKE '#39'IPI'#39'||'#39'%'#39')'
      '          AND (I.IDITEMOC = AI.IDITEMOC)'
      '          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '       GROUP BY I.NUMOC)) IMP,'
      '     ((SELECT AOC.NUMOC,'
      
        '              SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AOC.VLRAGREGTOT*-1)' +
        ',AOC.VLRAGREGTOT)) AS TOTIPI'
      '       FROM  AGREGTOTOC AOC,'
      '             TIPOAGRE T'
      '       WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '          AND (UPPER(T.DESCCUSTAGREG) LIKE '#39'IPI'#39'||'#39'%'#39')'
      '          AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '       GROUP BY AOC.NUMOC)'
      '       UNION'
      '      (SELECT I.NUMOC,'
      
        '              SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AI.VLRAGREGITEM*-1)' +
        ',AI.VLRAGREGITEM)) AS TOTIPI'
      '       FROM  AGREGITEMOC AI,'
      '             TIPOAGRE T,'
      '             ITEMOC I'
      '       WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '          AND (UPPER(T.DESCCUSTAGREG) LIKE '#39'IPI'#39'||'#39'%'#39')'
      '          AND (I.IDITEMOC = AI.IDITEMOC)'
      '          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '       GROUP BY I.NUMOC)) IPI'
      'WHERE  (FLGTIPONOTA = '#39'R'#39')'
      '   AND (O.NUMOC = I.NUMOC)'
      '   AND (O.NUMOC = INF.NUMOC(+))'
      '   AND (INF.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL(+))'
      '   AND (P.IDPESSOA(+) = NF.IDFORCLI)'
      '   AND (I.CODARTIGO = A.CODARTIGO)'
      '   AND (A.CODPRODUTO = PR.CODPRODUTO)'
      '   AND (I.IDPRODVARI = PV.IDPRODVARI(+))'
      '   AND (PE.IDITEMOC = I.IDITEMOC)'
      '   AND (IMP.NUMOC(+) = O.NUMOC)'
      '   AND (IPI.NUMOC(+) = O.NUMOC)'
      '   AND (TOT.NUMOC = O.NUMOC)'
      'ORDER BY O.NUMOC, I.IDITEMOC')
    ValidateWithMask = True
    Left = 214
    Top = 64
    object qryControleOCFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 60
    end
    object qryControleOCNUMOC: TFloatField
      FieldName = 'NUMOC'
    end
    object qryControleOCDATAOC: TDateTimeField
      FieldName = 'DATAOC'
    end
    object qryControleOCOCATENDIDA: TStringField
      FieldName = 'OCATENDIDA'
      Size = 1
    end
    object qryControleOCIIMPRESSA: TStringField
      FieldName = 'IIMPRESSA'
      Size = 17
    end
    object qryControleOCOBSOC: TStringField
      FieldName = 'OBSOC'
      Size = 250
    end
    object qryControleOCCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryControleOCCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryControleOCDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryControleOCVALORUN: TFloatField
      FieldName = 'VALORUN'
    end
    object qryControleOCQTDEENTREGA: TFloatField
      FieldName = 'QTDEENTREGA'
    end
    object qryControleOCDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qryControleOCTOTIMP: TFloatField
      FieldName = 'TOTIMP'
    end
    object qryControleOCTOTIPI: TFloatField
      FieldName = 'TOTIPI'
    end
    object qryControleOCTOTITEM: TFloatField
      FieldName = 'TOTITEM'
    end
    object qryControleOCVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
    end
    object qryControleOCTOTOC: TFloatField
      FieldName = 'TOTOC'
    end
    object qryControleOCOBSITEMOC: TStringField
      FieldName = 'OBSITEMOC'
      Size = 200
    end
    object qryControleOCNUMNF: TFloatField
      FieldName = 'NUMNF'
    end
    object qryControleOCDATAENTDEVOL: TDateTimeField
      FieldName = 'DATAENTDEVOL'
    end
    object qryControleOCQTDERECEBIDA: TFloatField
      FieldName = 'QTDERECEBIDA'
    end
  end
  object dsControleOC: TwwDataSource
    DataSet = qryControleOC
    Left = 127
    Top = 64
  end
  object bdeControleOC: TppBDEPipeline
    DataSource = dsControleOC
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'bdeControleOC'
    Left = 304
    Top = 64
    object bdeControleOCppField1: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object bdeControleOCppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMOC'
      FieldName = 'NUMOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object bdeControleOCppField3: TppField
      FieldAlias = 'DATAOC'
      FieldName = 'DATAOC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object bdeControleOCppField4: TppField
      FieldAlias = 'OCATENDIDA'
      FieldName = 'OCATENDIDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object bdeControleOCppField5: TppField
      FieldAlias = 'IIMPRESSA'
      FieldName = 'IIMPRESSA'
      FieldLength = 17
      DisplayWidth = 17
      Position = 4
    end
    object bdeControleOCppField6: TppField
      FieldAlias = 'OBSOC'
      FieldName = 'OBSOC'
      FieldLength = 250
      DisplayWidth = 250
      Position = 5
    end
    object bdeControleOCppField7: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 6
    end
    object bdeControleOCppField8: TppField
      FieldAlias = 'CODMEDIDA'
      FieldName = 'CODMEDIDA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object bdeControleOCppField9: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object bdeControleOCppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORUN'
      FieldName = 'VALORUN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeControleOCppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEENTREGA'
      FieldName = 'QTDEENTREGA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeControleOCppField12: TppField
      FieldAlias = 'DATAENTREGA'
      FieldName = 'DATAENTREGA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object bdeControleOCppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTIMP'
      FieldName = 'TOTIMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object bdeControleOCppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTIPI'
      FieldName = 'TOTIPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object bdeControleOCppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTITEM'
      FieldName = 'TOTITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object bdeControleOCppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALTOTAL'
      FieldName = 'VALTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object bdeControleOCppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTOC'
      FieldName = 'TOTOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object bdeControleOCppField18: TppField
      FieldAlias = 'OBSITEMOC'
      FieldName = 'OBSITEMOC'
      FieldLength = 200
      DisplayWidth = 200
      Position = 17
    end
    object bdeControleOCppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMNF'
      FieldName = 'NUMNF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object bdeControleOCppField20: TppField
      FieldAlias = 'DATAENTDEVOL'
      FieldName = 'DATAENTDEVOL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object bdeControleOCppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDERECEBIDA'
      FieldName = 'QTDERECEBIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
  end
  object ppControleOC: TppReport
    AutoStop = False
    DataPipeline = bdeControleOC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 32
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeControleOC'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object rpControleOCLine1: TppLine
        UserName = 'rpControleOCLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Controle das Ordens de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 110596
        mmTop = 8731
        mmWidth = 65088
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128852
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LbItem: TppLabel
        UserName = 'LbItem'
        Caption = 'Parcial e Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 36248
        mmTop = 10583
        mmWidth = 20638
        BandType = 0
      end
      object rpOrdemCompraLabel3: TppLabel
        UserName = 'rpOrdemCompraLabel3'
        Caption = 'Recebimento do Item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 10583
        mmWidth = 32808
        BandType = 0
      end
      object LbOrdem: TppLabel
        UserName = 'LbOrdem'
        Caption = 'Não Entregues e Vencidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 36248
        mmTop = 6085
        mmWidth = 38894
        BandType = 0
      end
      object rpOrdemCompraLabel12: TppLabel
        UserName = 'rpOrdemCompraLabel12'
        Caption = 'Ordem de Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 6085
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 16933
        mmWidth = 16669
        BandType = 0
      end
      object rpControleOCLabel1: TppLabel
        UserName = 'rpControleOCLabel1'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 16933
        mmWidth = 11377
        BandType = 0
      end
      object rpControleOCLine2: TppLine
        UserName = 'rpControleOCLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 97896
        mmTop = 19050
        mmWidth = 3440
        BandType = 0
      end
      object rpControleOCLine3: TppLine
        UserName = 'rpControleOCLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 284300
        BandType = 0
      end
      object rpOrdemCompraLabel13: TppLabel
        UserName = 'rpOrdemCompraLabel13'
        AutoSize = False
        Caption = 'Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 117475
        mmTop = 22754
        mmWidth = 16140
        BandType = 0
      end
      object rpControleOCLine4: TppLine
        UserName = 'rpControleOCLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 133879
        mmTop = 19050
        mmWidth = 3440
        BandType = 0
      end
      object rpOrdemCompraLabel2: TppLabel
        UserName = 'rpOrdemCompraLabel2'
        Caption = 'Data Prev. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 99748
        mmTop = 22754
        mmWidth = 15081
        BandType = 0
      end
      object rpOrdemCompraLabel7: TppLabel
        UserName = 'rpOrdemCompraLabel7'
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135202
        mmTop = 22754
        mmWidth = 11642
        BandType = 0
      end
      object rpControleOCLabel2: TppLabel
        UserName = 'rpControleOCLabel2'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 22754
        mmWidth = 16933
        BandType = 0
      end
      object rpControleOCLine5: TppLine
        UserName = 'rpControleOCLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 201084
        mmTop = 19050
        mmWidth = 3440
        BandType = 0
      end
      object rpOrdemCompraLabel22: TppLabel
        UserName = 'rpOrdemCompraLabel22'
        Caption = 'já Recebida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 22754
        mmWidth = 16404
        BandType = 0
      end
      object rpOrdemCompraLabel20: TppLabel
        UserName = 'rpOrdemCompraLabel20'
        Caption = 'Pedida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 22754
        mmWidth = 9790
        BandType = 0
      end
      object rpControleOCLine6: TppLine
        UserName = 'rpControleOCLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8202
        mmLeft = 237067
        mmTop = 19050
        mmWidth = 3440
        BandType = 0
      end
      object rpOrdemCompraLabel17: TppLabel
        UserName = 'rpOrdemCompraLabel17'
        Caption = 'IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 259292
        mmTop = 22754
        mmWidth = 3440
        BandType = 0
      end
      object rpOrdemCompraLabel6: TppLabel
        UserName = 'rpOrdemCompraLabel6'
        Caption = 'unitário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 22754
        mmWidth = 11113
        BandType = 0
      end
      object rpOrdemCompraLabel15: TppLabel
        UserName = 'rpOrdemCompraLabel15'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 269876
        mmTop = 22754
        mmWidth = 7144
        BandType = 0
      end
      object rpControleOCLabel4: TppLabel
        UserName = 'rpControleOCLabel4'
        Caption = 'Códgio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 22754
        mmWidth = 16140
        BandType = 0
      end
      object rpControleOCLabel5: TppLabel
        UserName = 'rpControleOCLabel5'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 22754
        mmWidth = 14288
        BandType = 0
      end
      object rpControleOCLabel6: TppLabel
        UserName = 'rpControleOCLabel6'
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 22754
        mmWidth = 7144
        BandType = 0
      end
      object rpOrdemCompraLabel21: TppLabel
        UserName = 'rpOrdemCompraLabel21'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 208492
        mmTop = 16933
        mmWidth = 21960
        BandType = 0
      end
      object rpControleOCLabel3: TppLabel
        UserName = 'rpControleOCLabel3'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 254001
        mmTop = 16933
        mmWidth = 12700
        BandType = 0
      end
      object rpControleOCLabel8: TppLabel
        UserName = 'rpControleOCLabel8'
        AutoSize = False
        Caption = 'Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 16933
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpControleOCDBText1: TppDBText
        UserName = 'rpControleOCDBText1'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = bdeControleOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object rpControleOCDBText2: TppDBText
        UserName = 'rpControleOCDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = bdeControleOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 0
        mmWidth = 70644
        BandType = 4
      end
      object rpControleOCDBText3: TppDBText
        UserName = 'rpControleOCDBText3'
        DataField = 'CODMEDIDA'
        DataPipeline = bdeControleOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 89165
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object rpControleOCDBText5: TppDBText
        UserName = 'rpControleOCDBText5'
        DataField = 'DATAENTREGA'
        DataPipeline = bdeControleOC
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object rpControleOCDBText6: TppDBText
        UserName = 'rpControleOCDBText6'
        DataField = 'DATAENTDEVOL'
        DataPipeline = bdeControleOC
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpControleOCDBText7: TppDBText
        UserName = 'rpControleOCDBText7'
        DataField = 'NUMNF'
        DataPipeline = bdeControleOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 135202
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpControleOCDBText8: TppDBText
        UserName = 'rpControleOCDBText8'
        DataField = 'FORNECEDOR'
        DataPipeline = bdeControleOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 0
        mmWidth = 46831
        BandType = 4
      end
      object rpControleOCDBText9: TppDBText
        UserName = 'rpControleOCDBText9'
        DataField = 'QTDERECEBIDA'
        DataPipeline = bdeControleOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 202671
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpControleOCDBText10: TppDBText
        UserName = 'rpControleOCDBText10'
        DataField = 'VALORUN'
        DataPipeline = bdeControleOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 236538
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpControleOCDBText11: TppDBText
        UserName = 'rpControleOCDBText11'
        DataField = 'TOTIPI'
        DataPipeline = bdeControleOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpControleOCDBText12: TppDBText
        UserName = 'rpControleOCDBText12'
        DataField = 'VALTOTAL'
        DataPipeline = bdeControleOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 261144
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpControleOCDBText14: TppDBText
        UserName = 'rpControleOCDBText14'
        DataField = 'QTDEENTREGA'
        DataPipeline = bdeControleOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeControleOC'
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object rpOrdemCompraLabel5: TppLabel
        UserName = 'rpOrdemCompraLabel5'
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
      object rpOrdemCompraLine3: TppLine
        UserName = 'rpOrdemCompraLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object rpOrdemCompraCalc1: TppSystemVariable
        UserName = 'rpOrdemCompraCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 529
        mmWidth = 83608
        BandType = 8
      end
      object rpOrdemCompraCalc2: TppSystemVariable
        UserName = 'rpOrdemCompraCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248973
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMOC'
      DataPipeline = bdeControleOC
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeControleOC'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'ppLabel10'
          Caption = 'O.C. Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 2381
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          AutoSize = True
          DataField = 'NUMOC'
          DataPipeline = bdeControleOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 2381
          mmWidth = 1588
          BandType = 3
          GroupNo = 0
        end
        object rpOrdemCompraLine2: TppLine
          UserName = 'rpOrdemCompraLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object rpControleOCDBText15: TppDBText
          UserName = 'rpControleOCDBText15'
          AutoSize = True
          DataField = 'IIMPRESSA'
          DataPipeline = bdeControleOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3175
          mmLeft = 70115
          mmTop = 2381
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object rpControleOCDBText4: TppDBText
          UserName = 'rpControleOCDBText4'
          AutoSize = True
          DataField = 'DATAOC'
          DataPipeline = bdeControleOC
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 2381
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpControleOCLabel7: TppLabel
          UserName = 'rpControleOCLabel7'
          Caption = 'Data da O.C.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 31485
          mmTop = 2381
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpOrdemCompraLabel14: TppLabel
          UserName = 'rpOrdemCompraLabel14'
          Caption = 'Valor O.C.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 242359
          mmTop = 794
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rpOrdemCompraLabel9: TppLabel
          UserName = 'rpOrdemCompraLabel9'
          Caption = 'Obs.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 794
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object rpOrdemCompraLabel19: TppLabel
          UserName = 'rpOrdemCompraLabel19'
          Caption = 'Outros encargos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 193940
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpControleOCDBText13: TppDBText
          UserName = 'rpControleOCDBText13'
          DataField = 'TOTOC'
          DataPipeline = bdeControleOC
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3704
          mmLeft = 257969
          mmTop = 794
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rpControleOCDBMemo1: TppDBMemo
          UserName = 'rpControleOCDBMemo1'
          CharWrap = True
          DataPipeline = bdeControleOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3704
          mmLeft = 7673
          mmTop = 794
          mmWidth = 185209
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpControleOCDBText16: TppDBText
          UserName = 'rpControleOCDBText16'
          DataField = 'TOTIMP'
          DataPipeline = bdeControleOC
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeControleOC'
          mmHeight = 3704
          mmLeft = 219869
          mmTop = 794
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
