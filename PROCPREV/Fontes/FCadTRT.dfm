inherited frmCadTRT: TfrmCadTRT
  Left = 207
  Top = 199
  Width = 506
  Caption = 'Tabela de TRTs'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    inherited pnlControles: TPanel
      Width = 488
      object Label1: TLabel
        Left = 69
        Top = 15
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 69
        Top = 66
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 69
        Top = 129
        Width = 41
        Height = 13
        Caption = 'Região'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 30
        Width = 64
        Height = 21
        DataField = 'CODIGOTRT'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 69
        Top = 81
        Width = 350
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 69
        Top = 144
        Width = 61
        Height = 21
        DataField = 'REGIAOTRT'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 488
      Selected.Strings = (
        'CODIGOTRT'#9'5'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição'
        'REGIAOTRT'#9'10'#9'Região')
    end
  end
  inherited Dock972: TDock97
    Width = 498
  end
  inherited Dock971: TDock97
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 161
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblTRT
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblTRT: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODIGOTRT'
    TableName = 'CM.TRT'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 117
    Top = 83
  end
end
