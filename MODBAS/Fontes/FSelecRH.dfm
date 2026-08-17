inherited CMSelecionar: TCMSelecionar
  Left = 269
  Top = 207
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Seleção'
  ClientHeight = 266
  ClientWidth = 425
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 227
    Width = 425
    Height = 39
    Align = alBottom
    TabOrder = 0
    object Panel3: TPanel
      Left = 209
      Top = 1
      Width = 215
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnConfirmar: TBitBtn
        Left = 16
        Top = 5
        Width = 90
        Height = 29
        Caption = '&Confirmar'
        TabOrder = 0
        Kind = bkOK
      end
      object bbtnCancelar: TBitBtn
        Left = 115
        Top = 5
        Width = 88
        Height = 29
        Caption = '&Abandonar'
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 425
    Height = 227
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object dbgrdSelec: TDBGrid
      Left = 4
      Top = 4
      Width = 417
      Height = 219
      Align = alClient
      DataSource = dsSelec
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = dbgrdSelecDblClick
    end
  end
  object dsSelec: TDataSource
    AutoEdit = False
    Left = 348
    Top = 18
  end
end

