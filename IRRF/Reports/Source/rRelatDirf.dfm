inherited frmRptConfDirf: TfrmRptConfDirf
  Left = 376
  Top = 280
  Height = 182
  Caption = 'frmRptConfDirf'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferencia da DIRF'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano Base'
        Controle = tcSpinEdit
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
        SpinEditSettings.MaxValue = 3000
        SpinEditSettings.MinValue = 1990
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 2006
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
        Caption = 'Módulo Responsável'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Folha de Pagamento'
          'Folha de Benefícios'
          'Contas a Pagar'
          'Todos os módulos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 100
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
    Formheight = 210
    FormWidth = 330
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConfDIRF
    LabelEmpresa = ppLabel15
    LabelSistema = ppLabel26
    ConnectionType = cntBDE
  end
  object dsConfDIRF: TwwDataSource
    DataSet = cdsConfDirf
    Left = 52
    Top = 72
  end
  object pplConfDIRF: TppBDEPipeline
    DataSource = dsConfDIRF
    UserName = 'lConfDIRF'
    Left = 120
    Top = 56
    object pplConfDIRFppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object pplConfDIRFppField2: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplConfDIRFppField3: TppField
      FieldAlias = 'CGCBENEF'
      FieldName = 'CGCBENEF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object pplConfDIRFppField4: TppField
      FieldAlias = 'CGCEMPRE'
      FieldName = 'CGCEMPRE'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object pplConfDIRFppField5: TppField
      FieldAlias = 'NOMEEMPRE'
      FieldName = 'NOMEEMPRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplConfDIRFppField6: TppField
      FieldAlias = 'CODNATUREZA'
      FieldName = 'CODNATUREZA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object pplConfDIRFppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'JAN1'
      FieldName = 'JAN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplConfDIRFppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'JAN2'
      FieldName = 'JAN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConfDIRFppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'JAN3'
      FieldName = 'JAN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConfDIRFppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEV1'
      FieldName = 'FEV1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConfDIRFppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEV2'
      FieldName = 'FEV2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplConfDIRFppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEV3'
      FieldName = 'FEV3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConfDIRFppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAR1'
      FieldName = 'MAR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConfDIRFppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAR2'
      FieldName = 'MAR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplConfDIRFppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAR3'
      FieldName = 'MAR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplConfDIRFppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABR1'
      FieldName = 'ABR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplConfDIRFppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABR2'
      FieldName = 'ABR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplConfDIRFppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABR3'
      FieldName = 'ABR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplConfDIRFppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAI1'
      FieldName = 'MAI1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplConfDIRFppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAI2'
      FieldName = 'MAI2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplConfDIRFppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAI3'
      FieldName = 'MAI3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplConfDIRFppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUN1'
      FieldName = 'JUN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplConfDIRFppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUN2'
      FieldName = 'JUN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplConfDIRFppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUN3'
      FieldName = 'JUN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplConfDIRFppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUL1'
      FieldName = 'JUL1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplConfDIRFppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUL2'
      FieldName = 'JUL2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplConfDIRFppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUL3'
      FieldName = 'JUL3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplConfDIRFppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGO1'
      FieldName = 'AGO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplConfDIRFppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGO2'
      FieldName = 'AGO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplConfDIRFppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGO3'
      FieldName = 'AGO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplConfDIRFppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'SET1'
      FieldName = 'SET1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplConfDIRFppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'SET2'
      FieldName = 'SET2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplConfDIRFppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'SET3'
      FieldName = 'SET3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplConfDIRFppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUT1'
      FieldName = 'OUT1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplConfDIRFppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUT2'
      FieldName = 'OUT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplConfDIRFppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'OUT3'
      FieldName = 'OUT3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplConfDIRFppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOV1'
      FieldName = 'NOV1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplConfDIRFppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOV2'
      FieldName = 'NOV2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplConfDIRFppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOV3'
      FieldName = 'NOV3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplConfDIRFppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZ1'
      FieldName = 'DEZ1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplConfDIRFppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZ2'
      FieldName = 'DEZ2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplConfDIRFppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEZ3'
      FieldName = 'DEZ3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplConfDIRFppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR131'
      FieldName = 'VLR131'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplConfDIRFppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR132'
      FieldName = 'VLR132'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object pplConfDIRFppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR133'
      FieldName = 'VLR133'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplConfDIRFppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJAN1'
      FieldName = 'SUMJAN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplConfDIRFppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJAN2'
      FieldName = 'SUMJAN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplConfDIRFppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJAN3'
      FieldName = 'SUMJAN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object pplConfDIRFppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMFEV1'
      FieldName = 'SUMFEV1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplConfDIRFppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMFEV2'
      FieldName = 'SUMFEV2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object pplConfDIRFppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMFEV3'
      FieldName = 'SUMFEV3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object pplConfDIRFppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAR1'
      FieldName = 'SUMMAR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplConfDIRFppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAR2'
      FieldName = 'SUMMAR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplConfDIRFppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAR3'
      FieldName = 'SUMMAR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object pplConfDIRFppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMABR1'
      FieldName = 'SUMABR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object pplConfDIRFppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMABR2'
      FieldName = 'SUMABR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object pplConfDIRFppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMABR3'
      FieldName = 'SUMABR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplConfDIRFppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAI1'
      FieldName = 'SUMMAI1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object pplConfDIRFppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAI2'
      FieldName = 'SUMMAI2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplConfDIRFppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMMAI3'
      FieldName = 'SUMMAI3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplConfDIRFppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUN1'
      FieldName = 'SUMJUN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplConfDIRFppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUN2'
      FieldName = 'SUMJUN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object pplConfDIRFppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUN3'
      FieldName = 'SUMJUN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object pplConfDIRFppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUL1'
      FieldName = 'SUMJUL1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object pplConfDIRFppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUL2'
      FieldName = 'SUMJUL2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplConfDIRFppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMJUL3'
      FieldName = 'SUMJUL3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object pplConfDIRFppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMAGO1'
      FieldName = 'SUMAGO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplConfDIRFppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMAGO2'
      FieldName = 'SUMAGO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object pplConfDIRFppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMAGO3'
      FieldName = 'SUMAGO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object pplConfDIRFppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMSET1'
      FieldName = 'SUMSET1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object pplConfDIRFppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMSET2'
      FieldName = 'SUMSET2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object pplConfDIRFppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMSET3'
      FieldName = 'SUMSET3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object pplConfDIRFppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMOUT1'
      FieldName = 'SUMOUT1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object pplConfDIRFppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMOUT2'
      FieldName = 'SUMOUT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object pplConfDIRFppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMOUT3'
      FieldName = 'SUMOUT3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object pplConfDIRFppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMNOV1'
      FieldName = 'SUMNOV1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object pplConfDIRFppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMNOV2'
      FieldName = 'SUMNOV2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object pplConfDIRFppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMNOV3'
      FieldName = 'SUMNOV3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object pplConfDIRFppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMDEZ1'
      FieldName = 'SUMDEZ1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object pplConfDIRFppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMDEZ2'
      FieldName = 'SUMDEZ2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object pplConfDIRFppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMDEZ3'
      FieldName = 'SUMDEZ3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object pplConfDIRFppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVLR131'
      FieldName = 'SUMVLR131'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object pplConfDIRFppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVLR132'
      FieldName = 'SUMVLR132'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object pplConfDIRFppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVLR133'
      FieldName = 'SUMVLR133'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
  end
  object rpConfDIRF: TppReport
    AutoStop = False
    DataPipeline = pplConfDIRF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 209815
    PrinterSetup.mmPaperWidth = 296863
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
    Left = 214
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConfDIRF'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object rpRelatDirfLabel151: TppLabel
        UserName = 'rpRelatDirfLabel151'
        Caption = 'Conferência da DIRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 121179
        mmTop = 8731
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object rpRelatDirfLabel152: TppLabel
        UserName = 'rpRelatDirfLabel15'
        Caption = 'rpRelatDirfLabel152'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 3969
        mmTop = 9525
        mmWidth = 40217
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 83344
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'ppDBText4'
        DataField = 'JAN1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 19315
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText7: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'ppDBText7'
        DataField = 'JAN3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 19315
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText3: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText3'
        DataField = 'JAN2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 19315
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel6: TppLabel
        UserName = 'rpConfDIRFLabel6'
        Caption = 'Jan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 19579
        mmWidth = 3969
        BandType = 4
      end
      object rpConfDIRFLabel7: TppLabel
        UserName = 'rpConfDIRFLabel7'
        Caption = 'Fev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 24077
        mmWidth = 3969
        BandType = 4
      end
      object rpConfDIRFDBText6: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText6'
        DataField = 'FEV1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 23813
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText7: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText7'
        DataField = 'FEV3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 23813
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText8: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText8'
        DataField = 'FEV2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 23813
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel8: TppLabel
        UserName = 'rpConfDIRFLabel8'
        Caption = 'Mar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 28575
        mmWidth = 4233
        BandType = 4
      end
      object rpConfDIRFDBText9: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText9'
        DataField = 'MAR1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 28310
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText10: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText10'
        DataField = 'MAR3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 28310
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText11: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText11'
        DataField = 'MAR2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 28310
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel9: TppLabel
        UserName = 'rpConfDIRFLabel9'
        Caption = 'Abr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 33073
        mmWidth = 3704
        BandType = 4
      end
      object rpConfDIRFDBText12: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText12'
        DataField = 'ABR1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 32808
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText13: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText13'
        DataField = 'ABR3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 32808
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText14: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText14'
        DataField = 'ABR2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 32808
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel10: TppLabel
        UserName = 'rpConfDIRFLabel10'
        Caption = 'Mai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 37571
        mmWidth = 3704
        BandType = 4
      end
      object rpConfDIRFDBText15: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText15'
        DataField = 'MAI1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 37306
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText16: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText16'
        DataField = 'MAI3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 37306
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText17: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText17'
        DataField = 'MAI2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 37306
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel11: TppLabel
        UserName = 'rpConfDIRFLabel11'
        Caption = 'Jun'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 42069
        mmWidth = 3969
        BandType = 4
      end
      object rpConfDIRFDBText18: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText18'
        DataField = 'JUN1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 41804
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText19: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText19'
        DataField = 'JUN3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 41804
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText20: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText20'
        DataField = 'JUN2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 41804
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel12: TppLabel
        UserName = 'rpConfDIRFLabel12'
        Caption = 'Jul'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 46567
        mmWidth = 3175
        BandType = 4
      end
      object rpConfDIRFDBText21: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText21'
        DataField = 'JUL1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 46302
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText22: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText22'
        DataField = 'JUL3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 46302
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText23: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText23'
        DataField = 'JUL2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 46302
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel13: TppLabel
        UserName = 'rpConfDIRFLabel13'
        Caption = 'Ago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 51065
        mmWidth = 4233
        BandType = 4
      end
      object rpConfDIRFDBText24: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText24'
        DataField = 'AGO1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 50800
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText25: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText25'
        DataField = 'AGO3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 50800
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText26: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText26'
        DataField = 'AGO2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 50800
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel14: TppLabel
        UserName = 'rpConfDIRFLabel14'
        Caption = 'Set'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 55563
        mmWidth = 3704
        BandType = 4
      end
      object rpConfDIRFDBText27: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText27'
        DataField = 'SET1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 55298
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText28: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText28'
        DataField = 'SET3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 55298
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText29: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText29'
        DataField = 'SET2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 55298
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel15: TppLabel
        UserName = 'rpConfDIRFLabel15'
        Caption = 'Out'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 60061
        mmWidth = 3969
        BandType = 4
      end
      object rpConfDIRFDBText30: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText30'
        DataField = 'OUT1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 59796
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText31: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText31'
        DataField = 'OUT3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 59796
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText32: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText32'
        DataField = 'OUT2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 59796
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel16: TppLabel
        UserName = 'rpConfDIRFLabel16'
        Caption = 'Nov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 64558
        mmWidth = 4233
        BandType = 4
      end
      object rpConfDIRFDBText33: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText33'
        DataField = 'NOV1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 64294
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText34: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText34'
        DataField = 'NOV3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 64294
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText35: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText35'
        DataField = 'NOV2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 64294
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLabel17: TppLabel
        UserName = 'rpConfDIRFLabel17'
        Caption = 'Dez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 70115
        mmWidth = 4233
        BandType = 4
      end
      object rpConfDIRFDBText36: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText36'
        DataField = 'DEZ1'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 56092
        mmTop = 69850
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText37: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText37'
        DataField = 'DEZ3'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 69850
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFDBText38: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'rpConfDIRFDBText38'
        DataField = 'DEZ2'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 69850
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLine2: TppLine
        UserName = 'rpConfDIRFLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 74348
        mmWidth = 284163
        BandType = 4
      end
      object rpConfDIRFLine6: TppLine
        UserName = 'rpConfDIRFLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284163
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 12965
        mmWidth = 5556
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Rendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12965
        mmWidth = 17463
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Deduções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102394
        mmTop = 12965
        mmWidth = 13229
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Imposto Retido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 12965
        mmWidth = 22754
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 75406
        mmWidth = 5292
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 79111
        mmWidth = 284163
        BandType = 4
      end
      object ppVariable1: TppVariable
        OnPrint = ppDBText4Print
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 56092
        mmTop = 74877
        mmWidth = 14817
        BandType = 4
      end
      object ppVariable2: TppVariable
        OnPrint = ppDBText4Print
        UserName = 'Variable2'
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 75142
        mmWidth = 15610
        BandType = 4
      end
      object ppVariable3: TppVariable
        OnPrint = ppDBText4Print
        UserName = 'Variable3'
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 157427
        mmTop = 75142
        mmWidth = 15875
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 82286
        mmWidth = 284163
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = '13º'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3440
        mmTop = 79904
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText2: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'DBText2'
        DataField = 'VLR131'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 56092
        mmTop = 79640
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText3: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'DBText3'
        DataField = 'VLR132'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 79640
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText5: TppDBText
        OnPrint = ppDBText4Print
        UserName = 'DBText5'
        DataField = 'VLR133'
        DataPipeline = pplConfDIRF
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 79640
        mmWidth = 14817
        BandType = 4
      end
      object rpConfDIRFLine1: TppLine
        UserName = 'rpConfDIRFLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object rpConfDIRFLabel2: TppLabel
        UserName = 'rpConfDIRFLabel2'
        Caption = 'Natureza do Rendimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 1323
        mmWidth = 33602
        BandType = 4
      end
      object rpConfDIRFDBText1: TppDBText
        UserName = 'rpConfDIRFDBText1'
        DataField = 'CODNATUREZA'
        DataPipeline = pplConfDIRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 5292
        mmWidth = 9790
        BandType = 4
      end
      object rpConfDIRFDBText2: TppDBText
        UserName = 'rpConfDIRFDBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = pplConfDIRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 5556
        mmWidth = 16933
        BandType = 4
      end
      object rpConfDIRFLine5: TppLine
        UserName = 'rpConfDIRFLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9525
        mmWidth = 284163
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 1323
        mmWidth = 5556
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83873
        mmTop = 1323
        mmWidth = 7938
        BandType = 4
      end
      object rpConfDIRFDBText4: TppDBText
        UserName = 'rpConfDIRFDBText4'
        DataField = 'CGCBENEF'
        DataPipeline = pplConfDIRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 51065
        mmTop = 5556
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NOMEBENEF'
        DataPipeline = pplConfDIRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfDIRF'
        mmHeight = 3175
        mmLeft = 83873
        mmTop = 5556
        mmWidth = 65088
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
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
        mmWidth = 278871
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284163
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
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 279136
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
        mmLeft = 252942
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpConfDIRFGroup1: TppGroup
      BreakName = 'ANOBASE'
      DataPipeline = pplConfDIRF
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpConfDIRFGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConfDIRF'
      object rpConfDIRFGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpConfDIRFGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpConfDIRFGroup2: TppGroup
      BreakName = 'CODNATUREZA'
      DataPipeline = pplConfDIRF
      OutlineSettings.CreateNode = True
      UserName = 'rpConfDIRFGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConfDIRF'
      object rpConfDIRFGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpConfDIRFGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650CBD01000070726F636564757265205661
        726961626C65314F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A202056616C7565203A3D206C436F6E66444952
        465B274A414E31275D202B0D0A20202020202020202020206C436F6E66444952
        465B2746455631275D202B0D0A20202020202020202020206C436F6E66444952
        465B274D415231275D202B0D0A20202020202020202020206C436F6E66444952
        465B2741425231275D202B0D0A20202020202020202020206C436F6E66444952
        465B274D414931275D202B0D0A20202020202020202020206C436F6E66444952
        465B274A554E31275D202B0D0A20202020202020202020206C436F6E66444952
        465B274A554C31275D202B0D0A20202020202020202020206C436F6E66444952
        465B2741474F31275D202B0D0A20202020202020202020206C436F6E66444952
        465B2753455431275D202B0D0A20202020202020202020206C436F6E66444952
        465B274F555431275D202B0D0A20202020202020202020206C436F6E66444952
        465B274E4F5631275D202B0D0A20202020202020202020206C436F6E66444952
        465B2744455A31275D0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        095661726961626C6531094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060F5661726961626C65324F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650CBF01000070726F6365
        64757265205661726961626C65324F6E43616C63287661722056616C75653A20
        56617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D206C
        436F6E66444952465B274A414E33275D202B0D0A20202020202020202020206C
        436F6E66444952465B2746455633275D202B0D0A20202020202020202020206C
        436F6E66444952465B274D415233275D202B0D0A20202020202020202020206C
        436F6E66444952465B2741425233275D202B0D0A20202020202020202020206C
        436F6E66444952465B274D414933275D202B0D0A20202020202020202020206C
        436F6E66444952465B274A554E33275D202B0D0A20202020202020202020206C
        436F6E66444952465B274A554C33275D202B0D0A20202020202020202020206C
        436F6E66444952465B2741474F33275D202B0D0A20202020202020202020206C
        436F6E66444952465B2753455433275D202B0D0A20202020202020202020206C
        436F6E66444952465B274F555433275D202B0D0A20202020202020202020206C
        436F6E66444952465B274E4F5633275D202B0D0A20202020202020202020206C
        436F6E66444952465B2744455A33275D0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506095661726961626C6532094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060F5661726961626C65334F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        A701000070726F636564757265205661726961626C65334F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A56616C
        7565203A3D206C436F6E66444952465B274A414E32275D202B0D0A2020202020
        202020206C436F6E66444952465B2746455632275D202B0D0A20202020202020
        20206C436F6E66444952465B274D415232275D202B0D0A202020202020202020
        6C436F6E66444952465B2741425232275D202B0D0A2020202020202020206C43
        6F6E66444952465B274D414932275D202B0D0A2020202020202020206C436F6E
        66444952465B274A554E32275D202B0D0A2020202020202020206C436F6E6644
        4952465B274A554C32275D202B0D0A2020202020202020206C436F6E66444952
        465B2741474F32275D202B0D0A2020202020202020206C436F6E66444952465B
        2753455432275D202B0D0A2020202020202020206C436F6E66444952465B274F
        555432275D202B0D0A2020202020202020206C436F6E66444952465B274E4F56
        32275D202B0D0A2020202020202020206C436F6E66444952465B2744455A3227
        5D0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961
        626C6533094576656E744E616D6506064F6E43616C63074576656E7449440221
        0000}
    end
  end
  object sqlConfDirf: TCMSqlParams
    ClientDataSet = cdsConfDirf
    Left = 152
    Top = 104
  end
  object cdsConfDirf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 104
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 8
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMDOCUMENTO '
      '  FROM PESSOA '
      ' WHERE IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsAux
    Left = 192
    Top = 8
  end
end
