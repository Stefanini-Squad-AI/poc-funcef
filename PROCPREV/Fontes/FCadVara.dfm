inherited frmCadVara: TfrmCadVara
  Left = 219
  Top = 169
  Width = 507
  Caption = 'Tabela das Varas de Justiça'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 499
    inherited dbGrd: TwwDBGrid [0]
      Width = 489
      Selected.Strings = (
        'IDVARAJUSTICA'#9'10'#9'Código'
        'DESCRICAO'#9'46'#9'Nome')
    end
    inherited pnlControles: TPanel [1]
      Width = 489
      object Label1: TLabel
        Left = 69
        Top = 52
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 69
        Top = 103
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 67
        Width = 64
        Height = 21
        DataField = 'IDVARAJUSTICA'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 69
        Top = 118
        Width = 350
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 499
  end
  inherited Dock971: TDock97
    Width = 499
    inherited tb97Fundo: TToolbar97
      Left = 329
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 162
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblVara
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblVara: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDVARAJUSTICA'
    TableName = 'CM.VARAJUSTICA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 117
    Top = 83
  end
end
