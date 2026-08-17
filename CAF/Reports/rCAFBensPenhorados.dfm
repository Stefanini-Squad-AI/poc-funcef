inherited RptCAFBensPenhorados: TRptCAFBensPenhorados
  Left = 385
  Top = 324
  Width = 179
  Height = 253
  Caption = 'RptCAFBensPenhorados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Filtro de Bens Penhorados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Placa'
        Controle = tcMontaSelect
        TipodeDado = tdReal
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
        Name = 'PLACA'
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
        MontaSelect = MSBem
        Width = 0
      end
      item
        Caption = 'Data Movimentação'
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
        Caption = 'Período Inicial da Penhora'
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
        Caption = 'Período Final da Penhora'
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
    Formheight = 180
    FormWidth = 430
    Left = 56
    Top = 0
  end
  inherited DevRptCM: TExtraOptions
    Left = 0
    Top = 0
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBensPenhorados
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 28
    Top = 0
  end
  object sqlBensPenhorados: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ LEADING(EPT) INDEX(EPT) */'
      '  B.IDBEM, B.PLACA, B.DESBEM,'
      '  B.CONTROLE,  CC.NOME AS DESCCCUSTO,'
      '  L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCGRUPO,'
      '  C.DESCCONJUNTO, B.IDOPCIONAL, CB.DESCRICAO AS DESCCLASSE,'
      '  S.DESCSITUACAO,'
      '  EPT.DATAREALOCOR AS DATA_PENHORA,'
      '  EPT.NUMPROCTRAB,'
      '  DECODE(EPT.INDVALOR,1, EPT.VALOR, 3,'
      '    ( (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '       SB.REAVVALORG + SB.REAVCMBEM -'
      '       SB.REAVDEPLANC - SB.REAVCMDEP +'
      '       SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '       SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP) * (NVL(EPT.VALOR,1) ' +
        '/ 100) ) ) AS VALOR_PENHORA,'
      '    EPT.VALOR,'
      '    EPT.INDVALOR,'
      '    (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '     SB.REAVVALORG + SB.REAVCMBEM -'
      '     SB.REAVDEPLANC - SB.REAVCMDEP +'
      '     SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      '     SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)   AS VALCTB0'
      ' FROM BEM         B,'
      '      GRUPO       G,'
      '      CLASSEDEBEM CB,'
      '      CONJUNTO    C,'
      '      LOCALIZACAO L,'
      '      CENTCUST    CC,'
      '      PESSOA      PR,'
      '      PESSOA      PF,'
      '      SITUACAO    S,'
      '      ETAPAPROCTRAB EPT,'
      '      (SELECT'
      '         SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM,'
      '         SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALORG,'
      '         SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM,'
      '         SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLANC,'
      '         SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP,'
      '         SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVEL'
      '       FROM'
      '         SALDOCONTABBEM SCB1, SLDCTBBEMXDEP SCD1,'
      '         (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '          FROM SALDOCONTABBEM'
      '          WHERE'
      '            DATASLDBEM <= :DATASLD'
      '            AND MOECODIGO = :MOECODIGO'
      '            AND IDPESSOA = :IDEMPRESA'
      '          GROUP BY IDBEM) DTAMAX'
      '       WHERE'
      '         SCB1.MOECODIGO = SCD1.MOECODIGO'
      '         AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '         AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '         AND SCD1.MOECODIGO = :MOECODIGO'
      '         AND SCD1.IDPESSOA = :IDEMPRESA'
      '         AND SCB1.IDBEM = DTAMAX.IDBEM'
      '         AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '         AND SCB1.IDBEM = SCD1.IDBEM'
      '         AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '         AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SB'
      ' WHERE'
      '   B.DATAINICIODEP <= :DATASLD'
      '   AND G.FLGIMOVEL = 0'
      '   AND B.IDPESSOA = :IDEMPRESA'
      '   AND SB.IDBEM = B.IDBEM'
      '   AND SB.IDPESSOA = B.IDPESSOA'
      '   AND SB.IDGRUPO = G.IDGRUPO'
      '   AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '   AND SB.IDPESSOA = L.IDPESSOA'
      '   AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '   AND L.IDEMPRESA = CC.IDEMPRESA'
      '   AND SB.IDRESPONSAVEL = PR.IDPESSOA'
      '   AND B.IDCONJUNTO = C.IDCONJUNTO'
      '   AND B.IDPESSOA = C.IDPESSOA'
      '   AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      '   AND B.IDSITUACAO = S.IDSITUACAO'
      '   AND B.IDFORNSERV = PF.IDPESSOA(+)'
      '   AND B.IDBEM = EPT.IDBEM'
      '   AND B.IDMODULO <> 54'
      ''
      ' '
      ' ')
    ClientDataSet = cdsBensPenhorados
    Left = 84
    Top = 114
  end
  object cdsBensPenhorados: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 85
    Data = {
      110200009619E0BD010000001800000012000000000003000000110205494442
      454D080004000000000005504C41434108000400000000000644455342454D01
      0049000000010005574944544802000200C80008434F4E54524F4C4501004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020001000A4445534343435553544F01004900000001000557494454
      48020002001E0009444553434C4F43414C010049000000010005574944544802
      0002003C00084E4F4D4552455350010049000000010005574944544802000200
      3C000944455343475255504F0100490000000100055749445448020002003C00
      0C44455343434F4E4A554E544F010049000000010005574944544802000200C8
      000A49444F5043494F4E414C0100490000000100055749445448020002001E00
      0A44455343434C415353450100490000000100055749445448020002003C000C
      44455343534954554143414F0100490000000100055749445448020002002D00
      0C444154415F50454E484F524108000800000000000B4E554D50524F43545241
      4208000400000000000D56414C4F525F50454E484F5241080004000000000005
      56414C4F52080004000000000008494E4456414C4F5208000400000000000756
      414C43544230080004000000000002000D44454641554C545F4F524445520200
      8200010000000200044C4349440400010009080000}
    object cdsBensPenhoradosIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object cdsBensPenhoradosPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object cdsBensPenhoradosDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object cdsBensPenhoradosCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object cdsBensPenhoradosDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object cdsBensPenhoradosDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object cdsBensPenhoradosNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object cdsBensPenhoradosDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object cdsBensPenhoradosDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object cdsBensPenhoradosIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object cdsBensPenhoradosDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object cdsBensPenhoradosDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Size = 45
    end
    object cdsBensPenhoradosDATA_PENHORA: TDateTimeField
      FieldName = 'DATA_PENHORA'
    end
    object cdsBensPenhoradosNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
    end
    object cdsBensPenhoradosVALOR_PENHORA: TFloatField
      FieldName = 'VALOR_PENHORA'
    end
    object cdsBensPenhoradosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsBensPenhoradosINDVALOR: TFloatField
      FieldName = 'INDVALOR'
    end
    object cdsBensPenhoradosVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
  object dsBensPenhorados: TwwDataSource
    DataSet = cdsBensPenhorados
    Left = 84
    Top = 56
  end
  object ppBensPenhorados: TppBDEPipeline
    DataSource = dsBensPenhorados
    AutoCreateFields = False
    UserName = 'BensPenhorados'
    Left = 84
    Top = 28
    object ppBensPenhoradosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBensPenhoradosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBensPenhoradosppField3: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 2
    end
    object ppBensPenhoradosppField4: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppBensPenhoradosppField5: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppBensPenhoradosppField6: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppBensPenhoradosppField7: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppBensPenhoradosppField8: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppBensPenhoradosppField9: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 8
    end
    object ppBensPenhoradosppField10: TppField
      FieldAlias = 'IDOPCIONAL'
      FieldName = 'IDOPCIONAL'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppBensPenhoradosppField11: TppField
      FieldAlias = 'DESCCLASSE'
      FieldName = 'DESCCLASSE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppBensPenhoradosppField12: TppField
      FieldAlias = 'DESCSITUACAO'
      FieldName = 'DESCSITUACAO'
      FieldLength = 45
      DisplayWidth = 45
      Position = 11
    end
    object ppBensPenhoradosppField13: TppField
      FieldAlias = 'DATA_PENHORA'
      FieldName = 'DATA_PENHORA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppBensPenhoradosppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBensPenhoradosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PENHORA'
      FieldName = 'VALOR_PENHORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppBensPenhoradosppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppBensPenhoradosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDVALOR'
      FieldName = 'INDVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBensPenhoradosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB0'
      FieldName = 'VALCTB0'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
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
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 28
    Top = 56
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 28
  end
  object rpBensPenhorados: TppReport
    AutoStop = False
    DataPipeline = ppBensPenhorados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 84
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBensPenhorados'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object lblTituloRelat: TppLabel
        UserName = 'lblTituloRelat'
        Caption = 'Relatório de Bens Penhorados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5165
        mmLeft = 67786
        mmTop = 7673
        mmWidth = 61807
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 16140
        mmWidth = 197300
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
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 16933
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 15081
        mmTop = 16933
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Vlr Penhora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 16933
        mmWidth = 17992
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Dt Penhora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 114036
        mmTop = 16933
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nº Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 131763
        mmTop = 16933
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Vlr Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 16933
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'PLACA'
        DataPipeline = ppBensPenhorados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR_PENHORA'
        DataPipeline = ppBensPenhorados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3969
        mmLeft = 151077
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DESBEM'
        DataPipeline = ppBensPenhorados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 265
        mmWidth = 97631
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'DATA_PENHORA'
        DataPipeline = ppBensPenhorados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3969
        mmLeft = 113506
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'NUMPROCTRAB'
        DataPipeline = ppBensPenhorados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3969
        mmLeft = 131498
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText5'
        DataField = 'VALCTB0'
        DataPipeline = ppBensPenhorados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 170921
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
        mmLeft = 74877
        mmTop = 1588
        mmWidth = 71702
        BandType = 8
      end
      object LblSistema: TppLabel
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 55298
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR_PENHORA'
        DataPipeline = ppBensPenhorados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 794
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALCTB0'
        DataPipeline = ppBensPenhorados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBensPenhorados'
        mmHeight = 3704
        mmLeft = 174096
        mmTop = 794
        mmWidth = 22225
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label3'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142346
        mmTop = 1058
        mmWidth = 7673
        BandType = 7
      end
    end
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.PLACA'
      'BEM.IDBEM')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      'BEM.IDMODULO <> 54')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 56
    Top = 29
  end
end
