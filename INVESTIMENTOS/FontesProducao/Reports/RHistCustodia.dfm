inherited RelHistCustodia: TRelHistCustodia
  Left = 478
  Top = 237
  Width = 229
  Height = 239
  Caption = 'RelHistCustodia'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial:'
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
        Name = 'DataIni'
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
        Caption = 'Data Final:'
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
        Name = 'DataFim'
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
        Caption = 'Plano/Patrocinadora:'
        Controle = tcLookupCombo
        CampoBanco = 'PLANPRVCONTABPATRO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDPLANPREVCTBPATR, PLANPRVCONTABPATRO'
          'FROM VWPLANPREVCTBPATR')
        LookupSettings.Chave = 'IDPLANPREVCTBPATR'
        LookupSettings.Display = 'PLANPRVCONTABPATRO'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'PlanoPatro'
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
        Caption = 'Carteira:'
        Controle = tcLookupCombo
        CampoBanco = 'DESCCARTINVEST'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDCARTEIRAINVEST, '
          '               SUBSTR(DESCCARTINVEST, 1,60)  AS DESCCARTINVEST'
          'FROM CARTEIRAINVEST '
          'ORDER BY DESCCARTINVEST')
        LookupSettings.Chave = 'IDCARTEIRAINVEST'
        LookupSettings.Display = 'DESCCARTINVEST'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'Carteira'
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
        Caption = 'Investimento:'
        Controle = tcLookupCombo
        CampoBanco = 'DESCINVESTIMENTO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
          'FROM INVESTIMENTO'
          'WHERE IDTIPOINVEST = 2'
          '  AND FLGATIVO = '#39'S'#39
          'ORDER BY DESCINVESTIMENTO')
        LookupSettings.Chave = 'IDINVESTIMENTO'
        LookupSettings.Display = 'DESCINVESTIMENTO'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'Investimento'
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
        Caption = 'Custodiante:'
        Controle = tcLookupCombo
        CampoBanco = 'SGLCUSTODIANTE'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT C.IDCUSTODIANTE, C.SGLCUSTODIANTE'
          'FROM CUSTODIANTE C, HISTCUSTODIA HC'
          'WHERE (C.IDCUSTODIANTE = HC.IDCUSTODIANTE)'
          'ORDER BY  SGLCUSTODIANTE')
        LookupSettings.Chave = 'IDCUSTODIANTE'
        LookupSettings.Display = 'SGLCUSTODIANTE'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'Custodiante'
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
        Caption = 'Motivo de Bloqueio'
        Controle = tcLookupCombo
        CampoBanco = 'DESCMOTBLOQ'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ,'
          '       DECODE(IDMOTIVOBLOQUEIO, -1, '#39' -1'#39', DESCMOTBLOQ) AS ORDEM'
          'FROM MOTIVOBLOQUEIO'
          'UNION ALL'
          'SELECT -2, '#39'TODOS OS BLOQUEIOS'#39', '#39'BLQ'#39','
          '       '#39' -2'#39' AS ORDEM'
          'FROM DUAL'
          'ORDER BY 4 ')
        LookupSettings.Chave = 'IDMOTIVOBLOQUEIO'
        LookupSettings.Display = 'DESCMOTBLOQ'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'MotBloq'
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
    Formheight = 250
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptHistCustodia
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object cdsHistCustodia: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 72
    Data = {
      731400009619E0BD010000001800000012001300000003000000550212504C41
      4E505256434F4E544142504154524F0100490000000100055749445448020002
      0071000E4445534343415254494E564553540100490000000100055749445448
      020002003C000E53474C435553544F4449414E54450100490000000100055749
      445448020002000A001044455343494E56455354494D454E544F010049000000
      0100055749445448020002003C000B444553434D4F54424C4F51010049000000
      01000557494454480200020024000D444154414D4F56435553544F4408000800
      0000000010444553435449504F4F5045524143414F0100490000000100055749
      445448020002003C000D53414C444F414E544552494F5208000400000000000D
      515444454D4F56435553544F4408000400000000000A53414C444F415455414C
      0800040000000000094D4F56494D454E544F0100490000000100055749445448
      020002001B000A4944435553544F44494108000400000000001049444F504552
      4143414F494E5645535408000400000000001049444341525445495241494E56
      45535408000400000000000E4944494E56455354494D454E544F080004000000
      00000D4944435553544F4449414E544508000400000000001049444D4F544956
      4F424C4F515545494F08000400000000000C5449504F435553544F4449410100
      4900000002000753554254595045020049000A00466978656443686172000557
      4944544802000200010002000D44454641554C545F4F52444552020082000500
      000002000300040006000C00044C434944040001000908000000000000000012
      5245472F5245504C414E202D20434149584125415650202D2043617274656972
      612052656E64612056617269E176656C205072F3707269610842524144455343
      4F15414C4C20414D4552494341204C4154494E41204F4E1D202D20434F4E5452
      4F4C452044452053414C444F204C4942455241444F0000E0DF4BC8CC42124445
      202D20444553444F4252414D454E544F00000000A12D424100000050A13D7341
      00000070558375410B43202D2041756D656E746100000000E085E94000000000
      805EE840000000000000F03F0000000000DEC240000000000000244000000000
      0000F0BF0143000000000000125245472F5245504C414E202D20434149584125
      415650202D2043617274656972612052656E64612056617269E176656C205072
      F37072696108425241444553434F15414C4C20414D4552494341204C4154494E
      41204F4E1D202D20434F4E54524F4C452044452053414C444F204C4942455241
      444F0000E0DF4BC8CC42304445202D20444553444F4252414D454E544F202D20
      4E4F564F20202020202020202020202020202020202020202020200000007055
      837541000000003D5B33410000004009B976410B43202D2041756D656E746100
      0000002086E94000000000C05EE840000000000000F03F0000000000DEC24000
      00000000002440000000000000F0BF0143000000000000125245472F5245504C
      414E202D20434149584125415650202D2043617274656972612052656E646120
      56617269E176656C205072F37072696108425241444553434F15414C4C20414D
      4552494341204C4154494E41204F4E1D202D20434F4E54524F4C452044452053
      414C444F204C4942455241444F00003C0651C8CC42124445202D20444553444F
      4252414D454E544F0000004009B9764100000050A13D73410000004855FB8441
      0B43202D2041756D656E7461000000006086E940000000004062E84000000000
      0000F03F0000000000DEC2400000000000002440000000000000F0BF01430000
      00000000125245472F5245504C414E202D20434149584125415650202D204361
      7274656972612052656E64612056617269E176656C205072F370726961084252
      41444553434F15414C4C20414D4552494341204C4154494E41204F4E1D202D20
      434F4E54524F4C452044452053414C444F204C4942455241444F00003C0651C8
      CC42304445202D20444553444F4252414D454E544F202D204E4F564F20202020
      202020202020202020202020202020202020200000004855FB8441000000003D
      5B3341000000302F9685410B43202D2041756D656E746100000000A086E94000
      0000008062E840000000000000F03F0000000000DEC240000000000000244000
      0000000000F0BF0143000000000000125245472F5245504C414E202D20434149
      584125415650202D2043617274656972612052656E64612056617269E176656C
      205072F3707269610953414E54414E44455215414C4C20414D4552494341204C
      4154494E41204F4E1D202D20434F4E54524F4C452044452053414C444F204C49
      42455241444F0000E0DF4BC8CC42124445202D20444553444F4252414D454E54
      4F000000000023E540000000003C5F1641000000009C0319410B43202D204175
      6D656E7461000000000086E94000000000A05EE840000000000000F03F000000
      0000DEC240000000002006F740000000000000F0BF0143000000000000125245
      472F5245504C414E202D20434149584125415650202D20436172746569726120
      52656E64612056617269E176656C205072F3707269610953414E54414E444552
      15414C4C20414D4552494341204C4154494E41204F4E1D202D20434F4E54524F
      4C452044452053414C444F204C4942455241444F0000E0DF4BC8CC4230444520
      2D20444553444F4252414D454E544F202D204E4F564F20202020202020202020
      20202020202020202020202020000000009C031941000000004082D640000000
      00C06B1A410B43202D2041756D656E7461000000004086E94000000000E05EE8
      40000000000000F03F0000000000DEC240000000002006F740000000000000F0
      BF0143000000000000125245472F5245504C414E202D20434149584125415650
      202D2043617274656972612052656E64612056617269E176656C205072F37072
      69610953414E54414E44455215414C4C20414D4552494341204C4154494E4120
      4F4E1D202D20434F4E54524F4C452044452053414C444F204C4942455241444F
      00003C0651C8CC42124445202D20444553444F4252414D454E544F00000000C0
      6B1A41000000003C5F1641000000007E6528410B43202D2041756D656E746100
      0000008086E940000000006062E840000000000000F03F0000000000DEC24000
      0000002006F740000000000000F0BF0143000000000000125245472F5245504C
      414E202D20434149584125415650202D2043617274656972612052656E646120
      56617269E176656C205072F3707269610953414E54414E44455215414C4C2041
      4D4552494341204C4154494E41204F4E1D202D20434F4E54524F4C4520444520
      53414C444F204C4942455241444F00003C0651C8CC42304445202D2044455344
      4F4252414D454E544F202D204E4F564F20202020202020202020202020202020
      20202020202020000000007E652841000000004082D64000000000901929410B
      43202D2041756D656E746100000000C086E94000000000A062E8400000000000
      00F03F0000000000DEC240000000002006F740000000000000F0BF0143000000
      000100125245472F5245504C414E202D20434149584125415650202D20436172
      74656972612052656E64612056617269E176656C205072F3707269610953414E
      54414E4445520B425241444553434F20504E1D202D20434F4E54524F4C452044
      452053414C444F204C4942455241444F0000FAFF3EC8CC42184D6F76696D656E
      7461E7E36F206E612043757374F36469610000000014B628410000000088F606
      410000000072F822410B56202D2044696D696E756900000000C0AEE940000000
      000000F03F00000000000AA040000000002006F740000000000000F0BF015600
      0000000100125245472F5245504C414E202D20434149584125415650202D2043
      617274656972612052656E64612056617269E176656C205072F3707269610953
      414E54414E4445520B425241444553434F20504E1D202D20434F4E54524F4C45
      2044452053414C444F204C4942455241444F0000FAFF3EC8CC42184D6F76696D
      656E7461E7E36F206E612043757374F36469610000000072F822410000000080
      C4CF4000000000607922410B56202D2044696D696E756900000000E0AEE94000
      0000000000F03F00000000000AA040000000002006F740000000000000F0BF01
      560000000001001A5245472F5245504C414E2053414C4441444F202D20434149
      584125415650202D2043617274656972612052656E64612056617269E176656C
      205072F3707269610953414E54414E4445520B425241444553434F20504E1D20
      2D20434F4E54524F4C452044452053414C444F204C4942455241444F0000FAFF
      3EC8CC42184D6F76696D656E7461E7E36F206E612043757374F3646961000000
      00000000000000000088F606410000000088F606410B43202D2041756D656E74
      610000000000AFE940000000000000F03F00000000000AA040000000002006F7
      40000000000000F0BF01430000000001001A5245472F5245504C414E2053414C
      4441444F202D20434149584125415650202D2043617274656972612052656E64
      612056617269E176656C205072F3707269610953414E54414E4445520B425241
      444553434F20504E1D202D20434F4E54524F4C452044452053414C444F204C49
      42455241444F0000FAFF3EC8CC42184D6F76696D656E7461E7E36F206E612043
      757374F36469610000000088F606410000000080C4CF4000000000D0F208410B
      43202D2041756D656E74610000000020AFE940000000000000F03F0000000000
      0AA040000000002006F740000000000000F0BF01430000000000001A5245472F
      5245504C414E2053414C4441444F202D20434149584125415650202D20436172
      74656972612052656E64612056617269E176656C205072F3707269610953414E
      54414E444552075649564F20504E1D202D20434F4E54524F4C45204445205341
      4C444F204C4942455241444F0000FAFF3EC8CC421C4356202D20434F4D505241
      2044452041434F4553204120564953544100000000000000000000000000409F
      400000000000409F400B43202D2041756D656E7461000000002087E940000000
      004087E840000000000000F03F000000000073C340000000002006F740000000
      000000F0BF01430000000000001A5245472F5245504C414E2053414C4441444F
      202D20434149584125415650202D2043617274656972612052656E6461205661
      7269E176656C205072F3707269610953414E54414E444552075649564F20504E
      1D202D20434F4E54524F4C452044452053414C444F204C4942455241444F0000
      FAFF3EC8CC421C4356202D20434F4D5052412044452041434F45532041205649
      5354410000000000409F40000000000088B340000000000058BB400B43202D20
      41756D656E7461000000004087E940000000006087E840000000000000F03F00
      0000000073C340000000002006F740000000000000F0BF01430000000000001A
      5245472F5245504C414E2053414C4441444F202D20434149584125415650202D
      2043617274656972612052656E64612056617269E176656C205072F370726961
      0953414E54414E444552075649564F20504E1D202D20434F4E54524F4C452044
      452053414C444F204C4942455241444F0000FAFF3EC8CC421C4356202D20434F
      4D5052412044452041434F45532041205649535441000000000058BB40000000
      00005ECA40000000000005D4400B43202D2041756D656E7461000000006087E9
      40000000008087E840000000000000F03F000000000073C340000000002006F7
      40000000000000F0BF01430000000000001A5245472F5245504C414E2053414C
      4441444F202D20434149584125415650202D2043617274656972612052656E64
      612056617269E176656C205072F3707269610953414E54414E44455207564956
      4F20504E1D202D20434F4E54524F4C452044452053414C444F204C4942455241
      444F0000FAFF3EC8CC421C4356202D20434F4D5052412044452041434F455320
      41205649535441000000000005D4400000000000408F400000000000FFD4400B
      43202D2041756D656E7461000000008087E94000000000A087E8400000000000
      00F03F000000000073C340000000002006F740000000000000F0BF0143000000
      0000001A5245472F5245504C414E2053414C4441444F202D2043414958412541
      5650202D2043617274656972612052656E64612056617269E176656C205072F3
      707269610953414E54414E444552075649564F20504E1D202D20434F4E54524F
      4C452044452053414C444F204C4942455241444F0000FAFF3EC8CC421C435620
      2D20434F4D5052412044452041434F455320412056495354410000000000FFD4
      4000000000000089400000000000C7D5400B43202D2041756D656E7461000000
      00A087E94000000000C087E840000000000000F03F000000000073C340000000
      002006F740000000000000F0BF01430000000000001A5245472F5245504C414E
      2053414C4441444F202D20434149584125415650202D20436172746569726120
      52656E64612056617269E176656C205072F3707269610953414E54414E444552
      075649564F20504E1D202D20434F4E54524F4C452044452053414C444F204C49
      42455241444F0000FAFF3EC8CC421C4356202D20434F4D505241204445204143
      4F455320412056495354410000000000C7D5400000000000C8B9400000000000
      39DC400B43202D2041756D656E746100000000C087E94000000000E087E84000
      0000000000F03F000000000073C340000000002006F740000000000000F0BF01
      430000000000001A5245472F5245504C414E2053414C4441444F202D20434149
      584125415650202D2043617274656972612052656E64612056617269E176656C
      205072F3707269610953414E54414E444552075649564F20504E1D202D20434F
      4E54524F4C452044452053414C444F204C4942455241444F000084B946C8CC42
      20565649202D2056656E64612064652041E7F56573202D20436F6E7461204343
      4900000000E038DC40000000000000F83F000000008038DC400B56202D204469
      6D696E756900000000E087E94000000000408EE840000000000000F03F000000
      000073C340000000002006F740000000000000F0BF0156}
  end
  object sprHistCustodia: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, CTI.DESCCARTINVEST, CUT.SGLCUSTODI' +
        'ANTE, INV.DESCINVESTIMENTO, '
      
        '       MOT.SIGLAMOTBLOQ || '#39' - '#39' || MOT.DESCMOTBLOQ AS DESCMOTBL' +
        'OQ, '
      '       HIS.DATAMOVCUSTOD, '
      '       DECODE(HIS.TIPOCUSTODIA, '#39'I'#39', '#39'Saldo Inicial'#39', '
      '              DECODE(TOP.DESCTIPOOPERACAO,NULL , '
      
        '                     DECODE(TOC.DESCTIPOOPERACAO, NULL, '#39'Movimen' +
        'tação na Custódia'#39', TOC.DESCTIPOOPERACAO), TOP.DESCTIPOOPERACAO)' +
        ') AS DESCTIPOOPERACAO, '
      ''
      '       DECODE(HIS.IDMOTIVOBLOQUEIO, '
      
        '              -1, DECODE(HIS.TIPOCUSTODIA, '#39'C'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'V'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'B'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'D'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'X'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'Y'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'Z'#39', (NVL(HIS.SALDOLI' +
        'BERADO,0) + NVL(HIS.QTDEMOVCUSTOD,0))), '
      
        '                  DECODE(HIS.TIPOCUSTODIA, '#39'C'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'V'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'B'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'D'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'X'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'Y'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) - NVL(HIS.QTDEMOVCUSTOD,0)), '
      
        '                                           '#39'Z'#39', (NVL(HIS.SALDOBL' +
        'OQUEADO,0) + NVL(HIS.QTDEMOVCUSTOD,0)))) AS SALDOANTERIOR, '
      ' '
      '       NVL(HIS.QTDEMOVCUSTOD,0) AS QTDEMOVCUSTOD, '
      ''
      
        '       DECODE(HIS.IDMOTIVOBLOQUEIO, -1, NVL(HIS.SALDOLIBERADO,0)' +
        ', NVL(HIS.SALDOBLOQUEADO,0) ) AS SALDOATUAL, '
      ''
      '       DECODE(HIS.TIPOCUSTODIA, '#39'I'#39', '#39'I - Saldo Inicial'#39', '
      '                                '#39'C'#39', '#39'C - Aumenta'#39', '
      '                                '#39'V'#39', '#39'V - Diminui'#39', '
      '                                '#39'B'#39', '#39'B - Bloqueio'#39', '
      '                                '#39'D'#39', '#39'D - Desbloqueio'#39', '
      '                                '#39'X'#39', '#39'X - Desbloqueia e Vende'#39', '
      
        '                                '#39'Y'#39', '#39'Y - Aumenta Saldo Bloquead' +
        'o'#39', '
      
        '                                '#39'Z'#39', '#39'Z - Diminui Saldo Bloquead' +
        'o'#39') AS MOVIMENTO, '
      ''
      
        '       HIS.IDCUSTODIA, HIS.IDOPERACAOINVEST, HIS.IDCARTEIRAINVES' +
        'T, HIS.IDINVESTIMENTO, '
      
        '       HIS.IDCUSTODIANTE, HIS.IDMOTIVOBLOQUEIO, HIS.TIPOCUSTODIA' +
        ' '
      ' '
      
        'FROM HISTCUSTODIA HIS, OPERACAOINVEST OPI, TIPOOPERACAO TOP, OPE' +
        'RCUSTODIA OPC, TIPOOPERACAO TOC, '
      
        '     MOTIVOBLOQUEIO MOT, CUSTODIANTE CUT, CARTEIRAINVEST CTI, IN' +
        'VESTIMENTO INV, VWPLANPREVCTBPATR PP '
      
        'WHERE HIS.DATAMOVCUSTOD BETWEEN TO_DATE('#39'01/09/2006'#39', '#39'DD/MM/YYY' +
        'Y'#39' ) AND'
      
        '                                TO_DATE('#39'30/09/2006'#39', '#39'DD/MM/YYY' +
        'Y'#39')'
      '  AND (HIS.IDOPERACAOINVEST = OPI.IDOPERACAOINVEST(+)) '
      '  AND (OPI.IDTIPOOPERACAO      = TOP.IDTIPOOPERACAO(+)) '
      '  AND (HIS.IDOPERCUSTODIA = OPC.IDOPERCUSTODIA(+)) '
      '  AND (OPC.IDTIPOOPERACAO = TOC.IDTIPOOPERACAO(+)) '
      '  AND (HIS.IDCUSTODIANTE = CUT.IDCUSTODIANTE) '
      '  AND (HIS.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR) '
      '  AND (HIS.IDCARTEIRAINVEST = CTI.IDCARTEIRAINVEST) '
      '  AND (HIS.IDINVESTIMENTO = INV.IDINVESTIMENTO) '
      '  AND (HIS.IDMOTIVOBLOQUEIO  = MOT.IDMOTIVOBLOQUEIO) '
      ' '
      
        'ORDER BY CTI.DESCCARTINVEST, CUT.SGLCUSTODIANTE, INV.DESCINVESTI' +
        'MENTO, '
      '         HIS.DATAMOVCUSTOD, HIS.IDCUSTODIA')
    ClientDataSet = cdsHistCustodia
    Left = 24
    Top = 72
  end
  object dsHistCustodia: TDataSource
    DataSet = cdsHistCustodia
    Left = 160
    Top = 72
  end
  object pplHistCustodia: TppBDEPipeline
    DataSource = dsHistCustodia
    UserName = 'pplHistCustodia'
    Left = 53
    Top = 136
    object pplHistCustodiappField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 0
    end
    object pplHistCustodiappField2: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplHistCustodiappField3: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object pplHistCustodiappField4: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplHistCustodiappField5: TppField
      FieldAlias = 'DESCMOTBLOQ'
      FieldName = 'DESCMOTBLOQ'
      FieldLength = 36
      DisplayWidth = 36
      Position = 4
    end
    object pplHistCustodiappField6: TppField
      FieldAlias = 'DATAMOVCUSTOD'
      FieldName = 'DATAMOVCUSTOD'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplHistCustodiappField7: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplHistCustodiappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplHistCustodiappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEMOVCUSTOD'
      FieldName = 'QTDEMOVCUSTOD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplHistCustodiappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATUAL'
      FieldName = 'SALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplHistCustodiappField11: TppField
      FieldAlias = 'MOVIMENTO'
      FieldName = 'MOVIMENTO'
      FieldLength = 27
      DisplayWidth = 27
      Position = 10
    end
    object pplHistCustodiappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIA'
      FieldName = 'IDCUSTODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplHistCustodiappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOINVEST'
      FieldName = 'IDOPERACAOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplHistCustodiappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplHistCustodiappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplHistCustodiappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplHistCustodiappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOTIVOBLOQUEIO'
      FieldName = 'IDMOTIVOBLOQUEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplHistCustodiappField18: TppField
      FieldAlias = 'TIPOCUSTODIA'
      FieldName = 'TIPOCUSTODIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
  end
  object rptHistCustodia: TppReport
    AutoStop = False
    DataPipeline = pplHistCustodia
    OnStartPage = rptHistCustodiaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Movimentação de Custódia'
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
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 146
    Top = 136
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplHistCustodia'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Histórico de Movimentação de Custódia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 66675
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object lblCarteira: TppDBText
        UserName = 'lblCarteira'
        OnGetText = lblCarteiraGetText
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 14023
        mmWidth = 94456
        BandType = 0
      end
      object linCabecalho: TppLine
        UserName = 'linCabecalho'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object lblPlanoPatro: TppDBText
        UserName = 'lblPlanoPatro'
        OnGetText = lblPlanoPatroGetText
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 8731
        mmWidth = 94456
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDOATUAL'
        DataPipeline = pplHistCustodia
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 263261
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        ReprintOnOverFlow = True
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        ResetGroup = ppGroup2
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCMOTBLOQ'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 38100
        mmTop = 0
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAMOVCUSTOD'
        DataPipeline = pplHistCustodia
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 91546
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 111390
        mmTop = 0
        mmWidth = 46038
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MOVIMENTO'
        DataPipeline = pplHistCustodia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 166423
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDEMOVCUSTOD'
        DataPipeline = pplHistCustodia
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 235480
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplHistCustodia
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistCustodia'
        mmHeight = 2910
        mmLeft = 201613
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257440
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplHistCustodia
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistCustodia'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplHistCustodia
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistCustodia'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object grpRodapeCarteira: TppGroupFooterBand
        BeforePrint = grpRodapeCarteiraBeforePrint
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'SGLCUSTODIANTE'
      DataPipeline = pplHistCustodia
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistCustodia'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object shpCabecalho: TppShape
          UserName = 'shpCabecalho'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3969
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object shpCustodiante: TppShape
          UserName = 'shpDetalhe1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'SGLCUSTODIANTE'
          DataPipeline = pplHistCustodia
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplHistCustodia'
          mmHeight = 3302
          mmLeft = 24871
          mmTop = 0
          mmWidth = 15748
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Custodiante: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 0
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          Caption = 'Investimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 794
          mmTop = 4233
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 91281
          mmTop = 4233
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label3'
          Caption = 'Tipo de Operação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 111390
          mmTop = 4233
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Movimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 166423
          mmTop = 4233
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label5'
          Caption = 'Motivo de Bloqueio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 38100
          mmTop = 4233
          mmWidth = 22490
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label6'
          Caption = 'Qtd Movimentada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 4233
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo Atual'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2963
          mmLeft = 270257
          mmTop = 4233
          mmWidth = 13377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label101'
          Caption = 'Saldo Anterior'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2963
          mmLeft = 205317
          mmTop = 4233
          mmWidth = 16764
          BandType = 3
          GroupNo = 1
        end
      end
      object grpRodapeCustodiante: TppGroupFooterBand
        BeforePrint = grpRodapeCustodianteBeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplHistCustodia
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplHistCustodia'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object grpRodapeInvestimento: TppGroupFooterBand
        BeforePrint = grpRodapeInvestimentoBeforePrint
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'linCabecalho1'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
