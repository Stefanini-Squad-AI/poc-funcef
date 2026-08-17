inherited frmAtualizVariaveis: TfrmAtualizVariaveis
  Left = 102
  Top = 120
  Caption = 'Atualização de Variaveis'
  ClientHeight = 320
  ClientWidth = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 626
    Height = 281
    object rchedLista: TRichEdit
      Left = 5
      Top = 5
      Width = 616
      Height = 271
      Align = alClient
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 281
    Width = 626
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object QryCmpBd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '        IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPOD' +
        'OBANCO,'
      '        CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO'
      'FROM'
      '        CMPBD'
      'WHERE'
      '        (CAMPODOBANCO = 0) AND'
      #9'(IDCAMPO = LOWER(IDCAMPO))'
      'ORDER BY'
      '        IDCAMPO')
    UpdateObject = UpdCmpBd
    ValidateWithMask = True
    Left = 160
    Top = 88
    object QryCmpBdIDCAMPO: TStringField
      FieldName = 'IDCAMPO'
      Origin = 'CMPBD.IDCAMPO'
      Size = 12
    end
    object QryCmpBdENTIDADE: TStringField
      FieldName = 'ENTIDADE'
      Origin = 'CMPBD.ENTIDADE'
      Size = 30
    end
    object QryCmpBdNOMEDOCAMPO: TStringField
      FieldName = 'NOMEDOCAMPO'
      Origin = 'CMPBD.NOMEDOCAMPO'
      Size = 30
    end
    object QryCmpBdDESCRICAODOCAMPO: TStringField
      FieldName = 'DESCRICAODOCAMPO'
      Origin = 'CMPBD.DESCRICAODOCAMPO'
      Size = 60
    end
    object QryCmpBdCAMPODOBANCO: TFloatField
      FieldName = 'CAMPODOBANCO'
      Origin = 'CMPBD.CAMPODOBANCO'
    end
    object QryCmpBdCHAVE: TFloatField
      FieldName = 'CHAVE'
      Origin = 'CMPBD.CHAVE'
    end
    object QryCmpBdFLGOBRIGATORIO: TFloatField
      FieldName = 'FLGOBRIGATORIO'
      Origin = 'CMPBD.FLGOBRIGATORIO'
    end
    object QryCmpBdAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'CMPBD.APELIDO'
      Size = 30
    end
    object QryCmpBdIDTIPODADO: TFloatField
      FieldName = 'IDTIPODADO'
      Origin = 'CMPBD.IDTIPODADO'
    end
  end
  object UpdCmpBd: TUpdateSQL
    ModifySQL.Strings = (
      'update CMPBD'
      'set'
      '  IDCAMPO = :IDCAMPO,'
      '  ENTIDADE = :ENTIDADE,'
      '  NOMEDOCAMPO = :NOMEDOCAMPO,'
      '  DESCRICAODOCAMPO = :DESCRICAODOCAMPO,'
      '  CAMPODOBANCO = :CAMPODOBANCO,'
      '  CHAVE = :CHAVE,'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO,'
      '  APELIDO = :APELIDO,'
      '  IDTIPODADO = :IDTIPODADO'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into CMPBD'
      
        '  (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANC' +
        'O, CHAVE, '
      '   FLGOBRIGATORIO, APELIDO, IDTIPODADO)'
      'values'
      
        '  (:IDCAMPO, :ENTIDADE, :NOMEDOCAMPO, :DESCRICAODOCAMPO, :CAMPOD' +
        'OBANCO, '
      '   :CHAVE, :FLGOBRIGATORIO, :APELIDO, :IDTIPODADO)')
    DeleteSQL.Strings = (
      'delete from CMPBD'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
    Left = 64
    Top = 40
  end
  object QryPassos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '        IDREGRA, IDALGORITMODAREG, IDCAMPO, IDCAMPO2, DESCRICAOA' +
        'LGORIT'
      'FROM'
      '        ALGREGRA'
      'WHERE'
      '        IDCAMPO = LOWER(IDCAMPO) OR'
      '        IDCAMPO2 = LOWER(IDCAMPO2)')
    UpdateObject = UpdPassos
    ValidateWithMask = True
    Left = 192
    Top = 88
    object QryPassosIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
    end
    object QryPassosIDCAMPO: TStringField
      FieldName = 'IDCAMPO'
      Origin = 'ALGREGRA.IDCAMPO'
      Size = 12
    end
    object QryPassosIDCAMPO2: TStringField
      FieldName = 'IDCAMPO2'
      Origin = 'ALGREGRA.IDCAMPO2'
      Size = 12
    end
    object QryPassosDESCRICAOALGORIT: TStringField
      FieldName = 'DESCRICAOALGORIT'
      Origin = 'ALGREGRA.DESCRICAOALGORIT'
      Size = 120
    end
    object QryPassosIDALGORITMODAREG: TFloatField
      FieldName = 'IDALGORITMODAREG'
      Origin = 'ALGREGRA.IDALGORITMODAREG'
    end
  end
  object UpdPassos: TUpdateSQL
    ModifySQL.Strings = (
      'update ALGREGRA'
      'set'
      '  IDCAMPO = :IDCAMPO,'
      '  IDCAMPO2 = :IDCAMPO2,'
      '  DESCRICAOALGORIT = :DESCRICAOALGORIT'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    InsertSQL.Strings = (
      'insert into ALGREGRA'
      '  (IDCAMPO, IDCAMPO2, DESCRICAOALGORIT)'
      'values'
      '  (:IDCAMPO, :IDCAMPO2, :DESCRICAOALGORIT)')
    DeleteSQL.Strings = (
      'delete from ALGREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    Left = 192
    Top = 40
  end
  object QryInsert: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 88
  end
end
