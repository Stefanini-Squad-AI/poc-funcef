inherited RptCAFCadGrupo: TRptCAFCadGrupo
  Left = 454
  Top = 206
  Width = 298
  Height = 142
  Caption = 'RptCAFCadGrupo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Grupos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE,NOME,IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'CLASSE'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '50|10'
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
        Caption = 'Centro de Custo Associado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTROCUSTO,NOME'
          'FROM CENTCUST'
          'WHERE (STATUSGRUPOCDC = '#39'A'#39')'
          'AND (ATIVO = '#39'S'#39')'
          'ORDER BY CODCENTROCUSTO')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME|CODCENTROCUSTO'
        LookupSettings.Descricao = 'Centro de Custo|Código'
        LookupSettings.Tamanho = '50|10'
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
    Formheight = 122
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpCadGrupo
    Left = 88
  end
  object qryCadGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.CLASSE, G.NOME, G.TIPO, G.DEPRECIACAO, G.FLGIMOVEL, G.I' +
        'DGRUPO,'
      '       CC.CODCENTROCUSTO, CC.NOME AS DESCCC'
      'FROM GRUPO G,'
      '     GRUPOBEMXCC GXCC,'
      '     CENTCUST CC'
      'WHERE'
      ''
      ''
      '      (G.IDGRUPO           = GXCC.IDGRUPO(+))'
      '  AND (GXCC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (GXCC.IDEMPRESA      = CC.IDEMPRESA(+))'
      'ORDER BY G.CLASSE')
    ValidateWithMask = True
    Left = 24
    Top = 64
    object qryCadGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryCadGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryCadGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryCadGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryCadGrupoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
    object qryCadGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryCadGrupoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCadGrupoDESCCC: TStringField
      FieldName = 'DESCCC'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object dsCadGrupo: TwwDataSource
    DataSet = qryCadGrupo
    Left = 96
    Top = 64
  end
  object ppCadGrupo: TppBDEPipeline
    DataSource = dsCadGrupo
    UserName = 'CadGrupo'
    Left = 168
    Top = 64
  end
  object rpCadGrupo: TppReport
    AutoStop = False
    DataPipeline = ppCadGrupo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 240
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Cadastro de Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 78052
        mmTop = 8996
        mmWidth = 41010
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel89'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpCadGrupoLabel1: TppLabel
        UserName = 'rpCadGrupoLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17198
        mmWidth = 11906
        BandType = 0
      end
      object rpCadGrupoLabel2: TppLabel
        UserName = 'rpCadGrupoLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 17198
        mmWidth = 16404
        BandType = 0
      end
      object rpCadGrupoLabel3: TppLabel
        UserName = 'rpCadGrupoLabel3'
        Caption = 'Sintético / Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
      object rpCadGrupoLine1: TppLine
        UserName = 'rpCadGrupoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 16404
        mmWidth = 197379
        BandType = 0
      end
      object rpCadGrupoLabel4: TppLabel
        UserName = 'rpCadGrupoLabel4'
        Caption = 'Centros de Custo Associados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 22754
        mmWidth = 50006
        BandType = 0
      end
      object rpCadGrupoLine2: TppLine
        UserName = 'rpCadGrupoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197379
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpCadGrupoDBText1: TppDBText
        UserName = 'rpCadGrupoDBText1'
        DataField = 'DESCCC'
        DataPipeline = ppCadGrupo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 0
        mmWidth = 167482
        BandType = 4
      end
      object rpCadGrupoCODCENTROCUSTO: TppVariable
        UserName = 'rpCadGrupoCODCENTROCUSTO1'
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 42333
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel90: TppLabel
        UserName = 'ppLabel90'
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
        mmWidth = 55563
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
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
    end
    object rpCadGrupoGroup1: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppCadGrupo
      UserName = 'rpCadGrupoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCadGrupoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpCadGrupoDBText2: TppDBText
          UserName = 'rpCadGrupoDBText2'
          DataField = 'NOME'
          DataPipeline = ppCadGrupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26723
          mmTop = 0
          mmWidth = 143140
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoDBText3: TppDBText
          UserName = 'rpCadGrupoDBText3'
          DataField = 'TIPO'
          DataPipeline = ppCadGrupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoLine3: TppLine
          UserName = 'rpCadGrupoLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpCadGrupoCODGRUPO: TppVariable
          UserName = 'rpCadGrupoCODGRUPO1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 42333
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCadGrupoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object rpCadGrupoLine4: TppLine
          UserName = 'rpCadGrupoLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
