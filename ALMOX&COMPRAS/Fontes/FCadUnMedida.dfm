inherited frmCadUnMedida: TfrmCadUnMedida
  Left = 147
  Top = 150
  Caption = 'Cadastro de Unidade de Medida'
  ClientWidth = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 495
    inherited pnlControles: TPanel
      Width = 485
      object Label2: TLabel
        Left = 36
        Top = 98
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 51
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedDescMed: TDBEdit
        Left = 102
        Top = 93
        Width = 190
        Height = 21
        DataField = 'DESCMEDIDA'
        DataSource = ds
        TabOrder = 1
      end
      object dbedCodMed: TDBEdit
        Left = 102
        Top = 51
        Width = 67
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODMEDIDA'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 485
      Selected.Strings = (
        'CODMEDIDA'#9'10'#9'Código'
        'DESCMEDIDA'#9'40'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 495
  end
  inherited Dock971: TDock97
    Width = 495
    inherited tb97Fundo: TToolbar97
      Left = 324
      DockPos = 324
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 156
      DockPos = 156
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '      CODMEDIDA,'
      '      DESCMEDIDA'
      'FROM '
      '       UNMEDIDA '
      ''
      'ORDER BY CODMEDIDA')
    object qryCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryDESCMEDIDA: TStringField
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update UNMEDIDA'
      'set'
      '  CODMEDIDA = :CODMEDIDA,'
      '  DESCMEDIDA = :DESCMEDIDA'
      'where'
      '  rtrim(CODMEDIDA) = rtrim(:OLD_CODMEDIDA)')
    InsertSQL.Strings = (
      'insert into UNMEDIDA'
      '  (CODMEDIDA, DESCMEDIDA)'
      'values'
      '  (:CODMEDIDA, :DESCMEDIDA)')
    DeleteSQL.Strings = (
      'delete from UNMEDIDA'
      'where'
      '  rtrim(CODMEDIDA) = rtrim(:OLD_CODMEDIDA)')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNMEDIDA.CODMEDIDA'
      'UNMEDIDA.DESCMEDIDA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'UNMEDIDA')
    CamposChave.Strings = (
      'UNMEDIDA.CODMEDIDA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '4'
      '25')
  end
  inherited ds: TwwDataSource
    AutoEdit = True
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
