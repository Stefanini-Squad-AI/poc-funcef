inherited frmCadGrpTr: TfrmCadGrpTr
  Left = 267
  Top = 171
  Caption = 'Cadastro de Grupos de Treinamento'
  ClientHeight = 287
  ClientWidth = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 477
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 469
      Height = 193
      object Label1: TLabel
        Left = 33
        Top = 36
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 33
        Top = 109
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 33
        Top = 51
        Width = 47
        Height = 21
        DataField = 'CODGRPTREIN'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 33
        Top = 124
        Width = 310
        Height = 21
        DataField = 'DESCGRPTREIN'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 469
      Height = 193
      Selected.Strings = (
        'CODGRPTREIN'#9'1'#9'Código'
        'DESCGRPTREIN'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 477
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
    end
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 477
    inherited tb97Fundo: TToolbar97
      Left = 307
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 140
    end
  end
  object pnlCargos: TPanel [3]
    Left = 65
    Top = 69
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
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsCargo
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
      TitleFont.Color = clWhite
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
      '  CODGRPTREIN, DESCGRPTREIN'
      'FROM'
      '  GRPTREIN'
      'ORDER BY'
      '  CODGRPTREIN')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 105
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRPTREIN'
      'set'
      '  CODGRPTREIN = :CODGRPTREIN,'
      '  DESCGRPTREIN = :DESCGRPTREIN'
      'where'
      '  CODGRPTREIN = :OLD_CODGRPTREIN')
    InsertSQL.Strings = (
      'insert into GRPTREIN'
      '  (CODGRPTREIN, DESCGRPTREIN)'
      'values'
      '  (:CODGRPTREIN, :DESCGRPTREIN)')
    DeleteSQL.Strings = (
      'delete from GRPTREIN'
      'where'
      '  CODGRPTREIN = :OLD_CODGRPTREIN')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos de Treinamento'
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
    Left = 348
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 105
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 1
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARGO, TITULO'
      'FROM'
      '  CARGO'
      'WHERE'
      '  (CODGRPFUNC = :CODGRPFUNC)'
      'ORDER BY'
      '  CODGRPFUNC')
    ValidateWithMask = True
    Left = 182
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRPFUNC'
        ParamType = ptUnknown
      end>
  end
  object dsCargo: TwwDataSource
    DataSet = qryCargo
    Left = 182
    Top = 1
  end
end
