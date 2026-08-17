inherited frmCadGrpTr: TfrmCadGrpTr
  Left = 193
  Top = 197
  HelpContext = 720005
  Caption = 'Cadastro de Grupos de Treinamento'
  ClientHeight = 241
  ClientWidth = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 385
    Height = 155
    BorderWidth = 2
    object Label1: TLabel
      Left = 30
      Top = 25
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 30
      Top = 88
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 30
      Top = 40
      Width = 56
      Height = 21
      DataField = 'CODGRPTREIN'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 30
      Top = 103
      Width = 323
      Height = 21
      DataField = 'DESCGRPTREIN'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 385
    inherited Toolbar971: TToolbar97
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object bbtnCargos: TToolbarButton97
        Left = 260
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar/Ocultar Cargos do Grupo (alternar)'
        Caption = '&Cargos'
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
      object bbtnCursos: TToolbarButton97
        Left = 320
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar/Ocultar Cursos do Grupo (alternar)'
        Caption = '&Cursos'
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
        OnClick = bbtnCursosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 385
    inherited tb97Fundo: TToolbar97
      Left = 215
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 48
    end
  end
  object pnlCargos: TPanel [3]
    Left = 15
    Top = 222
    Width = 354
    Height = 156
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 5
      Top = 4
      Width = 344
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Relação de Cargos'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbGridCargos: TwwDBGrid
      Left = 5
      Top = 25
      Width = 345
      Height = 127
      Selected.Strings = (
        'IDCARGO'#9'10'#9'Código'
        'TITULO'#9'40'#9'Título')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsCargo
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
  object pnlCursos: TPanel [4]
    Left = 15
    Top = 382
    Width = 354
    Height = 156
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 5
      Top = 4
      Width = 344
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Relação de Cursos'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbGridCursos: TwwDBGrid
      Left = 5
      Top = 25
      Width = 345
      Height = 127
      Selected.Strings = (
        'DESCRICAO'#9'52'#9'Descrição'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsCurso
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
    Left = 323
    Top = 64
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 119
    Top = 51
  end
  inherited ImlPadrao: TImageList
    Left = 323
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 262
    Top = 64
  end
  inherited Cds: TCMClientDataSet
    Left = 91
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo de Treinamento'
    Colunas.Strings = (
      'GRPTREIN.CODGRPTREIN'
      'GRPTREIN.DESCGRPTREIN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRPTREIN')
    CamposChave.Strings = (
      'GRPTREIN.CODGRPTREIN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '1'
      '40')
    ExibePergunta = False
    Left = 262
    Top = 51
  end
  object dsCargo: TwwDataSource
    DataSet = CdsCargo
    Left = 189
    Top = 64
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 189
    Top = 51
  end
  object dsCurso: TwwDataSource
    DataSet = CdsCurso
    Left = 133
    Top = 104
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 133
    Top = 91
  end
end
