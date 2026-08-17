inherited frmMTCadClassedeBem: TfrmMTCadClassedeBem
  Left = 61
  Top = 77
  Caption = 'Cadastro de Classe de Bens'
  ClientWidth = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 644
    inherited pnlMestre: TPanel
      Width = 634
      Height = 121
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 129
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 397
        Top = 60
        Width = 212
        Height = 13
        Caption = 'Máscara para Identificação Adicional'
      end
      object dbeCodigo: TwwDBEdit
        Left = 16
        Top = 24
        Width = 113
        Height = 21
        DataField = 'CODHIERARQ'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCodigoExit
      end
      object dbeDescricao: TwwDBEdit
        Left = 128
        Top = 24
        Width = 491
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object pnlAnaSint: TPanel
        Left = 16
        Top = 62
        Width = 353
        Height = 35
        BevelInner = bvLowered
        TabOrder = 2
        object sbtnAnalitico: TSpeedButton
          Left = 208
          Top = 7
          Width = 105
          Height = 21
          GroupIndex = 1
          Caption = '&Analítico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          ParentFont = False
          OnClick = sbtnAnaliticoClick
        end
        object sbtnSintetico: TSpeedButton
          Left = 40
          Top = 7
          Width = 113
          Height = 21
          GroupIndex = 1
          Caption = '&Sintético'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
            555555777777777755555550FBFB0555555555575FFF75555555555700007555
            5555555577775555555555555555555555555555555555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbtnSinteticoClick
        end
      end
      object dbeMaskIdOpc: TwwDBEdit
        Left = 397
        Top = 76
        Width = 222
        Height = 21
        DataField = 'MASCARAIDOPCIONAL'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 126
      Width = 634
      Height = 229
      Tabs.Strings = (
        'Grupos Contábeis')
      detdbGrids.Strings = (
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 536
        Height = 170
        inherited tbsDet: TTabSheet
          Caption = 'Grupos Contábeis'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 528
            Height = 142
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 528
            Height = 142
            BevelInner = bvLowered
            object pnlDetGrupos: TPanel
              Left = 1
              Top = 1
              Width = 526
              Height = 140
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label5: TLabel
                Left = 10
                Top = 8
                Width = 101
                Height = 13
                Caption = 'Grupos Contábeis'
              end
              object IncludeBtn: TSpeedButton
                Left = 294
                Top = 46
                Width = 24
                Height = 24
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
                  66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
                  66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
                  660878F888778888887887E666F66666608887F88878888887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                OnClick = IncludeBtnClick
              end
              object IncAllBtn: TSpeedButton
                Left = 294
                Top = 70
                Width = 24
                Height = 24
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
                  66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
                  66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
                  660878F877887788887887E6F666F666608887F87888788887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                OnClick = IncAllBtnClick
              end
              object ExcludeBtn: TSpeedButton
                Left = 294
                Top = 94
                Width = 24
                Height = 24
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
                  66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
                  66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
                  660878F888877F88887887E66666F666608887F88888788887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                OnClick = ExcludeBtnClick
              end
              object ExAllBtn: TSpeedButton
                Left = 294
                Top = 118
                Width = 24
                Height = 24
                Enabled = False
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                  88888887788888778F88887666666666088888788888888878F887E666666666
                  608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
                  66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
                  66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
                  660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
                  6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                OnClick = ExAllBtnClick
              end
              object Label6: TLabel
                Left = 314
                Top = 8
                Width = 229
                Height = 13
                Caption = 'Grupos Contábeis relacionados a Classe'
              end
              object SrcList: TListBox
                Left = 10
                Top = 26
                Width = 284
                Height = 145
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ItemHeight = 14
                MultiSelect = True
                ParentFont = False
                Sorted = True
                TabOrder = 0
              end
              object DstList: TListBox
                Left = 317
                Top = 26
                Width = 292
                Height = 145
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ItemHeight = 14
                MultiSelect = True
                ParentFont = False
                Sorted = True
                TabOrder = 1
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 626
      end
      inherited Dock974: TDock97
        Left = 540
        Height = 170
      end
    end
  end
  inherited Dock972: TDock97
    Width = 644
  end
  inherited Dock971: TDock97
    Width = 644
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 640
    Top = 496
  end
  inherited ds: TwwDataSource
    Left = 420
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 584
    Top = 496
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 376
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSEDEBEM.CODHIERARQ'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM')
    CamposChave.Strings = (
      'CLASSEDEBEM.IDCLASSEBEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    Left = 200
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 328
    Top = 0
  end
  inherited dsDet: TwwDataSource
    Left = 464
    Top = 0
  end
  object cdsClassexGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 312
    Top = 152
  end
  object cdsGrupoContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 152
  end
  object cdsClasses: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 152
  end
  object cdsClassexGrupo2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 152
  end
  object cdsParamCAF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 498
    Top = 152
  end
end
