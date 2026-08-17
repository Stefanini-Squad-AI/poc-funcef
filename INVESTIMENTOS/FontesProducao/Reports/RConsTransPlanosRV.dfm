inherited RelConsTransPlanosRV: TRelConsTransPlanosRV
  Left = 513
  Top = 194
  Width = 281
  Height = 276
  Caption = 'RelConsTransPlanosRV'
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
        Caption = 'Data :'
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
        Caption = 'Plano de Origem :'
        Controle = tcEdit
        CampoBanco = 'PLANPRVCONTABPATRO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   PA.IDPLANPREVCTBPATR,'
          '   PA.IDPLANOPREV,'
          '   PA.IDPATRO,'
          '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
          'FROM'
          '   PESSOA PE,'
          '   PLANPREVCONTABPATRO PA,'
          '   PLANPREVCONTABIL PL'
          'WHERE'
          '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
          '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PlanoOrigem'
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
        Caption = 'Carteira :'
        Controle = tcEdit
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
        MostraComboCompara = True
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
        Caption = 'Investimento :'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Invetimento'
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
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
  end
  object sprConsTransPlanosMT: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OPO.IDPLANPREVCTBPATR, OPO.IDCARTEIRAINVEST, OPO.IDINVEST' +
        'IMENTO, OPO.DATAOPERACAO, OPO.IDTIPOOPERACAO, OPO.NUMDOCUMENTO, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-158, NVL(HC3.SALDOQTDECPMF,0),' +
        '(NVL(HC3.SALDOQTDEINVCART,0)-NVL(HC3.SALDOQTDECPMF,0))) AS SALDO' +
        'ANTORIG, '
      '       OPO.QTDTRANSFORIG,'
      
        '       DECODE(OPO.IDTIPOOPERACAO,-158,HCO.SALDOQTDECPMF,(HCO.SAL' +
        'DOQTDEINVCART-HCO.SALDOQTDECPMF)) AS SALDOATUORIG, '
      
        '       OPO.TIPOSALDO, OPO.PERCENTUAL, OMO.IDOPERACAOINVEST, OPD.' +
        'IDPLANPREVCTBPATR, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-159, NVL(HC2.SALDOQTDECPMF,0),' +
        '(NVL(HC2.SALDOQTDEINVCART,0)-NVL(HC2.SALDOQTDECPMF,0))) AS SALDO' +
        'ANTDEST, '
      '       OPD.QTDTRANSFDEST, '
      
        '       DECODE(OPD.IDTIPOOPERACAO,-159,HCD.SALDOQTDECPMF,(HCD.SAL' +
        'DOQTDEINVCART-HCD.SALDOQTDECPMF)) AS SALDOATUDEST, '
      '       PPO.PLANPRVCONTABPATRO AS PLANOORIG, '
      '       PPD.PLANPRVCONTABPATRO AS PLANODEST, '
      '       CA.DESCCARTINVEST, '
      '       IV.DESCINVESTIMENTO, '
      
        '       OPO.DATAOPERACAO || CA.DESCCARTINVEST || PPO.PLANPRVCONTA' +
        'BPATRO || PPD.PLANPRVCONTABPATRO || OPO.NUMDOCUMENTO || OPO.IDIN' +
        'VESTIMENTO AS GRUPO '
      'FROM '
      
        '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, '
      
        '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFORIG, DECODE(OP.IDTIP' +
        'OOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      '          OP.PERCENTUAL '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) '
      
        '     AND (OP.DATAOPERACAO BETWEEN TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YY' +
        'YY'#39') AND TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND (OP.IDPLANPREVCTBPATR = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, O' +
        'P.PERCENTUAL) OPO, '
      
        '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.I' +
        'DTIPOOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      
        '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND (OP.IDPLANPREVCTBPATR = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) O' +
        'MO, '
      '   HISTCARTINV HCO, '
      
        '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, '
      
        '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFDEST, DECODE(OP.IDTIP' +
        'OOPERACAO,-159,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      '          OP.PERCENTUAL '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, O' +
        'P.PERCENTUAL) OPD, '
      
        '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.I' +
        'DTIPOOPERACAO,-158,'#39'CC'#39','#39'CCI'#39') AS TIPOSALDO, '
      
        '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVEST' +
        'IMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO '
      '   FROM OPERACAOINVEST OP '
      '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) '
      '     AND (OP.DATAOPERACAO = TO_DATE('#39'01/09/2006'#39','#39'DD/MM/YYYY'#39')) '
      '     AND (OP.IDINVESTIMENTO = 9660) '
      '     AND (OP.IDCARTEIRAINVEST = 1) '
      '     AND OP.IDCARTEIRAGERENC IS NULL '
      
        '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVE' +
        'STIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) O' +
        'MD, '
      
        '   HISTCARTINV HCD, INVESTIMENTO IV, CARTEIRAINVEST CA, VWPLANPR' +
        'EVCTBPATR PPO, VWPLANPREVCTBPATR PPD, '
      
        '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST' +
        ', HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, '
      '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO '
      '   FROM HISTCARTINV HC '
      '   WHERE '
      '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) '
      '                          FROM HISTCARTINV HC1 '
      '                          WHERE '
      '                                HC1.IDTIPOINVEST   = 2  '
      '                            AND HC1.IDCARTEIRAGERENC IS NULL '
      
        '                            AND HC1.DATAMOVCARTINV = TO_DATE('#39'31' +
        '/08/2006'#39','#39'DD/MM/YYYY'#39') '
      '                            AND HC1.TIPMOVCARTINV  = '#39'ATU'#39' '
      
        '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANP' +
        'REVCTBPATR, HC1.IDCARTEIRAINVEST, '
      
        '                                   HC1.IDCARTEIRAGERENC, HC1.IDI' +
        'NVESTIMENTO) ) HC3, '
      
        '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST' +
        ', HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, '
      '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO '
      '   FROM HISTCARTINV HC '
      '   WHERE '
      '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) '
      '                          FROM HISTCARTINV HC1 '
      '                          WHERE '
      '                                HC1.IDTIPOINVEST   = 2 '
      '                            AND HC1.IDCARTEIRAGERENC IS NULL '
      
        '                            AND HC1.DATAMOVCARTINV = TO_DATE('#39'31' +
        '/08/2006'#39','#39'DD/MM/YYYY'#39') '
      '                            AND HC1.TIPMOVCARTINV  = '#39'ATU'#39' '
      
        '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANP' +
        'REVCTBPATR, HC1.IDCARTEIRAINVEST, '
      
        '                                   HC1.IDCARTEIRAGERENC, HC1.IDI' +
        'NVESTIMENTO) ) HC2 '
      'WHERE OMO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND OMO.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND OMO.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND OMO.DATAOPERACAO       = OPO.DATAOPERACAO '
      '  AND OMO.IDTIPOOPERACAO     = OPO.IDTIPOOPERACAO '
      '  AND OMO.NUMDOCUMENTO       = OPO.NUMDOCUMENTO '
      '  AND HCO.IDOPERACAOINVEST   = OMO.IDOPERACAOINVEST '
      '  AND OPD.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND OPD.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND OPD.DATAOPERACAO       = OPO.DATAOPERACAO '
      '  AND OPD.NUMDOCUMENTO       = OPO.NUMDOCUMENTO '
      '  AND OPD.TIPOSALDO          = OPO.TIPOSALDO '
      '  AND OMD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR '
      '  AND OMD.IDCARTEIRAINVEST   = OPD.IDCARTEIRAINVEST '
      '  AND OMD.IDINVESTIMENTO     = OPD.IDINVESTIMENTO '
      '  AND OMD.DATAOPERACAO       = OPD.DATAOPERACAO '
      '  AND OMD.IDTIPOOPERACAO     = OPD.IDTIPOOPERACAO '
      '  AND OMD.NUMDOCUMENTO       = OPD.NUMDOCUMENTO '
      '  AND HCD.IDOPERACAOINVEST   = OMD.IDOPERACAOINVEST '
      '  AND IV.IDINVESTIMENTO      = OPO.IDINVESTIMENTO '
      '  AND CA.IDCARTEIRAINVEST    = OPO.IDCARTEIRAINVEST '
      '  AND PPO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND PPD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR '
      '  AND HC3.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR '
      '  AND HC3.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST '
      '  AND HC3.IDINVESTIMENTO     = OPO.IDINVESTIMENTO '
      '  AND HC2.IDPLANPREVCTBPATR(+) = OPD.IDPLANPREVCTBPATR '
      '  AND HC2.IDCARTEIRAINVEST(+)  = OPD.IDCARTEIRAINVEST '
      '  AND HC2.IDINVESTIMENTO(+)    = OPD.IDINVESTIMENTO '
      
        'ORDER BY OPO.DATAOPERACAO, CA.DESCCARTINVEST, OPO.NUMDOCUMENTO, ' +
        'PPO.PLANPRVCONTABPATRO, PPD.PLANPRVCONTABPATRO, IV.DESCINVESTIME' +
        'NTO ')
    ClientDataSet = CdsConsTransPlanosMT
    Left = 48
    Top = 80
  end
  object CdsConsTransPlanosMT: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 80
    Data = {
      970700009619E0BD010000001800000015000400000003000000550211494450
      4C414E5052455643544250415452080004000000000010494443415254454952
      41494E5645535408000400000000000E4944494E56455354494D454E544F0800
      0400000000000C444154414F5045524143414F08000800000000000E49445449
      504F4F5045524143414F08000400000000000C4E554D444F43554D454E544F01
      00490000000100055749445448020002001E000C53414C444F414E544F524947
      08000400000000000D5154445452414E53464F52494708000400000000000C53
      414C444F4154554F5249470800040000000000095449504F53414C444F010049
      00000001000557494454480200020003000A50455243454E5455414C08000400
      000000001049444F5045524143414F494E564553540800040000000000134944
      504C414E50524556435442504154525F3108000400000000000C53414C444F41
      4E544445535408000400000000000D5154445452414E53464445535408000400
      000000000C53414C444F41545544455354080004000000000009504C414E4F4F
      524947010049000000010005574944544802000200710009504C414E4F444553
      5401004900000001000557494454480200020071000E4445534343415254494E
      564553540100490000000100055749445448020002003C001044455343494E56
      455354494D454E544F0100490000000100055749445448020002003C00054752
      55504F04004B0000000200075355425459504502004900050054657874000557
      49445448020002006C010100044C434944040001000908000000000000000000
      000000000000F03F000000000000F03F0000000000DEC2400000FAFF3EC8CC42
      0000000000C063C00A52562D30362F31343239000000000000000000000000C0
      30F840000000000E952341024343000000000000244000000000606EE9400000
      000000002240000000000000000000000000C030F84000000000C030F8401252
      45472F5245504C414E202D204341495841105245422032303032202D20434149
      584125415650202D2043617274656972612052656E64612056617269E176656C
      205072F37072696115414C4C20414D4552494341204C4154494E41204F4E5D00
      000030312F30392F3036415650202D2043617274656972612052656E64612056
      617269E176656C205072F3707269615245472F5245504C414E202D2043414958
      415245422032303032202D20434149584152562D30362F313432393936363000
      000000000000000000000000F03F000000000000F03F0000000000DEC2400000
      FAFF3EC8CC420000000000D7C3C00A52562D30362F3134323900000000000000
      0000000000B084014100000000BA5C2C41034343490000000000002440000000
      00A06EE9400000000000002240000000000000000000000000B0840141000000
      00B0840141125245472F5245504C414E202D2043414958411052454220323030
      32202D20434149584125415650202D2043617274656972612052656E64612056
      617269E176656C205072F37072696115414C4C20414D4552494341204C415449
      4E41204F4E5D00000030312F30392F3036415650202D20436172746569726120
      52656E64612056617269E176656C205072F3707269615245472F5245504C414E
      202D2043414958415245422032303032202D20434149584152562D30362F3134
      32393936363000000000000000000000000000F03F000000000000F03F000000
      0000DEC2400000FAFF3EC8CC420000000000C063C00A52562D30362F31343237
      00000000000000000000000048870E4100000000269B26410243433E0AD7A370
      3D394000000000A044E9400000000000002C4000000000000000000000000048
      870E410000000048870E41125245472F5245504C414E202D2043414958411A52
      45472F5245504C414E2053414C4441444F202D20434149584125415650202D20
      43617274656972612052656E64612056617269E176656C205072F37072696115
      414C4C20414D4552494341204C4154494E41204F4E6700000030312F30392F30
      36415650202D2043617274656972612052656E64612056617269E176656C2050
      72F3707269615245472F5245504C414E202D2043414958415245472F5245504C
      414E2053414C4441444F202D20434149584152562D30362F3134323739363630
      00000000000000000000000000F03F000000000000F03F0000000000DEC24000
      00FAFF3EC8CC420000000000D7C3C00A52562D30362F31343237000000000000
      000000000000AC1B164100000000F35E3041034343493E0AD7A3703D39400000
      0000E044E9400000000000002C40000000000000000000000000AC1B16410000
      0000AC1B1641125245472F5245504C414E202D2043414958411A5245472F5245
      504C414E2053414C4441444F202D20434149584125415650202D204361727465
      6972612052656E64612056617269E176656C205072F37072696115414C4C2041
      4D4552494341204C4154494E41204F4E6700000030312F30392F303641565020
      2D2043617274656972612052656E64612056617269E176656C205072F3707269
      615245472F5245504C414E202D2043414958415245472F5245504C414E205341
      4C4441444F202D20434149584152562D30362F3134323739363630}
    object CdsConsTransPlanosMTPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.00'
    end
    object CdsConsTransPlanosMTSALDOANTORIG: TFloatField
      FieldName = 'SALDOANTORIG'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTSALDOATUORIG: TFloatField
      FieldName = 'SALDOATUORIG'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTSALDOANTDEST: TFloatField
      FieldName = 'SALDOANTDEST'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTSALDOATUDEST: TFloatField
      FieldName = 'SALDOATUDEST'
      DisplayFormat = '###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object CdsConsTransPlanosMTPLANOORIG: TStringField
      FieldName = 'PLANOORIG'
      Size = 113
    end
    object CdsConsTransPlanosMTPLANODEST: TStringField
      FieldName = 'PLANODEST'
      Size = 113
    end
    object CdsConsTransPlanosMTDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object CdsConsTransPlanosMTQTDTRANSFORIG: TFloatField
      FieldName = 'QTDTRANSFORIG'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTQTDTRANSFDEST: TFloatField
      FieldName = 'QTDTRANSFDEST'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object CdsConsTransPlanosMTDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsConsTransPlanosMTTIPOSALDO: TStringField
      FieldName = 'TIPOSALDO'
      Size = 3
    end
    object CdsConsTransPlanosMTGRUPO: TMemoField
      FieldName = 'GRUPO'
      BlobType = ftMemo
      Size = 364
    end
    object CdsConsTransPlanosMTDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object CdsConsTransPlanosMTNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
  end
  object dsConsTransPlanosMT: TDataSource
    DataSet = CdsConsTransPlanosMT
    Left = 184
    Top = 80
  end
  object rptConsTransPlanosMT: TppReport
    AutoStop = False
    DataPipeline = pplConsTransPlanosMT
    OnStartPage = rptConsTransPlanosMTStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Operações de Transferência entre Planos'
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
    Left = 170
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsTransPlanosMT'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpCabecalho1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 10583
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Histórico de Operações de Transferência entre Planos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 90594
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
      object pplPlanoOrig: TppLabel
        UserName = 'Label1'
        Caption = 'Plano / Patro de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 132027
        mmTop = 19844
        mmWidth = 27781
        BandType = 0
      end
      object pplCarteira: TppLabel
        UserName = 'Label5'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 30163
        mmTop = 19844
        mmWidth = 9271
        BandType = 0
      end
      object pplData: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 19844
        mmWidth = 5556
        BandType = 0
      end
      object pplBoleta: TppLabel
        UserName = 'Label3'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15610
        mmTop = 20108
        mmWidth = 7408
        BandType = 0
      end
      object pplSldQtdAntOrig: TppLabel
        UserName = 'lSldQtdAntOrig'
        Caption = 'Saldo Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 132027
        mmTop = 25929
        mmWidth = 16933
        BandType = 0
      end
      object pplSldQtdAntDest: TppLabel
        UserName = 'lSldQtdAntDest'
        Caption = 'Saldo Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 218017
        mmTop = 25929
        mmWidth = 16933
        BandType = 0
      end
      object pplPlanoDest: TppLabel
        UserName = 'Label4'
        Caption = 'Plano / Patro de Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 218017
        mmTop = 19844
        mmWidth = 28310
        BandType = 0
      end
      object pplQtdTransf: TppLabel
        UserName = 'lSldQtdAntOrig1'
        Caption = 'Qtd. Transferida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 154252
        mmTop = 25929
        mmWidth = 19050
        BandType = 0
      end
      object pplQtdRecebida: TppLabel
        UserName = 'lSldQtdAntDest1'
        Caption = 'Qtd. Recebida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242359
        mmTop = 25929
        mmWidth = 16669
        BandType = 0
      end
      object pplSldAtuOrig: TppLabel
        UserName = 'Label6'
        Caption = 'Saldo Posterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 179917
        mmTop = 25929
        mmWidth = 17992
        BandType = 0
      end
      object pplSldAtuDest: TppLabel
        UserName = 'Label7'
        Caption = 'Saldo Posterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 264848
        mmTop = 25929
        mmWidth = 18076
        BandType = 0
      end
      object pplPercentual: TppLabel
        UserName = 'Label8'
        Caption = 'Percentual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 200555
        mmTop = 25929
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label9'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 81492
        mmTop = 19844
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label11'
        Caption = 'Tipo de Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 118004
        mmTop = 23019
        mmWidth = 9260
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbSldAntOrig: TppDBText
        UserName = 'dbSldAntOrig'
        DataField = 'SALDOANTORIG'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 126471
        mmTop = 529
        mmWidth = 22489
        BandType = 4
      end
      object ppdbSldAntDest: TppDBText
        UserName = 'dbSldAntDest'
        DataField = 'SALDOANTDEST'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 213255
        mmTop = 529
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbSldAntOrig1'
        DataField = 'QTDTRANSFORIG'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 150813
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbSldAntDest1'
        DataField = 'QTDTRANSFDEST'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppdbSldAtuOrig: TppDBText
        UserName = 'dbSldAtuOrig'
        DataField = 'SALDOATUORIG'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 175419
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppdbSldAtuDest: TppDBText
        UserName = 'dbSldAtuDest'
        DataField = 'SALDOATUDEST'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 260086
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dbBoleta1'
        DataField = 'PERCENTUAL'
        DataPipeline = pplConsTransPlanosMT
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 200555
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        DataField = 'TIPOSALDO'
        DataPipeline = pplConsTransPlanosMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosMT'
        mmHeight = 2910
        mmLeft = 119856
        mmTop = 529
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label10'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 210873
        mmTop = 529
        mmWidth = 2117
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
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
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1058
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
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
        mmHeight = 3439
        mmLeft = 257440
        mmTop = 1058
        mmWidth = 26194
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
        mmLeft = 0
        mmTop = 1058
        mmWidth = 283369
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplConsTransPlanosMT
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsTransPlanosMT'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppdbData: TppDBText
          UserName = 'dbData'
          DataField = 'DATAOPERACAO'
          DataPipeline = pplConsTransPlanosMT
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 529
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppdbCarteira: TppDBText
          UserName = 'dbCarteira'
          DataField = 'DESCCARTINVEST'
          DataPipeline = pplConsTransPlanosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 30956
          mmTop = 529
          mmWidth = 50006
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'PLANOORIG'
          DataPipeline = pplConsTransPlanosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 132027
          mmTop = 529
          mmWidth = 51858
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PLANODEST'
          DataPipeline = pplConsTransPlanosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 218017
          mmTop = 529
          mmWidth = 51858
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'dbCarteira1'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplConsTransPlanosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 81492
          mmTop = 529
          mmWidth = 50005
          BandType = 3
          GroupNo = 0
        end
        object ppdbBoleta: TppDBText
          UserName = 'dbBoleta'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = pplConsTransPlanosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosMT'
          mmHeight = 2910
          mmLeft = 15610
          mmTop = 529
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Style = psInsideFrame
          Pen.Width = 0
          ParentWidth = True
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplConsTransPlanosMT: TppBDEPipeline
    DataSource = dsConsTransPlanosMT
    UserName = 'lConsTransPlanosMT'
    Left = 77
    Top = 144
    object pplConsTransPlanosMTppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplConsTransPlanosMTppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTORIG'
      FieldName = 'SALDOANTORIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplConsTransPlanosMTppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATUORIG'
      FieldName = 'SALDOATUORIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplConsTransPlanosMTppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTDEST'
      FieldName = 'SALDOANTDEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConsTransPlanosMTppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATUDEST'
      FieldName = 'SALDOATUDEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplConsTransPlanosMTppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConsTransPlanosMTppField7: TppField
      FieldAlias = 'PLANOORIG'
      FieldName = 'PLANOORIG'
      FieldLength = 113
      DisplayWidth = 113
      Position = 6
    end
    object pplConsTransPlanosMTppField8: TppField
      FieldAlias = 'PLANODEST'
      FieldName = 'PLANODEST'
      FieldLength = 113
      DisplayWidth = 113
      Position = 7
    end
    object pplConsTransPlanosMTppField9: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplConsTransPlanosMTppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTRANSFORIG'
      FieldName = 'QTDTRANSFORIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConsTransPlanosMTppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTRANSFDEST'
      FieldName = 'QTDTRANSFDEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplConsTransPlanosMTppField12: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object pplConsTransPlanosMTppField13: TppField
      FieldAlias = 'TIPOSALDO'
      FieldName = 'TIPOSALDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 12
    end
    object pplConsTransPlanosMTppField14: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 364
      DataType = dtMemo
      DisplayWidth = 10
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosMTppField15: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object pplConsTransPlanosMTppField16: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
  end
end
