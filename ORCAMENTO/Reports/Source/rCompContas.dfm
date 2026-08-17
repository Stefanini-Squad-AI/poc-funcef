inherited rptCompContas: TrptCompContas
  Left = 382
  Top = 272
  Width = 309
  Height = 185
  Caption = 'rptCompContas'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Composição das Contas Orçamentárias'
    Params = <
      item
        Caption = 'Grupo Orçamentário'
        Controle = tcMontaSelect
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
        MontaSelect = MontaSelect
        Width = 0
      end>
    Formheight = 150
    FormWidth = 350
    Left = 156
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpCompContas
    LabelEmpresa = ppLabel203
    LabelSistema = ppLabel204
  end
  object cdsCompContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 40
    Top = 48
  end
  object dsCompContas: TwwDataSource
    DataSet = cdsCompContas
    Left = 77
    Top = 47
  end
  object pplCompContas: TppBDEPipeline
    DataSource = dsCompContas
    UserName = 'lCompContas'
    Left = 117
    Top = 47
    object pplCompContasppField1: TppField
      FieldAlias = 'IDGRUPOORCAMEN'
      FieldName = 'IDGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField2: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField3: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField4: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField5: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField6: TppField
      FieldAlias = 'TIPOCALC'
      FieldName = 'TIPOCALC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField7: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField8: TppField
      FieldAlias = 'CENTRORESP'
      FieldName = 'CENTRORESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField9: TppField
      FieldAlias = 'CENTROCUST'
      FieldName = 'CENTROCUST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField10: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField11: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField12: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplCompContasppField13: TppField
      FieldAlias = 'DETALHE'
      FieldName = 'DETALHE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object rpCompContas: TppReport
    AutoStop = False
    DataPipeline = pplCompContas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 163
    Top = 47
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCompContas'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel202: TppLabel
        UserName = 'ppLabel202'
        Caption = 'Composição das Contas Orçamentárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 5027
        mmLeft = 30692
        mmTop = 7408
        mmWidth = 80433
        BandType = 0
      end
      object ppLabel203: TppLabel
        UserName = 'ppLabel203'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 30692
        mmTop = 1323
        mmWidth = 28046
        BandType = 0
      end
      object lbAdicionais: TppLabel
        UserName = 'lbAdicionais'
        Caption = 'lbAdicionais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4498
        mmLeft = 30692
        mmTop = 12965
        mmWidth = 20638
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplImagem
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplImagem'
        mmHeight = 16933
        mmLeft = 5027
        mmTop = 1323
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand23: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DETALHE'
        DataPipeline = pplCompContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'pplCompContas'
        mmHeight = 3175
        mmLeft = 118798
        mmTop = 0
        mmWidth = 148961
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TIPOCALC'
        DataPipeline = pplCompContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompContas'
        mmHeight = 3175
        mmLeft = 44186
        mmTop = 0
        mmWidth = 73554
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel204: TppLabel
        UserName = 'ppLabel204'
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
        mmTop = 1058
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 43127
        mmTop = 1058
        mmWidth = 197380
        BandType = 8
      end
      object ppLine60: TppLine
        UserName = 'ppLine60'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 283770
        BandType = 8
      end
      object ppCalc45: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCompContasGroup1: TppGroup
      BreakName = 'CODGRUPOORC'
      DataPipeline = pplCompContas
      OutlineSettings.CreateNode = True
      UserName = 'rpCompContasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCompContas'
      object rpCompContasGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 13092807
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 0
        end
        object rpCompContasLabel1: TppLabel
          UserName = 'rpCompContasLabel1'
          Caption = 'Grupo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4106
          mmLeft = 1588
          mmTop = 265
          mmWidth = 12742
          BandType = 3
          GroupNo = 0
        end
        object rpCompContasDBText2: TppDBText
          UserName = 'rpCompContasDBText2'
          AutoSize = True
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 4106
          mmLeft = 15346
          mmTop = 265
          mmWidth = 41444
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCompContasGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
      end
    end
    object rpCompContasGroup2: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = pplCompContas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'rpCompContasGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCompContas'
      object rpCompContasGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CENTRORESP'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 4233
          mmLeft = 55033
          mmTop = 2381
          mmWidth = 158750
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Centro de responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4106
          mmLeft = 5821
          mmTop = 2381
          mmWidth = 47498
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 9260
          mmWidth = 277548
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Conta orçamentária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 5821
          mmTop = 9525
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 44186
          mmTop = 9525
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Centro de custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 124884
          mmTop = 9525
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Atividade / Projeto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 165894
          mmTop = 9525
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 205582
          mmTop = 9525
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 245269
          mmTop = 9525
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCompContasGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTAORCAMEN'
      DataPipeline = pplCompContas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCompContas'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 14869218
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 265
          mmWidth = 277548
          BandType = 3
          GroupNo = 2
        end
        object rpCompContasDBText4: TppDBText
          UserName = 'rpCompContasDBText4'
          DataField = 'IDCONTAORCAMEN'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 5821
          mmTop = 265
          mmWidth = 37042
          BandType = 3
          GroupNo = 2
        end
        object rpCompContasDBText5: TppDBText
          UserName = 'rpCompContasDBText5'
          DataField = 'NOMECONTAORCAMEN'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 44186
          mmTop = 265
          mmWidth = 79375
          BandType = 3
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CENTROCUST'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 124884
          mmTop = 265
          mmWidth = 38629
          BandType = 3
          GroupNo = 2
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'ATIVPROJ'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 265
          mmWidth = 38629
          BandType = 3
          GroupNo = 2
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'PLANO'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 205846
          mmTop = 265
          mmWidth = 38629
          BandType = 3
          GroupNo = 2
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'PATRO'
          DataPipeline = pplCompContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompContas'
          mmHeight = 3440
          mmLeft = 245269
          mmTop = 265
          mmWidth = 38629
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
    end
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 104
  end
  object pplImagem: TppDBPipeline
    DataSource = dsImagem
    UserName = 'lImagem'
    Left = 176
    Top = 104
  end
  object dsImagem: TDataSource
    DataSet = CdsImagem
    Left = 96
    Top = 104
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.FLGANALSINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Anal./Sint.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.IDGRUPOORCAMEN'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '30'
      '1')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 232
    Top = 16
  end
end
