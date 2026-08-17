inherited frmCadTipRec: TfrmCadTipRec
  Left = 253
  Top = 212
  Width = 428
  Caption = 'Tipos de Etapa (Andamento) em Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    inherited pnlControles: TPanel
      Width = 410
      object Label1: TLabel
        Left = 44
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 44
        Top = 75
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 44
        Top = 129
        Width = 100
        Height = 13
        Caption = 'Honorário Padrão'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 44
        Top = 42
        Width = 64
        Height = 21
        DataField = 'CODTIPORECURSO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 44
        Top = 90
        Width = 322
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 44
        Top = 144
        Width = 100
        Height = 21
        DataField = 'VALORHONOR'
        DataSource = ds
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 410
      Selected.Strings = (
        'CODTIPORECURSO'#9'6'#9'Código'
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
    DataSet = tblTipRec
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblTipRec: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPORECURSO'
    TableName = 'CM.TIPORECTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 133
    Top = 139
  end
end
