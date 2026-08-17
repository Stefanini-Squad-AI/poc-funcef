inherited frmCadPacote: TfrmCadPacote
  Left = 314
  Top = 166
  Width = 453
  Caption = 'Tabela de Pacotes de Cursos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    inherited pnlControles: TPanel
      Width = 435
      object Label1: TLabel
        Left = 63
        Top = 30
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 63
        Top = 99
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 63
        Top = 45
        Width = 43
        Height = 21
        DataField = 'IDPACOTE'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 63
        Top = 114
        Width = 290
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 435
      Selected.Strings = (
        'IDPACOTE'#9'6'#9'Código'
        'DESCRICAO'#9'43'#9'Descrição')
    end
    object dbGridCursos: TwwDBGrid
      Left = 53
      Top = 48
      Width = 338
      Height = 106
      Selected.Strings = (
        'IDCURSO'#9'7'#9'Código'
        'DESCRICAO'#9'30'#9'Descrição')
      IniAttributes.Delimiter = ';;'
      TitleColor = clYellow
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clAqua
      DataSource = ds2
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      Visible = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock972: TDock97
    Width = 445
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
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblPacote
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
    Top = 67
  end
  object tblPacote: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPACOTE'
    TableName = 'CM.PACOTE'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 159
    Top = 98
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = tblCurso
    Left = 279
    Top = 39
  end
  object tblCurso: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPACOTE'
    MasterFields = 'IDPACOTE'
    MasterSource = ds
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 321
    Top = 39
  end
end
