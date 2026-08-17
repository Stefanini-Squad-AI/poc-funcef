inherited RptListaEntid: TRptListaEntid
  Left = 252
  Top = 189
  Width = 279
  Height = 263
  Caption = 'RptListaEntid'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaTipo'
        Controle = tcEdit
        TipodeDado = tdString
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
        Name = 'ListaTipo'
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
        Caption = 'SeqRelat'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'SeqRelat'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpListaEntid
    ConnectionType = cntBDE
  end
  object rpListaEntid: TppReport
    AutoStop = False
    DataPipeline = ppListaEntid
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 208
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object lblNossaEmpresa: TppLabel
        UserName = 'lblNossaEmpresa'
        Caption = 'Nossa Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 80169
        mmTop = 1323
        mmWidth = 37042
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 
          'Listagem das Entidades e Empresas de Treinamento com Seus Instut' +
          'ores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 24077
        mmTop = 9525
        mmWidth = 149225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome/Endereço/Instrutor(es)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 21167
        mmWidth = 48419
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Razão Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 21431
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 21431
        mmWidth = 14552
        BandType = 0
      end
    end
    object rpListaEntidBandaInstrutor: TppDetailBand
      BeforePrint = rpListaEntidBandaInstrutorBeforePrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'INSTRUTOR'
        DataPipeline = ppListaEntid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 31221
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpListaEntidSmryBnd: TppSummaryBand
      AfterPrint = rpListaEntidSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppListaEntid
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpListaEntidBandaEmpresa: TppGroupHeaderBand
        BeforePrint = rpListaEntidBandaEmpresaBeforePrint
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME'
          DataPipeline = ppListaEntid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 1798
          mmWidth = 84931
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = ppListaEntid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 91811
          mmTop = 1798
          mmWidth = 102923
          BandType = 3
          GroupNo = 0
        end
        object rpListaEntidEndereco: TppDBText
          UserName = 'rpListaEntidEndereco'
          DataField = 'ENDERECO'
          DataPipeline = ppListaEntid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 6350
          mmWidth = 161132
          BandType = 3
          GroupNo = 0
        end
        object rpListaEntidTelefone: TppDBText
          UserName = 'rpListaEntidTelefone'
          DataField = 'TELEFONE'
          DataPipeline = ppListaEntid
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 165894
          mmTop = 6350
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2910
          mmTop = 794
          mmWidth = 191770
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
  object ppListaEntid: TppBDEPipeline
    DataSource = dsListaEntid
    UserName = 'lExemplo2'
    Left = 209
    Top = 57
    object ppListaEntidppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppListaEntidppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppListaEntidppField3: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppListaEntidppField4: TppField
      FieldAlias = 'UPNOME'
      FieldName = 'UPNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppListaEntidppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppListaEntidppField6: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsListaEntid: TwwDataSource
    AutoEdit = False
    DataSet = CdsListaEntid
    Left = 209
    Top = 103
  end
  object CdsListaEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsListaEntidAfterOpen
    AfterScroll = CdsListaEntidAfterScroll
    Left = 209
    Top = 148
  end
  object sqlListaEntid: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT E.NOME, E.RAZAOSOCIAL, I.NOME AS INSTRUTOR, '
      '       UPPER(E.NOME) AS UPNOME,'
      '      '#39'12345678901234567890'#39' AS ENDERECO,'
      '      '#39'12345678901234567890'#39' AS TELEFONE'
      'FROM PESSOA E, PESSOA I, CURSO C'
      'WHERE E.IDPESSOA = C.IDENTIDINSTR'
      'AND   E.IDPESSOA = I.IDGRUPO(+)'
      'UNION'
      'SELECT DISTINCT E.NOME, E.RAZAOSOCIAL, I.NOME AS INSTRUTOR, '
      '       UPPER(E.NOME) AS UPNOME,'
      '      '#39'12345678901234567890'#39' AS ENDERECO,'
      '      '#39'12345678901234567890'#39' AS TELEFONE'
      'FROM PESSOA E, PESSOA I, HSTTRN H'
      'WHERE E.IDPESSOA = H.IDENTIDINSTR'
      'AND   E.IDPESSOA = I.IDGRUPO(+)'
      'ORDER BY 4'
      ' ')
    ClientDataSet = CdsListaEntid
    Left = 209
    Top = 192
  end
end
