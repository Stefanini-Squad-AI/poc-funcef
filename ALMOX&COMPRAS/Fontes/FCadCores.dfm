inherited FrmCadCores: TFrmCadCores
  Left = 161
  Top = 169
  Caption = 'Cadastro de Cores'
  ClientWidth = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 487
    inherited pnlControles: TPanel
      Width = 477
      object Label1: TLabel
        Left = 36
        Top = 51
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodCor
      end
      object Label2: TLabel
        Left = 21
        Top = 99
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescCor
      end
      object dbedCodCor: TDBEdit
        Left = 81
        Top = 48
        Width = 64
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODCOR'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescCor: TDBEdit
        Left = 81
        Top = 96
        Width = 202
        Height = 21
        DataField = 'DESCCOR'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 477
    end
  end
  inherited Dock972: TDock97
    Width = 487
  end
  inherited Dock971: TDock97
    Width = 487
    inherited tb97Fundo: TToolbar97
      Left = 317
      DockPos = 317
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 149
      DockPos = 149
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '      CODCOR,'
      '      DESCCOR'
      'FROM'
      '      COR')
    object qryCODCOR: TStringField
      FieldName = 'CODCOR'
      Origin = 'COR.CODCOR'
      Size = 5
    end
    object qryDESCCOR: TStringField
      FieldName = 'DESCCOR'
      Origin = 'COR.DESCCOR'
      Size = 25
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update COR'
      'set'
      '  CODCOR = :CODCOR,'
      '  DESCCOR = :DESCCOR'
      'where'
      '  rtrim(CODCOR) = rtrim(:OLD_CODCOR)'
      '')
    InsertSQL.Strings = (
      'insert into COR'
      '  (CODCOR, DESCCOR)'
      'values'
      '  (:CODCOR, :DESCCOR)')
    DeleteSQL.Strings = (
      'delete from COR'
      'where'
      ' rtrim(CODCOR) = rtrim(:OLD_CODCOR)')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COR.CODCOR'
      'COR.DESCCOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'COR')
    CamposChave.Strings = (
      'COR.CODCOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '5'
      '25')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
