inherited frmTipoServAss: TfrmTipoServAss
  Left = 256
  Top = 308
  Width = 485
  Height = 253
  Caption = 'Tipo de Serviço Assistencial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 477
    Height = 140
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    inherited pnlControles: TPanel
      Width = 467
      Height = 130
      object Label1: TLabel
        Left = 22
        Top = 28
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 334
        Top = 28
        Width = 33
        Height = 13
        Caption = 'Código'
      end
      object DBEdit2: TDBEdit
        Left = 22
        Top = 46
        Width = 295
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 334
        Top = 46
        Width = 99
        Height = 21
        DataField = 'IDSERVASS'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 467
      Height = 130
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'
        'IDSERVASS'#9'10'#9'Código')
      TitleFont.Height = -11
      TitleFont.Style = []
    end
  end
  inherited Dock972: TDock97
    Width = 477
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 477
    inherited tb97Fundo: TToolbar97
      Left = 307
      DockPos = 307
    end
    inherited dbnav: TDBNavigator [1]
      Top = 300
      Hints.Strings = ()
    end
    inherited TB97oKCancelar: TToolbar97 [2]
      Left = 139
      DockPos = 139
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 374
    Top = 56
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 25
    Top = 112
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    SearchControls = True
    Caption = 'Procura de Serviços Assistenciais'
    FieldNames.Strings = (
      'NOME')
    DisplayLabels.Strings = (
      'Nome do Seviço')
    AlwaysShow = True
    Left = 22
    Top = 161
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 58
  end
  object qry: TwwQuery
    AfterInsert = qryAfterInsert
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT   IDSERVASS,NOME'
      'FROM     TPSERVASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 377
    Top = 106
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 145
    Top = 128
  end
end
