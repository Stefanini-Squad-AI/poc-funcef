inherited frmCadMontaFluxo: TfrmCadMontaFluxo
  Left = 75
  Top = 178
  Caption = 'Montagem das Linhas dos Fluxos'
  ClientHeight = 430
  ClientWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 641
    Height = 344
    object PgcMontaFluxo: TPageControl
      Left = 5
      Top = 5
      Width = 631
      Height = 334
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
        object PnlTiposDocumento: TPanel
          Left = 0
          Top = 152
          Width = 622
          Height = 152
          TabOrder = 2
          object btnAdicionaTipoDoc: TSpeedButton
            Left = 296
            Top = 53
            Width = 23
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
            OnClick = btnAdicionaTipoDocClick
          end
          object btnSubtraiTipDoc: TSpeedButton
            Left = 294
            Top = 89
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
            OnClick = btnSubtraiTipDocClick
          end
          object Panel4: TPanel
            Left = 336
            Top = 1
            Width = 281
            Height = 39
            BevelInner = bvLowered
            Color = clGray
            TabOrder = 0
            object Label1: TLabel
              Left = 14
              Top = 11
              Width = 248
              Height = 16
              Alignment = taCenter
              Caption = 'Tipos de Documento Selecionados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object dbgTiposDocSelecionados: TwwDBGrid
            Left = 336
            Top = 42
            Width = 281
            Height = 106
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição do Tipo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDetTipo
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel5: TPanel
            Left = 3
            Top = 1
            Width = 274
            Height = 39
            BevelInner = bvLowered
            Color = clGray
            TabOrder = 2
            object Label2: TLabel
              Left = 14
              Top = 11
              Width = 240
              Height = 16
              Alignment = taCenter
              Caption = 'Tipos de Documento Disponíveis'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object dbgTiposDocDisponiveis: TwwDBGrid
            Left = 3
            Top = 42
            Width = 274
            Height = 105
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Tipo de Documento'#9'F')
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
            OnDblClick = spdVai2Click
            IndicatorColor = icBlack
          end
        end
        object pnlLinhas: TPanel
          Left = 0
          Top = 152
          Width = 622
          Height = 153
          TabOrder = 0
          object spdVai2: TSpeedButton
            Left = 294
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
            OnClick = spdVai2Click
          end
          object spdVolta2: TSpeedButton
            Left = 294
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
            OnClick = spdVolta2Click
          end
          object dbgLinhasPos: TwwDBGrid
            Left = 0
            Top = 46
            Width = 274
            Height = 105
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição da Linha')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsLinhasPos
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
            OnDblClick = spdVai2Click
            IndicatorColor = icBlack
          end
          object dbgLinhasSel: TwwDBGrid
            Left = 344
            Top = 46
            Width = 274
            Height = 105
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição da Linha')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDetLinha
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
            OnDblClick = spdVolta2Click
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 344
            Top = 4
            Width = 274
            Height = 39
            BevelInner = bvLowered
            Caption = 'Panel1'
            Color = clGray
            TabOrder = 1
            object lblLinhasSel: TLabel
              Left = 33
              Top = 9
              Width = 209
              Height = 22
              Alignment = taCenter
              Caption = 'Linhas Selecionadas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel2: TPanel
            Left = 2
            Top = 4
            Width = 274
            Height = 39
            BevelInner = bvLowered
            Caption = 'Panel1'
            Color = clGray
            TabOrder = 2
            object lblLinhasP: TLabel
              Left = 49
              Top = 9
              Width = 176
              Height = 22
              Alignment = taCenter
              Caption = 'Linhas Possíveis'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object pnlTipoRecDes: TPanel
          Left = 0
          Top = 152
          Width = 622
          Height = 152
          TabOrder = 1
          object spdVai1: TSpeedButton
            Left = 294
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
            OnClick = spdVai1Click
          end
          object spdVolta1: TSpeedButton
            Left = 294
            Top = 89
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
            OnClick = spdVolta1Click
          end
          object TreeTiposPos: TCMTreeView
            Left = 3
            Top = 42
            Width = 274
            Height = 106
            PodeNavegar = True
            DataSource = dsTipoRecDes
            CampoChave = qryTipoRecDesCODTIPRECDES
            CampoDescricao = qryTipoRecDesDESCRICAO
            CampoTipo = qryTipoRecDesANASINT
          end
          object pnlTituloP: TPanel
            Left = 336
            Top = 1
            Width = 281
            Height = 39
            BevelInner = bvLowered
            Color = clGray
            TabOrder = 1
            object lblTituloP: TLabel
              Left = 38
              Top = 9
              Width = 198
              Height = 22
              Alignment = taCenter
              Caption = 'Tipos Selecionados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object dbgTiposSel: TwwDBGrid
            Left = 336
            Top = 42
            Width = 281
            Height = 106
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição do Tipo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDetTipo
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
          object pnlTitulosDe: TPanel
            Left = 3
            Top = 1
            Width = 274
            Height = 39
            BevelInner = bvLowered
            Color = clGray
            TabOrder = 3
            object lblTitulosDe: TLabel
              Left = 54
              Top = 9
              Width = 165
              Height = 22
              Alignment = taCenter
              Caption = 'Tipos Possíveis'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object dbeDescricao: TwwDBEdit
          Left = 278
          Top = 22
          Width = 331
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbgTipoCalculo: TDBRadioGroup
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
          TabOrder = 4
          Values.Strings = (
            'R'
            'P'
            'C'
            'D'
            'L'
            'T')
          OnClick = dbgTipoCalculoClick
        end
        object gbAcumula: TGroupBox
          Left = 278
          Top = 49
          Width = 216
          Height = 61
          TabOrder = 5
          object dbcAcumula: TDBCheckBox
            Left = 8
            Top = 22
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
          Height = 61
          Caption = 'Posição do Total'
          DataField = 'POSICAOTOTAL'
          DataSource = ds
          Items.Strings = (
            'Início'
            'Fim')
          TabOrder = 6
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
          Height = 306
          Align = alClient
          Indent = 19
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
    Top = 391
    Width = 641
    inherited tb97Fundo: TToolbar97
      Left = 419
      DockPos = 419
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 129
      DockPos = 129
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 163
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
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM MONTAFLUXO')
    Left = 408
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 320
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MONTAFLUXO'
      'set'
      '  CODLINHAFLUXO = :CODLINHAFLUXO,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDPESSOA = :IDPESSOA,'
      '  ORDEM = :ORDEM,'
      '  TIPOCALCULO = :TIPOCALCULO,'
      '  FLGACUMULA = :FLGACUMULA,'
      '  POSICAOTOTAL = :POSICAOTOTAL'
      'where'
      '  CODLINHAFLUXO = :OLD_CODLINHAFLUXO')
    InsertSQL.Strings = (
      'insert into MONTAFLUXO'
      
        '  (CODLINHAFLUXO, DESCRICAO, IDPESSOA, ORDEM, TIPOCALCULO, FLGAC' +
        'UMULA, '
      '   POSICAOTOTAL)'
      'values'
      
        '  (:CODLINHAFLUXO, :DESCRICAO, :IDPESSOA, :ORDEM, :TIPOCALCULO, ' +
        ':FLGACUMULA, '
      '   :POSICAOTOTAL)')
    DeleteSQL.Strings = (
      'delete from MONTAFLUXO'
      'where'
      '  CODLINHAFLUXO = :OLD_CODLINHAFLUXO')
    Left = 480
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MONTAFLUXO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'MONTAFLUXO')
    CamposChave.Strings = (
      'MONTAFLUXO.CODLINHAFLUXO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '10')
    Left = 528
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 440
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 360
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 576
    Top = 0
  end
  object qryTipoRecDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from TIPORECEBDESEMB where recpag='#39'P'#39' and idpessoa = 1')
    ValidateWithMask = True
    Left = 34
    Top = 255
    object qryTipoRecDesCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryTipoRecDesRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
    object qryTipoRecDesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
    end
    object qryTipoRecDesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoRecDesANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
  end
  object dsTipoRecDes: TwwDataSource
    DataSet = qryTipoRecDes
    Left = 33
    Top = 303
  end
  object qryParamCapCar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMCAP WHERE IDPESSOA=1 AND RECPAG='#39'P'#39)
    ValidateWithMask = True
    Left = 568
    Top = 80
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 384
    Top = 256
  end
  object updDetLinha: TUpdateSQL
    Left = 448
    Top = 288
  end
  object dsDetLinha: TwwDataSource
    AutoEdit = False
    DataSet = qryDetLinha
    Left = 448
    Top = 272
  end
  object qryDetLinha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.*,'
      '   M.CODLINHAFLUXO,'
      '   M.DESCRICAO'
      'FROM'
      '   COMPFLUXO C,'
      '   MONTAFLUXO M'
      'WHERE'
      '   C.CODCOMPLINHA = M.CODLINHAFLUXO'
      ' ')
    UpdateObject = updDetLinha
    ValidateWithMask = True
    Left = 448
    Top = 256
  end
  object updDetTipo: TUpdateSQL
    Left = 512
    Top = 288
  end
  object dsDetTipo: TwwDataSource
    AutoEdit = False
    DataSet = qryDetTipo
    Left = 512
    Top = 272
  end
  object qryDetTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.*,'
      '   T.CODTIPRECDES,'
      '   T.RECPAG,'
      '   T.IDPESSOA,'
      '   T.DESCRICAO'
      'FROM'
      '   COMPFLUXO C,'
      '   TIPORECEBDESEMB T'
      'WHERE'
      '   (C.CODTIPRECDES = T.CODTIPRECDES) AND'
      '   (C.IDPESSOA = T.IDPESSOA)  AND'
      '   (C.RECPAG = T.RECPAG)')
    UpdateObject = updDetTipo
    ValidateWithMask = True
    Left = 512
    Top = 256
  end
  object updLinhasPos: TUpdateSQL
    Left = 112
    Top = 288
  end
  object dsLinhasPos: TwwDataSource
    AutoEdit = False
    DataSet = qryLinhasPos
    Left = 112
    Top = 272
  end
  object qryLinhasPos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM MONTAFLUXO ')
    UpdateObject = updLinhasPos
    ValidateWithMask = True
    Left = 112
    Top = 256
  end
  object updTiposDocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCRECPAG'
      'set'
      '  CODTIPDOC = :CODTIPDOC,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTIPDOC = :OLD_CODTIPDOC')
    InsertSQL.Strings = (
      'insert into TIPODOCRECPAG'
      '  (CODTIPDOC, DESCRICAO)'
      'values'
      '  (:CODTIPDOC, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPODOCRECPAG'
      'where'
      '  CODTIPDOC = :OLD_CODTIPDOC')
    Left = 200
    Top = 288
  end
  object dsTiposDocumento: TwwDataSource
    DataSet = qryTiposDocumento
    Left = 200
    Top = 272
  end
  object qryTiposDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TD.CODTIPDOC,'
      '   TD.DESCRICAO,'
      '   TD.RECPAG'
      'FROM'
      '   TIPODOCRECPAG TD'
      'WHERE'
      '   NOT Exists(SELECT CF.CODTIPDOC'
      '              FROM COMPFLUXO CF'
      '              WHERE (CF.CODTIPDOC=TD.CODTIPDOC) AND'
      '                    (CF.CODLINHAFLUXO=:CODLINHAFLUXO) AND NOT'
      '                    (TD.CODTIPDOC IS NULL)) AND'
      '   (TD.RECPAG=:RECPAG)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updTiposDocumento
    ValidateWithMask = True
    Left = 200
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODLINHAFLUXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end>
  end
  object qryTestaRepeticao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 384
    Top = 304
  end
  object updDetAux: TUpdateSQL
    Left = 576
    Top = 272
  end
  object qryDetAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES,'
      '   '#39'12345678901234567890123456789012345'#39' AS DESCRICAO,'
      '   RECPAG'
      'FROM'
      '   COMPFLUXO'
      'WHERE'
      '   (1=2)'
      ' '
      ' ')
    UpdateObject = updDetAux
    ValidateWithMask = True
    Left = 576
    Top = 256
  end
  object qryMapaFluxo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MF.DESCRICAO AS LINHAFLUXO,'
      '   CF.IDSEQUENCIA AS GRUPO,'
      '   TRD.CODTIPRECDES,'
      
        '   DECODE(CF.CODCOMPLINHA,MF.CODLINHAFLUXO, TRD.DESCRICAO, LS.DE' +
        'SCRICAO) AS TIPORECDES,'
      '   TRD.RECPAG,'
      '   CF.CODTIPDOC,'
      '   TDC.DESCRICAO AS TIPODOC,'
      '   TDC.RECPAG AS RECPAGDOC,'
      '   DECODE(RTrim(CF.CODTIPDOC),null,0,1) AS TIPOLINHA'
      'FROM'
      '   MONTAFLUXO MF,'
      '   COMPFLUXO CF,'
      '   TIPORECEBDESEMB TRD,'
      '   TIPODOCRECPAG TDC,'
      '      '
      '   (SELECT '
      '       CODLINHAFLUXO, '
      '       DESCRICAO '
      '    FROM'
      '       MONTAFLUXO'
      '    WHERE'
      '       IDPESSOA= :IDPessoa) LS'
      ''
      'WHERE'
      '   (MF.IDPESSOA = :IDPessoa) AND'
      '   (MF.CODLINHAFLUXO=CF.CODLINHAFLUXO(+)) AND'
      '   (MF.IDPESSOA=CF.IDPESSOA(+)) AND'
      
        '   (RTrim(CF.CODTIPRECDES)=SUBSTR(TRD.CODTIPRECDES(+),1,Length(R' +
        'Trim(CF.CODTIPRECDES)))) AND'
      '   (CF.RECPAG=TRD.RECPAG(+)) AND'
      '   (CF.CODTIPDOC=TDC.CODTIPDOC(+)) AND'
      '   (CF.IDPESSOA=TRD.IDPESSOA(+)) AND'
      '   (CF.CODCOMPLINHA=LS.CODLINHAFLUXO(+))'
      ' '
      'ORDER BY MF.ORDEM,TRD.CODTIPRECDES'
      ''
      ''
      ''
      ' '
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 569
    Top = 132
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
  end
end
