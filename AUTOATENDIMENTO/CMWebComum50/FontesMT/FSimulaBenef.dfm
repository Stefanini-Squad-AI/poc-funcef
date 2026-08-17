inherited frmSimulaBenef: TfrmSimulaBenef
  Left = 227
  Top = 135
  Caption = 'Simulação de Benefícios'
  ClientHeight = 425
  ClientWidth = 592
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 386
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 590
      Height = 384
      ActivePage = tabParticipante
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabPosition = tpBottom
      object tabParticipante: TTabSheet
        Caption = 'Etapa 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object grpParticipante: TGroupBox
          Left = 10
          Top = 34
          Width = 560
          Height = 171
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblMatricula: TLabel
            Left = 16
            Top = 28
            Width = 55
            Height = 13
            Caption = 'Matrícula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNome: TLabel
            Left = 16
            Top = 136
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 16
            Top = 64
            Width = 53
            Height = 13
            Caption = 'Inscrição'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 16
            Top = 100
            Width = 32
            Height = 13
            Caption = 'Login'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsulta: TSpeedButton
            Left = 163
            Top = 25
            Width = 23
            Height = 22
            Hint = 'Seleciona participante'
            Flat = True
            Glyph.Data = {
              0E030000424D0E030000000000003600000028000000110000000E0000000100
              180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
              FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
              2121000000000000000000000000FFFFFF000000000000000000636363212121
              000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
              0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
              FF000000C6C6C642424200000000000000000031313100000000000063636363
              6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
              0000000000000063636300000000000063636363636342424200000000000000
              0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
              00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
              0000002121210000000000000000000000000000000000000000000000002121
              21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
              000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
              000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
              0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnConsultaClick
          end
          object edtMatricula: TEdit
            Left = 78
            Top = 25
            Width = 83
            Height = 21
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtNome: TEdit
            Left = 78
            Top = 132
            Width = 466
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edtInscricao: TEdit
            Left = 78
            Top = 61
            Width = 107
            Height = 21
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtLogin: TEdit
            Left = 78
            Top = 96
            Width = 107
            Height = 21
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object pnlTop1: TPanel
          Left = 0
          Top = 0
          Width = 582
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          Caption = '  Seleção do Participante'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tabBeneficio: TTabSheet
        Caption = 'Etapa 2'
        ImageIndex = 1
        object grpBeneficio: TGroupBox
          Left = 10
          Top = 34
          Width = 560
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 28
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cmbBeneficio: TDBLookupComboBox
            Left = 78
            Top = 25
            Width = 469
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyField = 'IDSIMULABENEF'
            ListField = 'NOME'
            ListSource = dtsBeneficio
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlTop2: TPanel
          Left = 0
          Top = 0
          Width = 582
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          Caption = '  Seleção do Benefício'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tabCampos: TTabSheet
        Caption = 'Etapa 3'
        ImageIndex = 2
        object pnlTop3: TPanel
          Left = 0
          Top = 0
          Width = 582
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          Caption = '  Campos da Simulação'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object pnlEt3: TPanel
          Left = 0
          Top = 25
          Width = 582
          Height = 331
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BorderWidth = 10
          TabOrder = 1
          object scrollCampos: TScrollBox
            Left = 11
            Top = 11
            Width = 560
            Height = 309
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
      end
      object tabResultados: TTabSheet
        Caption = 'Etapa 4'
        ImageIndex = 3
        object pnlTop4: TPanel
          Left = 0
          Top = 0
          Width = 582
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          Caption = '  Resultados da Simulação'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object pnlEt4: TPanel
          Left = 0
          Top = 25
          Width = 582
          Height = 331
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BorderWidth = 10
          TabOrder = 1
          object scrollResultados: TScrollBox
            Left = 11
            Top = 11
            Width = 560
            Height = 309
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            object lblBenef: TLabel
              Left = 2
              Top = 32
              Width = 126
              Height = 13
              Caption = '    Nome do Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object PanelBeneficio: TPanel
              Left = 2
              Top = 2
              Width = 556
              Height = 25
              Color = 14286847
              TabOrder = 0
              object fcLabel1: TfcLabel
                Left = 6
                Top = 4
                Width = 72
                Height = 18
                Caption = 'Benefício:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TextOptions.Alignment = taLeftJustify
                TextOptions.Style = fclsLowered
                TextOptions.VAlignment = vaTop
                Transparent = True
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 687
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
      DockPos = 318
      inherited ToolbarSep971: TToolbarSep97
        Left = 241
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 244
        TabOrder = 2
        OnClick = bbtnCancelarClick
      end
      object btnVoltar: TBitBtn
        Left = 81
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Voltar'
        TabOrder = 1
        OnClick = btnVoltarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
          BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
          BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object btnDemonstrativo: TBitBtn
        Left = 161
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = btnDemonstrativoClick
        Glyph.Data = {
          D6020000424DD6020000000000003600000028000000100000000E0000000100
          180000000000A0020000000000000000000000000000000000008000FF8000FF
          0000000000000000000000000000000000000000000000000000000000000000
          008000FF8000FF8000FF8000FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6000000C6C6C60000008000FF8000FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00C6C6C60000008000FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600
          FFFF00FFFF00FFFFC6C6C6C6C6C60000000000000000008000FF000000C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6848484848484848484C6C6C6C6C6C60000
          00C6C6C60000008000FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000C6C6C6C6C6C6000000000000C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6
          C6000000C6C6C60000008000FF00000000000000000000000000000000000000
          0000000000000000000000C6C6C6000000C6C6C60000000000008000FF8000FF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6
          C6000000C6C6C60000008000FF8000FF8000FF000000FFFFFF00000000000000
          0000000000000000FFFFFF0000000000000000000000008000FF8000FF8000FF
          8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          008000FF8000FF8000FF8000FF8000FF8000FF8000FF000000FFFFFF00000000
          0000000000000000000000FFFFFF0000008000FF8000FF8000FF8000FF8000FF
          8000FF8000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000008000FF8000FF8000FF8000FF8000FF8000FF8000FF00000000000000
          00000000000000000000000000000000000000008000FF8000FF}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 967
    Top = 601
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object msParticipante: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'WEBACESSO.LOGINPESSOAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome'
      'Matrícula'
      'Inscrição'
      'Login')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN'
      'WEBACESSO')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'WEBACESSO.LOGINPESSOAL')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA = WEBACESSO.IDPESSOA (+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '58'
      '12'
      '12'
      '12')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 304
    Top = 232
  end
  object cdsBeneficio: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDSIMULABENEF'
        DataType = ftFloat
      end
      item
        Name = 'IDBENEFICIO'
        DataType = ftFloat
      end
      item
        Name = 'QUERYINICIAL'
        DataType = ftMemo
        Size = 4000
      end
      item
        Name = 'FLGROLLBACK'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FLGROLLBACK_1'
        DataType = ftFloat
      end
      item
        Name = 'IDREPORTS'
        DataType = ftFloat
      end
      item
        Name = 'ORIGEMCM'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPODEMONSTRA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HTMLDEMONSTRA'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 193
    Top = 232
    object cdsBeneficioIDSIMULABENEF: TFloatField
      FieldName = 'IDSIMULABENEF'
    end
    object cdsBeneficioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object cdsBeneficioQUERYINICIAL: TMemoField
      FieldName = 'QUERYINICIAL'
      BlobType = ftMemo
      Size = 4000
    end
    object cdsBeneficioFLGROLLBACK: TFloatField
      FieldName = 'FLGROLLBACK'
    end
    object cdsBeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsBeneficioIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object cdsBeneficioORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
    end
    object cdsBeneficioFLGTIPODEMONSTRA: TStringField
      FieldName = 'FLGTIPODEMONSTRA'
      FixedChar = True
      Size = 1
    end
    object cdsBeneficioHTMLDEMONSTRA: TStringField
      FieldName = 'HTMLDEMONSTRA'
      Size = 250
    end
  end
  object dtsBeneficio: TDataSource
    DataSet = cdsBeneficio
    Left = 205
    Top = 240
  end
  object cdsCamposProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 232
    object cdsCamposProcessoIDINPUT: TIntegerField
      FieldName = 'IDINPUT'
    end
    object cdsCamposProcessoNOMECAMPO: TStringField
      FieldName = 'NOMECAMPO'
    end
    object cdsCamposProcessoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
  end
  object cdsCamposSimulaBenef: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 63
    Top = 289
  end
  object cdsResultSimulaBenef: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 191
    Top = 289
  end
  object cdsDemonstrativo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 401
    Top = 231
  end
  object ppDemonstrativo: TppBDEPipeline
    DataSource = dtsDemonstrativo
    UserName = 'Demonstrativo'
    Left = 405
    Top = 287
  end
  object rptDemonstrativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 493
    Top = 288
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDemonstrativo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dtsDemonstrativo: TDataSource
    DataSet = cdsDemonstrativo
    Left = 493
    Top = 231
  end
  object cdsReports: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 301
    Top = 290
  end
end
