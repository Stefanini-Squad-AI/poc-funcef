inherited frmCadTipoRecebedor: TfrmCadTipoRecebedor
  Left = 170
  Top = 178
  HelpContext = 160174
  Caption = 'Cadastro de Tipo de Recebedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      object lblCodigo: TLabel
        Left = 65
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label1: TLabel
        Left = 65
        Top = 105
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedtCodigo: TwwDBEdit
        Left = 64
        Top = 64
        Width = 121
        Height = 21
        DataField = 'CODTIPORECEBEDOR'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtDesc: TwwDBEdit
        Left = 64
        Top = 120
        Width = 280
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Selected.Strings = (
        'CODTIPORECEBEDOR'#9'5'#9'Código'#9'F'
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORECEBEDOR'
      'set'
      '  CODTIPORECEBEDOR = :CODTIPORECEBEDOR,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTIPORECEBEDOR = :OLD_CODTIPORECEBEDOR')
    InsertSQL.Strings = (
      'insert into TIPORECEBEDOR'
      '  (CODTIPORECEBEDOR, DESCRICAO)'
      'values'
      '  (:CODTIPORECEBEDOR, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPORECEBEDOR'
      'where'
      '  CODTIPORECEBEDOR = :OLD_CODTIPORECEBEDOR')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPORECEBEDOR.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPORECEBEDOR')
    CamposChave.Strings = (
      'TIPORECEBEDOR.CODTIPORECEBEDOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT CODTIPORECEBEDOR,'
      '        DESCRICAO'
      'FROM TIPORECEBEDOR'
      'ORDER BY  CODTIPORECEBEDOR')
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 309
    Top = 52
  end
end
