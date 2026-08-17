inherited frmCadMotivoBloqueio: TfrmCadMotivoBloqueio
  Left = 250
  Top = 144
  HelpContext = 790119
  Caption = 'Motivo de Bloqueio'
  ClientHeight = 224
  ClientWidth = 414
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 12
    Top = 119
    Width = 62
    Height = 13
    Caption = 'Descrição '
  end
  inherited pnlFundo: TPanel
    Width = 414
    Height = 138
    object LbLDescParamEmissor: TLabel
      Left = 12
      Top = 15
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    object Label2: TLabel
      Left = 12
      Top = 63
      Width = 29
      Height = 13
      Caption = 'Sigla'
    end
    object wwDBEDescricao: TwwDBEdit
      Left = 12
      Top = 29
      Width = 388
      Height = 21
      DataField = 'DESCMOTBLOQ'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBESigla: TwwDBEdit
      Left = 12
      Top = 85
      Width = 85
      Height = 21
      DataField = 'SIGLAMOTBLOQ'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 414
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 414
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 72
      DockPos = 72
    end
  end
  inherited ds: TwwDataSource
    Left = 309
    Top = 16
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVOBLOQUEIO'
      'set'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  DESCMOTBLOQ = :DESCMOTBLOQ,'
      '  SIGLAMOTBLOQ = :SIGLAMOTBLOQ'
      'where'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into MOTIVOBLOQUEIO'
      '  (IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ)'
      'values'
      '  (:IDMOTIVOBLOQUEIO, :DESCMOTBLOQ, :SIGLAMOTBLOQ)')
    DeleteSQL.Strings = (
      'delete from MOTIVOBLOQUEIO'
      'where'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 249
    Top = 16
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      'MOTIVOBLOQUEIO.SIGLAMOTBLOQ')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVOBLOQUEIO')
    CamposChave.Strings = (
      'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO')
    Filtro.Strings = (
      'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO > 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '5')
    Left = 338
    Top = 16
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'#9'IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      ''
      'FROM MOTIVOBLOQUEIO'
      ''
      'WHERE IDMOTIVOBLOQUEIO <> -1'
      ''
      'ORDER BY DESCMOTBLOQ')
    Left = 279
    Top = 16
    object qryIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
    end
    object qryDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qrySIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Size = 3
    end
  end
end
