inherited FrmCarregaTabua: TFrmCarregaTabua
  Left = 349
  Top = 223
  Caption = 'Carrega as tábuas de serviço'
  ClientHeight = 193
  ClientWidth = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 491
    Height = 154
    object Panel1: TPanel
      Left = 2
      Top = 3
      Width = 487
      Height = 146
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 160
        Height = 13
        Caption = 'Tábua de serviço masculino'
      end
      object Label2: TLabel
        Left = 8
        Top = 53
        Width = 151
        Height = 13
        Caption = 'Tábua de serviço feminino'
      end
      object Label3: TLabel
        Left = 8
        Top = 99
        Width = 100
        Height = 13
        Caption = 'Tábua de pensão'
      end
      object wwdblkpTabMasculino: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 473
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cmcdsTabMasculino
        LookupField = 'SQ_VERSAO_COMUTACAO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object wwdblkpTabFeminino: TwwDBLookupCombo
        Left = 8
        Top = 69
        Width = 473
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cmcdsFeminino
        LookupField = 'SQ_VERSAO_COMUTACAO'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object wwdblkpTabPensao: TwwDBLookupCombo
        Left = 8
        Top = 115
        Width = 473
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = cmcdsTabPensao
        LookupField = 'SQ_VERSAO_COMUTACAO'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 491
    inherited tb97Fundo: TToolbar97
      Left = 319
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 150
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 114
    Top = 159
  end
  object cmcdsTabMasculino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 15
  end
  object cmcdsFeminino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 61
  end
  object cmcdsTabPensao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 107
  end
  object wwdsTabMasculino: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsTabMasculino
    Left = 418
    Top = 15
  end
  object wwdsTabFeminino: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsFeminino
    Left = 418
    Top = 61
  end
  object wwdsTabPensao: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsTabPensao
    Left = 418
    Top = 107
  end
end
