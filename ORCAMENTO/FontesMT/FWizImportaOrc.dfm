inherited frmWizImportaOrc: TfrmWizImportaOrc
  Left = 40
  Top = 77
  HelpContext = 520056
  Caption = 'Importação do orçamento via planilhas Excel'
  ClientHeight = 418
  ClientWidth = 733
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 379
    inherited PagControle: TPageControl
      Width = 731
      Height = 377
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 723
          Caption = 'Importação do orçamento de planilha Excel ® [ Passo 1 de 2 ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 723
          Height = 98
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label3: TLabel
            Left = 17
            Top = 3
            Width = 55
            Height = 13
            Caption = 'Exercício'
          end
          object Label1: TLabel
            Left = 119
            Top = 3
            Width = 70
            Height = 13
            Caption = 'Linha Inicial'
          end
          object lblCaminho: TLabel
            Left = 18
            Top = 51
            Width = 170
            Height = 13
            Caption = 'Caminho completo da planilha'
          end
          object spExercicioDest: TwwDBSpinEdit
            Left = 17
            Top = 19
            Width = 73
            Height = 21
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object chkSobrescreve: TCheckBox
            Left = 242
            Top = 24
            Width = 211
            Height = 17
            Caption = 'Sobrescreve Orcamento Gravado'
            TabOrder = 2
          end
          object spLinIni: TwwDBSpinEdit
            Left = 119
            Top = 19
            Width = 73
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object edtCaminho: TEdit
            Left = 18
            Top = 66
            Width = 439
            Height = 21
            TabOrder = 3
            Text = 'C:\'
          end
          object bitBtnAbrir: TBitBtn
            Left = 457
            Top = 65
            Width = 27
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = bitBtnAbrirClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 122
          Width = 723
          Height = 245
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Label2: TLabel
            Left = 16
            Top = 61
            Width = 85
            Height = 13
            Caption = 'Coluna Janeiro'
          end
          object Label4: TLabel
            Left = 141
            Top = 61
            Width = 97
            Height = 13
            Caption = 'Coluna Fevereiro'
          end
          object Label5: TLabel
            Left = 267
            Top = 61
            Width = 79
            Height = 13
            Caption = 'Coluna Março'
          end
          object Label6: TLabel
            Left = 392
            Top = 61
            Width = 69
            Height = 13
            Caption = 'Coluna Abril'
          end
          object Label7: TLabel
            Left = 16
            Top = 115
            Width = 71
            Height = 13
            Caption = 'Coluna Maio'
          end
          object Label8: TLabel
            Left = 141
            Top = 115
            Width = 78
            Height = 13
            Caption = 'Coluna Junho'
          end
          object Label9: TLabel
            Left = 267
            Top = 115
            Width = 74
            Height = 13
            Caption = 'Coluna Julho'
          end
          object Label10: TLabel
            Left = 392
            Top = 115
            Width = 83
            Height = 13
            Caption = 'Coluna Agosto'
          end
          object Label11: TLabel
            Left = 16
            Top = 168
            Width = 97
            Height = 13
            Caption = 'Coluna Setembro'
          end
          object Label12: TLabel
            Left = 141
            Top = 168
            Width = 89
            Height = 13
            Caption = 'Coluna Outubro'
          end
          object Label13: TLabel
            Left = 267
            Top = 168
            Width = 101
            Height = 13
            Caption = 'Coluna Novembro'
          end
          object Label14: TLabel
            Left = 392
            Top = 168
            Width = 100
            Height = 13
            Caption = 'Coluna Dezembro'
          end
          object Label15: TLabel
            Left = 16
            Top = 8
            Width = 107
            Height = 13
            Caption = 'Coluna Cód. Conta'
          end
          object dbedJan: TwwDBEdit
            Left = 16
            Top = 75
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLJANEIRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedFev: TwwDBEdit
            Left = 141
            Top = 75
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLFEVEREIRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedMar: TwwDBEdit
            Left = 267
            Top = 75
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLMARCO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedAbr: TwwDBEdit
            Left = 392
            Top = 75
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLABRIL'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedMai: TwwDBEdit
            Left = 16
            Top = 130
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLMAIO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedJun: TwwDBEdit
            Left = 141
            Top = 130
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLJUNHO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedJul: TwwDBEdit
            Left = 267
            Top = 130
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLJULHO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedAgo: TwwDBEdit
            Left = 392
            Top = 130
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLAGOSTO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedSet: TwwDBEdit
            Left = 16
            Top = 184
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLSETEMBRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 9
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedOut: TwwDBEdit
            Left = 141
            Top = 184
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLOUTUBRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 10
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedNov: TwwDBEdit
            Left = 267
            Top = 184
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLNOVEMBRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 11
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDez: TwwDBEdit
            Left = 392
            Top = 184
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLDEZEMBRO'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 12
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbEdCodConta: TwwDBEdit
            Left = 17
            Top = 21
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COLCODCONTA'
            DataSource = Ds
            MaxLength = 2
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 723
          Caption = 'Importação do orçamento de planilha Excel ® [ Passo 2 de 2 ]'
        end
        object dbGrdSaldoOrcado: TwwDBGrid
          Left = 0
          Top = 44
          Width = 723
          Height = 192
          Hint = 'Clique com o botão direito para imprimir'
          Selected.Strings = (
            'NOMECONTAORCAMEN'#9'30'#9'Conta Orçamentária'#9'F'
            'IDCONTAORCAMEN'#9'30'#9'Código da Conta'
            'DATAREFERENCIA'#9'10'#9'Data de ~Referência'
            'EXERCICIO'#9'4'#9'Exercício'
            'PERIODO'#9'2'#9'Período'
            'VLRORCADO'#9'10'#9'Valor~Orçado')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = dsSaldoOrc
          ParentShowHint = False
          PopupMenu = PopupMenu2
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = dbGrdSaldoOrcadoTitleButtonClick
          OnDrawDataCell = dbGrdSaldoOrcadoDrawDataCell
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 0
          Top = 24
          Width = 723
          Height = 20
          Align = alTop
          Caption = 'Resultado da importação'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 0
          Top = 236
          Width = 723
          Height = 20
          Align = alTop
          Caption = 'Log da importação'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object meErros: TwwDBRichEdit
          Left = 0
          Top = 256
          Width = 723
          Height = 111
          Hint = 'Clique com o botão direito para Imprimir/Salvar'
          ScrollBars = ssBoth
          Align = alClient
          AutoURLDetect = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          PrintJobName = 'Log de Operações'
          ShowHint = True
          TabOrder = 3
          WordWrap = False
          PopupOptions = []
          EditorOptions = []
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 293
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520070
      end
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsBeforePost
    Left = 293
    Top = 112
  end
  object Ds: TwwDataSource
    DataSet = cds
    Left = 341
    Top = 112
  end
  object sqlSaldoOrc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT '#39'                                 '#39' AS NOMECONTAORCAMEN, ' +
        'S.* FROM SALDOORCADO S WHERE 1 = 2 ')
    ClientDataSet = cdsSaldoOrc
    Left = 637
    Top = 144
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto(*.txt)|*.txt'
    Left = 349
    Top = 282
  end
  object PopupMenu1: TPopupMenu
    Left = 294
    Top = 283
    object Salvar1: TMenuItem
      Caption = '&Salvar'
      OnClick = Salvar1Click
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Planihas EXCEL(*.xls)|*.xls'
    Left = 400
    Top = 280
  end
  object cdsSaldoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 485
    Top = 143
  end
  object dsSaldoOrc: TwwDataSource
    DataSet = cdsSaldoOrc
    Left = 568
    Top = 144
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 546
    Top = 311
  end
  object cdsFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 594
    Top = 311
  end
  object dsFundacao: TwwDataSource
    DataSet = cdsFundacao
    Left = 626
    Top = 311
  end
  object sqlFundacao: TCMSqlParams
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ClientDataSet = cdsFundacao
    Left = 658
    Top = 311
  end
  object ppRApura: TppReport
    AutoStop = False
    DataPipeline = ppBDEApura
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppRApuraBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ShowCancelDialog = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 549
    Top = 255
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEApura'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Importação do orçamento via planilha Excel ®'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 12435
        mmWidth = 92869
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Código da conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 21431
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 21431
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Valor Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 21431
        mmWidth = 21960
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 16933
        mmLeft = 5556
        mmTop = 2117
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 3175
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 68792
        mmTop = 21431
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157427
        mmTop = 21431
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Brush.Color = 15658734
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 197909
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EXERCICIO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 265
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PERIODO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 529
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VLRORCADO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 68792
        mmTop = 529
        mmWidth = 72231
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel309: TppLabel
        UserName = 'ppLabel206'
        AutoSize = False
        Caption = 'Planejamento e Orçamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 197644
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 82815
        mmTop = 265
        mmWidth = 9260
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 93398
        mmTop = 529
        mmWidth = 7938
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 529
        mmWidth = 25929
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 185473
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VLRORCADO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 529
        mmWidth = 28840
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 0
        mmWidth = 282840
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 36248
        mmTop = 265
        mmWidth = 10319
        BandType = 7
      end
    end
  end
  object ppBDEApura: TppBDEPipeline
    DataSource = dsSaldoOrc
    UserName = 'BDEApura'
    Left = 589
    Top = 255
  end
  object PopupMenu2: TPopupMenu
    Left = 165
    Top = 143
    object Imprimir2: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir2Click
    end
  end
end
