inherited RelConsAmortizacaoBloq: TRelConsAmortizacaoBloq
  Left = 429
  Top = 225
  Width = 346
  Height = 228
  Caption = 'RelConsAmortizacaoBloq'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
    Params = <
      item
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
    Left = 164
  end
  inherited CrmRptCM: TCmRptManager
    Left = 99
  end
  object pplAmortizacaoBloq: TppBDEPipeline
    DataSource = dsAmortizacaoBloq
    UserName = 'lAmortizacaoBloq'
    Left = 40
    Top = 120
    object pplAmortizacaoBloqppField1: TppField
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField2: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField3: TppField
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField4: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField5: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField6: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField7: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField8: TppField
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField9: TppField
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField10: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField11: TppField
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField12: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField13: TppField
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField14: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField15: TppField
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplAmortizacaoBloqppField16: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object rptAmortizacaoBloq: TppReport
    AutoStop = False
    DataPipeline = pplAmortizacaoBloq
    OnStartPage = rptAmortizacaoBloqStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Movimentação de Custódia'
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
    BeforePrint = rptAmortizacaoBloqBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 120
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAmortizacaoBloq'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Amortização Bloqueada  -  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 45170
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
        mmLeft = 3175
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
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 17727
        mmWidth = 284300
        BandType = 0
      end
      object shpCustodiante: TppShape
        UserName = 'shpDetalhe1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 7408
        mmLeft = 265
        mmTop = 18256
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Fundo de Investimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 21431
        mmWidth = 42598
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplAmortizacaoBloq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 4233
        mmLeft = 70115
        mmTop = 8202
        mmWidth = 106627
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 98690
        mmTop = 21696
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade de Cotas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 191812
        mmTop = 21696
        mmWidth = 28321
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor da Amortização'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 253397
        mmTop = 21431
        mmWidth = 28914
        BandType = 0
      end
      object pplTipoCota: TppLabel
        UserName = 'lTipoCota'
        Caption = 'Tipo Cota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 21696
        mmWidth = 14023
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplAmortizacaoBloq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplAmortizacaoBloq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 3175
        mmLeft = 102659
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAmortizacaoBloq
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 3175
        mmLeft = 239184
        mmTop = 265
        mmWidth = 43127
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        OnGetText = ppDBText4GetText
        DataField = 'QTDOPERACAO'
        DataPipeline = pplAmortizacaoBloq
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 0
        mmWidth = 43127
        BandType = 4
      end
      object ppDBTipoCota: TppDBText
        UserName = 'DBTipoCota'
        DataField = 'DESCTIPOCOTA'
        DataPipeline = pplAmortizacaoBloq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAmortizacaoBloq'
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 265
        mmWidth = 45773
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
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
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = pplAmortizacaoBloq
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAmortizacaoBloq'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplAmortizacaoBloq
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAmortizacaoBloq'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText29: TppDBText
          UserName = 'ppdbDescPlano'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplAmortizacaoBloq
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplAmortizacaoBloq'
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 100013
          BandType = 3
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplAmortizacaoBloq
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAmortizacaoBloq'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLROPERACAO'
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3439
          mmLeft = 239184
          mmTop = 1852
          mmWidth = 43127
          BandType = 5
          GroupNo = 2
        end
        object ppLine3: TppLine
          UserName = 'Line5'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 3704
          mmLeft = 227278
          mmTop = 0
          mmWidth = 57150
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsAmortizacaoBloq: TDataSource
    DataSet = cdsAmortizacaoBloq
    Left = 272
    Top = 64
  end
  object cdsAmortizacaoBloq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 161
    Top = 64
  end
  object sprAmortizacaoBloq: TCMSqlParams
    SQL.Strings = (
      'SELECT OP.IDOPERACAOFUNDO,TF.DESCTIPOFUNDOINV, OP.IDFUNDOINVEST,'
      '       FI.DESCFUNDOINVEST,OP.DATAOPERACAO,OP.IDPLANPREVCTBPATR,'
      
        '       PATRO.PLANPRVCONTABPATRO,FI.IDTIPOFUNDOINVEST,OP.IDTIPOOP' +
        'ERACAO,'
      
        '       TPOP.DESCTIPOOPERACAO,OP.QTDOPERACAO,OP.VLROPERACAO,OP.ID' +
        'TIPOINVEST,OP.OBSERVACAO,'
      '       FI.QTDDECQTD,TC.DESCTIPOCOTA'
      
        'FROM OPERACAOFUNDO OP, TIPOOPERACAO TPOP,VWPLANPREVCTBPATR PATRO' +
        ',TIPOFUNDOINVEST TF,'
      '     HISTFUNDOINVEST FI, TIPOCOTA TC'
      ''
      
        'WHERE (FI.IDFUNDOINVEST || TO_CHAR(FI.DTAVIGENCIA,'#39'DD/MM/YYYY, H' +
        'H24:MI:SS'#39') IN'
      
        '              (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),' +
        #39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST'
      '               WHERE DTAVIGENCIA <= OP.DATAOPERACAO'
      '               GROUP BY IDFUNDOINVEST)) AND'
      ''
      '      OP.IDFUNDOINVEST = FI.IDFUNDOINVEST AND'
      '      OP.IDTIPOOPERACAO = TPOP.IDTIPOOPERACAO AND'
      '      OP.IDTIPOINVEST = TPOP.IDTIPOINVEST AND'
      '      OP.IDPLANPREVCTBPATR = PATRO.IDPLANPREVCTBPATR AND'
      '      OP.IDFUNDOINVEST = FI.IDFUNDOINVEST AND'
      '      OP.IDTIPOCOTA = TC.IDTIPOCOTA(+) AND'
      
        '      -- EXISTE MAIS QUE UM TIPO DE FUNDO PARA UM TIPODEINVETIME' +
        'NTO'
      '      OP.IDTIPOINVEST = TF.IDTIPOINVEST AND'
      '      FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST AND'
      '      -- Somente a operacao'
      '      OP.IDTIPOOPERACAO='#39'-171'#39' AND'
      '      -- PARAMETROS'
      '      OP.IDTIPOINVEST= '#39'6'#39' AND'
      '      OP.IDPLANPREVCTBPATR > 0 AND'
      '      OP.IDFUNDOINVEST > 0 AND'
      
        '      OP.DATAOPERACAO  BETWEEN TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39 +
        ') AND'
      
        '                               TO_DATE('#39'31/12/2006'#39','#39'DD/MM/YYYY'#39 +
        ')'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsAmortizacaoBloq
    Left = 48
    Top = 64
  end
end
