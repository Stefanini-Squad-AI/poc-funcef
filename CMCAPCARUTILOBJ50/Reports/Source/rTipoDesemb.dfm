inherited RptTipoDesemb: TRptTipoDesemb
  Left = 582
  Top = 199
  Width = 255
  Height = 218
  Caption = 'RptTipoDesemb'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório de Tipo de Desembolso'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = ' Lista Tipos de Desembolso  '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Analitico'
          'Sintético'
          'Ambos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 2
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
        Name = ' ListaTipos de Desembolso '
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
        Caption = 'Ativo'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Sim'
          'Não'
          'Ambos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 2
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
        Caption = '&Imprime Máscara do Desembolso'
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
        Name = '&Imprime Máscara do Desembolso'
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
        Caption = '&Imprime Máscara  das Contas a Débito e Crédito'
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
        Name = '&Imprime Máscara  das Contas a Débito e Crédito'
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
    Formheight = 220
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptTipoDesemb
    LabelEmpresa = ppLabel2
    LabelSistema = ppLabel3
  end
  object PpTipoDesemb: TppBDEPipeline
    DataSource = DsTipoDesemb
    CloseDataSource = True
    UserName = 'PpTipoDesemb'
    Left = 144
    Top = 64
  end
  object DsTipoDesemb: TwwDataSource
    DataSet = CdsTipoDesemb
    Left = 102
    Top = 63
  end
  object RptTipoDesemb: TppReport
    AutoStop = False
    DataPipeline = PpTipoDesemb
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
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
    Left = 195
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpTipoDesemb'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object LblTipoDesemb: TppLabel
        UserName = 'LblTipoDesemb'
        Caption = 'Listagem de Tipos de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 57150
        mmTop = 8731
        mmWidth = 69586
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16140
        mmWidth = 185000
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 76994
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptTipoDesembLabel1: TppLabel
        UserName = 'RptTipoDesembLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 24606
        mmWidth = 12171
        BandType = 0
      end
      object RptTipoDesembLabel2: TppLabel
        UserName = 'RptTipoDesembLabel2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 24606
        mmWidth = 9790
        BandType = 0
      end
      object RptTipoDesembLabel3: TppLabel
        UserName = 'RptTipoDesembLabel3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 24606
        mmWidth = 7408
        BandType = 0
      end
      object RptTipoDesembLabel4: TppLabel
        UserName = 'RptTipoDesembLabel4'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100013
        mmTop = 24871
        mmWidth = 9525
        BandType = 0
      end
      object RptTipoDesembLabel5: TppLabel
        UserName = 'RptTipoDesembLabel5'
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 24606
        mmWidth = 25135
        BandType = 0
      end
      object LblContaCredito: TppLabel
        UserName = 'LblContaCredito'
        Caption = 'Conta a Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 24606
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114036
        mmTop = 25135
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptTipoDesembDBText2: TppDBText
        UserName = 'RptTipoDesembDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 265
        mmWidth = 58208
        BandType = 4
      end
      object RptTipoDesembDBText3: TppDBText
        UserName = 'RptTipoDesembDBText3'
        DataField = 'ANASINT'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3704
        mmLeft = 84402
        mmTop = 265
        mmWidth = 11906
        BandType = 4
      end
      object RptTipoDesembDBText4: TppDBText
        UserName = 'RptTipoDesembDBText4'
        AutoSize = True
        DataField = 'PLANO'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
      object DbtPlaconta: TppDBText
        UserName = 'DbtPlaconta'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object DbtPlacontaCredito: TppDBText
        UserName = 'DbtPlacontaCredito'
        AutoSize = True
        DataField = 'PLACONTACREDITO'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object DbtCodTipRecDes: TppDBText
        UserName = 'DbtCodTipRecDes'
        AutoSize = True
        DataField = 'CODTIPRECDES'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ATIVO'
        DataPipeline = PpTipoDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpTipoDesemb'
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 185000
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
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
        mmWidth = 27781
        BandType = 8
      end
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
        mmLeft = 78052
        mmTop = 3175
        mmWidth = 28575
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
        mmLeft = 158221
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object SqlTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT  /*+ RULE */'
      '  CODTIPRECDES,'
      '  RECPAG,'
      '  IDPESSOA,'
      '  PLANO,'
      '  PLACONTACREDITO,'
      '  PLACONTA,'
      '  IDUSUARIOINCLUSAO,'
      '  DESCRICAO,'
      '  ANASINT,'
      '  TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO,'
      '  FLGOBRIGARESERVA,'
      '  FLGCALCULAIMPOSTO,'
      '  IDTIPOAVALIACAO,'
      '  FLGINDICARECDES,'
      '  HITCODHIST,'
      '  CODCORRESP,'
      '  CODSUBCONTA,'
      '  CODSUBCONTACRE,'
      '  DECODE( ATIVO, '#39#39', '#39'N'#39', ATIVO ) AS ATIVO'
      'FROM TIPORECEBDESEMB'
      'WHERE RECPAG = :PRECPAG AND'
      '      IDPESSOA = :PIDPESSOA AND'
      
        '      ( ( ANASINT = :PANASINT1 ) OR ( ANASINT = :PANASINT2) ) AN' +
        'D'
      '      ( ( ATIVO  = :ATIVO1 ) OR ( ATIVO  = :ATIVO2 ) )      '
      'ORDER BY CODTIPRECDES, ANASINT'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsTipoDesemb
    Left = 64
    Top = 128
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 128
  end
end
