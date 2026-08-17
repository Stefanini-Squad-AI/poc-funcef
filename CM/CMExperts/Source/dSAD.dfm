object dmSAD: TdmSAD
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 246
  Top = 200
  Height = 479
  Width = 741
  object dbSAD: TDatabase
    DatabaseName = 'BaseSAD'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=PREVSEGUR'
      'USER NAME=CMDBA'
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
      'OBJECT MODE=FALSE'
      'PASSWORD=sadanyou')
    SessionName = 'Default'
    Left = 32
    Top = 19
  end
  object qryGerador: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 64
  end
  object qry: TwwQuery
    DatabaseName = 'BaseSAD'
    ValidateWithMask = True
    Left = 32
    Top = 110
  end
  object dbINT: TDatabase
    DatabaseName = 'BaseInt'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=PREVINT'
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
      'OBJECT MODE=FALSE'
      'PASSWORD=CMPREV')
    SessionName = 'Default'
    Left = 88
    Top = 19
  end
end
