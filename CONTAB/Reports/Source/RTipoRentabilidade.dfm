inherited RptTipoRentabilidade: TRptTipoRentabilidade
  Left = 336
  Top = 221
  Width = 399
  Height = 323
  Caption = 'Tipo de Rentabilidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Tipo de Rentabilidade'
    Params = <
      item
        Caption = 'Tipo de Rentabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDSPCCONSISTE, DESCRICAO'
          'FROM SPCCONSISTE'
          'WHERE TIPOCONSISTE = '#39'TR'#39)
        LookupSettings.Chave = 'IDSPCCONSISTE'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Tipo de Rentabilidade'
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
        Name = 'iTipoRent'
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
        Caption = 'Data da Composição'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT I.DTSPCCONSISTE'
          '  FROM ITEMSPCCONSISTE I,'
          '       SPCCONSISTE S'
          ' WHERE I.IDSPCCONSISTE =  S.IDSPCCONSISTE '
          ' ORDER BY I.DTSPCCONSISTE')
        LookupSettings.Chave = 'DTSPCCONSISTE'
        LookupSettings.Display = 'DTSPCCONSISTE'
        LookupSettings.Descricao = 'Data de Composição'
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
        Name = 'dDataComp'
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
    Formheight = 125
    FormWidth = 400
    Left = 156
  end
  inherited CrmRptCM: TCmRptManager
    Report = rptTipoRent
    Left = 99
  end
  object pplTipoRent: TppBDEPipeline
    DataSource = dsTipoRent
    UserName = 'lTipoRent'
    Left = 172
    Top = 111
    object pplTipoRentppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSPCCONSISTE'
      FieldName = 'IDSPCCONSISTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplTipoRentppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 157
      DisplayWidth = 157
      Position = 1
    end
    object pplTipoRentppField3: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object pplTipoRentppField4: TppField
      FieldAlias = 'PASSIVO'
      FieldName = 'PASSIVO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object pplTipoRentppField5: TppField
      FieldAlias = 'RECEITA'
      FieldName = 'RECEITA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplTipoRentppField6: TppField
      FieldAlias = 'DESPESA'
      FieldName = 'DESPESA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object pplTipoRentppField7: TppField
      FieldAlias = 'DTSPCCONSISTE'
      FieldName = 'DTSPCCONSISTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
  end
  object cdsTipoRent: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 66
    Top = 111
    Data = {
      7B0100009619E0BD0100000018000000070000000000030000007B010D494453
      5043434F4E534953544508000400000000000944455343524943414F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002009D0005415449564F010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000F00075041535349
      564F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000F00075245434549544101004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0F00074445535045534101004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002000F000D4454535043434F4E53
      4953544501004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000F000100044C4349440400010009080000}
  end
  object sqlTipoRent: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  0 AS IDSPCCONSISTE,'
      
        '  '#39'                                                             ' +
        '                                                                ' +
        '                                '#39' AS DESCRICAO,'
      '  '#39'               '#39' AS ATIVO,'
      '  '#39'               '#39' AS PASSIVO,'
      '  '#39'               '#39' AS RECEITA,'
      '  '#39'               '#39' AS DESPESA,'
      '  '#39'               '#39' AS DTSPCCONSISTE'
      'FROM DUAL'
      'WHERE 1 = 2'
      ' '
      ' '
      ' ')
    ClientDataSet = cdsTipoRent
    Left = 20
    Top = 111
  end
  object dsTipoRent: TwwDataSource
    DataSet = cdsTipoRent
    Left = 112
    Top = 111
  end
  object sqlSpcConsiste: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDSPCCONSISTE, '
      '  DESCRICAO'
      ''
      'FROM '
      '  SPCCONSISTE'
      ''
      'WHERE TIPOCONSISTE       = '#39'TR'#39
      '  AND ((:PIDSPCCONSISTE IS NULL) OR'
      '       (:PIDSPCCONSISTE  = IDSPCCONSISTE))'
      ''
      'ORDER BY'
      '  IDSPCCONSISTE, '
      '  DESCRICAO'
      ' '
      ' ')
    ClientDataSet = cdsSpcConsiste
    Left = 22
    Top = 167
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'                                                             ' +
        '                                                                ' +
        '                 '#39' AS DESCRICAO,'
      '  '#39'               '#39' AS ATIVO,'
      '  '#39'               '#39' AS PASSIVO,'
      '  '#39'               '#39' AS RECEITA,'
      '  '#39'               '#39' AS DESPESA'
      ''
      'FROM DUAL'
      'WHERE 1 = 2')
    ClientDataSet = cdsAux
    Left = 152
    Top = 167
  end
  object cdsSpcConsiste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 167
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 167
  end
  object rptTipoRent: TppReport
    AutoStop = False
    DataPipeline = pplTipoRent
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    BeforePrint = rptTipoRentBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 218
    Top = 111
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplTipoRent'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 14288
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = ppLabel16Print
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Label26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 2117
        mmWidth = 168011
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppBDEPipeline1
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 14288
        mmLeft = 2117
        mmTop = 1323
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Tipo de Rentabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 7938
        mmWidth = 168011
        BandType = 0
      end
    end
    object ppDetailBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESPESA'
        DataPipeline = pplTipoRent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTipoRent'
        mmHeight = 3175
        mmLeft = 134409
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RECEITA'
        DataPipeline = pplTipoRent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTipoRent'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PASSIVO'
        DataPipeline = pplTipoRent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTipoRent'
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ATIVO'
        DataPipeline = pplTipoRent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTipoRent'
        mmHeight = 3175
        mmLeft = 8996
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 6350
        mmWidth = 98690
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 2911
        mmTop = 4826
        mmWidth = 191559
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3703
        mmLeft = 102362
        mmTop = 6350
        mmWidth = 4233
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = pplTipoRent
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTipoRent'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Tipo de Rentabilidade :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 2117
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DESCRICAO'
          DataPipeline = pplTipoRent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTipoRent'
          mmHeight = 3969
          mmLeft = 38894
          mmTop = 2117
          mmWidth = 153988
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DTSPCCONSISTE'
      DataPipeline = pplTipoRent
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTipoRent'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DTSPCCONSISTE'
          DataPipeline = pplTipoRent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTipoRent'
          mmHeight = 3969
          mmLeft = 39158
          mmTop = 0
          mmWidth = 153988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Data da Composição :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 0
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = pplTipoRent
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTipoRent'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Conta Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Conta Passivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 50800
          mmTop = 794
          mmWidth = 22490
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Conta Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 91811
          mmTop = 794
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Conta Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 134409
          mmTop = 794
          mmWidth = 24342
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
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'BDEPipeline1'
    Left = 229
    Top = 62
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object cdsFundacao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 60
    Data = {
      590000009619E0BD010000001800000001000100000003000000570006494D41
      47454D04004B0000000200075355425459504502004900070042696E61727900
      0557494454480200020001000100044C43494404000100090800000001}
  end
  object sqlFundacao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  I.IMAGEM'
      ''
      'FROM'
      '  PESSOA P,'
      '  ENDPESS E,'
      '  IMAGENS I,'
      '  CIDADES C'
      ''
      'WHERE (P.IDPESSOA    = 1)'
      '  AND (E.IDPESSOA(+) = P.IDPESSOA)'
      '  AND (E.IDCIDADES   = C.IDCIDADES(+))'
      '  AND (I.IDIMAGEM(+) = P.IDIMAGEM)'
      ' ')
    ClientDataSet = cdsFundacao
    Left = 28
    Top = 59
  end
  object dsFundacao: TwwDataSource
    DataSet = cdsFundacao
    Left = 160
    Top = 61
  end
end
