inherited frmExecCheckList: TfrmExecCheckList
  Left = 129
  Top = 145
  HelpContext = 439007
  Caption = 'Check List de Indicadores'
  ClientHeight = 346
  ClientWidth = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 570
    Height = 307
    inherited PagControle: TPageControl
      Width = 568
      Height = 305
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 560
          Caption = 'Verificação das Apurações [ Seleção ]'
        end
        object Label2: TLabel
          Left = 16
          Top = 91
          Width = 99
          Height = 13
          Caption = 'Tipo de Relatório'
        end
        object Label4: TLabel
          Left = 16
          Top = 134
          Width = 52
          Height = 13
          Caption = 'Relatório'
        end
        object DBcboTipo: TwwDBLookupCombo
          Left = 16
          Top = 105
          Width = 449
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          LookupTable = cdsTipo
          LookupField = 'IDTIPO'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 345
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoCloseUp
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 192
          Width = 265
          Height = 73
          Caption = 'Competência'
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 24
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object Label3: TLabel
            Left = 176
            Top = 24
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object cboMes: TComboBox
            Left = 16
            Top = 37
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spnAno: TwwDBSpinEdit
            Left = 173
            Top = 37
            Width = 66
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object dbcboSubTipo: TwwDBLookupCombo
          Left = 16
          Top = 148
          Width = 449
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          LookupTable = cdsSubTipo
          LookupField = 'IDSUBTIPO'
          Style = csDropDownList
          DropDownCount = 6
          DropDownWidth = 345
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        inline molImovel1: TmolImovel
          Left = 8
          Top = 40
          Width = 545
          TabOrder = 3
          inherited edtImovel: TEdit
            Width = 449
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 456
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 480
          end
        end
        object cbErros: TCheckBox
          Left = 296
          Top = 248
          Width = 241
          Height = 17
          Caption = 'Exibir somente as apurações com erros'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 560
          Caption = 'Verificação das Apurações [ Resultado ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 249
          Width = 560
          Height = 46
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 0
          object btnImprime: TfcShapeBtn
            Left = 14
            Top = 7
            Width = 81
            Height = 33
            Caption = 'Imprimir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              0003377777777777777308888888888888807F33333333333337088888888888
              88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
              8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
              8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnImprimeClick
          end
          object btnSalvar: TfcShapeBtn
            Left = 106
            Top = 7
            Width = 81
            Height = 33
            Hint = 'Salvar arquivo de Log'
            Caption = 'Salvar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
              FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
              FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
              007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
              7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
              99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
              99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
              99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
              93337FFFF7737777733300000033333333337777773333333333}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            ShowHint = True
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnSalvarClick
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 560
          Height = 225
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object meLog: TMemo
            Left = 1
            Top = 1
            Width = 558
            Height = 223
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 307
    Width = 570
    inherited tb97Fundo: TToolbar97
      Left = 201
      inherited sep1: TToolbarSep97
        Left = 282
      end
      inherited bbtnSair: TBitBtn
        Left = 201
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 284
      end
      inherited btnContinuar: TfcShapeBtn
        Caption = 'Confirmar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
      end
      inherited btnConfirmar: TfcShapeBtn
        Width = 35
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 519
    Top = 93
    object cdsTipoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsTipoIDTIPO: TFloatField
      FieldName = 'IDTIPO'
      Visible = False
    end
  end
  object cdsSubTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 519
    Top = 107
    object cdsSubTipoIDSUBTIPO: TFloatField
      FieldName = 'IDSUBTIPO'
    end
    object cdsSubTipoIDTIPO: TFloatField
      FieldName = 'IDTIPO'
    end
    object cdsSubTipoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object cdsResult: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 517
    Top = 157
    object cdsResultLINHA: TStringField
      DisplayWidth = 150
      FieldName = 'LINHA'
      FixedChar = True
      Size = 150
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'Txt'
    Filter = 'Arquivo Texto|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 521
    Top = 20
  end
  object pplResult: TppBDEPipeline
    DataSource = dsResult
    UserName = 'lResult'
    Left = 521
    Top = 220
    object pplppField1: TppField
      FieldAlias = 'LINHA'
      FieldName = 'LINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object ppResult: TppReport
    AutoStop = False
    DataPipeline = pplResult
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
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 521
    Top = 235
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplResult'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Verificação dos Lançamentos Apurados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8202
        mmWidth = 197380
        BandType = 0
      end
      object lblImovel: TppLabel
        UserName = 'lblImovel'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 16140
        mmWidth = 137054
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 14817
        mmWidth = 197300
        BandType = 0
      end
      object lblCompetencia: TppLabel
        UserName = 'lblCompetencia'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 139700
        mmTop = 16140
        mmWidth = 57415
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 22489
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'LINHA'
        DataPipeline = pplResult
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplResult'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 195792
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
  end
  object dsResult: TDataSource
    DataSet = cdsResult
    Left = 517
    Top = 171
  end
end
