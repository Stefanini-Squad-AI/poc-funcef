inherited frmParamRelMovReserva_EspFCRT: TfrmParamRelMovReserva_EspFCRT
  Left = 351
  Top = 204
  Caption = 'Extrato de Reservas - BrTPREV'
  ClientHeight = 409
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 370
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 368
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object grpPedeAno: TGroupBox
        Left = 360
        Top = 278
        Width = 170
        Height = 68
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 11
          Width = 111
          Height = 13
          Caption = 'Ano de Referência '
        end
        object edAnoRef: TMaskEdit
          Left = 8
          Top = 25
          Width = 82
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
        end
        object chkIncluiMesesAnteriores: TCheckBox
          Left = 8
          Top = 47
          Width = 155
          Height = 17
          Caption = 'Incluir Meses Anteriores'
          TabOrder = 1
          Visible = False
        end
      end
      object grpPedeMes: TGroupBox
        Left = 360
        Top = 278
        Width = 170
        Height = 68
        TabOrder = 2
        object Label15: TLabel
          Left = 8
          Top = 12
          Width = 112
          Height = 13
          Caption = 'Mês de Referência '
        end
        object lblObsTrimestral: TLabel
          Left = 7
          Top = 24
          Width = 115
          Height = 13
          Caption = '(indique o mês final)'
        end
        object edMesCobIni: TMaskEdit
          Left = 6
          Top = 38
          Width = 82
          Height = 21
          EditMask = '!9999/99;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 7
          ParentFont = False
          TabOrder = 0
          Text = '    /  '
        end
      end
      object rgrpTipo: TRadioGroup
        Left = 26
        Top = 278
        Width = 326
        Height = 68
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Mensal'
          'Trimestral'
          'Consolidado')
        TabOrder = 3
        TabStop = True
        OnClick = rgrpTipoClick
      end
      object pgctrlExtrato: TPageControl
        Left = 10
        Top = 11
        Width = 519
        Height = 266
        ActivePage = tbsIndividual
        TabOrder = 0
        object tbsIndividual: TTabSheet
          Caption = 'Extrato Individual'
          object GroupBox5: TGroupBox
            Left = 9
            Top = 13
            Width = 499
            Height = 168
            Caption = ' Escolha o Participante ... '
            TabOrder = 0
            object Label9: TLabel
              Left = 12
              Top = 32
              Width = 69
              Height = 13
              Caption = 'Participante'
            end
            object Label10: TLabel
              Left = 12
              Top = 73
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label11: TLabel
              Left = 12
              Top = 118
              Width = 71
              Height = 13
              Caption = 'Inscrição Nº'
            end
            object Label12: TLabel
              Left = 153
              Top = 73
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label13: TLabel
              Left = 153
              Top = 118
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object edParticipante: TEdit
              Left = 12
              Top = 49
              Width = 386
              Height = 21
              Color = clActiveBorder
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edMatricula: TEdit
              Left = 12
              Top = 91
              Width = 121
              Height = 21
              Color = clActiveBorder
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edNumInsc: TEdit
              Left = 12
              Top = 133
              Width = 121
              Height = 21
              Color = clActiveBorder
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edPatrocinadora: TEdit
              Left = 153
              Top = 91
              Width = 245
              Height = 21
              Color = clActiveBorder
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edPlano: TEdit
              Left = 153
              Top = 133
              Width = 245
              Height = 21
              Color = clActiveBorder
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object BitBtn1: TBitBtn
              Left = 402
              Top = 37
              Width = 88
              Height = 33
              Hint = 'Procurar Processo de Benefício'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = bbtnProcurarClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
          end
        end
        object tbsGrupo: TTabSheet
          Caption = 'Extrato em Lote'
          ImageIndex = 1
          object Label2: TLabel
            Left = 12
            Top = 6
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label3: TLabel
            Left = 12
            Top = 44
            Width = 129
            Height = 13
            Caption = 'Situação na Fundação'
          end
          object Label4: TLabel
            Left = 385
            Top = 6
            Width = 110
            Height = 13
            Caption = 'Lista de Matrículas'
          end
          object dblkpcmbPatro: TwwDBLookupCombo
            Left = 12
            Top = 21
            Width = 364
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora'#9'F')
            LookupTable = cdsPatro
            LookupField = 'IDPESSOA'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dbgrdSituacao: TwwDBGrid
            Left = 12
            Top = 60
            Width = 364
            Height = 172
            ControlType.Strings = (
              'FILTRA;CheckBox;1;0')
            Selected.Strings = (
              'FILTRA'#9'4'#9'FILTRA'
              'DESCRICAO'#9'50'#9'DESCRICAO')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsSituacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object memMatriculas: TMemo
            Left = 385
            Top = 21
            Width = 117
            Height = 211
            Hint = 'Digite uma matrícula por linha ...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 354
      DockPos = 354
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 185
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 474
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV = 33')
    Mascaras.Strings = (
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
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 16
    Top = 417
  end
  object cdsMensal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 207
    Top = 480
  end
  object ppMensal: TppBDEPipeline
    DataSource = dsMensal
    UserName = 'lExemplo1'
    Left = 207
    Top = 385
  end
  object rpMensal: TppReport
    AutoStop = False
    DataPipeline = ppMensal
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 204
    Top = 331
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppMensal'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        ParentHeight = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 0
        mmWidth = 185738
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATA_LANCAMENTO'
        DataPipeline = ppMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 8731
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCRICAO'
        DataPipeline = ppMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 265
        mmWidth = 73819
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT_COTA'
        DataPipeline = ppMensal
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 128059
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR_DA_COTA'
        DataPipeline = ppMensal
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_EM_REAL'
        DataPipeline = ppMensal
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 39423
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 126471
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 151077
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMensal'
        mmHeight = 3175
        mmLeft = 114300
        mmTop = 265
        mmWidth = 11642
        BandType = 4
      end
    end
    object ppRodapeMensal: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSumarioMensal: TppSummaryBand
      BeforePrint = ppSumarioMensalBeforePrint
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppMensal
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppMensal'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 44715
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 14737632
          mmHeight = 7144
          mmLeft = 137319
          mmTop = 36777
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label11'
          Caption = 'Extrato de Conta - Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 67469
          mmTop = 31750
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Extrato para Simples Conferência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 69321
          mmTop = 38365
          mmWidth = 56886
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'MESREFERENCIA1'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 4233
          mmLeft = 158486
          mmTop = 38365
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Mês Ref. : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 139965
          mmTop = 38365
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label8'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 25929
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'PARTICIPANTE'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 25929
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label9'
          Caption = 'Matrícula :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 79111
          mmTop = 25929
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'MATRICULA'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 4233
          mmLeft = 98161
          mmTop = 25929
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Data : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160602
          mmTop = 25929
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppSystemVariable3: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 173038
          mmTop = 25929
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 24342
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage5: TppDBImage
          UserName = 'ppDBImage5'
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          DataPipeline = ppFundacao
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          DataPipelineName = 'ppFundacao'
          mmHeight = 24077
          mmLeft = 265
          mmTop = 0
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppDBText145: TppDBText
          UserName = 'ppDBText145'
          DataField = 'NOME'
          DataPipeline = ppFundacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 5821
          mmLeft = 27781
          mmTop = 265
          mmWidth = 133615
          BandType = 3
          GroupNo = 0
        end
        object ppDBText144: TppDBText
          UserName = 'ppDBText144'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 6615
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText143: TppDBText
          UserName = 'ppDBText143'
          DataField = 'LOGRADOURO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 11906
          mmWidth = 69586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText102: TppDBText
          UserName = 'ppDBText102'
          DataField = 'BAIRRO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 16404
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText103: TppDBText
          UserName = 'ppDBText103'
          DataField = 'CIDADE'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 16404
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'ppLabel15'
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 20902
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppDBText101: TppDBText
          UserName = 'ppDBText101'
          DataField = 'CEP'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 35190
          mmTop = 20902
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText141: TppDBText
          UserName = 'ppDBText141'
          DataField = 'CODESTADO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText142: TppDBText
          UserName = 'ppDBText142'
          DataField = 'NUMERO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97631
          mmTop = 11906
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppRodapeGrupoMensal: TppGroupFooterBand
        BeforePrint = ppRodapeGrupoMensalBeforePrint
        mmBottomOffset = 0
        mmHeight = 40746
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape11'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 10583
          mmLeft = 5556
          mmTop = 0
          mmWidth = 185209
          BandType = 5
          GroupNo = 0
        end
        object ppShape8: TppShape
          UserName = 'Shape8'
          mmHeight = 10054
          mmLeft = 39158
          mmTop = 0
          mmWidth = 152929
          BandType = 5
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape9'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 39952
          mmTop = 265
          mmWidth = 151077
          BandType = 5
          GroupNo = 0
        end
        object ppShape10: TppShape
          UserName = 'Shape10'
          Brush.Color = 14737632
          mmHeight = 10054
          mmLeft = 5821
          mmTop = 0
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label20'
          Caption = 'SALDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 1058
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label201'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 6085
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Data da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Qtd. de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 130440
          mmTop = 794
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Vr. da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187325
          mmTop = 794
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 126207
          mmTop = 265
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 172509
          mmTop = 0
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 151607
          mmTop = 0
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText101'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 5821
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblTotValorCota: TppDBText
          UserName = 'lblTotValorCota'
          DataField = 'VALOR_DA_COTA'
          DataPipeline = ppMensal
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 152665
          mmTop = 5821
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object lblTotalSaldoReal: TppLabel
          UserName = 'lblTotalSaldoReal'
          Caption = 'lblTotalSaldoReal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173302
          mmTop = 5556
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object lblTotQuantcotas: TppLabel
          UserName = 'lblTotQuantcotas'
          AutoSize = False
          Caption = 'lblSubQuantcotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 5821
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppShape12: TppShape
          UserName = 'Shape12'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 13229
          mmLeft = 8996
          mmTop = 21431
          mmWidth = 100013
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioTituloBeneficioSaldado: TppLabel
          UserName = 'lblSumarioTituloBeneficioSaldado'
          AutoSize = False
          Caption = 'Valor do Benefício Saldado Mensal aos xx anos '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 13758
          mmTop = 24871
          mmWidth = 69586
          BandType = 5
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'PROJEÇÃO BENEFÍCIO SALDADO EM '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 59002
          mmTop = 15346
          mmWidth = 63236
          BandType = 5
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText12'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 4233
          mmLeft = 123825
          mmTop = 15346
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioBeneficioSaldado: TppLabel
          UserName = 'lblSumarioBeneficioSaldado'
          AutoSize = False
          Caption = 'R$ 1.000,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85196
          mmTop = 24871
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'Label601'
          Caption = 'ATENÇÃO : Esta informação está sujeita a confirmação da FCRT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 44715
          mmTop = 35454
          mmWidth = 109273
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME_CONTA'
      DataPipeline = ppMensal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppMensal'
      object ppCabecalhoGrupoMensal: TppGroupHeaderBand
        BeforePrint = ppCabecalhoGrupoMensalBeforePrint
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = 14737632
          mmHeight = 5821
          mmLeft = 110067
          mmTop = 1323
          mmWidth = 82021
          BandType = 3
          GroupNo = 1
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14737632
          mmHeight = 6085
          mmLeft = 6085
          mmTop = 8467
          mmWidth = 185738
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOME_CONTA'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 9790
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 9790
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label5'
          Caption = 'Qtd. de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 130704
          mmTop = 9790
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label6'
          Caption = 'Vlr da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 9790
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187325
          mmTop = 9790
          mmWidth = 3440
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 39423
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 126736
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 151077
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 171186
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object lblSaldoAnterior: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Saldo Anterior (cotas) em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111390
          mmTop = 2910
          mmWidth = 53181
          BandType = 3
          GroupNo = 1
        end
        object ppDBText15: TppDBText
          UserName = 'DBText14'
          DataField = 'SALDOANT'
          DataPipeline = ppMensal
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 165629
          mmTop = 2910
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape6'
          Pen.Width = 2
          mmHeight = 10054
          mmLeft = 39158
          mmTop = 529
          mmWidth = 152929
          BandType = 5
          GroupNo = 1
        end
        object ppShape7: TppShape
          UserName = 'Shape7'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 39952
          mmTop = 1058
          mmWidth = 151077
          BandType = 5
          GroupNo = 1
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 14737632
          Pen.Width = 2
          mmHeight = 10054
          mmLeft = 6350
          mmTop = 529
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label13'
          Caption = 'SALDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 1323
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'ATUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 6085
          mmWidth = 9260
          BandType = 5
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Data da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 1323
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Qtd. de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 129382
          mmTop = 1323
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'Label17'
          Caption = 'Vlr da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 1323
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label18'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187325
          mmTop = 1323
          mmWidth = 3440
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 126207
          mmTop = 529
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 171980
          mmTop = 529
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 151342
          mmTop = 529
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 6085
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object lblSubSaldoReal: TppLabel
          UserName = 'lblSubSaldoReal'
          Caption = 'lblSubSaldoReal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 174890
          mmTop = 6085
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
        end
        object lblSubQuantcotas: TppLabel
          UserName = 'lblSubQuantcotas'
          Caption = 'lblSubQuantcotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 131498
          mmTop = 6085
          mmWidth = 18256
          BandType = 5
          GroupNo = 1
        end
        object lblSubValorCota: TppDBText
          UserName = 'lblSubValorCota'
          DataField = 'VALOR_DA_COTA'
          DataPipeline = ppMensal
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 153723
          mmTop = 6085
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object ppSomaCotasAux: TppDBCalc
          UserName = 'SomaCotasAux'
          DataField = 'QUANT_COTA'
          DataPipeline = ppMensal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppMensal'
          mmHeight = 3175
          mmLeft = 87842
          mmTop = 6085
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object dsMensal: TwwDataSource
    Left = 207
    Top = 432
  end
  object cdsFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 477
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 150
    Top = 382
  end
  object dsFundacao: TwwDataSource
    DataSet = cdsFundacao
    Left = 147
    Top = 429
  end
  object rpTrimestral: TppReport
    AutoStop = False
    DataPipeline = ppTrimestral
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 288
    Top = 331
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTrimestral'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape14: TppShape
        UserName = 'Shape3'
        ParentHeight = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 0
        mmWidth = 189707
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText3'
        DataField = 'DATA_LANCAMENTO'
        DataPipeline = ppTrimestral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCRICAO'
        DataPipeline = ppTrimestral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 265
        mmWidth = 94456
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT_COTA'
        DataPipeline = ppTrimestral
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR_DA_COTA'
        DataPipeline = ppTrimestral
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 160867
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_EM_REAL'
        DataPipeline = ppTrimestral
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 135467
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'DATAALIMENTACAO'
        DataPipeline = ppTrimestral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTrimestral'
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 265
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel71: TppLabel
        UserName = 'Label101'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 23813
        mmTop = 529
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppRodapeTrimestral: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppTrimestral
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTrimestral'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 48948
        mmPrintPosition = 0
        object ppShape13: TppShape
          UserName = 'Shape2'
          Brush.Color = 14737632
          mmHeight = 5556
          mmLeft = 148432
          mmTop = 42863
          mmWidth = 47096
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label11'
          Caption = 'Extrato de Conta - Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 67469
          mmTop = 31750
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label4'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 162984
          mmTop = 38365
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label8'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 25929
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'PARTICIPANTE'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 25929
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label9'
          Caption = 'Matrícula :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 79111
          mmTop = 25929
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText9'
          DataField = 'MATRICULA'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 98161
          mmTop = 25929
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label12'
          Caption = 'Data : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160602
          mmTop = 25929
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 174096
          mmTop = 25929
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 24342
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage1: TppDBImage
          UserName = 'ppDBImage5'
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          DataPipeline = ppFundacao
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          DataPipelineName = 'ppFundacao'
          mmHeight = 24077
          mmLeft = 265
          mmTop = 0
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'ppDBText145'
          DataField = 'NOME'
          DataPipeline = ppFundacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 5821
          mmLeft = 27781
          mmTop = 265
          mmWidth = 133615
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'ppDBText144'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 6615
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'ppDBText143'
          DataField = 'LOGRADOURO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 11906
          mmWidth = 69586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'ppDBText102'
          DataField = 'BAIRRO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 16404
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'ppDBText103'
          DataField = 'CIDADE'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 16404
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'ppLabel15'
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 20902
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'ppDBText101'
          DataField = 'CEP'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 35190
          mmTop = 20902
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'ppDBText141'
          DataField = 'CODESTADO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'ppDBText142'
          DataField = 'NUMERO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97631
          mmTop = 11906
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label61'
          Caption = 'Posição no Trimeste Civil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 76729
          mmTop = 38365
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'TRIMESTRE'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 157692
          mmTop = 43392
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label2'
          Caption = 'Extrato para Simples Conferência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 70379
          mmTop = 43656
          mmWidth = 56092
          BandType = 3
          GroupNo = 0
        end
      end
      object ppRodapeGrupoTrimestral: TppGroupFooterBand
        BeforePrint = ppRodapeGrupoTrimestralBeforePrint
        mmBottomOffset = 0
        mmHeight = 60854
        mmPrintPosition = 0
        object ppShape15: TppShape
          UserName = 'Shape15'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 13229
          mmLeft = 8996
          mmTop = 37835
          mmWidth = 100013
          BandType = 5
          GroupNo = 0
        end
        object ppShape16: TppShape
          UserName = 'Shape11'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 19579
          mmLeft = 3704
          mmTop = 1058
          mmWidth = 185738
          BandType = 5
          GroupNo = 0
        end
        object ppShape17: TppShape
          UserName = 'Shape8'
          mmHeight = 10054
          mmLeft = 39158
          mmTop = 2910
          mmWidth = 156369
          BandType = 5
          GroupNo = 0
        end
        object ppShape18: TppShape
          UserName = 'Shape9'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 135202
          mmTop = 3175
          mmWidth = 60061
          BandType = 5
          GroupNo = 0
        end
        object ppShape19: TppShape
          UserName = 'Shape10'
          Brush.Color = 14737632
          mmHeight = 10054
          mmLeft = 5821
          mmTop = 2910
          mmWidth = 129646
          BandType = 5
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label20'
          Caption = 'SALDO TOTAL APURADO EM:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 29369
          mmTop = 5821
          mmWidth = 50800
          BandType = 5
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Qtd.  de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 138377
          mmTop = 3704
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label23'
          Caption = 'Vlr. da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 161132
          mmTop = 3704
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label24'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 191030
          mmTop = 3704
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 135202
          mmTop = 2910
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 178065
          mmTop = 2910
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 159279
          mmTop = 2910
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText101'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 79904
          mmTop = 5821
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblTotValorCotaTri: TppDBText
          UserName = 'lblTotValorCota'
          DataField = 'VALOR_DA_COTA'
          DataPipeline = ppTrimestral
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 3175
          mmLeft = 159809
          mmTop = 8731
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblTotalSaldoTrimestral: TppLabel
          UserName = 'lblTotalSaldoTrimestral'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 179123
          mmTop = 8731
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object lblTotQuantcotasTri: TppLabel
          UserName = 'lblTotQuantcotasTri'
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 8731
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioTituloBeneficioSaldadoTri: TppLabel
          UserName = 'lblSumarioTituloBeneficioSaldado'
          AutoSize = False
          Caption = 'Valor do Benefício Saldado Mensal aos xx anos '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 14288
          mmTop = 41275
          mmWidth = 69586
          BandType = 5
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label29'
          Caption = 'PROJEÇÃO BENEFÍCIO SALDADO EM '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 59531
          mmTop = 31485
          mmWidth = 63236
          BandType = 5
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText12'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 124619
          mmTop = 31485
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioBeneficioSaldadoTri: TppLabel
          UserName = 'lblSumarioBeneficioSaldado'
          AutoSize = False
          Caption = 'R$ 1.000,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85725
          mmTop = 41275
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          Caption = 'ATENÇÃO : Esta informação está sujeita a confirmação da FCRT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 45244
          mmTop = 51858
          mmWidth = 109273
          BandType = 5
          GroupNo = 0
        end
        object ppShape38: TppShape
          UserName = 'Shape38'
          mmHeight = 10054
          mmLeft = 39158
          mmTop = 12700
          mmWidth = 156369
          BandType = 5
          GroupNo = 0
        end
        object ppShape39: TppShape
          UserName = 'Shape39'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 135202
          mmTop = 12965
          mmWidth = 60061
          BandType = 5
          GroupNo = 0
        end
        object ppShape40: TppShape
          UserName = 'Shape102'
          Brush.Color = 14737632
          mmHeight = 10054
          mmLeft = 5821
          mmTop = 12700
          mmWidth = 129646
          BandType = 5
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label86'
          AutoSize = False
          Caption = 'Qtd.  de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 138377
          mmTop = 13494
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppLabel88: TppLabel
          UserName = 'Label88'
          Caption = 'Vlr. da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 161132
          mmTop = 13494
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppLabel89: TppLabel
          UserName = 'Label89'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 191030
          mmTop = 13494
          mmWidth = 3440
          BandType = 5
          GroupNo = 0
        end
        object ppLine53: TppLine
          UserName = 'Line53'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 135202
          mmTop = 12700
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine54: TppLine
          UserName = 'Line54'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 178065
          mmTop = 12700
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'Line55'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 159279
          mmTop = 12700
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'DBText62'
          DataField = 'DATA_ULT_COTA'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 84402
          mmTop = 15610
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblValorCotaAtual: TppDBText
          UserName = 'lblValorCotaAtual'
          DataField = 'VALOR_ULT_COTA'
          DataPipeline = ppTrimestral
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 3175
          mmLeft = 159809
          mmTop = 18521
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lblSaldoAtual: TppLabel
          UserName = 'lblSaldoAtual'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 179123
          mmTop = 18521
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object lblQuantcotasAtu: TppLabel
          UserName = 'lblQuantcotasAtu'
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 18521
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label203'
          Caption = 'SALDO TOTAL ATUALIZADO EM:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 28840
          mmTop = 15610
          mmWidth = 55827
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NOME_CONTA'
      DataPipeline = ppTrimestral
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTrimestral'
      object ppCabecalhoGrupoTrimestral: TppGroupHeaderBand
        BeforePrint = ppCabecalhoGrupoTrimestralBeforePrint
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape20: TppShape
          UserName = 'Shape4'
          Brush.Color = 14737632
          mmHeight = 5821
          mmLeft = 112977
          mmTop = 1323
          mmWidth = 82550
          BandType = 3
          GroupNo = 1
        end
        object ppShape21: TppShape
          UserName = 'Shape1'
          Brush.Color = 14737632
          mmHeight = 6085
          mmLeft = 5821
          mmTop = 8467
          mmWidth = 189707
          BandType = 3
          GroupNo = 1
        end
        object ppDBText34: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOME_CONTA'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 4233
          mmLeft = 265
          mmTop = 529
          mmWidth = 75671
          BandType = 3
          GroupNo = 1
        end
        object ppLabel47: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 9790
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object ppLabel48: TppLabel
          UserName = 'Label3'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 9790
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel49: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Qtd. de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 136525
          mmTop = 9790
          mmWidth = 20902
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'Label6'
          Caption = 'Vlr. da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 160073
          mmTop = 9790
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 191030
          mmTop = 9790
          mmWidth = 3440
          BandType = 3
          GroupNo = 1
        end
        object ppLine24: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 39158
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine25: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 135467
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine26: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 158750
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object ppLine27: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6085
          mmLeft = 177536
          mmTop = 8467
          mmWidth = 529
          BandType = 3
          GroupNo = 1
        end
        object lblSaldoAntTri: TppLabel
          UserName = 'lblSaldoAntTri'
          AutoSize = False
          Caption = 'Saldo Anterior (cotas) em 31/12/2003 : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 2910
          mmWidth = 54240
          BandType = 3
          GroupNo = 1
        end
        object ppDBText36: TppDBText
          UserName = 'DBText14'
          DataField = 'SALDOANT'
          DataPipeline = ppTrimestral
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 3175
          mmLeft = 169863
          mmTop = 2910
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppSomaCotasAuxTri: TppDBCalc
          UserName = 'SomaCotasAuxTri'
          DataField = 'QUANT_COTA'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          Visible = False
          DataPipelineName = 'ppTrimestral'
          mmHeight = 2117
          mmLeft = 108215
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppShape22: TppShape
          UserName = 'Shape6'
          Pen.Width = 2
          mmHeight = 10054
          mmLeft = 39158
          mmTop = 1852
          mmWidth = 156369
          BandType = 5
          GroupNo = 1
        end
        object ppShape23: TppShape
          UserName = 'Shape7'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 39423
          mmTop = 2381
          mmWidth = 155311
          BandType = 5
          GroupNo = 1
        end
        object ppShape24: TppShape
          UserName = 'Shape5'
          Brush.Color = 14737632
          Pen.Width = 2
          mmHeight = 10054
          mmLeft = 5821
          mmTop = 1852
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
        object ppLabel54: TppLabel
          UserName = 'Label13'
          Caption = 'SALDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 2646
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppLabel55: TppLabel
          UserName = 'Label14'
          Caption = 'ATUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 7408
          mmWidth = 9260
          BandType = 5
          GroupNo = 1
        end
        object ppLabel56: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Data da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 2646
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLabel57: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Qtd. de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 2646
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'Label17'
          Caption = 'Vlr. da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 160602
          mmTop = 2646
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
        end
        object ppLabel59: TppLabel
          UserName = 'Label18'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 191030
          mmTop = 2646
          mmWidth = 3440
          BandType = 5
          GroupNo = 1
        end
        object ppLine28: TppLine
          UserName = 'Line2'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 135202
          mmTop = 1852
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppLine29: TppLine
          UserName = 'Line11'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 177536
          mmTop = 1852
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppLine30: TppLine
          UserName = 'Line12'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 9525
          mmLeft = 158750
          mmTop = 1852
          mmWidth = 529
          BandType = 5
          GroupNo = 1
        end
        object ppDBText37: TppDBText
          UserName = 'DBText10'
          DataField = 'DATA_LANCAMENTO'
          DataPipeline = ppTrimestral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 3175
          mmLeft = 40217
          mmTop = 7408
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppSUBValorCotaTrimestral: TppDBText
          UserName = 'lblSubValorCota'
          DataField = 'VALOR_DA_COTA'
          DataPipeline = ppTrimestral
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTrimestral'
          mmHeight = 3175
          mmLeft = 159544
          mmTop = 7408
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object lblSUBSaldoTrimestral: TppLabel
          UserName = 'lblSubSaldoTrimestral'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 178859
          mmTop = 7408
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object ppSUBQuantCotasTrimestral: TppLabel
          UserName = 'ppSUBQuantCotasTrimestral'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 137319
          mmTop = 7408
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppTrimestral: TppBDEPipeline
    DataSource = dsTrimestral
    UserName = 'Trimestral'
    Left = 282
    Top = 385
    object ppTrimestralppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppTrimestralppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppTrimestralppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppTrimestralppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppTrimestralppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 4
    end
    object ppTrimestralppField6: TppField
      FieldAlias = 'INSCRICAODATA'
      FieldName = 'INSCRICAODATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppTrimestralppField7: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object ppTrimestralppField8: TppField
      FieldAlias = 'TRIMESTRE'
      FieldName = 'TRIMESTRE'
      FieldLength = 17
      DisplayWidth = 17
      Position = 7
    end
    object ppTrimestralppField9: TppField
      FieldAlias = 'ANOMESREF'
      FieldName = 'ANOMESREF'
      FieldLength = 7
      DisplayWidth = 7
      Position = 8
    end
    object ppTrimestralppField10: TppField
      FieldAlias = 'MESREF'
      FieldName = 'MESREF'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppTrimestralppField11: TppField
      FieldAlias = 'DATA_LANCAMENTO'
      FieldName = 'DATA_LANCAMENTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppTrimestralppField12: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppTrimestralppField13: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 79
      DisplayWidth = 79
      Position = 12
    end
    object ppTrimestralppField14: TppField
      FieldAlias = 'NOME_CONTA'
      FieldName = 'NOME_CONTA'
      FieldLength = 41
      DisplayWidth = 41
      Position = 13
    end
    object ppTrimestralppField15: TppField
      FieldAlias = 'TIPO_CONTA'
      FieldName = 'TIPO_CONTA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 14
    end
    object ppTrimestralppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGENTRADA'
      FieldName = 'FLGENTRADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppTrimestralppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_DA_COTA'
      FieldName = 'VALOR_DA_COTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppTrimestralppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_COTA'
      FieldName = 'QUANT_COTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppTrimestralppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_EM_REAL'
      FieldName = 'VALOR_EM_REAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppTrimestralppField20: TppField
      FieldAlias = 'DATASALDOANT'
      FieldName = 'DATASALDOANT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppTrimestralppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppTrimestralppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTCOTA'
      FieldName = 'SALDOANTCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppTrimestralppField23: TppField
      FieldAlias = 'DATAALIMENTACAO'
      FieldName = 'DATAALIMENTACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppTrimestralppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADEBSALDADO'
      FieldName = 'IDADEBSALDADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppTrimestralppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'BSALDADO'
      FieldName = 'BSALDADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppTrimestralppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESERVABSALDADO'
      FieldName = 'RESERVABSALDADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppTrimestralppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_ULT_COTA'
      FieldName = 'VALOR_ULT_COTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppTrimestralppField28: TppField
      FieldAlias = 'DATA_ULT_COTA'
      FieldName = 'DATA_ULT_COTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
  end
  object dsTrimestral: TwwDataSource
    DataSet = cdsTrimestral
    Left = 282
    Top = 432
  end
  object cdsTrimestral: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 282
    Top = 480
    Data = {
      8F2300009619E0BD01000000180000001C0018000000030000001B0409494450
      4553534A555208000400000000000B4944504C414E4F50524556080004000000
      0000084944504553534F4108000400000000000B53455150524F504F53544108
      00040000000000094D4154524943554C41010049000000010005574944544802
      0002000D000D494E5343524943414F4441544108000800000000000D4D455352
      45464552454E4349410100490000000100055749445448020002000700095452
      494D4553545245010049000000010005574944544802000200110009414E4F4D
      45535245460100490000000100055749445448020002000700064D4553524546
      0100490000000100055749445448020002000A000F444154415F4C414E43414D
      454E544F0100490000000100055749445448020002000A000C50415254494349
      50414E54450100490000000100055749445448020002003C0009444553435249
      43414F0100490000000100055749445448020002004F000A4E4F4D455F434F4E
      544101004900000001000557494454480200020029000A5449504F5F434F4E54
      4101004900000001000557494454480200020003000A464C47454E5452414441
      08000400000000000D56414C4F525F44415F434F544108000400000000000A51
      55414E545F434F544108000400000000000D56414C4F525F454D5F5245414C08
      000400000000000C4441544153414C444F414E54010049000000010005574944
      5448020002000A000853414C444F414E5408000400000000000C53414C444F41
      4E54434F544108000400000000000F44415441414C494D454E544143414F0100
      490000000100055749445448020002000A000D49444144454253414C4441444F
      0800040000000000084253414C4441444F08000400000000000F524553455256
      414253414C4441444F08000400000000000E56414C4F525F554C545F434F5441
      08000400000000000D444154415F554C545F434F544101004900000001000557
      49445448020002000A0001000A4348414E47455F4C4F47040082004800000001
      0000000000000004000000020000000000000004000000030000000000000004
      0000000400000000000000040000000500000000000000040000000600000000
      0000000400000007000000000000000400000008000000000000000400000009
      00000001000000080000000A00000009000000080000000B0000000200000008
      0000000C0000000B000000080000000D00000003000000080000000E0000000D
      000000080000000F0000000400000008000000100000000F0000000800000011
      0000000500000008000000120000001100000008000000130000000600000008
      0000001400000013000000080000001500000007000000080000001600000015
      0000000800000017000000080000000800000018000000170000000800000005
      0000000000000000000000E06DE84000000000008040400000000000B0BD4000
      0000000000F03F093138303134312D30300000F20017BBCC4207323030332F30
      321130342F32303033202D2030362F3230303307323030332F30340A41425249
      4C2F323030330A30352F30342F32303033164D4155524943494F205249424549
      524F20504F52544F31416C696D2E204D656E73616C204344202D2042C1534943
      4120444F532042454E4546532050524F4753202D20415449564F26434F4E5441
      20494E444956494455414C20444F205041525449434950414E54452028434950
      2903434950000000000000F03F51BEA085040CF13F5401F73CBF2F7A40676666
      6666E67B400A32382F30372F3230303400000000000000000000000000000000
      07323030332F3034000000000000000000000000000000000000000000000000
      00000000000000000100050000000000000000000000E06DE840000000000080
      40400000000000B0BD40000000000000F03F093138303134312D30300000F200
      17BBCC4207323030332F30331130342F32303033202D2030362F323030330732
      3030332F30340A414252494C2F323030330A30352F30352F32303033164D4155
      524943494F205249424549524F20504F52544F31416C696D2E204D656E73616C
      204344202D2042C15349434120444F532042454E4546532050524F4753202D20
      415449564F26434F4E544120494E444956494455414C20444F20504152544943
      4950414E544520284349502903434950000000000000F03F63CF9ECBD4A4F13F
      87C1FC15F24C79406766666666E67B400A32382F30372F323030340000000000
      000000000000000000000007323030332F303500000000000000000000000000
      0000000000000000000000000000000000000001000500000000000000000000
      00E06DE84000000000008040400000000000B0BD40000000000000F03F093138
      303134312D30300000F20017BBCC4207323030332F30331130342F3230303320
      2D2030362F3230303307323030332F30340A414252494C2F323030330A30352F
      30362F32303033164D4155524943494F205249424549524F20504F52544F3141
      6C696D2E204D656E73616C204344202D2042C15349434120444F532042454E45
      46532050524F4753202D20415449564F26434F4E544120494E44495649445541
      4C20444F205041525449434950414E5445202843495029034349500000000000
      00000015FF774485EAF13F3B376DC669E66BC0F6285C8FC23D6FC00A32382F30
      372F323030340000000000000000000000000000000007323030332F30360000
      0000000000000000000000000000000000000000000000000000000000000100
      050000000000000000000000E06DE84000000000008040400000000000B0BD40
      000000000000F03F093138303134312D30300000F20017BBCC4207323030332F
      30341130342F32303033202D2030362F3230303307323030332F30340A414252
      494C2F323030330A30352F30362F32303033164D4155524943494F2052494245
      49524F20504F52544F31416C696D2E204D656E73616C204344202D2042C15349
      434120444F532042454E4546532050524F4753202D20415449564F26434F4E54
      4120494E444956494455414C20444F205041525449434950414E544520284349
      502903434950000000000000F03F15FF774485EAF13F4C8A8F4F88EA78406766
      666666E67B400A32382F30372F32303034000000000000000000000000000000
      0007323030332F30360000000000000000000000000000000000000000000000
      0000000000000000000100050000000000000000000000E06DE8400000000000
      8040400000000000B0BD40000000000000F03F093138303134312D30300000F2
      0017BBCC4207323030332F30321130342F32303033202D2030362F3230303307
      323030332F30340A414252494C2F323030330A30352F30342F32303033164D41
      55524943494F205249424549524F20504F52544F2B416C696D2E204D656E7361
      6C204344202D204E4F524D414C2044452042454E4546CD43494F532050524F47
      29434F4E5441204944454E544946494341444120444120504154524F43494E41
      444F524120284350492903435049000000000000F03F51BEA085040CF13F5401
      F73CBF2F7A406766666666E67B400A32382F30372F3230303400000000000000
      00000000000000000007323030332F3034000000000000000000000000000000
      00000000000000000000000000000000000100050000000000000000000000E0
      6DE84000000000008040400000000000B0BD40000000000000F03F0931383031
      34312D30300000F20017BBCC4207323030332F30331130342F32303033202D20
      30362F3230303307323030332F30340A414252494C2F323030330A30352F3035
      2F32303033164D4155524943494F205249424549524F20504F52544F2B416C69
      6D2E204D656E73616C204344202D204E4F524D414C2044452042454E4546CD43
      494F532050524F4729434F4E5441204944454E54494649434144412044412050
      4154524F43494E41444F524120284350492903435049000000000000F03F63CF
      9ECBD4A4F13F87C1FC15F24C79406766666666E67B400A32382F30372F323030
      340000000000000000000000000000000007323030332F303500000000000000
      0000000000000000000000000000000000000000000000000001000500000000
      00000000000000E06DE84000000000008040400000000000B0BD400000000000
      00F03F093138303134312D30300000F20017BBCC4207323030332F3033113034
      2F32303033202D2030362F3230303307323030332F30340A414252494C2F3230
      30330A30352F30362F32303033164D4155524943494F205249424549524F2050
      4F52544F2B416C696D2E204D656E73616C204344202D204E4F524D414C204445
      2042454E4546CD43494F532050524F4729434F4E5441204944454E5449464943
      41444120444120504154524F43494E41444F5241202843504929034350490000
      00000000000015FF774485EAF13F3B376DC669E66BC0F6285C8FC23D6FC00A32
      382F30372F323030340000000000000000000000000000000007323030332F30
      3600000000000000000000000000000000000000000000000000000000000000
      000100050000000000000000000000E06DE84000000000008040400000000000
      B0BD40000000000000F03F093138303134312D30300000F20017BBCC42073230
      30332F30341130342F32303033202D2030362F3230303307323030332F30340A
      414252494C2F323030330A30352F30362F32303033164D4155524943494F2052
      49424549524F20504F52544F2B416C696D2E204D656E73616C204344202D204E
      4F524D414C2044452042454E4546CD43494F532050524F4729434F4E54412049
      44454E544946494341444120444120504154524F43494E41444F524120284350
      492903435049000000000000F03F15FF774485EAF13F4C8A8F4F88EA78406766
      666666E67B400A32382F30372F32303034000000000000000000000000000000
      0007323030332F30360000000000000000000000000000000000000000000000
      00000000000000000001000D0000000000000000000000E06DE8400000000000
      8040400000000000B0BD40000000000000F03F093138303134312D30300000F2
      0017BBCC4207323030332F30321130342F32303033202D2030362F3230303307
      323030332F30340A414252494C2F323030330A30352F30342F32303033164D41
      55524943494F205249424549524F20504F52544F31416C696D2E204D656E7361
      6C204344202D2042C15349434120444F532042454E4546532050524F4753202D
      20415449564F26434F4E544120494E444956494455414C20444F205041525449
      434950414E544520284349502903434950000000000000F03F63CF9ECBD4A4F1
      3F5401F73CBF2F7A406766666666E67B400A30352F30342F3230303348E17A14
      AEFD924048E17A14AEFD924007323030332F3034000000000000000000000000
      0000000000000000000000003387A4164AA6F63F0A31392F30372F323030340C
      0000000000000000000000E06DE84000000000008040400000000000B0BD4000
      0000000000F03F093138303134312D30300000F20017BBCC4207323030332F30
      321130342F32303033202D2030362F3230303307323030332F30340A41425249
      4C2F323030330A30352F30342F32303033164D4155524943494F205249424549
      524F20504F52544F31416C696D2E204D656E73616C204344202D2042C1534943
      4120444F532042454E4546532050524F4753202D20415449564F26434F4E5441
      20494E444956494455414C20444F205041525449434950414E54452028434950
      2903434950000000000000F03F63CF9ECBD4A4F13F5401F73CBF2F7A40676666
      6666E67B400A30352F30342F3230303348E17A14AEFD924048E17A14AEFD9240
      07323030332F30340000000000804B40A47EF130D1338640A4703D0A37B4D940
      3387A4164AA6F63F0A31392F30372F323030340D0000000000000000000000E0
      6DE84000000000008040400000000000B0BD40000000000000F03F0931383031
      34312D30300000F20017BBCC4207323030332F30331130342F32303033202D20
      30362F3230303307323030332F30340A414252494C2F323030330A30352F3036
      2F32303033164D4155524943494F205249424549524F20504F52544F31416C69
      6D2E204D656E73616C204344202D2042C15349434120444F532042454E454653
      2050524F4753202D20415449564F26434F4E544120494E444956494455414C20
      444F205041525449434950414E544520284349502903434950000000000000F0
      3F3A2009FB7652F23F87C1FC15F24C79406766666666E67B400A30352F30362F
      323030339DA1B8E39D8999409DA1B8E39D89994007323030332F303500000000
      00000000000000000000000000000000000000003387A4164AA6F63F0A31392F
      30372F323030340C0000000000000000000000E06DE840000000000080404000
      00000000B0BD40000000000000F03F093138303134312D30300000F20017BBCC
      4207323030332F30331130342F32303033202D2030362F323030330732303033
      2F30340A414252494C2F323030330A30352F30362F32303033164D4155524943
      494F205249424549524F20504F52544F31416C696D2E204D656E73616C204344
      202D2042C15349434120444F532042454E4546532050524F4753202D20415449
      564F26434F4E544120494E444956494455414C20444F20504152544943495041
      4E544520284349502903434950000000000000F03F3A2009FB7652F23F87C1FC
      15F24C79406766666666E67B400A30352F30362F323030339DA1B8E39D899940
      9DA1B8E39D89994007323030332F30350000000000804B40A47EF130D1338640
      A4703D0A37B4D9403387A4164AA6F63F0A31392F30372F323030340D00000000
      00000000000000E06DE84000000000008040400000000000B0BD400000000000
      00F03F093138303134312D30300000F20017BBCC4207323030332F3033113034
      2F32303033202D2030362F3230303307323030332F30340A414252494C2F3230
      30330A30352F30362F32303033164D4155524943494F205249424549524F2050
      4F52544F31416C696D2E204D656E73616C204344202D2042C15349434120444F
      532042454E4546532050524F4753202D20415449564F26434F4E544120494E44
      4956494455414C20444F205041525449434950414E5445202843495029034349
      5000000000000000003A2009FB7652F23F3B376DC669E66BC0F6285C8FC23D6F
      C00A30352F30362F323030339DA1B8E39D8999409DA1B8E39D89994007323030
      332F30360000000000000000000000000000000000000000000000003387A416
      4AA6F63F0A31392F30372F323030340C0000000000000000000000E06DE84000
      000000008040400000000000B0BD40000000000000F03F093138303134312D30
      300000F20017BBCC4207323030332F30331130342F32303033202D2030362F32
      30303307323030332F30340A414252494C2F323030330A30352F30362F323030
      33164D4155524943494F205249424549524F20504F52544F31416C696D2E204D
      656E73616C204344202D2042C15349434120444F532042454E4546532050524F
      4753202D20415449564F26434F4E544120494E444956494455414C20444F2050
      41525449434950414E54452028434950290343495000000000000000003A2009
      FB7652F23F3B376DC669E66BC0F6285C8FC23D6FC00A30352F30362F32303033
      9DA1B8E39D8999409DA1B8E39D89994007323030332F30360000000000804B40
      A47EF130D1338640A4703D0A37B4D9403387A4164AA6F63F0A31392F30372F32
      3030340D0000000000000000000000E06DE84000000000008040400000000000
      B0BD40000000000000F03F093138303134312D30300000F20017BBCC42073230
      30332F30341130342F32303033202D2030362F3230303307323030332F30340A
      414252494C2F323030330A30352F30362F32303033164D4155524943494F2052
      49424549524F20504F52544F31416C696D2E204D656E73616C204344202D2042
      C15349434120444F532042454E4546532050524F4753202D20415449564F2643
      4F4E544120494E444956494455414C20444F205041525449434950414E544520
      284349502903434950000000000000F03F3A2009FB7652F23F4C8A8F4F88EA78
      406766666666E67B400A30352F30362F32303033FED13769DADC9F40FED13769
      DADC9F4007323030332F30360000000000000000000000000000000000000000
      000000003387A4164AA6F63F0A31392F30372F323030340C0000000000000000
      000000E06DE84000000000008040400000000000B0BD40000000000000F03F09
      3138303134312D30300000F20017BBCC4207323030332F30341130342F323030
      33202D2030362F3230303307323030332F30340A414252494C2F323030330A30
      352F30362F32303033164D4155524943494F205249424549524F20504F52544F
      31416C696D2E204D656E73616C204344202D2042C15349434120444F53204245
      4E4546532050524F4753202D20415449564F26434F4E544120494E4449564944
      55414C20444F205041525449434950414E544520284349502903434950000000
      000000F03F3A2009FB7652F23F4C8A8F4F88EA78406766666666E67B400A3035
      2F30362F32303033FED13769DADC9F40FED13769DADC9F4007323030332F3036
      0000000000804B40A47EF130D1338640A4703D0A37B4D9403387A4164AA6F63F
      0A31392F30372F323030340D0000000000000000000000E06DE8400000000000
      8040400000000000B0BD40000000000000F03F093138303134312D30300000F2
      0017BBCC4207323030332F30321130342F32303033202D2030362F3230303307
      323030332F30340A414252494C2F323030330A30352F30342F32303033164D41
      55524943494F205249424549524F20504F52544F2B416C696D2E204D656E7361
      6C204344202D204E4F524D414C2044452042454E4546CD43494F532050524F47
      29434F4E5441204944454E544946494341444120444120504154524F43494E41
      444F524120284350492903435049000000000000F03F63CF9ECBD4A4F13F5401
      F73CBF2F7A406766666666E67B400A30352F30342F3230303300000000000000
      00000000000000000007323030332F3034000000000000000000000000000000
      0000000000000000003387A4164AA6F63F0A31392F30372F323030340C000000
      0000000000000000E06DE84000000000008040400000000000B0BD4000000000
      0000F03F093138303134312D30300000F20017BBCC4207323030332F30321130
      342F32303033202D2030362F3230303307323030332F30340A414252494C2F32
      3030330A30352F30342F32303033164D4155524943494F205249424549524F20
      504F52544F2B416C696D2E204D656E73616C204344202D204E4F524D414C2044
      452042454E4546CD43494F532050524F4729434F4E5441204944454E54494649
      4341444120444120504154524F43494E41444F52412028435049290343504900
      0000000000F03F63CF9ECBD4A4F13F5401F73CBF2F7A406766666666E67B400A
      30352F30342F323030330000000000000000000000000000000007323030332F
      30340000000000804B40A47EF130D1338640A4703D0A37B4D9403387A4164AA6
      F63F0A31392F30372F323030340D0000000000000000000000E06DE840000000
      00008040400000000000B0BD40000000000000F03F093138303134312D303000
      00F20017BBCC4207323030332F30331130342F32303033202D2030362F323030
      3307323030332F30340A414252494C2F323030330A30352F30362F3230303316
      4D4155524943494F205249424549524F20504F52544F2B416C696D2E204D656E
      73616C204344202D204E4F524D414C2044452042454E4546CD43494F53205052
      4F4729434F4E5441204944454E544946494341444120444120504154524F4349
      4E41444F524120284350492903435049000000000000F03F3A2009FB7652F23F
      87C1FC15F24C79406766666666E67B400A30352F30362F323030335401F73CBF
      2F7A405401F73CBF2F7A4007323030332F303500000000000000000000000000
      00000000000000000000003387A4164AA6F63F0A31392F30372F323030340C00
      00000000000000000000E06DE84000000000008040400000000000B0BD400000
      00000000F03F093138303134312D30300000F20017BBCC4207323030332F3033
      1130342F32303033202D2030362F3230303307323030332F30340A414252494C
      2F323030330A30352F30362F32303033164D4155524943494F20524942454952
      4F20504F52544F2B416C696D2E204D656E73616C204344202D204E4F524D414C
      2044452042454E4546CD43494F532050524F4729434F4E5441204944454E5449
      46494341444120444120504154524F43494E41444F5241202843504929034350
      49000000000000F03F3A2009FB7652F23F87C1FC15F24C79406766666666E67B
      400A30352F30362F323030335401F73CBF2F7A405401F73CBF2F7A4007323030
      332F30350000000000804B40A47EF130D1338640A4703D0A37B4D9403387A416
      4AA6F63F0A31392F30372F323030340D0000000000000000000000E06DE84000
      000000008040400000000000B0BD40000000000000F03F093138303134312D30
      300000F20017BBCC4207323030332F30331130342F32303033202D2030362F32
      30303307323030332F30340A414252494C2F323030330A30352F30362F323030
      33164D4155524943494F205249424549524F20504F52544F2B416C696D2E204D
      656E73616C204344202D204E4F524D414C2044452042454E4546CD43494F5320
      50524F4729434F4E5441204944454E544946494341444120444120504154524F
      43494E41444F52412028435049290343504900000000000000003A2009FB7652
      F23F3B376DC669E66BC0F6285C8FC23D6FC00A30352F30362F323030335401F7
      3CBF2F7A405401F73CBF2F7A4007323030332F30360000000000000000000000
      000000000000000000000000003387A4164AA6F63F0A31392F30372F32303034
      0C0000000000000000000000E06DE84000000000008040400000000000B0BD40
      000000000000F03F093138303134312D30300000F20017BBCC4207323030332F
      30331130342F32303033202D2030362F3230303307323030332F30340A414252
      494C2F323030330A30352F30362F32303033164D4155524943494F2052494245
      49524F20504F52544F2B416C696D2E204D656E73616C204344202D204E4F524D
      414C2044452042454E4546CD43494F532050524F4729434F4E5441204944454E
      544946494341444120444120504154524F43494E41444F524120284350492903
      43504900000000000000003A2009FB7652F23F3B376DC669E66BC0F6285C8FC2
      3D6FC00A30352F30362F323030335401F73CBF2F7A405401F73CBF2F7A400732
      3030332F30360000000000804B40A47EF130D1338640A4703D0A37B4D9403387
      A4164AA6F63F0A31392F30372F323030340D0000000000000000000000E06DE8
      4000000000008040400000000000B0BD40000000000000F03F09313830313431
      2D30300000F20017BBCC4207323030332F30341130342F32303033202D203036
      2F3230303307323030332F30340A414252494C2F323030330A30352F30362F32
      303033164D4155524943494F205249424549524F20504F52544F2B416C696D2E
      204D656E73616C204344202D204E4F524D414C2044452042454E4546CD43494F
      532050524F4729434F4E5441204944454E544946494341444120444120504154
      524F43494E41444F524120284350492903435049000000000000F03F3A2009FB
      7652F23F4C8A8F4F88EA78406766666666E67B400A30352F30362F323030336D
      E179A958BE89406DE179A958BE894007323030332F3036000000000000000000
      0000000000000000000000000000003387A4164AA6F63F0A31392F30372F3230
      30340C0000000000000000000000E06DE84000000000008040400000000000B0
      BD40000000000000F03F093138303134312D30300000F20017BBCC4207323030
      332F30341130342F32303033202D2030362F3230303307323030332F30340A41
      4252494C2F323030330A30352F30362F32303033164D4155524943494F205249
      424549524F20504F52544F2B416C696D2E204D656E73616C204344202D204E4F
      524D414C2044452042454E4546CD43494F532050524F4729434F4E5441204944
      454E544946494341444120444120504154524F43494E41444F52412028435049
      2903435049000000000000F03F3A2009FB7652F23F4C8A8F4F88EA7840676666
      6666E67B400A30352F30362F323030336DE179A958BE89406DE179A958BE8940
      07323030332F30360000000000804B40A47EF130D1338640A4703D0A37B4D940
      3387A4164AA6F63F0A31392F30372F32303034}
  end
  object rpConsolidado: TppReport
    AutoStop = False
    DataPipeline = ppConsolidado
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 372
    Top = 331
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConsolidado'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 265
      mmPrintPosition = 0
    end
    object ppDetalheCons: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppShape26: TppShape
        UserName = 'Shape3'
        ParentHeight = True
        mmHeight = 11113
        mmLeft = 1588
        mmTop = 0
        mmWidth = 192352
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MESREFERENCIA'
        DataPipeline = ppConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 4233
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT_COTA_PART'
        DataPipeline = ppConsolidado
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 1058
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_EM_REAL_PART'
        DataPipeline = ppConsolidado
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 128323
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 32544
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine33: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 100806
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine34: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 127529
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 148432
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 171715
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        AutoSize = False
        Caption = 'Contribuição Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35983
        mmTop = 1058
        mmWidth = 43127
        BandType = 4
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        AutoSize = False
        Caption = 'Contribuição Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35454
        mmTop = 6615
        mmWidth = 43392
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'QUANT_COTA_PATRO'
        DataPipeline = ppConsolidado
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 6879
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'VALOR_EM_REAL_PATRO'
        DataPipeline = ppConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 128323
        mmTop = 6615
        mmWidth = 19315
        BandType = 4
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 32544
        mmTop = 5292
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'QUANT_COTA_TOTAL'
        DataPipeline = ppConsolidado
        DisplayFormat = '###,###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 4234
        mmWidth = 21960
        BandType = 4
      end
      object lblValorRealCons: TppDBText
        UserName = 'lblValorRealCons'
        DataField = 'VALOR_EM_REAL_TOTAL'
        DataPipeline = ppConsolidado
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 4233
        mmWidth = 18785
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 11113
        mmLeft = 79639
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'VALOR_DA_COTA'
        DataPipeline = ppConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 81227
        mmTop = 4234
        mmWidth = 17198
        BandType = 4
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 100806
        mmTop = 5291
        mmWidth = 47890
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        AutoSize = True
        DataField = 'DATAINDICE'
        DataPipeline = ppConsolidado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsolidado'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 4233
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 4498
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'ppDBText38'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppHeaderMatriculaConsolidado: TppGroupHeaderBand
        BeforePrint = ppHeaderMatriculaConsolidadoBeforePrint
        mmBottomOffset = 0
        mmHeight = 75671
        mmPrintPosition = 0
        object ppShape34: TppShape
          UserName = 'Shape34'
          mmHeight = 5821
          mmLeft = 149490
          mmTop = 58738
          mmWidth = 44450
          BandType = 3
          GroupNo = 0
        end
        object ppShape25: TppShape
          UserName = 'Shape2'
          Brush.Color = 14737632
          mmHeight = 5556
          mmLeft = 149490
          mmTop = 42598
          mmWidth = 44450
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label11'
          Caption = 'Extrato de Conta Consolidado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 68527
          mmTop = 31485
          mmWidth = 61119
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label2'
          Caption = 'Extrato para Simples Conferência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 70115
          mmTop = 43392
          mmWidth = 56886
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label4'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 38100
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label8'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 25665
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'PARTICIPANTE'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 25665
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label9'
          Caption = 'Matrícula :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 79111
          mmTop = 25665
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppDBText38: TppDBText
          UserName = 'DBText9'
          DataField = 'MATRICULA'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 4233
          mmLeft = 98161
          mmTop = 25665
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          UserName = 'Label12'
          Caption = 'Data : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160602
          mmTop = 25665
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppSystemVariable2: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 174361
          mmTop = 25665
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 24077
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage2: TppDBImage
          UserName = 'ppDBImage5'
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          DataPipeline = ppFundacao
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          DataPipelineName = 'ppFundacao'
          mmHeight = 24077
          mmLeft = 265
          mmTop = 0
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'ppDBText145'
          DataField = 'NOME'
          DataPipeline = ppFundacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 5821
          mmLeft = 27781
          mmTop = 0
          mmWidth = 133615
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'ppDBText144'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 6350
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText41: TppDBText
          UserName = 'ppDBText143'
          DataField = 'LOGRADOURO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 11642
          mmWidth = 69586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText42: TppDBText
          UserName = 'ppDBText102'
          DataField = 'BAIRRO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 16140
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText43: TppDBText
          UserName = 'ppDBText103'
          DataField = 'CIDADE'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 16140
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'ppLabel15'
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 20638
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText101'
          DataField = 'CEP'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 35190
          mmTop = 20638
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          UserName = 'ppDBText141'
          DataField = 'CODESTADO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 16140
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText46: TppDBText
          UserName = 'ppDBText142'
          DataField = 'NUMERO'
          DataPipeline = ppFundacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppFundacao'
          mmHeight = 3704
          mmLeft = 97631
          mmTop = 11642
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText47: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'ANO'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 43127
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppShape32: TppShape
          UserName = 'Shape4'
          Brush.Color = 14737632
          mmHeight = 5821
          mmLeft = 149490
          mmTop = 52917
          mmWidth = 44450
          BandType = 3
          GroupNo = 0
        end
        object lblSaldoAntCons: TppLabel
          UserName = 'lblSaldoAntCons'
          AutoSize = False
          Caption = 'Saldo Anterior em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 149490
          mmTop = 48948
          mmWidth = 45773
          BandType = 3
          GroupNo = 0
        end
        object ppDBText58: TppDBText
          UserName = 'DBText14'
          DataField = 'SALDOANT'
          DataPipeline = ppConsolidado
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 3175
          mmLeft = 174890
          mmTop = 60061
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel87: TppLabel
          UserName = 'Label19'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 188648
          mmTop = 53975
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppShape33: TppShape
          UserName = 'Shape1'
          Brush.Color = 14737632
          mmHeight = 8996
          mmLeft = 1588
          mmTop = 66675
          mmWidth = 192352
          BandType = 3
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 67998
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel82: TppLabel
          UserName = 'Label3'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 46302
          mmTop = 67998
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label5'
          Caption = 'Em Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 114036
          mmTop = 67998
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel84: TppLabel
          UserName = 'Label6'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 136790
          mmTop = 67998
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'SALDO DE CONTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 155840
          mmTop = 67998
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLine39: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 32545
          mmTop = 66675
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 100806
          mmTop = 66675
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 127529
          mmTop = 66675
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 148432
          mmTop = 66675
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 161661
          mmTop = 53975
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText56: TppDBText
          UserName = 'DBText56'
          DataField = 'SALDOANTCOTA'
          DataPipeline = ppConsolidado
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 60061
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10848
          mmLeft = 170392
          mmTop = 53181
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label67'
          Caption = 'Em Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 152929
          mmTop = 72231
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 188648
          mmTop = 72231
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 148696
          mmTop = 71702
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'Line45'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 71702
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine48: TppLine
          UserName = 'Line48'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 79640
          mmTop = 66940
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label10'
          Caption = 'Valor Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 81756
          mmTop = 67998
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
      end
      object ppRodapeGrupoCons: TppGroupFooterBand
        BeforePrint = ppRodapeGrupoConsBeforePrint
        mmBottomOffset = 0
        mmHeight = 48683
        mmPrintPosition = 0
        object ppShape28: TppShape
          UserName = 'Shape11'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 19579
          mmLeft = 1588
          mmTop = 2381
          mmWidth = 185738
          BandType = 5
          GroupNo = 0
        end
        object ppShape35: TppShape
          UserName = 'Shape101'
          Brush.Color = 14737632
          mmHeight = 10054
          mmLeft = 3969
          mmTop = 14023
          mmWidth = 97102
          BandType = 5
          GroupNo = 0
        end
        object ppShape27: TppShape
          UserName = 'Shape27'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 13229
          mmLeft = 8996
          mmTop = 26988
          mmWidth = 100013
          BandType = 5
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'Label60'
          Caption = 'ATENÇÃO : Esta informação está sujeita a confirmação da FCRT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 40481
          mmTop = 41540
          mmWidth = 109273
          BandType = 5
          GroupNo = 0
        end
        object ppShape29: TppShape
          UserName = 'Shape8'
          mmHeight = 10054
          mmLeft = 36777
          mmTop = 4233
          mmWidth = 156898
          BandType = 5
          GroupNo = 0
        end
        object ppShape30: TppShape
          UserName = 'Shape9'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 101071
          mmTop = 4498
          mmWidth = 92340
          BandType = 5
          GroupNo = 0
        end
        object ppShape31: TppShape
          UserName = 'Shape10'
          Brush.Color = 14737632
          mmHeight = 10054
          mmLeft = 3969
          mmTop = 4233
          mmWidth = 97102
          BandType = 5
          GroupNo = 0
        end
        object ppLabel73: TppLabel
          UserName = 'Label20'
          Caption = 'SALDO TOTAL APURADO EM: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15610
          mmTop = 7144
          mmWidth = 51858
          BandType = 5
          GroupNo = 0
        end
        object ppLabel76: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Quantidade de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 130175
          mmTop = 5027
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppLabel77: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Valor da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105304
          mmTop = 5027
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppLabel78: TppLabel
          UserName = 'Label24'
          Caption = 'Valor em R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 5027
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 100806
          mmTop = 4233
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 165100
          mmTop = 4498
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 127529
          mmTop = 4233
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object lblTotSaldoRealCons: TppLabel
          UserName = 'lblTotSaldoRealCons'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 186532
          mmTop = 10054
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object lblTotQuantcotasCons: TppLabel
          UserName = 'lblTotQuantcotasCons'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155046
          mmTop = 10054
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppSomaCotasAuxCons: TppDBCalc
          UserName = 'SomaCotasAuxCons'
          DataField = 'QUANT_COTA_TOTAL'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          Visible = False
          DataPipelineName = 'ppConsolidado'
          mmHeight = 3175
          mmLeft = 153723
          mmTop = 26723
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText53: TppDBText
          UserName = 'DBText53'
          DataField = 'DATAINDICE'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 4233
          mmLeft = 66411
          mmTop = 7144
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBText54: TppDBText
          UserName = 'DBText54'
          DataField = 'VALOR_DA_COTA'
          DataPipeline = ppConsolidado
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 3175
          mmLeft = 101600
          mmTop = 10054
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioTituloBeneficioSaldadoCons: TppLabel
          UserName = 'lblSumarioTituloBeneficioSaldadoCons'
          AutoSize = False
          Caption = 'Valor do Benefício Saldado Mensal aos xx anos '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 13758
          mmTop = 30427
          mmWidth = 69586
          BandType = 5
          GroupNo = 0
        end
        object lblSumarioBeneficioSaldadoCons: TppLabel
          UserName = 'lblSumarioBeneficioSaldadoCons'
          AutoSize = False
          Caption = 'R$ 1.000,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85196
          mmTop = 30427
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppShape36: TppShape
          UserName = 'Shape36'
          mmHeight = 10054
          mmLeft = 100806
          mmTop = 14023
          mmWidth = 92869
          BandType = 5
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label202'
          Caption = 'SALDO TOTAL ATUALIZADO EM: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15081
          mmTop = 17198
          mmWidth = 56886
          BandType = 5
          GroupNo = 0
        end
        object ppShape37: TppShape
          UserName = 'Shape37'
          Brush.Color = 14737632
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 101071
          mmTop = 14288
          mmWidth = 92340
          BandType = 5
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          AutoSize = False
          Caption = 'Valor da Cota '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 105304
          mmTop = 14817
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBText60: TppDBText
          UserName = 'DBText60'
          DataField = 'VALOR_ULT_COTA'
          DataPipeline = ppConsolidado
          DisplayFormat = '###,###,###,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 3175
          mmLeft = 101600
          mmTop = 19844
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          AutoSize = False
          Caption = 'Quantidade de Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 130175
          mmTop = 14817
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object lblTotQuantcotasAtu: TppLabel
          UserName = 'lblTotQuantcotasCons1'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155046
          mmTop = 19844
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppLabel74: TppLabel
          UserName = 'Label74'
          Caption = 'Valor em R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 14817
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object lblTotSaldoRealAtu: TppLabel
          UserName = 'lblTotSaldoRealCons1'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 186532
          mmTop = 19844
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppLine51: TppLine
          UserName = 'Line51'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 165100
          mmTop = 14288
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppLine52: TppLine
          UserName = 'Line52'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 127529
          mmTop = 14023
          mmWidth = 529
          BandType = 5
          GroupNo = 0
        end
        object ppDBText57: TppDBText
          UserName = 'DBText57'
          DataField = 'DATA_ULT_COTA'
          DataPipeline = ppConsolidado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConsolidado'
          mmHeight = 4233
          mmLeft = 71173
          mmTop = 17198
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppConsolidado: TppBDEPipeline
    DataSource = dsConsolidado
    UserName = 'Trimestral1'
    Left = 366
    Top = 382
  end
  object dsConsolidado: TwwDataSource
    DataSet = cdsConsolidado
    Left = 366
    Top = 429
  end
  object cdsConsolidado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 366
    Top = 477
  end
  object cdsPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 18
    Top = 387
    Data = {
      810100009619E0BD0100000018000000030008000000030000007900054F5244
      454D0800040000000000084944504553534F410800040000000000044E4F4D45
      0100490000000100055749445448020002003C0002000D44454641554C545F4F
      52444552020082000200000001000300044C4349440400010009080000000000
      00000000000000000000000000F0BF0A203C20546F646173203E000000000000
      0000F03F00000000E06DE8401242524153494C2054454C45434F4D20532F4100
      00000000000000F03F000000006006EC402742524153494C2054454C45434F4D
      205345525649C74F5320444520494E5445524E455420532E4100000000000000
      00F03F00000000806DE8400C43454C554C415220435254200000000000000000
      F03F000000000000F03F0C46554E444143414F204352540000000000000000F0
      3F000000008006EC4007504154524F20350000000000000000F03F00000000C0
      06EC4007504154524F20360000000000000000F03F00000000E006EC40075041
      54524F2037}
    object cdsPatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPatroORDEM: TFloatField
      FieldName = 'ORDEM'
      Visible = False
    end
    object cdsPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object cdsSituacao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 78
    Top = 405
    Data = {
      130300009619E0BD010000001800000003000E000000030000007E000646494C
      5452410800040000000000094944534954504152540800040000000000094445
      5343524943414F010049000000010005574944544802000200320002000D4445
      4641554C545F4F5244455202008200010000000300044C434944040001000908
      00000000000000000000F03F000000000000F03F05415449564F000000000000
      0000F03F000000000000404023415449564F20434F4D204D414E5554454EC7C3
      4F20444F20534420444520434F4E54410000000000000000F03F000000000000
      28401F4155544F504154524F43494E494F202D20415558494C494F20444F454E
      C7410000000000000000F03F0000000000002A402B4155544F504154524F4349
      4E494F202D20415558494C494F20444F454EC7412041434944454E544152494F
      0000000000000000F03F00000000000032402A4155544F504154524F43494E49
      4F202D205045524441205041524349414C2052454D554E455241C7414F000000
      0000000000F03F0000000000003340284155544F504154524F43494E494F202D
      20504552444120544F54414C2052454D554E455241C7414F0000000000000000
      F03F00000000000024400E415558494C494F20444F454EC74100000000000000
      00F03F00000000000026401C415558494C494F20444F454EC741202D20414349
      44454E544152494F0000000000000000F03F00000000000031401D43414E4345
      4C41444F202D20504F5220494E4144494D504C454E4349410000000000000000
      F03F00000000000030401B43414E43454C41444F202D20504F5220534F4C4943
      495441C7414F0000000000000000F03F00000000000035402443414E43454C41
      444F202D2053454D20504147414D454E544F2044452052455345525641000000
      0000000000F03F0000000000804C40134C4943454EC741204D415445524E4944
      4144450000000000000000F03F0000000000804A40174D414E5554454EC7C34F
      20444520494E53435249C7C34F0000000000000000F03F000000000000084017
      53454D20434F4E545249425549C7414F20412046435254}
    object cdsSituacaoFILTRA: TFloatField
      DisplayWidth = 4
      FieldName = 'FILTRA'
    end
    object cdsSituacaoDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsSituacaoIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Visible = False
    end
  end
  object dsSituacao: TwwDataSource
    DataSet = cdsSituacao
    Left = 75
    Top = 384
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      H.IDPESSJUR,'
      '      H.IDPLANOPREV,'
      '      H.IDPESSOA,'
      '      H.SEQPROPOSTA,'
      '      EL.MATRICULA,'
      '      H.MESREFERENCIA AS ANOMESREF,'
      '      DECODE(SUBSTR(H.MESREFERENCIA,'
      '      6,'
      '      2),'
      '      '#39'01'#39','
      '      '#39'JANEIRO'#39','
      '      '#39'02'#39','
      '      '#39'FEVEREIRO'#39','
      '      '#39'03'#39','
      '      '#39'MARçO'#39','
      '      '#39'04'#39','
      '      '#39'ABRIL'#39','
      '      '#39'05'#39','
      '      '#39'MAIO'#39','
      '      '#39'06'#39','
      '      '#39'JUNHO'#39','
      '      '#39'07'#39','
      '      '#39'JULHO'#39','
      '      '#39'08'#39','
      '      '#39'AGOSTO'#39','
      '      '#39'09'#39','
      '      '#39'SETEMBRO'#39','
      '      '#39'10'#39','
      '      '#39'OUTUBRO'#39','
      '      '#39'11'#39','
      '      '#39'NOVEMBRO'#39','
      '      '#39'12'#39','
      '      '#39'DEZEMBRO'#39')||'#39'/'#39'||SUBSTR(H.MESREFERENCIA,'
      '      1,'
      '      4) AS MESREFERENCIA,'
      '      TO_CHAR(HC.DATARECEBIMENTO,'
      '      '#39'DD/MM/YYYY'#39') AS DATA_LANCAMENTO,'
      '      P.NOME        AS PARTICIPANTE,'
      '      DECODE(H.IDTIPORESERVA,'
      '      26,'
      '      '#39'CONTA IDENTIFICADA DA PATROCINADORA (CPI)'#39','
      '      27,'
      '      '#39'CONTA IDENTIFICADA DA PATROCINADORA (CPI)'#39','
      '      '#39'CONTA INDIVIDUAL DO PARTICIPANTE (CIP)'#39' ) AS NOME_CONTA,'
      '      DECODE(H.IDTIPORESERVA,'
      '      26,'
      '      '#39'CPI'#39','
      '      27,'
      '      '#39'CPI'#39','
      '      '#39'CIP'#39' ) AS TIPO_CONTA,'
      '      C.NOME               AS DESCRICAO,'
      '      H.FLGENTRADA,'
      '      NVL(H.VALORINDICE,'
      '      0) AS VALOR_DA_COTA,'
      '      DECODE(H.FLGENTRADA,'
      '      1,'
      '      NVL(H.VLRCOTAS,'
      '      0),'
      '      -NVL(H.VLRCOTAS,'
      '      0))    AS QUANT_COTA,'
      '      DECODE(H.FLGENTRADA,'
      '      1,'
      '      NVL(H.VLRREAL,'
      '      0) ,'
      '      -NVL(H.VLRREAL,'
      '      0 ))    AS VALOR_EM_REAL,'
      '      SYSDATE AS DATASALDOANT,'
      '      0 AS SALDOANT,'
      '      0 AS SALDOANTCOTA,'
      '      0 AS IDADEBSALDADO,'
      '      0 AS BSALDADO,'
      '      0 AS RESERVABSALDADO   '
      'FROM'
      '      PESSOA P,'
      '      ELEGPATRO EL,'
      '      PARTPREVPLAN PP,'
      '      HISTMOVRESERVA H,'
      '      CONTRIBUICAO C,'
      '    HSTCONTRIBPREV HC                  '
      
        'WHERE  H.MESREFERENCIA     = '#39'2003/01'#39'                          ' +
        '                                         '
      'AND H.IDPESSJUR         = 50031 '
      '    AND pp.iDSITPART IN (1,'
      '    32,'
      '    12,'
      '    13,'
      '    18,'
      '    19,'
      '    10,'
      '    11,'
      '    17,'
      '    16,'
      '    21,'
      '    57,'
      '    53,'
      '3) '
      '    AND EL.MATRICULA IN ('#39'99002'#39','
      #39'99003'#39') '
      '    AND    H.IDTIPORESERVA     IN (12,'
      '    13,'
      '    14,'
      '    15,'
      '    16,'
      '    17,'
      '    18,'
      '    19,'
      '    20,'
      '    47,'
      '    48,'
      '    50,'
      '    80,'
      '    26,'
      '27)'
      
        'AND    PP.IDPESSJUR        = H.IDPESSJUR                        ' +
        '                                                          '
      
        'AND    PP.IDPLANOPREV      = H.IDPLANOPREV                      ' +
        '                                                          '
      
        'AND    PP.IDPESSOA         = H.IDPESSOA                         ' +
        '                                                          '
      
        'AND    PP.SEQPROPOSTA      = H.SEQPROPOSTA                      ' +
        '                                                          '
      
        'AND    EL.IDPESSJUR        = PP.IDPESSJUR                       ' +
        '                                                          '
      
        'AND    EL.IDPESSOA         = PP.IDPESSOA                        ' +
        '                                                          '
      
        'AND    P.IDPESSOA          = EL.IDPESSOA                        ' +
        '                                                          '
      
        'AND    C.IDCONTRIBUICAO    = H.IDCONTRIBUICAO                   ' +
        '                                                          '
      
        'AND    HC.IDPESSJUR        = H.IDPESSJUR                        ' +
        '                                                          '
      
        'AND    HC.IDPLANOPREV      = H.IDPLANOPREV                      ' +
        '                                                          '
      
        'AND    HC.IDPESSOA         = H.IDPESSOA                         ' +
        '                                                          '
      
        'AND    HC.SEQPROPOSTA      = H.SEQPROPOSTA                      ' +
        '                                                          '
      
        'AND    HC.MESCOBRANCA      = H.MESREFERENCIA                    ' +
        '                                                          '
      
        'AND    HC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO                   ' +
        '                                                          '
      'ORDER BY MATRICULA,'
      'TIPO_CONTA,'
      'NOME_CONTA,'
      'DATA_LANCAMENTO,'
      'DESCRICAO  '
      '')
    ValidateWithMask = True
    Left = 475
    Top = 218
  end
end
