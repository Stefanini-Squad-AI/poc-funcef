inherited frmMTCadGrupoContab: TfrmMTCadGrupoContab
  Left = 98
  Top = 71
  Caption = 'Cadastro de Grupos Contábeis'
  ClientHeight = 443
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 622
    Height = 370
    inherited pnlMestre: TPanel
      Width = 612
      Height = 166
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Código '
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCod: TwwDBEdit
        Left = 16
        Top = 24
        Width = 169
        Height = 21
        DataField = 'CLASSE'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedCodExit
      end
      object pnlAnaSint: TPanel
        Left = 232
        Top = 14
        Width = 368
        Height = 38
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object sbtnAnalitico: TSpeedButton
          Left = 205
          Top = 9
          Width = 130
          Height = 21
          GroupIndex = 1
          Caption = '&Analítico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
          Left = 38
          Top = 9
          Width = 130
          Height = 21
          GroupIndex = 1
          Caption = '&Sintético'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
      object dbeDescricao: TwwDBEdit
        Left = 16
        Top = 64
        Width = 585
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rdgrpControle: TDBRadioGroup
        Left = 16
        Top = 88
        Width = 185
        Height = 62
        Caption = ' Grupo do Sistema '
        DataField = 'FLGIMOVEL'
        DataSource = ds
        Items.Strings = (
          'Controle do Ativo Fixo'
          'Investimentos Imobiliários')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
      end
      object rdgrpstatus: TDBRadioGroup
        Left = 208
        Top = 88
        Width = 153
        Height = 62
        Caption = ' Status '
        DataField = 'STATUS'
        DataSource = ds
        Items.Strings = (
          '&Ativado'
          '&Desativado')
        TabOrder = 4
        Values.Strings = (
          'A'
          'I')
      end
      object GroupBox1: TGroupBox
        Left = 368
        Top = 88
        Width = 233
        Height = 41
        TabOrder = 5
        object dbckbSemPlaca: TDBCheckBox
          Left = 24
          Top = 16
          Width = 174
          Height = 17
          Caption = 'Placa Patrimonial Opcional'
          DataField = 'FLGSEMPLACA'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 171
      Width = 612
      Height = 194
      Tabs.Strings = (
        'Taxa de Depreciação'
        'Centros de Custo')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 514
        Height = 135
        inherited tbsDet: TTabSheet
          Caption = 'Taxas de Depreciação'
          inherited pnlControlesDet: TPanel
            Width = 506
            Height = 107
            object Label4: TLabel
              Left = 24
              Top = 8
              Width = 123
              Height = 13
              Caption = 'Taxa de Depreciação'
            end
            object Label6: TLabel
              Left = 150
              Top = 28
              Width = 36
              Height = 13
              Caption = '% a.a.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 24
              Top = 56
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object dbeTaxaDep: TDBRealEdit
              Left = 24
              Top = 24
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 4
              DecDigits = 6
              NumberFormat = fNumber
              Signal = False
              DataField = 'TAXADEP'
              DataSource = dsDet
            end
            object dbeDescTaxaDep: TwwDBEdit
              Left = 24
              Top = 72
              Width = 449
              Height = 21
              DataField = 'DESCTAXADEP'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 506
            Height = 107
            Selected.Strings = (
              'TAXADEP'#9'10'#9'Taxa Depreciação'#9'F'
              'DESCTAXADEP'#9'66'#9'Descrição'#9'F')
            UseTFields = False
          end
        end
        object TabDetCCusto: TTabSheet
          Caption = 'Centros de Custo'
          ImageIndex = 1
          object pnlDetCCusto: TPanel
            Left = 0
            Top = 0
            Width = 506
            Height = 107
            Align = alClient
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 0
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 169
              Height = 13
              Caption = 'Centros de Custo Disponíveis'
            end
            object IncludeBtn: TSpeedButton
              Left = 286
              Top = 34
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
              Left = 286
              Top = 58
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
              Left = 286
              Top = 82
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
              Left = 286
              Top = 106
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
            object Label8: TLabel
              Left = 309
              Top = 8
              Width = 230
              Height = 13
              Caption = 'Centros de Custo relacionados ao Grupo'
            end
            object SrcList: TListBox
              Left = 8
              Top = 24
              Width = 278
              Height = 115
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ItemHeight = 14
              MultiSelect = True
              ParentFont = False
              Sorted = True
              TabOrder = 0
            end
            object DstList: TListBox
              Left = 309
              Top = 24
              Width = 278
              Height = 115
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ItemHeight = 14
              MultiSelect = True
              ParentFont = False
              Sorted = True
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 604
      end
      inherited Dock974: TDock97
        Left = 518
        Height = 135
      end
    end
  end
  inherited Dock972: TDock97
    Width = 622
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 86
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 258
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 172
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 622
    inherited tb97Fundo: TToolbar97
      Left = 452
      DockPos = 669
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 285
      DockPos = 502
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 690
    Top = 503
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 392
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 744
    Top = 503
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 440
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 360
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME'
      'GRUPO.TIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'S/A')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '1')
    Left = 200
    Top = 40
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 504
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 144
    Top = 302
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 144
    Top = 288
  end
  object cdsGrupoBemxCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 288
  end
  object cdsPlanoGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 376
    Top = 168
  end
  object cdsParamCAF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 456
    Top = 168
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 288
  end
  object cdsGrupos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 568
  end
  object cdsGrupoBemxCC2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 336
  end
end
