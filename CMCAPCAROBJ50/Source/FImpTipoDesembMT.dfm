inherited FrmImpTipoDesembMT: TFrmImpTipoDesembMT
  Left = 247
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Tipos de Desembolso'
  ClientHeight = 436
  ClientWidth = 437
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 397
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 437
    Height = 397
    object Panel2: TPanel
      Left = 5
      Top = 49
      Width = 427
      Height = 343
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel2'
      Enabled = False
      TabOrder = 1
      object Panel3: TPanel
        Left = 5
        Top = 5
        Width = 417
        Height = 34
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Desembolso'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object treeDesemb: TCMTreeViewMT
        Left = 5
        Top = 39
        Width = 417
        Height = 299
        PodeNavegar = True
        DataSource = ds
        CampoChave = 'CODTIPRECDES'
        CampoDescricao = 'DESCRICAO'
        CampoTipo = 'ANASINT'
        Align = alClient
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 427
      Height = 44
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Copiar de:'
      end
      object CmbTipoDesemb: TwwDBLookupCombo
        Left = 75
        Top = 11
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEEMPRESA'#9'60'#9'NOMEEMPRESA')
        LookupTable = CdsEmpresa
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = CmbTipoDesembCloseUp
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = CdsTipoDesemb
    Left = 53
    Top = 263
  end
  object CdsEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 140
    Top = 167
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 140
    Top = 215
  end
  object CdsImporta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 140
    Top = 119
  end
end
