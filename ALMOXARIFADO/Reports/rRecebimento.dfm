inherited RptRecebimento: TRptRecebimento
  Left = 201
  Top = 181
  Width = 365
  Height = 152
  Caption = 'Recebimento de Mercadoria'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Recebimento de Mercadoria'
    DataBaseName = 'BaseDados'
    Params = <
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
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'CODALMOXARIFADO'
        LookupSettings.Tamanho = '60'
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
        Caption = 'Fornecedor'
        Controle = tcMontaSelect
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          '')
        LookupSettings.Tamanho = '60'
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
        Name = 'Fornecedor'
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
        MontaSelect = msForn
        Width = 0
      end
      item
        Caption = 'Tipo'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todas'
          'Integradas com CAP'
          'Não Integradas com CAP')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
        Name = 'Tipo'
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
        Caption = 'Imprimir itens com destino para estoque'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir itens com destino para estoque'
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
        Caption = 'Imprimir itens com destino para Ativo Fixo'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir itens com destino para Ativo Fixo'
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
        Caption = 'Imprimir itens com destino para Custo'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Imprimir itens com destino para Custo'
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
        Caption = 'Só imprimir itens estocáveis'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Só imprimir itens estocáveis'
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
        Caption = 'Ordem'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Razão Social'
          'Número da Nota'
          'Data Programada')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 44
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
        Name = 'Ordem'
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
    Formheight = 388
    FormWidth = 440
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRecebimento
    LabelEmpresa = LblEmpresa
    LabelSistema = LbSistema
    Left = 84
  end
  object SqlParRecebimento: TCMSqlParams
    SQL.Strings = (
      'SELECT AL.DESCALMOX AS ALMOXARIFADO,'
      '       P.RAZAOSOCIAL AS FORNECEDOR,'
      '       NF.DATAENTDEVOL AS DATAEMISNF,'
      '       D.DATAPROGRAMADA,'
      '       NF.NUMNF,'
      
        '       DECODE( NF.COMPLNF, '#39#39', TO_CHAR( NF.NUMNF ), RTRIM( TO_CH' +
        'AR( NF.NUMNF ), '#39' '#39') || '#39'/'#39' || NF.COMPLNF ) AS NNF,'
      '       AR.CODARTIGO,'
      
        '       SUBSTR( DECODE( IT.IDPRODVARI, NULL, PR.DESCPROD || '#39' '#39' |' +
        '| RTRIM( AR.CODCOR, '#39' '#39' ) || '#39' '#39' || RTRIM( AR.CODTAMANHO ), PV.D' +
        'ESCPRODVARI ), 1, 60 ) AS PRODUTO,'
      '       IT.QTDERECEBDEVOL,'
      '       IT.VLRUNITARIO,'
      '       IT.CODMEDIDA,'
      '       IT.QTDERECEBDEVOL * IT.VLRUNITARIO AS VALORTOTAL,'
      
        '       ( IT.QTDERECEBDEVOL * IT.VLRUNITARIO ) - IT.VLRESTOQUE AS' +
        ' ACDES,'
      
        '       ( ( IT.QTDERECEBDEVOL * IT.VLRUNITARIO ) + ( IT.QTDERECEB' +
        'DEVOL * IT.VLRUNITARIO - IT.VLRESTOQUE ) ) AS VALPAG,'
      '       IT.VLRESTOQUE,'
      '       IT.IDITENSRECDEV,'
      '       NF.VLRNOTAFISCAL,'
      '       :TIPO1 AS TIPODOC,'
      '       TOT.TOTAL'
      '  FROM ALMOX AL,'
      '       ARTIGO AR,'
      '       PRODUTO PR,'
      '       ITENSRECEBDEVOL IT,'
      '       NFRECEBDEVOL NF,'
      '       PESSOA P,'
      '       PRODVARI PV,'
      '       :TIPO2,'
      '       ( SELECT SUM( VLRNOTAFISCAL ) AS TOTAL'
      '           FROM NFRECEBDEVOL'
      '          WHERE ( IDPESSOA = :IDEMPRESA )'
      '            AND ( FLGTIPONOTA = '#39'R'#39' )'
      ''
      '            AND ( DATAENTDEVOL >= :DATAINI )'
      '            AND ( DATAENTDEVOL <= :DATAFIM ) ) TOT'
      ' WHERE ( NF.IDPESSOA = :IDEMPRESA )'
      '   AND ( NF.DATAENTDEVOL >= :DATAINI )'
      '   AND ( NF.DATAENTDEVOL <= :DATAFIM )'
      '   AND ( AL.CODALMOXARIFADO = :ALMOX )'
      '   AND ( NF.IDFORCLI = :FORNECEDOR )'
      '   AND ( NF.FLGTIPONOTA = '#39'R'#39' )'
      '   AND ( NF.IDFORCLI = P.IDPESSOA )'
      '   :TIPO3'
      '   AND ( PR.ITEMESTOCAVEL = :ESTOQUE )'
      '   AND ( IT.FLGDESTINO IN ( :DESTINO ) )'
      '   AND ( IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL )'
      '   AND ( IT.CODALMOXARIFADO = AL.CODALMOXARIFADO )'
      '   AND ( IT.CODARTIGO = AR.CODARTIGO )'
      '   AND ( AR.CODPRODUTO = PR.CODPRODUTO )'
      '   AND ( IT.IDPRODVARI = PV.IDPRODVARI(+) )'
      '   AND ( NF.CODDOCUMENTO = D.CODDOCUMENTO(+))'
      ' ORDER BY :ORDEM'
      ''
      ''
      ''
      ''
      '')
    OnFormartParam = SqlParRecebimentoFormartParam
    ClientDataSet = CdsRecebimento
    Left = 200
    Top = 8
  end
  object CdsRecebimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 68
  end
  object dsRecebimento: TwwDataSource
    DataSet = CdsRecebimento
    Left = 144
    Top = 60
  end
  object pplRecebimento: TppBDEPipeline
    DataSource = dsRecebimento
    SkipWhenNoRecords = False
    UserName = 'lRecebimento'
    Left = 84
    Top = 60
  end
  object rpRecebimento: TppReport
    AutoStop = False
    DataPipeline = pplRecebimento
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
    Left = 24
    Top = 60
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRecebimento'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Recebimento de Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 114036
        mmTop = 8731
        mmWidth = 56621
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
        mmLeft = 126736
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LbPeriodo: TppLabel
        UserName = 'LbPeriodo'
        Caption = 'LbPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 212196
        mmTop = 12171
        mmWidth = 12700
        BandType = 0
      end
      object rpRecebimentoLabel1: TppLabel
        UserName = 'rpRecebimentoLabel1'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 199232
        mmTop = 12171
        mmWidth = 11377
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppReport1DBText3: TppDBText
        UserName = 'ppReport1DBText3'
        AutoSize = True
        DataField = 'PRODUTO'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppReport1DBText4: TppDBText
        UserName = 'ppReport1DBText4'
        AutoSize = True
        DataField = 'QTDERECEBDEVOL'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppReport1DBText5: TppDBText
        UserName = 'ppReport1DBText5'
        AutoSize = True
        DataField = 'VLRUNITARIO'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppReport1DBText6: TppDBText
        UserName = 'ppReport1DBText6'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpRecebimentoDBText1: TppDBText
        UserName = 'rpRecebimentoDBText1'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object rpRecebimentoDBText2: TppDBText
        UserName = 'rpRecebimentoDBText2'
        AutoSize = True
        DataField = 'ACDES'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 200819
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object rpRecebimentoDBText3: TppDBText
        UserName = 'rpRecebimentoDBText3'
        AutoSize = True
        DataField = 'VLRESTOQUE'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object rpRecebimentoDBText7: TppDBText
        UserName = 'rpRecebimentoDBText7'
        DataField = 'CODMEDIDA'
        DataPipeline = pplRecebimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 794
        mmTop = 2910
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128588
        mmTop = 2646
        mmWidth = 17463
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248709
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpRecebimentoLine2: TppLine
        UserName = 'rpRecebimentoLine2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object rpRecebimentoLine3: TppLine
        UserName = 'rpRecebimentoLine3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 6615
        mmWidth = 284300
        BandType = 7
      end
      object rpRecebimentoLabel10: TppLabel
        UserName = 'rpRecebimentoLabel10'
        AutoSize = False
        Caption = 'Valor Total das Notas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9790
        mmTop = 1852
        mmWidth = 32015
        BandType = 7
      end
      object rpRecebimentoDBText5: TppDBText
        UserName = 'rpRecebimentoDBText5'
        DataField = 'TOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3175
        mmLeft = 66675
        mmTop = 1852
        mmWidth = 8996
        BandType = 7
      end
      object rpRecebimentoLabel3: TppLabel
        UserName = 'rpRecebimentoLabel3'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object rpRecebimentoDBCalc1: TppDBCalc
        UserName = 'rpRecebimentoDBCalc1'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3387
        mmLeft = 154961
        mmTop = 1852
        mmWidth = 29718
        BandType = 7
      end
      object rpRecebimentoDBCalc5: TppDBCalc
        UserName = 'rpRecebimentoDBCalc5'
        AutoSize = True
        DataField = 'ACDES'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3387
        mmLeft = 189591
        mmTop = 1852
        mmWidth = 20489
        BandType = 7
      end
      object rpRecebimentoDBCalc7: TppDBCalc
        UserName = 'rpRecebimentoDBCalc7'
        AutoSize = True
        DataField = 'VLRESTOQUE'
        DataPipeline = pplRecebimento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRecebimento'
        mmHeight = 3387
        mmLeft = 213985
        mmTop = 1852
        mmWidth = 30226
        BandType = 7
      end
    end
    object ppReport1Group1: TppGroup
      BreakName = 'DATAEMISNF'
      DataPipeline = pplRecebimento
      OutlineSettings.CreateNode = True
      UserName = 'Report1Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRecebimento'
      object ppReport1GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpRecebimentoShape1: TppShape
          UserName = 'rpRecebimentoShape1'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 275432
          BandType = 3
          GroupNo = 1
        end
        object ppReport1Label1: TppLabel
          UserName = 'ppReport1Label1'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 1058
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppReport1DBText1: TppDBText
          UserName = 'ppReport1DBText1'
          AutoSize = True
          DataField = 'DATAEMISNF'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3175
          mmLeft = 11906
          mmTop = 1058
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReport1GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReport1Group2: TppGroup
      BreakName = 'NNF'
      DataPipeline = pplRecebimento
      OutlineSettings.CreateNode = True
      UserName = 'Report1Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRecebimento'
      object ppReport1GroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppReport1DBText2: TppDBText
          UserName = 'ppReport1DBText2'
          DataField = 'NNF'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3440
          mmLeft = 20902
          mmTop = 0
          mmWidth = 20638
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label2: TppLabel
          UserName = 'ppReport1Label2'
          AutoSize = False
          Caption = 'Nota Fiscal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 0
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label3: TppLabel
          UserName = 'ppReport1Label3'
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 6350
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label4: TppLabel
          UserName = 'ppReport1Label4'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103188
          mmTop = 6350
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppReport1Label6: TppLabel
          UserName = 'ppReport1Label6'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11642
          mmTop = 6350
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel5: TppLabel
          UserName = 'rpRecebimentoLabel5'
          Caption = 'Decrescimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 193411
          mmTop = 6615
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel6: TppLabel
          UserName = 'rpRecebimentoLabel6'
          Caption = 'Valor Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 223838
          mmTop = 6350
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel8: TppLabel
          UserName = 'rpRecebimentoLabel8'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169598
          mmTop = 6350
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel9: TppLabel
          UserName = 'rpRecebimentoLabel9'
          Caption = 'Valor Unitário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 131763
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel7: TppLabel
          UserName = 'rpRecebimentoLabel7'
          Caption = 'Acrescimo /'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 193411
          mmTop = 3440
          mmWidth = 17463
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoDBText4: TppDBText
          UserName = 'rpRecebimentoDBText4'
          DataField = 'FORNECEDOR'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3440
          mmLeft = 95779
          mmTop = 0
          mmWidth = 59796
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoLabel2: TppLabel
          UserName = 'rpRecebimentoLabel2'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 76994
          mmTop = 0
          mmWidth = 18256
          BandType = 3
          GroupNo = 3
        end
        object rpRecebimentoDBText6: TppDBText
          UserName = 'rpRecebimentoDBText6'
          DataField = 'VLRNOTAFISCAL'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3440
          mmLeft = 52652
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel11: TppLabel
          UserName = 'rpRecebimentoLabel11'
          AutoSize = False
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 42863
          mmTop = 0
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoLabel12: TppLabel
          UserName = 'rpRecebimentoLabel12'
          AutoSize = False
          Caption = 'Tipo de Documento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 157163
          mmTop = 0
          mmWidth = 29633
          BandType = 3
          GroupNo = 2
        end
        object rpRecebimentoDBText8: TppDBText
          UserName = 'rpRecebimentoDBText8'
          DataField = 'TIPODOC'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3440
          mmLeft = 187590
          mmTop = 0
          mmWidth = 40217
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data Programada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 228600
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = pplRecebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3440
          mmLeft = 255588
          mmTop = 0
          mmWidth = 21696
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReport1GroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpRecebimentoLabel4: TppLabel
          UserName = 'rpRecebimentoLabel4'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 0
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc2: TppDBCalc
          UserName = 'rpRecebimentoDBCalc2'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3387
          mmLeft = 155490
          mmTop = 0
          mmWidth = 29718
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc3: TppDBCalc
          UserName = 'rpRecebimentoDBCalc3'
          AutoSize = True
          DataField = 'ACDES'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3387
          mmLeft = 190120
          mmTop = 0
          mmWidth = 20489
          BandType = 5
          GroupNo = 2
        end
        object rpRecebimentoDBCalc4: TppDBCalc
          UserName = 'rpRecebimentoDBCalc4'
          AutoSize = True
          DataField = 'VLRESTOQUE'
          DataPipeline = pplRecebimento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppReport1Group2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRecebimento'
          mmHeight = 3387
          mmLeft = 213985
          mmTop = 0
          mmWidth = 30226
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object msForn: TMontaSelect
    Tag = 3
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Nome Fantasia')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'EMPRESAFORN.IDFORCLI')
    Filtro.Strings = (
      'EMPRESAFORN.IDFORCLI = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 288
    Top = 8
  end
end
