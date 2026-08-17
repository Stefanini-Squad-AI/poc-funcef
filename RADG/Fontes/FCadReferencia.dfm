inherited FrmCadReferencia: TFrmCadReferencia
  Left = 168
  Top = 155
  Caption = 'Cadastro de Referências'
  ClientHeight = 235
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 149
    inherited pnlControles: TPanel
      Width = 425
      Height = 139
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edDesc
      end
      object edDesc: TDBEdit
        Left = 8
        Top = 56
        Width = 409
        Height = 21
        DataField = 'DESCREFERENCIA'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 425
      Height = 139
      Selected.Strings = (
        'DESCREFERENCIA'#9'50'#9'Descrição')
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 435
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 196
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 265
      DockPos = 265
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 97
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '          IDREFERENCIA,'
      '          DESCREFERENCIA'
      'FROM'
      '    RADREFERENCIA'
      'ORDER BY 2')
    object qryDESCREFERENCIA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCREFERENCIA'
      Origin = 'RADREFERENCIA.DESCREFERENCIA'
      Size = 50
    end
    object qryIDREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREFERENCIA'
      Origin = 'RADREFERENCIA.IDREFERENCIA'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADREFERENCIA'
      'set'
      '  IDREFERENCIA = :IDREFERENCIA,'
      '  DESCREFERENCIA = :DESCREFERENCIA'
      'where'
      '  IDREFERENCIA = :OLD_IDREFERENCIA')
    InsertSQL.Strings = (
      'insert into RADREFERENCIA'
      '  (IDREFERENCIA, DESCREFERENCIA)'
      'values'
      '  (:IDREFERENCIA, :DESCREFERENCIA)')
    DeleteSQL.Strings = (
      'delete from RADREFERENCIA'
      'where'
      '  IDREFERENCIA = :OLD_IDREFERENCIA')
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
end
