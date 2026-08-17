inherited RptCAFRelAquisPer: TRptCAFRelAquisPer
  Left = 378
  Top = 171
  Width = 298
  Height = 172
  Caption = 'Relação de Aquisições no Periodo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relação de Aquisições no Periodo'
    DataBaseName = 'Basedados'
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
        Caption = 'Segunda Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'Terceira Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'País'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS'
          'FROM CAFPAISES CP,'
          '     PAIS P'
          'WHERE CP.IDPESSOA = 1'
          '  AND CP.IDPAIS = P.IDPAIS'
          'ORDER BY P.NOMEPAIS')
        LookupSettings.Chave = 'IDCAFPAISES'
        LookupSettings.Display = 'NOMEPAIS'
        LookupSettings.Descricao = 'País'
        LookupSettings.Tamanho = '30'
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
        Caption = 'Seleção'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Completo'
          'Totalmente Depreciados'
          'Parcialmente Depreciados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
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
        Caption = 'Incluir os Bens com Controle Físico'
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
        MostraComboCompara = True
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 331
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRelAquisPer
    LabelEmpresa = ppLabel61
    LabelSistema = ppLabel62
    Left = 88
  end
  object sqlRelAquisPer: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ SB.IDGRUPO, G.CLASSE, G.NOME,'
      '       B.PLACA, SB.DATAMOVIMENTACAO, B.IDNOTA, B.COMPLNOTA,'
      '       SB.VALORG1,'
      '       F.NOME AS NOMEFORN, B.DATAINICIODEP, SB.VALORG2,'
      
        '       BD.TAXADEP, TO_DATE('#39'01/01/1980'#39','#39'DD/MM/YYYY'#39') AS DATAFIM' +
        'DEP, SB.VALORG3,'
      '       CTMG.PLACONTA,'
      '       L.NOME AS DESCLOCALIZACAO, CC.NOME AS NOMECCUSTO,'
      '       B.DESBEM'
      ''
      
        'FROM (SELECT /*+ RULE */ HM.IDBEM, HM.DATAMOVIMENTACAO, SCB1.IDG' +
        'RUPO, SCB1.IDLOCALIZACAO,'
      '             M1.MOEDESC AS MOEDESC1, SCB1.VALORG AS VALORG1,'
      '             SCB2.MOEDESC AS MOEDESC2, SCB2.VALORG AS VALORG2,'
      '             SCB3.MOEDESC AS MOEDESC3, SCB3.VALORG AS VALORG3'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           SALDOCONTABBEM SCB1,'
      '           MOEDA M1,'
      
        '           (SELECT SB2.IDBEM, SB2.DATASLDBEM, SB2.VALORG, M2.MOE' +
        'DESC'
      '            FROM SALDOCONTABBEM SB2,'
      '                 MOEDA M2'
      
        '            WHERE (SB2.DATASLDBEM >= :DATAINI AND SB2.DATASLDBEM' +
        ' <= :DATAFIM)'
      '              AND SB2.MOECODIGO = :MOECODIGO2'
      ''
      '              AND SB2.IDPESSOA = :IDPESSOA'
      '              AND SB2.MOECODIGO = M2.MOECODIGO) SCB2,'
      
        '           (SELECT SB3.IDBEM, SB3.DATASLDBEM, SB3.VALORG, M3.MOE' +
        'DESC'
      '            FROM SALDOCONTABBEM SB3,'
      '                 MOEDA M3'
      
        '            WHERE (SB3.DATASLDBEM >= :DATAINI AND SB3.DATASLDBEM' +
        ' <= :DATAFIM)'
      '              AND SB3.MOECODIGO = :MOECODIGO3'
      ''
      '              AND SB3.IDPESSOA = :IDPESSOA'
      '              AND SB3.MOECODIGO = M3.MOECODIGO) SCB3'
      
        '      WHERE (HM.DATAMOVIMENTACAO >= :DATAINI AND HM.DATAMOVIMENT' +
        'ACAO <= :DATAFIM)'
      '        AND HM.IDTIPOMOVIMENTACAO = 01'
      '        AND HM.IDPESSOA = :IDPESSOA'
      ''
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCB1.IDPESSOA = :IDPESSOA'
      '        AND HM.IDBEM = SCB1.IDBEM'
      '        AND HM.DATAMOVIMENTACAO = SCB1.DATASLDBEM'
      '        AND SCB1.MOECODIGO = M1.MOECODIGO '
      '        AND SCB1.IDBEM = SCB2.IDBEM'
      '        AND SCB1.DATASLDBEM = SCB2.DATASLDBEM'
      '        AND SCB1.IDBEM = SCB3.IDBEM'
      '        AND SCB1.DATASLDBEM = SCB3.DATASLDBEM) SB,'
      ''
      
        '     PESSOA F, BEM B, BEMXDEP BD, PLANOGRUPO PG, GRUPO G, CONTAS' +
        'TIPOSMOVIMENTOGRUPOS CTMG,'
      '     LOCALIZACAO L, CENTCUST CC'
      ''
      'WHERE (B.FLGDEPREC = :PDEPREC OR B.FLGDEPREC = :PNOTDEPREC)'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND BD.IDBEMXDEP = :IDTAXADEP'
      '  AND BD.MOECODIGO = :MOECODIGO'
      '  AND BD.IDPESSOA = :IDPESSOA'
      '  AND L.IDPESSOA = :IDPESSOA'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND CTMG.IDTIPOMOVIMENTACAO = 01'
      '  AND CTMG.TIPOLANCAMENTO = '#39'D'#39
      '  AND CTMG.PLANO = :PLANO'
      '  AND CTMG.IDPESSOA = :IDPESSOA'
      '  AND CC.IDEMPRESA = :IDPESSOA'
      ''
      '  AND SB.IDGRUPO = PG.IDGRUPO'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND G.IDGRUPO = CTMG.IDGRUPO'
      '  AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND SB.IDBEM = BD.IDBEM'
      '  AND SB.IDBEM = B.IDBEM'
      '  AND B.IDFORNSERV = F.IDPESSOA(+)'
      'ORDER BY G.CLASSE, B.PLACA'
      '')
    ClientDataSet = cdsRelAquisPer
    Left = 224
    Top = 61
  end
  object cdsRelAquisPer: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 48
    Data = {
      EA0100009619E0BD020000001800000012000000000003000000EA0107494447
      5255504F080004000000000006434C4153534501004900000001000557494454
      48020002000F00044E4F4D450100490000000100055749445448020002003C00
      05504C414341080004000000000010444154414D4F56494D454E544143414F10
      001100000000000649444E4F5441010049000000010005574944544802000200
      120009434F4D504C4E4F54410100490000000100055749445448020002000500
      0756414C4F5247310800040000000000084E4F4D45464F524E01004900000001
      00055749445448020002003C000D44415441494E4943494F4445501000110000
      0000000756414C4F524732080004000000000007544158414445500800040000
      0000000A4441544146494D44455010001100000000000756414C4F5247330800
      04000000000008504C41434F4E54410100490000000100055749445448020002
      0012000F444553434C4F43414C495A4143414F01004900000001000557494454
      48020002003C000A4E4F4D4543435553544F0100490000000100055749445448
      020002001E000644455342454D02004900000001000557494454480200020090
      0102000D44454641554C545F4F52444552040082000200000002000000040000
      00044C4349440400010000000000}
  end
  object dsRelAquisPer: TwwDataSource
    DataSet = cdsRelAquisPer
    Left = 223
    Top = 35
  end
  object ppRelAquisPer: TppBDEPipeline
    DataSource = dsRelAquisPer
    UserName = 'RelAquisPer'
    Left = 223
    Top = 21
    object ppRelAquisPerppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppRelAquisPerppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppRelAquisPerppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppRelAquisPerppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRelAquisPerppField5: TppField
      FieldAlias = 'DATAMOVIMENTACAO'
      FieldName = 'DATAMOVIMENTACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 4
    end
    object ppRelAquisPerppField6: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 5
    end
    object ppRelAquisPerppField7: TppField
      FieldAlias = 'COMPLNOTA'
      FieldName = 'COMPLNOTA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 6
    end
    object ppRelAquisPerppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG1'
      FieldName = 'VALORG1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRelAquisPerppField9: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppRelAquisPerppField10: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 9
    end
    object ppRelAquisPerppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG2'
      FieldName = 'VALORG2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppRelAquisPerppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppRelAquisPerppField13: TppField
      FieldAlias = 'DATAFIMDEP'
      FieldName = 'DATAFIMDEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 12
    end
    object ppRelAquisPerppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG3'
      FieldName = 'VALORG3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppRelAquisPerppField15: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 14
    end
    object ppRelAquisPerppField16: TppField
      FieldAlias = 'DESCLOCALIZACAO'
      FieldName = 'DESCLOCALIZACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppRelAquisPerppField17: TppField
      FieldAlias = 'NOMECCUSTO'
      FieldName = 'NOMECCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object ppRelAquisPerppField18: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 400
      DisplayWidth = 400
      Position = 17
    end
  end
  object rpRelAquisPer: TppReport
    AutoStop = False
    DataPipeline = ppRelAquisPer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 223
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'Relação de Aquisições'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 75671
        mmTop = 8731
        mmWidth = 46038
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpBalPatBemLabel2: TppLabel
        UserName = 'rpBalPatBemLabel2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 97896
        mmTop = 14817
        mmWidth = 1947
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'lblDataIni'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75142
        mmTop = 14817
        mmWidth = 21431
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 14817
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object rpBemResumLabel2: TppLabel
        UserName = 'rpBemResumLabel2'
        AutoSize = False
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object rpBemResumLabel3: TppLabel
        UserName = 'rpBemResumLabel3'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 20638
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel4: TppLabel
        UserName = 'rpBemResumLabel4'
        AutoSize = False
        Caption = 'Fim Depr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 10319
        mmWidth = 14288
        BandType = 4
      end
      object rpBemResumLabel5: TppLabel
        UserName = 'rpBemResumLabel5'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rpBemResumLabel6: TppLabel
        UserName = 'rpBemResumLabel6'
        AutoSize = False
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10319
        mmWidth = 6615
        BandType = 4
      end
      object rpBemResumDBText2: TppDBText
        UserName = 'rpBemResumDBText2'
        DataField = 'PLACA'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object rpBemResumDBText4: TppDBText
        UserName = 'rpBemResumDBText4'
        DataField = 'DATAFIMDEP'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 10319
        mmWidth = 21960
        BandType = 4
      end
      object rpBemResumDBText5: TppDBText
        UserName = 'rpBemResumDBText5'
        AutoSize = True
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 110067
        mmTop = 0
        mmWidth = 30946
        BandType = 4
      end
      object rpBemResumDBText6: TppDBText
        UserName = 'rpBemResumDBText6'
        DataField = 'TAXADEP'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '0.000000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 10319
        mmWidth = 21960
        BandType = 4
      end
      object rpBemResumDBText7: TppDBText
        UserName = 'rpBemResumDBText7'
        DataField = 'VALORG1'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 3440
        mmWidth = 28000
        BandType = 4
      end
      object rpBemResumDBText8: TppDBText
        UserName = 'rpBemResumDBText8'
        DataField = 'VALORG2'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 6879
        mmWidth = 28046
        BandType = 4
      end
      object rpBemResumDBText9: TppDBText
        UserName = 'rpBemResumDBText9'
        DataField = 'VALORG3'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 10319
        mmWidth = 28046
        BandType = 4
      end
      object rpBemResumDBText3: TppDBText
        UserName = 'rpBemResumDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 20638
        mmWidth = 177536
        BandType = 4
      end
      object rpBemResumLine1: TppLine
        UserName = 'rpBemResumLine1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197115
        BandType = 4
      end
      object rpBemResumLabel27: TppLabel
        UserName = 'rpBemResumLabel27'
        AutoSize = False
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 16933
        BandType = 4
      end
      object rpBemResumLabel28: TppLabel
        UserName = 'rpBemResumLabel28'
        Caption = 'a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 10319
        mmWidth = 4763
        BandType = 4
      end
      object rpBalPatBemLabel4: TppLabel
        UserName = 'rpBalPatBemLabel4'
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 6879
        mmWidth = 17198
        BandType = 4
      end
      object rpBalPatBemDBText2: TppDBText
        UserName = 'rpBalPatBemDBText2'
        DataField = 'NOMEFORN'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 6879
        mmWidth = 64294
        BandType = 4
      end
      object rpBalPatBemLabel5: TppLabel
        UserName = 'rpBalPatBemLabel5'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBalPatBemDBText3: TppDBText
        UserName = 'rpBalPatBemDBText3'
        DataField = 'IDNOTA'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpBalPatBemDBText4: TppDBText
        UserName = 'rpBalPatBemDBText4'
        DataField = 'COMPLNOTA'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCLOCALIZACAO'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 17198
        mmWidth = 64294
        BandType = 4
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        AutoSize = False
        Caption = 'Inicio Depr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 6879
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAINICIODEP'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 6879
        mmWidth = 22754
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3440
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Planta do Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 3440
        mmWidth = 25135
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 17198
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMECCUSTO'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 17198
        mmWidth = 86254
        BandType = 4
      end
      object rpBemResumLabel7: TppLabel
        UserName = 'rpBemResumLabel7'
        AutoSize = False
        Caption = 'Vlr Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 3440
        mmWidth = 29104
        BandType = 4
      end
      object lblVlrMoeda2: TppLabel
        UserName = 'lblVlrMoeda2'
        AutoSize = False
        Caption = 'Vlr Moeda 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 6879
        mmWidth = 29104
        BandType = 4
      end
      object lblVlrMoeda3: TppLabel
        UserName = 'lblVlrMoeda3'
        AutoSize = False
        Caption = 'Vlr Moeda 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 10319
        mmWidth = 29104
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 13758
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLACONTA'
        DataPipeline = ppRelAquisPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 13758
        mmWidth = 86254
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
        UserName = 'ppLabel62'
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
        mmTop = 794
        mmWidth = 75406
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 794
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBemResumSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object rpBemResumLabel20: TppLabel
        UserName = 'rpBemResumLabel20'
        Caption = 'Totalização do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 34396
        BandType = 7
      end
      object rpBemResumLine4: TppLine
        UserName = 'rpBemResumLine4'
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 12965
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Encontrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'PLACA'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#00;-#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 1588
        mmWidth = 28046
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Vlr Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 1588
        mmWidth = 25400
        BandType = 7
      end
      object lblTotrVlrMoeda2: TppLabel
        UserName = 'lblTotrVlrMoeda2'
        AutoSize = False
        Caption = 'Vlr Moeda 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 5027
        mmWidth = 25400
        BandType = 7
      end
      object lblTotrVlrMoeda3: TppLabel
        UserName = 'lblTotrVlrMoeda3'
        AutoSize = False
        Caption = 'Vlr Moeda 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 8467
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VALORG3'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 8467
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VALORG2'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 5027
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VALORG1'
        DataPipeline = ppRelAquisPer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 1588
        mmWidth = 28046
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppRelAquisPer
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME'
          DataPipeline = ppRelAquisPer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 32808
          mmTop = 0
          mmWidth = 162454
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpBemResumLabel13: TppLabel
          UserName = 'rpBemResumLabel13'
          Caption = 'Totalização do Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLine3: TppLine
          UserName = 'rpBemResumLine3'
          ParentWidth = True
          Position = lpBottom
          Style = lsDouble
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11641
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Vlr Original'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 0
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object lblTotVlrMoeda2: TppLabel
          UserName = 'lblTotVlrMoeda2'
          AutoSize = False
          Caption = 'Vlr Moeda 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 3440
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object lblTotVlrMoeda3: TppLabel
          UserName = 'lblTotVlrMoeda3'
          AutoSize = False
          Caption = 'Vlr Moeda 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 6879
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORG1'
          DataPipeline = ppRelAquisPer
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167746
          mmTop = 0
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALORG2'
          DataPipeline = ppRelAquisPer
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167746
          mmTop = 3440
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALORG3'
          DataPipeline = ppRelAquisPer
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167746
          mmTop = 6879
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Encontrados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 83873
          mmTop = 0
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'PLACA'
          DataPipeline = ppRelAquisPer
          DisplayFormat = '#00;-#00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 110067
          mmTop = 0
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
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
    Left = 48
    Top = 64
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 80
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      '')
    ClientDataSet = cdsAux
    Left = 128
    Top = 64
  end
end
