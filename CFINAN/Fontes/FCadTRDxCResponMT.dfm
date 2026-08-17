inherited FrmCadTRDxCResponMT: TFrmCadTRDxCResponMT
  Left = 186
  Top = 204
  HelpContext = 90043
  Caption = 
    'Cadastro de Centro de Responsabilidade x Tipo de Recebimento/Des' +
    'embolso'
  ClientHeight = 376
  ClientWidth = 692
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 337
    object PnlCadastro: TPanel
      Left = 5
      Top = 5
      Width = 332
      Height = 327
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 0
      object pnlCR: TPanel
        Left = 0
        Top = 0
        Width = 332
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 164
          Height = 13
          Caption = 'Centro de Responsabilidade:'
        end
        object dblcCRespon: TwwDBLookupCombo
          Left = 7
          Top = 23
          Width = 322
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Centro de Responsabilidade'#9'F'
            'CODCENTRORESPON'#9'10'#9'Código'#9'F')
          LookupTable = cdsCentroRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          Style = csDropDownList
          Color = clInfoBk
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblcCResponChange
        end
      end
      object dbgTRDDisponiveis: TwwDBGrid
        Left = 0
        Top = 117
        Width = 332
        Height = 210
        Selected.Strings = (
          'DESCRICAO'#9'33'#9'Tipo de Rec/Des'
          'CODTIPRECDES'#9'8'#9'Código')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsTRDDisponiveis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
      object PnlTitDesemb: TPanel
        Left = 0
        Top = 91
        Width = 332
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Disponíveis'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object rdgTiposRD: TRadioGroup
        Left = 0
        Top = 50
        Width = 332
        Height = 41
        Align = alTop
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Recebimentos '
          'Pagamentos'
          'Todos')
        TabOrder = 1
        OnClick = rdgTiposRDClick
      end
    end
    object PnlCtrls: TPanel
      Left = 337
      Top = 5
      Width = 31
      Height = 327
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnExcluiSelecionado: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiSelecionadoClick
      end
      object BtnExcluiTodosSelecionados: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnExcluiTodosSelecionadosClick
      end
      object BtnIncluiDisponivel: TSpeedButton
        Left = 4
        Top = 252
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiDisponivelClick
      end
      object BtnIncluiTodosDisponiveis: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnIncluiTodosDisponiveisClick
      end
    end
    object PnlDesemb: TPanel
      Left = 368
      Top = 5
      Width = 319
      Height = 327
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 2
      object dbgTRDSelecionados: TwwDBGrid
        Left = 0
        Top = 117
        Width = 319
        Height = 210
        Selected.Strings = (
          'DESCRICAO'#9'25'#9'Tipo de Rec/Des'
          'CODTIPRECDES'#9'9'#9'Código'
          'RECPAG'#9'4'#9'Tipo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = dsTRDSelecionados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 91
        Width = 319
        Height = 26
        Align = alBottom
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Selecionados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnlTopoSelecionados: TPanel
        Left = 0
        Top = 0
        Width = 319
        Height = 91
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 692
    inherited tb97Fundo: TToolbar97
      Left = 375
      DockPos = 375
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90043
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      DockPos = 166
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 642
    Top = 15
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 16
  end
  object cdsTRDDisponiveis: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'RecPag;Descricao'
    Params = <>
    Left = 144
    Top = 176
  end
  object dsTRDDisponiveis: TwwDataSource
    DataSet = cdsTRDDisponiveis
    Left = 144
    Top = 232
  end
  object cdsTRDSelecionados: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'RecPag;Descricao'
    Params = <>
    Left = 496
    Top = 176
  end
  object dsTRDSelecionados: TwwDataSource
    DataSet = cdsTRDSelecionados
    Left = 496
    Top = 232
  end
end
