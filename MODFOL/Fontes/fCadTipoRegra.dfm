inherited frmCadTipoRegra: TfrmCadTipoRegra
  Left = 138
  Top = 88
  Caption = 'Cadastro de Tipos de Regra ou Forma de Cálculo'
  ClientHeight = 430
  ClientWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 344
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 72
      Height = 13
      Caption = 'Identificador'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 93
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 10
      Top = 98
      Width = 81
      Height = 13
      Caption = 'SQL da Regra'
    end
    object Label4: TLabel
      Left = 10
      Top = 53
      Width = 91
      Height = 13
      Caption = 'Grupo de Regra'
    end
    object dbmemSQLRegra: TDBMemo
      Left = 10
      Top = 114
      Width = 461
      Height = 216
      DataField = 'SQLREGRA'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object dbedDescTpRegra: TwwDBEdit
      Left = 93
      Top = 29
      Width = 381
      Height = 21
      DataField = 'DESCREGRA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeIdTpRegra: TDBEdit
      Left = 10
      Top = 29
      Width = 79
      Height = 21
      Color = clGray
      DataField = 'IDTIPOREGRA'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dedGrupo: TwwDBLookupCombo
      Left = 11
      Top = 69
      Width = 463
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = QryGrupoRegra
      LookupField = 'IDGRUPOREGRA'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dedGrupoChange
      OnExit = dedGrupoChange
    end
  end
  inherited Dock972: TDock97
    Width = 484
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 312
      DockPos = 312
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 144
      DockPos = 144
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '   IDTIPOREGRA, DESCREGRA, SQLREGRA, IDGRUPOREGRA'
      'FROM'
      '  TIPOREGRA'
      'WHERE'
      '  IDTIPOREGRA=:ID')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOREGRA'
      'set'
      '  IDTIPOREGRA = :IDTIPOREGRA,'
      '  DESCREGRA = :DESCREGRA,'
      '  SQLREGRA = :SQLREGRA,'
      '  IDGRUPOREGRA = :IDGRUPOREGRA'
      'where'
      '  IDTIPOREGRA = :OLD_IDTIPOREGRA')
    InsertSQL.Strings = (
      'insert into TIPOREGRA'
      '  (IDTIPOREGRA, DESCREGRA, SQLREGRA, IDGRUPOREGRA)'
      'values'
      '  (:IDTIPOREGRA, :DESCREGRA, :SQLREGRA, :IDGRUPOREGRA)')
    DeleteSQL.Strings = (
      'delete from TIPOREGRA'
      'where'
      '  IDTIPOREGRA = :OLD_IDTIPOREGRA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOREGRA.IDTIPOREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOREGRA')
    CamposChave.Strings = (
      'TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryGrupoRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOREGRA, DESCRICAO'
      'FROM'
      '    GRUPOREGRA'
      'ORDER BY'
      '      DESCRICAO')
    ValidateWithMask = True
    Left = 416
    Top = 111
  end
end
