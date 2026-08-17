inherited FrmCadMontaFluxoMT: TFrmCadMontaFluxoMT
  Left = 87
  Top = 141
  HelpContext = 90040
  Caption = 'Cadastro de Montagem de Fluxo de Caixa'
  ClientHeight = 440
  ClientWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 641
    Height = 354
    object PgcMontaFluxo: TPageControl
      Left = 5
      Top = 5
      Width = 631
      Height = 344
      ActivePage = tbshCadastro
      Align = alClient
      TabOrder = 0
      object tbshCadastro: TTabSheet
        Caption = 'Cadastro'
        object lblDescricao: TLabel
          Left = 278
          Top = 7
          Width = 163
          Height = 13
          Caption = 'Descrição da Linha do Fluxo'
        end
        object pnlComposicaoLinhas: TPanel
          Left = 0
          Top = 152
          Width = 623
          Height = 164
          Align = alBottom
          TabOrder = 0
          object btnIncluirComposicao: TSpeedButton
            Left = 296
            Top = 53
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333FF3333333333333003333
              3333333333773FF3333333333309003333333333337F773FF333333333099900
              33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
              99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
              33333333337F3F77333333333309003333333333337F77333333333333003333
              3333333333773333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btnIncluirComposicaoClick
          end
          object btnExcluirComposicao: TSpeedButton
            Left = 296
            Top = 86
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btnExcluirComposicaoClick
          end
          object dbgSelecionados: TwwDBGrid
            Left = 336
            Top = 46
            Width = 282
            Height = 115
            Selected.Strings = (
              'DESCLINHA'#9'60'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsComposicaoLinha
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
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
          object dbgTiposDocumento: TwwDBGrid
            Left = 0
            Top = 46
            Width = 281
            Height = 115
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo de Documento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsTiposDocumento
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
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
          object dbgLinhas: TwwDBGrid
            Left = 0
            Top = 48
            Width = 281
            Height = 113
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Linha do Fluxo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsLinhasFluxo
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 2
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
          object TrvTiposRD: TfcTreeView
            Left = 0
            Top = 48
            Width = 281
            Height = 113
            Indent = 19
            Options = [tvoExpandOnDblClk, tvoExpandButtons3D, tvoHideSelection, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips]
            Items.StreamVersion = 1
            Items.Data = {00000000}
            TabOrder = 5
            OnChanging = TrvTiposRDChanging
          end
          object pnlTituloDisponiveis: TPanel
            Left = 2
            Top = 4
            Width = 279
            Height = 39
            BevelInner = bvLowered
            Caption = 'Linhas Possíveis'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object pnlTituloSelecionados: TPanel
            Left = 336
            Top = 4
            Width = 284
            Height = 39
            BevelInner = bvLowered
            Caption = 'Linhas Selecionadas'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
        end
        object dbeDescricao: TwwDBEdit
          Left = 278
          Top = 22
          Width = 331
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbrgTipoCalculo: TDBRadioGroup
          Left = 7
          Top = 4
          Width = 258
          Height = 141
          Caption = 'Definições para Compor o Fluxo'
          DataField = 'TIPOCALCULO'
          DataSource = ds
          Items.Strings = (
            'Seleção de Tipos de &Recebimentos'
            'Seleção de Tipos de &Desembolso'
            'Tipo de Documento de Re&cebimento'
            'Tipo de Documento de De&sembolso'
            'Somatório de Outras &Linhas'
            'Somente &Título')
          TabOrder = 2
          Values.Strings = (
            'R'
            'P'
            'C'
            'D'
            'L'
            'T')
          OnClick = dbrgTipoCalculoClick
        end
        object gbAcumula: TGroupBox
          Left = 278
          Top = 49
          Width = 216
          Height = 64
          TabOrder = 3
          object dbcAcumula: TDBCheckBox
            Left = 8
            Top = 26
            Width = 201
            Height = 17
            Caption = 'Acumula os Valores desta linha'
            DataField = 'FLGACUMULA'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object dbrgPosicaoTotal: TDBRadioGroup
          Left = 496
          Top = 49
          Width = 113
          Height = 64
          Caption = 'Posição do Total'
          DataField = 'POSICAOTOTAL'
          DataSource = ds
          Items.Strings = (
            'Início'
            'Fim')
          TabOrder = 4
          Values.Strings = (
            'I'
            'F')
        end
      end
      object tbshMapaFluxo: TTabSheet
        Caption = 'Mapa do Fluxo'
        ImageIndex = 1
        object TrvMapaFluxo: TfcTreeView
          Left = 0
          Top = 0
          Width = 623
          Height = 316
          Align = alClient
          Indent = 19
          Options = [tvoExpandOnDblClk, tvoExpandButtons3D, tvoHideSelection, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoToolTips]
          Items.StreamVersion = 1
          Items.Data = {00000000}
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 641
    inherited Toolbar971: TToolbar97
      object sbtnOrdenar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Ordenar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
          FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
          FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
          FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
          00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
          55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
          5555777577775755555550FBFB0555555555575FFF7555555555570000755555
          5555557777555555555555555555555555555555555555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnOrdenarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 641
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 440
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90040
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
      DockPos = 102
      inherited ToolbarSep971: TToolbarSep97
        Left = 163
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        TabOrder = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 166
        TabOrder = 2
      end
      object bbtnVerificar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Verificar'
        ModalResult = 2
        TabOrder = 0
        OnClick = bbtnVerificarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 608
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 368
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 576
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 464
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MONTAFLUXO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Linha de Fluxo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MONTAFLUXO')
    CamposChave.Strings = (
      'MONTAFLUXO.CODLINHAFLUXO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 544
    Top = 0
  end
  object CdsComposicaoLinha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 320
  end
  object cdsTiposRD: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'RECPAG;CODTIPRECDES'
    Params = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
        Value = '1'
      end>
    ProviderName = 'dspTiposRD'
    Left = 32
    Top = 304
  end
  object dsTiposRD: TwwDataSource
    DataSet = cdsTiposRD
    Left = 32
    Top = 288
  end
  object dsComposicaoLinha: TwwDataSource
    DataSet = CdsComposicaoLinha
    Left = 536
    Top = 320
  end
  object cdsTiposDocumento: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'RECPAG;DESCRICAO'
    Params = <>
    ProviderName = 'dspTiposDocumento'
    Left = 120
    Top = 304
  end
  object dsTiposDocumento: TwwDataSource
    DataSet = cdsTiposDocumento
    Left = 120
    Top = 288
  end
  object cdsLinhasFluxo: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <
      item
        DataType = ftFloat
        Name = 'CodLinhaFluxo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CodLinhaFluxo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosTipos'
        ParamType = ptInput
      end>
    ProviderName = 'dspLinhasFluxo'
    Left = 224
    Top = 304
    object cdsLinhasFluxoDESCRICAO: TStringField
      DisplayLabel = 'Linha do Fluxo'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsLinhasFluxoCODLINHAFLUXO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODLINHAFLUXO'
      Visible = False
    end
  end
  object dsLinhasFluxo: TwwDataSource
    DataSet = cdsLinhasFluxo
    Left = 224
    Top = 288
  end
  object cdsMapaFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 288
  end
end
