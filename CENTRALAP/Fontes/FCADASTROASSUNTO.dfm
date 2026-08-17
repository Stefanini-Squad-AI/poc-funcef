inherited frmcadastroassunto: Tfrmcadastroassunto
  Left = 40
  Top = 153
  Width = 735
  Height = 259
  HelpContext = 190017
  Caption = 'Grupo de Protocolo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 727
    Height = 146
    inherited dbGrd: TwwDBGrid [0]
      Width = 725
      Height = 144
    end
    inherited pnlControles: TPanel [1]
      Width = 725
      Height = 144
      object Label1: TLabel
        Left = 4
        Top = 56
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object masdescricao: TMaskEdit
        Left = 3
        Top = 70
        Width = 708
        Height = 21
        MaxLength = 100
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 727
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97 [0]
      end
      inherited sbtnInserir: TToolbarButton97 [1]
      end
    end
  end
  inherited Dock971: TDock97
    Top = 193
    Width = 727
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 174
    Top = 60
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 58
    Top = 164
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 387
    Top = 71
  end
  object qry: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      'IDFIARASS,                      '
      'DESCRICAO,                     '
      'DATAINCLUSAO  '
      ' FROM  FIARIOASSUNTO'
      'WHERE'
      '    IDFIARASS = :IDFIARASS'
      'ORDER BY '
      ' DESCRICAO')
    ValidateWithMask = True
    Left = 130
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptUnknown
      end>
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryIDFIARASS: TFloatField
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
    end
    object qryDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DATAINCLUSAO'
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FIARIOASSUNTO.IDFIARASS'
      'FIARIOASSUNTO.DESCRICAO'
      'FIARIOASSUNTO.DATAINCLUSAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Código do Assunto'
      'Descrição'
      'Data')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FIARIOASSUNTO')
    CamposChave.Strings = (
      'FIARIOASSUNTO.IDFIARASS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '100'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 296
    Top = 62
  end
  object Upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FIARIOASSUNTO'
      'set'
      '  IDFIARASS = :IDFIARASS,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATAINCLUSAO = :DATAINCLUSAO'
      'where'
      '  IDFIARASS = :OLD_IDFIARASS')
    InsertSQL.Strings = (
      'insert into FIARIOASSUNTO'
      '  (IDFIARASS, DESCRICAO, DATAINCLUSAO)'
      'values'
      '  (:IDFIARASS, :DESCRICAO, :DATAINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from FIARIOASSUNTO'
      'where'
      '  IDFIARASS = :OLD_IDFIARASS')
    Left = 304
    Top = 159
  end
  object qryinsertassunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into  fiarioassunto'
      '       (IDFIARASS,DESCRICAO,DATAINCLUSAO)'
      'values'
      '      (:IDFIARASS,:DESCRICAO,:DATAINCLUSAO)')
    ValidateWithMask = True
    Left = 221
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINCLUSAO'
        ParamType = ptUnknown
      end>
  end
  object qryalteraassunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update  fiarioassunto'
      'set DESCRICAO = :descricao '
      'where'
      'IDFIARASS  = :IDFIARASS     ')
    ValidateWithMask = True
    Left = 373
    Top = 156
    ParamData = <
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptUnknown
      end>
  end
  object qrydelete: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from fiarioassunto'
      'where'
      'IDFIARASS = :IDFIARASS  ')
    ValidateWithMask = True
    Left = 477
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptUnknown
      end>
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDFIARASS,                      '
      'DESCRICAO,                     '
      'DATAINCLUSAO  '
      ' FROM '
      '  FIARIOASSUNTO'
      'ORDER BY '
      ' DESCRICAO')
    ValidateWithMask = True
    Left = 392
    Top = 231
    object qryassuntoIDFIARASS: TFloatField
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
    end
    object qryassuntoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryassuntoDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DATAINCLUSAO'
    end
  end
end
