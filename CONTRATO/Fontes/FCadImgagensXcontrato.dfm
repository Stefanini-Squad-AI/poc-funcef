inherited FrmCadImgagensXcontrato: TFrmCadImgagensXcontrato
  Left = 76
  Top = 37
  Width = 690
  Height = 500
  HelpContext = 120010
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Imagens/Anexos de Contratos'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 682
    Height = 387
    inherited pnlMestre: TPanel
      Width = 680
      Height = 62
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object dbedContrato: TwwDBEdit
        Left = 16
        Top = 24
        Width = 497
        Height = 21
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 63
      Width = 680
      Height = 323
      Tabs.Strings = (
        '&Anexos'
        'I&magens')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgImagem')
      inherited pgctrlDetalhe: TPageControl
        Width = 582
        Height = 264
        inherited tbsDet: TTabSheet
          Caption = '&Anexos'
          inherited pnlControlesDet: TPanel
            Width = 574
            Height = 236
            object Label3: TLabel
              Left = 13
              Top = 32
              Width = 36
              Height = 13
              Caption = 'Anexo'
            end
            object dbedNomeArquivo: TwwDBEdit
              Left = 13
              Top = 48
              Width = 361
              Height = 21
              DataField = 'NOMEARQUIVO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnAnexar: TBitBtn
              Left = 376
              Top = 46
              Width = 28
              Height = 25
              TabOrder = 1
              OnClick = bbtnAnexarClick
              Glyph.Data = {
                1E060000424D1E06000000000000360000002800000017000000150000000100
                180000000000E8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000FFFF
                FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
                FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF0000
                00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
                FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000}
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 574
            Height = 236
            Selected.Strings = (
              'NOMEARQUIVO'#9'100'#9'Arquivos Anexados')
            MultiSelectOptions = [msoAutoUnselect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgMultiSelect]
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'I&magens'
          ImageIndex = 1
          object dbgImagem: TwwDBGrid
            Left = 0
            Top = 0
            Width = 566
            Height = 228
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsImagem
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            Visible = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
          object ScrollBox1: TScrollBox
            Left = 0
            Top = 0
            Width = 566
            Height = 228
            Align = alClient
            Color = clWindow
            ParentColor = False
            TabOrder = 0
            object iImagem: TImage
              Left = 0
              Top = 0
              Width = 558
              Height = 220
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = True
              OnDblClick = iImagemDblClick
            end
            object dbiImagem: TDBImage
              Left = 5
              Top = 40
              Width = 249
              Height = 179
              BorderStyle = bsNone
              DataField = 'IMAGEM'
              DataSource = dsImagem
              TabOrder = 0
              Visible = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 672
        inherited tb97BotoesDetalhe: TToolbar97
          Left = 3
          DockPos = 3
        end
        object tbAnexo: TToolbar97
          Left = 105
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 105
          TabOrder = 1
          object btnVisual: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Visualizar o arquivo'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
              033333777777777773333330777777703333333773F333773333333330888033
              33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
              FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
              8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
              8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
              8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
              8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
              FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnVisualClick
          end
          object btnSalva: TToolbarButton97
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Salvar o arquivo em disco'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
              00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
              00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
              00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
              0003737FFFFFFFFF7F7330099999999900333777777777777733}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSalvaClick
          end
        end
        object tbImagem: TToolbar97
          Left = 170
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 170
          TabOrder = 2
          object bbtnImagem: TToolbarButton97
            Left = 175
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Abrir imagem do disco'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
              555555777777777FF5555500000000805555557777777777FF555550BBBBB008
              05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
              005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
              055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
              055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
              05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
              05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
              005555555775FFFF77F555555570000000555555555777777755}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bbtnImagemClick
          end
          object btnUltimaPagina: TToolbarButton97
            Left = 150
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Última Imagem'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888004444400
              88888887788888778F88887444444444088888788888888878F887C444444444
              408887F88F888F8887F887C4F444F4444088878878F878F8878F7C44FF44FF44
              44087F88778F778F887F7C44FFF4FFF444087F8877787778F87F7C44FFFFFFFF
              44087F8877777777887F7C44FFF4FFF444087F8877787778887F7C44FF44FF44
              440878F877887788887887C4F444F444408887F87888788887F887C444444444
              4088878F888888888788887CC444444408888878FF88888F788888877CCCCC77
              8888888778FFFF77888888888777778888888888877777888888}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnUltimaPaginaClick
          end
          object btnProximaPagina: TToolbarButton97
            Left = 125
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Próxima Imagem'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888004444400
              88888887788888778F88887444444444088888788888888878F887C444444444
              408887F8888F888887F887C444F44444408887888878F888878F7C4444FF4444
              44087F8888778F88887F7C4444FFF44444087F88887778F8887F7C4444FFFF44
              44087F8888777788887F7C4444FFF44444087F8888777888887F7C4444FF4444
              440878F888778888887887C444F44444408887F88878888887F887C444444444
              4088878F888888888788887CC444444408888878FF88888F788888877CCCCC77
              8888888778FFFF77888888888777778888888888877777888888}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnProximaPaginaClick
          end
          object btnPaginaAnterior: TToolbarButton97
            Left = 100
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Imagem Anterior'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888004444400
              88888887788888778F88887444444444088888788888888878F887C444444444
              408887F888888F8887F887C44444F4444088878888887F88878F7C44444FF444
              44087F8888877F88887F7C4444FFF44444087F8888777F88887F7C444FFFF444
              44087F8887777F88887F7C4444FFF44444087F8888777F88887F7C44444FF444
              440878F888877F88887887C44444F444408887F88888788887F887C444444444
              4088878F888888888788887CC444444408888878FF88888F788888877CCCCC77
              8888888778FFFF77888888888777778888888888877777888888}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPaginaAnteriorClick
          end
          object btnPaginaInicial: TToolbarButton97
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Primeira Imagem'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888004444400
              88888887788888778F88887444444444088888788888888878F887C444444444
              408887F8888F888F87F887C444F444F440888788887F887F878F7C444FF44FF4
              44087F88877F877F887F7C44FFF4FFF444087F88777F777F887F7C4FFFFFFFF4
              44087F877777777F887F7C44FFF4FFF444087F88777F777F887F7C444FF44FF4
              440878F8877F877F887887C444F444F4408887F88878887887F887C444444444
              4088878F888888888788887CC444444408888878FF88888F788888877CCCCC77
              8888888778FFFF77888888888777778888888888877777888888}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPaginaInicialClick
          end
          object bbtnZoomOUT: TToolbarButton97
            Left = 50
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Diminuir Tamanho'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
              333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
              333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
              33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
              333337F3333337F333333078F8F870333333373FF333F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bbtnZoomOUTClick
          end
          object bbtnZoomIN: TToolbarButton97
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Aumentar Tamanho'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
              33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
              3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
              33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
              333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bbtnZoomINClick
          end
          object bbtnTamOriginal: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Tamanho Original'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
              BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
              BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
              BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
              BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
              EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
              EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
              EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
              EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
            ImageIndex = 0
            NoBorder = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bbtnTamOriginalClick
          end
        end
        object pnlPagina: TPanel
          Left = 439
          Top = 1
          Width = 133
          Height = 28
          Align = alTop
          TabOrder = 3
          object Label1: TLabel
            Left = 12
            Top = 8
            Width = 44
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Página:'
          end
          object dbspPagina: TwwDBSpinEdit
            Left = 61
            Top = 4
            Width = 65
            Height = 21
            Anchors = [akTop, akRight]
            Increment = 1
            MaxValue = 100
            DataField = 'PAGINA'
            DataSource = dsImagem
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
      end
      inherited Dock974: TDock97
        Left = 586
        Height = 264
      end
    end
  end
  inherited Dock972: TDock97
    Width = 682
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 682
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ds: TwwDataSource
    Left = 518
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 560
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 476
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Contrato'
    Colunas.Strings = (
      'C.NOMECONTRATO'
      'C.DATAASSINATURA'
      'C.DATABASECONTRATO'
      'C.DATAPREVENCERRA'
      'C.DATAEFETENCERRA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'D'
      'D')
    Descricao.Strings = (
      'Nome do Contrato'
      'Data De Assinatura'
      'Data Base'
      'Data Prev. Encerramento'
      'Data do Encerramento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR C')
    CamposChave.Strings = (
      'C.IDCONTRATO'
      'C.NOMECONTRATO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '10'
      '10'
      '10'
      '10')
    Left = 288
    Top = 95
  end
  inherited CmeDetalhe: TCmEventosCadastro
    ApplyDelete = CmeDetalheApplyDelete
    Left = 604
    Top = 7
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsAnexos
    Left = 222
    Top = 263
  end
  object cdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsImagemAfterScroll
    Left = 501
    Top = 116
  end
  object cdsAnexos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 264
    Data = {
      670200009619E0BD010000001800000006000900000003000000E30008494449
      4D4147454D08000400000000000A4944434F4E545241544F0800040000000000
      06504147494E41080004000000000008455854454E53414F0100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      0200040007464C475449504F0100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000B4E4F4D45415251
      5549564F01004900000001000557494454480200020064000100044C43494404
      000100090800000000000000000000C06140000000000092AB40000000000000
      F03F03424D5001490A616E65786F322E626D7000100000000000006062400000
      00000092AB40042E70646601410A7465737465342E7064660010000000000000
      006240000000000092AB40042E70646601410B696E7374616C6C2E7064660010
      000000000000206240000000000092AB40042E70646601410A5265616465722E
      7064660010000000000000A062400000000000002440042E74787401410E6465
      766F6C7669646F352E7478740010000000000000806240000000000092AB4003
      424D50014909616E65786F2E626D700010000000000000C06240000000000000
      2440042E646F6301412241636F6D70616E68616D656E746F325F434253202D20
      32383034323030332E646F630010000000000000E06240000000000000244004
      2E70646601411C416C6D6F786172696661646F5F446F635F5465636E6963612E
      7064660010000000000000006340000000000092AB40042E54585401410D434D
      4C6F674572726F2E545854}
  end
  object dsImagem: TwwDataSource
    DataSet = cdsImagem
    OnStateChange = dsImagemStateChange
    OnDataChange = dsImagemDataChange
    Left = 561
    Top = 112
  end
  object opdImagem: TOpenPictureDialog
    Filter = 
      'Gráficos(*.bmp;*.jpg;*.jpeg)|*.bmp;*.jpg;*.jpeg;|Bitmaps (*.bmp)' +
      '|*.bmp|Jpeg(*.jpg)|*.jpg;*.jpeg'
    Left = 624
    Top = 328
  end
  object OpenDlg: TOpenDialog
    Filter = 
      'Documentos(*.doc, *.rtf, *.txt, *.pdf)|*.doc; *.rtf; *.txt; *.pd' +
      'f'
    Left = 625
    Top = 272
  end
  object SaveDlg: TSaveDialog
    Filter = 
      'Documentos(*.doc, *.rtf, *.txt, *.pdf)|*.doc; *.rtf; *.txt; *.pd' +
      'f'
    Left = 593
    Top = 272
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from imagenscontrato')
    ClientDataSet = cdsAnexos
    Left = 429
    Top = 100
  end
end
