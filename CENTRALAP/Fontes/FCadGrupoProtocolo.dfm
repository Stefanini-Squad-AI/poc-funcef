inherited frmCadGrupoProtocolo: TfrmCadGrupoProtocolo
  Left = 198
  Top = 185
  HelpContext = 190017
  Caption = 'Cadastro de Grupo de Protocolo'
  ClientHeight = 263
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 177
    object Label1: TLabel
      Left = 15
      Top = 57
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object wwDBEdit1: TwwDBEdit
      Left = 13
      Top = 72
      Width = 522
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 224
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDFIARASS,                      '
      '     DESCRICAO,                     '
      '      DATAINCLUSAO  '
      'FROM  FIARIOASSUNTO'
      'WHERE'
      '    IDFIARASS = :IDFIARASS'
      'ORDER BY DESCRICAO')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptInput
      end>
    object qryIDFIARASS: TFloatField
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DATAINCLUSAO'
    end
  end
  inherited upd: TUpdateSQL
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
  end
  inherited MontaSelect: TMontaSelect
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
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
end
