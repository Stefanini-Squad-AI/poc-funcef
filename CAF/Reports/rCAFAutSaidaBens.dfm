inherited RptCAFAutSaidaBens: TRptCAFAutSaidaBens
  Left = 407
  Top = 205
  Width = 289
  Height = 156
  Caption = 'Autorização para Saída de Bens'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Autorização para Saída de Bens'
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
        Caption = 'Termo de Saída Temporária'
        Controle = tcMontaSelect
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
        MontaSelect = MSTermo
        Width = 0
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 147
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpAutSaiBens
    LabelEmpresa = ppLabel8
    LabelSistema = ppLabel12
  end
  object sqlAutSaiBens: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.PLACA, B.DESBEM, STB.IDBEM, B.PUBAUTOR, B.PUBEDITORA, B' +
        '.PUBANO,'
      '       ST.STPTERMO, ST.STPDATA,'
      '       TST.DESCTIPSAITEMP,'
      '       L.NOME AS DESCDESTINO,'
      '       L.ENDERECO,'
      '       P.NOME AS NOMERESPSAIDA,'
      '       ST.STPOBSERVACOES'
      'FROM SAIDATEMPORARIA ST,'
      '     SAIDATEMPBENS STB,'
      '     BEM B,'
      '     LOCALIZACAO L,'
      '     PESSOA P,'
      '     TIPOSAIDATEMP TST'
      'WHERE ST.STPDATA >= :DATAMOVINI'
      '  AND ST.STPDATA <= :DATAMOVFIM'
      '  AND ST.IDPESSOA = :IDPESSOA'
      ''
      '  AND ST.IDSAIDATEMPORARIA = STB.IDSAIDATEMPORARIA'
      '  AND ST.IDPESSOA = STB.IDPESSOA'
      '  AND STB.IDBEM = B.IDBEM'
      '  AND STB.IDPESSOA = B.IDPESSOA'
      '  AND ST.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND ST.IDPESSOA = L.IDPESSOA'
      '  AND ST.IDRESPONSAVEL = P.IDPESSOA'
      '  AND ST.IDTIPOSAIDATEMP = TST.IDTIPOSAIDATEMP'
      'ORDER BY ST.STPTERMO, B.PLACA'
      '')
    ClientDataSet = cdsAutSaiBens
    Left = 219
    Top = 61
  end
  object cdsAutSaiBens: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 219
    Top = 48
    Data = {
      8D0100009619E0BD02000000180000000D0000000000030000008D0105504C41
      434108000400000000000644455342454D010049000000010005574944544802
      000200C80005494442454D0800040000000000085055424155544F5201004900
      00000100055749445448020002003C000A505542454449544F52410100490000
      000100055749445448020002003C0006505542414E4F04000100000000000853
      54505445524D4F0800040000000000075354504441544110001100000000000E
      4445534354495053414954454D50010049000000010005574944544802000200
      3C000B4445534344455354494E4F010049000000010005574944544802000200
      3C0008454E44455245434F01004900000001000557494454480200020078000D
      4E4F4D455245535053414944410100490000000100055749445448020002003C
      000E5354504F425345525641434F455301004900000001000557494454480200
      0200780002000D44454641554C545F4F52444552040082000200000007000000
      01000000044C4349440400010000000000}
  end
  object dsAutSaiBens: TwwDataSource
    DataSet = cdsAutSaiBens
    Left = 219
    Top = 36
  end
  object ppAutSaiBens: TppBDEPipeline
    DataSource = dsAutSaiBens
    UserName = 'AutSaiBens'
    Left = 219
    Top = 23
    object ppAutSaiBensppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppAutSaiBensppField2: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object ppAutSaiBensppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppAutSaiBensppField4: TppField
      FieldAlias = 'PUBAUTOR'
      FieldName = 'PUBAUTOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppAutSaiBensppField5: TppField
      FieldAlias = 'PUBEDITORA'
      FieldName = 'PUBEDITORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppAutSaiBensppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUBANO'
      FieldName = 'PUBANO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppAutSaiBensppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'STPTERMO'
      FieldName = 'STPTERMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppAutSaiBensppField8: TppField
      FieldAlias = 'STPDATA'
      FieldName = 'STPDATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 7
    end
    object ppAutSaiBensppField9: TppField
      FieldAlias = 'DESCTIPSAITEMP'
      FieldName = 'DESCTIPSAITEMP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppAutSaiBensppField10: TppField
      FieldAlias = 'DESCDESTINO'
      FieldName = 'DESCDESTINO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppAutSaiBensppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 10
    end
    object ppAutSaiBensppField12: TppField
      FieldAlias = 'NOMERESPSAIDA'
      FieldName = 'NOMERESPSAIDA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppAutSaiBensppField13: TppField
      FieldAlias = 'STPOBSERVACOES'
      FieldName = 'STPOBSERVACOES'
      FieldLength = 120
      DisplayWidth = 120
      Position = 12
    end
  end
  object MSTermo: TMontaSelect
    Tag = 2
    Template.IdConsulta = 0
    Caption = 'Selecione o Termo'
    Colunas.Strings = (
      'SAIDATEMPORARIA.STPTERMO'
      'SAIDATEMPORARIA.STPDATA'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Termo de Saída'
      'Data da Saída'
      'Local'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SAIDATEMPORARIA'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'SAIDATEMPORARIA.IDSAIDATEMPORARIA'
      'SAIDATEMPORARIA.IDPESSOA')
    Filtro.Strings = (
      'SAIDATEMPORARIA.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'SAIDATEMPORARIA.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'SAIDATEMPORARIA.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 40
    Top = 64
  end
  object rpAutSaiBens: TppReport
    AutoStop = False
    DataPipeline = ppAutSaiBens
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 219
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Autorização para Saída de Material'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56092
        mmTop = 8731
        mmWidth = 85196
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'PLACA'
        DataPipeline = ppAutSaiBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpAutSaiMatLine10: TppLine
        UserName = 'rpAutSaiMatLine10'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 4
      end
      object rpAutSaiMatDesBem: TppMemo
        OnPrint = rpAutSaiMatDesBemPrint
        UserName = 'rpAutSaiMatDesBem'
        Caption = 'rpAutSaiMatDesBem'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 29104
        mmTop = 529
        mmWidth = 166423
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 72496
        BandType = 8
      end
      object rpAutSaiMatLine9: TppLine
        UserName = 'rpAutSaiMatLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 1323
        mmWidth = 50800
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpAutSaiMatGroup1: TppGroup
      BreakName = 'STPTERMO'
      DataPipeline = ppAutSaiBens
      NewPage = True
      ResetPageNo = True
      UserName = 'rpAutSaiMatGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpAutSaiMatGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpAutSaiMatLabel1: TppLabel
          UserName = 'rpAutSaiMatLabel1'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpAutSaiMatLabel2: TppLabel
          UserName = 'rpAutSaiMatLabel2'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 29104
          mmTop = 0
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
      end
      object rpAutSaiMatGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 71438
        mmPrintPosition = 0
        object rpAutSaiMatLine2: TppLine
          UserName = 'rpAutSaiMatLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel3: TppLabel
          UserName = 'rpAutSaiMatLabel3'
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 794
          mmWidth = 11113
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText1: TppDBText
          UserName = 'rpAutSaiMatDBText1'
          AutoSize = True
          DataField = 'DESCTIPSAITEMP'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4304
          mmLeft = 24077
          mmTop = 794
          mmWidth = 30762
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText2: TppDBText
          UserName = 'rpAutSaiMatDBText2'
          AutoSize = True
          DataField = 'STPTERMO'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4163
          mmLeft = 24077
          mmTop = 4763
          mmWidth = 19544
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel4: TppLabel
          UserName = 'rpAutSaiMatLabel4'
          Caption = 'Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 4763
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel5: TppLabel
          UserName = 'rpAutSaiMatLabel5'
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 8731
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText3: TppDBText
          UserName = 'rpAutSaiMatDBText3'
          AutoSize = True
          DataField = 'DESCDESTINO'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4163
          mmLeft = 24077
          mmTop = 8731
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText5: TppDBText
          UserName = 'rpAutSaiMatDBText5'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4163
          mmLeft = 24077
          mmTop = 12700
          mmWidth = 19897
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel7: TppLabel
          UserName = 'rpAutSaiMatLabel7'
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 12700
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel8: TppLabel
          UserName = 'rpAutSaiMatLabel8'
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 16669
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText6: TppDBText
          UserName = 'rpAutSaiMatDBText6'
          AutoSize = True
          DataField = 'STPOBSERVACOES'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4163
          mmLeft = 24077
          mmTop = 16669
          mmWidth = 33726
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel9: TppLabel
          UserName = 'rpAutSaiMatLabel9'
          Caption = 'Responsável pela Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 22225
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText7: TppDBText
          UserName = 'rpAutSaiMatDBText7'
          AutoSize = True
          DataField = 'NOMERESPSAIDA'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4304
          mmLeft = 42333
          mmTop = 22225
          mmWidth = 30762
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel6: TppLabel
          UserName = 'rpAutSaiMatLabel6'
          Caption = 'Saída em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160867
          mmTop = 4763
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText4: TppDBText
          UserName = 'rpAutSaiMatDBText4'
          AutoSize = True
          DataField = 'STPDATA'
          DataPipeline = ppAutSaiBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4163
          mmLeft = 178859
          mmTop = 4763
          mmWidth = 16228
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine3: TppLine
          UserName = 'rpAutSaiMatLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26458
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine6: TppLine
          UserName = 'rpAutSaiMatLine6'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 43656
          mmLeft = 102129
          mmTop = 26723
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine4: TppLine
          UserName = 'rpAutSaiMatLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 48419
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel10: TppLabel
          UserName = 'rpAutSaiMatLabel10'
          Caption = 'Autorizo a saída do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 11377
          mmTop = 28575
          mmWidth = 84138
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel12: TppLabel
          UserName = 'rpAutSaiMatLabel12'
          Caption = 'Chefe do Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 50271
          mmTop = 43921
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine8: TppLine
          UserName = 'rpAutSaiMatLine8'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 70379
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel13: TppLabel
          UserName = 'rpAutSaiMatLabel13'
          Caption = 'Recebi o(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 117740
          mmTop = 28575
          mmWidth = 67998
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel15: TppLabel
          UserName = 'rpAutSaiMatLabel15'
          Caption = 'Firma / Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 43921
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel16: TppLabel
          UserName = 'rpAutSaiMatLabel16'
          Caption = 'Solicito a saída do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 50536
          mmWidth = 82815
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel17: TppLabel
          UserName = 'rpAutSaiMatLabel17'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 61119
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel18: TppLabel
          UserName = 'rpAutSaiMatLabel18'
          Caption = 'Solicitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 57679
          mmTop = 65881
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel19: TppLabel
          UserName = 'rpAutSaiMatLabel19'
          Caption = 'Autorizo a liberação do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 105304
          mmTop = 50536
          mmWidth = 89694
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel21: TppLabel
          UserName = 'rpAutSaiMatLabel21'
          Caption = 'Assinatura / Carimbo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 65881
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine5: TppLine
          UserName = 'rpAutSaiMatLine5'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 70379
          mmLeft = 0
          mmTop = 529
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine7: TppLine
          UserName = 'rpAutSaiMatLine7'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 70644
          mmLeft = 197115
          mmTop = 265
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine1: TppLine
          UserName = 'rpAutSaiMatLine1'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 42863
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine11: TppLine
          UserName = 'rpAutSaiMatLine11'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 65088
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel11: TppLabel
          UserName = 'rpAutSaiMatLabel11'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 38894
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel14: TppLabel
          UserName = 'rpAutSaiMatLabel14'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 38894
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine12: TppLine
          UserName = 'rpAutSaiMatLine12'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 102923
          mmTop = 42863
          mmWidth = 93398
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel20: TppLabel
          UserName = 'rpAutSaiMatLabel20'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 61119
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine13: TppLine
          UserName = 'rpAutSaiMatLine13'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 102923
          mmTop = 65088
          mmWidth = 93398
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
