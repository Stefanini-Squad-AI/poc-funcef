inherited frmCadBancoPortador: TfrmCadBancoPortador
  Left = 71
  Top = 117
  HelpContext = 210042
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Portador Forma por Banco'
  ClientHeight = 396
  ClientWidth = 653
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 653
    Height = 357
    BorderWidth = 2
    object Bevel1: TBevel
      Left = 14
      Top = 173
      Width = 58
      Height = 29
    end
    object Bevel2: TBevel
      Left = 5
      Top = 4
      Width = 643
      Height = 165
      Shape = bsFrame
      Style = bsRaised
    end
    object Label1: TLabel
      Left = 14
      Top = 11
      Width = 131
      Height = 13
      Caption = 'Portador Forma Padrão'
    end
    object sbAssociaAg: TSpeedButton
      Left = 16
      Top = 175
      Width = 25
      Height = 25
      Hint = 'Associa uma Agência'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAssociaAgClick
    end
    object sbDesassociaAg: TSpeedButton
      Left = 45
      Top = 175
      Width = 25
      Height = 25
      Hint = 'Desassocia uma Agência'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDesassociaAgClick
    end
    object dblkPortadorPadrao: TwwDBLookupCombo
      Left = 14
      Top = 26
      Width = 308
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      LookupTable = CdsPortFormaPadrao
      LookupField = 'CODPORTFORMA'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object wwDBGrid1: TwwDBGrid
      Left = 14
      Top = 54
      Width = 308
      Height = 106
      Selected.Strings = (
        'NOME'#9'60'#9'Banco')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsBanco
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object wwDBGrid2: TwwDBGrid
      Left = 330
      Top = 54
      Width = 308
      Height = 106
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Contas / Caixas x Formas de Pagamento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsPortForma
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object dbgdPortForma: TwwDBGrid
      Left = 14
      Top = 205
      Width = 624
      Height = 138
      Selected.Strings = (
        'NOMEBANCO'#9'42'#9'Banco'#9'F'
        'DESCRICAO'#9'55'#9'Contas / Caixas x Forma de Pagamento'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Ctl3D = True
      DataSource = dsPortBanco
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
      ParentCtl3D = False
      ParentFont = False
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
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 357
    Width = 653
    inherited tb97Fundo: TToolbar97
      Left = 484
      DockPos = 492
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 317
      DockPos = 325
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 351
  end
  object dsBanco: TwwDataSource
    AutoEdit = False
    DataSet = CdsBanco
    Left = 197
    Top = 71
  end
  object dsPortForma: TwwDataSource
    AutoEdit = False
    DataSet = CdsPortForma
    Left = 486
    Top = 69
  end
  object dsPortBanco: TwwDataSource
    AutoEdit = False
    DataSet = CdsPortBanco
    Left = 136
    Top = 252
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsBancoIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsBancoIndex'
    Params = <>
    StoreDefs = True
    Left = 148
    Top = 71
  end
  object CdsPortForma: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsPortFormaIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsPortFormaIndex'
    Params = <>
    StoreDefs = True
    Left = 420
    Top = 69
  end
  object CdsPortFormaPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 1
  end
  object CdsPortBanco: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsPortBancoIndex'
        CaseInsFields = 'NOMEBANCO'
        Fields = 'NOMEBANCO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsPortBancoIndex'
    Params = <>
    StoreDefs = True
    Left = 68
    Top = 252
  end
end
