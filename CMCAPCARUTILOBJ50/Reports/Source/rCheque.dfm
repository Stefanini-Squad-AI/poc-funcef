inherited RptCheque: TRptCheque
  Left = 537
  Top = 221
  Height = 307
  Caption = 'RptCheque'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Lista de Cheques'
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
    Left = 158
    Top = 5
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptCheque
    LabelEmpresa = RptChequeLabel1
    Left = 92
  end
  object SqlCheque: TCMSqlParams
    SQL.Strings = (
      
        'SELECT LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO, LD.VALOR' +
        ','
      
        '       LC.PLNCODIGO, RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || '#39#39'-'#39#39' ||' +
        ' DOC.COMPLDOCUMENTO AS'
      
        '       NUMDOC, DOC.DATAVENCTO, DOC.VALORJUROS, DOC.DATAPROGRAMAD' +
        'A,'
      
        '       PFOR.RAZAOSOCIAL FORNECEDOR, LP.OBSERVACAO, 0 AS VALORLOT' +
        'E,'
      
        '       LC.HISTORICOCOMPL,PBANCO.RAZAOSOCIAL, PF.CODARQUIVOREMESS' +
        'A,'
      '       PF.IDTEMPLCHEQUE, PC.NOCONTACORR'
      'FROM'
      '  LOTEPAGTO LP,'
      '  PORTADORFORMA PF,'
      '  PORTADORCONTA PC,'
      '  PESSOA PBANCO,'
      '  LOTEXDOCUM LD,'
      '  DOCUMENTO DOC,'
      '  PESSOA PFOR,'
      '  LANCTODOCUM LC'
      'WHERE'
      '  1=2'
      ''
      '')
    ClientDataSet = CdsCheque
    Left = 64
    Top = 112
  end
  object CdsCheque: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 80
    Data = {
      AF0300009619E0BD01000000180000001E000000000003000000AF030B444154
      41454D495353414F08000800000000000A444154414C414E43544F0800080000
      000000074E554D4150475208000400000000000A4E554D4147454E4349410100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000F0005504C414E4F01004900000001000557494454480200
      020032000D4E554D434851424F524445524F0100490000000100055749445448
      020002000F000A4641564F52454349444F010049000000010005574944544802
      0002003C000556414C4F52080004000000000009504C4E434F4449474F080004
      00000000000B4E4F434F4E5441434F5252010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000F000C434F
      44444F43554D454E544F0800040000000000064E554D444F4301004900000001
      00055749445448020002002C000C4E554D444F43554D454E544F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020012000A4441544156454E43544F08000800000000000E444154415052
      4F4752414D41444108000800000000000A56414C4F524A55524F530800040000
      0000000A464F524E454345444F52010049000000010005574944544802000200
      3C000A4F42534552564143414F01004900000001000557494454480200020050
      000956414C4F524C4F544508000400000000000E484953544F5249434F434F4D
      504C01004900000001000557494454480200020064000B52415A414F534F4349
      414C0100490000000100055749445448020002003C0011434F44415251554956
      4F52454D4553534108000400000000000D494454454D504C4348455155450800
      040000000000044E4F4D450100490000000100055749445448020002003C000D
      5449504F444F43554D454E544F01004900000001000557494454480200020006
      0006544954554C4F01004900000001000557494454480200020012000D444553
      435449504F434F4E54410100490000000100055749445448020002000E000542
      414E434F01004900000001000557494454480200020049000C4147454E434941
      434F4E54410100490000000100055749445448020002002100045449504F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      4944544802000200010002000D44454641554C545F4F52444552020082000200
      000006001800044C4349440400010009080000}
  end
  object PpCheque: TppBDEPipeline
    DataSource = DsCheque
    CloseDataSource = True
    UserName = 'PpCheque'
    Left = 157
    Top = 72
    object PpChequeppField1: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object PpChequeppField2: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object PpChequeppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpChequeppField4: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object PpChequeppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object PpChequeppField6: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object PpChequeppField7: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpChequeppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpChequeppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpChequeppField10: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object PpChequeppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpChequeppField12: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 44
      DisplayWidth = 44
      Position = 11
    end
    object PpChequeppField13: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 12
    end
    object PpChequeppField14: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object PpChequeppField15: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object PpChequeppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORJUROS'
      FieldName = 'VALORJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object PpChequeppField17: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object PpChequeppField18: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 80
      DisplayWidth = 80
      Position = 17
    end
    object PpChequeppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLOTE'
      FieldName = 'VALORLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object PpChequeppField20: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 19
    end
    object PpChequeppField21: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
    object PpChequeppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODARQUIVOREMESSA'
      FieldName = 'CODARQUIVOREMESSA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object PpChequeppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTEMPLCHEQUE'
      FieldName = 'IDTEMPLCHEQUE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpChequeppField24: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object PpChequeppField25: TppField
      FieldAlias = 'TIPODOCUMENTO'
      FieldName = 'TIPODOCUMENTO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 24
    end
    object PpChequeppField26: TppField
      FieldAlias = 'TITULO'
      FieldName = 'TITULO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 25
    end
    object PpChequeppField27: TppField
      FieldAlias = 'DESCTIPOCONTA'
      FieldName = 'DESCTIPOCONTA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 26
    end
    object PpChequeppField28: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 73
      DisplayWidth = 73
      Position = 27
    end
    object PpChequeppField29: TppField
      FieldAlias = 'AGENCIACONTA'
      FieldName = 'AGENCIACONTA'
      FieldLength = 33
      DisplayWidth = 33
      Position = 28
    end
    object PpChequeppField30: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
  end
  object DsCheque: TwwDataSource
    DataSet = CdsCheque
    Left = 134
    Top = 136
  end
  object RptCheque: TppReport
    AutoStop = False
    DataPipeline = PpCheque
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 221
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpCheque'
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object RptChequeDBText7: TppDBText
        UserName = 'RptChequeDBText7'
        DataField = 'FORNECEDOR'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object RptChequeDBText8: TppDBText
        UserName = 'RptChequeDBText8'
        DataField = 'NUMDOC'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 43921
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object DbeJuros2: TppDBText
        UserName = 'DbeJuros2'
        DataField = 'VALORJUROS'
        DataPipeline = PpCheque
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object DbeVencto: TppDBText
        UserName = 'DbeVencto'
        DataField = 'DATAVENCTO'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 64823
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object RptChequeDBText11: TppDBText
        UserName = 'RptChequeDBText11'
        DataField = 'VALOR'
        DataPipeline = PpCheque
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 106098
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object RptChequeDBText12: TppDBText
        UserName = 'RptChequeDBText12'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 127265
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object DbDataProg: TppDBText
        UserName = 'DbDataProg'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 64823
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUMAPGR'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 96573
        mmTop = 0
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'AGENCIACONTA'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 178065
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object dbEdtCPFCNPJ: TppDBText
        OnPrint = dbEdtCPFCNPJPrint
        UserName = 'dbEdtCPFCNPJ'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 213784
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BANCO'
        DataPipeline = PpCheque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCheque'
        mmHeight = 4233
        mmLeft = 239448
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object RptChequeLabel18: TppLabel
        UserName = 'RptChequeLabel18'
        AutoSize = False
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 15346
        mmWidth = 197909
        BandType = 8
      end
      object RptChequeLine3: TppLine
        UserName = 'RptChequeLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 14023
        mmWidth = 272000
        BandType = 8
      end
      object RptChequeShape1: TppShape
        UserName = 'RptChequeShape1'
        mmHeight = 11377
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object LblChq1: TppLabel
        UserName = 'LblChq1'
        AutoSize = False
        Caption = 'LblChq1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 1588
        mmWidth = 57944
        BandType = 8
      end
      object RptChequeShape2: TppShape
        UserName = 'RptChequeShape2'
        mmHeight = 11377
        mmLeft = 139436
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptChequeShape3: TppShape
        UserName = 'RptChequeShape3'
        mmHeight = 11377
        mmLeft = 71967
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object LblChq2: TppLabel
        UserName = 'LblChq2'
        AutoSize = False
        Caption = 'LblChq2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 1588
        mmWidth = 57944
        BandType = 8
      end
      object LblChq3: TppLabel
        UserName = 'LblChq3'
        AutoSize = False
        Caption = 'LblChq3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 1588
        mmWidth = 58208
        BandType = 8
      end
      object RptChequeLine4: TppLine
        UserName = 'RptChequeLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 272000
        BandType = 8
      end
      object RptChequeShape4: TppShape
        UserName = 'RptChequeShape4'
        mmHeight = 11377
        mmLeft = 206905
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object LblChq4: TppLabel
        UserName = 'LblChq4'
        Caption = 'LblChq4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 207698
        mmTop = 1588
        mmWidth = 11377
        BandType = 8
      end
      object RptChequeCalc1: TppSystemVariable
        UserName = 'RptChequeCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 15081
        mmWidth = 92869
        BandType = 8
      end
      object RptChequeCalc2: TppSystemVariable
        UserName = 'RptChequeCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 15346
        mmWidth = 25665
        BandType = 8
      end
    end
    object RptChequeGroup1: TppGroup
      BreakName = 'NUMCHQBORDERO'
      DataPipeline = PpCheque
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptChequeGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpCheque'
      object RptChequeGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 75671
        mmPrintPosition = 0
        object RptChequeLabel3: TppLabel
          UserName = 'RptChequeLabel3'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 71438
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel4: TppLabel
          UserName = 'RptChequeLabel4'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 43656
          mmTop = 71438
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel5: TppLabel
          UserName = 'RptChequeLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 115623
          mmTop = 71438
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object LblJuros2: TppLabel
          UserName = 'LblJuros2'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 85990
          mmTop = 71438
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object LblVencProg: TppLabel
          UserName = 'LblVencProg'
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 64823
          mmTop = 71438
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel8: TppLabel
          UserName = 'RptChequeLabel8'
          Caption = 'Observação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 51594
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel9: TppLabel
          UserName = 'RptChequeLabel9'
          Caption = 'Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 17727
          mmTop = 23813
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText1: TppDBText
          UserName = 'RptChequeDBText1'
          AutoSize = True
          DataField = 'NUMCHQBORDERO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 4868
          mmLeft = 24606
          mmTop = 23813
          mmWidth = 40428
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText2: TppDBText
          UserName = 'RptChequeDBText2'
          AutoSize = True
          DataField = 'FAVORECIDO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3598
          mmLeft = 42333
          mmTop = 40481
          mmWidth = 20955
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText3: TppDBText
          UserName = 'RptChequeDBText3'
          AutoSize = True
          DataField = 'DATAEMISSAO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3598
          mmLeft = 42333
          mmTop = 46038
          mmWidth = 22818
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText4: TppDBText
          UserName = 'RptChequeDBText4'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3598
          mmLeft = 42333
          mmTop = 30163
          mmWidth = 22564
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel10: TppLabel
          UserName = 'RptChequeLabel10'
          Caption = 'Nome do Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 30163
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel11: TppLabel
          UserName = 'RptChequeLabel11'
          Caption = 'Valor do'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 35190
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel12: TppLabel
          UserName = 'RptChequeLabel12'
          Caption = 'Favorecido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 40481
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel13: TppLabel
          UserName = 'RptChequeLabel13'
          Caption = 'Emissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 46038
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText5: TppDBText
          UserName = 'RptChequeDBText5'
          DataField = 'OBSERVACAO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 4233
          mmLeft = 42333
          mmTop = 51594
          mmWidth = 62971
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel14: TppLabel
          UserName = 'RptChequeLabel14'
          Caption = 'Data do Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 132557
          mmTop = 40217
          mmWidth = 34396
          BandType = 3
          GroupNo = 0
        end
        object LblVisto: TppLabel
          UserName = 'LblVisto'
          Caption = 'Visto da Gerência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 58473
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object LineVisto: TppLine
          UserName = 'LineVisto'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 42333
          mmTop = 62177
          mmWidth = 94456
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel16: TppLabel
          UserName = 'RptChequeLabel16'
          Caption = 'Documentos Pagos Com Este'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 64294
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText6: TppDBText
          UserName = 'RptChequeDBText6'
          AutoSize = True
          DataField = 'VALORLOTE'
          DataPipeline = PpCheque
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3598
          mmLeft = 42333
          mmTop = 35190
          mmWidth = 19008
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel17: TppLabel
          UserName = 'RptChequeLabel17'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 127265
          mmTop = 71438
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object RptChequeLabel1: TppLabel
          UserName = 'RptChequeLabel1'
          Caption = 'RptChequeLabel1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5821
          mmLeft = 114036
          mmTop = 1323
          mmWidth = 41275
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText13: TppDBText
          UserName = 'RptChequeDBText13'
          AutoSize = True
          DataField = 'TITULO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 5842
          mmLeft = 127085
          mmTop = 10054
          mmWidth = 17822
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText14: TppDBText
          UserName = 'RptChequeDBText14'
          AutoSize = True
          DataField = 'TIPODOCUMENTO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 4995
          mmLeft = 0
          mmTop = 23548
          mmWidth = 37634
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText15: TppDBText
          UserName = 'RptChequeDBText15'
          AutoSize = True
          DataField = 'TIPODOCUMENTO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3810
          mmLeft = 19050
          mmTop = 35190
          mmWidth = 28194
          BandType = 3
          GroupNo = 0
        end
        object RptChequeDBText16: TppDBText
          UserName = 'RptChequeDBText16'
          AutoSize = True
          DataField = 'TIPODOCUMENTO'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3810
          mmLeft = 55033
          mmTop = 64294
          mmWidth = 28194
          BandType = 3
          GroupNo = 0
        end
        object ppLabel149: TppLabel
          UserName = 'RptChequeLabel101'
          Caption = 'Conta Corrente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 132557
          mmTop = 35190
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATALANCTO'
          DataPipeline = PpCheque
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 4233
          mmLeft = 169863
          mmTop = 40217
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Agencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 132557
          mmTop = 29898
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText79: TppDBText
          UserName = 'DBText79'
          AutoSize = True
          DataField = 'NOCONTACORR'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 3598
          mmLeft = 169863
          mmTop = 35454
          mmWidth = 25104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NUMAGENCIA'
          DataPipeline = PpCheque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCheque'
          mmHeight = 4233
          mmLeft = 170127
          mmTop = 29898
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 21167
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 96838
          mmTop = 71438
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Agencia/Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178065
          mmTop = 71438
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 213784
          mmTop = 71438
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 239448
          mmTop = 71438
          mmWidth = 10753
          BandType = 3
          GroupNo = 0
        end
      end
      object RptChequeGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 124
    Top = 205
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 200
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '  LP.DATAEMISSAO,  LC.DATALANCTO, DOC. NUMAPGR, AB.NUMAGENCIA, P' +
        'PC.NOME AS PLANO,'
      
        '  LP.NUMCHQBORDERO, LP.FAVORECIDO, LD.VALOR, LC.PLNCODIGO,PC.NOC' +
        'ONTACORR, DOC.CODDOCUMENTO,'
      
        '  RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || '#39'-'#39' || DOC.COMPLDOCUMENTO A' +
        'S NUMDOC, PFOR.NUMDOCUMENTO,'
      
        '  DOC.DATAVENCTO, DOC.DATAPROGRAMADA, DOC.VALORJUROS,  PFOR.RAZA' +
        'OSOCIAL FORNECEDOR,'
      
        '  LP.OBSERVACAO, VL.VALORLOTE, LC.HISTORICOCOMPL,PBANCO.RAZAOSOC' +
        'IAL,'
      '  PF.CODARQUIVOREMESSA, PF.IDTEMPLCHEQUE,  PFOR.NOME,'
      
        '  DECODE(PF.CODARQUIVOREMESSA, NULL,'#39'Cheque'#39','#39'Lote'#39')  TIPODOCUME' +
        'NTO,'
      
        '  DECODE(PF.CODARQUIVOREMESSA, NULL,'#39'Cópia de Cheque'#39','#39'Remessa E' +
        'letrônica'#39')  TITULO,'
      '  DET.DESCTIPOCONTA, DET.BANCO, DET.AGENCIACONTA, DET.TIPO'
      'FROM'
      'LOTEPAGTO LP,   PORTADORFORMA PF,   PORTADORCONTA PC, '
      'PESSOA PBANCO,   AGENCIABANCARIA AB,   CONTABANCARIA CB, '
      
        'PLANPREVCONTABIL PPC,   LOTEXDOCUM LD,   DOCUMENTO DOC,   PESSOA' +
        ' PFOR,'
      '(SELECT'
      '  DECODE(C.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39', '
      '  DECODE(C.TIPOCONTA, '#39'2'#39', '#39'Cartão Salário'#39','
      
        '  DECODE(C.TIPOCONTA, '#39'3'#39', '#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCON' +
        'TA,'
      
        '  (B.NUMBANCO || '#39' - '#39' || PB.RAZAOSOCIAL) BANCO, (TRIM(A.NUMAGEN' +
        'CIA) || '#39' - '#39' ||  C.CONTACORRENTE  ) AgenciaConta,'
      '  P.TIPO, D.CODDOCUMENTO, P.NUMDOCUMENTO'
      ' FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  PESSOA PB,'
      '  CONTABANCARIA C,'
      '  AGENCIABANCARIA A,'
      '  BANCO B'
      'WHERE'
      '  (PB.IDPESSOA = B.IDPESSOA) AND'
      '  (P.IDPESSOA = D.IDFORCLI) AND'
      '  (C.IDAGENCIA = A.IDPESSOA(+))  AND'
      '  (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '  (D.IDCBANCARIA = C.IDCBANCARIA(+)) '
      '  '
      ')DET,'
      ''
      '   (SELECT NUMLOTE, SUM(VALOR) AS VALORLOTE'
      '    FROM LOTEXDOCUM'
      '    GROUP BY NUMLOTE) VL,   LANCTODOCUM LC ,'
      '   (SELECT COUNT(*) AS TOTDOCUM , NUMLOTE'
      '    FROM LOTEXDOCUM LD , DOCUMENTO D'
      '    WHERE         D.RECPAG         = '#39'P'#39'  AND'
      '                  LD.CODDOCUMENTO  = D.CODDOCUMENTO'
      '    GROUP BY NUMLOTE  ) TOTDOCUM ,'
      '   (SELECT COUNT(*) AS TOTDOCUM , NUMLOTE'
      '    FROM LOTEXDOCUM LD , DOCUMENTO D'
      '    WHERE         D.RECPAG         = '#39'P'#39'  AND'
      '                  LD.CODDOCUMENTO = D.CODDOCUMENTO  AND'
      '                  D.CODTIPDOC IN (SELECT CODTIPDOC'
      '                                  FROM TIPODOCRECPAG A'
      
        '                                  WHERE A.RECPAG =  '#39'P'#39' AND NOT ' +
        'EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B'
      
        '                                                                ' +
        '         WHERE RECPAG='#39'P'#39' AND B.IDUSUARIO= :IDUSUARIO)'
      'UNION'
      ' SELECT CODTIPDOC'
      ' FROM TIPODOCRECPAG A'
      
        ' WHERE A.RECPAG =   '#39'P'#39'  AND EXISTS (SELECT 1 FROM USUARIOXTPDOC' +
        'TO B'
      
        '                                     WHERE RECPAG='#39'P'#39' AND A.CODT' +
        'IPDOC=B.CODTIPDOC'
      
        '                                                      AND B.IDUS' +
        'UARIO=:IDUSUARIO))'
      '                                     GROUP BY NUMLOTE  ) TOTLOTE'
      'WHERE'
      '  (LP.NUMLOTE IN (27,30,43)) AND'
      '  (PF.CODPORTADOR = PC.CODPORTADOR) AND'
      '  (DET.CODDOCUMENTO(+) = DOC.CODDOCUMENTO) AND'
      '  (PC.IDBANCO = PBANCO.IDPESSOA) AND'
      '  (LD.NUMLOTE = LP.NUMLOTE) AND'
      '  (LD.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (DOC.IDCBANCARIA = CB.IDCBANCARIA(+)) AND'
      '  (PC.IDAGENCIA = AB.IDPESSOA ) AND'
      '  (DOC.PLANO = PPC.IDPLANOPREV) AND'
      '  (LC.OPERACAO = DOC.OPERACAO) AND'
      '  (TOTLOTE.TOTDOCUM=TOTDOCUM.TOTDOCUM) AND'
      '  (TOTLOTE.NUMLOTE=TOTDOCUM.NUMLOTE) AND'
      '  (TOTLOTE.NUMLOTE=  LP.NUMLOTE)  AND'
      '  (DOC.IDFORCLI = PFOR.IDPESSOA) AND'
      '  (LP.NUMLOTE = VL.NUMLOTE) AND'
      '  (LC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (LP.CODPORTFORMA = PF.CODPORTFORMA)'
      ''
      'ORDER BY LP.NUMCHQBORDERO, PFOR.NOME'
      ''
      ' '
      ' ')
    ClientDataSet = CdsCheque
    Left = 88
    Top = 64
  end
end
