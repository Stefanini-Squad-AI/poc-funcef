inherited frmCadMercado: TfrmCadMercado
  Left = 316
  Top = 153
  Caption = 'frmCadMercado'
  ClientHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 167
    object Label1: TLabel [1]
      Left = 17
      Top = 107
      Width = 104
      Height = 13
      Caption = 'Nome do Mercado'
    end
    object Label2: TLabel [2]
      Left = 17
      Top = 57
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    inherited pnlTitulo: TPanel
      TabOrder = 2
      inherited lbNomItem: TfcLabel
        Width = 99
        Caption = 'Mercados'
      end
    end
    object dbeMercado: TwwDBEdit
      Left = 17
      Top = 122
      Width = 340
      Height = 21
      DataField = 'DESCMERCADO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblTipoInvest: TwwDBLookupCombo
      Left = 17
      Top = 73
      Width = 340
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'60'#9'Descrição'#9'F')
      DataField = 'IDTIPOINVEST'
      DataSource = ds
      LookupTable = qryTipoInvest
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 214
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MERCADO'
      'set'
      '  DESCMERCADO = :DESCMERCADO,'
      '  IDTIPOINVEST = :IDTIPOINVEST'
      'where'
      '  IDMERCADO = :OLD_IDMERCADO')
    InsertSQL.Strings = (
      'insert into MERCADO'
      '  (IDMERCADO, DESCMERCADO, IDTIPOINVEST)'
      'values'
      '  (:IDMERCADO, :DESCMERCADO, :IDTIPOINVEST)')
    DeleteSQL.Strings = (
      'delete from MERCADO'
      'where'
      '  IDMERCADO = :OLD_IDMERCADO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVEST.DESCTIPOINVEST'
      'MERCADO.DESCMERCADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Nome do Mercado')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MERCADO'
      'TIPOINVEST')
    CamposChave.Strings = (
      'MERCADO.IDMERCADO')
    Filtro.Strings = (
      'MERCADO.IDTIPOINVEST = TIPOINVEST.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDMERCADO, DESCMERCADO, IDTIPOINVEST'
      'FROM MERCADO'
      'WHERE IDMERCADO = :IDMERCADO'
      'ORDER BY DESCMERCADO'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMERCADO'
        ParamType = ptResult
      end>
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.MERCADO.IDMERCADO'
    end
    object qryDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Origin = 'BASEDADOS.MERCADO.DESCMERCADO'
      Size = 60
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.MERCADO.IDTIPOINVEST'
    end
  end
  object qryTipoInvest: TwwQuery
    Tag = 5
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOINVEST, DESCTIPOINVEST'
      'FROM TIPOINVEST'
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 312
    Top = 112
    object qryTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
end
