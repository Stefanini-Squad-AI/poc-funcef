inherited frmCadCarteiraSPC: TfrmCadCarteiraSPC
  Left = 247
  Top = 178
  HelpContext = 790102
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel [1]
      Left = 22
      Top = 63
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = dbeNomeCarteira
    end
    inherited pnlTitulo: TPanel
      inherited lbNomItem: TfcLabel
        Width = 140
        Caption = 'Carteiras SPC'
      end
    end
    object dbeNomeCarteira: TDBEdit
      Left = 22
      Top = 79
      Width = 337
      Height = 21
      DataField = 'DESCARTEIRASPC'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARTEIRASPC'
      'set'
      '  DESCARTEIRASPC = :DESCARTEIRASPC'
      'where'
      '  IDCARTEIRASPC = :OLD_IDCARTEIRASPC')
    InsertSQL.Strings = (
      'insert into CARTEIRASPC'
      '  (IDCARTEIRASPC, DESCARTEIRASPC)'
      'values'
      '  (:IDCARTEIRASPC, :DESCARTEIRASPC)')
    DeleteSQL.Strings = (
      'delete from CARTEIRASPC'
      'where'
      '  IDCARTEIRASPC = :OLD_IDCARTEIRASPC')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Carteiras SPC'
    Colunas.Strings = (
      'CARTEIRASPC.DESCARTEIRASPC')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Carteira')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTEIRASPC')
    CamposChave.Strings = (
      'CARTEIRASPC.IDCARTEIRASPC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDCARTEIRASPC, DESCARTEIRASPC'
      'FROM CARTEIRASPC'
      'WHERE IDCARTEIRASPC = :IDCARTEIRASPC'
      'ORDER BY DESCARTEIRASPC')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRASPC'
        ParamType = ptResult
      end>
    object qryIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.IDCARTEIRASPC'
    end
    object qryDESCARTEIRASPC: TStringField
      FieldName = 'DESCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.DESCARTEIRASPC'
      Size = 60
    end
  end
end
