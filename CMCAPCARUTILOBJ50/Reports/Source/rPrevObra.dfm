inherited RptPrevObra: TRptPrevObra
  Left = 418
  Width = 522
  Height = 200
  Caption = 'RptPrevObra'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Data Programada do Documento Inicial'
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
        Caption = 'Data Programada do Documento Final'
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
        Caption = 'Centro de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTRORESPON, NOME '
          'FROM CENTRESPON ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'Nome'
        LookupSettings.Descricao = 'Nome'
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
    FormWidth = 600
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptQryPrevObra
    LabelEmpresa = ppLabel56
    LabelSistema = ppLabel63
  end
  object PpQryPrevObra: TppBDEPipeline
    DataSource = DsQryPrevObra
    CloseDataSource = True
    UserName = 'PpQryPrevObra'
    Left = 289
    Top = 56
    object PpQryPrevObrappField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpQryPrevObrappField2: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object PpQryPrevObrappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object PpQryPrevObrappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpQryPrevObrappField5: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object PpQryPrevObrappField6: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object PpQryPrevObrappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDORATEIO'
      FieldName = 'SALDORATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpQryPrevObrappField8: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object DsQryPrevObra: TwwDataSource
    DataSet = CdsPrevObra
    Left = 225
    Top = 56
  end
  object RptQryPrevObra: TppReport
    AutoStop = False
    DataPipeline = PpQryPrevObra
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 353
    Top = 56
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'ppLabel56'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121973
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'ppLabel59'
        Caption = 'Previsão de Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 110861
        mmTop = 8467
        mmWidth = 50271
        BandType = 0
      end
      object RptQryPrevObraLine1: TppLine
        UserName = 'RptQryPrevObraLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20373
        mmWidth = 272000
        BandType = 0
      end
      object LblPeridoPrevObra: TppLabel
        UserName = 'LblPeridoPrevObra'
        Caption = 'LblPeridoPrevObra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 119856
        mmTop = 15346
        mmWidth = 32279
        BandType = 0
      end
      object RptQryPrevObraLabel3: TppLabel
        UserName = 'RptQryPrevObraLabel3'
        Caption = 'Documento \ Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 22754
        mmWidth = 46831
        BandType = 0
      end
      object RptQryPrevObraLabel4: TppLabel
        UserName = 'RptQryPrevObraLabel4'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 53181
        mmTop = 22754
        mmWidth = 19315
        BandType = 0
      end
      object RptQryPrevObraLabel5: TppLabel
        UserName = 'RptQryPrevObraLabel5'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 126736
        mmTop = 22754
        mmWidth = 14552
        BandType = 0
      end
      object RptQryPrevObraLabel7: TppLabel
        UserName = 'RptQryPrevObraLabel7'
        Caption = 'Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 202142
        mmTop = 22754
        mmWidth = 29633
        BandType = 0
      end
      object RptQryPrevObraLabel6: TppLabel
        UserName = 'RptQryPrevObraLabel6'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 22754
        mmWidth = 8996
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptQryPrevObraDBText3: TppDBText
        UserName = 'RptQryPrevObraDBText3'
        AutoSize = True
        DataField = 'NODOCUMENTO'
        DataPipeline = PpQryPrevObra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 22754
        BandType = 4
      end
      object RptQryPrevObraDBText4: TppDBText
        UserName = 'RptQryPrevObraDBText4'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpQryPrevObra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 0
        mmWidth = 72761
        BandType = 4
      end
      object RptQryPrevObraDBText5: TppDBText
        UserName = 'RptQryPrevObraDBText5'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpQryPrevObra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 0
        mmWidth = 74348
        BandType = 4
      end
      object RptQryPrevObraDBText7: TppDBText
        UserName = 'RptQryPrevObraDBText7'
        AutoSize = True
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpQryPrevObra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 23283
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object RptQryPrevObraDBText6: TppDBText
        UserName = 'RptQryPrevObraDBText6'
        AutoSize = True
        DataField = 'SALDORATEIO'
        DataPipeline = PpQryPrevObra
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 246857
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object RptQryPrevObraDBText8: TppDBText
        UserName = 'RptQryPrevObraDBText8'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpQryPrevObra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 201613
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'ppLine39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel63: TppLabel
        UserName = 'ppLabel63'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 2910
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc35: TppSystemVariable
        UserName = 'Calc35'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 37306
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc36: TppSystemVariable
        UserName = 'Calc36'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 240771
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptQryPrevObraSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object LblValorTotal: TppDBCalc
        UserName = 'LblValorTotal'
        AutoSize = True
        DataField = 'SALDORATEIO'
        DataPipeline = PpQryPrevObra
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 236273
        mmTop = 1058
        mmWidth = 30692
        BandType = 7
      end
      object RptQryPrevObraLabel2: TppLabel
        UserName = 'RptQryPrevObraLabel2'
        Caption = 'Total da Geral->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 150284
        mmTop = 1323
        mmWidth = 27252
        BandType = 7
      end
    end
    object RptQryPrevObraGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = PpQryPrevObra
      UserName = 'RptQryPrevObraGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptQryPrevObraGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptQryPrevObraLabel1: TppLabel
          UserName = 'RptQryPrevObraLabel1'
          Caption = 'Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object RptQryPrevObraDBText1: TppDBText
          UserName = 'RptQryPrevObraDBText1'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = PpQryPrevObra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 50006
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object RptQryPrevObraGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object LblSomaRateio: TppDBCalc
          UserName = 'LblSomaRateio'
          AutoSize = True
          DataField = 'SALDORATEIO'
          DataPipeline = PpQryPrevObra
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptQryPrevObraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 236273
          mmTop = 265
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object RptQryPrevObraLabel8: TppLabel
          UserName = 'RptQryPrevObraLabel8'
          Caption = 'Total do C.R.->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 150284
          mmTop = 0
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object RptQryPrevObraLine2: TppLine
          UserName = 'RptQryPrevObraLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4763
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlPrevObra: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.NOME, D.DATAPROGRAMADA,'
      
        '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCO' +
        'MPL,C.CODCENTRORESPON,'
      '   SUM(((SALDO.SVALOR * R.VALOR) / L.VALOR)) AS SALDORATEIO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L,'
      '   CENTRESPON C,'
      '   RATEIODOCUM R,'
      
        '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAM' +
        'OEDA) AS SVALOROUTRAMOEDA FROM'
      '     (SELECT DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1) AS VREAL,'
      
        '        DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA ' +
        '* -1) AS VOUTRAMOEDA,'
      '        L.CODDOCUMENTO'
      '        FROM LANCTODOCUM L ,DOCUMENTO D'
      
        '        WHERE L.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = '#39'P'#39 +
        ' AND D.IDPESSOA = :PIDPESSOA)  S'
      '        GROUP BY S.CODDOCUMENTO) SALDO'
      'WHERE'
      '   (RTRIM(C.CODCENTRORESPON) = RTRIM(:OBRA)) AND'
      
        '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,'#39'dd/mm/yyyy'#39') AND' +
        ' to_date(:PDATAFIM,'#39'dd/mm/yyyy'#39')) AND'
      '   (D.IDPESSOA = :PIDPESSOA) AND'
      '   (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '   (D.RECPAG = '#39'P'#39')  AND'
      
        '    ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHER' +
        'E a.RECPAG ='#39'P'#39
      '       and not exists  (select 1 from UsuarioxTpdocto b where'
      '       b.idusuario=:idusuario)'
      
        '       union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.REC' +
        'PAG ='#39'P'#39
      
        '       and exists (select 1 from UsuarioxTpdocto b where a.codti' +
        'pdoc=b.codtipdoc and'
      '        b.idusuario=:idusuario )) ) and'
      '   (L.ESTORNO IS NULL) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (L.Valor <> 0 ) AND'
      '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND'
      '   (R.IDPESSOA = C.IDPESSOA(+)) AND'
      '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)'
      'GROUP BY'
      '    C.NOME, D.DATAPROGRAMADA,'
      
        '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOC' +
        'OMPL, C.CODCENTRORESPON'
      'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0'
      'ORDER BY  C.NOME, D.DATAPROGRAMADA,P.RAZAOSOCIAL'
      '')
    ClientDataSet = CdsPrevObra
    Left = 112
    Top = 56
  end
  object CdsPrevObra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 56
  end
  object SqlPrevObra2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.NOME, D.DATAPROGRAMADA,'
      
        '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCO' +
        'MPL, C.CODCENTRORESPON,'
      '   SUM((SALDO.SVALOR * R.VALOR/ L.VALOR)) AS SALDORATEIO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L,'
      '   CENTRESPON C,'
      '   RATEIODOCUM R,'
      
        '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAM' +
        'OEDA) AS SVALOROUTRAMOEDA FROM'
      
        '      (SELECT DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1) AS VREAL' +
        ','
      
        '        DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA ' +
        '* -1) AS VOUTRAMOEDA,'
      '        L.CODDOCUMENTO'
      '        FROM LANCTODOCUM L ,DOCUMENTO D'
      
        '        WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (D.RECPAG = ' +
        #39'P'#39') AND (D.IDPESSOA = :PIDPESSOA))  S'
      '        GROUP BY S.CODDOCUMENTO) SALDO'
      'WHERE'
      
        '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,'#39'dd/mm/yyyy'#39') AND' +
        ' to_date(:PDATAFIM,'#39'dd/mm/yyyy'#39')) AND'
      '   (D.IDPESSOA = :PIDPESSOA) AND'
      ''
      
        '     ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHE' +
        'RE a.RECPAG ='#39'P'#39
      '       and not exists  (select 1 from UsuarioxTpdocto b where'
      '       b.idusuario=:idusuario)'
      
        '       union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.REC' +
        'PAG ='#39'P'#39
      
        '       and exists (select 1 from UsuarioxTpdocto b where a.codti' +
        'pdoc=b.codtipdoc and'
      '        b.idusuario=:idusuario )) ) and'
      ''
      '   (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '   (D.RECPAG = '#39'P'#39') AND'
      '   (L.ESTORNO IS NULL) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND'
      '   (R.CODCENTRORESPON = C.IDPESSOA(+)) AND'
      '   (L.valor <> 0)    AND'
      '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)'
      'GROUP BY     C.NOME, D.DATAPROGRAMADA,'
      
        '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOC' +
        'OMPL, C.CODCENTRORESPON'
      'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0'
      'ORDER BY'
      ' C.NOME, D.DATAPROGRAMADA,P.RAZAOSOCIAL')
    ClientDataSet = CdsPrevObra2
    Left = 104
    Top = 88
  end
  object CdsPrevObra2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 96
  end
  object CdsParam: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 128
  end
end
