object DmDemoBO: TDmDemoBO
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 196
  Top = 121
  Height = 375
  Width = 544
  object DbAppServer: TDatabase
    DatabaseName = 'DbnDemoBO'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=LOC'
      'USER NAME=CM'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=cmsol')
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
  object DspCliente: TDataSetProvider
    Constraints = True
    Left = 32
    Top = 72
  end
  object DspTipoCliente: TDataSetProvider
    Constraints = True
    Left = 32
    Top = 120
  end
  object DsClienteXTipo: TDataSetProvider
    Constraints = True
    Left = 32
    Top = 176
  end
  object DspAllClienteXTipo: TDataSetProvider
    Constraints = True
    Left = 32
    Top = 232
  end
end
