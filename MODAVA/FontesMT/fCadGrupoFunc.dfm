inherited frmCadGrupoFunc: TfrmCadGrupoFunc
  Left = 190
  Top = 209
  Caption = 'Cadastro dos Grupos Funcionais'
  ClientHeight = 241
  ClientWidth = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 423
    Height = 155
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 72
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 16
      Top = 58
      Width = 197
      Height = 13
      Caption = 'Intervalo entre Avaliações (meses)'
      FocusControl = dbedInterv
    end
    object Label4: TLabel
      Left = 16
      Top = 104
      Width = 85
      Height = 13
      Caption = 'Grau Instrução'
    end
    object lblFatorHay: TLabel
      Left = 333
      Top = 58
      Width = 56
      Height = 13
      Caption = 'Fator Hay'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 27
      Width = 45
      Height = 21
      DataField = 'CODGRPFUNC'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 72
      Top = 27
      Width = 334
      Height = 21
      DataField = 'DESCGRPFUNC'
      DataSource = ds
      TabOrder = 1
    end
    object dbedInterv: TDBEdit
      Left = 16
      Top = 73
      Width = 81
      Height = 21
      DataField = 'INTERVALO'
      DataSource = ds
      MaxLength = 2
      TabOrder = 2
    end
    object dblkcGrauInstr: TwwDBLookupCombo
      Left = 16
      Top = 119
      Width = 390
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Descrição'
        'IDGRINSTR'#9'10'#9'Grau')
      DataField = 'IDGRINSTR'
      DataSource = ds
      LookupTable = CdsGrauInstr
      LookupField = 'IDGRINSTR'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbreFatorHay: TDBRealEdit
      Left = 333
      Top = 73
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'FATORHAY'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 423
    inherited Toolbar971: TToolbar97
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
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 20
      end
    end
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 423
    inherited tb97Fundo: TToolbar97
      Left = 253
      DockPos = 410
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 86
      DockPos = 242
    end
  end
  object pnlCargos: TPanel [3]
    Left = 34
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
      Caption = 'Relação dos Cargos Associados'
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 239
    Top = 54
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 350
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 239
    Top = 41
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 178
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    Left = 322
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo Funcional'
    Colunas.Strings = (
      'CODGRPFUNC'
      'DESCGRPFUNC')
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
      'GRUPFUNC')
    CamposChave.Strings = (
      'GRUPFUNC.CODGRPFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '45')
    ExibePergunta = False
    Left = 178
    Top = 41
  end
  object dsCargo: TwwDataSource
    DataSet = CdsCargo
    Left = 291
    Top = 54
  end
  object CdsGrauInstr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 351
    Top = 41
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 291
    Top = 41
  end
end
