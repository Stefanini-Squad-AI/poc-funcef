inherited frmCadPacote: TfrmCadPacote
  Left = 235
  Top = 119
  HelpContext = 720004
  Caption = 'Tabela de Pacotes de Cursos'
  ClientHeight = 291
  ClientWidth = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 365
    Height = 205
    BorderWidth = 2
    object Label1: TLabel
      Left = 28
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 27
      Top = 74
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 28
      Top = 30
      Width = 58
      Height = 21
      DataField = 'IDPACOTE'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 27
      Top = 89
      Width = 310
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgTipo: TDBRadioGroup
      Left = 27
      Top = 129
      Width = 310
      Height = 60
      Caption = 'Tipo de Pacote (os cursos que o compõem são)'
      DataField = 'TIPO'
      DataSource = ds
      Items.Strings = (
        'Complementares (formam uma sequência)'
        'Mutuamente Exclusivos (basta um deles)')
      TabOrder = 2
      Values.Strings = (
        '0'
        '1')
    end
  end
  inherited Dock972: TDock97
    Width = 365
    inherited Toolbar971: TToolbar97
      object sbtnCursos: TToolbarButton97
        Left = 260
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar Cursos do Pacote (alternar)'
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
        OnClick = sbtnCursosClick
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
    Top = 252
    Width = 365
    inherited tb97Fundo: TToolbar97
      Left = 195
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 28
    end
  end
  object pnlCargos: TPanel [3]
    Left = 16
    Top = 275
    Width = 303
    Height = 156
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 5
      Top = 4
      Width = 292
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
    object dbGridCargos: TwwDBGrid
      Left = 5
      Top = 25
      Width = 292
      Height = 127
      Selected.Strings = (
        'IDCURSO'#9'7'#9'Código'#9'F'
        'DESCRICAO'#9'30'#9'Descrição'#9'F')
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
    Left = 280
    Top = 13
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 110
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 82
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pacote de Curso'
    Colunas.Strings = (
      'PACOTE.IDPACOTE'
      'PACOTE.DESCRICAO')
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
      'PACOTE')
    CamposChave.Strings = (
      'PACOTE.IDPACOTE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Top = 1
  end
  object dsCurso: TwwDataSource
    AutoEdit = False
    DataSet = CdsCurso
    Left = 150
    Top = 15
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 150
    Top = 1
  end
end
