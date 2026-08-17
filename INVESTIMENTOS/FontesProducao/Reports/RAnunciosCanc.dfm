inherited RelAnunciosCanc: TRelAnunciosCanc
  Left = 376
  Top = 179
  Width = 477
  Height = 248
  Caption = 'RelAnunciosCanc'
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
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'dtIni'
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
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'dtFim'
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
        Caption = 'Plano / Patrocinadora'
        Controle = tcLookupCombo
        CampoBanco = 'IDPLANPREVCTBPATR'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PLANPRVCONTABPATRO, IDPLANPREVCTBPATR'
          'FROM VWPLANPREVCTBPATR')
        LookupSettings.Chave = 'IDPLANPREVCTBPATR'
        LookupSettings.Display = 'PLANPRVCONTABPATRO'
        LookupSettings.Descricao = 'Plano / Patrocinadora'
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
        Name = 'iPlanoPatro'
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
        Caption = 'Investimento'
        Controle = tcLookupCombo
        CampoBanco = 'IDINVESTIMENTO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
          'FROM INVESTIMENTO'
          'WHERE IDTIPOINVEST = 2'
          '  AND FLGATIVO = '#39'S'#39
          'ORDER BY DESCINVESTIMENTO')
        LookupSettings.Chave = 'IDINVESTIMENTO'
        LookupSettings.Display = 'DESCINVESTIMENTO'
        LookupSettings.Descricao = 'Investimento'
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
        Name = 'iInvestimento'
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
        Caption = 'Operação'
        Controle = tcLookupCombo
        CampoBanco = 'IDTIPOOPERACAO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
          'FROM TIPOOPERACAO '
          'WHERE '
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRDIV FROM PARAMINVEST)' +
            ') OR'
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRDIV+10000 FROM PARAMI' +
            'NVEST)) OR'
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRJUR FROM PARAMINVEST)' +
            ') OR'
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRJUR+10000 FROM PARAMI' +
            'NVEST)) OR'
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRMUL FROM PARAMINVEST)' +
            ') OR'
          
            '   (IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRMUL+10000 FROM PARAMI' +
            'NVEST)) '
          'ORDER BY DESCTIPOOPERACAO')
        LookupSettings.Chave = 'IDTIPOOPERACAO'
        LookupSettings.Display = 'DESCTIPOOPERACAO'
        LookupSettings.Descricao = 'Operação'
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
        Name = 'iTipoOper'
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
    Formheight = 210
    FormWidth = 400
    Left = 28
    Top = 56
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptAnunciosCanc
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 27
    Top = 104
  end
  object pplAnunciosCanc: TppBDEPipeline
    DataSource = dsAnunciosCanc
    UserName = 'lAnunciosCanc'
    Left = 142
    Top = 110
    object pplAnunciosCancppField1: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField2: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField3: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField4: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField5: TppField
      FieldAlias = 'SIGLAMOTBLOQ'
      FieldName = 'SIGLAMOTBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField6: TppField
      FieldAlias = 'DESCMOTBLOQ'
      FieldName = 'DESCMOTBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField7: TppField
      FieldAlias = 'DATAEX'
      FieldName = 'DATAEX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField8: TppField
      FieldAlias = 'DATAPREVISTA'
      FieldName = 'DATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField9: TppField
      FieldAlias = 'DATABASE'
      FieldName = 'DATABASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField10: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField11: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField12: TppField
      FieldAlias = 'QTDPREVISTA'
      FieldName = 'QTDPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField13: TppField
      FieldAlias = 'VALORPREVISTO'
      FieldName = 'VALORPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField14: TppField
      FieldAlias = 'QTDRECEBIDA'
      FieldName = 'QTDRECEBIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField15: TppField
      FieldAlias = 'QTDCANCELADA'
      FieldName = 'QTDCANCELADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField16: TppField
      FieldAlias = 'PRECOUNITOPERACAO'
      FieldName = 'PRECOUNITOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField17: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField18: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplAnunciosCancppField19: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object sprAnunciosCanc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO AS BOLETA, PP.PLANPRVCONTABPATRO, TP.DESC' +
        'TIPOOPERACAO,                                            '
      
        '       IV.DESCINVESTIMENTO, CI.DESCCARTINVEST, MB.SIGLAMOTBLOQ, ' +
        'MB.DESCMOTBLOQ,                   '
      
        '       CAN.DATAOPERACAO,                                        ' +
        '                                  '
      
        '       OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREVISTA, OD.DAT' +
        'AEX AS DATABASE,                  '
      
        '       DECODE(OI.IDTIPOOPERACAO, -70, '#39'Comum'#39', '#39'Investimento'#39') A' +
        'S CONTA,                      '
      
        '       NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,                   ' +
        '                                  '
      
        '       NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,                  ' +
        '                                  '
      
        '       NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,                  ' +
        '                                  '
      
        '       NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,                 ' +
        '                                  '
      
        '       OI.PRECOUNITOPERACAO,                                    ' +
        '                                  '
      
        '       NVL(OI.VLROPERACAO,0) - NVL(REC.QTDEOPERACAO,0) - NVL(CAN' +
        '.QTDEOPERACAO,0) AS VLROPERACAO,  '
      
        '       (PP.PLANPRVCONTABPATRO || OD.DATAEX || TP.DESCTIPOOPERACA' +
        'O || OI.IDOPERACAODIREITO) AS GRUPO,                       '
      
        '       '#39'0'#39' AS COR                                               ' +
        '                                '
      
        'FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPO' +
        'OPERACAO TP,                      '
      
        '     INVESTIMENTO IV, CARTEIRAINVEST CI, MOTIVOBLOQUEIO MB, VWPL' +
        'ANPREVCTBPATR PP,                                      '
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO                           '
      
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                  ' +
        '                                  '
      
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                    ' +
        '                                  '
      
        '        AND OI1.IDTIPOOPERACAO IN (PI1.IDTIPOOPERDIRDIV, PI1.IDT' +
        'IPOOPERDIRDIV + 10000,            '
      
        '                                   PI1.IDTIPOOPERDIRJUR, PI1.IDT' +
        'IPOOPERDIRJUR + 10000,            '
      
        '                                   PI1.IDTIPOOPERDIRMUL, PI1.IDT' +
        'IPOOPERDIRMUL + 10000)            '
      
        '        AND (OI1.DATAOPERACAO <= TO_DATE('#39'01/09/2006'#39', '#39'DD/MM/YY' +
        'YY'#39')) '
      
        '      GROUP BY IDOPERACAOORIGEM) REC,                           ' +
        '                                  '
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO, OI1.DATAOPERACAO         '
      
        '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1                  ' +
        '                                  '
      
        '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL                    ' +
        '                                  '
      
        '        AND OI1.IDTIPOOPERACAO IN (-170, -10170)                ' +
        '                                  '
      
        '        AND (OI1.DATAOPERACAO BETWEEN TO_DATE('#39'01/09/2006'#39', '#39'DD/' +
        'MM/YYYY'#39') AND  '
      
        '                                      TO_DATE('#39'01/09/2006'#39', '#39'DD/' +
        'MM/YYYY'#39')) '
      
        '      GROUP BY OI1.IDOPERACAOORIGEM, OI1.DATAOPERACAO) CAN      ' +
        '                                  '
      
        'WHERE OI.IDCARTEIRAGERENC IS NULL                               ' +
        '                                  '
      
        '  AND OI.IDTIPOOPERACAO IN (-70, -10070)                        ' +
        '                                  '
      
        '  AND OI.ORIGDEST IS NOT NULL                                   ' +
        '                                    '
      
        '  AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERDI' +
        'RJUR, PI.IDTIPOOPERDIRMUL)        '
      
        '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO               ' +
        '                                  '
      
        '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO                     ' +
        '                                  '
      
        '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO                     ' +
        '                                  '
      
        '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST                 ' +
        '                                  '
      
        '  AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)              ' +
        '                                  '
      '  AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)  '
      
        '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR               ' +
        '                              '
      
        '  AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM                ' +
        '                                  '
      
        'ORDER BY PP.PLANPRVCONTABPATRO, OD.DATAEX, TP.DESCTIPOOPERACAO, ' +
        'OI.IDOPERACAODIREITO, OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO ')
    Left = 37
    Top = 161
  end
  object cdsAnunciosCanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 142
    Top = 9
    object cdsAnunciosCancBOLETA: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object cdsAnunciosCancDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object cdsAnunciosCancDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object cdsAnunciosCancDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object cdsAnunciosCancSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object cdsAnunciosCancDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object cdsAnunciosCancDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object cdsAnunciosCancDATAPREVISTA: TDateTimeField
      FieldName = 'DATAPREVISTA'
    end
    object cdsAnunciosCancDATABASE: TDateTimeField
      FieldName = 'DATABASE'
    end
    object cdsAnunciosCancDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object cdsAnunciosCancCONTA: TStringField
      FieldName = 'CONTA'
      Size = 12
    end
    object cdsAnunciosCancQTDPREVISTA: TFloatField
      FieldName = 'QTDPREVISTA'
    end
    object cdsAnunciosCancVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object cdsAnunciosCancQTDRECEBIDA: TFloatField
      FieldName = 'QTDRECEBIDA'
    end
    object cdsAnunciosCancQTDCANCELADA: TFloatField
      FieldName = 'QTDCANCELADA'
    end
    object cdsAnunciosCancPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object cdsAnunciosCancVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object cdsAnunciosCancGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 108
    end
    object cdsAnunciosCancPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object dsAnunciosCanc: TDataSource
    DataSet = cdsAnunciosCanc
    Left = 142
    Top = 59
  end
  object rptAnunciosCanc: TppReport
    AutoStop = False
    DataPipeline = pplAnunciosCanc
    OnStartPage = rptAnunciosCancStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
    Left = 222
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnunciosCanc'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object lblNomeRelatorio: TppLabel
        UserName = 'lblNomeRelatorio'
        Caption = 'Anúncio de Proventos Cancelados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 57944
        BandType = 0
      end
      object LblEmpresa: TppLabel
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
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 82550
        mmTop = 23548
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 23548
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 213784
        mmTop = 23283
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Recebido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 249767
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Valor Previsto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 232305
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Carteira de Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 265
        mmTop = 23548
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor Cancelado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 267494
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 134938
        mmTop = 23548
        mmWidth = 6879
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'BOLETA'
        DataPipeline = pplAnunciosCanc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 81756
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplAnunciosCanc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 156898
        mmTop = 794
        mmWidth = 54504
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QTDPREVISTA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 212725
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDRECEBIDA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 248180
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALORPREVISTO'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 230717
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplAnunciosCanc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 265
        mmTop = 794
        mmWidth = 80698
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'QTDCANCELADA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 265907
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CONTA'
        DataPipeline = pplAnunciosCanc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 134938
        mmTop = 794
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Cancelamento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplAnunciosCanc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 2910
        mmLeft = 116152
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 282576
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 282576
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
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 794
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label101'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 166688
        mmTop = 794
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'QTDPREVISTA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 3440
        mmLeft = 212990
        mmTop = 794
        mmWidth = 16669
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALORPREVISTO'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 3440
        mmLeft = 230453
        mmTop = 794
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'QTDRECEBIDA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 3440
        mmLeft = 249238
        mmTop = 794
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'QTDCANCELADA'
        DataPipeline = pplAnunciosCanc
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCanc'
        mmHeight = 3440
        mmLeft = 266171
        mmTop = 794
        mmWidth = 16140
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplAnunciosCanc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnunciosCanc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplAnunciosCanc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2921
          mmLeft = 265
          mmTop = 0
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'dbtTotQtdPrev1'
          DataField = 'QTDPREVISTA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 212725
          mmTop = 1058
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'dbtTotQtdRest1'
          DataField = 'VALORPREVISTO'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 230717
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'dbtTotQtdRec1'
          DataField = 'QTDRECEBIDA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 1058
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'dbtTotQtdCan1'
          DataField = 'QTDCANCELADA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 265907
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label10'
          Caption = 'Total Plano/Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 146315
          mmTop = 529
          mmWidth = 36110
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplAnunciosCanc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnunciosCanc'
      object rdpGroupGrupo: TppGroupHeaderBand
        BeforePrint = rdpGroupGrupoBeforePrint
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpGrupo: TppShape
          UserName = 'shpDetalhe2'
          ParentWidth = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          Caption = 'Tipo de Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 794
          mmTop = 529
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplAnunciosCanc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 23283
          mmTop = 529
          mmWidth = 57679
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Data EX:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 82021
          mmTop = 529
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DATAEX'
          DataPipeline = pplAnunciosCanc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 93134
          mmTop = 529
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Data Prevista:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 108744
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'DATAPREVISTA'
          DataPipeline = pplAnunciosCanc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 127265
          mmTop = 529
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Data Base:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 144198
          mmTop = 529
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DATABASE'
          DataPipeline = pplAnunciosCanc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 157957
          mmTop = 529
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object shpTotal: TppShape
          UserName = 'shpDetalhe1'
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object dbcCount: TppDBCalc
          UserName = 'dbcCount'
          DataPipeline = pplAnunciosCanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          Visible = False
          DBCalcType = dcCount
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 126471
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblTotais: TppLabel
          UserName = 'Label12'
          Caption = 'Total da Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 160073
          mmTop = 1058
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdPrev: TppDBCalc
          UserName = 'dbtTotQtdPrev'
          DataField = 'QTDPREVISTA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 212725
          mmTop = 1058
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdRest: TppDBCalc
          UserName = 'dbtTotQtdRest'
          DataField = 'VALORPREVISTO'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 230716
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdRec: TppDBCalc
          UserName = 'dbtTotQtdRec'
          DataField = 'QTDRECEBIDA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 248179
          mmTop = 1058
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdCan: TppDBCalc
          UserName = 'dbtTotQtdCan'
          DataField = 'QTDCANCELADA'
          DataPipeline = pplAnunciosCanc
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCanc'
          mmHeight = 2910
          mmLeft = 265908
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pplTotal: TppLine
          UserName = 'lTotal'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 210344
          mmTop = 265
          mmWidth = 74083
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object CdsAnunciosCancCon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 398
    Top = 9
    object StringField1: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField4: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAEX'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAPREVISTA'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATABASE'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object StringField7: TStringField
      FieldName = 'CONTA'
      Size = 12
    end
    object FloatField1: TFloatField
      FieldName = 'QTDPREVISTA'
    end
    object FloatField2: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object FloatField3: TFloatField
      FieldName = 'QTDRECEBIDA'
    end
    object FloatField4: TFloatField
      FieldName = 'QTDCANCELADA'
    end
    object FloatField5: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object FloatField6: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object StringField8: TStringField
      FieldName = 'GRUPO'
      Size = 108
    end
    object StringField9: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object DsAnunciosCancCon: TDataSource
    DataSet = CdsAnunciosCancCon
    Left = 398
    Top = 59
  end
  object pplAnunciosCancCon: TppBDEPipeline
    DataSource = DsAnunciosCancCon
    UserName = 'lAnunciosCancCon'
    Left = 398
    Top = 110
    object ppField1: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'SIGLAMOTBLOQ'
      FieldName = 'SIGLAMOTBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'DESCMOTBLOQ'
      FieldName = 'DESCMOTBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppField7: TppField
      FieldAlias = 'DATAEX'
      FieldName = 'DATAEX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppField8: TppField
      FieldAlias = 'DATAPREVISTA'
      FieldName = 'DATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppField9: TppField
      FieldAlias = 'DATABASE'
      FieldName = 'DATABASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppField10: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppField11: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppField12: TppField
      FieldAlias = 'QTDPREVISTA'
      FieldName = 'QTDPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppField13: TppField
      FieldAlias = 'VALORPREVISTO'
      FieldName = 'VALORPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppField14: TppField
      FieldAlias = 'QTDRECEBIDA'
      FieldName = 'QTDRECEBIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppField15: TppField
      FieldAlias = 'QTDCANCELADA'
      FieldName = 'QTDCANCELADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppField16: TppField
      FieldAlias = 'PRECOUNITOPERACAO'
      FieldName = 'PRECOUNITOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppField17: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppField18: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppField19: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object rptAnunciosCancCon: TppReport
    AutoStop = False
    DataPipeline = pplAnunciosCancCon
    OnStartPage = rptAnunciosCancConStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados - Consolidado por Investimento'
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
    Left = 254
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnunciosCancCon'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'lblNomeRelatorio'
        Caption = 'Anúncio de Proventos Cancelados - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 111845
        BandType = 0
      end
      object ppLabel5: TppLabel
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
      object ppDBImage2: TppDBImage
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
      object ppLabel12: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label2'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 108479
        mmTop = 23548
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 213784
        mmTop = 23283
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Recebido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 249767
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Valor Previsto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 232305
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label15'
        Caption = 'Carteira de Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 265
        mmTop = 23548
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor Cancelado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 267494
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label18'
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 146579
        mmTop = 23548
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 196850
        mmTop = 23548
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data Prevista'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 177800
        mmTop = 23548
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data EX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 164042
        mmTop = 23548
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Data Cancelamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 124354
        mmTop = 20373
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Plano/ Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 76200
        mmTop = 20638
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape4: TppShape
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
      object ppDBText14: TppDBText
        UserName = 'DBText2'
        DataField = 'BOLETA'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 108479
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText7'
        DataField = 'QTDPREVISTA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 212725
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDRECEBIDA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 248180
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText9'
        DataField = 'VALORPREVISTO'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 230717
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 265
        mmTop = 794
        mmWidth = 73819
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText13'
        DataField = 'QTDCANCELADA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 265907
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText15'
        DataField = 'CONTA'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 140229
        mmTop = 794
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 124884
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAEX'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 164307
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAPREVISTA'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText5'
        DataField = 'DATABASE'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 197115
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplAnunciosCancCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2910
        mmLeft = 76200
        mmTop = 794
        mmWidth = 30692
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6878
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 282576
        BandType = 8
      end
      object ppLabel26: TppLabel
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
        mmTop = 794
        mmWidth = 282576
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 254001
        mmTop = 794
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9261
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5291
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'dbtTotQtdPrev1'
        DataField = 'QTDPREVISTA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2921
        mmLeft = 211932
        mmTop = 3440
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'dbtTotQtdRest1'
        DataField = 'VALORPREVISTO'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2921
        mmLeft = 230717
        mmTop = 3440
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'dbtTotQtdRec1'
        DataField = 'QTDRECEBIDA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2921
        mmLeft = 247915
        mmTop = 3440
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'dbtTotQtdCan1'
        DataField = 'QTDCANCELADA'
        DataPipeline = pplAnunciosCancCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosCancCon'
        mmHeight = 2921
        mmLeft = 266171
        mmTop = 3440
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Total Geral:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 169863
        mmTop = 2910
        mmWidth = 15748
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplAnunciosCancCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnunciosCancCon'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape1'
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText6'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplAnunciosCancCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 794
          mmTop = 794
          mmWidth = 54504
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppShape8: TppShape
          UserName = 'Shape8'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'dbtTotQtdPrev2'
          DataField = 'QTDPREVISTA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2921
          mmLeft = 212725
          mmTop = 1323
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'dbtTotQtdRest2'
          DataField = 'VALORPREVISTO'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2921
          mmLeft = 230717
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'dbtTotQtdRec2'
          DataField = 'QTDRECEBIDA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2921
          mmLeft = 247915
          mmTop = 1323
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'dbtTotQtdCan2'
          DataField = 'QTDCANCELADA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2921
          mmLeft = 265907
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total do Investimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 159544
          mmTop = 1323
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplAnunciosCancCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnunciosCancCon'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = rdpGroupGrupoBeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape3'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 5292
          mmLeft = 265
          mmTop = 529
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
        object ppLabel27: TppLabel
          UserName = 'Label1'
          Caption = 'Tipo de Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 529
          mmTop = 1852
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppDBText25: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplAnunciosCancCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 23283
          mmTop = 1852
          mmWidth = 72761
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel31: TppLabel
          UserName = 'Label12'
          Caption = 'Total da Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 163777
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'dbtTotQtdPrev'
          DataField = 'QTDPREVISTA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 212725
          mmTop = 1058
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'dbtTotQtdRest'
          DataField = 'VALORPREVISTO'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 230717
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'dbtTotQtdRec'
          DataField = 'QTDRECEBIDA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 247915
          mmTop = 1058
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'dbtTotQtdCan'
          DataField = 'QTDCANCELADA'
          DataPipeline = pplAnunciosCancCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosCancCon'
          mmHeight = 2910
          mmLeft = 265907
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape4'
          mmHeight = 794
          mmLeft = 159544
          mmTop = 0
          mmWidth = 123296
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
