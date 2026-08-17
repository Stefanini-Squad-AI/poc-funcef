inherited FrmCadTRDxCResponMT: TFrmCadTRDxCResponMT
  Left = 327
  Top = 236
  HelpContext = 90043
  Caption = 
    'Cadastro de Centro de Responsabilidade x Tipo de Recebimento/Des' +
    'embolso'
  ClientHeight = 609
  ClientWidth = 709
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 705
    Height = 570
    Align = alLeft
    object Panel1: TPanel
      Left = 400
      Top = 1
      Width = 297
      Height = 72
      Caption = 'Panel1'
      TabOrder = 3
    end
    object PnlCadastro: TPanel
      Left = 1
      Top = 1
      Width = 328
      Height = 568
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 0
      object pnlBottonLeft: TPanel
        Left = 0
        Top = 108
        Width = 328
        Height = 460
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlBottonLeft'
        TabOrder = 0
        object dbgTRDDisponiveis: TwwDBGrid
          Left = 10
          Top = 0
          Width = 305
          Height = 460
          Selected.Strings = (
            'CODTIPRECDES'#9'15'#9'Código'#9'F'
            'DESCRICAO'#9'35'#9'Descrição'#9'F'
            'RECPAG'#9'1'#9'Tipo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsTRDDisponiveis
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
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
        object Panel2: TPanel
          Left = 315
          Top = 0
          Width = 13
          Height = 460
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 10
          Height = 460
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object pnlTopLeft: TPanel
        Left = 0
        Top = 0
        Width = 328
        Height = 108
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 164
          Height = 13
          Caption = 'Centro de Responsabilidade:'
        end
        object PnlTitDesemb: TPanel
          Left = 9
          Top = 65
          Width = 306
          Height = 33
          BevelInner = bvLowered
          Caption = 'Tipos de Recebimentos/Desembolsos Disponíveis'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dblcCRespon: TwwDBLookupCombo
          Left = 7
          Top = 31
          Width = 306
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'#9'F'
            'CODEXTERNO'#9'10'#9'Código'#9'F')
          LookupTable = cdsCentroRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          Style = csDropDownList
          Color = clInfoBk
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblcCResponCloseUp
        end
      end
    end
    object PnlCtrls: TPanel
      Left = 329
      Top = 1
      Width = 31
      Height = 568
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnExcluiSelecionado: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Seleciona'
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
        Hint = 'Seleciona Todos'
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
        Hint = 'Exclui'
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
        Hint = 'Exclui todos'
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
      Left = 360
      Top = 1
      Width = 344
      Height = 568
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 2
      object Panel4: TPanel
        Left = 0
        Top = 113
        Width = 344
        Height = 455
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 0
        object dbgTRDSelecionados: TwwDBGrid
          Left = 12
          Top = 0
          Width = 320
          Height = 455
          Selected.Strings = (
            'CODTIPRECDES'#9'15'#9'Código'
            'DESCRICAO'#9'35'#9'Descrição'
            'RECPAG'#9'1'#9'Tipo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsTRDSelecionados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
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
        object Panel6: TPanel
          Left = 332
          Top = 0
          Width = 12
          Height = 455
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 12
          Height = 455
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object pnlTopRight: TPanel
        Left = 0
        Top = 0
        Width = 344
        Height = 113
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 9
          Top = 12
          Width = 125
          Height = 13
          Caption = 'Tipo de Lançamento :'
        end
        object PnlTitTipoAgreAssoc: TPanel
          Left = 10
          Top = 65
          Width = 322
          Height = 36
          BevelInner = bvLowered
          Caption = 'Tipos de Recebimentos/Desembolsos Selecionados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object rdgTiposRD: TRadioGroup
          Left = 10
          Top = 27
          Width = 322
          Height = 34
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
    end
  end
  inherited Dock971: TDock97
    Top = 570
    Width = 709
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
    Left = 650
    Top = 135
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 136
  end
  object cdsTRDDisponiveis: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'RecPag;Descricao'
    Params = <>
    Left = 144
    Top = 192
  end
  object dsTRDDisponiveis: TwwDataSource
    DataSet = cdsTRDDisponiveis
    Left = 216
    Top = 184
  end
  object cdsTRDSelecionados: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'RecPag;Descricao'
    Params = <>
    Left = 504
    Top = 280
  end
  object dsTRDSelecionados: TwwDataSource
    DataSet = cdsTRDSelecionados
    Left = 584
    Top = 128
  end
end
