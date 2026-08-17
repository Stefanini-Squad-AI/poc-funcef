inherited RptFichaAvalPPRA: TRptFichaAvalPPRA
  Left = 247
  Top = 196
  Height = 269
  Caption = 'RptFichaAvalPPRA'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpFichaAvalPPRA
  end
  object sqlFichaAvalPPRA: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PJ.RAZAOSOCIAL AS ESTAB, PJ2.RAZAOSOCIAL AS EMPRESA, C.TITULO ' +
        'AS CARGO,'
      
        '  L.NOME AS LOCAL, H.NOMEHORARIO, PR.NOME AS RESPONSAVEL, PC.NOM' +
        'E AS CONTATO, '
      
        '  PP.IDAVAL, PP.IDHORARIO, PP.IDCARGO, PP.IDLOCALIZACAO, PP.IDPE' +
        'SSOA,'
      
        '  PP.IDEMPRESA, PP.IDESTAB, PP.IDCONTATO, PP.IDRESPONSAVEL, PP.I' +
        'NDTIPOAVAL,'
      
        '  DECODE(PP.INDTIPOAVAL,1,'#39'Antecipação'#39',2,'#39'Reconhecimento'#39','#39'Reav' +
        'aliação'#39') AS TIPOAVAL,'
      '  PP.DESCRICAO, PP.TEXTOCOMPL, PP.INDABRANGENCIA, PP.DATAAVAL'
      'FROM'
      '  PESSOA PJ, PESSOA PJ2, PESSOA PR, PESSOA PC, '
      '  PPRAAVAL PP, CARGO C, HORATRAB H, LOCALIZACAO L'
      'WHERE'
      '  (PP.IDAVAL          = 1) AND'
      '  (PP.IDRESPONSAVEL   = PR.IDPESSOA) AND'
      '  (PP.IDEMPRESA       = PJ.IDPESSOA(+)) AND'
      '  (PP.IDESTAB         = PJ2.IDPESSOA(+)) AND'
      '  (PP.IDPESSOA        = L.IDPESSOA(+)) AND'
      '  (PP.IDLOCALIZACAO   = L.IDLOCALIZACAO(+)) AND'
      '  (PP.IDHORARIO       = H.IDHORARIO(+)) AND'
      '  (PP.IDCONTATO       = PC.IDPESSOA(+)) AND'
      '  (PP.IDCARGO         = C.IDCARGO(+)) '
      ''
      ' ')
    ClientDataSet = CdsFichaAvalPPRA
    Left = 226
    Top = 198
  end
  object CdsFichaAvalPPRA: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 226
    Top = 154
    Data = {
      840300009619E0BD0100000018000000160001000000030000004B0205455354
      41420100490000000100055749445448020002003C0007454D50524553410100
      490000000100055749445448020002003C0005434152474F0100490000000100
      055749445448020002002800054C4F43414C0100490000000100055749445448
      020002003C000B4E4F4D45484F524152494F0100490000000100055749445448
      0200020028000B524553504F4E534156454C0100490000000100055749445448
      020002003C0007434F4E5441544F010049000000010005574944544802000200
      3C000649444156414C0800040000000000094944484F524152494F0800040000
      000000074944434152474F08000400000000000D49444C4F43414C495A414341
      4F0800040000000000084944504553534F410800040000000000094944454D50
      5245534108000400000000000749444553544142080004000000000009494443
      4F4E5441544F08000400000000000D4944524553504F4E534156454C08000400
      000000000B494E445449504F4156414C0800040000000000085449504F415641
      4C0100490000000100055749445448020002000E000944455343524943414F04
      004B000000020007535542545950450200490005005465787400055749445448
      02000200F4010A544558544F434F4D504C04004B000000020007535542545950
      45020049000500546578740005574944544802000200F4010E494E4441425241
      4E47454E434941080004000000000008444154414156414C0800080000000000
      0100044C4349440400010009080000005001550000002E46554E444143414F20
      5245444520464552524F56494152494120444520534547555249444144452053
      4F4349414C3646756E646163616F205265646520466572726F76696172696120
      6465205365677572696461646520536F6369616C202D2052454645521C434D20
      534F4C55434F455320494E464F524D4154494341204C5444411B434C41554449
      4120472042415243454C4F53204E4F475545495241000000000000F03F000000
      00000000400000000000B8804000000000802CC440000000001C4D3741000000
      000000F03F0B416E746563697061E7E36F200000005465737465206176616C69
      61E7E36F205050524120656D2032362F30332F30331F000000546578746F2063
      6F6D706C656D2E205050524120656D2032362F30332F3033000000000000F03F
      000078799FBBCC42}
  end
  object dsFichaAvalPPRA: TwwDataSource
    AutoEdit = False
    DataSet = CdsFichaAvalPPRA
    Left = 226
    Top = 109
  end
  object ppFichaAvalPPRA: TppBDEPipeline
    DataSource = dsFichaAvalPPRA
    UserName = 'FichaAvalPPRA'
    Left = 225
    Top = 57
    object ppFichaAvalPPRAppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFichaAvalPPRAppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFichaAvalPPRAppField3: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppFichaAvalPPRAppField4: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppFichaAvalPPRAppField5: TppField
      FieldAlias = 'NOMEHORARIO'
      FieldName = 'NOMEHORARIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppFichaAvalPPRAppField6: TppField
      FieldAlias = 'RESPONSAVEL'
      FieldName = 'RESPONSAVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppFichaAvalPPRAppField7: TppField
      FieldAlias = 'CONTATO'
      FieldName = 'CONTATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppFichaAvalPPRAppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDAVAL'
      FieldName = 'IDAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppFichaAvalPPRAppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHORARIO'
      FieldName = 'IDHORARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppFichaAvalPPRAppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARGO'
      FieldName = 'IDCARGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppFichaAvalPPRAppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLOCALIZACAO'
      FieldName = 'IDLOCALIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppFichaAvalPPRAppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppFichaAvalPPRAppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEMPRESA'
      FieldName = 'IDEMPRESA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppFichaAvalPPRAppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDESTAB'
      FieldName = 'IDESTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppFichaAvalPPRAppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTATO'
      FieldName = 'IDCONTATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppFichaAvalPPRAppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppFichaAvalPPRAppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDTIPOAVAL'
      FieldName = 'INDTIPOAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppFichaAvalPPRAppField18: TppField
      FieldAlias = 'TIPOAVAL'
      FieldName = 'TIPOAVAL'
      FieldLength = 14
      DisplayWidth = 14
      Position = 17
    end
    object ppFichaAvalPPRAppField19: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppFichaAvalPPRAppField20: TppField
      FieldAlias = 'TEXTOCOMPL'
      FieldName = 'TEXTOCOMPL'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppFichaAvalPPRAppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDABRANGENCIA'
      FieldName = 'INDABRANGENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppFichaAvalPPRAppField22: TppField
      FieldAlias = 'DATAAVAL'
      FieldName = 'DATAAVAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
  end
  object rpFichaAvalPPRA: TppReport
    AutoStop = False
    DataPipeline = ppFichaAvalPPRA
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 116681
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Ficha da Avaliação PPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 69056
        mmTop = 1058
        mmWidth = 59267
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 40217
        mmTop = 10848
        mmWidth = 116681
        BandType = 0
      end
      object rpOcorrPessLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 1058
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrPessSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 1058
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 5292
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 5292
        mmWidth = 23283
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ESTAB'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 35983
        mmWidth = 99219
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Estabelecimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 35983
        mmWidth = 27252
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'LOCAL'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 42069
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Local de Trabalho:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 42069
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cargo ou Função:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 48948
        mmWidth = 28310
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 48948
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Horário de Trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 56356
        mmWidth = 31750
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NOMEHORARIO'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 56356
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 63500
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'RESPONSAVEL'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 63500
        mmWidth = 61119
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Data da Avaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 28840
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de Avaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 28840
        mmWidth = 29369
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DATAAVAL'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 28840
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'TIPOAVAL'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 28840
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Contato na CIPA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 71438
        mmWidth = 26458
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CONTATO'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 71438
        mmWidth = 58738
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DESCRICAO'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 11642
        mmLeft = 4233
        mmTop = 82286
        mmWidth = 183092
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 77523
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Laudo Técnico Pericial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 96309
        mmWidth = 36248
        BandType = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'TEXTOCOMPL'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 11642
        mmLeft = 4234
        mmTop = 101071
        mmWidth = 183091
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 508
        mmLeft = 4234
        mmTop = 114565
        mmWidth = 188913
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'CNPJ: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 16669
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 16669
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText103'
        AutoSize = True
        DataField = 'CNAE'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 53711
        mmTop = 16669
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText104'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFichaAvalPPRA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 21960
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Ender.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object rpAgentes: TppSubReport
        UserName = 'rpAgentes'
        ExpandAll = True
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppAgentes
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 152
          Top = 120
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Agentes de Risco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 1852
              mmWidth = 29633
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 26723
            mmPrintPosition = 0
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'DESCRICAO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 28310
              mmTop = 794
              mmWidth = 127265
              BandType = 4
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Tipo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 159015
              mmTop = 794
              mmWidth = 7938
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              AutoSize = True
              DataField = 'TIPOAGENTE'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 794
              mmWidth = 22754
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'MEIOPROPAGACAO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 28310
              mmTop = 6350
              mmWidth = 118269
              BandType = 4
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Descrição:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 794
              mmWidth = 16669
              BandType = 4
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Meio Propag.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 6350
              mmWidth = 21960
              BandType = 4
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Meio Contam.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 11906
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'MEIOCONTAMINACAO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 28310
              mmTop = 11906
              mmWidth = 118004
              BandType = 4
            end
            object ppDBMemo3: TppDBMemo
              UserName = 'DBMemo3'
              CharWrap = False
              DataField = 'OBSERVACAO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 4234
              mmLeft = 4234
              mmTop = 17463
              mmWidth = 188913
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4234
              mmTop = 25135
              mmWidth = 188913
              BandType = 4
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Graduação:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 148432
              mmTop = 11906
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'GRADUACAO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 11906
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = '(1 a 4)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 175948
              mmTop = 11906
              mmWidth = 10319
              BandType = 4
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'Incidência:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 149754
              mmTop = 6350
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText18'
              DataField = 'PERIODO'
              DataPipeline = ppAgentes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 6350
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object rpMedidas: TppSubReport
        UserName = 'rpMedidas'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpAgentes
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppMedidas
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 256
          Top = 224
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Medidas Preventivas e Corretivas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 3175
              mmWidth = 56356
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 21960
            mmPrintPosition = 0
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Descrição:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 1323
              mmWidth = 16669
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText101'
              AutoSize = True
              DataField = 'DESCRICAO'
              DataPipeline = ppMedidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 33867
              mmTop = 1323
              mmWidth = 20902
              BandType = 4
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Data Planejada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 6879
              mmWidth = 25135
              BandType = 4
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Data Efetiva:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 124354
              mmTop = 6879
              mmWidth = 20373
              BandType = 4
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Equip. Proteção: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 4234
              mmTop = 12700
              mmWidth = 27252
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              AutoSize = True
              DataField = 'CLASSEBEM'
              DataPipeline = ppMedidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 33867
              mmTop = 12700
              mmWidth = 21431
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              AutoSize = True
              DataField = 'DATAPLAN'
              DataPipeline = ppMedidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 33867
              mmTop = 6879
              mmWidth = 18521
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              AutoSize = True
              DataField = 'DATAREAL'
              DataPipeline = ppMedidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 148696
              mmTop = 6879
              mmWidth = 18521
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4234
              mmTop = 19844
              mmWidth = 188913
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppSummaryBand3: TppSummaryBand
      AfterPrint = ppSummaryBand3AfterPrint
      BeforePrint = ppSummaryBand3BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'Label11'
        Caption = 'Contagem de Empregados no Contexto desta Avaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 3704
        mmWidth = 94192
        BandType = 7
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        mmHeight = 12435
        mmLeft = 4233
        mmTop = 8202
        mmWidth = 183886
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Masc. Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7408
          mmTop = 9525
          mmWidth = 19315
          BandType = 7
        end
        object lblConta1: TppLabel
          UserName = 'lblConta1'
          Caption = 'lblConta1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 9525
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Fem. Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 47624
          mmTop = 9525
          mmWidth = 17727
          BandType = 7
        end
        object lblConta2: TppLabel
          UserName = 'lblConta2'
          Caption = 'lblConta2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 68526
          mmTop = 9525
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Masc. Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7408
          mmTop = 15081
          mmWidth = 20373
          BandType = 7
        end
        object lblConta5: TppLabel
          UserName = 'lblConta5'
          Caption = 'lblConta5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 15081
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Fem. Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 47624
          mmTop = 15081
          mmWidth = 19050
          BandType = 7
        end
        object lblConta6: TppLabel
          UserName = 'lblConta6'
          Caption = 'lblConta6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 68526
          mmTop = 15081
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Defic. Masc. Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 88370
          mmTop = 9525
          mmWidth = 29369
          BandType = 7
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Defic. Masc. Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 88370
          mmTop = 15081
          mmWidth = 30427
          BandType = 7
        end
        object lblConta3: TppLabel
          UserName = 'lblConta3'
          Caption = 'lblConta3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 119326
          mmTop = 9525
          mmWidth = 15081
          BandType = 7
        end
        object lblConta7: TppLabel
          UserName = 'lblConta7'
          Caption = 'lblConta7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 119326
          mmTop = 15081
          mmWidth = 15081
          BandType = 7
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = 'Defic. Fem. Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 138641
          mmTop = 9525
          mmWidth = 28046
          BandType = 7
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = 'Defic. Fem. Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 138641
          mmTop = 15081
          mmWidth = 29104
          BandType = 7
        end
        object lblConta4: TppLabel
          UserName = 'lblConta4'
          Caption = 'lblConta4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168804
          mmTop = 9525
          mmWidth = 15081
          BandType = 7
        end
        object lblConta8: TppLabel
          UserName = 'Label301'
          Caption = 'lblConta8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168804
          mmTop = 15081
          mmWidth = 15081
          BandType = 7
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11113
          mmLeft = 45508
          mmTop = 8996
          mmWidth = 1058
          BandType = 7
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11113
          mmLeft = 85989
          mmTop = 8731
          mmWidth = 1058
          BandType = 7
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11113
          mmLeft = 136524
          mmTop = 8731
          mmWidth = 1058
          BandType = 7
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 5027
          mmTop = 14288
          mmWidth = 182298
          BandType = 7
        end
      end
    end
  end
  object ppMedidas: TppBDEPipeline
    DataSource = dsMedidas
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Medidas'
    Left = 24
    Top = 90
  end
  object dsMedidas: TwwDataSource
    DataSet = CdsMedidas
    Left = 24
    Top = 77
  end
  object CdsMedidas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 64
  end
  object ppAgentes: TppBDEPipeline
    DataSource = dsAgentes
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Agentes'
    Left = 112
    Top = 90
    object ppAgentesppField1: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField2: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField4: TppField
      FieldAlias = 'TIPOAGENTE'
      FieldName = 'TIPOAGENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField5: TppField
      FieldAlias = 'MEIOPROPAGACAO'
      FieldName = 'MEIOPROPAGACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAgentesppField6: TppField
      FieldAlias = 'MEIOCONTAMINACAO'
      FieldName = 'MEIOCONTAMINACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsAgentes: TwwDataSource
    DataSet = CdsAgentes
    Left = 112
    Top = 77
  end
  object CdsAgentes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 64
  end
  object sqlAgentes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  (CASE'
      '     WHEN PA.INDPERIODO = 1 THEN '#39'Habitual'#39
      '     ELSE '#39'Ocasional'#39
      '   END) AS PERIODO,'
      '  PA.OBSERVACAO,'
      '  PR.DESCRICAO,'
      '  PA.GRADUACAO,'
      '  (CASE'
      '     WHEN PR.INDTIPO = 1 THEN '#39'Químico'#39
      '     WHEN PR.INDTIPO = 2 THEN '#39'Biológico'#39
      '     WHEN PR.INDTIPO = 3 THEN '#39'Físico'#39
      '     WHEN PR.INDTIPO = 4 THEN '#39'Ergonômico'#39
      '     WHEN PR.INDTIPO = 5 THEN '#39'Mecânico'#39
      '   END) AS TIPOAGENTE,'
      '  PM1.DESCRICAO AS MEIOPROPAGACAO,'
      '  PM2.DESCRICAO AS MEIOCONTAMINACAO'
      'FROM'
      
        '  PPRAAGENTEAVAL PA, PPRAAGENTERISCO PR, PPRAMEIO PM1, PPRAMEIO ' +
        'PM2'
      'WHERE'
      '  (PA.IDAVAL         = :IDAVAL) AND'
      '  (PA.IDAGENTERISCO  = PR.IDAGENTERISCO) AND'
      '  (PA.IDPPRAMEIOPROP = PM1.IDPPRAMEIO(+)) AND'
      '  (PA.IDPPRAMEIOCONT = PM2.IDPPRAMEIO(+))'
      'ORDER BY'
      '  PR.DESCRICAO')
    ClientDataSet = CdsAgentes
    Left = 115
    Top = 142
  end
  object sqlMedidas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    PM.DATAPLAN, PM.DATAREAL,'
      '    PA.DESCRICAO, CB.DESCRICAO AS CLASSEBEM'
      '    FROM'
      '      PPRAACOES PA, PPRAMEDIDAS PM, CLASSEDEBEM CB'
      '    WHERE'
      '        (PM.IDAVAL   = :IDAVAL)'
      '    AND (PM.IDACOES = PA.IDACOES)'
      '    AND (PM.IDCLASSEBEM = CB.IDCLASSEBEM(+))'
      '    ORDER BY UPPER(PA.DESCRICAO)')
    ClientDataSet = CdsMedidas
    Left = 27
    Top = 142
  end
  object CdsContagem: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 74
    Top = 193
  end
end
