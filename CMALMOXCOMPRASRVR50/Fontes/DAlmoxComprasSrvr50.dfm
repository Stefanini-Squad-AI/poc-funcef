object DtmAlmoxComprasSrvr50: TDtmAlmoxComprasSrvr50
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 42
  Top = 135
  Height = 375
  Width = 544
  object DbAlmoxCompras: TDatabase
    DatabaseName = 'DbAlmoxCompras'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=ORA_SERVER'
      'USER NAME=MYNAME'
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
      'BLOBS TO CACHE=128'
      'BLOB SIZE=1000'
      'OBJECT MODE=TRUE'
      'PASSWORD=')
    SessionName = 'SsnCompras'
    Left = 40
    Top = 8
  end
  object SsnAlmoxCompras: TSession
    SessionName = 'SsnAlmoxCompras'
    Left = 40
    Top = 64
  end
end
