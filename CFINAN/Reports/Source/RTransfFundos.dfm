inherited RptTransfFundos: TRptTransfFundos
  Left = 324
  Top = 288
  Width = 430
  Height = 164
  Caption = 'RptTransfFundos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Transferência de Fundos'
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
      end>
    Formheight = 150
    FormWidth = 350
    Left = 300
  end
  inherited DevRptCM: TExtraOptions
    Left = 128
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpTransfFundos
    Left = 211
  end
  object spTransfFundos: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '      DECODE(SIGN(LF.VALORLANCFINAN - :VALMINTRASNFDIA ),-1  , '#39 +
        'DOC'#39','#39'TED'#39') AS DOCTED, '
      '       LF.CODLANCFINANC,L.LACNUMLAN,LF.PLNCODIGO,'
      '       LF.DATALANCFINAN,L.PLACONTA,'
      '       (L.LACHIST1||'#39' '#39'||l.LACHIST2||'#39' '#39'||l.LACHIST3) AS HIST,'
      '       LF.CODLANCTRANSF,CC.CODEXTERNO AS CODCENTROCUSTO,'
      '       L.UNIDNEGOC,L.CODSUBCONTA,'
      '       ppc.nome as SubPlano,'
      '       LF.VALORLANCFINAN,LF.HISTORICO,'
      '       L.LACDEBCRE,L.LACVALOR,'
      '       LF.NUMCHQBORDERO,CD.DESCRICAO,'
      '       CS.DESCRICAO AS DESCSAQUE,'
      '       b.numbanco as NumBancoDeposito,'
      '       ab.numagencia as NumAgenciaDeposito,     '
      '       cs.numagencia as NumAgenciaSaque,'
      '       cs.numbanco as NumBancoSaque,'
      
        '      (SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC' +
        ' = LF.CODLANCFINANC) AS DATASAQUE,'
      
        '      (SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC' +
        ' = LF.CODLANCTRANSF) AS DATADEPOSITO'
      
        'FROM MOVIMFINANC LF, LANCAMENTO L, PORTADORCONTA CD, CENTCUST CC' +
        ', rateiofinanc rf, planprevcontabil ppc, banco b, agenciabancari' +
        'a ab, '
      ''
      '(SELECT'
      
        '   C.DESCRICAO,M.CODLANCFINANC, ab.numagencia, m.datalancfinan, ' +
        'b.numbanco'
      'FROM'
      '   MOVIMFINANC M, PORTADORCONTA C, agenciabancaria ab, banco b'
      'WHERE'
      '  (M.CODPORTADOR = C.CODPORTADOR) AND'
      '  (M.IDPESSOA = C.IDPESSOA) AND'
      '  (M.IDPESSOA = :IDPessoa ) and'
      '  (c.idagencia = ab.idpessoa ) and'
      '  (c.idbanco = b.idpessoa)) CS'
      'WHERE (LF.DATALANCFINAN >= TO_DATE(:DataIni, '#39'DD/MM/YYYY'#39')) AND'
      '      (LF.DATALANCFINAN <= TO_DATE(:DataFim, '#39'DD/MM/YYYY'#39')) AND'
      
        '      ((LF.CODLANCTRANSF IS NOT NULL) AND (LF.CODLANCTRANSF<>LF.' +
        'CODLANCFINANC)) AND'
      '      (LF.ENTRADASAIDA = '#39'S'#39') AND'
      '      (LF.PLNCODIGO = L.PLNCODIGO) AND'
      '      (CD.CODPORTADOR = LF.CODPORTADOR) AND'
      '      (CS.CODLANCFINANC = LF.CODLANCTRANSF) AND'
      '      (LF.IDPESSOA = :IDPessoa ) AND'
      
        '      (lf.codlancfinanc = rf.codlancfinanc ) and                ' +
        '                      '
      '      (rf.idplanoprev  = ppc.idplanoprev ) and'
      '      (cd.idagencia = ab.idpessoa ) and'
      '      (cd.idbanco = b.idpessoa) and'
      '      (LF.IDPESSOA = L.IDPESSOA) AND'
      '      (LF.IDPESSOA = CD.IDPESSOA) AND'
      '      (CC.CODCENTROCUSTO(+) = L.CODCENTROCUSTO)'
      'ORDER BY LF.CODLANCFINANC,L.LACNUMLAN')
    ClientDataSet = cdsTransfFundos
    Left = 40
    Top = 8
  end
  object cdsTransfFundos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 40
    Top = 64
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 376
    Top = 8
  end
  object rpTransfFundos: TppReport
    AutoStop = False
    DataPipeline = pplTransfFundos
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 304
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplTransfFundos'
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = pplTransfFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3260
        mmLeft = 173800
        mmTop = 0
        mmWidth = 15113
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'LACNUMLAN'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'CODSUBCONTA'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 61383
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'UNIDNEGOC'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object rpEmisTransfDBText1: TppDBText
        UserName = 'rpEmisTransfDBText1'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object rpEmisTransfDBText3: TppDBText
        UserName = 'rpEmisTransfDBText3'
        DataField = 'LACDEBCRE'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object rpEmisTransfDBMemo2: TppDBMemo
        UserName = 'rpEmisTransfDBMemo2'
        CharWrap = False
        DataField = 'HIST'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 0
        mmWidth = 57415
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DOCTED'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText3'
        DataField = 'SUBPLANO'
        DataPipeline = pplTransfFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfFundos'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpEmisTransfShape3: TppShape
        UserName = 'rpEmisTransfShape3'
        mmHeight = 8996
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 195263
        BandType = 8
      end
      object rpEmisTransfShape6: TppShape
        UserName = 'rpEmisTransfShape6'
        mmHeight = 8996
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape7: TppShape
        UserName = 'rpEmisTransfShape7'
        mmHeight = 8996
        mmLeft = 33338
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape8: TppShape
        UserName = 'rpEmisTransfShape8'
        mmHeight = 8996
        mmLeft = 65617
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape9: TppShape
        UserName = 'rpEmisTransfShape9'
        mmHeight = 8996
        mmLeft = 97631
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape10: TppShape
        UserName = 'rpEmisTransfShape10'
        mmHeight = 8996
        mmLeft = 129911
        mmTop = 1588
        mmWidth = 33338
        BandType = 8
      end
      object rpEmisTransfLabel8: TppLabel
        UserName = 'rpEmisTransfLabel8'
        Caption = 'rpEmisTransfLabel8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 2381
        mmWidth = 26723
        BandType = 8
      end
      object rpEmisTransfLabel9: TppLabel
        UserName = 'rpEmisTransfLabel9'
        Caption = 'rpEmisTransfLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 35190
        mmTop = 2381
        mmWidth = 26723
        BandType = 8
      end
      object rpEmisTransfLabel10: TppLabel
        UserName = 'rpEmisTransfLabel10'
        Caption = 'rpEmisTransfLabel10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel11: TppLabel
        UserName = 'rpEmisTransfLabel11'
        Caption = 'rpEmisTransfLabel11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 98425
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel12: TppLabel
        UserName = 'rpEmisTransfLabel12'
        Caption = 'rpEmisTransfLabel12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel13: TppLabel
        UserName = 'rpEmisTransfLabel13'
        Caption = 'rpEmisTransfLabel13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODLANCFINANC'
      DataPipeline = pplTransfFundos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTransfFundos'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 74348
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'ppShape2'
          mmHeight = 14552
          mmLeft = 794
          mmTop = 2117
          mmWidth = 195263
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape1: TppShape
          UserName = 'rpEmisTransfShape1'
          mmHeight = 14552
          mmLeft = 794
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape2: TppShape
          UserName = 'rpEmisTransfShape2'
          mmHeight = 7144
          mmLeft = 794
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'ppDBText13'
          AutoSize = True
          DataField = 'DATALANCFINAN'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3387
          mmLeft = 2545
          mmTop = 11377
          mmWidth = 23749
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 68792
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'ppLabel21'
          Caption = 'N.Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 68792
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12700
          mmTop = 68792
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'ppLabel24'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73819
          mmTop = 68792
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 181240
          mmTop = 68792
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel1: TppLabel
          UserName = 'rpEmisTransfLabel1'
          Caption = 'Sub- Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 62177
          mmTop = 65088
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel2: TppLabel
          UserName = 'rpEmisTransfLabel2'
          Caption = 'Ativ./Proj.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 99748
          mmTop = 68792
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel4: TppLabel
          UserName = 'rpEmisTransfLabel4'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 3440
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel5: TppLabel
          UserName = 'rpEmisTransfLabel5'
          AutoSize = False
          Caption = 'Transferência de Fundo entre Contas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 27517
          mmTop = 3440
          mmWidth = 141817
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape4: TppShape
          UserName = 'rpEmisTransfShape4'
          mmHeight = 14552
          mmLeft = 169069
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape5: TppShape
          UserName = 'rpEmisTransfShape5'
          mmHeight = 7144
          mmLeft = 169069
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText2: TppDBText
          UserName = 'rpEmisTransfDBText2'
          AutoSize = True
          DataField = 'CODLANCFINANC'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3387
          mmLeft = 170176
          mmTop = 11377
          mmWidth = 24511
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel3: TppLabel
          UserName = 'rpEmisTransfLabel3'
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 169069
          mmTop = 3440
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel6: TppLabel
          UserName = 'rpEmisTransfLabel6'
          Caption = 'D/C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 68792
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine2: TppLine
          UserName = 'rpEmisTransfLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 265
          mmTop = 73554
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel7: TppLabel
          UserName = 'rpEmisTransfLabel7'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 80698
          mmTop = 17992
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText4: TppDBText
          UserName = 'rpEmisTransfDBText4'
          AutoSize = True
          DataField = 'VALORLANCFINAN'
          DataPipeline = pplTransfFundos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 4191
          mmLeft = 92149
          mmTop = 17992
          mmWidth = 32470
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine3: TppLine
          UserName = 'rpEmisTransfLine3'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 265
          mmTop = 31750
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel15: TppLabel
          UserName = 'rpEmisTransfLabel15'
          AutoSize = False
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 32544
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape11: TppShape
          UserName = 'rpEmisTransfShape11'
          mmHeight = 14023
          mmLeft = 265
          mmTop = 48683
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine1: TppLine
          UserName = 'rpEmisTransfLine1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 13229
          mmLeft = 97896
          mmTop = 48683
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel14: TppLabel
          UserName = 'rpEmisTransfLabel14'
          AutoSize = False
          Caption = 'Saque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 49477
          mmWidth = 97896
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel16: TppLabel
          UserName = 'rpEmisTransfLabel16'
          AutoSize = False
          Caption = 'Depósito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 98161
          mmTop = 49477
          mmWidth = 97896
          BandType = 3
          GroupNo = 0
        end
        object ppmExtenso: TppMemo
          OnPrint = ppmExtensoPrint
          UserName = 'mExtenso'
          Caption = 'mExtenso'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 8202
          mmLeft = 265
          mmTop = 22754
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpEmisTransfDBMemo1: TppDBMemo
          UserName = 'rpEmisTransfDBMemo1'
          CharWrap = True
          DataField = 'HISTORICO'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 5292
          mmLeft = 265
          mmTop = 37306
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpEmisTransfDBText5: TppDBText
          UserName = 'rpEmisTransfDBText5'
          AutoSize = True
          DataField = 'DESCSAQUE'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3260
          mmLeft = 100542
          mmTop = 58208
          mmWidth = 17822
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText6: TppDBText
          UserName = 'rpEmisTransfDBText6'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3260
          mmLeft = 1852
          mmTop = 58208
          mmWidth = 16849
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATASAQUE'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 1852
          mmTop = 53975
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DATADEPOSITO'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 100542
          mmTop = 53975
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          CharWrap = True
          Caption = 'DOC/ TED'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 52388
          mmTop = 65617
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText2'
          DataField = 'NUMBANCOSAQUE'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 30956
          mmTop = 53975
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'NUMAGENCIASAQUE'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 56092
          mmTop = 53975
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NUMBANCODEPOSITO'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 130704
          mmTop = 53975
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'NUMAGENCIADEPOSITO'
          DataPipeline = pplTransfFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfFundos'
          mmHeight = 3440
          mmLeft = 156898
          mmTop = 53975
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 20902
          mmTop = 53975
          mmWidth = 9610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Agência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 43921
          mmTop = 53975
          mmWidth = 11853
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 120121
          mmTop = 53975
          mmWidth = 9610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Agência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 143934
          mmTop = 53975
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Sub-Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 28575
          mmTop = 69586
          mmWidth = 14055
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplTransfFundos: TppBDEPipeline
    DataSource = dsTransfFundos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lTransfFundos'
    Left = 216
    Top = 64
    object pplTransfFundosppField1: TppField
      FieldAlias = 'DOCTED'
      FieldName = 'DOCTED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField2: TppField
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField3: TppField
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField4: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField5: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField6: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField7: TppField
      FieldAlias = 'HIST'
      FieldName = 'HIST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField8: TppField
      FieldAlias = 'CODLANCTRANSF'
      FieldName = 'CODLANCTRANSF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField9: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField10: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField11: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField12: TppField
      FieldAlias = 'SUBPLANO'
      FieldName = 'SUBPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField13: TppField
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField14: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField15: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField16: TppField
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField17: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField18: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField19: TppField
      FieldAlias = 'DESCSAQUE'
      FieldName = 'DESCSAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField20: TppField
      FieldAlias = 'NUMBANCODEPOSITO'
      FieldName = 'NUMBANCODEPOSITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField21: TppField
      FieldAlias = 'NUMAGENCIADEPOSITO'
      FieldName = 'NUMAGENCIADEPOSITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField22: TppField
      FieldAlias = 'NUMAGENCIASAQUE'
      FieldName = 'NUMAGENCIASAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField23: TppField
      FieldAlias = 'NUMBANCOSAQUE'
      FieldName = 'NUMBANCOSAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField24: TppField
      FieldAlias = 'DATASAQUE'
      FieldName = 'DATASAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplTransfFundosppField25: TppField
      FieldAlias = 'DATADEPOSITO'
      FieldName = 'DATADEPOSITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
  end
  object dsTransfFundos: TwwDataSource
    DataSet = cdsTransfFundos
    Left = 128
    Top = 64
  end
  object sqlVALMINTRASNFDIA: TCMSqlParams
    SQL.Strings = (
      
        'select VALMINTRASNFDIA from paramfinanc where idpessoa = :idempr' +
        'esa')
    ClientDataSet = cdsVALMINTRASNFDIA
    Left = 360
    Top = 56
  end
  object cdsVALMINTRASNFDIA: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 88
  end
end
