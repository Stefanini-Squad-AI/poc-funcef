inherited frmCadTipSent: TfrmCadTipSent
  Left = 225
  Top = 202
  Width = 428
  Caption = 'Tipos de Sentença em Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    inherited pnlControles: TPanel
      Width = 410
      object Label1: TLabel
        Left = 55
        Top = 30
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 55
        Top = 93
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 55
        Top = 45
        Width = 64
        Height = 21
        DataField = 'CODTIPOSENT'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 55
        Top = 108
        Width = 300
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 410
      Selected.Strings = (
        'CODTIPOSENT'#9'6'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 420
  end
  inherited Dock971: TDock97
    Width = 420
    inherited dbnav: TDBNavigator [0]
      Hints.Strings = ()
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 185
    end
    inherited tb97Fundo: TToolbar97 [2]
      Left = 15
      DockPos = 15
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblTipSent
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblTipSent: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOSENT'
    TableName = 'CM.TIPOSENTENCA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 117
    Top = 83
  end
end
