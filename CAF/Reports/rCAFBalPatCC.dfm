inherited RptCAFBalPatCC: TRptCAFBalPatCC
  Left = 296
  Top = 168
  Width = 305
  Height = 220
  Caption = 'Balancete Patrimonial por Centro de Custo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Centro de Custo'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
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
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDEMPRESA, CODCENTROCUSTO, NOME'
          'FROM CENTCUST'
          'WHERE (STATUSGRUPOCDC = '#39'A'#39')'
          'ORDER BY CODCENTROCUSTO'
          ' ')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME|CODCENTROCUSTO'
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '40|10'
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
          'Investimentos Imobiliários')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
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
        Caption = 'Incluir Bens com Controle Físico'
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
        Caption = 'Incluir Bens Baixados'
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
        Caption = 'Incluir Centros de Custo sem Valor'
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
        Caption = 'Somente Centros de Custo Sintéticos'
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
    Formheight = 265
    FormWidth = 480
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBalPatCC
    LabelEmpresa = ppLabel18
    LabelSistema = ppLabel31
  end
  object cdsAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 144
  end
  object sqlAnaliticos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.CODCENTROCUSTO, SB.IDEMPRESA, SB.NOME AS DESCCCUSTO, S' +
        'B.NOME, SB.STATUSGRUPOCDC AS TIPOCCUSTO, SUM(SB.QUANT) AS QUANT,'
      
        '       SUM(SB.VALORG0) AS VALORG0, SUM(SB.CMBEM0) AS CMBEM0, SB.' +
        'STATUSGRUPOCDC,'
      
        '       SUM(SB.DEPLANC0) AS DEPLANC0, SUM(SB.DEPLANCATU0) AS DEPL' +
        'ANCATU0,'
      
        '       SUM(SB.CMDEP0) AS CMDEP0, SUM(SB.VALORG0 + SB.CMBEM0 - SB' +
        '.DEPLANC0 - SB.CMDEP0) AS VALCTB0'
      ''
      
        'FROM ((SELECT /*+ RULE */ CC1.CODCENTROCUSTO, CC1.IDEMPRESA, CC1' +
        '.NOME, CC1.STATUSGRUPOCDC, COUNT(*) AS QUANT,'
      '              ROUND(SUM(NVL(SB1.VALORG,0.00) +'
      '                        NVL(SB1.REAVVALORG,0.00) +'
      
        '                        NVL(SB1.ULTREAVVALORG,0.00)), 2) AS VALO' +
        'RG0,'
      '              ROUND(SUM(NVL(SB1.CMBEM,0.00) +'
      '                        NVL(SB1.REAVCMBEM,0.00) +'
      
        '                        NVL(SB1.ULTREAVCMBEM,0.00)), 2) AS CMBEM' +
        '0,'
      '              ROUND(SUM(NVL(SD1.DEPLANC,0.00) +'
      '                        NVL(SD1.REAVDEPLANC,0.00) +'
      
        '                        NVL(SD1.ULTREAVDEPLANC,0.00)), 2) AS DEP' +
        'LANC0,'
      '              ROUND(SUM(NVL(SD1.CMDEP,0.00) +'
      '                        NVL(SD1.REAVCMDEP,0.00) +'
      
        '                        NVL(SD1.ULTREAVCMDEP,0.00)), 2) AS CMDEP' +
        '0,'
      '              (0.00) AS DEPLANCATU0'
      '       FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '            (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '             FROM SALDOCONTABBEM'
      '             WHERE DATASLDBEM <= :DATASLD'
      '               AND MOECODIGO = :MOECODIGO'
      '               AND IDPESSOA = :IDPESSOA'
      '             GROUP BY IDBEM, IDPESSOA) MAX1,'
      '            BEM B1, GRUPO G1, LOCALIZACAO L1, CENTCUST CC1'
      '       WHERE B1.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      '         AND SB1.MOECODIGO = :MOECODIGO'
      '         AND SB1.IDPESSOA = :IDPESSOA'
      '         AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '         AND B1.IDPESSOA = :IDPESSOA'
      '         AND SB1.IDBEM = MAX1.IDBEM'
      '         AND SB1.IDPESSOA = MAX1.IDPESSOA'
      '         AND SB1.DATASLDBEM = MAX1.DATA'
      '         AND SB1.IDBEM = SD1.IDBEM'
      '         AND SB1.IDPESSOA = SD1.IDPESSOA'
      '         AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '         AND SB1.MOECODIGO = SD1.MOECODIGO'
      '         AND SB1.IDBEM = B1.IDBEM'
      '         AND SB1.IDPESSOA = B1.IDPESSOA'
      '         AND SB1.IDGRUPO = G1.IDGRUPO'
      '         AND SB1.IDLOCALIZACAO = L1.IDLOCALIZACAO'
      '         AND SB1.IDPESSOA = L1.IDPESSOA'
      '         AND L1.CODCENTROCUSTO = CC1.CODCENTROCUSTO'
      '         AND L1.IDEMPRESA = CC1.IDEMPRESA'
      
        '       GROUP BY CC1.CODCENTROCUSTO, CC1.IDEMPRESA, CC1.NOME, CC1' +
        '.STATUSGRUPOCDC) UNION'
      ''
      
        '      (SELECT /*+ RULE */ CC2.CODCENTROCUSTO, CC2.IDEMPRESA, CC2' +
        '.NOME, CC2.STATUSGRUPOCDC, (0.00) AS QUANT,'
      '              (0.00) AS VALORG0,'
      '              (0.00) AS CMBEM0,'
      '              (0.00) AS DEPLANC0,'
      '              (0.00) AS CMDEP0,'
      
        '              ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      17,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      43,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      35,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      51,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      18,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      33,NVL(VM2' +
        '.VALOR,0.00),'
      
        '                                                      47,NVL(VM2' +
        '.VALOR,0.00),0.00)),2) AS DEPLANCATU0'
      '       FROM HISTORICOMOVIMENTACAO HM2,'
      '            VLRHISTMOVBEM VM2,'
      '            LOCALIZACAO L2,'
      '            CENTCUST CC2,'
      '            GRUPO G2,'
      '            SALDOCONTABBEM SB2,'
      '            BEM B2'
      '       WHERE B2.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      
        '         AND HM2.DATAMOVIMENTACAO >= :DATAINI AND HM2.DATAMOVIME' +
        'NTACAO <= :DATASLD'
      
        '         AND SB2.DATASLDBEM >= :DATAINI AND SB2.DATASLDBEM <= :D' +
        'ATASLD'
      '         AND SB2.MOECODIGO = :MOECODIGO'
      '         AND SB2.IDPESSOA = :IDPESSOA'
      '         AND HM2.IDPESSOA = :IDPESSOA'
      '         AND B2.IDPESSOA = :IDPESSOA'
      '         AND VM2.MOECODIGO = :MOECODIGO'
      '         AND VM2.IDTAXADEP = :IDTAXADEP'
      '         AND HM2.IDBEM = SB2.IDBEM'
      '         AND HM2.IDPESSOA = SB2.IDPESSOA'
      '         AND HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM'
      '         AND SB2.IDBEM = B2.IDBEM'
      '         AND SB2.IDPESSOA = B2.IDPESSOA'
      '         AND G2.IDGRUPO = SB2.IDGRUPO'
      '         AND SB2.IDLOCALIZACAO = L2.IDLOCALIZACAO'
      '         AND SB2.IDPESSOA = L2.IDPESSOA'
      '         AND L2.CODCENTROCUSTO = CC2.CODCENTROCUSTO'
      '         AND L2.IDEMPRESA = CC2.IDEMPRESA'
      '         AND HM2.IDPESSOA = B2.IDPESSOA'
      '         AND HM2.IDBEM = B2.IDBEM'
      '         AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      
        '       GROUP BY CC2.CODCENTROCUSTO, CC2.IDEMPRESA, CC2.NOME, CC2' +
        '.STATUSGRUPOCDC)) SB'
      ''
      
        'GROUP BY SB.CODCENTROCUSTO, SB.IDEMPRESA, SB.NOME, SB.STATUSGRUP' +
        'OCDC'
      
        'ORDER BY SB.CODCENTROCUSTO, SB.IDEMPRESA, SB.NOME, SB.STATUSGRUP' +
        'OCDC'
      '')
    ClientDataSet = cdsAnaliticos
    Left = 32
    Top = 128
  end
  object cdsSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 144
  end
  object sqlSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME, IDEMPRESA'
      'FROM CENTCUST'
      'WHERE STATUSGRUPOCDC = '#39'S'#39
      '  AND IDEMPRESA = :IDPESSOA'
      'ORDER BY CODCENTROCUSTO')
    ClientDataSet = cdsSinteticos
    Left = 112
    Top = 128
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 72
  end
  object cdsDepPerTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 400
  end
  object sqlDepPerTransf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SB.IDLOCALIZACAO AS IDLOCALENT, L.CODCENTROCUSTO AS CODCC' +
        'USTO,'
      
        '       BTG.IDLOCALANT   AS IDLOCALSAI, LA.CODCENTROCUSTO AS CODC' +
        'CUSTOANT,'
      '       SUM(NVL(VM.VALOR,0)) AS VALOR'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM,'
      ''
      '     (SELECT IDBEM, IDLOCALANT'
      '      FROM HISTORICOMOVIMENTACAO'
      '      WHERE (DATAMOVIMENTACAO >= :DATAINI)'
      '        AND (DATAMOVIMENTACAO <= :DATASLD)'
      '        AND (IDTIPOMOVIMENTACAO = 11)'
      '        AND (IDPESSOA = :IDPESSOA)) BTG,'
      ''
      '     (SELECT SCB.IDBEM, SCB.IDLOCALIZACAO, SCB.IDGRUPO'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :DATASLD)'
      '              AND (IDPESSOA = :IDPESSOA)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '      LOCALIZACAO L, LOCALIZACAO LA, GRUPO G, BEM B'
      ''
      'WHERE (HM.DATAMOVIMENTACAO >= :DATAINI)'
      '  AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      
        '  AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '18) OR (HM.IDTIPOMOVIMENTACAO = 35))'
      '  AND (HM.IDPESSOA  = :IDPESSOA)'
      '  AND (HM.TIPDEPPRORATA <> 2)'
      '  AND (VM.MOECODIGO = :MOECODIGO)'
      '  AND (VM.IDTAXADEP = :IDTAXADEP)'
      ''
      ''
      ''
      ''
      '  AND (HM.IDBEM = BTG.IDBEM)'
      '  AND (BTG.IDBEM = SB.IDBEM)'
      '  AND (SB.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      '  AND (SB.IDBEM = B.IDBEM)'
      '  AND (BTG.IDLOCALANT = LA.IDLOCALIZACAO)'
      '  AND (SB.IDGRUPO = G.IDGRUPO)'
      '  AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        'GROUP BY SB.IDLOCALIZACAO, L.CODCENTROCUSTO, BTG.IDLOCALANT, LA.' +
        'CODCENTROCUSTO'
      '')
    ClientDataSet = cdsDepPerTransf
    Left = 576
    Top = 384
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 72
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
    Left = 26
    Top = 58
  end
  object sqlBalPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,'
      '       NOME AS DESCCCUSTO,'
      '       STATUSGRUPOCDC AS S_A,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS DEPMES,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS VALCTB,'
      '       (0) AS QUANT'
      'FROM CENTCUST'
      'WHERE IDEMPRESA = :IDPESSOA'
      'ORDER BY CODCENTROCUSTO'
      ''
      ' '
      ' '
      '')
    ClientDataSet = cdsBalPatAux
    Left = 168
    Top = 57
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 72
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
    Top = 56
  end
  object sqlBalPatCC: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,'
      '       NOME AS DESCCCUSTO,'
      '       STATUSGRUPOCDC AS S_A,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS DEPMES,'
      '       (0.00) AS VALCTB,'
      '       (0) AS QUANT'
      'FROM CENTCUST'
      'WHERE CODCENTROCUSTO IS NULL'
      'ORDER BY CODCENTROCUSTO'
      '')
    ClientDataSet = cdsBalPatCC
    Left = 247
    Top = 58
  end
  object cdsBalPatCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 247
    Top = 45
  end
  object dsBalPatCC: TwwDataSource
    DataSet = cdsBalPatCC
    Left = 248
    Top = 33
  end
  object ppBalPatCC: TppBDEPipeline
    DataSource = dsBalPatCC
    UserName = 'BalPatCC'
    Left = 248
    Top = 20
  end
  object rpBalPatCC: TppReport
    AutoStop = False
    DataPipeline = ppBalPatCC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 248
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78581
        mmTop = 8731
        mmWidth = 106627
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 264107
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 117211
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 21960
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 21960
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 21960
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139436
        mmTop = 21960
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 21960
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 21960
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 21960
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel29'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 214842
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 243417
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatCCLabel1: TppLabel
        UserName = 'rpBalPatCCLabel1'
        Caption = 'Deprec.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 21960
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatCCLabel12: TppLabel
        UserName = 'rpBalPatCCLabel12'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120386
        mmTop = 15610
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        OnPrint = ppDBText10Print
        UserName = 'ppDBText10'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataField = 'DESCCCUSTO'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 529
        mmWidth = 68263
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 209550
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233892
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'S_A'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 93663
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object rpBalPatCCDBText1: TppDBText
        UserName = 'rpBalPatCCDBText1'
        DataField = 'DEPMES'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188119
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 264107
        BandType = 8
      end
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
