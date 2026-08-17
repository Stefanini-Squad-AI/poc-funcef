inherited FrmCadGrupoFunc: TFrmCadGrupoFunc
  Left = 75
  Top = 195
  Caption = 'Grupos Funcionais'
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
        Left = 116
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 116
        Top = 54
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 116
        Top = 96
        Width = 197
        Height = 13
        Caption = 'Intervalo entre Avaliações (meses)'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 116
        Top = 138
        Width = 85
        Height = 13
        Caption = 'Grau Instrução'
      end
      object DBEdit1: TDBEdit
        Left = 116
        Top = 27
        Width = 34
        Height = 21
        DataField = 'CODGRPFUNC'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 116
        Top = 69
        Width = 334
        Height = 21
        DataField = 'DESCGRPFUNC'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 116
        Top = 111
        Width = 64
        Height = 21
        DataField = 'INTERVALO'
        DataSource = ds
        TabOrder = 2
      end
      object dblkcGrauInstr: TwwDBLookupCombo
        Left = 116
        Top = 153
        Width = 334
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição'
          'IDGRINSTR'#9'10'#9'Grau')
        DataField = 'IDGRINSTR'
        DataSource = ds
        LookupTable = qryGrauInstr
        LookupField = 'IDGRINSTR'
        Options = [loColLines, loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcGrauInstrChange
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 572
      Height = 193
      Selected.Strings = (
        'CODGRPFUNC'#9'1'#9'Código'
        'DESCGRPFUNC'#9'40'#9'Descrição'
        'INTERVALO'#9'10'#9'Meses'
        'DESCRGRINSTR'#9'30'#9'Grau de Instrução')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 580
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
  object pnlCargos: TPanel [3]
    Left = 114
    Top = 70
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
      '  GF.CODGRPFUNC, GF.DESCGRPFUNC, GF.INTERVALO, GF.IDGRINSTR,'
      '  GI.DESCRICAO AS DESCRGRINSTR'
      'FROM'
      '  GRUPFUNC GF, GRINSTR GI'
      'WHERE'
      '  (GF.IDGRINSTR = GI.IDGRINSTR(+))'
      'ORDER BY'
      '  GF.CODGRPFUNC')
    Left = 375
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPFUNC'
      'set'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  DESCGRPFUNC = :DESCGRPFUNC,'
      '  INTERVALO = :INTERVALO,'
      '  IDGRINSTR = :IDGRINSTR'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC and'
      '  DESCGRPFUNC = :OLD_DESCGRPFUNC')
    InsertSQL.Strings = (
      'insert into GRUPFUNC'
      '  (CODGRPFUNC, DESCGRPFUNC, INTERVALO, IDGRINSTR)'
      'values'
      '  (:CODGRPFUNC, :DESCGRPFUNC, :INTERVALO, :IDGRINSTR)')
    DeleteSQL.Strings = (
      'delete from GRUPFUNC'
      'where'
      '  CODGRPFUNC = :OLD_CODGRPFUNC and'
      '  DESCGRPFUNC = :OLD_DESCGRPFUNC')
    Left = 345
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupos Funcionais'
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
      'IDGRINSTR')
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
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 526
    Top = 10
  end
  object qryGrauInstr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRINSTR, DESCRICAO'
      'FROM'
      '  GRINSTR'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 516
    Top = 131
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
    Left = 518
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRPFUNC'
        ParamType = ptUnknown
      end>
  end
  object dsCargo: TwwDataSource
    DataSet = qryCargo
    Left = 518
    Top = 60
  end
end
