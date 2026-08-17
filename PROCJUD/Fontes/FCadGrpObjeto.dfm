inherited frmCadGrpObjeto: TfrmCadGrpObjeto
  Left = 259
  Top = 190
  Width = 468
  Caption = 'Grupos de Objeto Reclamado em Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    inherited pnlControles: TPanel
      Width = 450
      object Label1: TLabel
        Left = 43
        Top = 55
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 43
        Top = 103
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 43
        Top = 67
        Width = 49
        Height = 21
        DataField = 'IDGRUPOOBJETO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 43
        Top = 118
        Width = 365
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 450
      Selected.Strings = (
        'IDGRUPOOBJETO'#9'10'#9'Código'
        'DESCRICAO'#9'41'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 460
  end
  inherited Dock971: TDock97
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 290
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblGrpObjeto
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblGrpObjeto: TwwTable
    AfterInsert = tblGrpObjetoAfterInsert
    DatabaseName = 'BaseDados'
    Filter = 'CLASSEOBJ = '#39'1'#39
    Filtered = True
    IndexFieldNames = 'IDGRUPOOBJETO'
    TableName = 'CM.GRPOBJPROCJUR'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 117
    Top = 83
  end
end
