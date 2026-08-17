inherited frmCadCargo: TfrmCadCargo
  Left = 87
  Top = 167
  Caption = 'Tabela de Cargos'
  ClientHeight = 352
  ClientWidth = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 266
    BorderWidth = 2
    object Label1: TLabel
      Left = 14
      Top = 18
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Código do Cargo'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 14
      Top = 45
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Título do Cargo'
      FocusControl = dbedTitulo
    end
    object Label4: TLabel
      Left = 14
      Top = 72
      Width = 26
      Height = 13
      Caption = 'CBO'
    end
    object Label6: TLabel
      Left = 14
      Top = 99
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Grupo Funcional'
      FocusControl = dbmemDescr
    end
    object Label3: TLabel
      Left = 14
      Top = 126
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbmemDescr
    end
    object dbedCodigo: TDBEdit
      Left = 122
      Top = 15
      Width = 84
      Height = 21
      DataField = 'IDCARGO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedTitulo: TDBEdit
      Left = 122
      Top = 42
      Width = 467
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedCBO: TDBEdit
      Left = 47
      Top = 69
      Width = 67
      Height = 21
      DataField = 'CBO'
      DataSource = ds
      MaxLength = 5
      TabOrder = 2
    end
    object dblcCBO: TwwDBLookupCombo
      Left = 122
      Top = 69
      Width = 467
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'80'#9'DESCRICAO')
      DataField = 'CBO'
      DataSource = ds
      LookupTable = qryCBO
      LookupField = 'IDCBO'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcCBOChange
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 122
      Top = 96
      Width = 467
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRPFUNC'#9'40'#9'DESCGRPFUNC')
      DataField = 'CODGRPFUNC'
      DataSource = ds
      LookupTable = qryGrupoFunc
      LookupField = 'CODGRPFUNC'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      OrderByDisplay = False
      AllowClearKey = True
    end
    object dbmemDescr: TDBMemo
      Left = 14
      Top = 141
      Width = 575
      Height = 112
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 5
    end
  end
  inherited Dock972: TDock97
    Width = 603
  end
  inherited Dock971: TDock97
    Top = 313
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 433
      DockPos = 439
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 266
      DockPos = 272
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  C.IDCARGO, C.TITULO, C.CBO, UPPER(CBO.DESCRICAO) AS NOMECBO,'
      '  C.CODGRPFUNC, C.DESCRICAO'
      'FROM'
      '  CARGO C, CBO'
      'WHERE'
      '  (C.CBO = CBO.IDCBO(+))'
      'ORDER BY'
      '  C.TITULO')
    Left = 271
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 483
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGO'
      'set'
      '  IDCARGO = :IDCARGO,'
      '  TITULO = :TITULO,'
      '  CBO = :CBO,'
      '  CODGRPFUNC = :CODGRPFUNC,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    InsertSQL.Strings = (
      'insert into CARGO'
      '  (IDCARGO, TITULO, CBO, CODGRPFUNC, DESCRICAO)'
      'values'
      '  (:IDCARGO, :TITULO, :CBO, :CODGRPFUNC, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from CARGO'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    Left = 243
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargos'
    Colunas.Strings = (
      'CARGO.IDCARGO'
      'CARGO.TITULO'
      'CBO.IDCBO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Título'
      'Cód. CBO')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CBO'
      'CARGO')
    CamposChave.Strings = (
      'CARGO.IDCARGO')
    Filtro.Strings = (
      'CARGO.CBO = CBO.IDCBO(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10')
    ExibePergunta = False
    Left = 341
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 299
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 541
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 414
    Top = 1
  end
  object qryCBO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCBO, DESCRICAO'
      'FROM'
      '  CBO'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 245
    Top = 216
  end
  object qryGrupoFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select DESCGRPFUNC, CODGRPFUNC from GRUPFUNC '
      'order by DESCGRPFUNC')
    ValidateWithMask = True
    Left = 299
    Top = 216
  end
end
