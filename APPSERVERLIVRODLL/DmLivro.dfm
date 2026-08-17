object Livro: TLivro
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 361
  Top = 170
  Height = 375
  Width = 544
  object sLivro: TSession
    Left = 88
    Top = 8
  end
  object DbLivro: TDatabase
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=cm'
      'USER NAME=cm'
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
    Left = 24
    Top = 8
  end
end
