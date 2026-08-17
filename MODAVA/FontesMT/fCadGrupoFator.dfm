inherited frmCadGrupoFator: TfrmCadGrupoFator
  Left = 157
  Top = 140
  HelpContext = 700004
  Caption = 'Cadastro dos Grupos de Fatores de Avaliação'
  ClientHeight = 304
  ClientWidth = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 473
    Height = 218
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 15
      Top = 50
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 15
      Top = 97
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 15
      Top = 22
      Width = 114
      Height = 21
      DataField = 'IDGRUPOFATORAVAL'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 15
      Top = 65
      Width = 442
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbmemOBS: TDBMemo
      Left = 15
      Top = 111
      Width = 442
      Height = 97
      DataField = 'OBSGRUPOFATOR'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 2
      WantTabs = True
    end
  end
  inherited Dock972: TDock97
    Width = 473
    inherited Toolbar971: TToolbar97
      object bbtnCargos: TToolbarButton97
        Left = 260
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar/Ocultar Cargos do Grupo (alternar)'
        Caption = '&Fatores'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = bbtnCargosClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
    end
  end
  inherited Dock971: TDock97
    Top = 265
    Width = 473
    inherited tb97Fundo: TToolbar97
      Left = 303
      DockPos = 410
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 136
      DockPos = 242
    end
  end
  object pnlFatores: TPanel [3]
    Left = 0
    Top = 285
    Width = 473
    Height = 156
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 5
      Top = 4
      Width = 463
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Relação de Fatores Associados'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbGridFatores: TwwDBGrid
      Left = 5
      Top = 25
      Width = 463
      Height = 127
      Selected.Strings = (
        'IDFATORAVAL'#9'10'#9'Código'
        'DESCRFATORAVAL'#9'60'#9'Descrição'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsFator
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 258
    Top = 94
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 350
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 258
    Top = 81
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 197
    Top = 95
  end
  inherited Cds: TCMClientDataSet
    Left = 322
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo de Fator de Avaliação'
    Colunas.Strings = (
      'GRUPOFATORAVAL.IDGRUPOFATORAVAL'
      'GRUPOFATORAVAL.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOFATORAVAL')
    CamposChave.Strings = (
      'GRUPOFATORAVAL.IDGRUPOFATORAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '65')
    ExibePergunta = False
    Left = 197
    Top = 81
  end
  object dsFator: TwwDataSource
    AutoEdit = False
    DataSet = CdsFator
    OnStateChange = dsStateChange
    Left = 370
    Top = 94
  end
  object CdsFator: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 370
    Top = 81
  end
end
