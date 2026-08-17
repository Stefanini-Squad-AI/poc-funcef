inherited RptMovimBancos: TRptMovimBancos
  Left = 329
  Top = 363
  Width = 458
  Height = 153
  Caption = 'RptMovimBancos'
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
        Caption = 'Conta'
        Controle = tcProcuraCC
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 200
    FormWidth = 350
    Left = 304
  end
  inherited DevRptCM: TExtraOptions
    Left = 128
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMovimBancos
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 216
  end
  object rpMovimBancos: TppReport
    AutoStop = False
    DataPipeline = ppMovimBancos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 392
    Top = 72
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Movimentação dos Bancos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197115
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      AfterPrint = ppDetailBand12AfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'DATALANCFINAN'
        DataPipeline = ppMovimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CODLANCFINANC'
        DataPipeline = ppMovimBancos
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 52123
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCRICAO'
        DataPipeline = ppMovimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 265
        mmWidth = 88371
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR'
        DataPipeline = ppMovimBancos
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'HISTORICO'
        DataPipeline = ppMovimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 5027
        mmWidth = 88371
        BandType = 4
      end
      object lblTipoDoc: TppLabel
        UserName = 'lblTipoDoc'
        Caption = 'Regularizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'PLANO'
        DataPipeline = ppMovimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 8731
        mmWidth = 88371
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
      BreakName = 'IDRELACIONANI'
      DataPipeline = ppMovimBancos
      KeepTogether = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object grpbIDRelaciona: TppGroupHeaderBand
        AfterPrint = grpbIDRelacionaAfterPrint
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'Line3'
          Pen.Width = 3
          Position = lpBottom
          Weight = 2.25
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label1'
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 1323
          mmTop = 0
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object dbtGrupo: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'IDRELACIONANI'
          DataPipeline = ppMovimBancos
          DisplayFormat = '000,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 17463
          mmTop = 0
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line38'
          Pen.Width = 3
          Position = lpBottom
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label2'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 7408
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 52388
          mmTop = 7408
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel69: TppLabel
          UserName = 'Label69'
          Caption = 'Descrição / Histórico / Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78317
          mmTop = 7408
          mmWidth = 73554
          BandType = 3
          GroupNo = 0
        end
        object ppLabel70: TppLabel
          UserName = 'Label70'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178330
          mmTop = 7408
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'FLGNI'
      DataPipeline = ppMovimBancos
      KeepTogether = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object grpbFlgNI: TppGroupHeaderBand
        AfterPrint = grpbFlgNIAfterPrint
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
        object ppLine37: TppLine
          UserName = 'Line37'
          Pen.Width = 2
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 26988
          mmTop = 265
          mmWidth = 170392
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'CODLANCFINANC'
      DataPipeline = ppMovimBancos
      KeepTogether = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine39: TppLine
          UserName = 'Line39'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 123561
          mmTop = 0
          mmWidth = 74348
          BandType = 5
          GroupNo = 2
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'VALORLANCFINAN'
          DataPipeline = ppMovimBancos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162454
          mmTop = 1852
          mmWidth = 33602
          BandType = 5
          GroupNo = 2
        end
        object ppLine40: TppLine
          UserName = 'Line40'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 123561
          mmTop = 5556
          mmWidth = 74348
          BandType = 5
          GroupNo = 2
        end
        object ppLabel71: TppLabel
          UserName = 'Label701'
          Caption = 'Total do Lançamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 123561
          mmTop = 1852
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppMovimBancos: TppBDEPipeline
    DataSource = dsMovimBancos
    UserName = 'lExemplo1'
    Left = 304
    Top = 72
  end
  object dsMovimBancos: TwwDataSource
    DataSet = cdsMovimBancos
    Left = 216
    Top = 72
  end
  object cdsMovimBancos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 72
  end
  object spMovimBancos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT U.DATA, SUM(U.TOTDEBCON) AS TOTDEBCON, SUM(U.TOTCRECON) A' +
        'S TOTCRECON,'
      
        '       SUM(U.TOTDEBFIN) AS TOTDEBFIN, SUM(U.TOTCREFIN) AS TOTCRE' +
        'FIN'
      'FROM'
      ' (SELECT '
      '     M.DATALANCFINAN AS DATA, '
      #9' 0 AS TOTDEBCON, 0 AS TOTCRECON,'
      
        '     SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,0)) AS TOTDE' +
        'BFIN,'
      
        '     SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN,0)) AS TOTCR' +
        'EFIN'
      '  FROM '
      '     MOVIMFINANC M,'
      '     PORTADORCONTA P'
      '  WHERE '
      '     (P.CODPORTADOR = M.CODPORTADOR) AND '
      #9' (P.PLACONTA = :PLACONTA) AND '
      #9' (M.DATALANCFINAN >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND '
      #9' (M.DATALANCFINAN <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  GROUP BY M.DATALANCFINAN'
      ''
      'UNION ALL'
      ''
      '  SELECT '
      '     P.PLNDATDIA AS DATA, '
      #9' SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR,0)) AS TOTDEBCON,'
      '     SUM(DECODE(L.LACDEBCRE,'#39'C'#39',L.LACVALOR,0)) AS TOTCRECON,'
      #9' 0 AS TOTDEBFIN,'
      '     0 AS TOTCREFIN'
      '  FROM '
      '     PLANILHA P,'
      '     LANCAMENTO L'
      '  WHERE '
      '     (P.PLNCODIGO = L.PLNCODIGO) AND '
      #9' (L.PLACONTA = :PLACONTA) AND '
      #9' (P.PLNDATDIA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND '
      #9' (P.PLNDATDIA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   GROUP BY P.PLNDATDIA) U'
      '   '
      'GROUP BY U.DATA'
      ''
      'HAVING (SUM(NVL(U.TOTDEBCON,0)) <> SUM(NVL(U.TOTDEBFIN,0))) OR'
      '       (SUM(NVL(U.TOTCRECON,0)) <> SUM(NVL(U.TOTCREFIN,0)))'
      #9'   '
      'ORDER BY DATA ')
    ClientDataSet = cdsMovimBancos
    Left = 32
    Top = 72
  end
end
