inherited RptCAFMovPatBem: TRptCAFMovPatBem
  Left = 476
  Top = 179
  Width = 268
  Height = 134
  Caption = 'Movimento Patrimonial por Bem'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimento Patrimonial por Bem'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Data Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Grupo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Bem'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDBEM,PLACA, DESBEM'
          'FROM BEM'
          'ORDER BY PLACA')
        LookupSettings.Chave = 'IDBEM'
        LookupSettings.Display = 'PLACA|DESBEM'
        LookupSettings.Descricao = 'Placa|Descrição'
        LookupSettings.Tamanho = '10|50'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Movimentação'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCTIPOMOVIMENTACAO,IDTIPOMOVIMENTACAO'
          'FROM TIPOMOVIMENTACAO'
          'ORDER BY DESCTIPOMOVIMENTACAO')
        LookupSettings.Chave = 'IDTIPOMOVIMENTACAO'
        LookupSettings.Display = 'DESCTIPOMOVIMENTACAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '50'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end>
    Formheight = 197
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpMovBem
  end
  object qryMovBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.PLACA,'
      '       B.IDBEM,'
      '       B.DESBEM AS DESCBEM,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       HM.DATAMOVIMENTACAO,'
      '       TM.DESCTIPOMOVIMENTACAO,'
      '       NVL(VM.VALOFI, 0) AS VALOFI'
      'FROM   BEM B,'
      '       GRUPO G,'
      '       HISTORICOMOVIMENTACAO HM,'
      '       VALORMOVIMENTACAO VM,'
      '       TIPOMOVIMENTACAO TM'
      
        'WHERE ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) and (HM.DATAMOVIMEN' +
        'TACAO <= :PDATAMOVFIM))'
      '  AND (B.IDBEM               = HM.IDBEM)'
      '  AND (B.IDPESSOA            = HM.IDPESSOA)'
      '  AND (G.IDGRUPO             = B.IDGRUPO)'
      '  AND (HM.IDMOVIMENTACAO     = VM.IDMOVIMENTACAO(+))'
      '  AND (TM.IDTIPOMOVIMENTACAO = HM.IDTIPOMOVIMENTACAO)'
      
        'ORDER BY G.CLASSE, B.PLACA, HM.DATAMOVIMENTACAO, HM.IDMOVIMENTAC' +
        'AO'
      '')
    ValidateWithMask = True
    Left = 205
    Top = 46
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end>
    object qryMovBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryMovBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryMovBemDESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qryMovBemCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryMovBemDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovBemDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryMovBemVALOFI: TFloatField
      FieldName = 'VALOFI'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
  object dsMovBem: TwwDataSource
    DataSet = qryMovBem
    Left = 207
    Top = 34
  end
  object ppMovBem: TppBDEPipeline
    DataSource = dsMovBem
    UserName = 'MovBem'
    Left = 206
    Top = 21
  end
  object rpMovBem: TppReport
    AutoStop = False
    DataPipeline = ppMovBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 206
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Extrato de Movimentação dos Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 62971
        mmTop = 8731
        mmWidth = 71438
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'ppLabel38'
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
      object rpMovBemLabel6: TppLabel
        UserName = 'rpMovBemLabel6'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 56621
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rpMovBemLabel7: TppLabel
        UserName = 'rpMovBemLabel7'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel8: TppLabel
        UserName = 'rpMovBemLabel8'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel9: TppLabel
        UserName = 'rpMovBemLabel9'
        Caption = 'até'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 111919
        mmTop = 14817
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpMovBemDBText4: TppDBText
        UserName = 'rpMovBemDBText4'
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object rpMovBemDBText5: TppDBText
        UserName = 'rpMovBemDBText5'
        DataField = 'DESCTIPOMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26988
        mmTop = 0
        mmWidth = 142346
        BandType = 4
      end
      object rpMovBemDBText6: TppDBText
        UserName = 'rpMovBemDBText6'
        DataField = 'VALOFI'
        DataPipeline = ppMovBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
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
        mmWidth = 57679
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
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
    end
    object rpMovBemGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppMovBem
      NewPage = True
      UserName = 'rpMovBemGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMovBemGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpMovBemLabel1: TppLabel
          UserName = 'rpMovBemLabel1'
          Caption = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemDBText1: TppDBText
          UserName = 'rpMovBemDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 13229
          mmTop = 0
          mmWidth = 183092
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemLine2: TppLine
          UserName = 'rpMovBemLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpMovBemGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
      end
    end
    object rpMovBemGroup2: TppGroup
      BreakName = 'PLACA'
      DataPipeline = ppMovBem
      UserName = 'rpMovBemGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMovBemGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpMovBemLabel2: TppLabel
          UserName = 'rpMovBemLabel2'
          Caption = 'Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemDBText2: TppDBText
          UserName = 'rpMovBemDBText2'
          DataField = 'DESCBEM'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 33338
          mmTop = 0
          mmWidth = 163248
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLine1: TppLine
          UserName = 'rpMovBemLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel3: TppLabel
          UserName = 'rpMovBemLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 6350
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel4: TppLabel
          UserName = 'rpMovBemLabel4'
          Caption = 'Tipo do Movimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 26723
          mmTop = 6350
          mmWidth = 32279
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel5: TppLabel
          UserName = 'rpMovBemLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178859
          mmTop = 6085
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemCalc1: TppVariable
          UserName = 'rpMovBemCalc1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 9260
          mmTop = 0
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
      end
      object rpMovBemGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
end
