object FrmAssistenteRelats: TFrmAssistenteRelats
  Left = 150
  Top = 45
  BorderStyle = bsToolWindow
  Caption = 'Assistente de Relatórios'
  ClientHeight = 472
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TwCons: TTreeWzd
    Left = 0
    Top = 0
    Width = 185
    Height = 472
    Align = alLeft
    Color = clGray
    BevelInner = bvLowered
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Etapa.Forma = stRectangle
    Etapa.LinhaWidth = 1
    Etapa.Top = 5
    Etapa.Espaco = 10
    Etapa.Quantidade = 0
    Etapa.BorderWidth = 1
    Etapa.Left = 5
    Etapa.Identacao = 25
    Etapa.Height = 20
    Etapa.Width = 20
    Etapa.BoderColor = clNavy
    Etapa.BrushColor = clYellow
    Etapa.Pos = 0
  end
  object NtbAssist: TNotebook
    Left = 185
    Top = 0
    Width = 404
    Height = 472
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Bevel1: TBevel
        Left = 8
        Top = 148
        Width = 387
        Height = 300
        Shape = bsFrame
        Style = bsRaised
      end
      object BtnEtiq: TSpeedButton
        Left = 24
        Top = 346
        Width = 89
        Height = 73
        GroupIndex = 1
        Caption = '&Etiquetas'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888888887777777777777778888888888888888000000
          00000000077888888888888880FFFFFFFFFFFFFFF07888888888888880F0FFFF
          FFFFFFF0F07888888888888880FFFFFFFFFFFFFFF07888888888888880F0FFFF
          FFFFFFF0F07888888888888880FFFFFFFFFFFFFFF08888888888888888000000
          00000000077888888888888880FFFFFFFFFFFFFFF07888888888888880F0FFFF
          FFFFFFF0F07888888888888880FFFFFFFFFFFFFFF07888888888888880F0FFFF
          FFFFFFF0F07888888888888880FFFFFFFFFFFFFFF08888888888888888000000
          00000000077888888888888880FFFFFFFFFFFFFFF07788888888888880F0FFFF
          FFFFFFF0F0F078888888888880FFFFFFFFFFFFFFF00F07888888888880F0FFFF
          FFFFFFF0F08FF0788888888880FFFFFFFFFFFFFFF00000778888888888000000
          00000000088FFF078888888880FFFFFFFFFFFFFFF08FFF078888888880F0FFFF
          FFFFFFF0F08FFF0888888888880FFFFFFFFFFFFFFF00007788888888880F0FFF
          FFFFFFFF0F08FF07888888888880FFFFFFFFFFFFFFF08F088888888888880000
          0000000000000088888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object BtnLista: TSpeedButton
        Left = 24
        Top = 174
        Width = 89
        Height = 73
        GroupIndex = 1
        Down = True
        Caption = '&Lista'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888887777
          777777777777778888888888888000000000000000000788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF777777777777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          7777777777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF777777777777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          7777777777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF777777777777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          7777777777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF44EF44444F77770788888888888880F44E
          4FFFFFFF7FFF0888888888888880FF44FFFFFFFF7FF08888888888888880FFFF
          FFFFFFFF7F088888888888888880000000000000008888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object BtnColunas: TSpeedButton
        Left = 24
        Top = 260
        Width = 89
        Height = 73
        GroupIndex = 1
        Caption = '&Colunas'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888887777
          777777777777778888888888888000000000000000000788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF77777FF77777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          777FF77777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF77777FF77777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          777FF77777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF77777FF77777FF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FF77
          777FF77777FF0788888888888880FFFFFFFFFFFFFFFF0788888888888880FFFF
          FFFFFFFFFFFF0788888888888880FF44EF44444F77770788888888888880F44E
          4FFFFFFF7FFF0888888888888880FF44FFFFFFFF7FF08888888888888880FFFF
          FFFFFFFF7F088888888888888880000000000000008888888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object Label1: TLabel
        Left = 128
        Top = 178
        Width = 257
        Height = 52
        Caption = 
          'Os dados serão dispostos no Relatório como uma lista onde cada C' +
          'ampo da consulta associada ao relatório é impressa em uma linha ' +
          'separada.'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 128
        Top = 264
        Width = 257
        Height = 65
        Caption = 
          'Os dados serão dispostos no Relatório como uma Tabela onde cada ' +
          'Campo da consulta associada ao relatório equivale a uma coluna d' +
          'a Tabela, sendo impressos em uma única linha.'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 128
        Top = 369
        Width = 220
        Height = 26
        Caption = 'Possibilita a criação de etiquetas com formatos diversos'
        WordWrap = True
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 38
        Width = 387
        Height = 61
        Caption = ' Consulta a Associar com o Relatório '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 344
          Top = 22
          Width = 26
          Height = 26
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDD0000DDDDDDDDDDD77D77D77D0000DDD707DDDD007007007D0000DD73
            307DDD00D00D00DD0000DD7F3307DDDDDDDDDDDD0000DDD3F3307DDDDDDDDDDD
            0000DDDD3F330777777DDDDD0000DDDDD3F330000077DDDD0000DDDDDD3F3378
            88707DDD0000DDDDDDD037FCCCC707DD0000DDDDDDD07FCCCCCF777D0000DDDD
            D4D0F8CCFFFF804D0000DDDDD4408FCCFFFF80DD0000DDDDD4D0F8CCFFFF80DD
            0000DDDDDD477FCCCCCF774D0000DDDDDDDD07FCCCC70DDD0000DDDDDDDDD07F
            8F70DDDD0000DDDDDDDDDD70007DDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
            DDDDDDDDDDDDDDDD0000}
          OnClick = SpeedButton1Click
        end
        object EdtCons: TEdit
          Left = 16
          Top = 23
          Width = 326
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Origem dos Dados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 0
        Top = 109
        Width = 404
        Height = 25
        BevelInner = bvLowered
        Caption = 'Tipo do Relatório'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '1'
      object Bevel2: TBevel
        Left = 9
        Top = 32
        Width = 388
        Height = 57
        Shape = bsFrame
      end
      object Label4: TLabel
        Left = 16
        Top = 36
        Width = 116
        Height = 13
        Caption = 'Campos da Consulta'
      end
      object Label6: TLabel
        Left = 278
        Top = 37
        Width = 78
        Height = 13
        Caption = 'Tipo de Dado'
      end
      object CmbCampo: TComboBox
        Left = 16
        Top = 53
        Width = 257
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnChange = CmbCampoChange
      end
      object EdtTipo: TEdit
        Left = 280
        Top = 52
        Width = 107
        Height = 21
        Color = clScrollBar
        TabOrder = 1
      end
      object BtnInclui: TBitBtn
        Left = 53
        Top = 97
        Width = 93
        Height = 25
        Caption = 'Adiciona'
        TabOrder = 2
        OnClick = BtnIncluiClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
      end
      object BtnExclui: TBitBtn
        Left = 155
        Top = 97
        Width = 93
        Height = 25
        Caption = 'Remove'
        TabOrder = 3
        OnClick = BtnExcluiClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
          608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
          66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
          66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
          660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
          6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object BtnPesquisa: TBitBtn
        Left = 257
        Top = 97
        Width = 93
        Height = 25
        Caption = 'Dicionário'
        TabOrder = 4
        OnClick = BtnPesquisaClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDD0000DDDDDDDDDDD77D77D77D0000DDD707DDDD007007007D0000DD73
          307DDD00D00D00DD0000DD7F3307DDDDDDDDDDDD0000DDD3F3307DDDDDDDDDDD
          0000DDDD3F330777777DDDDD0000DDDDD3F330000077DDDD0000DDDDDD3F3378
          88707DDD0000DDDDDDD037CCCC8707DD0000DDDDDDD07FCCFCCF777D0000DDDD
          D4D0F8CCFFCC804D0000DDDDD4408FCCFFCC80DD0000DDDDD4D0F8CCFFCC80DD
          0000DDDDDD477FCCFCCF774D0000DDDDDDDD07CCCCF70DDD0000DDDDDDDDD07F
          8F70DDDD0000DDDDDDDDDD70007DDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
          DDDDDDDDDDDDDDDD0000}
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 155
        Width = 404
        Height = 317
        Selected.Strings = (
          'CAMPO'#9'43'#9'Campo'
          'TIPODADO'#9'19'#9'Tipo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = DsFields
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 5
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Seleção dos Campos'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 0
        Top = 130
        Width = 404
        Height = 25
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Campos Selecionados Para Exportação'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '2'
      object LstGrupo: TListBox
        Left = 26
        Top = 40
        Width = 327
        Height = 410
        ItemHeight = 13
        TabOrder = 0
      end
      object BtnUp: TBitBtn
        Tag = 1
        Left = 363
        Top = 192
        Width = 26
        Height = 28
        TabOrder = 1
        OnClick = BtnUpClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
          608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
          66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
          66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
          660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
          6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object BtnDow: TBitBtn
        Left = 363
        Top = 224
        Width = 26
        Height = 28
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Ordenação das Colunas no Arquivo de Saída'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '3'
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Configurações do Arquivo'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = '4'
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 15
        Width = 369
        Height = 81
        Caption = ' Opções ao Encerrar '
        ItemIndex = 0
        Items.Strings = (
          'Encerra sem visualizar o Arquivo'
          'Desejo Editar o Relatório Gerado'
          'Desejo Visualizar o Relatório Gerado')
        TabOrder = 0
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 105
        Width = 369
        Height = 349
        Caption = ' Definições Gerais do Relatório '
        TabOrder = 1
        object Label7: TLabel
          Left = 19
          Top = 113
          Width = 182
          Height = 13
          Caption = 'Grupo de Exibição do Relatório:'
        end
        object Label8: TLabel
          Left = 19
          Top = 69
          Width = 176
          Height = 13
          Caption = 'Sistema a Vincular o Relatório:'
        end
        object Bevel3: TBevel
          Left = 19
          Top = 163
          Width = 329
          Height = 33
          Shape = bsFrame
        end
        object Label9: TLabel
          Left = 19
          Top = 25
          Width = 37
          Height = 13
          Caption = 'Nome:'
        end
        object Label5: TLabel
          Left = 19
          Top = 205
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object CmbModulo: TwwDBLookupCombo
          Left = 19
          Top = 85
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEMODULO'#9'50'#9'NOMEMODULO')
          DataField = 'IDMODULO'
          LookupField = 'IDMODULO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object ChkFiltro: TDBCheckBox
          Left = 72
          Top = 172
          Width = 243
          Height = 17
          Caption = 'Exibe Tela de Filtro Antes do Relatório'
          DataField = 'FLGFILTROMANUAL'
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object EdtNomeRelat: TEdit
          Left = 19
          Top = 41
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object MemDescRelats: TMemo
          Left = 21
          Top = 224
          Width = 328
          Height = 113
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 19
          Top = 133
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEMODULO'#9'50'#9'NOMEMODULO')
          DataField = 'IDMODULO'
          LookupField = 'IDMODULO'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  object BtnAnterior: TBitBtn
    Tag = 8
    Left = 11
    Top = 373
    Width = 75
    Height = 25
    Caption = 'Anteriror'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnAnteriorClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888006666600
      88888887788888778F88880666666666088888788888F88878F880E6666F6666
      608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
      66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
      66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
      660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
      6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
      8888888778FFFF77888888888000008888888888877777888888}
    NumGlyphs = 2
  end
  object BtnProximo: TBitBtn
    Tag = 9
    Left = 95
    Top = 373
    Width = 75
    Height = 25
    Caption = 'Próximo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnProximoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888006666600
      88888887788888778F88880666666666088888788888F88878F880E6666F6666
      608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
      66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
      66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
      660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
      6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
      8888888778FFFF77888888888000008888888888877777888888}
    NumGlyphs = 2
  end
  object BtnCancela: TBitBtn
    Left = 95
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Cancela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
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
  end
  object BtnEncerra: TBitBtn
    Left = 11
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Encerra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888006666600
      88888887788888778F88887666666666088888788888888878F887E668866666
      608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
      66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
      66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
      660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
      6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
  object QryConsultas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TEMPLATE'
      'FROM '
      '  DATAVIEW'
      'WHERE '
      '  IDDATAVIEW = :PIDDATAVIEW AND'
      '  ORIGEMCMDV = :PORIGEMCMDV')
    ValidateWithMask = True
    Left = 40
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDATAVIEW'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCMDV'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 40
    Top = 205
  end
  object MsConsulta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'SUBSTR(DATAVIEW.DESCRIPTION,1,200)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV'
      'DATAVIEW.NAME')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 40
    Top = 64
  end
  object DsFields: TwwDataSource
    DataSet = QryFIelds
    Left = 96
    Top = 106
  end
  object QryFIelds: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ('#39'                                                 '#39') AS ' +
        'CAMPO,'
      
        '               ('#39'                                               ' +
        '  '#39') AS TIPODADO'
      'FROM DUAL')
    UpdateObject = UpdFields
    ValidateWithMask = True
    Left = 40
    Top = 108
  end
  object UpdFields: TUpdateSQL
    Left = 40
    Top = 160
  end
  object DlgFile: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Title = 'Arquivo de Expotação'
    Left = 93
    Top = 14
  end
  object ColorDlg: TColorDialog
    Ctl3D = True
    Options = [cdPreventFullOpen]
    Left = 37
    Top = 16
  end
end
