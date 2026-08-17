inherited frmCadCertifRetencaoMT: TfrmCadCertifRetencaoMT
  Left = 342
  Top = 298
  Caption = 'Certificado de Retenção - Configura'
  ClientHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 176
    inherited PnlCadastro: TPanel [0]
      Height = 174
      inherited Label1: TLabel
        Left = 12
        Top = 22
      end
      object Label3: TLabel [1]
        Left = 12
        Top = 105
        Width = 99
        Height = 13
        Caption = 'Nome do Imposto'
      end
      object Label4: TLabel [2]
        Left = 11
        Top = 64
        Width = 144
        Height = 13
        Caption = 'Máscara P Nº Certificado'
      end
      inherited DeRelatorio: TwwDBEdit
        Left = 12
        Top = 39
        Width = 385
        DataField = 'DESCCERTIFICAGREG'
      end
      inherited BtnDesenho: TBitBtn
        Left = 411
        Top = 69
        TabOrder = 3
      end
      object dblkImposto: TwwDBLookupCombo
        Left = 12
        Top = 121
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTAGREG'#9'25'#9'Descrição')
        DataField = 'CODTIPOCUSTAGREG'
        DataSource = ds
        LookupTable = cdsImpAgreg
        LookupField = 'CODTIPOCUSTAGREG'
        DropDownWidth = 400
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBEdit1: TwwDBEdit
        Left = 11
        Top = 80
        Width = 165
        Height = 21
        Hint = 
          'Ultilize "YYYY" ou "YY" para ano, "MM" para mes, "DD" para dia, ' +
          '"#" para número sequencial'
        CharCase = ecUpperCase
        DataField = 'MASCARA'
        DataSource = ds
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited PnlImprime: TPanel [1]
      Height = 174
      inherited Label2: TLabel
        Left = 180
        Top = 11
        Width = 204
        Caption = 'Modelo a ser utilizado na Impressão'
      end
      inherited CmbModelo: TCMDBLookupCombo
        Left = 179
        Top = 27
        Width = 342
        Selected.Strings = (
          'DESCCERTIFICAGREG'#9'60'#9'Descrição'#9'F')
        LookupField = 'IDCERTIFICAGREG'
        Enabled = False
        OnCloseUp = CmbModeloCloseUp
      end
      object BitBtn1: TBitBtn
        Left = 13
        Top = 10
        Width = 155
        Height = 42
        Caption = 'Seleciona Retenção'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00700000000000
          777770BBBBBBBBB3077770BBBBBBBBB3307770BB03330BB3330770BB00000BB3
          330770BBBBBBBBB3330770000000000333077707777777703307770FFFFFF008
          0307770FFFFF07778007778880007FF0780777770777FF07F0777777707FF07F
          F0777777770F07FF0877777777707F0077777777777800777777}
      end
      object CkbSumLote: TCheckBox
        Left = 13
        Top = 64
        Width = 504
        Height = 17
        Caption = 
          'Totaliza Impostos de todos os documento inclusos no lote do docu' +
          'mento selecionado'
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 13
        Top = 103
        Width = 510
        Height = 49
        Caption = ' Dados do imposto a ser impresso '
        TabOrder = 3
        object DBText1: TDBText
          Left = 13
          Top = 30
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataSource = DsDados
        end
        object DBText2: TDBText
          Left = 325
          Top = 30
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'DATARETENCAO'
          DataSource = DsDados
        end
        object DBText3: TDBText
          Left = 455
          Top = 30
          Width = 50
          Height = 13
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'VLRRETIDO'
          DataSource = DsDados
        end
        object Label5: TLabel
          Left = 13
          Top = 15
          Width = 76
          Height = 13
          Caption = 'Razão Social'
        end
        object Label6: TLabel
          Left = 325
          Top = 15
          Width = 87
          Height = 13
          Caption = 'Data Retenção'
        end
        object Label7: TLabel
          Left = 475
          Top = 15
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 223
    inherited tb97Fundo: TToolbar97
      inherited BtnImprime: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 60
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 26
    Top = 102
  end
  inherited ImlPadrao: TImageList
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 26
    Top = 60
    Data = {
      BD0000009619E0BD010000001800000006000000000003000000BD000F494443
      4552544946494341475245470800040000000000114445534343455254494649
      4341475245470100490000000100055749445448020002003C0010434F445449
      504F43555354414752454708000400000000000949445245504F525453080004
      0000000000084F524947454D434D0800040000000000074D4153434152410100
      4900000001000557494454480200020014000100044C43494404000100090800
      00}
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CERTIFICAGREG.DESCCERTIFICAGREG')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'CERTIFICAGREG')
    CamposChave.Strings = (
      'CERTIFICAGREG.IDCERTIFICAGREG')
    Top = 60
  end
  inherited Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDCERTIFICAGREG, '
      '  DESCCERTIFICAGREG, '
      '  CODTIPOCUSTAGREG, '
      '  IDREPORTS, '
      '  ORIGEMCM, '
      '  MASCARA'
      'FROM '
      '  CERTIFICAGREG'
      'WHERE'
      '  IDCERTIFICAGREG = :IDCERTIFICAGREG'
      '')
    Left = 26
    Top = 13
  end
  inherited MergeMenu: TMainMenu
    Left = 322
    Top = 162
  end
  inherited DsgnCM: TppDesigner
    Top = 102
  end
  inherited RptModelo: TppReport
    PassSetting = psTwoPass
    PrinterSetup.DocumentName = 'RptModelo'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    Units = utMillimeters
    Left = 262
    Top = 102
    mmColumnWidth = 0
    DataPipelineName = 'PpDados'
    inherited ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmHeight = 165894
      object RptModeloLabel1: TppLabel
        UserName = 'RptModeloLabel1'
        Caption = 'Modelo de Certificado de Retenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 28575
        mmWidth = 58716
        BandType = 4
      end
      object RptModeloLabel2: TppLabel
        UserName = 'RptModeloLabel2'
        Caption = 'IMPOSTO XYZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 37042
        mmWidth = 24172
        BandType = 4
      end
      object LogoEmpresa: TppImage
        UserName = 'LogoEmpresa'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 27517
        mmLeft = 5556
        mmTop = 43656
        mmWidth = 18256
        BandType = 4
      end
      object RptModeloLabel3: TppLabel
        UserName = 'RptModeloLabel3'
        Caption = 'EMPRESA S.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 46038
        mmWidth = 24680
        BandType = 4
      end
      object RptModeloLabel4: TppLabel
        UserName = 'RptModeloLabel4'
        Caption = 'Av. Brasil, S/N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 50800
        mmWidth = 22564
        BandType = 4
      end
      object RptModeloLabel5: TppLabel
        UserName = 'RptModeloLabel5'
        Caption = 'Rio de Janeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 55563
        mmWidth = 22606
        BandType = 4
      end
      object RptModeloLabel6: TppLabel
        UserName = 'RptModeloLabel6'
        Caption = 'Tel: (21) 1234-5678'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 60325
        mmWidth = 30861
        BandType = 4
      end
      object RptModeloLabel7: TppLabel
        UserName = 'RptModeloLabel7'
        Caption = 'CNPJ 123456789'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 65617
        mmWidth = 27686
        BandType = 4
      end
      object RptModeloLabel8: TppLabel
        UserName = 'RptModeloLabel8'
        Caption = 
          'EMPRESA  S.A. certifica que ha  valores retidos em conceito de i' +
          'mposto aos ganhos de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 5556
        mmTop = 83344
        mmWidth = 122502
        BandType = 4
      end
      object RptModeloDBText1: TppDBText
        UserName = 'RptModeloDBText1'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 87577
        mmWidth = 25665
        BandType = 4
      end
      object RptModeloDBText2: TppDBText
        UserName = 'RptModeloDBText2'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 92340
        mmWidth = 25929
        BandType = 4
      end
      object RptModeloLabel9: TppLabel
        UserName = 'RptModeloLabel9'
        Caption = 'situado em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 92340
        mmWidth = 17230
        BandType = 4
      end
      object RptModeloDBText3: TppDBText
        UserName = 'RptModeloDBText3'
        DataField = 'NUMERO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 142082
        mmTop = 92340
        mmWidth = 19844
        BandType = 4
      end
      object RptModeloLabel10: TppLabel
        UserName = 'RptModeloLabel10'
        Caption = 'Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137584
        mmTop = 92340
        mmWidth = 3704
        BandType = 4
      end
      object RptModeloLabel11: TppLabel
        UserName = 'RptModeloLabel11'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 97367
        mmWidth = 3704
        BandType = 4
      end
      object RptModeloDBText4: TppDBText
        UserName = 'RptModeloDBText4'
        DataField = 'BAIRRO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 97367
        mmWidth = 35719
        BandType = 4
      end
      object RptModeloDBText5: TppDBText
        UserName = 'RptModeloDBText5'
        DataField = 'CIDADE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 46038
        mmTop = 97367
        mmWidth = 37306
        BandType = 4
      end
      object RptModeloDBText6: TppDBText
        UserName = 'RptModeloDBText6'
        DataField = 'NOMEESTADO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 97367
        mmWidth = 46567
        BandType = 4
      end
      object RptModeloDBText7: TppDBText
        UserName = 'RptModeloDBText7'
        DataField = 'NOMEPAIS'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 131234
        mmTop = 97367
        mmWidth = 30692
        BandType = 4
      end
      object RptModeloLabel12: TppLabel
        UserName = 'RptModeloLabel12'
        Caption = 'CUIT /CUIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 102394
        mmWidth = 16933
        BandType = 4
      end
      object RptModeloDBText8: TppDBText
        UserName = 'RptModeloDBText8'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 102394
        mmWidth = 28575
        BandType = 4
      end
      object RptModeloLabel13: TppLabel
        UserName = 'RptModeloLabel13'
        Caption = 
          'de acordo com o disposto na Resolução Geral 12345 e suas modific' +
          'ações segundo detalhe no documento.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 12171
        mmLeft = 5556
        mmTop = 107421
        mmWidth = 132292
        BandType = 4
      end
      object RptModeloLabel14: TppLabel
        UserName = 'RptModeloLabel14'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 133615
        mmWidth = 20373
        BandType = 4
      end
      object RptModeloLine1: TppLine
        UserName = 'RptModeloLine1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 5556
        mmTop = 132557
        mmWidth = 48683
        BandType = 4
      end
      object RptModeloLabel15: TppLabel
        UserName = 'RptModeloLabel15'
        Caption = 'CERTIFICADO DE RETENÇÃO Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 174096
        mmTop = 36513
        mmWidth = 55203
        BandType = 4
      end
      object RptModeloShape1: TppShape
        UserName = 'RptModeloShape1'
        mmHeight = 47625
        mmLeft = 173832
        mmTop = 70115
        mmWidth = 102923
        BandType = 4
      end
      object RptModeloLabel16: TppLabel
        UserName = 'RptModeloLabel16'
        Caption = 'CONCEPTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176213
        mmTop = 73025
        mmWidth = 19050
        BandType = 4
      end
      object RptModeloLabel17: TppLabel
        UserName = 'RptModeloLabel17'
        Caption = 'VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 78317
        mmWidth = 24299
        BandType = 4
      end
      object RptModeloLabel18: TppLabel
        UserName = 'RptModeloLabel18'
        Caption = 'NÃO SUJEITO A RETENÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 83608
        mmWidth = 47329
        BandType = 4
      end
      object RptModeloLabel19: TppLabel
        UserName = 'RptModeloLabel19'
        Caption = 'IMPORTE SUJEITO A RETENÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 88900
        mmWidth = 55753
        BandType = 4
      end
      object RptModeloLabel20: TppLabel
        UserName = 'RptModeloLabel20'
        Caption = 'RETIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 95779
        mmWidth = 13335
        BandType = 4
      end
      object RptModeloLabel21: TppLabel
        UserName = 'RptModeloLabel21'
        Caption = 'COTA FIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 101071
        mmWidth = 18627
        BandType = 4
      end
      object RptModeloLabel22: TppLabel
        UserName = 'RptModeloLabel22'
        Caption = 'TOTAL RETIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 106363
        mmWidth = 25739
        BandType = 4
      end
      object RptModeloLabel23: TppLabel
        UserName = 'RptModeloLabel23'
        Caption = 'VALOR LÍQUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176213
        mmTop = 111125
        mmWidth = 27347
        BandType = 4
      end
      object LblTotal: TppDBText
        Tag = 999
        UserName = 'LblTotal'
        AutoSize = True
        DataField = 'VLRRETIDO'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 254265
        mmTop = 106363
        mmWidth = 20373
        BandType = 4
      end
      object LblSujeito: TppDBText
        Tag = 999
        UserName = 'LblSujeito'
        AutoSize = True
        DataField = 'VALORBASECALCULO'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 235480
        mmTop = 88900
        mmWidth = 39158
        BandType = 4
      end
      object LblValor: TppDBText
        Tag = 999
        UserName = 'LblValor'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 262467
        mmTop = 78317
        mmWidth = 12171
        BandType = 4
      end
      object RptModeloDBText9: TppDBText
        UserName = 'RptModeloDBText9'
        AutoSize = True
        DataField = 'DESCCUSTAGREG'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 242359
        mmTop = 73025
        mmWidth = 32279
        BandType = 4
      end
      object LblTotal2: TppDBText
        UserName = 'LblTotal2'
        AutoSize = True
        DataField = 'VLRABATVALOR'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 245534
        mmTop = 101071
        mmWidth = 29104
        BandType = 4
      end
      object RptModeloDBText15: TppDBText
        UserName = 'RptModeloDBText15'
        AutoSize = True
        DataField = 'PERCCUSTAGREG'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00000 % '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 242359
        mmTop = 95515
        mmWidth = 32279
        BandType = 4
      end
      object LblLiquido: TppDBText
        Tag = 999
        UserName = 'LblLiquido'
        AutoSize = True
        DataField = 'VALORLIQUIDO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 247650
        mmTop = 111125
        mmWidth = 26988
        BandType = 4
      end
      object LblFixo: TppDBText
        Tag = 999
        UserName = 'LblFixo'
        AutoSize = True
        DataField = 'VLRABATFIXO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 249767
        mmTop = 83608
        mmWidth = 24871
        BandType = 4
      end
      object RptModeloDBText14: TppDBText
        UserName = 'RptModeloDBText14'
        AutoSize = True
        DataField = 'NUMCERTIFICADO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 232040
        mmTop = 36513
        mmWidth = 32015
        BandType = 4
      end
      object RptModeloLabel24: TppLabel
        UserName = 'RptModeloLabel24'
        Caption = 'Corresponde a(s) Fatura(s) Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 174096
        mmTop = 41275
        mmWidth = 49953
        BandType = 4
      end
      object EdtUmaFatura: TppDBText
        UserName = 'EdtUmaFatura'
        AutoSize = True
        DataField = 'NUMFATURA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 228600
        mmTop = 41275
        mmWidth = 21960
        BandType = 4
      end
      object EdtAllFaturas: TppDBMemo
        UserName = 'EdtAllFaturas'
        CharWrap = True
        DataField = 'ALLFATURAS'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 5027
        mmLeft = 174096
        mmTop = 46302
        mmWidth = 101865
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptModeloCalc1: TppSystemVariable
        UserName = 'RptModeloCalc1'
        VarType = vtDateTime
        DisplayFormat = '"Rio de Janeiro, " dd " de " mmmm " de " yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 75142
        mmWidth = 68749
        BandType = 4
      end
    end
    inherited raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  inherited PpDados: TppBDEPipeline
    Left = 209
    Top = 102
    object PpDadosppField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDadosppField2: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDadosppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDadosppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDadosppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDadosppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDadosppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDadosppField8: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDadosppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDadosppField10: TppField
      FieldAlias = 'NOMEPAIS'
      FieldName = 'NOMEPAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDadosppField11: TppField
      FieldAlias = 'NOMEESTADO'
      FieldName = 'NOMEESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDadosppField12: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDadosppField13: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDadosppField14: TppField
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDadosppField15: TppField
      FieldAlias = 'VLRRETIDO'
      FieldName = 'VLRRETIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDadosppField16: TppField
      FieldAlias = 'DATARETENCAO'
      FieldName = 'DATARETENCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDadosppField17: TppField
      FieldAlias = 'VLRABATVALOR'
      FieldName = 'VLRABATVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDadosppField18: TppField
      FieldAlias = 'PERCCUSTAGREG'
      FieldName = 'PERCCUSTAGREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDadosppField19: TppField
      FieldAlias = 'PERCBASE'
      FieldName = 'PERCBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpDadosppField20: TppField
      FieldAlias = 'DESCCUSTAGREG'
      FieldName = 'DESCCUSTAGREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpDadosppField21: TppField
      FieldAlias = 'VLRABATFIXO'
      FieldName = 'VLRABATFIXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpDadosppField22: TppField
      FieldAlias = 'VALORBASECALCULO'
      FieldName = 'VALORBASECALCULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpDadosppField23: TppField
      FieldAlias = 'VALORLIQUIDO'
      FieldName = 'VALORLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpDadosppField24: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpDadosppField25: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpDadosppField26: TppField
      FieldAlias = 'NUMCERTIFICADO'
      FieldName = 'NUMCERTIFICADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpDadosppField27: TppField
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpDadosppField28: TppField
      FieldAlias = 'NUMLANCTO'
      FieldName = 'NUMLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object PpDadosppField29: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object PpDadosppField30: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object PpDadosppField31: TppField
      FieldAlias = 'IDIMPOSTORETIDO'
      FieldName = 'IDIMPOSTORETIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object PpDadosppField32: TppField
      FieldAlias = 'ALLFATURAS'
      FieldName = 'ALLFATURAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
  end
  inherited DsDados: TwwDataSource
    Left = 148
    Top = 102
  end
  inherited CdsModelo: TCMClientDataSet
    Left = 87
    Top = 60
  end
  inherited SqlModelo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDCERTIFICAGREG, '
      '  DESCCERTIFICAGREG, '
      '  CODTIPOCUSTAGREG, '
      '  IDREPORTS, ORIGEMCM, MASCARA'
      'FROM '
      '  CERTIFICAGREG'
      'WHERE'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG')
    Left = 87
    Top = 13
  end
  inherited SqlDados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  P.RAZAOSOCIAL, P.NUMDOCUMENTO,'
      
        '  E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CIDADE, E.C' +
        'EP,'
      '  C.NOME, PA.NOMEPAIS, ES.NOMEESTADO,'
      '  L.DATALANCTO,  I.VLRBASE, I.VLRRETIDO, I.DATARETENCAO,'
      '  F.VLRABATVALOR, F.PERCCUSTAGREG, F.PERCBASE, T.DESCCUSTAGREG,'
      '  T.VLRABATFIXO, (L.VALOR - T.VLRABATFIXO) AS VALORBASECALCULO,'
      
        '  (L.VALOR - I.VLRRETIDO) AS VALORLIQUIDO, D.NODOCUMENTO, D.COMP' +
        'LDOCUMENTO,'
      
        '  LO.NUMRECIBO AS NUMCERTIFICADO, LNF.NUMFATURA, I.NUMLANCTO AS ' +
        'NUMLANCTO, L.CODDOCUMENTO, I.IDFORCLI, I.IDIMPOSTORETIDO,'
      '  TVALOR.VALOR'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  PESSOA P,'
      '  ENDPESS E,'
      '  CIDADES C,'
      '  ESTADO ES,'
      '  PAIS PA,'
      '  IMPOSTORETIDO I,'
      '  FAIXATIPOAGREG F,'
      '  TIPOAGRE T,'
      ''
      '  LANCTODOCUM LO,'
      ''
      '  DOCUMENTO DNF,'
      '  LANCTODOCUM LNF,'
      ''
      '  (SELECT D.CODDOCUMENTO,'
      '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1)) as VALOR'
      '     FROM DOCUMENTO D,'
      '          LANCTODOCUM L'
      '     WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '       AND (D.OPERACAO = L.OPERACAO)'
      '    GROUP BY D.CODDOCUMENTO )  TVALOR'
      ''
      ''
      'WHERE'
      '  (I.IDIMPOSTORETIDO = :IDIMPOSTORETIDO) AND'
      '  (F.VLRINICIALFAIXA <= I.VLRBASE)  AND'
      '   ((F.VLRFINALFAIXA >= I.VLRBASE) OR (VLRFINALFAIXA = 0)) AND'
      '  (L.ESTORNO IS NULL) AND'
      '  (I.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND'
      '  (D.CODDOCUMENTO = I.CODDOCUMENTO) AND'
      '  (L.OPERACAO = '#39'5'#39') AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (L.CODDOCUMENTO = TVALOR.CODDOCUMENTO) AND'
      ''
      '  (D.IDFORCLI = P.IDPESSOA) AND'
      '  (P.IDENDCOMERCIAL = E.IDENDERECO(+)) AND'
      '  (E.IDCIDADES = C.IDCIDADES(+)) AND'
      '  (C.CODESTADO = ES.CODESTADO(+)) AND'
      '  (ES.IDPAIS   = PA.IDPAIS(+)) AND'
      ''
      '  (I.NUMLANCTO    = LO.NUMLANCTO) AND'
      '  (D.CODDOCUMENTO = LO.CODDOCUMENTO) AND'
      ''
      ''
      '  (I.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND'
      '  (DNF.CODDOCUMENTO = LNF.CODDOCUMENTO) AND'
      '  (DNF.OPERACAO = LNF.OPERACAO) AND'
      '  (D.CODDOCUMENTO = DNF.CODDOCUMENTO)'
      ' '
      ' ')
    Left = 148
    Top = 13
  end
  inherited CdsDados: TCMClientDataSet
    Left = 148
    Top = 60
    object CdsDadosRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDadosNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object CdsDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsDadosCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object CdsDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsDadosNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object CdsDadosNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object CdsDadosDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object CdsDadosVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosVLRBASE: TFloatField
      FieldName = 'VLRBASE'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosVLRRETIDO: TFloatField
      FieldName = 'VLRRETIDO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosDATARETENCAO: TDateTimeField
      FieldName = 'DATARETENCAO'
    end
    object CdsDadosVLRABATVALOR: TFloatField
      FieldName = 'VLRABATVALOR'
    end
    object CdsDadosPERCCUSTAGREG: TFloatField
      FieldName = 'PERCCUSTAGREG'
    end
    object CdsDadosPERCBASE: TFloatField
      FieldName = 'PERCBASE'
    end
    object CdsDadosDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object CdsDadosVLRABATFIXO: TFloatField
      FieldName = 'VLRABATFIXO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosVALORBASECALCULO: TFloatField
      FieldName = 'VALORBASECALCULO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosVALORLIQUIDO: TFloatField
      FieldName = 'VALORLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDadosNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDadosCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDadosNUMCERTIFICADO: TStringField
      FieldName = 'NUMCERTIFICADO'
      Size = 60
    end
    object CdsDadosNUMFATURA: TStringField
      FieldName = 'NUMFATURA'
      Size = 60
    end
    object CdsDadosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object CdsDadosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDadosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsDadosIDIMPOSTORETIDO: TFloatField
      FieldName = 'IDIMPOSTORETIDO'
    end
    object CdsDadosALLFATURAS: TStringField
      FieldKind = fkCalculated
      FieldName = 'ALLFATURAS'
      Size = 255
      Calculated = True
    end
  end
  inherited SqlReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
    Left = 209
    Top = 13
  end
  inherited CdsReports: TCMClientDataSet
    Left = 209
    Top = 60
  end
  object MsRetencao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.DATALANCTO'
      'IMPOSTORETIDO.DATARETENCAO'
      'TIPOAGRE.DESCCUSTAGREG'
      'PESSOA.RAZAOSOCIAL'
      'LOTEPAGTO.NUMLOTE'
      'LOTEPAGTO.DATAEMISSAO'
      'LOTEPAGTO.NUMSLIP')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'D'
      'C'
      'C'
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Nº do Documento'
      'Valor do Documento'
      'Data Lançamento'
      'Data Retenção'
      'Nome Imposto'
      'Razão Social'
      'Num. Lote'
      'Data Emissão'
      'Nº Ordem de Pagto')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'PESSOA'
      'LANCTODOCUM'
      'IMPOSTORETIDO'
      'TIPOAGRE'
      'LOTEPAGTO'
      'LOTEXDOCUM')
    CamposChave.Strings = (
      'TIPOAGRE.CODTIPOCUSTAGREG'
      'IMPOSTORETIDO.IDIMPOSTORETIDO'
      'LOTEXDOCUM.NUMLOTE')
    Filtro.Strings = (
      'TIPOAGRE.CODTIPOCUSTAGREG=IMPOSTORETIDO.CODTIPOCUSTAGREG'
      'DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA'
      'DOCUMENTO.CODDOCUMENTO=LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.CODDOCUMENTO=IMPOSTORETIDO.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO=LANCTODOCUM.OPERACAO'
      'IMPOSTORETIDO.VLRRETIDO <> 0'
      '(LOTEPAGTO.FLAGCANCEL <> '#39'C'#39' OR LOTEPAGTO.FLAGCANCEL IS NULL)'
      'LOTEXDOCUM.NUMLOTE = LOTEPAGTO.NUMLOTE(+)'
      'IMPOSTORETIDO.CODDOCUMENTO = LOTEXDOCUM.CODDOCUMENTO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '25'
      '60'
      '10'
      '10'
      '11')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 262
    Top = 162
  end
  object sqlImpAgreg: TCMSqlParams
    SQL.Strings = (
      '  SELECT'
      '   TIPOAGRE.DESCCUSTAGREG,'
      '   TIPOAGRE.CODTIPOCUSTAGREG'
      '  FROM'
      '   TIPOAGRE, TIPOALTERADOR'
      '  WHERE'
      '   TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)'
      '')
    ClientDataSet = cdsImpAgreg
    Left = 26
    Top = 162
  end
  object cdsImpAgreg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 210
  end
  object CdsMontaNumFatura: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 87
    Top = 210
  end
  object SQLMontaNumFatura: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  I.IDIMPOSTORETIDO, I.VLRBASE, I.VLRRETIDO, L.NUMFATURA'
      'FROM'
      '  IMPOSTORETIDO I, LANCTODOCUM L'
      'WHERE'
      '  IDFORCLI = :IDFORCLI AND'
      
        '  TO_CHAR(DATARETENCAO,'#39'MM/YYYY'#39') = TO_CHAR(:DATARETENCAO,'#39'MM/YY' +
        'YY'#39') AND'
      '  I.NUMLANCTOORIGEM = L.NUMLANCTO AND'
      '  I.CODDOCUMENTO = L.CODDOCUMENTO'
      'ORDER BY'
      '  IDIMPOSTORETIDO DESC'
      ' ')
    ClientDataSet = CdsMontaNumFatura
    Left = 87
    Top = 162
  end
  object SQLSumImpLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SUM(DECODE(L.DEBCRE,'#39'D'#39','
      '      DECODE(D.RECPAG,'#39'P'#39',L.VALOR * -1, L.VALOR),'
      '      DECODE(D.RECPAG,'#39'R'#39',L.VALOR * -1, L.VALOR))) AS VALOR,'
      '  VLRABATFIXO,'
      '  (SUM(L.VALOR) - T.VLRABATFIXO) AS VALORBASECALCULO,'
      '  SUM(I.VLRRETIDO) AS VLRRETIDO,'
      '  SUM((L.VALOR - I.VLRRETIDO)) AS VALORLIQUIDO'
      'FROM'
      
        '  DOCUMENTO D, LANCTODOCUM L, IMPOSTORETIDO I, TIPOAGRE T, LOTEX' +
        'DOCUM LX'
      'WHERE'
      '  (I.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '  (LX.NUMLOTE = :NUMLOTE) AND'
      '  (L.ESTORNO IS NULL) AND'
      '  (I.NUMLANCTOORIGEM    = L.NUMLANCTO)    AND'
      '  (I.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND'
      '  (LX.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      'GROUP BY'
      '  VLRABATFIXO')
    ClientDataSet = CdsSumImpLote
    Left = 148
    Top = 162
  end
  object CdsSumImpLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 210
  end
  object PpSumImpLote: TppBDEPipeline
    DataSource = DsSumImpLote
    UserName = 'PpSumImpLote'
    Left = 209
    Top = 162
  end
  object DsSumImpLote: TwwDataSource
    DataSet = CdsSumImpLote
    Left = 209
    Top = 210
  end
end
