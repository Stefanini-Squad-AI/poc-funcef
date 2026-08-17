inherited FrmCadastroMestreDetMT: TFrmCadastroMestreDetMT
  Left = 339
  Top = 134
  Caption = 'Cadastro Mestre Detalhe Multi Tier'
  ClientHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 360
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 505
      Height = 98
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object tbcDetalhe: TTabControlDetalhe
      Left = 1
      Top = 99
      Width = 505
      Height = 260
      Align = alClient
      TabOrder = 1
      Tabs.Strings = (
        'Detalhe')
      TabIndex = 0
      OnChange = tbcDetalheChange
      OnChanging = tbcDetalheChanging
      detdbGrids.Strings = (
        'dbgrdDet')
      object pgctrlDetalhe: TPageControl
        Left = 4
        Top = 55
        Width = 407
        Height = 201
        ActivePage = tbsDet
        Align = alClient
        TabOrder = 1
        object tbsDet: TTabSheet
          Caption = 'Detalhe'
          object pnlControlesDet: TPanel
            Left = 0
            Top = 0
            Width = 399
            Height = 173
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
          end
          object dbgrdDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 399
            Height = 173
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
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
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
        end
      end
      object Dock973: TDock97
        Left = 4
        Top = 24
        Width = 497
        Height = 31
        AllowDrag = False
        BoundLines = [blTop, blBottom, blLeft, blRight]
        object tb97BotoesDetalhe: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 0
          TabOrder = 0
          object sbtnInsDet: TToolbarButton97
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Inserir'
            AllowAllUp = True
            GroupIndex = 2
            ImageIndex = 0
            Images = ImlPadrao
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnInsDetClick
          end
          object sbtnAltDet: TToolbarButton97
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Alterar'
            AllowAllUp = True
            GroupIndex = 2
            ImageIndex = 1
            Images = ImlPadrao
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAltDetClick
          end
          object sbtnExcluiDet: TToolbarButton97
            Left = 50
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Excluir'
            AllowAllUp = True
            ImageIndex = 2
            Images = ImlPadrao
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnExcluiDetClick
          end
        end
      end
      object Dock974: TDock97
        Left = 411
        Top = 55
        Width = 90
        Height = 201
        AllowDrag = False
        BoundLines = [blLeft]
        Position = dpRight
        object tb97Detalhe: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97Detalhe'
          DockPos = 0
          TabOrder = 0
          object bbtnOkDet: TBitBtn
            Left = 0
            Top = 0
            Width = 85
            Height = 27
            Caption = 'OK'
            TabOrder = 0
            OnClick = bbtnOkDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
            NumGlyphs = 2
          end
          object bbtnCancelarDet: TBitBtn
            Left = 0
            Top = 27
            Width = 85
            Height = 27
            Cancel = True
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = bbtnCancelarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            Spacing = -1
          end
          object bbtnVoltarDet: TBitBtn
            Left = 0
            Top = 54
            Width = 85
            Height = 27
            Cancel = True
            Caption = '&Voltar'
            TabOrder = 2
            OnClick = bbtnVoltarDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 146
  end
  inherited ds: TwwDataSource
    Left = 198
    Top = 63
  end
  inherited ImlPadrao: TImageList
    Left = 144
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 248
  end
  inherited Cds: TCMClientDataSet
    Left = 196
    Top = 111
  end
  inherited MontaSelect: TMontaSelect
    Left = 248
  end
  object CmeDetalhe: TCmEventosCadastro
    Operacao = opVazio
    RepetirInsert = True
    OnInsert = CmeDetalheInsert
    OnDelete = CmeDetalheDelete
    OnEdit = CmeDetalheEdit
    OnCancel = CmeDetalheCancel
    OnConfirma = CmeDetalheConfirma
    OnAtualizaBotoes = CmeDetalheAtualizaBotoes
    DataSource = dsDet
    OpenDsAutomatico = False
    Left = 308
    Top = 63
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    Left = 310
    Top = 111
  end
end
