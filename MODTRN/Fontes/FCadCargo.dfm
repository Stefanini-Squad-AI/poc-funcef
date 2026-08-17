inherited frmCadCargo: TfrmCadCargo
  Left = 120
  Top = 185
  Caption = 'Tabela de Cargos'
  ClientHeight = 340
  ClientWidth = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 598
    Height = 254
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 95
      Height = 13
      Caption = 'Código do Cargo'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 9
      Top = 41
      Width = 90
      Height = 13
      Caption = 'Título do Cargo'
      FocusControl = dbedTitulo
    end
    object Label4: TLabel
      Left = 484
      Top = 41
      Width = 26
      Height = 13
      Caption = 'CBO'
    end
    object Label3: TLabel
      Left = 9
      Top = 105
      Width = 113
      Height = 13
      Caption = 'Descrição do Cargo'
      FocusControl = DBMemo1
    end
    object Label5: TLabel
      Left = 9
      Top = 72
      Width = 127
      Height = 13
      Caption = 'Grupo de Treinamento'
      FocusControl = DBMemo1
    end
    object dbedCodigo: TDBEdit
      Left = 144
      Top = 12
      Width = 84
      Height = 21
      DataField = 'IDCARGO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedTitulo: TDBEdit
      Left = 144
      Top = 39
      Width = 292
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedCBO: TDBEdit
      Left = 522
      Top = 39
      Width = 58
      Height = 21
      DataField = 'CBO'
      DataSource = ds
      MaxLength = 5
      TabOrder = 2
    end
    object DBMemo1: TDBMemo
      Left = 12
      Top = 120
      Width = 575
      Height = 115
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 144
      Top = 69
      Width = 292
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRPTREIN'#9'40'#9'DESCGRPTREIN')
      DataField = 'CODGRPTREIN'
      DataSource = ds
      LookupTable = qryGrupoTr
      LookupField = 'CODGRPTREIN'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      OrderByDisplay = False
      AllowClearKey = True
    end
  end
  inherited Dock972: TDock97
    Width = 598
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 598
    inherited dbnav: TDBNavigator [0]
      Hints.Strings = ()
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 252
      DockPos = 252
    end
    inherited TB97oKCancelar: TToolbar97 [2]
      Left = 48
      DockPos = 48
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblCargo
    Left = 282
    Top = 59
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 330
    Top = 3
  end
  object qryGrupoTr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODGRPTREIN, DESCGRPTREIN from GRPTREIN '
      'order by DESCGRPTREIN')
    ValidateWithMask = True
    Left = 384
    Top = 8
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cargos'
    Colunas.Strings = (
      'CARGO.TITULO'
      'CARGO.IDCARGO'
      'CBO.IDCBO')
    TipodeDado.Strings = (
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Título'
      'Código'
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
      '60'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 261
    Top = 9
  end
end
