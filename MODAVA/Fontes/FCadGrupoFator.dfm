inherited FrmCadGrupoFator: TFrmCadGrupoFator
  Left = 75
  Top = 195
  Caption = 'Grupos de Fatores de Avaliação'
  ClientHeight = 287
  ClientWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 580
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 572
      Height = 193
      object Label1: TLabel
        Left = 66
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 66
        Top = 107
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 66
        Top = 64
        Width = 40
        Height = 21
        DataField = 'IDGRUPOFATORAVAL'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 66
        Top = 122
        Width = 440
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 572
      Height = 193
      Selected.Strings = (
        'IDGRUPOFATORAVAL'#9'10'#9'Código'
        'DESCRICAO'#9'77'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 580
    inherited Toolbar971: TToolbar97
      object bbtnFatores: TToolbarButton97
        Left = 260
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Mostrar/Ocultar Fatores do Grupo (alternar)'
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
        OnClick = bbtnFatoresClick
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
    Top = 248
    Width = 580
    inherited tb97Fundo: TToolbar97
      Left = 410
      DockPos = 410
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 242
      DockPos = 242
    end
  end
  object pnlFatores: TPanel [3]
    Left = 50
    Top = 70
    Width = 478
    Height = 156
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 5
      Top = 4
      Width = 468
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Relação de Fatores'
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
      Width = 468
      Height = 127
      Selected.Strings = (
        'IDFATORAVAL'#9'10'#9'Código'
        'DESCRFATORAVAL'#9'60'#9'Descrição')
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
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  IDGRUPOFATORAVAL, DESCRICAO'
      'FROM'
      '  GRUPOFATORAVAL'
      'ORDER BY'
      '  IDGRUPOFATORAVAL')
    Left = 375
    Top = 3
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 86
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOFATORAVAL'
      'set'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDGRUPOFATORAVAL = :OLD_IDGRUPOFATORAVAL')
    InsertSQL.Strings = (
      'insert into GRUPOFATORAVAL'
      '  (IDGRUPOFATORAVAL, DESCRICAO)'
      'values'
      '  (:IDGRUPOFATORAVAL, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from GRUPOFATORAVAL'
      'where'
      '  IDGRUPOFATORAVAL = :OLD_IDGRUPOFATORAVAL')
    Left = 345
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos Funcionais'
    Colunas.Strings = (
      'IDGRUPOFATORAVAL'
      'DESCRICAO')
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
      'IDGRUPOFATORAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 453
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 405
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Top = 86
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 526
    Top = 10
  end
  object qryFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFATORAVAL, DESCRFATORAVAL'
      'FROM'
      '  FATORAVAL'
      'WHERE'
      '  (IDGRUPOFATORAVAL = :IDGRUPOFATORAVAL)'
      'ORDER BY'
      '  IDFATORAVAL')
    ValidateWithMask = True
    Left = 294
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOFATORAVAL'
        ParamType = ptUnknown
      end>
  end
  object dsFator: TwwDataSource
    DataSet = qryFator
    Left = 294
    Top = 132
  end
end
