inherited RptRecDesEfet: TRptRecDesEfet
  Left = 423
  Top = 75
  Height = 279
  Caption = 'RptRecDesEfet'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Lista os Recebimentos Inicial'
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
        Caption = 'Lista os Recebimentos Final'
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
      end>
    Formheight = 125
    FormWidth = 520
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptRecDesEfet
    LabelEmpresa = ppLabel29
    LabelSistema = ppLabel30
  end
  object PpRecDesEfet: TppBDEPipeline
    DataSource = DsRecDesEfet
    CloseDataSource = True
    UserName = 'PpRecDesEfet'
    Left = 171
    Top = 61
  end
  object DsRecDesEfet: TwwDataSource
    DataSet = CdsRecDesEfet
    Left = 118
    Top = 53
  end
  object RptRecDesEfet: TppReport
    AutoStop = False
    DataPipeline = PpRecDesEfet
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptRecDesEfetBeforePrint
    DeviceType = 'Screen'
    Left = 227
    Top = 61
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object LblTituloGraf: TppLabel
        UserName = 'LblTituloGraf'
        Caption = 'Pagamentos X Tipos de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 54769
        mmTop = 8202
        mmWidth = 74348
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 185000
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel29'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 76994
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptRecDesEfetLabel1: TppLabel
        UserName = 'RptRecDesEfetLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 21431
        mmWidth = 13494
        BandType = 0
      end
      object RptRecDesEfetLabel2: TppLabel
        UserName = 'RptRecDesEfetLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 28046
        mmTop = 21431
        mmWidth = 18785
        BandType = 0
      end
      object RptRecDesEfetLabel3: TppLabel
        UserName = 'RptRecDesEfetLabel3'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 170392
        mmTop = 21431
        mmWidth = 11642
        BandType = 0
      end
      object RptRecDesEfetPERIODO: TppLabel
        UserName = 'RptRecDesEfetPERIODO'
        AutoSize = False
        Caption = 'RptRecDesEfetPERIODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 54769
        mmTop = 14288
        mmWidth = 74348
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RptRecDesEfetDBText1: TppDBText
        UserName = 'RptRecDesEfetDBText1'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = PpRecDesEfet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28046
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object LblCodTipRecdes: TppDBText
        UserName = 'LblCodTipRecdes'
        AutoSize = True
        DataField = 'CODTIPRECDES'
        DataPipeline = PpRecDesEfet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
      object RptRecDesEfetDBText3: TppDBText
        UserName = 'RptRecDesEfetDBText3'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpRecDesEfet
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 794
        mmWidth = 11642
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 185000
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 25665
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 3175
        mmWidth = 20902
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptRecDesEfetSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RptRecDesEfetDBCalc1: TppDBCalc
        UserName = 'RptRecDesEfetDBCalc1'
        DataField = 'VALOR'
        DataPipeline = PpRecDesEfet
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 529
        mmWidth = 52388
        BandType = 7
      end
      object RptRecDesEfetLabel4: TppLabel
        UserName = 'RptRecDesEfetLabel4'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 120915
        mmTop = 529
        mmWidth = 8467
        BandType = 7
      end
    end
  end
  object SqlRecDesEfet: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */  U.CODTIPRECDES, T.DESCRICAO, U.RECPAG,'
      '       SUM(U.VALORPAGO) AS VALOR'
      'FROM'
      
        '(SELECT D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPRE' +
        'CDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '       D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '       SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC),'
      '                           DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC))) AS VALORPAGO,'
      '       R.IDPESSOA, R.RECPAG, D.IDFORCLI'
      
        ' FROM (SELECT D.NUMFATURA, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA,' +
        ' R.CODCENTRORESPON,'
      '            (SUM(R.VALOR)/T.VALORTOTAL) AS PERC'
      '       FROM RATEIODOCUM R, DOCUMENTO D,'
      '            (SELECT D.NUMFATURA,'
      
        '                    SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'1' +
        '5'#39','
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1)),'
      '                              DECODE(D.OPERACAO,'#39'15'#39','
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1)))) AS VALORTOTAL'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = :RECPAG)'
      '               AND (L.ESTORNO IS NULL)'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (D.OPERACAO = '#39'1 '#39') GROUP BY D.NUMFATURA) T'
      '       WHERE (T.NUMFATURA = D.NUMFATURA)'
      '         AND (T.VALORTOTAL <> 0)'
      '         AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '       GROUP BY D.NUMFATURA, R.CODTIPRECDES, R.RECPAG, R.IDPESSO' +
        'A, T.VALORTOTAL,R.CODCENTRORESPON) R,'
      '     DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'5 '#39','#39'10'#39','#39'15'#39'))'
      '  AND (L.ESTORNO IS NULL)'
      '  AND (D.NUMFATURA = R.NUMFATURA)'
      '  AND (RP.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (RP.NUMLANCTO = L.NUMLANCTO)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (L.DATALANCTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPR' +
        'ECDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '         D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '         R.IDPESSOA, R.RECPAG, D.IDFORCLI, D.RECPAG'
      'UNION ALL'
      
        'SELECT D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPREC' +
        'DES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '       D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '       SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC),'
      '                           DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC))) AS VALORPAGO,'
      '       R.IDPESSOA, R.RECPAG, D.IDFORCLI'
      
        'FROM (SELECT R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPESSO' +
        'A, R.CODCENTRORESPON,'
      '              (SUM(R.VALOR)/T.VALORTOTAL) AS PERC'
      '      FROM RATEIODOCUM R,'
      '           (SELECT D.CODDOCUMENTO,'
      
        '                   SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'15' +
        #39','
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1)),'
      '                              DECODE(D.OPERACAO,'#39'15'#39','
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1)))) AS VALORTOTAL'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = :RECPAG)'
      '              AND (L.ESTORNO IS NULL)'
      '              AND (L.VALOR <> 0)'
      
        '              AND (D.OPERACAO IN ('#39'2 '#39','#39'10'#39','#39'15'#39')) GROUP BY D.CO' +
        'DDOCUMENTO) T'
      '      WHERE (T.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (T.VALORTOTAL <> 0)'
      
        '      GROUP BY R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPES' +
        'SOA, T.VALORTOTAL,R.CODCENTRORESPON) R,'
      '      DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'5 '#39','#39'10'#39','#39'15'#39'))'
      '  AND (L.ESTORNO IS NULL)'
      '  AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '  AND (RP.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (RP.NUMLANCTO = L.NUMLANCTO)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (L.DATALANCTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPR' +
        'ECDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '         D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '         R.IDPESSOA, R.RECPAG, D.IDFORCLI, D.RECPAG'
      ') U, TIPORECEBDESEMB T'
      'WHERE'
      '      (T.CODTIPRECDES = U.CODTIPRECDES)'
      '  AND (T.RECPAG = U.RECPAG)'
      '  AND (T.IDPESSOA = U.IDPESSOA)'
      'GROUP BY U.CODTIPRECDES, T.DESCRICAO, U.RECPAG'
      'ORDER BY VALOR DESC'
      '')
    ClientDataSet = CdsRecDesEfet
    Left = 96
    Top = 96
  end
  object CdsRecDesEfet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 96
  end
end
