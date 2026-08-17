inherited frmCadGrupoContab: TfrmCadGrupoContab
  Left = 83
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Grupos Contábeis'
  ClientHeight = 444
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 360
    Top = 128
    Width = 69
    Height = 13
    Caption = 'Localização'
  end
  inherited pnlFundo: TPanel
    Top = 34
    Width = 623
    Height = 371
    inherited pnlMestre: TPanel
      Width = 613
      Height = 164
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
        end
      end
      object rdgrpControle: TDBRadioGroup
        Left = 16
        Top = 88
        Width = 169
        Height = 62
        Caption = ' Grupo do Sistema '
        DataField = 'FLGIMOVEL'
        DataSource = ds
        Items.Strings = (
          'Ativo Fixo'
          'Imobiliário')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
      end
      object rdgrpstatus: TDBRadioGroup
        Left = 200
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
      Top = 169
      Width = 613
      Height = 197
      Tabs.Strings = (
        'Taxas de Depreciação'
        'Centros de Custo')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited Dock973: TDock97 [0]
        Width = 605
        Background.Data = {
          760F0000424D760F0000000000007600000028000000800000003C0000000100
          040000000000000F000000000000000000001000000000000000000000008080
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777777171717777777777777177771777777777777777077F7FF7FFFF7
          77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
          777777777771717717777777777777777717777777777777777777777FFFFF7F
          7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
          77777777777777171777777777777777717777777777777777777777777FF7FF
          7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
          7777777777771771777777777777777771777777777777777777777777777FFF
          FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
          777777777777771777777777777777777777777777777777777777777777777F
          F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
          7777777777777777777777777777777777777777777777777777777777777771
          77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
          7777777777777177777777777777777777777777777777777777777777777777
          777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
          7777777777777777771777777777777777777777777777777777777777777777
          7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
          7777777777777717771777777777777777777777777777777777777777777777
          77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
          7777777777777771777777777777777777777777777777777777777777777777
          777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
          7777777777777777777777777777777777777777777777777777777777777777
          777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
          7777777777777777177777777777777777777777777777777777777777777777
          7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
          7777777777777777717777777777777777777777777777777777777777777777
          7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
          7777777777777777777771777777777777777777777777777777777777777777
          7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
          F7F7777777777777771777777777177777777777777777777777777777777777
          77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
          777F7F7777777777777177177771717777777777777777777777777777777777
          77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
          77777F7F77777777777717771777777777777777777777777777777777777777
          777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
          1777777777777777777771717717777177777777777777777777777777777777
          777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
          7777777777771777777777177771777777777777777777777777777777777777
          77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
          7777777777777777777771777777777777777777777777777777777777777777
          777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
          7777777777171777777717777777777777777777777777777777777777777777
          77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
          7777777777777177777771777777777777777777777777777777777777777777
          777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
          7777777777777777777771177777777777777777777777777777777777777777
          7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
          7777777777777777777771717777777777777777777777777777777777777777
          777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
          7777777777777777777777171777777777777777777777777777777777777777
          71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
          7777777777777777777777177777777777777777777777777777777777777717
          77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
          77777777777777777777777777777777777F7777777777777777777777777171
          7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
          771777777777777777777777777777777177F777777777777777777777777717
          171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
          7777777777777777777777777777777777777F77777777777777777777777777
          77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
          7177777177777777777777777777777777777FF7F77771777777777777777777
          1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
          7777777717777777777777777777777777777777777777777777777777777777
          717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
          7177777777777777777777777777777777771777777777777777777777777777
          77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
          777777F777777777777777777777777777777777717177717777777777777777
          77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
          171777F7F7777777777777177777777777777777777777777777777777777777
          777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
          7777777F77777777777777777777777777777777777777777777777777777777
          77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
          7717777F77777777777777717177777777777777777777777777777777777777
          7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
          777777777F777777777777777717777777777777777777777777777777777777
          777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
          7777777777777777777777771777777777777777777777777777777777777777
          77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
          7777777777777777777777777717177777777771777777777777777777777777
          7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
          7777777777777177777777777777777777777717177777777777777777777777
          77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
          7777777777717777777777777717177777777777777777777777777777777777
          777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
          777777777717171717777777777777777777777771777777777F777777777777
          777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
          77777777171777777777777777777777777777777777777777F7F77777777777
          77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
          7777777777171777777777777777777777777777777777777777777777777777
          777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
          7777777717177777777777777777777777777777777777777777777777777777
          77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
          7777777777171777777777777777777777777777777777777777777777777777
          7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
          77777777777777777F7F77777717777777777777777777777777777771777777
          7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
          77777777777777777F7F7F777777777777777777777777777777771777777777
          77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
          777777777777777777FFF77F7777717777777777777777777777777777177777
          77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
          77F7777777777777777777F77777777777777777777777777777777777777777
          77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
          F77777777777777777777777F7F7777777777777777777777777777777777777
          777777777717777777777777777777777777717777777777777F7F7F7F77F77F
          77F77777777F77777717777777F7777777777777777777777777777777777777
          77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
          7F77F77777777F77777717777777777777777777777777777777777777777777
          7777777777771777777777777777777777777777777777777F77F7F7F777F777
          F77F777777777777771771777777771777777777777777777777777777777777
          777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
          F7F7777777777777777717171777777777777777777777777777777777777777
          77777777777771777777777777777177777777777771777777777777F777F777
          7777777777777777777171717177771777777777777777777777777777777777
          77777777777777777777777777777777777777777777777777777F7F7F7F7777
          F77F77F777777777777771771717177777777777777777777777777777777777
          7777777777777777777777777777777777777777777177777777}
      end
      inherited Dock974: TDock97 [1]
        Left = 519
        Height = 138
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 515
        Height = 138
        ActivePage = TabDetCCusto
        inherited tbsDet: TTabSheet
          Caption = 'Taxas de Depreciação'
          inherited pnlControlesDet: TPanel [0]
            Width = 507
            Height = 110
            object Label4: TLabel
              Left = 24
              Top = 8
              Width = 123
              Height = 13
              Caption = 'Taxa de Depreciação'
            end
            object Label5: TLabel
              Left = 24
              Top = 56
              Width = 58
              Height = 13
              Caption = 'Descrição'
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
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 507
            Height = 110
            Selected.Strings = (
              'TAXADEP'#9'10'#9'Taxa Depreciação'
              'DESCTAXADEP'#9'66'#9'Descrição'#9'F')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
          end
        end
        object TabDetCCusto: TTabSheet
          Caption = 'Centros de Custo'
          ImageIndex = 1
          object pnlDetCCusto: TPanel
            Left = 0
            Top = 0
            Width = 507
            Height = 110
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
    end
  end
  inherited Dock972: TDock97
    Width = 623
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
    Top = 405
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 515
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 338
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '              CLASSE,'
      '              NOME,'
      '              TIPO,'
      '              STATUS,'
      '              DEPRECIACAO,'
      '              DATAULTDEP,'
      '              FLGIMOVEL,'
      '              FLGSEMPLACA'
      'FROM GRUPO'
      'WHERE IDGRUPO = :PIDGRUPO')
    Left = 360
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPO.IDGRUPO'
    end
    object qryCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'BASEDADOS.GRUPO.CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.GRUPO.NOME'
      Size = 60
    end
    object qryTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.GRUPO.TIPO'
      FixedChar = True
      Size = 1
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.GRUPO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'BASEDADOS.GRUPO.DEPRECIACAO'
    end
    object qryDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BASEDADOS.GRUPO.DATAULTDEP'
    end
    object qryFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'BASEDADOS.GRUPO.FLGIMOVEL'
    end
    object qryFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'BASEDADOS.GRUPO.FLGSEMPLACA'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 576
    Top = 27
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  STATUS = :STATUS,'
      '  DEPRECIACAO = :DEPRECIACAO,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGIMOVEL = :FLGIMOVEL,'
      '  FLGSEMPLACA = :FLGSEMPLACA'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, NOME, TIPO, STATUS, DEPRECIACAO, DATAULTDEP,' +
        ' FLGIMOVEL, '
      '   FLGSEMPLACA)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :NOME, :TIPO, :STATUS, :DEPRECIACAO, :DATA' +
        'ULTDEP, '
      '   :FLGIMOVEL, :FLGSEMPLACA)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 424
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
      'GRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '1')
    Left = 480
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 392
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 720
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 392
    Top = 168
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 512
    Top = 168
  end
  object qryGrupoEmpresa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,IDPESSOA'
      'FROM   PLANOGRUPO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDGRUPO  = :PIDGRUPO)'
      '')
    UpdateObject = updGrupoEmpresa
    ValidateWithMask = True
    Left = 128
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoEmpresaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.PLANOGRUPO".IDGRUPO'
    end
    object qryGrupoEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PLANOGRUPO".IDPESSOA'
    end
  end
  object updGrupoEmpresa: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANOGRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PLANOGRUPO'
      '  (IDGRUPO, IDPESSOA)'
      'values'
      '  (:IDGRUPO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PLANOGRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 128
    Top = 288
  end
  object qryGrupoBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(IDGRUPO) AS BENSNOGRUPO'
      'FROM BEM'
      'WHERE (IDGRUPO = :PIDGRUPO)')
    ValidateWithMask = True
    Left = 344
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoBemBENSNOGRUPO: TFloatField
      FieldName = 'BENSNOGRUPO'
      Origin = '"CM.BEM".IDGRUPO'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 408
    Top = 288
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO,MOEDESC'
      'FROM MOEDA'
      'ORDER BY MOECODIGO'
      '')
    ValidateWithMask = True
    Left = 280
    Top = 288
    object qryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO, IDPESSOA, IDTAXADEP,'
      '       TAXADEP, DESCTAXADEP'
      'FROM GRUPOTAXADEP'
      'WHERE (IDGRUPO  = :PIDGRUPO)'
      '  AND (IDPESSOA = :PIDPESSOA)')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 576
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetTAXADEP: TFloatField
      DisplayLabel = 'Taxa Depreciação'
      DisplayWidth = 10
      FieldName = 'TAXADEP'
      Origin = 'BASEDADOS.GRUPOTAXADEP.TAXADEP'
    end
    object qryDetDESCTAXADEP: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 66
      FieldName = 'DESCTAXADEP'
      Origin = 'BASEDADOS.GRUPOTAXADEP.DESCTAXADEP'
    end
    object qryDetIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.GRUPOTAXADEP.IDGRUPO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.GRUPOTAXADEP.IDPESSOA'
      Visible = False
    end
    object qryDetIDTAXADEP: TFloatField
      FieldName = 'IDTAXADEP'
      Origin = 'BASEDADOS.GRUPOTAXADEP.IDTAXADEP'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOTAXADEP'
      'set'
      '  TAXADEP = :TAXADEP,'
      '  DESCTAXADEP = :DESCTAXADEP'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTAXADEP = :OLD_IDTAXADEP')
    InsertSQL.Strings = (
      'insert into GRUPOTAXADEP'
      '  (IDGRUPO, IDPESSOA, IDTAXADEP, TAXADEP, DESCTAXADEP)'
      'values'
      '  (:IDGRUPO, :IDPESSOA, :IDTAXADEP, :TAXADEP, :DESCTAXADEP)')
    DeleteSQL.Strings = (
      'delete from GRUPOTAXADEP'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTAXADEP = :OLD_IDTAXADEP')
    Left = 576
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMPRESA, CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :PIDEMPRESA)'
      '  AND (STATUSGRUPOCDC = '#39'A'#39')'
      '  AND (ATIVO = '#39'S'#39')'
      'ORDER BY CODCENTROCUSTO'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'CENTCUST.STATUSGRUPOCDC'
      Size = 1
    end
    object qryCentroCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'CENTCUST.IDEMPRESA'
    end
  end
  object qryGrupoxCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GCC.IDGRUPO,'
      '       GCC.CODCENTROCUSTO,'
      '       GCC.IDEMPRESA,'
      '       G.NOME  AS DESCGRUPO,'
      '       CC.NOME AS DESCCCUSTO'
      'FROM   GRUPOBEMXCC GCC,'
      '       GRUPO G,'
      '       CENTCUST CC'
      'WHERE (GCC.IDGRUPO        = :PIDGRUPO)'
      '  AND (GCC.IDGRUPO        = G.IDGRUPO)'
      '  AND (GCC.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (GCC.IDEMPRESA      = CC.IDEMPRESA)'
      'ORDER BY CC.NOME')
    ValidateWithMask = True
    Left = 208
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGrupoxCCIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object qryGrupoxCCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object qryGrupoxCCIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object qryGrupoxCCDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoxCCDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryInsGrupoxCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPOBEMXCC'
      '  (IDGRUPO, CODCENTROCUSTO, IDEMPRESA)'
      'VALUES'
      '  (:PIDGRUPO, :PCODCENTROCUSTO, :PIDEMPRESA)')
    ValidateWithMask = True
    Left = 288
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object FloatField3: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object StringField4: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object FloatField4: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object StringField5: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryRemGrupoxCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM GRUPOBEMXCC'
      'WHERE (IDGRUPO = :pIDGRUPO)')
    ValidateWithMask = True
    Left = 384
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDGRUPO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
    object StringField1: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'GRUPOBEMXCC.CODCENTROCUSTO'
      Size = 10
    end
    object FloatField2: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'GRUPOBEMXCC.IDEMPRESA'
    end
    object StringField2: TStringField
      FieldName = 'DESCGRUPO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCCCUSTO'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,CLASSE,NOME,TIPO,STATUS,DEPRECIACAO,'
      '       DATAULTDEP,FLGIMOVEL'
      'FROM   GRUPO'
      'ORDER BY CLASSE'
      '')
    ValidateWithMask = True
    Left = 217
    Top = 300
    object qryGruposIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGruposCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGruposNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGruposTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryGruposSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryGruposDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryGruposDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryGruposFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
  end
  object dsGrupos: TwwDataSource
    AutoEdit = False
    DataSet = qryGrupos
    Left = 217
    Top = 287
  end
end
