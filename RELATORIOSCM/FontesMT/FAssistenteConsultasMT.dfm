inherited FrmAssistenteConsultas: TFrmAssistenteConsultas
  Left = 382
  Top = 173
  BorderStyle = bsToolWindow
  Caption = 'Assistente de Consultas'
  ClientHeight = 472
  ClientWidth = 589
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TwCons: TTreeWzd [0]
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
    Etapa.Caption.Strings = (
      'Seleciona Tabelas'
      'Seleciona Campos'
      'Definição de Relacionamentos'
      'Definição de Campos Calculados'
      'Definição de Filtros Para a Consulta'
      'Definição de Ordenação'
      'Definição de Grupos'
      'Gravação da Consulta')
    Etapa.Forma = stRectangle
    Etapa.LinhaWidth = 1
    Etapa.Top = 25
    Etapa.Espaco = 10
    Etapa.Quantidade = 8
    Etapa.BorderWidth = 1
    Etapa.Left = 10
    Etapa.Identacao = 30
    Etapa.Height = 20
    Etapa.Width = 20
    Etapa.BoderColor = clNavy
    Etapa.BrushColor = clWhite
    Etapa.Imagem.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777744777777777777746647777777777746666477777777746666664777
      77774666E66664777777666E7E6664777777E6E777E6664777777E77777E6664
      777777777777E6664777777777777E6664777777777777E6664777777777777E
      6664777777777777E6647777777777777E6677777777777777E7}
    Etapa.Pos = 1
    object BtnAnterior: TBitBtn
      Tag = 8
      Left = 13
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
      TabOrder = 0
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
      Left = 97
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
      TabOrder = 1
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
      Left = 97
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
      TabOrder = 2
      OnClick = BtnCancelaClick
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
      Left = 13
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
      TabOrder = 3
      OnClick = BtnEncerraClick
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
  end
  object Panel2: TPanel [1]
    Left = 185
    Top = 0
    Width = 404
    Height = 472
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object NtbAssist: TNotebook
      Left = 4
      Top = 4
      Width = 396
      Height = 464
      Align = alClient
      TabOrder = 0
      OnPageChanged = NtbAssistPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'SelTab'
        object LstTabelas: TListBox
          Tag = 11
          Left = 0
          Top = 268
          Width = 396
          Height = 196
          Align = alBottom
          ItemHeight = 13
          TabOrder = 0
          OnDblClick = BtnExcluiClick
        end
        object BtnInclui: TBitBtn
          Left = 51
          Top = 210
          Width = 93
          Height = 25
          Caption = 'Adiciona'
          TabOrder = 1
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
          Left = 153
          Top = 210
          Width = 93
          Height = 25
          Caption = 'Remove'
          TabOrder = 2
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
          Left = 255
          Top = 210
          Width = 93
          Height = 25
          Caption = 'Dicionário'
          TabOrder = 3
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
        object Panel1: TPanel
          Left = 0
          Top = 243
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Tabelas do Selecionadas'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Tabelas do Sistema'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object GrdDdTable: TwwDBGrid
          Left = 0
          Top = 25
          Width = 396
          Height = 176
          Selected.Strings = (
            'TABLEALIAS'#9'45'#9'TABLEALIAS')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = DsTabela
          Options = [dgEditing, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 6
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = BtnIncluiClick
          OnKeyPress = GrdDdTableKeyPress
          IndicatorColor = icBlack
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SelCampo'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Campos das Tabelas Selecionadas'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 0
          Top = 268
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Campos Selecionados Para Consulta'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object BtnRemoveCampo: TBitBtn
          Left = 151
          Top = 236
          Width = 97
          Height = 26
          Caption = 'Remove'
          TabOrder = 2
          OnClick = BtnRemoveCampoClick
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
        object BtnAddcampo: TBitBtn
          Left = 45
          Top = 236
          Width = 97
          Height = 26
          Caption = 'Adiciona'
          TabOrder = 3
          OnClick = BtnAddcampoClick
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
        object LstCampoSel: TListBox
          Tag = 11
          Left = 0
          Top = 293
          Width = 396
          Height = 171
          Align = alBottom
          ItemHeight = 13
          TabOrder = 4
          OnDblClick = BtnRemoveCampoClick
        end
        object BitBtn1: TBitBtn
          Left = 257
          Top = 236
          Width = 97
          Height = 26
          Caption = 'Dicionário'
          TabOrder = 5
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
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DefRelac'
        object Label9: TLabel
          Left = 46
          Top = 35
          Width = 164
          Height = 13
          Caption = 'Campo Para Relacionamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 46
          Top = 124
          Width = 164
          Height = 13
          Caption = 'Campo Para Relacionamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 46
          Top = 80
          Width = 117
          Height = 13
          Caption = 'Operador Relacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnBuscaCampo: TSpeedButton
          Left = 330
          Top = 49
          Width = 25
          Height = 25
          Hint = 'Busca Campos Para Relacionamento'
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
          OnClick = BtnBuscaCampoClick
        end
        object BtnBuscaCampo1: TSpeedButton
          Tag = 1
          Left = 330
          Top = 138
          Width = 25
          Height = 25
          Hint = 'Busca Campos Para Relacionamento'
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
          OnClick = BtnBuscaCampoClick
        end
        object BtnAddJoin: TBitBtn
          Left = 48
          Top = 210
          Width = 97
          Height = 26
          Caption = 'Adiciona'
          TabOrder = 0
          OnClick = BtnAddJoinClick
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
        object BtnRemoveJoin: TBitBtn
          Left = 153
          Top = 210
          Width = 97
          Height = 26
          Caption = 'Remove'
          TabOrder = 1
          OnClick = BtnRemoveJoinClick
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
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Definição do Relacionamento entre os Campos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object LstJoins: TListBox
          Tag = 11
          Left = 0
          Top = 268
          Width = 396
          Height = 196
          Align = alBottom
          ItemHeight = 13
          TabOrder = 3
          OnDblClick = BtnRemoveJoinClick
        end
        object CmbOperador: TComboBox
          Left = 46
          Top = 96
          Width = 308
          Height = 21
          Style = csDropDownList
          DropDownCount = 6
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            'Igual a'
            'Diferente de'
            'Maior Que'
            'Menor Que'
            'Maior ou Igual a'
            'Menor ou Igual a')
        end
        object RgObriga: TRadioGroup
          Left = 46
          Top = 169
          Width = 307
          Height = 33
          Caption = ' Obrigatoriedade de Dados nos Campos '
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Ambos'
            'Primeiro'
            'Segundo')
          ParentFont = False
          TabOrder = 5
        end
        object EdtCampo1: TEdit
          Left = 46
          Top = 51
          Width = 283
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object EdtCampo2: TEdit
          Left = 46
          Top = 140
          Width = 283
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
        object BitBtn2: TBitBtn
          Left = 257
          Top = 210
          Width = 97
          Height = 26
          Caption = 'Dicionário'
          TabOrder = 8
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
        object Panel13: TPanel
          Left = 0
          Top = 243
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Relacionamentos Definidos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DefCalc'
        object Label13: TLabel
          Left = 46
          Top = 83
          Width = 130
          Height = 13
          Caption = 'Campo Para o Calculo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 330
          Top = 97
          Width = 25
          Height = 25
          Hint = 'Busca Campos Para Relacionamento'
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
        object LstCalc: TListView
          Left = 0
          Top = 25
          Width = 397
          Height = 43
          Columns = <>
          HideSelection = False
          Items.Data = {
            8E000000050000000000000000000000FFFFFFFF000000000000000004536F6D
            610100000001000000FFFFFFFF000000000000000008436F6E746167656D0200
            000002000000FFFFFFFF0000000000000000054DE96469610300000003000000
            FFFFFFFF0000000000000000064DE178696D6F0400000004000000FFFFFFFF00
            00000000000000064D696E696D6F}
          LargeImages = ImageList1
          ShowColumnHeaders = False
          TabOrder = 0
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Campos Calculados - Fórmulas Disponíveis'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object EdtCampoCamlc: TEdit
          Left = 46
          Top = 99
          Width = 283
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object Panel14: TPanel
          Left = 0
          Top = 174
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Campos Calculados Definidos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object LstCampoCalc: TListBox
          Tag = 11
          Left = 0
          Top = 199
          Width = 396
          Height = 265
          Align = alBottom
          ItemHeight = 13
          TabOrder = 4
          OnDblClick = BitBtn4Click
        end
        object BitBtn3: TBitBtn
          Left = 48
          Top = 132
          Width = 97
          Height = 26
          Caption = 'Adiciona'
          TabOrder = 5
          OnClick = BitBtn3Click
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
        object BitBtn4: TBitBtn
          Left = 153
          Top = 132
          Width = 97
          Height = 26
          Caption = 'Remove'
          TabOrder = 6
          OnClick = BitBtn4Click
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
        object BitBtn5: TBitBtn
          Left = 257
          Top = 132
          Width = 97
          Height = 26
          Caption = 'Dicionário'
          TabOrder = 7
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
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'IncCond'
        object Label14: TLabel
          Left = 46
          Top = 35
          Width = 125
          Height = 13
          Caption = 'Campos Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 46
          Top = 119
          Width = 134
          Height = 13
          Caption = 'Valor Para Comparação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 46
          Top = 78
          Width = 117
          Height = 13
          Caption = 'Operador Relacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 330
          Top = 49
          Width = 25
          Height = 25
          Hint = 'Busca Campos Para Relacionamento'
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
          OnClick = SpeedButton2Click
        end
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Definição de Condicionais'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object BitBtn6: TBitBtn
          Left = 48
          Top = 167
          Width = 97
          Height = 26
          Caption = 'Adiciona'
          TabOrder = 1
          OnClick = BitBtn6Click
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
        object BitBtn7: TBitBtn
          Left = 153
          Top = 167
          Width = 97
          Height = 26
          Caption = 'Remove'
          TabOrder = 2
          OnClick = BitBtn7Click
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
        object CmbOperadorCondicao: TComboBox
          Left = 46
          Top = 94
          Width = 308
          Height = 21
          Style = csDropDownList
          DropDownCount = 7
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            'Igual a'
            'Diferente de'
            'Maior Que'
            'Menor Que'
            'Maior ou Igual a'
            'Menor ou Igual a'
            'Possui o Texto')
        end
        object EdtCampoCondicao: TEdit
          Left = 46
          Top = 51
          Width = 283
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object BitBtn8: TBitBtn
          Left = 257
          Top = 167
          Width = 97
          Height = 26
          Caption = 'Dicionário'
          TabOrder = 5
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
        object Panel16: TPanel
          Left = 0
          Top = 209
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Condicionais Definidos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object LstCondicionais: TListBox
          Tag = 11
          Left = 0
          Top = 234
          Width = 396
          Height = 230
          Align = alBottom
          ItemHeight = 13
          TabOrder = 7
          OnDblClick = BitBtn7Click
        end
        object EdtValoresCondicao: TMaskEdit
          Left = 46
          Top = 136
          Width = 308
          Height = 21
          TabOrder = 8
          OnKeyPress = EdtValoresCondicaoKeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DefOrdem'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Campos Selecionados Para a Consulta'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object LstCamposOrdem: TListBox
          Tag = 11
          Left = 0
          Top = 25
          Width = 396
          Height = 173
          Align = alTop
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 1
          OnDblClick = BtnAddOrdemClick
        end
        object BtnAddOrdem: TBitBtn
          Left = 96
          Top = 206
          Width = 93
          Height = 25
          Caption = 'Adiciona'
          TabOrder = 2
          OnClick = BtnAddOrdemClick
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
        object BtnRemoveOrdem: TBitBtn
          Left = 222
          Top = 206
          Width = 93
          Height = 26
          Caption = 'Remove'
          TabOrder = 3
          OnClick = BtnRemoveOrdemClick
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
        object Panel8: TPanel
          Left = 0
          Top = 238
          Width = 396
          Height = 25
          Align = alBottom
          BevelInner = bvLowered
          Caption = 'Campos Selecionados Para Ordenação '
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object LstCamposSelOrdem: TListBox
          Tag = 11
          Left = 0
          Top = 263
          Width = 396
          Height = 201
          Align = alBottom
          ItemHeight = 13
          TabOrder = 5
          OnDblClick = BtnRemoveOrdemClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DefGrupo'
        object LstCompChek: TLabel
          Left = 51
          Top = 54
          Width = 94
          Height = 13
          Caption = 'a Ordem Abaixo:'
        end
        object CkbGrupo: TCheckBox
          Left = 31
          Top = 38
          Width = 314
          Height = 18
          Caption = 'Os Dados Da Consulta Serão Agrupados Seguindo '
          TabOrder = 4
          OnClick = CkbGrupoClick
        end
        object LstGrupo: TListBox
          Left = 26
          Top = 72
          Width = 323
          Height = 378
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Definição de Grupo dos Dados'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object BtnDow: TBitBtn
          Left = 355
          Top = 240
          Width = 26
          Height = 28
          TabOrder = 2
          OnClick = BtnUpClick
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
        object BtnUp: TBitBtn
          Tag = 1
          Left = 355
          Top = 208
          Width = 26
          Height = 28
          TabOrder = 3
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
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'FimCons'
        object Bevel1: TBevel
          Left = 21
          Top = 14
          Width = 353
          Height = 39
          Shape = bsFrame
        end
        object Image1: TImage
          Left = 35
          Top = 17
          Width = 32
          Height = 32
          Picture.Data = {
            07544269746D617076020000424D760200000000000076000000280000002000
            0000200000000100040000000000000200000000000000000000100000001000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00777777777777000000007777777777777777777777708080808007777777
            77777777777777080877770800777777777777777777008087AABA7080007777
            77777777770000087ABAAAB7080000777777777770000087BAAABAAA70000007
            7777777700000007AFFAAABA780000007777777700000087BFFABAAA70000000
            7777777000000007AFFAAABA7800000007777770080800807AFFBAA780008080
            077777770000000807BAAA780800000077777777777770808077778080077777
            7777777777770008083333080800777777777777770000808333333080000077
            7777777770000008333333330800000777777777000000803333333380000000
            7777777700000008333333330800000077777770000000803333333380000000
            0777777008080008033333380800808007777777000000808033338080000000
            7777777777777008080808080807777777777777777700808011118080007777
            7777777777000008011111180800007777777777700000801111111180000007
            7777777700000008111111110800000077777777000000801111111180000000
            7777777000000008111111110800000007777770080800808111111080008080
            0777777700000008081111080800000077777777777777008080808080777777
            7777777777777770000000000777777777777777777777777777777777777777
            7777}
          Stretch = True
        end
        object CkbDistinct: TCheckBox
          Left = 114
          Top = 26
          Width = 176
          Height = 17
          Caption = 'Seleciona Linhas Distintas'
          TabOrder = 0
          OnClick = CkbDistinctClick
        end
        object PnlFinal: TPanel
          Left = 21
          Top = 62
          Width = 353
          Height = 387
          BevelOuter = bvNone
          TabOrder = 1
          object PageFinal: TPageControl
            Left = 0
            Top = 0
            Width = 353
            Height = 387
            ActivePage = TbsGrava
            Align = alClient
            TabOrder = 0
            object TbsGrava: TTabSheet
              Caption = 'Dados Para Gravacão'
              object MenDescSql: TMemo
                Left = 0
                Top = 64
                Width = 345
                Height = 295
                Align = alClient
                TabOrder = 0
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 345
                Height = 41
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label12: TLabel
                  Left = 6
                  Top = 0
                  Width = 104
                  Height = 13
                  Caption = 'Nome da Consulta'
                end
                object EdtNomeCons: TEdit
                  Left = 6
                  Top = 16
                  Width = 331
                  Height = 21
                  TabOrder = 0
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 41
                Width = 345
                Height = 23
                Align = alTop
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = ' Descrição '
                Color = clGray
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
            end
            object TbsSql: TTabSheet
              Caption = 'Frase Resultante'
              object MemSql: TMemo
                Left = 0
                Top = 0
                Width = 345
                Height = 359
                Align = alClient
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    object PnlCampos: TPanel
      Left = 396
      Top = 474
      Width = 310
      Height = 193
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'PnlCampos'
      TabOrder = 1
      Visible = False
      object LstCampoTab: TListBox
        Left = 4
        Top = 25
        Width = 302
        Height = 164
        ItemHeight = 13
        MultiSelect = True
        Style = lbOwnerDrawVariable
        TabOrder = 1
        OnDrawItem = LstCampoTabDrawItem
      end
      object LstCampoTabSel: TListBox
        Left = 4
        Top = 25
        Width = 302
        Height = 163
        ItemHeight = 13
        MultiSelect = True
        Style = lbOwnerDrawVariable
        TabOrder = 2
        Visible = False
        OnClick = LstCampoTabSelClick
        OnDblClick = LstCampoTabSelDblClick
        OnDrawItem = LstCampoTabDrawItem
      end
      object CmbTabelas: TComboBox
        Left = 4
        Top = 4
        Width = 303
        Height = 21
        Style = csDropDownList
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnChange = CmbTabelasChange
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 210
    Top = 41
    TargetsData = (
      1
      3
      (
        ''
        'Items'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object ImageList1: TImageList
    Left = 269
    Top = 40
    Bitmap = {
      494C010105000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF00C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C60000000000000000000084840000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF000000000000FF00FF0000000000000000000000
      0000FF00FF000000000000000000000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF0000000000008484000000000000FFFF000084840000000000000000000084
      84000084840000000000000000000000000000000000000000000000000000FF
      FF0000000000FFFF0000FFFF00008484000000000000FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      00000000000000000000000000000000000000000000000000000084840000FF
      FF0000000000008484000084840000FFFF000084840000848400008484000084
      840000848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFF0000FFFF000084840000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      00000000000000000000000000000000000084848400000000000000000000FF
      FF0000FFFF0000000000008484000084840000FFFF0000000000008484000000
      0000C6C6C600000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFF0000FFFF00008484000084840000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000FFFFFF000000000084848400848484008484
      8400848484008484840000000000000000000000000000848400008484000000
      000000848400000000000000000000FFFF000000000000FFFF0000FFFF000084
      840000000000008484000084840000000000000000000000000000FFFF0000FF
      FF0000000000FFFF0000FFFF000084840000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000008484840000000000000000000000000000848400008484000084
      84000000000000FFFF0000000000000000000000000000000000C6C6C60000FF
      FF0000000000008484000084840000000000000000000000000000FFFF0000FF
      FF0000000000FFFF0000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000000000000084840000000000008484000000
      000000FFFF008484840084848400000000008484840000000000008484000000
      000000FFFF000000000000FFFF0000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      84000000000084848400848484000000000084848400000000008484840000FF
      FF00C6C6C600000000000000000084848400000000000000000000FFFF0000FF
      FF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000000000000000000848484000000000084848400000000000000000000FF
      FF0000848400000000000000000000000000000000000000000000FFFF0000FF
      FF000084840000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      000000FFFF0000FFFF0084848400000000008484840000000000008484000000
      000000FFFF00000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484008484840084848400C6C6C6008484840000000000848484000084
      84008484840000000000000000000000000000000000000000000000000000FF
      FF000084840000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00000000008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848400000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000006007000000000000
      2007000000000000000700000000000000070000000000002007000000000000
      6007000000000000E007000000000000E007000000000000E007000000000000
      E007000000000000E007000000000000E007000000000000F007000000000000
      F807000000000000FC07000000000000FFFFFFFFFC03801FFFFFFE3FF803801F
      FE3FC207E003801FFC3FC003C007801FFC3FC003800F801FFC3F0011801F801F
      E0030680801F801FC0030800801F801FC0035114801F801FC0070900801F801F
      FC3FCD23803F801BFC3FD113807F8013FC3FE00780FFC003FC7FFD3F80FFE003
      FFFFFE7F80FFF013FFFFFFFFE3FFFFFB00000000000000000000000000000000
      000000000000}
  end
  object CdsTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 337
    Top = 40
  end
  object CdsCampo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 341
    Top = 92
  end
  object DsTabela: TDataSource
    DataSet = CdsTabela
    Left = 401
    Top = 40
  end
end
