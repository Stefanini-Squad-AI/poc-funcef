inherited frmCadOutroDado: TfrmCadOutroDado
  Left = 139
  Top = 179
  Caption = 'Cadastro de Tipos de Dados Complementares'
  ClientHeight = 244
  ClientWidth = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 398
    Height = 176
    inherited pnlControles: TPanel
      Width = 394
      Height = 172
      object Label1: TLabel
        Left = 16
        Top = 58
        Width = 161
        Height = 13
        Caption = 'Tipo de Dado Complementar'
      end
      object dbedDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 361
        Height = 21
        DataField = 'ODODESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 394
      Height = 172
      Selected.Strings = (
        'ODODESCRICAO'#9'45'#9'Tipo de Dado Complementar')
    end
  end
  inherited Dock972: TDock97
    Width = 398
    inherited Toolbar971: TToolbar97
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 211
    Width = 398
    inherited tb97Fundo: TToolbar97
      Left = 226
      DockPos = 244
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 54
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   O.IDOUTRODADO, O.ODODESCRICAO'
      'FROM'
      '   OUTRODADO O'
      'ORDER BY'
      '   O.ODODESCRICAO')
    Left = 128
    Top = 56
    object qryIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADO.IDOUTRODADO'
      Visible = False
    end
    object qryODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 45
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OUTRODADO'
      'set'
      '  IDOUTRODADO = :IDOUTRODADO,'
      '  ODODESCRICAO = :ODODESCRICAO'
      'where'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    InsertSQL.Strings = (
      'insert into OUTRODADO'
      '  (IDOUTRODADO, ODODESCRICAO)'
      'values'
      '  (:IDOUTRODADO, :ODODESCRICAO)')
    DeleteSQL.Strings = (
      'delete from OUTRODADO'
      'where'
      '  IDOUTRODADO = :OLD_IDOUTRODADO')
    Left = 96
    Top = 56
  end
  inherited MontaSelect: TMontaSelect
    Left = 336
    Top = 56
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 160
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 310
    Top = 106
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  O.IDOUTRODADO, O.ODODESCRICAO'
      'FROM'
      '  OUTRODADO O'
      'WHERE'
      '  ( LOWER(ODODESCRICAO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 240
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
    object qryVerificaOcorrenciaIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADO.IDOUTRODADO'
    end
    object qryVerificaOcorrenciaODODESCRICAO: TStringField
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
  end
end
