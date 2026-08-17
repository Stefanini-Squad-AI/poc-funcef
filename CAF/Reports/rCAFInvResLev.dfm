inherited RptCAFInvResLev: TRptCAFInvResLev
  Left = 461
  Top = 215
  Width = 289
  Height = 140
  Caption = 'Resultado do Levantamento do Inventario'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Resultado de Levantamento do Inventario'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Levantamento de Inventário'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'IDINVENTARIOBENS'
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
        MontaSelect = MSInventBens
        Width = 0
      end
      item
        Caption = 'Opções'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Bens do levantamento'
          'Bens da localização encontrados'
          'Bens da localização não encontrados'
          'Bens não cadastrados'
          'Bens pertencentes a outras localizações'
          'Bens encontrados em outras localizações')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
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
        Name = 'OPCAO'
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
    Formheight = 190
    FormWidth = 585
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpInvResLev
    LabelEmpresa = ppLabel36
    LabelSistema = ppLabel37
  end
  object sqlInvResLev: TCMSqlParams
    SQL.Strings = (
      'SELECT IB.IDINVENTARIOBENS, IB.DATAINILEVANT, IB.DATAFIMLEVANT,'
      '       I.IIBPLACA, I.IIBFLGPLACA,'
      '       DECODE(I.IIBFLGPLACA,0,'#39'       ....         '#39','
      '       DECODE(I.IIBFLGPLACA,1,'#39'        Ok          '#39','
      '       DECODE(I.IIBFLGPLACA,2,'#39'Placa não encontrada'#39','
      '       DECODE(I.IIBFLGPLACA,3,'#39'Placa EM outro Local'#39','
      '       DECODE(I.IIBFLGPLACA,4,'#39'Placa DE outro Local'#39','
      '       DECODE(I.IIBFLGPLACA,5,'#39'Placa não Cadastrada'#39','
      
        '                              '#39'       ....         '#39')))))) AS DE' +
        'SCFLGPLACA,'
      '       CONJ_DE.DESCCONJUNTO AS DESCCONJUNTO_DE,'
      '       LOCAL_DE.NOME AS DESCLOCAL_DE,'
      '       RESP_DE.NOME AS NOMERESP_DE,'
      '       CONJ_PARA.DESCCONJUNTO AS DESCCONJUNTO_PARA,'
      
        '       DECODE(LOCAL_PARA.NOME,NULL,DECODE(I.IIBFLGPLACA,1,LOCAL_' +
        'DE.NOME,'#39'Não Encontrado'#39'),LOCAL_PARA.NOME) AS DESCLOCAL_PARA,'
      '       RESP_PARA.NOME AS NOMERESP_PARA,'
      '       DECODE(I.IIBFLGSITFISICA,0,'#39' Normal  '#39','
      '       DECODE(I.IIBFLGSITFISICA,1,'#39'Avariado '#39','
      '       DECODE(I.IIBFLGSITFISICA,2,'#39'Destruido'#39','
      
        '                                  '#39' Normal  '#39'))) AS DESCFLGSITFI' +
        'SICA,'
      '       B.DESBEM'
      'FROM ITENSINVBENS I,'
      '     INVENTARIOBENS IB,'
      '     BEM B,'
      '     CONJUNTO CONJ_DE,'
      '     LOCALIZACAO LOCAL_DE,'
      '     PESSOA RESP_DE,'
      '     CONJUNTO CONJ_PARA,'
      '     LOCALIZACAO LOCAL_PARA,'
      '     PESSOA RESP_PARA'
      'WHERE I.IDINVENTARIOBENS = :IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = :IDEMPRESA'
      ''
      '  AND I.IDINVENTARIOBENS = IB.IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = IB.IDEMPRESA'
      '  AND I.IIBIDBEM = B.IDBEM(+)'
      '  AND I.IDEMPRESA = B.IDPESSOA(+)'
      '  AND I.IIBCONJUNTOATUAL = CONJ_DE.IDCONJUNTO(+)'
      '  AND I.IDEMPRESA = CONJ_DE.IDPESSOA(+)'
      '  AND CONJ_DE.IDRESPONSAVEL = RESP_DE.IDPESSOA(+)'
      '  AND I.IIBLOCALATUAL = LOCAL_DE.IDLOCALIZACAO(+)'
      '  AND I.IDEMPRESA = LOCAL_DE.IDPESSOA(+)'
      '  AND I.IIBCONJUNTONOVO = CONJ_PARA.IDCONJUNTO(+)'
      '  AND I.IDEMPRESA = CONJ_PARA.IDPESSOA(+)'
      '  AND CONJ_PARA.IDRESPONSAVEL = RESP_PARA.IDPESSOA(+)'
      '  AND I.IIBLOCALNOVO = LOCAL_PARA.IDLOCALIZACAO(+)'
      '  AND I.IDEMPRESA = LOCAL_PARA.IDPESSOA(+)'
      'ORDER BY I.IIBFLGPLACA DESC,  I.IIBPLACA'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsInvResLev
    Left = 216
    Top = 61
  end
  object cdsInvResLev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 48
  end
  object dsInvResLev: TwwDataSource
    DataSet = cdsInvResLev
    Left = 217
    Top = 35
  end
  object ppInvResLev: TppBDEPipeline
    DataSource = dsInvResLev
    UserName = 'InvResLev'
    Left = 216
    Top = 22
  end
  object rpInvResLev: TppReport
    AutoStop = False
    DataPipeline = ppInvResLev
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    DeviceType = 'Screen'
    Left = 217
    Top = 9
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Resultado do Levantamento de Inventário Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 87842
        mmTop = 8731
        mmWidth = 108479
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'Levantamento Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        Caption = 'Data Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 17198
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = 'Encerrado em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 17198
        mmWidth = 22225
        BandType = 0
      end
      object lblSelecao: TppLabel
        UserName = 'Label4'
        Caption = 'Seleção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'IDINVENTARIOBENS'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 17198
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINILEVANT'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 17198
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIMLEVANT'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 17198
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label5'
        Caption = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 26723
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label6'
        Caption = 'DESCRIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 26723
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label7'
        Caption = 'RESULTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 26723
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'SITUAÇÃO FÍSICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 26723
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        Caption = 'LOCALIZAÇÃO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 26723
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'LOCALIZAÇÃO LEVANTADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 26723
        mmWidth = 39952
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 33602
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IIBPLACA'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESBEM'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 0
        mmWidth = 89165
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DESCFLGPLACA'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DESCFLGSITFISICA'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DESCLOCAL_DE'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 0
        mmWidth = 57944
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCLOCAL_PARA'
        DataPipeline = ppInvResLev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 0
        mmWidth = 58208
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 62971
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 265
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 265
        mmWidth = 71702
        BandType = 8
      end
    end
  end
  object MSInventBens: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Levantamento'
    Colunas.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'PESSOA.NOME'
      'INVENTARIOBENS.DATAINILEVANT'
      'INVENTARIOBENS.DATAFIMLEVANT')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº do Levantamento'
      'Responsável'
      'Data de Início'
      'Data de Término')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTARIOBENS'
      'PESSOA')
    CamposChave.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'INVENTARIOBENS.IDEMPRESA')
    Filtro.Strings = (
      'INVENTARIOBENS.IDRESPONSAVEL=PESSOA.IDPESSOA(+) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 86
    Top = 56
  end
end
