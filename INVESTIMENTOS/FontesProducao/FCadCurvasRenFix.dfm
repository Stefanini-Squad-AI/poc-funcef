inherited frmCadCurvasRenFix: TfrmCadCurvasRenFix
  Left = 151
  Top = 182
  ClientHeight = 201
  ClientWidth = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 450
    Height = 115
    inherited Bevel2: TBevel
      Width = 448
    end
    object Label1: TLabel [1]
      Left = 21
      Top = 58
      Width = 84
      Height = 13
      Caption = 'Nome do Perfil'
    end
    object dbeDescCurvasRenFix: TwwDBEdit [2]
      Left = 20
      Top = 74
      Width = 409
      Height = 21
      DataField = 'DESCCURVARENFIX'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    inherited pnlTitulo: TPanel
      Width = 448
      TabOrder = 1
      inherited lbNomItem: TfcLabel
        Width = 212
        Caption = 'Perfis de Atualização'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 450
  end
  inherited Dock971: TDock97
    Top = 162
    Width = 450
    inherited tb97Fundo: TToolbar97
      Left = 278
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 109
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CURVASRENFIX'
      'set'
      '  DESCCURVARENFIX = :DESCCURVARENFIX'
      'where'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX')
    InsertSQL.Strings = (
      'insert into CURVASRENFIX'
      '  (IDCURVARENFIX, DESCCURVARENFIX)'
      'values'
      '  (:IDCURVARENFIX, :DESCCURVARENFIX)')
    DeleteSQL.Strings = (
      'delete from CURVASRENFIX'
      'where'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CURVASRENFIX.DESCCURVARENFIX')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Perfil')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CURVASRENFIX')
    CamposChave.Strings = (
      'CURVASRENFIX.IDCURVARENFIX')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDCURVARENFIX, DESCCURVARENFIX'
      'FROM CURVASRENFIX'
      'WHERE IDCURVARENFIX = :IDCURVARENFIX')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end>
    object qryIDCURVARENFIX: TFloatField
      FieldName = 'IDCURVARENFIX'
      Origin = 'BASEDADOS.CURVASRENFIX.IDCURVARENFIX'
    end
    object qryDESCCURVARENFIX: TStringField
      FieldName = 'DESCCURVARENFIX'
      Origin = 'BASEDADOS.CURVASRENFIX.DESCCURVARENFIX'
      Size = 60
    end
  end
  object qryDeletaItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CURVASXITEMRENFIX'
      'WHERE (IDCURVARENFIX = :IDCURVARENFIX)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end>
    object qryDeletaItensIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.IDITEMRENFIX'
    end
    object qryDeletaItensDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
  end
end
