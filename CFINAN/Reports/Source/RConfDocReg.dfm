inherited RptConfDocReg: TRptConfDocReg
  Left = 366
  Top = 283
  Width = 494
  Height = 191
  Caption = 'RptConfDocReg'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferência de Documentos Regularizados'
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
        Caption = 'Conta Bancária'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT *'
          'FROM PortadorConta'
          'WHERE (IDPESSOA = 1)'
          'ORDER BY Descricao')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
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
    Formheight = 150
    FormWidth = 450
    Left = 304
  end
  inherited DevRptCM: TExtraOptions
    Left = 128
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConfDocReg
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 216
  end
  object rpConfDocReg: TppReport
    AutoStop = False
    DataPipeline = ppConfDocReg
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 288
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConfDocReg'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conferência de Documentos Regularizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23283
        mmTop = 7938
        mmWidth = 157692
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 23283
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object dbLogo: TppDBImage
        UserName = 'DbLogo1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppLDadosEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLDadosEmpresa'
        mmHeight = 15346
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 17992
        BandType = 0
      end
      object lblAdicionais: TppLabel
        UserName = 'Label4'
        Caption = 'Filtro utilizado na tela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 12435
        mmWidth = 172244
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'DATALANCFINAN'
        DataPipeline = ppConfDocReg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppConfDocReg'
        mmHeight = 3175
        mmLeft = 49213
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CODLANCFINANC'
        DataPipeline = ppConfDocReg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppConfDocReg'
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR'
        DataPipeline = ppConfDocReg
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConfDocReg'
        mmHeight = 3175
        mmLeft = 174625
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCDOC'
        DataPipeline = ppConfDocReg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppConfDocReg'
        mmHeight = 3175
        mmLeft = 14288
        mmTop = 0
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText7'
        ShiftWithParent = True
        DataField = 'PLANO'
        DataPipeline = ppConfDocReg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConfDocReg'
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 0
        mmWidth = 80169
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object pplblSistema: TppLabel
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 197115
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DATACONCILIACAO'
      DataPipeline = ppConfDocReg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConfDocReg'
      object grpbIDRelaciona: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 11974326
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object dbtGrupo: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DATACONCILIACAO'
          DataPipeline = ppConfDocReg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppConfDocReg'
          mmHeight = 4233
          mmLeft = 37835
          mmTop = 0
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label1'
          Caption = 'Data da Conciliação: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 0
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDRELACIONANI'
      DataPipeline = ppConfDocReg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConfDocReg'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText5'
          ShiftWithParent = True
          DataField = 'DESCRICAO'
          DataPipeline = ppConfDocReg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppConfDocReg'
          mmHeight = 3175
          mmLeft = 33338
          mmTop = 6085
          mmWidth = 152136
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Portador Forma: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 6615
          mmTop = 6085
          mmWidth = 25665
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'FLGNI'
      DataPipeline = ppConfDocReg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConfDocReg'
      object grpbFlgNI: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 14671839
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 13758
          mmTop = 10054
          mmWidth = 184150
          BandType = 3
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Histórico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 6615
          mmTop = 0
          mmWidth = 25665
          BandType = 3
          GroupNo = 2
        end
        object ppDBText4: TppDBText
          UserName = 'DBText6'
          ShiftWithParent = True
          DataField = 'HISTORICO'
          DataPipeline = ppConfDocReg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppConfDocReg'
          mmHeight = 3175
          mmLeft = 33338
          mmTop = 0
          mmWidth = 152136
          BandType = 3
          GroupNo = 2
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 13758
          mmTop = 12965
          mmWidth = 183092
          BandType = 3
          GroupNo = 2
        end
        object ppLabel67: TppLabel
          UserName = 'Label2'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 47890
          mmTop = 10054
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 70908
          mmTop = 10054
          mmWidth = 18521
          BandType = 3
          GroupNo = 2
        end
        object ppLabel69: TppLabel
          UserName = 'Label69'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 91546
          mmTop = 10054
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppLabel70: TppLabel
          UserName = 'Label70'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 189177
          mmTop = 10054
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label3'
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 13494
          mmTop = 10054
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'VALORLANCFINAN'
          DataPipeline = ppConfDocReg
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConfDocReg'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 1588
          mmWidth = 31750
          BandType = 5
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'DBText3'
          DataField = 'DESCLANCTO'
          DataPipeline = ppConfDocReg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConfDocReg'
          mmHeight = 3440
          mmLeft = 86254
          mmTop = 1588
          mmWidth = 78846
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'CODLANCFINANC'
      DataPipeline = ppConfDocReg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConfDocReg'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppConfDocReg: TppBDEPipeline
    DataSource = dsConfDocReg
    UserName = 'lExemplo1'
    Left = 304
    Top = 72
    object ppConfDocRegppField1: TppField
      FieldAlias = 'DESCDOC'
      FieldName = 'DESCDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField2: TppField
      FieldAlias = 'DESCLANCTO'
      FieldName = 'DESCLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField3: TppField
      FieldAlias = 'PORTFORMAHISTPLANO'
      FieldName = 'PORTFORMAHISTPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField4: TppField
      FieldAlias = 'DATACONCILIACAO'
      FieldName = 'DATACONCILIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField5: TppField
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField7: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField8: TppField
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField9: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField10: TppField
      FieldAlias = 'IDRELACIONANI'
      FieldName = 'IDRELACIONANI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField11: TppField
      FieldAlias = 'FLGMARCADO'
      FieldName = 'FLGMARCADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField12: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField13: TppField
      FieldAlias = 'FLGNI'
      FieldName = 'FLGNI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppConfDocRegppField14: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object dsConfDocReg: TwwDataSource
    DataSet = cdsConfDocReg
    Left = 216
    Top = 72
  end
  object cdsConfDocReg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 72
  end
  object spConfDocReg: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(U.VALORRMHOJE) AS VALORRMHOJE,'
      '   SUM(U.VALORPMHOJE) AS VALORPMHOJE,'
      '   SUM(U.VALORPHOJE) AS VALORPHOJE,'
      '   SUM(U.VALORRHOJE) AS VALORRHOJE,'
      '   SUM(U.VALORPNHOJE) AS VALORPNHOJE,'
      '   SUM(U.VALORRNHOJE) AS VALORRNHOJE'
      'FROM'
      '-- 1'
      '   (SELECT'
      
        '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRMHOJE' +
        ','
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 2'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPMHOJE' +
        ','
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 3'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 4'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 5'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPNHOJE' +
        ','
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 6'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)) U'
      ' ')
    ClientDataSet = cdsConfDocReg
    Left = 48
    Top = 32
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   DECODE (REL.FLGNI, '#39'I'#39', '#39'Lancto. não identificado'#39', '#39'Lancto. ' +
        'conciliado '#39') AS DESCDOC,   '
      
        '   DECODE (REL.FLGNI, '#39'I'#39', '#39'Total do Lançamento não identificado' +
        ' '#39', '#39'Total do lançamento conciliado '#39') AS DESCLANCTO, '
      
        '   (P.DESCRICAO || '#39' #13 '#39' || M.HISTORICO || '#39' #13 '#39' ||  PLANO) ' +
        'AS PORTFORMAHISTPLANO,     '
      '   M.DATACONCILIACAO, '
      '   REL.CODLANCFINANC, '
      '   P.DESCRICAO, '
      '   M.HISTORICO, '
      '   M.VALORLANCFINAN, '
      '   M.DATALANCFINAN, '
      '   REL.IDRELACIONANI, '
      '   REL.FLGMARCADO, '
      '   RF.VALOR, '
      '   REL.FLGNI, '
      '   PC.NOME AS PLANO '
      'FROM '
      '   (SELECT '
      '       R.CODLANCFINANC, '
      '       R.IDRELACIONANI, '
      '       R.FLGMARCADO, '
      '       R.FLGNI '
      '    FROM '
      '       RelacionaNI R '
      '    WHERE '
      '       Exists(SELECT '
      '                 M1.CODLANCFINANC '
      '              FROM '
      '                 RelacionaNI R1, '
      '                 MovimFinanc M1 '
      '              WHERE '
      '                 (R1.CODLANCFINANC=M1.CODLANCFINANC) AND '
      '                 (R1.IDRELACIONANI=R.IDRELACIONANI) AND '
      '                 (M1.IDPESSOA = 1) AND '
      '                 (R1.FLGNI='#39'I'#39') '
      
        '                 AND (M1.DATALANCFINAN >= TO_DATE('#39'06/07/2007'#39','#39 +
        'dd/mm/yyyy'#39')) '
      
        '                 AND (M1.DATALANCFINAN <= TO_DATE( '#39'06/08/2007'#39',' +
        #39'dd/mm/yyyy'#39')))) REL, '
      '   MovimFinanc M, '
      '   PortadorConta P, '
      '   RateioFinanc RF, '
      '   PlanPrevContabil PC '
      'WHERE '
      '   (REL.CODLANCFINANC=M.CODLANCFINANC) AND '
      '   (M.CODPORTADOR=P.CODPORTADOR) AND '
      '   (M.CODLANCFINANC=RF.CODLANCFINANC) AND '
      '   (RF.IDPLANOPREV=PC.IDPLANOPREV(+)) AND '
      '   (M.IDPESSOA = 1) '
      'ORDER BY '
      '   DATACONCILIACAO, REL.IDRELACIONANI,REL.FLGNI, P.DESCRICAO ')
    ClientDataSet = cdsConfDocReg
    Left = 144
    Top = 120
  end
  object SqlDadosEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  I.IMAGEM, P.RAZAOSOCIAL'
      'FROM'
      '  PESSOA P, IMAGENS I'
      'WHERE'
      '  (P.IDPESSOA = :IDPESSOA) AND'
      '  (I.IDIMAGEM = P.IDIMAGEM)')
    ClientDataSet = CdsDadosEmpresa
    Left = 408
    Top = 16
  end
  object ppLDadosEmpresa: TppDBPipeline
    DataSource = dsDadosEmpresa
    UserName = 'LDadosEmpresa'
    Left = 408
    Top = 48
  end
  object dsDadosEmpresa: TwwDataSource
    DataSet = CdsDadosEmpresa
    Left = 408
    Top = 80
  end
  object CdsDadosEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 120
  end
end
