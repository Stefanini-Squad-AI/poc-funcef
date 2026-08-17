inherited frmMigraDicDados: TfrmMigraDicDados
  Left = 218
  Top = 162
  Caption = 'Migração do Dicionário de Dados (Oracle)'
  ClientWidth = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    object rcMigra: TRichEdit
      Left = 5
      Top = 5
      Width = 557
      Height = 224
      Align = alClient
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Width = 567
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object QryTable: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDDDTABLE, TABLENAME, TABLEALIAS, DESCRICAO'
      'FROM'
      '    DDTABLE'
      'WHERE'
      '     TABLENAME = :TABELA')
    Params.Data = {0100010006544142454C410001020030000000}
    UpdateObject = updTable
    ValidateWithMask = True
    Left = 40
    Top = 8
  end
  object dsTable: TwwDataSource
    DataSet = QryTable
    OnDataChange = dsTableDataChange
    Left = 40
    Top = 53
  end
  object QryField: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      IDDDFIELD, IDDDTABLE, FIELDNAME, FIELDALIAS, SELECTABLE, D' +
        'ESCRICAO,'
      '      SEARCHABLE, SORTABLE, DISPLAYFORMAT, CAMPODOBANCO, CHAVE,'
      '      FLGOBRIGATORIO, TAMANHO, TIPODEDADO, TIPOCHAVE'
      'FROM'
      '    DDFIELD'
      'WHERE'
      '     (IDDDTABLE = :ID) AND (FIELDNAME = :CAMPO)')
    Params.Data = {01000200024944000304000000000000000543414D504F0001020030000000}
    UpdateObject = updField
    ValidateWithMask = True
    Left = 88
    Top = 8
  end
  object dsField: TwwDataSource
    DataSet = QryField
    Left = 89
    Top = 54
  end
  object updField: TUpdateSQL
    ModifySQL.Strings = (
      'update DDFIELD'
      'set'
      '  IDDDFIELD = :IDDDFIELD,'
      '  IDDDTABLE = :IDDDTABLE,'
      '  FIELDNAME = :FIELDNAME,'
      '  FIELDALIAS = :FIELDALIAS,'
      '  SELECTABLE = :SELECTABLE,'
      '  DESCRICAO = :DESCRICAO,'
      '  SEARCHABLE = :SEARCHABLE,'
      '  SORTABLE = :SORTABLE,'
      '  DISPLAYFORMAT = :DISPLAYFORMAT,'
      '  CAMPODOBANCO = :CAMPODOBANCO,'
      '  CHAVE = :CHAVE,'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO,'
      '  TAMANHO = :TAMANHO,'
      '  TIPODEDADO = :TIPODEDADO'
      'where'
      '  IDDDFIELD = :OLD_IDDDFIELD and'
      '  IDDDTABLE = :OLD_IDDDTABLE')
    InsertSQL.Strings = (
      'insert into DDFIELD'
      
        '  (IDDDFIELD, IDDDTABLE, FIELDNAME, FIELDALIAS, SELECTABLE, DESC' +
        'RICAO, '
      
        '   SEARCHABLE, SORTABLE, DISPLAYFORMAT, CAMPODOBANCO, CHAVE, FLG' +
        'OBRIGATORIO, '
      '   TAMANHO, TIPODEDADO)'
      'values'
      
        '  (:IDDDFIELD, :IDDDTABLE, :FIELDNAME, :FIELDALIAS, :SELECTABLE,' +
        ' :DESCRICAO, '
      
        '   :SEARCHABLE, :SORTABLE, :DISPLAYFORMAT, :CAMPODOBANCO, :CHAVE' +
        ', :FLGOBRIGATORIO, '
      '   :TAMANHO, :TIPODEDADO)')
    DeleteSQL.Strings = (
      'delete from DDFIELD'
      'where'
      '  IDDDFIELD = :OLD_IDDDFIELD and'
      '  IDDDTABLE = :OLD_IDDDTABLE')
    Left = 88
    Top = 100
  end
  object updTable: TUpdateSQL
    ModifySQL.Strings = (
      'update DDTABLE'
      'set'
      '  IDDDTABLE = :IDDDTABLE,'
      '  TABLENAME = :TABLENAME,'
      '  TABLEALIAS = :TABLEALIAS,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDDDTABLE = :OLD_IDDDTABLE')
    InsertSQL.Strings = (
      'insert into DDTABLE'
      '  (IDDDTABLE, TABLENAME, TABLEALIAS, DESCRICAO)'
      'values'
      '  (:IDDDTABLE, :TABLENAME, :TABLEALIAS, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from DDTABLE'
      'where'
      '  IDDDTABLE = :OLD_IDDDTABLE')
    Left = 40
    Top = 99
  end
  object QryTableAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      T.TABLE_NAME, T.COLUMN_NAME, T.DATA_LENGTH,'
      '      DECODE(T.DATA_TYPE,'
      '                       '#39'VARCHAR2'#39','#39'CARACTER'#39','#39'CHAR'#39','#39'CARACTER'#39','
      '                       '#39'NUMBER'#39','#39'NUMERICO'#39','#39'FLOAT'#39','#39'NUMERICO'#39','
      
        '                       '#39'LONG'#39','#39'MEMO'#39','#39'LONG RAW'#39','#39'MEMO'#39','#39'RAW'#39','#39'ME' +
        'MO'#39','
      '                       '#39'DATE'#39','#39'DATA'#39') DATA_TYPE,'
      '      C.COMMENTS DESCFIELD, TC.COMMENTS DESCTABLE'
      'FROM'
      '    ALL_TAB_COLUMNS T, ALL_TAB_COMMENTS TC, ALL_COL_COMMENTS C'
      'WHERE'
      #9'(T.OWNER = '#39'CM'#39') AND'
      #9'(T.TABLE_NAME = C.TABLE_NAME) AND'
      #9'(T.COLUMN_NAME = C.COLUMN_NAME) AND'
      #9'(T.TABLE_NAME = TC.TABLE_NAME)'
      'ORDER BY'
      '      T.TABLE_NAME'
      ''
      '')
    ValidateWithMask = True
    Left = 144
    Top = 8
  end
  object QrySeqTab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDDTABLE, TABLENAME FROM DDTABLE')
    ValidateWithMask = True
    Left = 312
    Top = 88
    object QrySeqTabIDDDTABLE: TFloatField
      FieldName = 'IDDDTABLE'
      Origin = 'DDTABLE.IDDDTABLE'
    end
    object QrySeqTabTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Origin = 'DDTABLE.TABLENAME'
      Size = 100
    end
  end
  object QrySeqCmp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDDFIELD, IDDDTABLE, FIELDNAME FROM DDFIELD')
    ValidateWithMask = True
    Left = 240
    Top = 88
    object QrySeqCmpIDDDFIELD: TFloatField
      FieldName = 'IDDDFIELD'
      Origin = 'DDFIELD.IDDDFIELD'
    end
    object QrySeqCmpIDDDTABLE: TFloatField
      FieldName = 'IDDDTABLE'
      Origin = 'DDFIELD.IDDDTABLE'
    end
    object QrySeqCmpFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
      Origin = 'DDFIELD.FIELDNAME'
      Size = 100
    end
  end
  object QryUpd: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 264
    Top = 40
  end
  object QryUpd2: TwwQuery
    ValidateWithMask = True
    Left = 312
    Top = 41
  end
end
 
