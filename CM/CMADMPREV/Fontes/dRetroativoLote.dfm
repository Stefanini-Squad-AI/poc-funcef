object dmRetroativoLote: TdmRetroativoLote
  OldCreateOrder = True
  Left = 280
  Top = 96
  Height = 391
  Width = 377
  object dsTxt: TwwDataSource
    DataSet = tbParadox
    Left = 12
    Top = 8
  end
  object tbParadox: TwwTable
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 172
    Top = 8
  end
  object bmPatro: TBatchMove
    Destination = tbParadox
    Mode = batCopy
    Source = tbTxt
    Left = 119
    Top = 7
  end
  object tbTxt: TwwTable
    TableType = ttASCII
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 64
    Top = 7
  end
  object qryAnalise: TwwQuery
    ValidateWithMask = True
    Left = 172
    Top = 56
  end
  object qryElegivel: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'select idpessoa, idpessjur from elegpatro where (matricula = :id' +
        'matricula)')
    ValidateWithMask = True
    Left = 252
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'idmatricula'
        ParamType = ptUnknown
      end>
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT R.CODPROVDESC,'
      '       P.IDPROVENTO,'
      '       P.FLGDESCONTO,'
      '       P.FLGSALPARTRETRO,'
      '       P.FLGSALBENEFRETRO'
      'FROM PROVDESC P, RUBRICAXPESS R'
      'WHERE (R.CODPROVDESC = :CODPROVDESC)'
      'AND (R.IDPESSOA = :IDPESSJUR)'
      'AND (R.IDRUBRICA = P.IDPROVENTO)')
    ValidateWithMask = True
    Left = 172
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryParticipa: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.IDPESSJUR, P.IDPLANOPREV, L.IDRUBSALPARTICI' +
        'P, L.IDRUBSALBENEFICIO'
      'FROM PARTPREVPLAN P, PATRO L'
      'WHERE (P.IDPESSOA = :IDPESSOA)'
      'AND (P.IDPESSJUR = :IDPESSJUR)'
      'AND (L.IDPESSOA = P.IDPESSJUR)')
    ValidateWithMask = True
    Left = 312
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object tbRubrica: TwwTable
    TableName = 'rubrica_filtro'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 12
    Top = 86
    object tbRubricaCodprov: TStringField
      FieldName = 'Codprov'
      Size = 7
    end
    object tbRubricaIdrubrica: TFloatField
      FieldName = 'Idrubrica'
    end
    object tbRubricaFlgdesconto: TSmallintField
      FieldName = 'Flgdesconto'
    end
    object tbRubricaFlgsalpart: TSmallintField
      FieldName = 'Flgsalpart'
    end
    object tbRubricaFlgsalbenef: TSmallintField
      FieldName = 'Flgsalbenef'
    end
  end
  object tbPessoa: TwwTable
    TableName = 'pessoa_filtro'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 61
    Top = 89
    object tbPessoaMatricula: TStringField
      FieldName = 'Matricula'
      Size = 13
    end
    object tbPessoaIdpessjur: TFloatField
      FieldName = 'Idpessjur'
    end
    object tbPessoaIdpessoa: TFloatField
      FieldName = 'Idpessoa'
    end
    object tbPessoaIdplanoprev: TFloatField
      FieldName = 'Idplanoprev'
    end
    object tbPessoaIdsalpart: TFloatField
      FieldName = 'Idsalpart'
    end
    object tbPessoaIdsalbenef: TFloatField
      FieldName = 'Idsalbenef'
    end
  end
  object qrySalarioLote: TwwQuery
    DatabaseName = 'c:\paulo'
    SQL.Strings = (
      'SELECT P.IDPESSJUR,'
      '       P.IDPESSOA,'
      '       P.IDPLANOPREV,'
      '       S.MES,'
      '       S.VALOR,'
      '       P.IDSALPART,'
      '       P.IDSALBENEF,'
      '       R.FLGDESCONTO,'
      '       R.FLGSALPART,'
      '       R.FLGSALBENEF'
      'FROM RUBRICAS S,'
      '     PESSOA_FILTRO P,'
      '     RUBRICA_FILTRO R'
      'WHERE (P.MATRICULA = S.MATRICULA)'
      'AND   (S.RUBRICA = R.CODPROV)'
      'AND   ((R.FLGSALPART = 1) OR (R.FLGSALBENEF = 1))'
      'ORDER BY P.IDPESSJUR, P.IDPESSOA, S.MES')
    ValidateWithMask = True
    Left = 168
    Top = 212
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM CONTPREV WHERE IDPLANOPREV = 12')
    ValidateWithMask = True
    Left = 300
    Top = 164
  end
  object qryRetroativo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 16
    Top = 150
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 300
    Top = 212
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 300
    Top = 260
  end
  object qryPessoaLote: TwwQuery
    DatabaseName = 'c:\paulo'
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSJUR,'
      '       P.IDPESSOA,'
      '       P.IDPLANOPREV'
      'FROM ARQPATRO002 S,'
      '     PESSOA_FILTRO P,'
      '     RUBRICA_FILTRO R'
      'WHERE (P.MATRICULA = S.MATRICULA)'
      'AND   (S.RUBRICA = R.CODPROV)'
      'AND   ((R.FLGSALPART = 1) OR (R.FLGSALBENEF = 1))')
    ValidateWithMask = True
    Left = 168
    Top = 264
  end
  object qryContrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 16
    Top = 327
  end
end
