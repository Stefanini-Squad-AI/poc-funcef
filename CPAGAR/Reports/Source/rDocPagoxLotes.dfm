inherited RptDocPagoxLotes: TRptDocPagoxLotes
  Left = 389
  Top = 171
  Width = 296
  Height = 177
  Caption = 'RptDocPagoxLotes'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Documentos Pagos X Lotes'
    Params = <
      item
        Caption = 'Data Recebimento Inicial'
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
        Caption = 'Data Recebimento Final'
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 120
    FormWidth = 390
    Left = 164
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptDocPagos
    LabelEmpresa = ppLabel65
    LabelSistema = ppLabel66
  end
  object DsDocPagos: TwwDataSource
    DataSet = CdsDocPagos
    Left = 89
    Top = 53
  end
  object PpDocPagos: TppBDEPipeline
    DataSource = DsDocPagos
    CloseDataSource = True
    UserName = 'PpDocPagos'
    Left = 137
    Top = 58
  end
  object RptDocPagos: TppReport
    AutoStop = False
    DataPipeline = PpDocPagos
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
    Left = 193
    Top = 58
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDocPagos'
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object LblDocsPagReceb: TppLabel
        UserName = 'LblDocsPagReceb'
        Caption = 'Documentos Pagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 115888
        mmTop = 8731
        mmWidth = 39952
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'ppLine40'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16404
        mmWidth = 272000
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'ppLabel65'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121179
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText27: TppDBText
        UserName = 'ppDBText27'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpDocPagos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 0
        mmWidth = 94192
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpDocPagos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 0
        mmWidth = 84931
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'VALOR'
        DataPipeline = PpDocPagos
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 3704
        mmLeft = 254794
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object RptDocPagosDBText1: TppDBText
        UserName = 'RptDocPagosDBText1'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpDocPagos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 3704
        mmLeft = 93663
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptDocPagosDBText2: TppDBText
        UserName = 'RptDocPagosDBText2'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpDocPagos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLine41: TppLine
        UserName = 'ppLine41'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc37: TppSystemVariable
        UserName = 'Calc37'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 3175
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245005
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Total de Recebimentos - >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 529
        mmWidth = 43921
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'ppDBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpDocPagos
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocPagos'
        mmHeight = 4233
        mmLeft = 246328
        mmTop = 265
        mmWidth = 25665
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATALANCTO'
      DataPipeline = PpDocPagos
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocPagos'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel82: TppLabel
          UserName = 'ppLabel82'
          Caption = 'Data de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'ppDBText28'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpDocPagos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpDocPagos'
          mmHeight = 4498
          mmLeft = 38100
          mmTop = 0
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel90: TppLabel
          UserName = 'ppLabel90'
          Caption = 'Sub Total Data ->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpDocPagos
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDocPagos'
          mmHeight = 3440
          mmLeft = 251619
          mmTop = 0
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'ppLine42'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 3969
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptDocPagosGroup1: TppGroup
      BreakName = 'NUMCHQBORDERO'
      DataPipeline = PpDocPagos
      OutlineSettings.CreateNode = True
      UserName = 'RptDocPagosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocPagos'
      object RptDocPagosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel84: TppLabel
          UserName = 'ppLabel84'
          Caption = 'Cheque \ Bordeô:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 265
          mmWidth = 29369
          BandType = 3
          GroupNo = 1
        end
        object ppDBText16: TppDBText
          UserName = 'ppDBText16'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = PpDocPagos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpDocPagos'
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object LblClientes: TppLabel
          UserName = 'LblClientes'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 5556
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object RptDocPagosLabel1: TppLabel
          UserName = 'RptDocPagosLabel1'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 93134
          mmTop = 5556
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object RptDocPagosLabel2: TppLabel
          UserName = 'RptDocPagosLabel2'
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 5556
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppLabel88: TppLabel
          UserName = 'ppLabel88'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 137848
          mmTop = 5556
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel85: TppLabel
          UserName = 'ppLabel85'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 262996
          mmTop = 5821
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
      end
      object RptDocPagosGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object RptDocPagosLabel3: TppLabel
          UserName = 'RptDocPagosLabel3'
          Caption = 'Sub Total Cheque\Borderô->'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 0
          mmWidth = 41010
          BandType = 5
          GroupNo = 1
        end
        object RptDocPagosDBCalc1: TppDBCalc
          UserName = 'RptDocPagosDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpDocPagos
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptDocPagosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDocPagos'
          mmHeight = 3440
          mmLeft = 251884
          mmTop = 0
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object SqlDocPagos: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ DISTINCT'
      
        ' LANCTOS.DATA_LANCAMENTO,  L.DATALANCTO, LP.NUMCHQBORDERO, LP.NU' +
        'MLOTE, P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO, H.HISTORI' +
        'COCOMPL,'
      
        ' DECODE(L.DEBCRE,'#39'D'#39',DECODE(D.RECPAG,'#39'P'#39',L.VALOR,L.VALOR * -1),D' +
        'ECODE(D.RECPAG,'#39'R'#39',L.VALOR,L.VALOR * -1)) AS VALOR'
      'FROM'
      
        '( SELECT CODDOCUMENTO, DATALANCTO AS DATA_LANCAMENTO FROM LANCTO' +
        'DOCUM WHERE OPERACAO = '#39'2'#39' ) LANCTOS,'
      
        '(select count(*) as totdocum , numlote from lanctodocum l,lotexd' +
        'ocum ld , documento d'
      ' where D.RECPAG         = '#39'P'#39
      '   AND  D.IDPESSOA = -1'
      
        '   and (L.DATALANCTO Between to_date('#39'01/01/0001'#39','#39'dd/MM/yyyy'#39') ' +
        ' and to_date('#39'01/01/0001'#39','#39'dd/MM/yyyy'#39'))'
      '   AND l.operacao in ('#39'5'#39','#39'15'#39','#39'10'#39')'
      '   and l.coddocumento=d.coddocumento'
      
        '   and ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totd' +
        'ocum ,'
      
        '   (select count(*) as totdocum , numlote from lanctodocum l,lot' +
        'exdocum ld , documento d'
      '     where  D.RECPAG         = '#39'P'#39
      '       AND  D.IDPESSOA = -1'
      '       and ld.CODDOCUMENTO = D.CODDOCUMENTO'
      
        '       and (L.DATALANCTO Between to_date('#39'01/01/0001'#39','#39'dd/MM/yyy' +
        'y'#39')  and to_date('#39'01/01/0001'#39','#39'dd/MM/yyyy'#39'))'
      
        '       AND l.operacao in ('#39'5'#39','#39'15'#39','#39'10'#39') and l.coddocumento=d.co' +
        'ddocumento'
      
        '       and d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a' +
        ' WHERE a.RECPAG =  '#39'P'#39
      
        '       and not exists  (select 1 from UsuarioxTpdocto b where re' +
        'cpag='#39'P'#39' and b.idusuario= -1)'
      
        '       union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.REC' +
        'PAG =   '#39'P'#39
      '         and exists (select 1 from UsuarioxTpdocto b'
      
        '         where recpag='#39'P'#39' and a.codtipdoc=b.codtipdoc and b.idus' +
        'uario= -1)) group by numlote  ) totlote ,'
      
        '   LANCTODOCUM L,LOTEPAGTO LP, LOTEXDOCUM LX,  RECBTOPAGTO R, DO' +
        'CUMENTO D, PESSOA P,'
      
        '(SELECT D.CODDOCUMENTO, L.HISTORICOCOMPL FROM LANCTODOCUM L, DOC' +
        'UMENTO D WHERE'
      ' (L.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) AND (D.IDPESSOA = -1) AND'
      ' (D.RECPAG = '#39'P'#39' ) AND (L.CODDOCUMENTO = D.CODDOCUMENTO)) H'
      'WHERE'
      '(D.IDPESSOA = -1 ) AND (LP.NUMCHQBORDERO IS NOT NULL) AND'
      
        '(L.DATALANCTO Between to_date('#39'01/01/0001'#39','#39'dd/MM/yyyy'#39')  and to' +
        '_date('#39'01/01/0001'#39','#39'dd/MM/yyyy'#39')) AND'
      '(LP.FLAGCANCEL = '#39'B'#39') AND (D.RECPAG = '#39'P'#39') AND'
      '(L.ESTORNO IS NULL) AND'
      '(D.CODDOCUMENTO = H.CODDOCUMENTO ) AND'
      
        '(LX.CODDOCUMENTO = D.CODDOCUMENTO) AND (LX.NUMLOTE = LP.NUMLOTE)' +
        ' AND'
      
        '(D.CODDOCUMENTO = L.CODDOCUMENTO) AND (D.IDFORCLI = P.IDPESSOA) ' +
        'AND'
      
        '(R.NUMLANCTO = L.NUMLANCTO) AND (R.CODDOCUMENTO = D.CODDOCUMENTO' +
        ')'
      'and  totlote.totdocum=totdocum.totdocum and'
      
        'totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NUML' +
        'OTE'
      'AND LANCTOS.CODDOCUMENTO = D.CODDOCUMENTO and 1 = 2'
      'ORDER BY L.DATALANCTO, LP.NUMCHQBORDERO, P.RAZAOSOCIAL')
    ClientDataSet = CdsDocPagos
    Left = 56
    Top = 56
  end
  object CdsDocPagos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 56
  end
end
