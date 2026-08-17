inherited frmCadTipProc: TfrmCadTipProc
  Left = 169
  Top = 211
  Width = 589
  Caption = 'Tipos de Processo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    inherited pnlControles: TPanel
      Width = 571
      object Label1: TLabel
        Left = 58
        Top = 52
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 58
        Top = 103
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 58
        Top = 67
        Width = 49
        Height = 21
        DataField = 'IDTIPOPROC'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 61
        Top = 118
        Width = 452
        Height = 21
        DataField = 'NOMETIPOPROC'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 571
      Selected.Strings = (
        'IDTIPOPROC'#9'6'#9'Código'
        'NOMETIPOPROC'#9'60'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 581
  end
  inherited Dock971: TDock97
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 358
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblTipProc
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 267
  end
  object tblTipProc: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDTIPOPROC'
    TableName = 'CM.TIPOPROCESSO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 369
    Top = 74
  end
end
