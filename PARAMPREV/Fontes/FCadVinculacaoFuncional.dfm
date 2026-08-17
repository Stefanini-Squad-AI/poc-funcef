inherited frmCadVinculacaoFuncional: TfrmCadVinculacaoFuncional
  Left = 335
  Top = 139
  HelpContext = 160168
  Caption = 'Vinculação Funcional '
  ClientHeight = 279
  ClientWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 430
    Height = 193
    object lblCodigo: TLabel
      Left = 48
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object lblDescMant: TLabel
      Left = 48
      Top = 103
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedtCodigo: TwwDBEdit
      Left = 48
      Top = 64
      Width = 106
      Height = 21
      DataField = 'CODVINCULAFUNC'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedtDescricao: TwwDBEdit
      Left = 48
      Top = 119
      Width = 339
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 430
  end
  inherited Dock971: TDock97
    Top = 240
    Width = 430
    inherited tb97Fundo: TToolbar97
      Left = 258
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 89
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update VINCULAFUNC'
      'set'
      '  CODVINCULAFUNC = :CODVINCULAFUNC,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODVINCULAFUNC = :OLD_CODVINCULAFUNC')
    InsertSQL.Strings = (
      'insert into VINCULAFUNC'
      '  (CODVINCULAFUNC, DESCRICAO)'
      'values'
      '  (:CODVINCULAFUNC, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from VINCULAFUNC'
      'where'
      '  CODVINCULAFUNC = :OLD_CODVINCULAFUNC')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'VINCULAFUNC.CODVINCULAFUNC'
      'VINCULAFUNC.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'VINCULAFUNC')
    CamposChave.Strings = (
      'VINCULAFUNC.CODVINCULAFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '5'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT CODVINCULAFUNC ,'
      '       DESCRICAO'
      'FROM   VINCULAFUNC'
      'ORDER BY DESCRICAO'
      ' '
      ' ')
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 47
  end
end
