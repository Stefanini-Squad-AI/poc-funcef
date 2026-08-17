inherited frmCadRequer: TfrmCadRequer
  Left = 316
  Top = 153
  Width = 450
  Height = 356
  Caption = 'Cursos Requeridos por Cargo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 290
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 272
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 105
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited Dock972: TDock97
    Width = 442
  end
  inherited pnlFundo: TPanel [2]
    Width = 442
    Height = 243
    inherited pnlControles: TPanel
      Top = 74
      Width = 432
      Height = 164
      object Label1: TLabel
        Left = 60
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Curso'
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 60
        Top = 39
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        DataField = 'IDCURSO'
        DataSource = ds
        LookupTable = qryCurso
        LookupField = 'IDCURSO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 60
        Top = 84
        Width = 290
        Height = 35
        Caption = 'Imprescindível ?'
        Columns = 2
        DataField = 'FLGIMPRESCIND'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 74
      Width = 432
      Height = 164
      Selected.Strings = (
        'IDCURSO'#9'6'#9'Código'
        'DESCRICAO'#9'30'#9'Nome do Curso'
        'FLGIMPRESCIND'#9'12'#9'Imprescindível ?')
      TabOrder = 2
      UseTFields = False
    end
    object gbxGrupoFunc: TGroupBox
      Left = 5
      Top = 5
      Width = 432
      Height = 69
      Align = alTop
      Caption = 'Cargo'
      TabOrder = 1
      object dbedCodCargo: TDBEdit
        Left = 28
        Top = 27
        Width = 58
        Height = 21
        DataField = 'IDCARGO'
        DataSource = ds2
        TabOrder = 0
      end
      object dbedDescricao: TDBEdit
        Left = 100
        Top = 27
        Width = 304
        Height = 21
        DataField = 'TITULO'
        DataSource = ds2
        TabOrder = 1
      end
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblCurca
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 336
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 351
    Top = 15
  end
  object tblCurca: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds2
    TableName = 'CM.CURSOREQ'
    ControlType.Strings = (
      'FLGIMPRESCIND;CheckBox;1;0')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 132
    Top = 138
    object tblCurcaIDCARGO: TFloatField
      FieldName = 'IDCARGO'
      Required = True
    end
    object tblCurcaIDCURSO: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'IDCURSO'
      Required = True
    end
    object tblCurcaDESCRICAO: TStringField
      DisplayLabel = 'Nome do Curso'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = tblCurso2
      LookupKeyFields = 'IDCURSO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDCURSO'
      Size = 30
      Lookup = True
    end
    object tblCurcaFLGIMPRESCIND: TFloatField
      DisplayLabel = 'Imprescindível ?'
      FieldName = 'FLGIMPRESCIND'
      Required = True
    end
  end
  object tblCargo: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 255
    Top = 138
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = tblCargo
    Left = 306
    Top = 138
  end
  object tblCurso2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCURSO'
    TableName = 'CM.CURSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 21
    Top = 123
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from CURSO '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 196
    Top = 136
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
