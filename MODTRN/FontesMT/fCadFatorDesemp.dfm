inherited frmCadFatorDesemp: TfrmCadFatorDesemp
  Left = 108
  Top = 126
  Caption = 
    'Fatores de Avaliação de Desempenho (Competências e Cursos que as' +
    ' Otimizam)'
  ClientHeight = 369
  ClientWidth = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 283
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 94
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 17
      Top = 153
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = dbedDescr
    end
    object Label6: TLabel
      Left = 17
      Top = 56
      Width = 190
      Height = 13
      Caption = 'Grupo de Fatores a que Pertence'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 26
      Width = 64
      Height = 21
      DataField = 'IDFATORAVAL'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 94
      Top = 26
      Width = 488
      Height = 21
      DataField = 'DESCRFATORAVAL'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object dbmemOBS: TDBMemo
      Left = 17
      Top = 168
      Width = 565
      Height = 103
      DataField = 'OBSFATORAVAL'
      DataSource = ds
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
      WantTabs = True
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 17
      Top = 70
      Width = 565
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
      DataField = 'IDGRUPOFATORAVAL'
      DataSource = ds
      LookupTable = CdsGrupoFatorAval
      LookupField = 'IDGRUPOFATORAVAL'
      Style = csDropDownList
      ReadOnly = True
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      OrderByDisplay = False
      AllowClearKey = True
    end
    object dbrgAplicabilidade: TDBRadioGroup
      Left = 17
      Top = 101
      Width = 565
      Height = 41
      Caption = 'Aplicabilidade'
      Columns = 3
      DataField = 'INDFATORAVAL'
      DataSource = ds
      Items.Strings = (
        'Avaliações de Desempenho'
        'Avaliações de Cargos'
        'Ambas as Avaliações')
      ReadOnly = True
      TabOrder = 4
      Values.Strings = (
        '1'
        '2'
        '0')
    end
  end
  inherited Dock972: TDock97
    Width = 598
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object bbtnCursos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar/Ocultar Cursos que Otimizam Este Fator (alternar)'
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
    Top = 330
    Width = 598
    inherited tb97Fundo: TToolbar97
      Left = 428
      DockPos = 436
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 261
      DockPos = 269
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object pnlCursos: TPanel [3]
    Left = 122
    Top = 355
    Width = 354
    Height = 156
    TabOrder = 3
    Visible = False
    object Label4: TLabel
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
        'CURSO'#9'60'#9'CURSO')
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
      Options = [dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    Left = 381
    Top = 15
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    OnStateChange = dsStateChange
    Left = 558
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 382
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 318
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 530
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fator de Avaliação'
    Colunas.Strings = (
      'IDFATORAVAL'
      'DESCRFATORAVAL'
      
        'DECODE(INDFATORAVAL, 1,'#39'Aval. Desempenho'#39', 2, '#39'Aval. Cargos'#39', '#39'D' +
        'esempenho/Cargos'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Aplicabilidade')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'FATORAVAL')
    CamposChave.Strings = (
      'IDFATORAVAL')
    Filtro.Strings = (
      'INDFATORAVAL <> 2')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '30')
    ExibePergunta = False
    Left = 318
    Top = 1
  end
  object CdsGrupoFatorAval: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsGrupoFatorAvalIndexDESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsGrupoFatorAvalIndexDESCRICAO'
    Params = <>
    StoreDefs = True
    Left = 482
    Top = 1
  end
  object dsCurso: TwwDataSource
    DataSet = CdsCurso
    Left = 493
    Top = 70
  end
  object CdsCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 493
    Top = 57
  end
end
